/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/call/ops.c

=head1 DESCRIPTION

B<Calling Ops>:  Various functions that call the run loop.

=head1 FUNCTIONS

=over 4

=cut

*/


#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "pmc/pmc_continuation.h"

/* HEADERIZER HFILE: include/parrot/call.h */

#define STACKED_EXCEPTIONS 1
#define RUNLOOP_TRACE      0

static int
runloop_id_counter = 0;          /* for synthesizing runloop ids. */

/*

=item C<void runops(PARROT_INTERP, size_t offs)>

Run parrot ops. Set exception handler and/or resume after exception.

=cut

*/

void
runops(PARROT_INTERP, size_t offs)
{
    ASSERT_ARGS(runops)
    volatile size_t offset            = offs;
    const    int    old_runloop_id    = interp->current_runloop_id;
    const    int    our_runloop_level = ++interp->current_runloop_level;
    const    int    our_runloop_id    = ++runloop_id_counter;

    /* It is OK if the runloop ID overflows; we only ever test it for equality,
       so the chance of collision is slight. */
    interp->current_runloop_id = our_runloop_id;

#if RUNLOOP_TRACE
    fprintf(stderr, "[entering loop %d, level %d]\n",
            interp->current_runloop_id, our_runloop_level);
#endif

    /*
     * STACKED_EXCEPTIONS are necessary to catch exceptions in reentered
     * run loops, e.g. if a delegate method throws an exception
     */
#if ! STACKED_EXCEPTIONS
    if (!interp->current_runloop)
#endif
    {
        new_runloop_jump_point(interp);
  reenter:
        interp->current_runloop->handler_start = NULL;
        switch (setjmp(interp->current_runloop->resume)) {
          case 1:
            /* an exception was handled */
            if (STACKED_EXCEPTIONS)
                free_runloop_jump_point(interp);

            interp->current_runloop_level = our_runloop_level - 1;
            interp->current_runloop_id    = old_runloop_id;

#if RUNLOOP_TRACE
            fprintf(stderr, "[handled exception; back to loop %d, level %d]\n",
                        interp->current_runloop_id, interp->current_runloop_level);
#endif
            return;
          case 2:
            /* Reenter the runloop from a exception thrown from C
             * with a pir handler */
            PARROT_ASSERT(interp->current_runloop->handler_start);
            offset = interp->current_runloop->handler_start - interp->code->base.data;
            /* Prevent incorrect reuse */
            goto reenter;
          default:
            break;
        }
    }

    runops_int(interp, offset);

    interp->current_runloop->handler_start = NULL;
    /* Remove the current runloop marker (put it on the free list). */
    if (STACKED_EXCEPTIONS || interp->current_runloop)
        free_runloop_jump_point(interp);

#if RUNLOOP_TRACE
    fprintf(stderr, "[exiting loop %d, level %d]\n",
            our_runloop_id, our_runloop_level);
#endif

    interp->current_runloop_level = our_runloop_level - 1;
    interp->current_runloop_id    = old_runloop_id;
}


/*

=back

=head2 Helper Functions

=over 4

=item C<void new_runloop_jump_point(PARROT_INTERP)>

Create a new runloop jump point, either by allocating it or by
getting one from the free list.

=cut

*/

PARROT_EXPORT
void
new_runloop_jump_point(PARROT_INTERP)
{
    ASSERT_ARGS(new_runloop_jump_point)
    Parrot_runloop *jump_point;

    if (interp->runloop_jmp_free_list) {
        jump_point                    = interp->runloop_jmp_free_list;
        interp->runloop_jmp_free_list = jump_point->prev;
    }
    else
        jump_point = mem_gc_allocate_zeroed_typed(interp, Parrot_runloop);

    jump_point->prev        = interp->current_runloop;
    interp->current_runloop = jump_point;
}

/*

=item C<void free_runloop_jump_point(PARROT_INTERP)>

Place runloop jump point back on the free list.

=cut

*/

PARROT_EXPORT
void
free_runloop_jump_point(PARROT_INTERP)
{
    ASSERT_ARGS(free_runloop_jump_point)
    Parrot_runloop * const jump_point = interp->current_runloop;
    interp->current_runloop           = jump_point->prev;
    jump_point->prev                  = interp->runloop_jmp_free_list;
    interp->runloop_jmp_free_list     = jump_point;
}

/*

=item C<void destroy_runloop_jump_points(PARROT_INTERP)>

Destroys (and frees the memory of) the runloop jump point list and the
associated free list for the specified interpreter.

=cut

*/

void
destroy_runloop_jump_points(PARROT_INTERP)
{
    ASSERT_ARGS(destroy_runloop_jump_points)
    really_destroy_runloop_jump_points(interp->current_runloop);
    really_destroy_runloop_jump_points(interp->runloop_jmp_free_list);
}

/*

=item C<void really_destroy_runloop_jump_points(Parrot_runloop *jump_point)>

Takes a pointer to a runloop jump point (which had better be the last one in
the list). Walks back through the list, freeing the memory of each one, until
it encounters NULL. Used by C<destroy_runloop_jump_points>.

=cut

*/

void
really_destroy_runloop_jump_points(ARGIN_NULLOK(Parrot_runloop *jump_point))
{
    ASSERT_ARGS(really_destroy_runloop_jump_points)
    while (jump_point) {
        Parrot_runloop * const prev = jump_point->prev;
        mem_sys_free(jump_point);
        jump_point = prev;
    }
}


/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
