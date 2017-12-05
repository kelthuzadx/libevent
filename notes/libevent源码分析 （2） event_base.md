
# 3.1. event_base_new，事件循环的基石
如官方介绍所说，对于99%的应用程序调用一个**event_base_new**就万事大吉了，不过既然是源码分析当然要从源码而不是应用的角度出发，况且这个结构体的名字都叫**event_base**足见它的重要性，现在我们先来看看它是怎么构造出来的。
它长这个样：
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
如果**event_config_new()**调用成功，**event_base_new()**返回带配置的event_base，否则直接返回NULL。
继续走到**event_config_new()**里面的**event_config_new**，这里TAIL QUEUE是一种数据结构，存在于`compat/sys/queue.h (compat=>compatible)`，里面有对它的详细介绍,大概是个双向队列。
event_config_new设置了几个固定的配置项，它的配置不完全，还需要和**event_base_new_with_config()** 一起才能构造出event_base这个大型数据结构
> (`#pragma pack(1)后sizoef(struct event_base)==688字节`)
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
**event_base_new_with_config()**完成了**event_base_new()** 绝大部分工作，它也是这篇文章的线索，鉴于其重要性上面我详细注释了一番。
这里我们从大多数人最关心的内容即第六部分libevent怎么使用Win IOCP作为其IO多路复用后端开始自底向上介绍。
```cpp
///event.c
///包装了一下错误，实际创建IOCP是下面的event_iocp_port_launch_();
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
```
```cpp
/// event_iocp.c

struct event_iocp_port *
event_iocp_port_launch_(int n_cpus)
{
	///////////////////////////////////////////////////////////////////////////
	///储存IOCP数据的结构体。这个函数(event_iocp_port_launch_()的目的就是填充它
	///它的具体结构如下
#if 0
	struct event_iocp_port {
	/** IOCP handle */
	HANDLE port;
	/* 该结构关联的锁 */
	CRITICAL_SECTION lock;
	/** 工作在IOCP上的线程数 */
	short n_threads;
	/** 如果为true则关闭所有工作者线程 */
	short shutdown;
	/** 定义每隔多久线程检查shutdown↑和其他条件 */
	long ms;
	/* 等待事件的线程 */
	HANDLE *threads;
	/** 当前端口打开的线程数 */
	short n_live_threads;
	/** 关闭线程s信号量 */
	HANDLE *shutdownSemaphore;
};
#endif
	///////////////////////////////////////////////////////////////////////////
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

    ///////////////////////////////////////////////////////////////////////////
    /// #define N_CPUS_DEFAULT 2
    /// n_cpus = N_CPUS_DEFAULT
    ///
    /// 即一个IOCP默认两个worker线程。
    ///////////////////////////////////////////////////////////////////////////
	port->port = CreateIoCompletionPort(INVALID_HANDLE_VALUE, NULL, 0,
			n_cpus);
	port->ms = -1;
	if (!port->port)
		goto err;
    ///////////////////////////////////////////////////////////////////////////
    /// 用于关闭IOCP上所有的工作者线程的信号量，由于不需要并发所以第三个参数最大并发量为1
    ///////////////////////////////////////////////////////////////////////////
	port->shutdownSemaphore = CreateSemaphore(NULL, 0, 1, NULL);
	if (!port->shutdownSemaphore)
		goto err;
    ///////////////////////////////////////////////////////////////////////////
    ///工作者线程需要手动创建，n_live_threads++
    ///////////////////////////////////////////////////////////////////////////
	for (i=0; i<port->n_threads; ++i) {
		ev_uintptr_t th = _beginthread(loop, 0, port);
		if (th == (ev_uintptr_t)-1)
			goto err;
		port->threads[i] = (HANDLE)th;
		++port->n_live_threads;
	}
    ///////////////////////////////////////////////////////////////////////////
    ///初始化锁
    ///////////////////////////////////////////////////////////////////////////
	InitializeCriticalSectionAndSpinCount(&port->lock, 1000);

	return port;

	///////////////////////////////////////////////////////////////////////////
	///集中错误处理。第一次见到这种风格。
	///////////////////////////////////////////////////////////////////////////
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
