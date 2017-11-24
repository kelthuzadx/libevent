# Libevent源码分析 (1) hello-world

⑨月份接触了久闻大名的[libevent](https://github.com/libevent/libevent)，当时想读读源码，可是由于事情比较多一直没有时间，现在手头的东西基本告一段落了，我准备读读libevent的源码，凡是我觉得有必要的内容均一一记录，与君共勉。

首先要说说什么是libevent:
> [libevent](http://libevent.org/)是一个事件通知库，libevent API提供一种机制使得我们可以在一个文件描述符(file descriptor)发生特定事件时或者timeout发生时执行指定的回调函数。libevent意图代替事件驱动服务器上的事件循环。应用程序只需要调用`event_dispatch()`，然后动态添加或者删除事件，而不需要修改事件循环

# 1.构建环境
+ [libevent 2.1.x](https://github.com/libevent/libevent)
+ windows10（关于linux的epoll我后面会换平台)

关于构建环境可以参见官方[Build and Install](https://github.com/racaljk/libevent#1-building-and-installation-in-depth),非常简单，基本上可以直接cmake。
由于我构建的环境不使用openssl,所以`option(EVENT__DISABLE_OPENSSL OFF)`要修改为 `option(EVENT__DISABLE_OPENSSL ON)`
    然后直接生成解决方案即可。

# 2. 相逢`#pragram push_macro`
如果你和我一样编译过程中遇到` error: static declaration of 'strtok_r' follows non-static declaration`可以在前面加上一行`#ifndef EVENT__HAVE_STRTOK_R`。
重点是这里我学到了一个没用过的功能
```cpp
#define A "Hello"
    std::cout << A << std::endl;        //Hello
#pragma push_macro("A")
#define A "World"
#pragma push_macro("A")
#define A ":)"
    std::cout << A << std::endl;        //:)
#pragma pop_macro("A")
    std::cout << A << std::endl;        //World
#pragma pop_macro("A")
    std::cout << A << std::endl;        //Hello
```
注意别漏了A的双引号。可以看出push_macro/pop_macro的确是实现了栈的效果。为了再确认一下，可以看看_clang_的实现：
```cpp
///   #pragma push_macro("macro")
void Preprocessor::HandlePragmaPushMacro(Token &PushMacroTok) {
  ...
  IdentifierInfo *IdentInfo = ParsePragmaPushOrPopMacro(PushMacroTok);
  // Get the MacroInfo associated with IdentInfo.
  MacroInfo *MI = getMacroInfo(IdentInfo);
  // Push the cloned MacroInfo so we can retrieve it later.
  PragmaPushMacroInfo[IdentInfo].push_back(MI);
}
///   #pragma pop_macro("macro")
void Preprocessor::HandlePragmaPopMacro(Token &PopMacroTok) {
  ...
  // Find the vector<MacroInfo*> associated with the macro.
  llvm::DenseMap<IdentifierInfo*, std::vector<MacroInfo*> >::iterator iter =
    PragmaPushMacroInfo.find(IdentInfo);
  if (iter != PragmaPushMacroInfo.end()) {

    // Pop PragmaPushMacroInfo stack.
    iter->second.pop_back();
    if (iter->second.empty())
	  PragmaPushMacroInfo.erase(iter);
 
  }
}
```

# 3. 又一个hello-world
回到主题，这篇文章从`libevent/sample/hello-world.c`开始。`hello-world.c`是一个典型的socket的使用，当客户端通过9995端口与服务器连接后服务器持续发送`Hello, World!`，不过现在用的是libevent的事件回调实现的。
```cpp
int
main(int argc, char **argv)
{
	struct event_base *base;
	struct evconnlistener *listener;
	struct event *signal_event;

    struct sockaddr_in sin;
#ifdef _WIN32	//在win上需要用WAStartup初始化winsock dll才能使用socket
	WSADATA wsa_data;
	WSAStartup(0x0201, &wsa_data);
#endif

///////////////////////////////////////////////////////////////////////////
/// 1.event_base_new使用默认设置创建一个指向event_base的指针
///////////////////////////////////////////////////////////////////////////
	base = event_base_new();
	if (!base) {
		fprintf(stderr, "Could not initialize libevent!\n");
		return 1;
	}

	memset(&sin, 0, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_port = htons(PORT);

///////////////////////////////////////////////////////////////////////////
/// 2.evconnlistener_new_bind分配一个connection监听对象，当有新TCP连接时执行
/// listener_cb回调
///////////////////////////////////////////////////////////////////////////
	listener = evconnlistener_new_bind(base, listener_cb, (void *)base,
	    LEV_OPT_REUSEABLE|LEV_OPT_CLOSE_ON_FREE, -1,
	    (struct sockaddr*)&sin,
	    sizeof(sin));

	if (!listener) {
		fprintf(stderr, "Could not create a listener!\n");
		return 1;
	}
///////////////////////////////////////////////////////////////////////////
/// 3. evsignal_new是一个#define evsignal_new(b, x, cb, arg) \
///                   event_new((b), (x), EV_SIGNAL|EV_PERSIST, (cb), (arg))
///////////////////////////////////////////////////////////////////////////
	signal_event = evsignal_new(base, SIGINT, signal_cb, (void *)base);

	if (!signal_event || event_add(signal_event, NULL)<0) {
		fprintf(stderr, "Could not create/add a signal event!\n");
		return 1;
	}
///////////////////////////////////////////////////////////////////////////
/// 4. event_base_dispatch等价于event_base_loop(event_base, 0)，当一切准备就绪
/// 后就可以执行它，event_base_dispatch会一直运行，直到没有任何注册事件或者用户调用
/// event_base_loopexit
///////////////////////////////////////////////////////////////////////////
	event_base_dispatch(base);

///////////////////////////////////////////////////////////////////////////
/// 5. 堆释放
///////////////////////////////////////////////////////////////////////////
	evconnlistener_free(listener);
	event_free(signal_event);
	event_base_free(base);

	printf("done\n");
	return 0;
}

```
上面就是一个libevent的通用模板：首先创建event_base，然后绑定服务器socket监听端口并注册事件，最后开启事件循环，剩下的工作就是编写各个事件的回调。
当然别忘了释放内存。下面的小节自顶向下分析`hello-world`用到的各个libevent APIs的实现。

# 3.1. event_base_new，事件循环的基石
这个结构体的名字都叫**event_base**足见它的重要性，所以首先我们来看看它是怎么构造出来的。
好吧，其实对于99%的应用程序调用一个**event_base_new**就万事大吉了，它长这个样：
```cpp
struct event_base *
event_base_new(void)
{
	struct event_base *base = NULL;
	struct event_config *cfg = event_config_new();
	if (cfg) {
		base = event_base_new_with_config(cfg);
		event_config_free(cfg);
	}
	return base;
}
```
如果**event_config_new()**调用成功，**event_base_new()**返回带配置的event_base，否则直接返回NULL。
继续看**event_config_new**:
```cpp
struct event_config *
event_config_new(void)
{
	struct event_config *cfg = mm_calloc(1, sizeof(*cfg));  //mm_calloc是标准库malloc的包装

	if (cfg == NULL)
		return (NULL);

	TAILQ_INIT(&cfg->entries);
	cfg->max_dispatch_interval.tv_sec = -1;
	cfg->max_dispatch_callbacks = INT_MAX;                  //支持INT_MAX个回调
	cfg->limit_callbacks_after_prio = 1;

	return (cfg);
}
```
这里TAIL QUEUE是一种数据结构，存在于`compat/sys/queue.h (compat=>compatible)`，里面有对它的详细介绍,大概是个双向队列。
event_config_new设置了几个固定的配置项，它的配置不完全，
还需要和**event_base_new_with_config()**一起才能构造出event_base这个大型数据结构(`#pragma pack(1)后sizoef(struct event_base)==688字节`):
```cpp
struct event_base *
event_base_new_with_config(const struct event_config *cfg)
{
	int i;
	struct event_base *base;
	int should_check_environment;

#ifndef EVENT__DISABLE_DEBUG_MODE
	event_debug_mode_too_late = 1;
#endif
///////////////////////////////////////////////////////////////////////////
/// 1. event_base实际分配内存的地方
/// 多说一点，event_warn是可变参数函数，关于var_*可以参见下面的demo
#if 0
    long long summer(int num,...){
        int sum = 0;
        va_list ap;
        va_start(ap,num);
        for(int i =0;i<num;i++){
            sum += va_arg(ap,int);
        }
        va_end(ap);
        return sum;
    }

    void printWrapper(char * fmt,...){
        va_list ap;

        va_start(ap, fmt);
        vfprintf(stdout,fmt , ap);
        va_end(ap);
    }
#endif
/// 文件可以在https://github.com/racaljk/libevent/blob/master/sample/my-stdarg.c
// 找到.(Target已经写进CmakeLists，可以直接生成makefile)
///////////////////////////////////////////////////////////////////////////
	if ((base = mm_calloc(1, sizeof(struct event_base))) == NULL) {
		event_warn("%s: calloc", __func__);
		return NULL;
	}
///////////////////////////////////////////////////////////////////////////
/// 2.flags是enum event_base_config_flag，有四种枚举量，
/// EVENT_BASE_FLAG_NOLOCK表示不为event_base分配锁，单线程可以省去锁和释放的时间，
/// 多线程不安全。
///
/// EVENT_BASE_FLAG_IGNORE_ENV慎用，它会不检查EVENT_*环境变量，用户调试的时候会很
/// 麻烦。
///
/// EVENT_BASE_FLAG_NO_CACHE_TIME设置后libevent会在执行timeout回调后检查当前时间
///
///
/// EVENT_BASE_FLAG_EPOLL_USE_CHANGELIST会告诉libevent如果后端使用的是epoll，那
/// 就让它使用速度更快的基于"changelist"的"epoll-changlist"后端，这种后端会避开没必
/// 要的系统调用。
///
/// EVENT_BASE_FLAG_PRECISE_TIMER会使用操作系统提供的更精确的计时机制，但效率会变慢
/// 因为libevent默认选择的是操作系统提供的最快的计时机制。如果操作系统没有提供更精确的计
/// 时机制，这个flag就没有其他副作用
///
/// EVENT_BASE_FLAG_STARTUP_IOCP只限于windows，如果这个设置了在socket_new()和
/// evconn_listener_new()会使用IOCP实现而不是基于select的实现
///
/// 这几个FLAG会影响libevent的行为，所以这里有必要单独提出来，关于它们的详细介绍可以
/// 参见event.h中enum event_base_config_flag的comments
/// 关于这几个FLAG与其看上面不如一步步看源码
///////////////////////////////////////////////////////////////////////////
	if (cfg)
		base->flags = cfg->flags;
///////////////////////////////////////////////////////////////////////////
/// 3. 位与，广泛用于FLAG设置这种场景，可以看到下面也有很多引用
/// EVENT_BASE_FLAG_IGNORE_ENV：忽略环境检查
///////////////////////////////////////////////////////////////////////////
    should_check_environment =
	    !(cfg && (cfg->flags & EVENT_BASE_FLAG_IGNORE_ENV));

	{
		struct timeval tmp;
		int precise_time =
		    cfg && (cfg->flags & EVENT_BASE_FLAG_PRECISE_TIMER);
		int flags;
        ///////////////////////////////////////////////////////////////////////////////////
        ///可以即使你没有设置使用更精确的时间，只要libevent检查到环境变量有EVENT_PRECISE_TIMER
        ///的存在也会设置的
        ///////////////////////////////////////////////////////////////////////////////////
		if (should_check_environment && !precise_time) {
			precise_time = evutil_getenv_("EVENT_PRECISE_TIMER") != NULL;
			base->flags |= EVENT_BASE_FLAG_PRECISE_TIMER;
		}
		flags = precise_time ? EV_MONOT_PRECISE : 0;
		evutil_configure_monotonic_time_(&base->monotonic_timer, flags);

		gettime(base, &tmp);
	}
///////////////////////////////////////////////////////////////////////////
/// 4. 系列配置设置及初始化
///////////////////////////////////////////////////////////////////////////
	min_heap_ctor_(&base->timeheap);

	base->sig.ev_signal_pair[0] = -1;
	base->sig.ev_signal_pair[1] = -1;
	base->th_notify_fd[0] = -1;
	base->th_notify_fd[1] = -1;

	TAILQ_INIT(&base->active_later_queue);

	evmap_io_initmap_(&base->io);
	evmap_signal_initmap_(&base->sigmap);
	event_changelist_init_(&base->changelist);

	base->evbase = NULL;

	if (cfg) {
		memcpy(&base->max_dispatch_time,
		    &cfg->max_dispatch_interval, sizeof(struct timeval));
		base->limit_callbacks_after_prio =
		    cfg->limit_callbacks_after_prio;
	} else {
		base->max_dispatch_time.tv_sec = -1;
		base->limit_callbacks_after_prio = 1;
	}
	if (cfg && cfg->max_dispatch_callbacks >= 0) {
		base->max_dispatch_callbacks = cfg->max_dispatch_callbacks;
	} else {
		base->max_dispatch_callbacks = INT_MAX;
	}
	if (base->max_dispatch_callbacks == INT_MAX &&
	    base->max_dispatch_time.tv_sec == -1)
		base->limit_callbacks_after_prio = INT_MAX;

	for (i = 0; eventops[i] && !base->evbase; i++) {
		if (cfg != NULL) {
			/* determine if this backend should be avoided */
			if (event_config_is_avoided_method(cfg,
				eventops[i]->name))
				continue;
			if ((eventops[i]->features & cfg->require_features)
			    != cfg->require_features)
				continue;
		}

		/* also obey the environment variables */
		if (should_check_environment &&
		    event_is_method_disabled(eventops[i]->name))
			continue;

		base->evsel = eventops[i];

		base->evbase = base->evsel->init(base);
	}

	if (base->evbase == NULL) {
		event_warnx("%s: no event mechanism available",
		    __func__);
		base->evsel = NULL;
		event_base_free(base);
		return NULL;
	}

	if (evutil_getenv_("EVENT_SHOW_METHOD"))
		event_msgx("libevent using: %s", base->evsel->name);

	/* allocate a single active event queue */
	if (event_base_priority_init(base, 1) < 0) {
		event_base_free(base);
		return NULL;
	}

///////////////////////////////////////////////////////////////////////////
/// 5. 如果用户开启了libevent多线程，这里会给event_base分配锁，条件变量用以支持
/// 最基本的临界互斥和多线程合作。同时也要注意，即使EVENT__DISABLE_THREAD_SUPPORT
/// 为OFF,如果用户之前设置EVENT_BASE_FLAG_NOBLOCK那一切也都白谈。
///////////////////////////////////////////////////////////////////////////
#if !defined(EVENT__DISABLE_THREAD_SUPPORT) && !defined(EVENT__DISABLE_DEBUG_MODE)
	event_debug_created_threadable_ctx_ = 1;
#endif

#ifndef EVENT__DISABLE_THREAD_SUPPORT
	if (EVTHREAD_LOCKING_ENABLED() &&
	    (!cfg || !(cfg->flags & EVENT_BASE_FLAG_NOLOCK))) {
		int r;
		EVTHREAD_ALLOC_LOCK(base->th_base_lock, 0);
		EVTHREAD_ALLOC_COND(base->current_event_cond);
		r = evthread_make_base_notifiable(base);
		if (r<0) {
			event_warnx("%s: Unable to make base notifiable.", __func__);
			event_base_free(base);
			return NULL;
		}
	}
#endif
///////////////////////////////////////////////////////////////////////////
/// 6.，如果是windows而且设置了使用IOCP FLAG就使用它
///////////////////////////////////////////////////////////////////////////
#ifdef _WIN32
	if (cfg && (cfg->flags & EVENT_BASE_FLAG_STARTUP_IOCP))
		event_base_start_iocp_(base, cfg->n_cpus_hint);
#endif

	return (base);
}

```
既然我现在用的就是Windows，那不妨再继续跟进看看libevent是怎么使用IOCP作为IO多路复用后端的
```cpp
///event.c
///小中转，实际是下面的event_iocp_port_launch_();
int
event_base_start_iocp_(struct event_base *base, int n_cpus)
{
#ifdef _WIN32
	if (base->iocp)
		return 0;
	base->iocp = event_iocp_port_launch_(n_cpus);
	if (!base->iocp) {
		event_warnx("%s: Couldn't launch IOCP", __func__);
		return -1;
	}
	return 0;
#else
	return -1;
#endif
}

/// event_iocp.c
#define N_CPUS_DEFAULT 2

struct event_iocp_port *
event_iocp_port_launch_(int n_cpus)
{
	struct event_iocp_port *port;
	int i;

	if (!extension_fns_initialized)
		init_extension_functions(&the_extension_fns);

	if (!(port = mm_calloc(1, sizeof(struct event_iocp_port))))
		return NULL;

	if (n_cpus <= 0)
		n_cpus = N_CPUS_DEFAULT;
	port->n_threads = n_cpus * 2;
	port->threads = mm_calloc(port->n_threads, sizeof(HANDLE));
	if (!port->threads)
		goto err;

	port->port = CreateIoCompletionPort(INVALID_HANDLE_VALUE, NULL, 0,
			n_cpus);
	port->ms = -1;
	if (!port->port)
		goto err;

	port->shutdownSemaphore = CreateSemaphore(NULL, 0, 1, NULL);
	if (!port->shutdownSemaphore)
		goto err;

	for (i=0; i<port->n_threads; ++i) {
		ev_uintptr_t th = _beginthread(loop, 0, port);
		if (th == (ev_uintptr_t)-1)
			goto err;
		port->threads[i] = (HANDLE)th;
		++port->n_live_threads;
	}

	InitializeCriticalSectionAndSpinCount(&port->lock, 1000);

	return port;
err:
	if (port->port)
		CloseHandle(port->port);
	if (port->threads)
		mm_free(port->threads);
	if (port->shutdownSemaphore)
		CloseHandle(port->shutdownSemaphore);
	mm_free(port);
	return NULL;
}


```
