/* thr_pthread.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  Overview:
 *     POSIS pthread interface
 *  Data Structure and Algorithms:
 *  History:
 *     2003.12.14  Initial rev by leo
 *                 Moved common code from generic, darwin, openbsd
 *                 to this file.
 *  Notes:
 *  References:
 */

#ifndef PARROT_THR_PTHREAD_H_GUARD
#define PARROT_THR_PTHREAD_H_GUARD

#  include <pthread.h>

#  define LOCK(m) pthread_mutex_lock((pthread_mutex_t*)&(m))
#  define UNLOCK(m) pthread_mutex_unlock((pthread_mutex_t*)&(m))
#  define COND_WAIT(c, m) pthread_cond_wait(&(c), &(m))
#  define COND_TIMED_WAIT(c, m, t) pthread_cond_timedwait(&(c), &(m), (t))
#  define COND_SIGNAL(c) pthread_cond_signal(&(c))
#  define COND_BROADCAST(c) pthread_cond_broadcast(&(c))

/*
 * for now use a fast mutex w/o error checking and non recursive
 */
#  define MUTEX_INIT(m) pthread_mutex_init(&(m), NULL)
#  define MUTEX_DESTROY(m) pthread_mutex_destroy(&(m))

#  define COND_INIT(c)    pthread_cond_init(&(c), NULL);
#  define COND_DESTROY(c) pthread_cond_destroy(&(c))

#  define THREAD_CREATE_DETACHED(t, func, arg) \
    do { \
        pthread_attr_t      attr;   \
        int rc = pthread_attr_init(&attr);      \
        PARROT_ASSERT(rc == 0);    \
        rc = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);   \
        PARROT_ASSERT(rc == 0);    \
        rc = pthread_create(&(t), &attr, (func), (arg)); \
        PARROT_ASSERT(rc == 0);    \
        pthread_attr_destroy(&attr);        \
   } while (0)

#  define THREAD_CREATE_JOINABLE(t, func, arg) \
        pthread_create(&(t), NULL, (func), (arg))

#  define JOIN(t, ret) pthread_join((t), &(ret))
#  define DETACH(t)    pthread_detach(t)

#  define CLEANUP_PUSH(f, a) pthread_cleanup_push((f), (a))
#  define CLEANUP_POP(a)     pthread_cleanup_pop(a)

#ifdef PARROT_HAS_HEADER_UNISTD
#  include <unistd.h>
#  ifdef _POSIX_PRIORITY_SCHEDULING
#    define YIELD sched_yield()
#  endif
#endif /* PARROT_HAS_HEADER_UNISTD */

typedef pthread_mutex_t Parrot_mutex;
typedef pthread_cond_t Parrot_cond;
typedef pthread_t Parrot_thread;

typedef void (*Cleanup_Handler)(void *);

#endif /* PARROT_THR_PTHREAD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
