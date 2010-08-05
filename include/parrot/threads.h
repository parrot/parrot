/* threads.h
 *  Copyright (C) 2010, Parrot Foundation.
 */

#ifndef PARROT_THREADS_H_GUARD
#define PARROT_THREADS_H_GUARD

#include "parrot/thread.h"

typedef struct Thread_info {
    Parrot_thread id;
    INTVAL        blocked;
    Parrot_cond   cvar;
    void         *lo_var_ptr;
    void         *hi_var_ptr;
} Thread_info;

typedef struct Thread_table {
    Thread_info *threads;
    INTVAL       size;
    INTVAL       count;
} Thread_table;

typedef struct Thread_args {
    Interp* interp;
    INTVAL  idx;
} Thread_args;

/* HEADERIZER BEGIN: src/threads.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_threads_block(PARROT_INTERP, ARGOUT(INTVAL *tidx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tidx);

INTVAL Parrot_threads_count_blocked(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_threads_current_idx(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_idle(PARROT_INTERP, INTVAL tidx)
        __attribute__nonnull__(1);

void Parrot_threads_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
void* Parrot_threads_main(ARGMOD(void *args_ptr))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*args_ptr);

void Parrot_threads_reap(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_spawn(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_threads_unblock(PARROT_INTERP, ARGIN(INTVAL *tidx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_threads_block __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tidx))
#define ASSERT_ARGS_Parrot_threads_count_blocked __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_current_idx __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_idle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_main __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(args_ptr))
#define ASSERT_ARGS_Parrot_threads_reap __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_spawn __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_threads_unblock __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tidx))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/threads.c */

#endif /* PARROT_THREADS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
