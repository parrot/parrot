/* tsq.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Thread-safe queues
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include <assert.h>

/* A synchronized entry popper - actuall shift from front */
QUEUE_ENTRY *
pop_entry(QUEUE *queue) {
    QUEUE_ENTRY *returnval;
    queue_lock(queue);
    returnval = nosync_pop_entry(queue);
    queue_unlock(queue);
    return returnval;
}

/*
 * this does not locking, so the result might have changed already
 * but the synched pop_entry checks again and returns NULL, if
 * queue is empty
 */
QUEUE_ENTRY *
peek_entry(QUEUE *queue) {
    return queue->head;
}

/* Grab an entry off the queue with no synchronization. Internal only,
   because it's darned evil and shouldn't be used outside the
   module. It's in here so we don't have to duplicate pop code */
QUEUE_ENTRY *
nosync_pop_entry(QUEUE *queue) {
    QUEUE_ENTRY *returnval;
    if (!queue->head) {
        return NULL;
    }
    returnval = queue->head;
    if (queue->head == queue->tail) {
        queue->head = NULL;
        queue->tail = NULL;
    } else {
        queue->head = queue->head->next;
    }
    returnval->next = NULL;
    return returnval;
}

QUEUE_ENTRY *
wait_for_entry(QUEUE *queue) {
    QUEUE_ENTRY *returnval;
    queue_lock(queue);
    while (queue->head == NULL) {
        queue_wait(queue);
    }
    returnval = nosync_pop_entry(queue);
    queue_unlock(queue);
    return returnval;

}

void
push_entry(QUEUE *queue, QUEUE_ENTRY *entry) {
    queue_lock(queue);
    /* Is there something in the queue? */
    if (queue->tail) {
        queue->tail->next = entry;
        queue->tail = entry;
    } else {
        queue->head = entry;
        queue->tail = entry;
    }
    queue_signal(queue);        /* assumes only one waiter */
    queue_unlock(queue);
}

void
unshift_entry(QUEUE *queue, QUEUE_ENTRY *entry) {
    QUEUE_ENTRY *cur;

    queue_lock(queue);
    cur = queue->head;
    if (!cur) {
        /* empty just set head */
        queue->head = entry;
        queue->tail = entry;
    }
    else {
        queue->head = entry;
        entry->next = cur;
    }
    queue_signal(queue);
    queue_unlock(queue);
}

/*
 * insert a timed event according to abstime
 * caller has to hold the queue mutex
 */
void
nosync_insert_entry(QUEUE *queue, QUEUE_ENTRY *entry)
{
    QUEUE_ENTRY *cur = queue->head, *prev;
    parrot_event *event, *cur_event;
    FLOATVAL abs_time;

    assert(entry->type == QUEUE_ENTRY_TYPE_TIMED_EVENT);
    /*
     * empty queue - just insert
     */
    if (!cur) {
        queue->head = entry;
        queue->tail = entry;
        return;
    }

    prev = NULL;
    event = entry->data;
    abs_time = event->u.timer_event.abs_time;
    while (cur && cur->type == QUEUE_ENTRY_TYPE_TIMED_EVENT) {
        cur_event = cur->data;
        if (abs_time > cur_event->u.timer_event.abs_time) {
            prev = cur;
            cur = cur->next;
        }
        else
            break;
    }
    if (!prev)
        queue->head = entry;
    else {
        prev->next = entry;
        if (prev == queue->tail)
            queue->tail = entry;
    }
    entry->next = cur;
}

void
insert_entry(QUEUE *queue, QUEUE_ENTRY *entry)
{
    queue_lock(queue);
    nosync_insert_entry(queue, entry);
    queue_signal(queue);
    queue_unlock(queue);
}

void
queue_lock(QUEUE *queue) {
    LOCK(queue->queue_mutex);
}

void
queue_unlock(QUEUE *queue) {
    UNLOCK(queue->queue_mutex);
}

/* This function wakes up *every* thread waiting on the queue */
void
queue_broadcast(QUEUE *queue) {
    COND_BROADCAST(queue->queue_condition);
}

void
queue_signal(QUEUE *queue) {
    COND_SIGNAL(queue->queue_condition);
}

void
queue_wait(QUEUE *queue) {
    COND_WAIT(queue->queue_condition, queue->queue_mutex);
}

void
queue_timedwait(QUEUE *queue, struct timespec *abs_time) {
    COND_TIMED_WAIT(queue->queue_condition, queue->queue_mutex, abs_time);
}

QUEUE*
queue_init(UINTVAL prio)
{
    QUEUE *queue = mem_sys_allocate(sizeof(QUEUE));
    queue->head = queue->tail = NULL;
    queue->max_prio = prio;
    COND_INIT(queue->queue_condition);
    MUTEX_INIT(queue->queue_mutex);
    return queue;
}

void
queue_destroy(QUEUE *queue)
{
    if (peek_entry(queue))
        internal_exception(1, "Queue not emty on destroy");
    COND_DESTROY(queue->queue_condition);
    MUTEX_DESTROY(queue->queue_mutex);
    mem_sys_free(queue);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
