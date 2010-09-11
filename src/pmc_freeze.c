/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/pmc_freeze.c - Freeze and thaw functionality

=head1 DESCRIPTION

Thawing PMCs uses a list with (maximum) size of the amount of PMCs to
keep track of retrieved PMCs.

PMCs freeze and thaw their own information through their vtables.

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
PARROT_CANNOT_RETURN_NULL
STRING*
Parrot_freeze(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_freeze)
    PMC * const image = Parrot_pmc_new(interp, enum_class_ImageIO);
    VTABLE_set_pmc(interp, image, pmc);
    return VTABLE_get_string(interp, image);
}


/*

=item C<opcode_t * Parrot_freeze_pbc(PARROT_INTERP, PMC *pmc, const
PackFile_ConstTable *pf, opcode_t *cursor)>

Freezes a PMC to a PackFile.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_freeze_pbc(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(const PackFile_ConstTable *pf),
    ARGIN(opcode_t *cursor))
{
    ASSERT_ARGS(Parrot_freeze_pbc)
    PMC    *visitor;
    STRING *image;
    DECL_CONST_CAST;

    visitor  = Parrot_pmc_new(interp, enum_class_ImageIO);
    VTABLE_set_pointer(interp, visitor,
        PARROT_const_cast(void *, (const void *)pf));
    VTABLE_set_pmc(interp, visitor, pmc);

    image  = VTABLE_get_string(interp, visitor);
    cursor = PF_store_buf(cursor, image);

    return cursor;
}


/*

=item C<UINTVAL Parrot_freeze_size(PARROT_INTERP, PMC *pmc)>

Gets the size of an image to be frozen without allocating a large buffer.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
UINTVAL
Parrot_freeze_size(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_freeze_size)
    PMC    *pmc_result;
    PMC    * const visitor = Parrot_pmc_new(interp, enum_class_ImageIOSize);
    VTABLE_set_pmc(interp, visitor, pmc);
    pmc_result = VTABLE_get_pmc(interp, visitor);

    return VTABLE_get_integer(interp, pmc_result);
}


/*

=item C<UINTVAL Parrot_freeze_pbc_size(PARROT_INTERP, PMC *pmc, const
PackFile_ConstTable *pf)>

Gets the size of an image if it were created using C<Parrot_freeze_pbc>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
UINTVAL
Parrot_freeze_pbc_size(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(const PackFile_ConstTable *pf))
{
    ASSERT_ARGS(Parrot_freeze_pbc_size)
    PMC *pf_pmc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
    PMC *visitor, *pmc_result;
    DECL_CONST_CAST;

    VTABLE_set_pointer(interp, pf_pmc,
        PARROT_const_cast(void *, (const void *)pf));

    visitor = Parrot_pmc_new_init(interp, enum_class_ImageIOSize, pf_pmc);
    VTABLE_set_pmc(interp, visitor, pmc);

    pmc_result = VTABLE_get_pmc(interp, visitor);
    return VTABLE_get_integer(interp, pmc_result);
}


/*

=item C<PMC * Parrot_freeze_strings(PARROT_INTERP, PMC *pmc)>

Gets the strings of a PMC to be frozen.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_freeze_strings(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_freeze_strings)
    PMC * const visitor = Parrot_pmc_new(interp, enum_class_ImageIOStrings);
    VTABLE_set_pmc(interp, visitor, pmc);
    return VTABLE_get_pmc(interp, visitor);
}


/*

=item C<PMC * Parrot_thaw(PARROT_INTERP, STRING *image)>

Thaws a PMC.  Called from the C<thaw> opcode.

For now it seems cheaper to use a list for remembering contained aggregates. We
could of course decide dynamically, which strategy to use: given a big image,
the first thawed item is a small aggregate. This implies it probably contains
more nested containers, for which another approach could be a win.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_thaw(PARROT_INTERP, ARGIN(STRING *image))
{
    ASSERT_ARGS(Parrot_thaw)

    PMC        *result;
    PMC * const info     = Parrot_pmc_new(interp, enum_class_ImageIO);
    int         gc_block = 0;

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

=item C<PMC* Parrot_thaw_pbc(PARROT_INTERP, PackFile_ConstTable *ct, const
opcode_t **cursor)>

Thaw a pmc frozen by Parrot_freeze_pbc.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_thaw_pbc(PARROT_INTERP, ARGIN(PackFile_ConstTable *ct), ARGMOD(const opcode_t **cursor))
{
    ASSERT_ARGS(Parrot_thaw_pbc)
    PackFile * const pf = ct->base.pf;
    STRING *image       = PF_fetch_buf(interp, pf, cursor);
    PMC *info           = Parrot_pmc_new(interp, enum_class_ImageIO);
    VTABLE_set_pointer(interp, info, ct);
    VTABLE_set_string_native(interp, info, image);
    return VTABLE_get_pmc(interp, info);
}


/*

=item C<PMC* Parrot_thaw_constants(PARROT_INTERP, STRING *image)>

This does nothing different from Parrot_thaw at the moment.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
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
Parrot_visit_loop_visit(PARROT_INTERP, ARGIN(PMC *info))
{
    ASSERT_ARGS(Parrot_visit_loop_visit)

    PMC * const  todo   = VTABLE_get_iter(interp, info);
    const INTVAL action = VTABLE_get_integer(interp, info);
    INTVAL       i;

    /* can't cache upper limit, visit may append items */
    for (i = 0; i < VTABLE_elements(interp, todo); ++i) {
        PMC * const current = VTABLE_get_pmc_keyed_int(interp, todo, i);
        if (PMC_IS_NULL(current))
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_MALFORMED_PACKFILE,
                    "NULL current PMC at %d in visit_loop_todo_list - %s",
                    (int) i,
                    action == VISIT_FREEZE_NORMAL ? "feeze" : "thaw");

        PARROT_ASSERT(current->vtable);

        if (action == VISIT_FREEZE_NORMAL)
            VTABLE_freeze(interp, current, info);
        else
            VTABLE_thaw(interp, current, info);

        VTABLE_visit(interp, current, info);

        VISIT_PMC(interp, info, PMC_metadata(current));
    }
}


/*

=item C<void Parrot_visit_loop_thawfinish(PARROT_INTERP, PMC *info)>

Iterates a visitor PMC, thawfinishing each encountered target PMC.

=cut

*/

void
Parrot_visit_loop_thawfinish(PARROT_INTERP, ARGIN(PMC *info))
{
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

    PMC * const  todo = VTABLE_get_iter(interp, info);
    const INTVAL n    = VTABLE_elements(interp, todo);
    int          i;

    for (i = n - 1; i >= 0; --i) {
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

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
