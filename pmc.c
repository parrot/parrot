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
    PMC *pmc = new_pmc_header(interpreter);

    if (!pmc) {
        internal_exception(ALLOCATION_ERROR,
                           "Parrot VM: PMC allocation failed!\n");
        return NULL;
    }

    /* Ensure the PMC survives DOD during this function */
    pmc->flags |= PMC_immune_FLAG;

    pmc->vtable = &(Parrot_base_vtables[base_type]);

    if (!pmc->vtable || !pmc->vtable->init) {
        /* This is usually because you either didn't call init_world early 
         * enough or you added a new PMC class without adding 
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
        return NULL;
    }

    pmc->vtable->init(interpreter, pmc, 0);

    /* Let the caller track this PMC */
    pmc->flags &= ~PMC_immune_FLAG;
    return pmc;
}

/*=for api pmc pmc_new_sized

   As C<pmc_new>, but passes C<size> to the PMC's C<init> method.

=cut
*/

PMC *
pmc_new_sized(struct Parrot_Interp *interpreter, INTVAL base_type, INTVAL size)
{
    PMC *pmc = new_pmc_header(interpreter);

    if (!pmc) {
        internal_exception(ALLOCATION_ERROR,
                           "Parrot VM: PMC allocation failed!\n");
        return NULL;
    }

    /* Ensure the PMC survives DOD during this function */
    pmc->flags |= PMC_immune_FLAG;

    pmc->vtable = &(Parrot_base_vtables[base_type]);

    if (!pmc->vtable || !pmc->vtable->init) {
        /* This is usually because you either didn't call init_world early 
         * enough or you added a new PMC class without adding 
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
        return NULL;
    }

    pmc->vtable->init(interpreter, pmc, size);

    /* Let the caller track this PMC */
    pmc->flags &= ~PMC_immune_FLAG;
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
