/* thr_pthread.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
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

#if !defined(PARROT_THR_PTHREAD_H_GUARD)
#define PARROT_THR_PTHREAD_H_GUARD

#  include <pthread.h>

#  define PARROT_SYNC_PRIMITIVES_DEFINED
#  define LOCK(m) pthread_mutex_lock(&m)
#  define UNLOCK(m) pthread_mutex_unlock(&m)
#  define COND_WAIT(c,m) pthread_cond_wait(&c, &m)
#  define COND_TIMED_WAIT(c,m,t) pthread_cond_timedwait(&c, &m, t)
#  define COND_SIGNAL(c) pthread_cond_signal(&c)
#  define COND_BROADCAST(c) pthread_cond_broadcast(&c)

/*
 * for now use a fast mutex w/o error checking and non recursive
 */
#  define MUTEX_INIT(m) pthread_mutex_init(&m, NULL)
#  define MUTEX_DESTROY(m) pthread_mutex_destroy(&m)

#  define COND_INIT(c)    pthread_cond_init(&c, NULL);
#  define COND_DESTROY(c) pthread_cond_destroy(&c)

typedef pthread_mutex_t Parrot_mutex;
typedef pthread_cond_t Parrot_cond;

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
