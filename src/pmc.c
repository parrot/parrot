/* pmc.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The base vtable calling functions.
 *  Data Structure and Algorithms:
 *     See include/parrot/vtable.h.
 *  History:
 *     Initial version by Simon on 2001.10.20
 *  Notes:
 *  References:
 *     <5.1.0.14.2.20011008152120.02158148@pop.sidhe.org>
 */

#include "parrot/parrot.h"

/*=for api pmc pmc_new

   Creates a new PMC of type C<base_type> (which is an index into
   the list of PMC types declared in C<Parrot_base_vtables> in
   F<pmc.h>). Once the PMC has been successfully created and
   its vtable pointer initialized, we call its C<init> method to
   perform any other necessary initialization.

=cut
*/

PMC *
pmc_new(struct Parrot_Interp *interpreter, INTVAL base_type)
{
    PMC *pmc = pmc_new_noinit(interpreter, base_type);
    VTABLE_init(interpreter, pmc);
    return pmc;
}

static PMC*
get_new_pmc_header(struct Parrot_Interp *interpreter, INTVAL base_type,
    struct Small_Object_Pool *pool)
{
    PMC *pmc = get_free_pmc(interpreter, pool);

    if (!pmc) {
        internal_exception(ALLOCATION_ERROR,
                           "Parrot VM: PMC allocation failed!\n");
        return NULL;
    }

    pmc->vtable = &(Parrot_base_vtables[base_type]);

    if (!pmc->vtable || !pmc->vtable->init) {
        /* This is usually because you either didn't call init_world early
         * enough or you added a new PMC class without adding
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
        return NULL;
    }

    return pmc;
}

/*=for api pmc pmc_new_noinit

   Creates a new PMC of type C<base_type> (which is an index into the
   list of PMC types declared in C<Parrot_base_vtables> in
   F<pmc.h>). Unlike C<pmc_new>, C<pmc_new_noinit> does not call its
   C<init> method.  This allows separate allocation and initialization
   for continuations.

=cut
*/

PMC *
pmc_new_noinit(struct Parrot_Interp *interpreter, INTVAL base_type)
{
    PMC *pmc = get_new_pmc_header(interpreter, base_type,
            interpreter->arena_base->pmc_pool);
    switch (base_type) {
        case enum_class_PerlInt:
        case enum_class_PerlNum:
        case enum_class_PerlString:
        case enum_class_PerlUndef:
            break;
        default:
            /* TODO optimize this, mainly only aggregates need
             * the extra header part
             */
            add_pmc_ext(interpreter, pmc);
            break;
    }
    return pmc;
}

/*=for api pmc constant_pmc_new_noinit

   Creates a new constant PMC of type C<base_type>
=cut
*/

PMC *
constant_pmc_new_noinit(struct Parrot_Interp *interpreter, INTVAL base_type)
{
    PMC *pmc = get_new_pmc_header(interpreter, base_type,
            interpreter->arena_base->constant_pmc_pool);
    PObj_constant_SET(pmc);
    return pmc;
}
/*=for api pmc pmc_new_init

   As C<pmc_new>, but passes C<init> to the PMC's C<init_pmc> method.

=cut
*/

PMC *
pmc_new_init(struct Parrot_Interp *interpreter, INTVAL base_type, PMC *init)
{
    PMC *pmc = new_pmc_header(interpreter);

    if (!pmc) {
        internal_exception(ALLOCATION_ERROR,
                           "Parrot VM: PMC allocation failed!\n");
        return NULL;
    }

    pmc->vtable = &(Parrot_base_vtables[base_type]);

    if (!pmc->vtable || !pmc->vtable->init) {
        /* This is usually because you either didn't call init_world early
         * enough or you added a new PMC class without adding
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
        return NULL;
    }

    VTABLE_init_pmc(interpreter, pmc, init);

    return pmc;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
