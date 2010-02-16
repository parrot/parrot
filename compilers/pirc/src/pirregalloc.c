/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
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

=head1 SYNOPSIS

  // create a new lsr allocator
  lsr_allocator *lsr = new_linear_scan_register_allocator(lexer);

  for ( ... ) {
      pir_type type = ... ;

      // create a new live interval, specifying location/ID of first statement
      live_interval *interval = new_live_interval(lsr, firstlocation, type);
  }

  // update live interval with more usage information about a variable
  interval->endpoint = ... ;

  // perform a linear scan
  linear_scan_register_allocation(lsr);

  // clean up
  destroy_linear_scan_register_allocator(lsr);

=head1 FUNCTIONS

=over 4

=cut

*/

/*

=item C<static void reset_register_count(lsr_allocator * const lsr)>

Reset the register counters; there's one counter for each register
type (string, num, int, pmc).

=cut

*/
static void
reset_register_count(ARGIN(lsr_allocator * const lsr))
{
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
}

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_free_reg(
    ARGIN(lsr_allocator * const lsr),
    unsigned regno,
    pir_type type)
        __attribute__nonnull__(1);

static void add_interval_to_active(
    ARGIN(lsr_allocator *lsr),
    ARGIN(live_interval * const i),
    pir_type type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void add_live_interval(
    ARGIN(lsr_allocator * const lsr),
    ARGIN(live_interval * const i),
    pir_type type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void cache_interval_object(
    ARGIN(lsr_allocator * const lsr),
    ARGIN(live_interval * interval))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void expire_old_intervals(
    ARGIN(lsr_allocator * const lsr),
    ARGIN(live_interval * const i),
    pir_type type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static unsigned get_free_reg(
    ARGIN(lsr_allocator * const lsr),
    pir_type type)
        __attribute__nonnull__(1);

static unsigned lengthi(ARGIN_NULLOK(live_interval *list));
static void remove_from_active(ARGMOD(live_interval *i))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*i);

static void reset_register_count(ARGIN(lsr_allocator * const lsr))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_add_free_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr))
#define ASSERT_ARGS_add_interval_to_active __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_add_live_interval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_cache_interval_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr) \
    , PARROT_ASSERT_ARG(interval))
#define ASSERT_ARGS_expire_old_intervals __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr) \
    , PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_get_free_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr))
#define ASSERT_ARGS_lengthi __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_remove_from_active __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(i))
#define ASSERT_ARGS_reset_register_count __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lsr))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<lsr_allocator * new_linear_scan_register_allocator(struct lexer_state
*lexer)>

Constructor for a linear scan register allocator.
Initializes the allocator, and returns it.

=cut

*/
PARROT_CAN_RETURN_NULL
lsr_allocator *
new_linear_scan_register_allocator(ARGIN_NULLOK(struct lexer_state *lexer))
{
    lsr_allocator *lsr = (lsr_allocator *)mem_sys_allocate_zeroed(sizeof (lsr_allocator));

    lsr->lexer = lexer;

    return lsr;
}

/*

XXX debug function only

*/
void print_list(char *msg, live_interval *i);
void
print_list(ARGIN(char *msg), ARGIN(live_interval *i))
{
    fprintf(stderr, "%s: ", msg);
    while (i) {
        fprintf(stderr, "[%d] ", i->endpoint);
        i = i->nexta;
    }
    fprintf(stderr, "\n");
}

/*

=item C<void destroy_linear_scan_register_allocator(lsr_allocator *lsr)>

Destructor for linear scan register allocator. All live_interval
objects are destroyed as well.

=cut

*/
void
destroy_linear_scan_register_allocator(ARGMOD(lsr_allocator *lsr))
{
    pir_type type;
    live_interval *i;

    for (type = 0; type < 4; ++type) {
        live_interval *iter = lsr->intervals[type];
        while (iter) {
            iter = iter->nexti;
            mem_sys_free(iter->previ);
        }
    }

    /* free all cached interval objects */
    i = lsr->cached_intervals;
    while (i != NULL) {
        live_interval *tmp = i;
        i = i->nextc;
        mem_sys_free(tmp);
    }

    mem_sys_free(lsr);
}

/*

=item C<static unsigned lengthi(live_interval *list)>

XXX debug function only.
Return length of list C<list>

=cut

*/
static unsigned
lengthi(ARGIN_NULLOK(live_interval *list))
{
    unsigned len = 0;

    while (list) {
        ++len;
        list = list->nexti;
    }
    return len;
}

