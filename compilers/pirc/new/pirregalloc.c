/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */
#include <stdio.h>
#include "pircompiler.h"
#include "pirregalloc.h"
#include "parrot/parrot.h"

/*

=head1 DESCRIPTION

This file contains functions implementing a somewhat modified version of the
linear scan register allocation algorithm. This algorithm assumes there's a
fixed number of registers, which is not the case for Parrot. Therefore,
the algorithm is modified in some places.

=head1 FUNCTIONS

=over 4

=cut

*/


/*

=item C<lsr_allocator *
new_linear_scan_register_allocator(void)>

Constructor for a linear scan register allocator.
Initializates the allocator, and returns it.

=cut

*/
lsr_allocator *
new_linear_scan_register_allocator(void) {
    lsr_allocator *lsr = (lsr_allocator *)mem_sys_allocate_zeroed(sizeof (lsr_allocator));
    int i;

    /* the "r" field keeps track of the number of registers that must be allocated by
     * parrot. In the original implementation, "r" is constant, and indicates the number
     * of available registers. In parrot, this is flexible, so we increment it only
     * if necessary. However, the minimum value for "r" must be 1, in order for the
     * algorithm to work properly. After all, having 0 registers doesn't make sense.
     * Initialize r for each type to 1 here:
     */
    for (i = 0; i < 4; ++i)
        lsr->r[i] = 1;

    return lsr;
}

/*

=item C<void
destroy_linear_scan_regiser_allocator(lsr_allocator *lsr)>

Destructor for linear scan register allocator.
XXX free all other stuff of lsr.

=cut

*/
void
destroy_linear_scan_regiser_allocator(lsr_allocator *lsr) {

    mem_sys_free(lsr);
}

/*

Return length of list C<list>

*/
static unsigned
lengthi(live_interval *list) {
    unsigned len = 0;

    while (list) {
        ++len;
        list = list->nexti;
    }
    return len;
}

static unsigned
lengtha(live_interval *list) {
    unsigned len = 0;

    while (list) {
        ++len;
        list = list->nexta;
    }
    return len;
}

/*

=item C<live_interval *
new_live_interval(lsr_allocator * const lsr, unsigned firstuse_location, pir_type type)>

Constructor for a live_interval struct object.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
live_interval *
new_live_interval(lsr_allocator * const lsr, unsigned firstuse_location, pir_type type) {
    live_interval *i = (live_interval *)mem_sys_allocate_zeroed(sizeof (live_interval));

    /* this is the first usage of the register, and up to now also the last */
    i->startpoint = i->endpoint = firstuse_location;

    add_live_interval(lsr, i, type);
    return i;
}

/*

=item C<void
add_live_interval(lsr_allocator * const lsr, live_interval * const i, pir_type type)>

Add live_interval C<i> to the list; this list is sorted on increasing
start point.

=cut

*/
void
add_live_interval(lsr_allocator * const lsr, live_interval * const i, pir_type type) {
    live_interval *iter = lsr->intervals[type];

    /* if there's no interval for the specified type, insert i as the first one and return */
    if (iter == NULL) {
        lsr->intervals[type] = i;
        return;
    }

    /* search for the right point to insert */

    /* I think this is a bit wonky. It happens to be the case that intervals are only added
     * in the right order, due to fact that parser parses variables in order (declarations).
     * XXX evaluate whether this needs fixing.
     */
    while (iter->nexti && iter->startpoint < i->startpoint) {
        iter = iter->nexti;
    }

    /* at this point iter->startpoint >= i->startpoint */

    iter->nexti = i;
    i->previ    = iter;


    /*
    fprintf(stderr, "live intervals: #%d\n", lengthi(lsr->intervals[type]));
    */
}




/*

=item C<static void
add_interval_to_active(lsr_allocator *lsr, live_interval * i, pir_type type)>

Add interval C<i> to the list of active intervals; the list is sorted
on increasing endpoint.

=cut

*/
static void
add_interval_to_active(lsr_allocator *lsr, live_interval * const i, pir_type type) {
    live_interval *iter = lsr->active[type];

/*
    if (iter)
        fprintf(stderr, "length of active: %d\n", lengtha(lsr->active[type]));
*/

    /* if there's no active intervals, set i as first */
    if (iter == NULL) {
        lsr->active[type] = i;
/*
        fprintf(stderr, "added, #active: %d\n", lengtha(lsr->active[type]));
*/
        return;
    }

    i->nexta = iter;
    lsr->active[type] = i;
    return;    /* is sorting needed? */

    while (iter && iter->endpoint < i->endpoint) {
        iter = iter->nexta;
    }

    /* at this point, iter->endpoint >= i->endpoint. insert here */

    if (iter) {
        i->nexta = iter;
        i->preva = iter->preva;
    }
    else {
        i->preva    = iter;
        iter->nexta = i;
    }

    /*
    fprintf(stderr, "add_interval_to_active() length is now: %d\n", lengtha(lsr->active[type]));
    */
}

