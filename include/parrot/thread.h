/* thread.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the thread primitives
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_THREAD_H_GUARD)
#define PARROT_THREAD_H_GUARD

#include "parrot/parrot.h"

#ifndef PARROT_SYNC_PRIMITIVES_DEFINED

#  define LOCK(m)
#  define UNLOCK(m)
#  define COND_WAIT(c, m)
#  define COND_TIMED_WAIT(c, m, t)
#  define COND_SIGNAL(c)
#  define COND_BROADCAST(c)

#  define MUTEX_INIT(m)
#  define MUTEX_DESTROY(m)

#  define COND_INIT(c)
#  define COND_DESTROY(c)

#  define THREAD_CREATE_DETACHED(t, func, arg)
#  define THREAD_CREATE_JOINABLE(t, func, arg)

#  define JOIN(t, ret)
#  define DETACH(t)

#  define Parrot_mutex int
#  define Parrot_cond int
#  define Parrot_thread int

#  ifndef _STRUCT_TIMESPEC
#  define _STRUCT_TIMESPEC
struct timespec {
    time_t tv_sec;
    long tv_nsec;
};
#  endif

#endif

#ifndef YIELD
#  define YIELD
#endif

typedef enum {
    THREAD_STATE_NEW,           /* initial after malloc */
    THREAD_STATE_JOINABLE,      /* default */
    THREAD_STATE_DETACHED,      /* i.e. non-joinable */
    THREAD_STATE_JOINED,        /* JOIN was issued */
    THREAD_STATE_FINISHED       /* the thread function has ended */
} thread_state_enum;

/*
 * per interpreter thread data structure
 */
typedef struct _Thread_data {
    Parrot_thread       thread;         /* pthread_t or such */
    thread_state_enum   state;
    UINTVAL             tid;            /* 0.. n-1 idx in interp array */
} Thread_data;

/*
 * this global mutex protects the list of interpreters
 */
VAR_SCOPE Parrot_mutex                  interpreter_array_mutex;
VAR_SCOPE struct Parrot_Interp          ** interpreter_array;
VAR_SCOPE size_t                        n_interpreters;

#endif

/*
 * thread.c interface functions
 */
int  pt_thread_run(Parrot_Interp, PMC* dest_interp, PMC* sub);
void pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s);
void pt_clone_code(Parrot_Interp d, Parrot_Interp s);
void pt_add_to_interpreters(Parrot_Interp first, Parrot_Interp new_interp);
void pt_thread_yield(void);
void * pt_thread_join(UINTVAL);
void pt_thread_detach(UINTVAL);
void pt_thread_kill(UINTVAL);

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