/*

=item C<static void add_live_interval(lsr_allocator * const lsr, live_interval *
const i, pir_type type)>

Add live_interval C<i> to the list; this list is sorted on increasing
start point.

=cut

*/
static void
add_live_interval(ARGIN(lsr_allocator * const lsr),
    ARGIN(live_interval * const i), pir_type type)
{
    live_interval *iter = lsr->intervals[type];

    /* if there's no interval for the specified type, insert i as the first one and return */
    if (iter == NULL) {
        lsr->intervals[type] = i;
        /* print_list("intervals (1): ", lsr->intervals[type]); */
        return;
    }

    /* search for the right point to insert */

    while (iter->nexti && iter->startpoint < i->startpoint) {
        iter = iter->nexti;
    }

    /* at this point iter->startpoint >= i->startpoint, or iter->nexti is NULL */

    if (iter->nexti) {
        PARROT_ASSERT(iter->startpoint >= i->startpoint);
        /* iter->startpoint >= i->startpoint */
        /* insert i before iter */
        i->nexti = iter;
        if (iter->previ) {
            i->previ = iter->previ;
            i->previ->nexti = i;
        }
        else {
            lsr->intervals[type] = i;
        }
        iter->previ = i;

        /* print_list("intervals (2): ", lsr->intervals[type]); */
    }
    else {
        /* iter->nexti is NULL */
        if (iter->startpoint < i->startpoint) { /* add i after iter */
            iter->nexti = i;
            i->previ = iter;
        }
        else { /* iter->startpoint >= i->startpoint */
            /* insert i before iter */
            i->nexti = iter;
            if (iter->previ) {
                i->previ = iter->previ;
                i->previ->nexti = i;
            }
            else {
                lsr->intervals[type] = i;
            }
            iter->previ = i;
        }

        /* print_list("intervals (3): ", lsr->intervals[type]);*/
    }

    /* fprintf(stderr, "live intervals: #%d\n", lengthi(lsr->intervals[type])); */

}



/*

=item C<live_interval * new_live_interval(lsr_allocator * const lsr, unsigned
firstuse_location, pir_type type)>

Constructor for a live_interval struct object. After creating the new interval object,
its startpoint and endpoint are initialized to the value in C<firstuse_location>. Note
that an interval has a type; the register allocator keeps a list of interval for each
type, because obviously you can't mix different types of registers.

The newly created interval is added to the list of intervals.

=cut

*/
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
live_interval *
new_live_interval(ARGIN(lsr_allocator * const lsr),
        unsigned firstuse_location, pir_type type)
{
    live_interval *i;
    /* check whether there's an interval object that we can re-use, to prevent
     * memory malloc() and free()s.
     */
    if (lsr->cached_intervals) {

        i = lsr->cached_intervals;
        lsr->cached_intervals = i->nextc;

        /* clear fields */
        i->nexti = i->previ   = NULL;
        i->nexta = i->preva   = NULL;
        i->nextc = NULL;
    }
    else {
        /* there's no interval object to be re-used (none allocated yet, or all are used). */
        i = (live_interval *)mem_sys_allocate_zeroed(sizeof (live_interval));
    }

    /* this is the first usage of the register, and up to now also the last */
    i->startpoint = i->endpoint = firstuse_location;

    add_live_interval(lsr, i, type);
    return i;

}




/*

=item C<static void add_interval_to_active(lsr_allocator *lsr, live_interval *
const i, pir_type type)>

Add interval C<i> to the list of active intervals; the list is sorted
on increasing endpoint.

=cut

*/
static void
add_interval_to_active(ARGIN(lsr_allocator *lsr),
        ARGIN(live_interval * const i), pir_type type)
{
    live_interval *iter = lsr->active[type];

    /* if there's no active intervals, set i as first */
    if (iter == NULL) {
        lsr->active[type] = i;
        /* print_list("(1)", lsr->active[type]); */
        return;
    }

    /* look for the right place to insert; sort on increasing end point */
    while (iter->nexta && iter->endpoint < i->endpoint) {
        iter = iter->nexta;
    }

    /* at this point iter->endpoint >= i->endpoint, or, iter->next is NULL, or both */

    if (iter->nexta) {

        PARROT_ASSERT(iter->endpoint >= i->endpoint);

        i->nexta = iter;
        if (iter->preva) {
            i->preva = iter->preva;
            i->preva->nexta = i;
        }
        else {
            lsr->active[type] = i;
        }
        iter->preva = i;

        /* print_list("(2)", lsr->active[type]); */
    }
    else { /* iter->next is NULL */

        if (iter->endpoint > i->endpoint) { /* iter > i, so insert before iter */
            i->nexta = iter;
            if (iter->preva) {
                i->preva = iter->preva;
                i->preva->nexta = i;
            }
            else { /* if a node has no prev pointer, then it's the first */
                lsr->active[type] = i;
            }
            iter->preva = i;

        }
        else { /* i->endpoint >= iter->endpoint */
            /* add i after iter; i->next is NULL, so it's the last item */
            i->preva    = iter;
            iter->nexta = i;
        }
        /* print_list("(3)", lsr->active[type]); */
    }
}

/*

=item C<static unsigned get_free_reg(lsr_allocator * const lsr, pir_type type)>

Allocate a new register; if there's any old registers to be reused, return
such a second-hand register; otherwise, allocate a brand new one.

=cut

*/
static unsigned
get_free_reg(ARGIN(lsr_allocator * const lsr), pir_type type)
{
    /* if there's any second hand register for the requested type, return that. */
    if (lsr->free_regs[type]) {
        free_reg *available  = lsr->free_regs[type];
        lsr->free_regs[type] = available->next;

        /* store the free_reg object for later re-use */
        available->next      = lsr->cached_regs;
        lsr->cached_regs     = available;

        fprintf(stderr, "get_free_reg(): cached: %d\n", available->regno);
        return available->regno;
    }
    else {
        /* no free regs, allocate a new one. Note that as r is initialized to 1,
         * and parrot register numbering starts at 0, substract 1 here.
         * (initializing r to 0 will make the algorithm stop working properly.)
         */
        unsigned reg = lsr->r[type] - 1;
        lsr->r[type]++;
        fprintf(stderr, "get_free_reg(): non-cached: %d\n", reg);
        return reg;
    }
}

