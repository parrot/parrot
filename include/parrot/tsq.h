/* tsq.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the thread-safe queue system
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_TSQ_H_GUARD)
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

QUEUE_ENTRY *pop_entry(QUEUE *);
QUEUE_ENTRY *nosync_pop_entry(QUEUE *queue);
QUEUE_ENTRY *peek_entry(QUEUE *);
QUEUE_ENTRY *wait_for_entry(QUEUE *);
void push_entry(QUEUE *, QUEUE_ENTRY *);
void nosync_insert_entry(QUEUE *, QUEUE_ENTRY *);
void insert_entry(QUEUE *, QUEUE_ENTRY *);
void queue_lock(QUEUE *);
void queue_unlock(QUEUE *);
void queue_signal(QUEUE *);
void queue_broadcast(QUEUE *);
void queue_wait(QUEUE *);
void queue_timedwait(QUEUE *, struct timespec*);
QUEUE* queue_init(UINTVAL prio);
void queue_destroy(QUEUE *);


#endif /* PARROT_TSQ_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
