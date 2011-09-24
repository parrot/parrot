/* Copyright (C) 2010, Parrot Foundation.
 * $Id$
 */

#ifndef PARROT_THREADS_H_GUARD
#define PARROT_THREADS_H_GUARD

#include "parrot/thread.h"

enum Thread_states {
    THREAD_STATE_INITIALIZED = 0x01, /* Thread has been created */
    THREAD_STATE_RUNNABLE    = 0x02, /* We could signal this thread and it would run */
    THREAD_STATE_SCAN_STACK  = 0x04, /* This thread may have PMCs on its stack */
    THREAD_STATE_RESTLESS    = 0x08, /* This thread wants to run ASAP */
    THREAD_STATE_DEATH_MARK  = 0x10  /* This thread is marked for death */
};

#define THREAD_STATE_TEST(interp, tidx, flag) \
    ((interp)->thread_table->threads[(tidx)].state & (THREAD_STATE_ ## flag))
#define THREAD_STATE_SET(interp, tidx, flag) \
    ((interp)->thread_table->threads[(tidx)].state |= (THREAD_STATE_ ## flag))
#define THREAD_STATE_CLEAR(interp, tidx, flag) \
    ((interp)->thread_table->threads[(tidx)].state &= ~(THREAD_STATE_ ## flag))

typedef struct Thread_info {
    Parrot_thread id;
    INTVAL        state;
    Parrot_cond   cvar;
    void         *lo_var_ptr; /* Full range of stack for GC scan */
    void         *hi_var_ptr;
    PMC          *cur_task;
} Thread_info;

typedef struct Thread_table {
    Thread_info   *threads;
    INTVAL         size;
    INTVAL         count;
    Parrot_tls_key tid_key;
} Thread_table;

typedef struct Thread_args {
    Interp* interp;
    INTVAL  idx;
} Thread_args;

#define LOCK_INTERP(interp) \
    LOCK((interp)->interp_lock)

#define UNLOCK_INTERP(interp) \
    UNLOCK((interp)->interp_lock)

#define BLOCK_THREAD_ON(interp, blocking_call) \
    do { \
      INTVAL tid, runloop_id, runloop_level; \
      PMC *context = Parrot_pmc_new((interp), enum_class_Continuation); \
      runloop_id    = interp->current_runloop_id; \
      runloop_level = interp->current_runloop_level; \
      Parrot_threads_block((interp), &tid); \
      blocking_call; \
      Parrot_threads_unblock((interp), &tid); \
      (void) VTABLE_invoke((interp), context, 0); \
      interp->current_runloop_id    = runloop_id; \
      interp->current_runloop_level = runloop_level; \
    } while (0)

/* HEADERIZER BEGIN: src/threads.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_check_if_task_killed(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_block(PARROT_INTERP, ARGOUT(INTVAL *tidx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tidx);

INTVAL Parrot_threads_check_and_reset(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_cleanup(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_threads_count_active(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_threads_current(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_gc_mark(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_idle(PARROT_INTERP, INTVAL tidx)
        __attribute__nonnull__(1);

void Parrot_threads_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
void* Parrot_threads_main(ARGMOD(void *args_ptr))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*args_ptr);

INTVAL Parrot_threads_next_to_run(PARROT_INTERP, INTVAL cur_idx)
        __attribute__nonnull__(1);

void Parrot_threads_outer_runloop(PARROT_INTERP, INTVAL tidx)
        __attribute__nonnull__(1);

void Parrot_threads_print_table(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_reap(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_set_signal(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_setup_signal_handler(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_spawn(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_task_killed(PARROT_INTERP, INTVAL tidx)
        __attribute__nonnull__(1);

void Parrot_threads_task_killed_handler(NULLOK(int sig_number));
void Parrot_threads_unblock(PARROT_INTERP, ARGIN(INTVAL *tidx_ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_check_if_task_killed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_block __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tidx))
#define ASSERT_ARGS_Parrot_threads_check_and_reset \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_cleanup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_count_active __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_current __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_gc_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_idle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_main __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(args_ptr))
#define ASSERT_ARGS_Parrot_threads_next_to_run __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_outer_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_print_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_reap __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_set_signal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_setup_signal_handler \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_spawn __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_task_killed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_task_killed_handler \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_threads_unblock __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tidx_ptr))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/threads.c */

#endif /* PARROT_THREADS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
