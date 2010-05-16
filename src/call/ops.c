/*
Copyright (C) 2001-2010, Parrot Foundation.
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
#include "parrot/runcore_api.h"

/* HEADERIZER HFILE: include/parrot/call.h */

#define STACKED_EXCEPTIONS 1
#define RUNLOOP_TRACE      0

static int
runloop_id_counter = 0;          /* for synthesizing runloop ids. */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void free_runloops_until(PARROT_INTERP, int id)
        __attribute__nonnull__(1);

static void really_destroy_runloop_jump_points(PARROT_INTERP,
    ARGFREE(Parrot_runloop *jump_point))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_free_runloops_until __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_really_destroy_runloop_jump_points \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

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
    int             our_runloop_level = interp->current_runloop_level;
    int             our_runloop_id    = old_runloop_id;

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
        our_runloop_id = interp->current_runloop_id;
        our_runloop_level = interp->current_runloop_level;
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
            free_runloops_until(interp, our_runloop_id);
            PARROT_ASSERT(interp->current_runloop->handler_start);
            offset = interp->current_runloop->handler_start - interp->code->base.data;
            /* Prevent incorrect reuse */
            goto reenter;
          case 3:
            /* Reenter the runloop when finished the handling of a
             * exception */
            free_runloops_until(interp, our_runloop_id);
            offset = interp->current_runloop->handler_start - interp->code->base.data;
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

    jump_point->prev           = interp->current_runloop;
    jump_point->id             = ++runloop_id_counter;
    interp->current_runloop    = jump_point;
    interp->current_runloop_id = jump_point->id;
    ++interp->current_runloop_level;
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
    Parrot_runloop * const current    = jump_point->prev;
    interp->current_runloop           = current;
    jump_point->prev                  = interp->runloop_jmp_free_list;
    interp->runloop_jmp_free_list     = jump_point;
    interp->current_runloop_id        = current ? current->id : 0;
    --interp->current_runloop_level;
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
    really_destroy_runloop_jump_points(interp, interp->current_runloop);
    really_destroy_runloop_jump_points(interp, interp->runloop_jmp_free_list);
}

/*

=item C<static void free_runloops_until(PARROT_INTERP, int id)>

Free runloops until the one with the provided id gets current.

=cut

*/

static void
free_runloops_until(PARROT_INTERP, int id)
{
    ASSERT_ARGS(free_runloops_until)
    while (interp->current_runloop && interp->current_runloop_id != id)
        free_runloop_jump_point(interp);
}

/*

=item C<static void really_destroy_runloop_jump_points(PARROT_INTERP,
Parrot_runloop *jump_point)>

Takes a pointer to a runloop jump point (which had better be the last one in
the list). Walks back through the list, freeing the memory of each one, until
it encounters NULL. Used by C<destroy_runloop_jump_points>.

=cut

*/

static void
really_destroy_runloop_jump_points(PARROT_INTERP,
        ARGFREE(Parrot_runloop *jump_point))
{
    ASSERT_ARGS(really_destroy_runloop_jump_points)
    while (jump_point) {
        Parrot_runloop * const prev = jump_point->prev;
        mem_gc_free(interp, jump_point);
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
