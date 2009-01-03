/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation.
 */

#ifndef PARROT_STM_WAITLIST_H_GUARD
#define PARROT_STM_WAITLIST_H_GUARD

#include "parrot/atomic.h"

#define WAITLIST_DEBUG 0

struct STM_tx_log;

typedef struct STM_tx_log STM_tx_log;

typedef struct waitlist_entry {
    /* next entry in the waitlist */
    struct waitlist_entry *next;
    /* the thread that will need to be signaled to wake it up */
    struct waitlist_thread_data *thread;
    /* the head of this waitlist */
    struct waitlist_head *head;
} waitlist_entry;

typedef struct waitlist_head {
    Parrot_atomic_pointer first;
    Parrot_mutex remove_mutex;
} waitlist_head;

typedef struct waitlist_thread_data {
    /* this mutex must be locked before setting signaled_p to true */
    Parrot_mutex signal_mutex;

    /* this condition variable is signalled after setting signaled_p
     * to true.
     */
    Parrot_cond *signal_cond;

    /* this is set to true if this thread has been signaled; should
     * remain false otherwise.
     */
    int signaled_p;

    /* pointers to all the waitlist entries */
    struct waitlist_entry **entries;
    size_t entry_count;
    size_t used_entries;
#if WAITLIST_DEBUG
    Interp *interp;
#endif
} waitlist_thread_data;

typedef struct waitlist_head STM_waitlist;

/* HEADERIZER BEGIN: src/stm/waitlist.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
STM_tx_log * Parrot_STM_tx_log_get(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_waitlist_add_self(PARROT_INTERP,
    ARGMOD(STM_waitlist *waitlist))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

void Parrot_STM_waitlist_destroy_thread(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_waitlist_init(PARROT_INTERP, ARGMOD(STM_waitlist *waitlist))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

void Parrot_STM_waitlist_remove_all(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_waitlist_signal(PARROT_INTERP,
    ARGMOD(STM_waitlist *waitlist))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

void Parrot_STM_waitlist_wait(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_STM_tx_log_get __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_waitlist_add_self __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(waitlist)
#define ASSERT_ARGS_Parrot_STM_waitlist_destroy_thread \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_waitlist_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(waitlist)
#define ASSERT_ARGS_Parrot_STM_waitlist_remove_all \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_waitlist_signal __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(waitlist)
#define ASSERT_ARGS_Parrot_STM_waitlist_wait __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/stm/waitlist.c */

#endif /* PARROT_STM_WAITLIST_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
