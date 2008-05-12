/* tsq.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Defines the thread-safe queue system
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_TSQ_H_GUARD
#define PARROT_TSQ_H_GUARD

#include "parrot/config.h"
#include "parrot/thread.h"


typedef struct QUEUE_ENTRY QUEUE_ENTRY;
typedef struct QUEUE QUEUE;

typedef enum {
    QUEUE_ENTRY_TYPE_NONE,
    QUEUE_ENTRY_TYPE_EVENT,
    QUEUE_ENTRY_TYPE_TIMED_EVENT
} queue_entry_type_enum;

struct QUEUE_ENTRY {
    void *data;
    queue_entry_type_enum type;
    QUEUE_ENTRY *next;
};

struct QUEUE {
    QUEUE_ENTRY *head;
    QUEUE_ENTRY *tail;
    UINTVAL max_prio;
    Parrot_mutex queue_mutex;
    Parrot_cond queue_condition;
};

/* HEADERIZER BEGIN: src/tsq.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void insert_entry(ARGMOD(QUEUE *queue), ARGIN(QUEUE_ENTRY *entry))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*queue);

void nosync_insert_entry(ARGMOD(QUEUE *queue), ARGIN(QUEUE_ENTRY *entry))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*queue);

PARROT_CANNOT_RETURN_NULL
QUEUE_ENTRY * nosync_pop_entry(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
QUEUE_ENTRY * peek_entry(ARGIN(const QUEUE *queue))
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
QUEUE_ENTRY * pop_entry(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

void push_entry(ARGMOD(QUEUE *queue), ARGIN(QUEUE_ENTRY *entry))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*queue);

void queue_broadcast(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

void queue_destroy(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

PARROT_CAN_RETURN_NULL
PARROT_MALLOC
QUEUE* queue_init(UINTVAL prio);

void queue_lock(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

void queue_signal(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

void queue_timedwait(
    ARGMOD(QUEUE *queue),
    ARGIN(const struct timespec *abs_time))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*queue);

void queue_unlock(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

void queue_wait(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

void unshift_entry(ARGMOD(QUEUE *queue), ARGIN(QUEUE_ENTRY *entry))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*queue);

PARROT_CAN_RETURN_NULL
QUEUE_ENTRY * wait_for_entry(ARGMOD(QUEUE *queue))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*queue);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/tsq.c */

#endif /* PARROT_TSQ_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
