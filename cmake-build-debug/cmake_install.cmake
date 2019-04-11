# Install script for directory: C:/Users/Cthulhu/Desktop/libevent

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/libevent")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/lib/libevent_core.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/event2" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/keyvalq_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/listener.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/thread.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/util.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/visibility.h"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/include/event2/event-config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/lib/libevent_core.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/event2" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/keyvalq_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/listener.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/thread.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/util.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/visibility.h"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/include/event2/event-config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/libevent/lib/pkgconfig/libevent_core.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Program Files (x86)/libevent/lib/pkgconfig" TYPE FILE FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/libevent_core.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/lib/libevent_extra.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/event2" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/keyvalq_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/listener.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/thread.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/util.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/visibility.h"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/include/event2/event-config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/lib/libevent_extra.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/event2" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/keyvalq_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/listener.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/thread.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/util.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/visibility.h"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/include/event2/event-config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/libevent/lib/pkgconfig/libevent_extra.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Program Files (x86)/libevent/lib/pkgconfig" TYPE FILE FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/libevent_extra.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/lib/libevent.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/event2" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/keyvalq_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/listener.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/thread.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/util.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/visibility.h"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/include/event2/event-config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/lib/libevent.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/event2" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/bufferevent_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/buffer_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/dns_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/event_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/http_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/keyvalq_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/listener.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/rpc_struct.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/tag_compat.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/thread.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/util.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event2/visibility.h"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/include/event2/event-config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/libevent/lib/pkgconfig/libevent.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Program Files (x86)/libevent/lib/pkgconfig" TYPE FILE FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/libevent.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/include/evdns.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/evrpc.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/event.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/evhttp.h"
    "C:/Users/Cthulhu/Desktop/libevent/include/evutil.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/libevent/cmake/LibeventConfig.cmake;C:/Program Files (x86)/libevent/cmake/LibeventConfigVersion.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Program Files (x86)/libevent/cmake" TYPE FILE FILES
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug//CMakeFiles/LibeventConfig.cmake"
    "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/LibeventConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibeventTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibeventTargets.cmake"
         "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/CMakeFiles/Export/cmake/LibeventTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibeventTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibeventTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/CMakeFiles/Export/cmake/LibeventTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/CMakeFiles/Export/cmake/LibeventTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/Cthulhu/Desktop/libevent/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
