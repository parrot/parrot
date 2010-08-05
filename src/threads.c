/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/threads.c - Functions supporting hybrid threads.

=head1 DESCRIPTION

These functions transparently manage OS threads in the Parrot interpreter.

=head2 Functions

=over 4

=cut

*/

#include "parrot/threads.h"
#include "parrot/alarm.h"

/* HEADERIZER HFILE: include/parrot/threads.h */

/*

=item C<void* Parrot_cx_thread_main(void *interp_ptr)>

When an interpreter spawns a new worker thread, that thread starts
here.

=cut

*/


void
Parrot_threads_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_init)
    Thread_table *tbl;

    interp->thread_table = (Thread_table*) malloc(sizeof(Thread_table));
    interp->active_thread = 0;

    tbl = interp->thread_table;

    tbl->size    = 8; /* arbitrarily */
    tbl->count   = 1;
    tbl->threads = (Thread_info*) malloc(sizeof(Thread_info) * tbl->size);

    tbl->threads[0].id      = THREAD_SELF();
    tbl->threads[0].blocked = 0;
    COND_INIT(tbl->threads[0].cvar);

    LOCK_INTERP(interp);
}

/*

=item C<void* Parrot_threads_main(void *args_ptr)>

When an interpreter spawns a new worker thread, that thread starts
here.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
Parrot_threads_main(ARGMOD(void *args_ptr))
{
    ASSERT_ARGS(Parrot_threads_main)
    Thread_args *args = (Thread_args*) args_ptr;
    Interp    *interp = args->interp;
    INTVAL       tidx = args->idx;
    Thread_table *tbl = interp->thread_table;
    free(args_ptr);

    Parrot_alarm_mask(interp);

    /* Yay stack scanning */
    tbl->threads[tidx].lo_var_ptr = &tidx;

    //fprintf(stderr, "Thread id# %d started.\n", (int) tidx);

    Parrot_cx_outer_runloop(interp, tidx);

    //fprintf(stderr, "Thread id# %d ending.\n", (int) tidx);
    return 0;
}

/*

=item C<void Parrot_threads_block(PARROT_INTERP, INTVAL *tidx)>

The current thread is about to block. Make sure there's
another thread ready to do work once we release the
interpreter lock.

Use macros BLOCK_THREAD and UNBLOCK_THREAD rather than
calling this directly.

=cut

*/

void
Parrot_threads_block(PARROT_INTERP, ARGOUT(INTVAL *tidx))
{
    ASSERT_ARGS(Parrot_threads_block)
    Thread_table *tbl = interp->thread_table;
    int next;

    /* scan to find who's next */
    for (next = 1; next < tbl->count; ++next) {
        if(tbl->threads[next].blocked == 0)
            break;
    }

    /* Maybe spawn more threads */
    if (next > tbl->count) {
        Parrot_threads_spawn(interp);
    }

    *tidx = interp->active_thread;

    /* While we're blocked, we might have PMCs on stack */
    tbl->threads[*tidx].hi_var_ptr = &next;

    tbl->threads[*tidx].blocked = 1;

    COND_SIGNAL(tbl->threads[*tidx].cvar);

    UNLOCK_INTERP(interp);
}

/*

=item C<void Parrot_threads_unblock(PARROT_INTERP, INTVAL *tidx)>

The current thread has completed a blocking operation.
It's going to have to wait for someone else to finish.

Use macros BLOCK_THREAD and UNBLOCK_THREAD rather than
calling this directly.

=cut

*/

void
Parrot_threads_unblock(PARROT_INTERP, ARGIN(INTVAL *tidx))
{
    ASSERT_ARGS(Parrot_threads_unblock)
    Thread_table *tbl;

    LOCK_INTERP(interp);

    tbl = interp->thread_table;
    interp->active_thread = *tidx;
    tbl->threads[*tidx].blocked = 0;
}

/*

=item C<INTVAL Parrot_threads_count_blocked(PARROT_INTERP)>

Scan the interpreter's thread table to find how many are blocked.

=cut

*/

INTVAL
Parrot_threads_count_blocked(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_count_blocked)

    Thread_table *tbl = interp->thread_table;
    int i;
    INTVAL count = 0;

    for (i = 1; i < tbl->count; ++i) {
        if(tbl->threads[i].blocked)
            ++count;
    }

    return count;
}

/*

=item C<void Parrot_threads_spawn(PARROT_INTERP)>

Someone needs another thread. Add one at the end of table.

=cut

*/

void
Parrot_threads_spawn(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_spawn)
    Thread_table *tbl = interp->thread_table;
    INTVAL    new_idx = tbl->count;
    Thread_args *args = (Thread_args*) malloc(sizeof(Thread_args));

    tbl->count += 1;

    /* Maybe grow table */
    if (tbl->count > tbl->size) {
        tbl->size *= 2;
        tbl = (Thread_table*) realloc(tbl, sizeof(Thread_info) * tbl->size);
    }

    args->interp = interp;
    args->idx    = new_idx;

    tbl->threads[new_idx].blocked = 0;
    COND_INIT(tbl->threads[new_idx].cvar);

    THREAD_CREATE_JOINABLE(tbl->threads[new_idx].id, Parrot_threads_main, args);
}

/*

=item C<void Parrot_threads_reap(PARROT_INTERP)>

Clean up any excess threads at the end of table.

=cut

*/

void
Parrot_threads_reap(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_reap)
    /* fprintf(stderr, "Parrot_reap_threads not implemented.\n"); */
}

/*

=item C<void Parrot_threads_idle(PARROT_INTERP, INTVAL tidx)>

Bored thread waits for work to do.

=cut

*/

void
Parrot_threads_idle(PARROT_INTERP, INTVAL tidx)
{
    ASSERT_ARGS(Parrot_threads_idle)
    Thread_table *tbl = interp->thread_table;
    COND_WAIT(tbl->threads[tidx].cvar, interp->interp_lock);
    interp->active_thread = tidx;
}

/*

=item C<void Parrot_threads_wakeup(PARROT_INTERP)>

There might be work to do, wake up a thread.

=cut

*/

void
Parrot_threads_wakeup(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_threads_idle)
    Thread_table *tbl = interp->thread_table;
    int i;

    for(i = 1; i < tbl->count; ++i) {
        if (tbl->threads[i].blocked == 0) {
            COND_SIGNAL(tbl->threads[i].cvar);
            return;
        }
    }

    Parrot_threads_spawn(interp);
}

/*

=item C<INTVAL Parrot_threads_current(PARROT_INTERP)>

Scan the table for the current thread index.

=cut

*/

INTVAL
Parrot_threads_current(PARROT_INTERP)
{
    INTVAL idx;
    Thread_table *tbl = interp->thread_table;
    Parrot_thread tid = THREAD_SELF();


    for(idx = 0; idx < tbl->count; ++idx) {
        if (THREAD_EQUAL(tbl->threads[idx].id, tid))
            return idx;
    }

    exit_fatal(1, "threads.c: Current thread is not in the threads table.");
}


/*

=back

=head1 SEE ALSO

L<include/parrot/threads.h>, L<src/scheduler.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
