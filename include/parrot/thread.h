/* thread.h
 *  Copyright (C) 2001-2011, Parrot Foundation.
 *  Overview:
 *     This is the api header for the thread primitives
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_THREAD_H_GUARD
#define PARROT_THREAD_H_GUARD

#include "parrot/parrot.h"

#ifdef PARROT_HAS_THREADS
#  ifdef _WIN32
#    include "parrot/thr_windows.h"
#  else
#    include "parrot/thr_pthread.h"
#  endif
#else
#  include   "parrot/thr_none.h"
#endif /* PARROT_HAS_THREADS */

#include "parrot/atomic.h"

#define MAX_THREADS 9

#ifndef YIELD
#  define YIELD
#endif /* YIELD */

typedef enum {
    THREAD_STATE_JOINABLE,             /* default */
    THREAD_STATE_DETACHED     = 0x01,  /* i.e. non-joinable */
    THREAD_STATE_JOINED       = 0x02,  /* JOIN was issued */
    THREAD_STATE_FINISHED     = 0x04,  /* the thread function has ended */
    THREAD_STATE_NOT_STARTED  = 0x08,  /* the thread wasn't started */
    THREAD_STATE_SUSPENDED_GC = 0x10,  /* suspended for GC on request */
    THREAD_STATE_GC_WAKEUP    = 0x20,  /* the thread is waiting on its condition
                                           variable, and will do a GC run if
                                           it is woken up and marked as suspended
                                           for GC */
    THREAD_STATE_SUSPEND_GC_REQUESTED = 0x40 /* the thread's event queue
                                                 contains a suspend-for-GC event */
} thread_state_enum;


/*
 * per interpreter thread data structure
 */
typedef struct _Thread_data {
    Parrot_thread       thread;          /* pthread_t or such */
    INTVAL              state;
    int                 wants_shared_gc; /* therad is trying to
                                            do a shared GC run */
    UINTVAL             tid;             /* 0.. n-1 idx in interp array */

    Parrot_Interp       joiner;          /* thread that is trying to join this */

    /* for wr access to interpreter e.g. for GC
     * if only used for GC the lock could be in the arena
     * instead here, or in the interpreter, with negative size impact
     * for the non-threaded case
     */
    Parrot_mutex interp_lock;

    /* for waking up the interpreter from various sorts
     * of sleeping
     */
    Parrot_cond  interp_cond;

    /* COW'd constant tables */
    Hash             *const_tables;

#ifdef _WIN32
#else
    int notifierfd[2];
#endif
} Thread_data;

#  define LOCK_INTERPRETER(interp) \
    if ((interp)->thread_data) \
        LOCK((interp)->thread_data->interp_lock)
#  define UNLOCK_INTERPRETER(interp) \
    if ((interp)->thread_data) \
        UNLOCK((interp)->thread_data->interp_lock)

#  define INTERPRETER_LOCK_INIT(interp) \
        do { \
            MUTEX_INIT((interp)->thread_data->interp_lock); \
            COND_INIT((interp)->thread_data->interp_cond); \
        } while (0)
#  define INTERPRETER_LOCK_DESTROY(interp) \
        do { \
            MUTEX_DESTROY((interp)->thread_data->interp_lock); \
            COND_DESTROY((interp)->thread_data->interp_cond); \
        } while (0)

/*
 * this global mutex protects the list of interpreters
 */
VAR_SCOPE Parrot_mutex    interpreter_array_mutex;
VAR_SCOPE Interp       ** interpreter_array;
VAR_SCOPE size_t          n_interpreters;

typedef enum {
    THREAD_GC_STAGE_NONE,
    THREAD_GC_STAGE_MARK,
    THREAD_GC_STAGE_SWEEP = THREAD_GC_STAGE_NONE
} thread_gc_stage_enum;

typedef struct _Shared_gc_info {
    thread_gc_stage_enum  gc_stage;
    Parrot_cond           gc_cond;
    int                   num_reached;

    Parrot_atomic_integer gc_block_level;
} Shared_gc_info;

/* TODO use thread pools instead */
VAR_SCOPE Shared_gc_info *shared_gc_info;

/* HEADERIZER BEGIN: src/thread.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_clone_code(Parrot_Interp d, Parrot_Interp s);
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_thread_create(PARROT_INTERP, INTVAL type, INTVAL clone_flags)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC* Parrot_thread_create_local_task(PARROT_INTERP,
    ARGIN(Parrot_Interp const thread_interp),
    ARGIN(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PMC* Parrot_thread_create_proxy(PARROT_INTERP,
    ARGIN(Parrot_Interp const thread),
    ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int Parrot_thread_get_free_threads_array_index(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
Interp** Parrot_thread_get_threads_array(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_thread_init_threads_array(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_thread_insert_thread(PARROT_INTERP,
    ARGIN(Interp* thread),
    int index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PMC * Parrot_thread_make_local_copy(PARROT_INTERP,
    ARGIN(Parrot_Interp from),
    ARGIN(PMC *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_thread_notify_threads(PARROT_INTERP)
        __attribute__nonnull__(1);

int Parrot_thread_run(PARROT_INTERP,
    ARGMOD(PMC *thread_interp_pmc),
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*thread_interp_pmc);

void Parrot_thread_schedule_task(PARROT_INTERP,
    ARGIN(Interp *thread_interp),
    ARGIN(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PMC * Parrot_thread_transfer_sub(
    ARGOUT(Parrot_Interp destination),
    ARGIN(Parrot_Interp source),
    ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(destination);

#define ASSERT_ARGS_Parrot_clone_code __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_thread_create __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_thread_create_local_task \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thread_interp) \
    , PARROT_ASSERT_ARG(task))
#define ASSERT_ARGS_Parrot_thread_create_proxy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thread) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_thread_get_free_threads_array_index \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_thread_get_threads_array \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_thread_init_threads_array \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_thread_insert_thread __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thread))
#define ASSERT_ARGS_Parrot_thread_make_local_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(from) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_Parrot_thread_notify_threads __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_thread_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thread_interp_pmc) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_Parrot_thread_schedule_task __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thread_interp) \
    , PARROT_ASSERT_ARG(task))
#define ASSERT_ARGS_Parrot_thread_transfer_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(destination) \
    , PARROT_ASSERT_ARG(source) \
    , PARROT_ASSERT_ARG(sub))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/thread.c */

#endif /* PARROT_THREAD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
