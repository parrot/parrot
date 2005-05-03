/* thread.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the windows thread primitives
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_THR_WINDOWS_H_GUARD)
#define PARROT_THR_WINDOWS_H_GUARD

#  undef CONST
#  include <windows.h>
#  include <process.h> 
#  include <limits.h>

#  define PARROT_SYNC_PRIMITIVES_DEFINED

typedef CRITICAL_SECTION Parrot_mutex;
typedef struct Windows_cond
  {
    HANDLE m_hSema;
    LONG m_lWaiters;
  } Parrot_cond;
typedef HANDLE Parrot_thread;

#  define MUTEX_INIT(m) InitializeCriticalSection( (PCRITICAL_SECTION)&(m) )
#  define MUTEX_DESTROY(m) DeleteCriticalSection( (PCRITICAL_SECTION)&(m) )

#  define COND_INIT(c) \
     do { \
       (c).m_hSema = CreateSemaphore( NULL, 0, LONG_MAX, NULL ); \
       (c).m_lWaiters = 0; \
     } while (0)

#  define COND_DESTROY(c) CloseHandle( (c).m_hSema )

#  define LOCK(m) EnterCriticalSection( (PCRITICAL_SECTION)&(m) )
#  define UNLOCK(m) LeaveCriticalSection( (PCRITICAL_SECTION)&(m) )

#  define COND_WAIT(c, m) \
     do { \
       ++(c).m_lWaiters; \
       UNLOCK(m); \
       WaitForSingleObject( (c).m_hSema, INFINITE ); \
       LOCK(m); \
       --(c).m_lWaiters; \
     } while (0)

#  define COND_TIMED_WAIT(c, m, t) \
     do { \
       FLOATVAL now; \
       time_t sec; \
       LONG nsec; \
       DWORD diff; \
       now = Parrot_floatval_time(); \
       sec = (time_t)now; \
       nsec = (LONG)((now - sec)*1000.0f)*1000000L; \
       if ( t->tv_sec > sec || t->tv_sec == sec && t->tv_nsec > nsec ) \
       { \
         ++(c).m_lWaiters; \
         UNLOCK(m); \
         diff = (t->tv_sec - sec)*1000L + (t->tv_nsec - nsec)/1000000L; \
         WaitForSingleObject( (c).m_hSema, diff ); \
         LOCK(m); \
         --(c).m_lWaiters; \
       } \
     } while (0)

#  define COND_SIGNAL(c) \
     do { \
       if ( (c).m_lWaiters > 0 ) \
         ReleaseSemaphore( (c).m_hSema, 1, NULL ); \
     } while (0)

#  define COND_BROADCAST(c) \
     do { \
       if ( (c).m_lWaiters > 0 ) \
         ReleaseSemaphore( (c).m_hSema, (c).m_lWaiters, NULL ); \
     } while (0)

#  define JOIN(t, ret) \
     do { \
       WaitForSingleObject( t, INFINITE ); \
       GetExitCodeThread( t,(LPDWORD)&(ret) ); \
	   CloseHandle( t ); \
     } while (0)

#  define DETACH(t) CloseHandle( t )

/* If the compiler CRT library has a good _beginthreadXX() routine, use it instead of
   the Win32 API CreateThread(). _beginthreadXX guards call to the thread start routine
   with SEH to implement runtime errors and signal support. Also it frees calloc-ed
   per-thread data block at exit */
#  ifdef _MCS_VER1
#    define THREAD_CREATE_JOINABLE(t, func, arg) \
       do { \
         unsigned tid; \
         t = (HANDLE)_beginthreadex( NULL, 0, unsigned (__stdcall * func) (void*), \
                                     (void*)arg, 0, &tid ); \
       } while (0)
#  else
#    define THREAD_CREATE_JOINABLE(t, func, arg) \
       do { \
         DWORD tid; \
         t = CreateThread( NULL, 0, (PTHREAD_START_ROUTINE)func, (PVOID)arg, 0, &tid ); \
       } while (0)
#  endif

#  define THREAD_CREATE_DETACHED(t, func, arg) \
     do { \
       THREAD_CREATE_JOINABLE(t, func, arg); \
       DETACH(t); \
     } while (0)

#  define CLEANUP_PUSH(f, a)
#  define CLEANUP_POP(a)

typedef void (*Cleanup_Handler)(void *);

#  ifndef _STRUCT_TIMESPEC
#  define _STRUCT_TIMESPEC
struct timespec {
    time_t tv_sec;
    long tv_nsec;
};
#  endif /* _STRUCT_TIMESPEC */

#  undef CONST

#endif /* PARROT_THR_WINDOWS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
