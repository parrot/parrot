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

#  define PARROT_HAS_THREADS 1

#ifndef PARROT_SYNC_PRIMITIVES_DEFINED

#  undef  PARROT_HAS_THREADS
#  define PARROT_HAS_THREADS 0

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

#  define CLEANUP_PUSH(f, a)
#  define CLEANUP_POP(a)

#  define Parrot_mutex int
#  define Parrot_cond int
#  define Parrot_thread int

typedef void (*Cleanup_Handler)(void *);

#  ifndef _STRUCT_TIMESPEC
#  define _STRUCT_TIMESPEC
struct timespec {
    time_t tv_sec;
    long tv_nsec;
};
#  endif /* _STRUCT_TIMESPEC */

#endif /* PARROT_SYNC_PRIMITIVES_DEFINED */

#ifndef YIELD
#  define YIELD
#endif /* YIELD */

typedef enum {
    THREAD_STATE_JOINABLE,              /* default */
    THREAD_STATE_DETACHED = 0x01,       /* i.e. non-joinable */
    THREAD_STATE_JOINED   = 0x02,       /* JOIN was issued */
    THREAD_STATE_FINISHED = 0x04,        /* the thread function has ended */
    THREAD_STATE_NOT_STARTED = 0x08      /* the thread wasn't started */
} thread_state_enum;

/*
 * per interpreter thread data structure
 */
typedef struct _Thread_data {
    Parrot_thread       thread;         /* pthread_t or such */
    thread_state_enum   state;
    UINTVAL             tid;            /* 0.. n-1 idx in interp array */

    /* for wr access to interpreter e.g. for DOD/GC
     * if only used for DOD/GC the lock could be in the arena
     * instead here, or in the interpreter, with negative size impact
     * for the non-threaded case
     */
    Parrot_mutex interp_lock;
} Thread_data;

#define LOCK_INTERPRETER(interp) \
    if ( (interp)->thread_data ) \
        LOCK((interp)->thread_data->interp_lock)
#define UNLOCK_INTERPRETER(interp) \
    if ( (interp)->thread_data ) \
        UNLOCK((interp)->thread_data->interp_lock)

#define INTERPRETER_LOCK_INIT(interp) \
        MUTEX_INIT((interp)->thread_data->interp_lock)
#define INTERPRETER_LOCK_DESTROY(interp) \
        MUTEX_DESTROY((interp)->thread_data->interp_lock)
/*
 * this global mutex protects the list of interpreters
 */
VAR_SCOPE Parrot_mutex                  interpreter_array_mutex;
VAR_SCOPE struct Parrot_Interp          ** interpreter_array;
VAR_SCOPE size_t                        n_interpreters;


typedef struct _Sync {
    Parrot_Interp owner;                /* that interpreter, that owns
                                           the arena, where the PMC is in */
    Parrot_mutex pmc_lock;              /* for wr access to PMCs content */
} Sync;

/*
 * thread.c interface functions
 */
int  pt_thread_run(Parrot_Interp, PMC* dest_interp, PMC* sub);
int  pt_thread_run_1(Parrot_Interp, PMC* dest_interp, PMC* sub);
int  pt_thread_run_2(Parrot_Interp, PMC* dest_interp, PMC* sub);
int  pt_thread_run_3(Parrot_Interp, PMC* dest_interp, PMC* sub);

void pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s);
void pt_clone_code(Parrot_Interp d, Parrot_Interp s);
void pt_add_to_interpreters(Parrot_Interp first, Parrot_Interp new_interp);
void pt_thread_yield(void);
void * pt_thread_join(Parrot_Interp, UINTVAL);
void pt_thread_detach(UINTVAL);
void pt_thread_kill(UINTVAL);
void pt_join_threads(Parrot_Interp);

/*
 * DOD interface
 */
void pt_DOD_start_mark(Parrot_Interp);
void pt_DOD_mark_root_finished(Parrot_Interp);
void pt_DOD_stop_mark(Parrot_Interp);

#endif /* PARROT_THREAD_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