/*

=item C<static unsigned
get_free_reg(lsr_allocator * const lsr, pir_type type)>

Allocate a new register; if there's any old registers to be reused, return
such a second-hand register; otherwise, allocate a brand new one.

=cut

*/
static unsigned
get_free_reg(lsr_allocator * const lsr, pir_type type) {
    /* if there's any second hand register for the requested type, return that. */
    if (lsr->free_regs[type]) {
        free_reg *available  = lsr->free_regs[type];
        lsr->free_regs[type] = available->next;

        /* store the free_reg object for later re-use */
        available->next      = lsr->cached_regs;
        lsr->cached_regs     = available;

        return available->regno;
    }
    else {
        /* no free regs, allocate a new one. Note that as r is initialized to 1,
         * and parrot register numbering starts at 0, substract 1 here.
         * (initializing r to 0 will make the algorithm stop working properly.)
         */
         unsigned reg = lsr->r[type] - 1;
         lsr->r[type]++;
         return reg;
    }
}

/*

=item C<static void
add_free_reg(lsr_allocator * const lsr, unsigned regno, pir_type type)>

Add register C<regno> to the list of free regs that can be reuse.

=cut

*/
static void
add_free_reg(lsr_allocator * const lsr, unsigned regno, pir_type type) {
    free_reg *reg;

    /* if we still had some free_reg object lying around, re-use that one;
     * if not, then allocate a new one.
     */
    if (lsr->cached_regs) {
        reg = lsr->cached_regs;
        lsr->cached_regs = reg->next;
    }
    else
        reg = (free_reg *)mem_sys_allocate_zeroed(sizeof (free_reg));

    /* store the register number for re-use. */
    reg->regno = regno;

    /* link the free_reg object in list of available registers */
    reg->next = lsr->free_regs[type];
    lsr->free_regs[type] = reg;
}

/*

=item C<static void
remove_from_active(live_interval *i)>

Remove interval C<i> from the list of active intervals.

=cut

*/
static void
remove_from_active(live_interval *i) {
    /*
    fprintf(stderr, "remove active()\n");
    */

    if (i->preva)
        i->preva->nexta = i->nexta;
    if (i->nexta)
        i->nexta->preva = i->preva;

    /* XXX I think at this point we can mem_sys_free() it */
}



/*

=item C<static void
expire_old_intervals(lsr_allocator * const lsr, live_interval * i, pir_type type)>

Go over all active intervals; if the endpoint of one of them is >= than
C<i>'s start point, the action is aborted. Otherwise C<j> is 'removed' from
active, as it has expired. (the variable is no longer needed).

=cut

*/
static void
expire_old_intervals(lsr_allocator * const lsr, live_interval * i, pir_type type) {
    live_interval *j;

    for (j = lsr->active[type]; j != NULL; j = j->nexta) {
        if (j->endpoint >= i->startpoint)
            return;

        remove_from_active(j);
        add_free_reg(lsr, j->realreg, type);
    }

}

/*

=item C<void
linear_scan_register_allocation(lsr_allocator * const lsr)>

Go over all live intervals; before handling any interval, expire all old ones;
they might have expired (see expire_old_intervals()). Then, allocate a new
register; this can be one that was just expired.

=cut

*/
void
linear_scan_register_allocation(lsr_allocator * const lsr) {
    live_interval * i;
    pir_type type = 0; /* types run from 0 to 4; see pircompunit.h */

    for (type = 0; type < 4; ++type) { /* handle each of the 4 parrot types separately. */

        for (i = lsr->intervals[type]; i != NULL; i = i->nexti) {

            expire_old_intervals(lsr, i, type);

            /* get a free register */
            i->realreg = get_free_reg(lsr, type);

            /* update the symbol/pir_reg with this newly allocated reg */
            *i->color = i->realreg;

            /* add this variable to the list of active ones */
            add_interval_to_active(lsr, i, type);
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


