/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */
#include <stdio.h>
#include "pircompiler.h"
#include "pirregalloc.h"
#include "parrot/parrot.h"

/*

=head1 FUNCTIONS

=over 4

=cut

*/


lin_reg_allocator *
new_lin_reg_allocator(void) {
    lin_reg_allocator *lra = (lin_reg_allocator *)mem_sys_allocate_zeroed(
                                                                  sizeof (lin_reg_allocator));

    return lra;

}
/*

Return length of list C<list>

*/
static unsigned
length(live_interval *list) {
    unsigned len = 0;

    while (list) {
        ++len;
        list = list->next;
    }
    return len;
}

/*

Constructor for a live_interval struct object.

*/
live_interval *
new_live_interval(unsigned firstuse_location) {
    live_interval *i = (live_interval *)mem_sys_allocate(sizeof (live_interval));

    i->next = NULL;
    i->prev = NULL;

    i->startpoint = i->endpoint = firstuse_location;

    fprintf(stderr, "new live interval: %u\n", firstuse_location);
    return i;
}

/*

Add live_interval C<i> to the list; this list is sorted on increasing
start point.

*/
void
add_live_interval(lin_reg_allocator *lra, live_interval *i) {
    live_interval *iter = lra->intervals;

    if (iter == NULL) {
        lra->intervals = i;
        return;
    }

    /* search for the right point to insert */
    while (iter->next && iter->startpoint < i->startpoint) {
        iter = iter->next;
    }

    /* at this point iter->startpoint >= i->startpoint */

    /*

       A ---- B

       insert i between A and B

       A -- i -- B

    */

    i->next = iter;                /* i->next = B */
    i->prev = iter->prev;          /* i->prev = A */

    if (iter->prev)
        iter->prev->next = i;          /* A->next = i */

    iter->prev       = i;          /* B->prev = i */
}




/*

Add interval C<i> to the list of active intervals; the list is sorted
on increasing endpoint.

*/
static void
add_interval_to_active(lin_reg_allocator *lra, live_interval * i) {
    live_interval *iter = lra->active;

    if (iter == NULL) {
        lra->active = i;
        return;
    }

    while (iter->endpoint < i->endpoint) {
        iter = iter->next;
    }

    /* at this point, iter->endpoint >= i->endpoint. insert here */
    i->next = iter;
    i->prev = iter->prev;

    if (iter->prev)
        iter->prev->next = i;

    iter->prev       = i;
}

/*

Allocate a new register; if there's any old registers to be reused, return
such a second-hand register; otherwise, allocate a brand new one.

*/
static unsigned
get_free_reg(lin_reg_allocator * const lra) {
    if (lra->free_regs) {
        free_reg *available = lra->free_regs;
        lra->free_regs      = available->next;
        return available->regno;
    }
    /* no free regs, allocate a new one */
    return lra->R++;
}

/*

Add register C<regno> to the list of free regs that can be reuse.

*/
static void
add_free_reg(lin_reg_allocator *lra, unsigned regno) {
    free_reg *reg = (free_reg *)mem_sys_allocate(sizeof (free_reg));

    reg->next = lra->free_regs;
    lra->free_regs = reg;
}

/*

Remove interval C<i> from the list of active intervals.

*/
static void
remove_from_active(lin_reg_allocator *lra, live_interval *i) {
    i->prev->next = i->next;
    i->next->prev = i->prev;
    /* i can be put onto a free list, so that memory stays allocated
     * XXX do this optimization later.
     */
}

/* implementation of the Linear Register Allocation algorithm. */

/*

Go over all active intervals; if the endpoint of one of them is >= than
C<i>'s start point, the action is aborted. Otherwise C<j> is 'removed' from
active, as it has expired. (the variable is no longer needed).

*/
static void
expire_old_intervals(lin_reg_allocator *lra, live_interval * i) {
    live_interval *j;
    for (j = lra->active; j != NULL; j = j->next) {
        if (j->endpoint >= i->startpoint)
            return;

        remove_from_active(lra, j);
        add_free_reg(lra, j->realreg);
    }

}

static void
spill_at_interval(lin_reg_allocator *lra, live_interval * i) {
/*    live_interval *last_active; */
/*    if (last_active->endpoint > i->endpoint) { */

        i->realreg = get_free_reg(lra);
        add_interval_to_active(lra, i);

/*    }
    else
        i->realreg = get_free_reg(lra);
*/
}

/*

Go over all live intervals; before handling any interval, expire all old ones;
they might have expired (see expire_old_intervals()). Then, if all registers
that are active are needed, spill_at_interval() is invoked, to "spill".

If no registers are available, a new register is allocated, and added to the
active list.

*/
void
linear_scan_register_allocation(lexer_state * const lexer) {
    lin_reg_allocator *lra = lexer->lra;
    live_interval *i;

    for (i = lra->intervals; i != NULL; i = i->next) {
        expire_old_intervals(lra, i);

        if (length(lra->active) == lra->R)
            spill_at_interval(lra, i);
        else {
            i->realreg = get_free_reg(lra);
            add_interval_to_active(lra, i);
        }
    }
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


