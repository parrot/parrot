/* thread.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
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

#ifndef YIELD
#  define YIELD
#endif /* YIELD */

typedef enum {
    THREAD_STATE_JOINABLE,              /* default */
    THREAD_STATE_DETACHED = 0x01,       /* i.e. non-joinable */
    THREAD_STATE_JOINED   = 0x02,       /* JOIN was issued */
    THREAD_STATE_FINISHED = 0x04,        /* the thread function has ended */
    THREAD_STATE_NOT_STARTED = 0x08,     /* the thread wasn't started */
    THREAD_STATE_SUSPENDED_GC = 0x10,     /* suspended for GC on request */
    THREAD_STATE_GC_WAKEUP = 0x20,      /* the thread is waiting on its condition
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
    Parrot_thread       thread;         /* pthread_t or such */
    INTVAL              state;
    int                 wants_shared_gc; /* therad is trying to
                                            do a shared GC run */
    UINTVAL             tid;            /* 0.. n-1 idx in interp array */

    Parrot_Interp       joiner;         /* thread that is trying to join this */

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
VAR_SCOPE Parrot_mutex                  interpreter_array_mutex;
VAR_SCOPE Interp          ** interpreter_array;
VAR_SCOPE size_t                        n_interpreters;

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

PARROT_EXPORT
void Parrot_shared_gc_block(PARROT_INTERP);

PARROT_EXPORT
void Parrot_shared_gc_unblock(PARROT_INTERP);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * pt_thread_create(PARROT_INTERP, INTVAL type, INTVAL clone_flags)
        __attribute__nonnull__(1);

void pt_add_to_interpreters(PARROT_INTERP,
    ARGIN_NULLOK(Parrot_Interp new_interp))
        __attribute__nonnull__(1);

void pt_clone_code(Parrot_Interp d, Parrot_Interp s);
void pt_clone_globals(Parrot_Interp d, Parrot_Interp s);
void pt_free_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

void pt_gc_mark_root_finished(PARROT_INTERP);
void pt_gc_start_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

void pt_gc_stop_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

void pt_join_threads(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
PMC * pt_shared_fixup(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void pt_suspend_self_for_gc(PARROT_INTERP)
        __attribute__nonnull__(1);

int pt_thread_create_run(PARROT_INTERP,
    INTVAL type,
    INTVAL clone_flags,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

void pt_thread_detach(UINTVAL tid);
PARROT_CAN_RETURN_NULL
PMC* pt_thread_join(ARGIN(Parrot_Interp parent), UINTVAL tid)
        __attribute__nonnull__(1);

void pt_thread_kill(UINTVAL tid);
void pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s);
int pt_thread_run(PARROT_INTERP,
    ARGMOD(PMC *thread_interp_pmc),
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*thread_interp_pmc);

void pt_thread_wait_with(PARROT_INTERP, ARGMOD(Parrot_mutex *mutex))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mutex);

void pt_thread_yield(void);
PARROT_CAN_RETURN_NULL
PMC * pt_transfer_sub(
    ARGOUT(Parrot_Interp d),
    ARGIN(Parrot_Interp s),
    ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(d);

#define ASSERT_ARGS_Parrot_shared_gc_block __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_shared_gc_unblock __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_thread_create __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_add_to_interpreters __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_clone_code __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_clone_globals __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_free_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_gc_mark_root_finished __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_gc_start_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_gc_stop_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_join_threads __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_shared_fixup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_pt_suspend_self_for_gc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_thread_create_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_pt_thread_detach __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_thread_join __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(parent))
#define ASSERT_ARGS_pt_thread_kill __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_thread_prepare_for_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_thread_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thread_interp_pmc) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_pt_thread_wait_with __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mutex))
#define ASSERT_ARGS_pt_thread_yield __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_transfer_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(d) \
    , PARROT_ASSERT_ARG(s) \
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