/*

=item C<static void add_free_reg(lsr_allocator * const lsr, unsigned regno,
pir_type type)>

Add register C<regno> to the list of free regs that can be reuse.

=cut

*/
static void
add_free_reg(ARGIN(lsr_allocator * const lsr), unsigned regno, pir_type type)
{
    ASSERT_ARGS(add_free_reg)

    free_reg *reg;

    /* fprintf(stderr, "add_free_reg(): %u\n", regno); */

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

=item C<static void remove_from_active(live_interval *i)>

Remove interval C<i> from the list of active intervals.

=cut

*/
static void
remove_from_active(ARGMOD(live_interval *i))
{
    /* if it has a previous node, that previous node's next is set
     * to i's next.
     */
    if (i->preva)
        i->preva->nexta = i->nexta;
    /* if it has a next node, that next node's previous is set to
     * i's previous.
     */
    if (i->nexta)
        i->nexta->preva = i->preva;
}



/*

=item C<static void expire_old_intervals(lsr_allocator * const lsr,
live_interval * const i, pir_type type)>

Go over all active intervals; if the endpoint of one of them is >= than
C<i>'s start point, the action is aborted. This is why the C<active> list must be
sorted on increasing endpoint. Otherwise C<j> is 'removed' from
active, as it has expired. (the variable is no longer needed).

=cut

*/
static void
expire_old_intervals(ARGIN(lsr_allocator * const lsr),
        ARGIN(live_interval * const i), pir_type type)
{
    ASSERT_ARGS(expire_old_intervals)

    live_interval *j;

    for (j = lsr->active[type]; j != NULL; j = j->nexta) {
        if (j->endpoint >= i->startpoint) {
            return;
        }

        /* don't remove from active if a :unique_reg flag was set */
        if (!TEST_FLAG(j->flags, INTERVAL_FLAG_UNIQUE_REG)) {
            remove_from_active(j);
            add_free_reg(lsr, j->realreg, type);
        }
    }

}

/*

=item C<static void cache_interval_object(lsr_allocator * const lsr,
live_interval * interval)>

Store the interval C<interval> on a caching list; whenever a new C<live_interval>
object is requested, these interval objects can be re-used, instead of malloc()ing
a new one.

=cut

*/
static void
cache_interval_object(ARGIN(lsr_allocator * const lsr),
        ARGIN(live_interval * interval))
{
    interval->nextc = lsr->cached_intervals;
    lsr->cached_intervals = interval;
}

/*

=item C<void linear_scan_register_allocation(lsr_allocator * const lsr)>

Go over all live intervals; before handling any interval, expire all old ones;
they might have expired (see expire_old_intervals()). Then, allocate a new
register; this can be one that was just expired.

=cut

*/
void
linear_scan_register_allocation(ARGIN(lsr_allocator * const lsr))
{
    live_interval * i;
    pir_type type = 0; /* types run from 0 to 4; see pircompunit.h */

    reset_register_count(lsr);

    for (type = 0; type < 4; ++type) { /* handle each of the 4 parrot types separately. */

        /* cache the objects on the active list for reuse */
        for (i = lsr->active[type]; i != NULL; i = i->nexta)
            cache_interval_object(lsr, i);

        /* initialize active intervals list to NULL */
        lsr->active[type] = NULL;

        /* fprintf(stderr, "Lin.scan.reg.alloc.: %u variables to be mapped\n",
           lengthi(lsr->intervals[type]));
        */
        for (i = lsr->intervals[type]; i != NULL; i = i->nexti) {

            /* expire all intervals whose endpoint is smaller than i's start
             * point; that means that i can be mapped to a register that was
             * previously assigned to one of the expired intervals; that one
             * is no longer needed (hence it expired).
             */
            expire_old_intervals(lsr, i, type);

            /* get a free register */
            i->realreg = get_free_reg(lsr, type);


            /* update the symbol/pir_reg with this newly allocated reg */
            *i->color = i->realreg;

            /* add this variable to the list of active ones */
            add_interval_to_active(lsr, i, type);
        }

         /* cache the objects on the list for reuse */
        for (i = lsr->intervals[type]; i != NULL; i = i->nexti)
            cache_interval_object(lsr, i);

        /* clear list of intervals */
        lsr->intervals[type] = NULL;

        /* lsr->r is 1 too high w.r.t. the actual register usage, subtract now,
         * this is safe, because lsr->r[type] will no longer be used, as type will
         * be incremented.
         */
        --lsr->r[type];
    }


    /* update the register usage in the current subroutine structure. */
    update_sub_register_usage(lsr->lexer, lsr->r);

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


