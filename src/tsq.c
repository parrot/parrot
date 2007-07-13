/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/tsq.c - Thread-safe queues

=head1 DESCRIPTION

=head2 Functions

*/

#include "parrot/parrot.h"
#include <assert.h>

/* HEADERIZER HFILE: include/parrot/tsq.h */

/*

FUNCDOC: pop_entry

Does a synchronized removal of the head entry off the queue and returns it.

*/

QUEUE_ENTRY *
pop_entry(NOTNULL(QUEUE *queue))
{
    QUEUE_ENTRY *returnval;
    queue_lock(queue);
    returnval = nosync_pop_entry(queue);
    queue_unlock(queue);
    return returnval;
}

/*

FUNCDOC: peek_entry

This does no locking, so the result might have changed by the time you
get the entry, but a synchronized C<pop_entry()> will check again and
return C<NULL> if the queue is empty.

*/

QUEUE_ENTRY *
peek_entry(NOTNULL(QUEUE *queue))
{
    return queue->head;
}

/*

FUNCDOC: nosync_pop_entry

Grab an entry off the queue with no synchronization. Internal only,
because it's darned evil and shouldn't be used outside the module. It's
in here so we don't have to duplicate pop code.

*/

QUEUE_ENTRY *
nosync_pop_entry(NOTNULL(QUEUE *queue))
{
    QUEUE_ENTRY *returnval;
    if (!queue->head) {
        return NULL;
    }
    returnval = queue->head;
    if (queue->head == queue->tail) {
        queue->head = NULL;
        queue->tail = NULL;
    }
    else {
        queue->head = queue->head->next;
    }
    returnval->next = NULL;
    return returnval;
}

/*

FUNCDOC: wait_for_entry

Does a synchronized removal of the head entry off the queue, waiting if
necessary until there is an entry, and then returns it.

*/

QUEUE_ENTRY *
wait_for_entry(NOTNULL(QUEUE *queue))
{
    QUEUE_ENTRY *returnval;

    queue_lock(queue);
    while (queue->head == NULL) {
        queue_wait(queue);
    }
    returnval = nosync_pop_entry(queue);
    queue_unlock(queue);
    return returnval;

}

/*

FUNCDOC: push_entry

Does a synchronized insertion of C<entry> onto the tail of the queue.

*/

void
push_entry(NOTNULL(QUEUE *queue), QUEUE_ENTRY *entry)
{
    queue_lock(queue);
    /* Is there something in the queue? */
    if (queue->tail) {
        queue->tail->next = entry;
        queue->tail = entry;
    }
    else {
        queue->head = entry;
        queue->tail = entry;
    }
    queue_signal(queue);        /* assumes only one waiter */
    queue_unlock(queue);
}

/*

FUNCDOC: unshift_entry

Does a synchronized insertion of C<entry> into the head of the queue.

*/

void
unshift_entry(NOTNULL(QUEUE *queue), QUEUE_ENTRY *entry)
{
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

FUNCDOC: nosync_insert_entry

Inserts a timed event according to C<abstime>. The caller has to hold the
queue mutex.

*/

void
nosync_insert_entry(NOTNULL(QUEUE *queue), NOTNULL(QUEUE_ENTRY *entry))
{
    QUEUE_ENTRY *cur = queue->head;
    QUEUE_ENTRY *prev;
    parrot_event *event;
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

    prev     = NULL;
    event    = (parrot_event *)entry->data;
    abs_time = event->u.timer_event.abs_time;

    while (cur && cur->type == QUEUE_ENTRY_TYPE_TIMED_EVENT) {
        const parrot_event * const cur_event = (parrot_event *)cur->data;
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

/*

FUNCDOC: insert_entry

Does a synchronized insert of C<entry>.

*/

void
insert_entry(NOTNULL(QUEUE *queue), NOTNULL(QUEUE_ENTRY *entry))
{
    queue_lock(queue);
    nosync_insert_entry(queue, entry);
    queue_signal(queue);
    queue_unlock(queue);
}

/*

FUNCDOC: queue_lock

Locks the queue's mutex.

*/

void
queue_lock(NOTNULL(QUEUE *queue))
{
    LOCK(queue->queue_mutex);
}

/*

FUNCDOC: queue_unlock

Unlocks the queue's mutex.

*/

void
queue_unlock(NOTNULL(QUEUE *queue))
{
    UNLOCK(queue->queue_mutex);
}

/*

FUNCDOC: queue_broadcast

This function wakes up I<every> thread waiting on the queue.

*/

void
queue_broadcast(NOTNULL(QUEUE *queue))
{
    COND_BROADCAST(queue->queue_condition);
}

/*

FUNCDOC: queue_signal

XXX Needs a description

*/

void
queue_signal(NOTNULL(QUEUE *queue))
{
    COND_SIGNAL(queue->queue_condition);
}

/*

FUNCDOC: queue_wait

Instructs the queue to wait.

*/

void
queue_wait(NOTNULL(QUEUE *queue))
{
    COND_WAIT(queue->queue_condition, queue->queue_mutex);
}

/*

FUNCDOC: queue_timedwait

Instructs the queue to wait for C<abs_time> seconds (?).

*/

void
queue_timedwait(NOTNULL(QUEUE *queue), NOTNULL(struct timespec *abs_time))
{
    COND_TIMED_WAIT(queue->queue_condition, queue->queue_mutex, abs_time);
}

/*

FUNCDOC: queue_init

Initializes the queue, setting C<prio> as the queue's priority.

*/

QUEUE*
queue_init(UINTVAL prio)
{
    QUEUE * const queue = mem_allocate_typed(QUEUE);

    queue->head = queue->tail = NULL;
    queue->max_prio = prio;
    COND_INIT(queue->queue_condition);
    MUTEX_INIT(queue->queue_mutex);
    return queue;
}

/*

FUNCDOC: queue_destroy

Destroys the queue, raising an exception if it is not empty.

*/

void
queue_destroy(NOTNULL(QUEUE *queue))
{
    if (peek_entry(queue)) {
        internal_exception(1, "Queue not empty on destroy");
    }
    COND_DESTROY(queue->queue_condition);
    MUTEX_DESTROY(queue->queue_mutex);
    mem_sys_free(queue);
}

/*

=head1 SEE ALSO

F<include/parrot/tsq.h>.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
