/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/tsq.c - Thread-safe queues

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*

=item C<QUEUE_ENTRY *
pop_entry(QUEUE *queue)>

Does a synchronized removal of the head entry off the queue and returns it.

=cut

*/

QUEUE_ENTRY *
pop_entry(QUEUE *queue) {
    QUEUE_ENTRY *returnval;
    queue_lock(queue);
    returnval = nosync_pop_entry(queue);
    queue_unlock(queue);
    return returnval;
}

/*

=item C<QUEUE_ENTRY *
peek_entry(QUEUE *queue)>

This does no locking, so the result might have changed by the time you
get the entry, but a synchronized C<pop_entry()> will check again and
return C<NULL> if the queue is empty.

=cut

*/
QUEUE_ENTRY *
peek_entry(QUEUE *queue) {
    return queue->head;
}

/*

=item C<QUEUE_ENTRY *
nosync_pop_entry(QUEUE *queue)>

Grab an entry off the queue with no synchronization. Internal only,
because it's darned evil and shouldn't be used outside the module. It's
in here so we don't have to duplicate pop code.

=cut

*/

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

/*

=item C<QUEUE_ENTRY *
wait_for_entry(QUEUE *queue)>

Does a synchronized removal of the head entry off the queue, waiting if
necessary until there is an entry, and then returns it.

=cut

*/

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

/*

=item C<void
push_entry(QUEUE *queue, QUEUE_ENTRY *entry)>

Does a synchronized insertion of C<entry> onto the tail of the queue.

=cut

*/

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

/*

=item C<void
unshift_entry(QUEUE *queue, QUEUE_ENTRY *entry)>

Does a syncronized insertion of C<entry> into the head of the queue.

=cut

*/

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

=item C<void
nosync_insert_entry(QUEUE *queue, QUEUE_ENTRY *entry)>

Inserts a timed event according to C<abstime>. The caller has to hold the
queue mutex.

=cut

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

/*

=item C<void
insert_entry(QUEUE *queue, QUEUE_ENTRY *entry)>

Does a syncronized insert of C<entry>.

=cut

*/

void
insert_entry(QUEUE *queue, QUEUE_ENTRY *entry)
{
    queue_lock(queue);
    nosync_insert_entry(queue, entry);
    queue_signal(queue);
    queue_unlock(queue);
}

/*

=item C<void
queue_lock(QUEUE *queue)>

Locks the queue's mutex.

=cut

*/

void
queue_lock(QUEUE *queue) {
    LOCK(queue->queue_mutex);
}

/*

=item C<void
queue_unlock(QUEUE *queue)>

Unlocks the queue's mutex.

=cut

*/

void
queue_unlock(QUEUE *queue) {
    UNLOCK(queue->queue_mutex);
}

/*

=item C<void
queue_broadcast(QUEUE *queue)>

This function wakes up I<every> thread waiting on the queue.

=cut

*/

void
queue_broadcast(QUEUE *queue) {
    COND_BROADCAST(queue->queue_condition);
}

/*

=item C<void
queue_signal(QUEUE *queue)>

Description.

=cut

*/

void
queue_signal(QUEUE *queue) {
    COND_SIGNAL(queue->queue_condition);
}

/*

=item C<void
queue_wait(QUEUE *queue)>

Instructs the queue to wait.

=cut

*/

void
queue_wait(QUEUE *queue) {
    COND_WAIT(queue->queue_condition, queue->queue_mutex);
}

/*

=item C<void
queue_timedwait(QUEUE *queue, struct timespec *abs_time)>

Instructs the queue to wait for C<abs_time> seconds (?).

=cut

*/

void
queue_timedwait(QUEUE *queue, struct timespec *abs_time) {
    COND_TIMED_WAIT(queue->queue_condition, queue->queue_mutex, abs_time);
}

/*

=item C<QUEUE*
queue_init(UINTVAL prio)>

Initializes the queue, setting C<prio> as the queue's priority.

=cut

*/

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

/*

=item C<void
queue_destroy(QUEUE *queue)>

Destroys the queue, raising an exception if it is not empty.

=cut

*/

void
queue_destroy(QUEUE *queue)
{
    if (peek_entry(queue))
        internal_exception(1, "Queue not empty on destroy");
    COND_DESTROY(queue->queue_condition);
    MUTEX_DESTROY(queue->queue_mutex);
    mem_sys_free(queue);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/tsq.h>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
