/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/pmc_freeze.c - Freeze and thaw functionality

=head1 DESCRIPTION

Thawing PMCs uses a list with (maximum) size of the amount of PMCs to
keep track of retrieved PMCs.

The individual information of PMCs is frozen/thawed by their vtables.

To avoid recursion, the whole functionality is driven by
C<< pmc->vtable->visit >>, which is called for the first PMC initially.
Container PMCs call a "todo-callback" for all contained PMCs. The
individual action vtable (freeze/thaw) is then called for all todo-PMCs.

=cut

*/

#include "parrot/parrot.h"
#include "pmc/pmc_callcontext.h"
#include "pmc_freeze.str"

/* when thawing a string longer then this size, we first do a GC run and then
 * block GC - the system can't give us more headers */

#define THAW_BLOCK_GC_SIZE 100000

/* HEADERIZER HFILE: include/parrot/pmc_freeze.h */

/*

=head2 Public Interface

=over 4

=item C<STRING* Parrot_freeze(PARROT_INTERP, PMC *pmc)>

Freeze using either method.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_freeze(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_freeze)
    PMC *image = Parrot_pmc_new(interp, enum_class_ImageIO);
    VTABLE_set_pmc(interp, image, pmc);
    return VTABLE_get_string(interp, image);
}

/*

=item C<INTVAL Parrot_freeze_size(PARROT_INTERP, PMC *pmc)>

Get the size of an image to be frozen without allocating a large buffer.

Used in C<Packfile_Constant_pack_size>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_freeze_size(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_freeze_size)
    PMC *result;
    PMC *visitor = Parrot_pmc_new(interp, enum_class_ImageIOSize);
    VTABLE_set_pmc(interp, visitor, pmc);
    result = VTABLE_get_pmc(interp, visitor);
    return VTABLE_get_integer(interp, result);
}


/*

=item C<PMC* Parrot_thaw(PARROT_INTERP, STRING *image)>

Thaws a PMC.  Called from the C<thaw> opcode.

For now it seems cheaper to use a list for remembering contained
aggregates. We could of course decide dynamically, which strategy to
use, e.g.: given a big image, the first thawed item is a small
aggregate. This implies, it probably contains (or some big strings) more
nested containers, for which another approach could be a win.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw)

    PMC        *info     = Parrot_pmc_new(interp, enum_class_ImageIO);
    int         gc_block = 0;
    PMC        *result;

    /*
     * if we are thawing a lot of PMCs, it's cheaper to do
     * a GC run first and then block GC - the limit should be
     * chosen so that no more then one GC run would be triggered
     *
     * XXX
     *
     * md5_3.pir shows a segfault during thawing the config hash
     * info->thaw_ptr becomes invalid - seems that the hash got
     * collected under us.
     */
    if (1 || (Parrot_str_byte_length(interp, image) > THAW_BLOCK_GC_SIZE)) {
        Parrot_block_GC_mark(interp);
        Parrot_block_GC_sweep(interp);
        gc_block = 1;
    }

    VTABLE_set_string_native(interp, info, image);
    result = VTABLE_get_pmc(interp, info);

    if (gc_block) {
        Parrot_unblock_GC_mark(interp);
        Parrot_unblock_GC_sweep(interp);
    }

    return result;
}


/*

=item C<PMC* Parrot_thaw_constants(PARROT_INTERP, STRING *image)>

Thaws constants, used by PackFile for unpacking PMC constants.
This is a lie. It does nothing different from Parrot_thaw at the moment.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw_constants(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw_constants)
    return Parrot_thaw(interp, image);
}


/*

=item C<PMC* Parrot_clone(PARROT_INTERP, PMC *pmc)>

There are for sure shortcuts to clone faster, e.g. always thaw the image
immediately or use a special callback.  For now we just thaw a frozen PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_clone(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_clone)
    return VTABLE_clone(interp, pmc);
}

/*

=item C<void Parrot_visit_loop_visit(PARROT_INTERP, PMC *info)>

Iterate a visitor PMC visiting each encountered target PMC.

=cut

*/

void
Parrot_visit_loop_visit(PARROT_INTERP, ARGIN(PMC *info)) {
    ASSERT_ARGS(Parrot_visit_loop_visit)

    INTVAL      i;
    PMC * const todo    = VTABLE_get_iter(interp, info);

    /* can't cache upper limit, visit may append items */
    for (i = 0; i < VTABLE_elements(interp, todo); i++) {
        PMC *current = VTABLE_get_pmc_keyed_int(interp, todo, i);
        if (!current)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "NULL current PMC in visit_loop_todo_list");

        PARROT_ASSERT(current->vtable);

        VTABLE_visit(interp, current, info);

        VISIT_PMC(interp, info, PMC_metadata(current));
    }
}

/*

=item C<void Parrot_visit_loop_thawfinish(PARROT_INTERP, PMC *info)>

Iterate a visitor PMC thawfinishing each encountered target PMC.

=cut

*/

void
Parrot_visit_loop_thawfinish(PARROT_INTERP, ARGIN(PMC *info)) {
    ASSERT_ARGS(Parrot_visit_loop_thawfinish)

    /* call thawfinish for each processed PMC */
    /*
     * Thaw in reverse order. We have to fully thaw younger PMCs
     * before use them in older.
     *
     * XXX There are no younger or older pmcs in a directed graph
     *     that allows cycles. Any code that requires a specific
     *      order here is likely broken.
     */

    PMC * const todo    = VTABLE_get_iter(interp, info);
    const INTVAL n = VTABLE_elements(interp, todo);
    int          i;

    for (i = n-1; i >= 0; --i) {
        PMC *current = VTABLE_get_pmc_keyed_int(interp, todo, i);
        if (!PMC_IS_NULL(current))
            VTABLE_thawfinish(interp, current, info);
    }
}

/*

=back

=head1 TODO

The seen-hash version for freezing might go away sometime.

=head1 SEE ALSO

Lot of discussion on p6i and F<docs/dev/pmc_freeze.pod>.

=head1 HISTORY

Initial version by leo 2003.11.03 - 2003.11.07.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
