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

   This is the basic function for bootstrapping creation of
   a PMC. Once you have a PMC, you can call its "new" vtable
   entry to get another PMC like it. You may pass in either
   an existing PMC, in which case a new PMC will be created
   using that PMC as a "base", a pointer to some PMC-sized
   memory, or a null pointer, in which case memory will be
   assigned for you.

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

    pmc->flags = 0;
    pmc->data = 0;

    pmc->vtable = &(Parrot_base_vtables[base_type]);

    if (!pmc->vtable || !pmc->vtable->init) {
        /* This is usually because you either didn't call init_world early 
         * enough or you added a new PMC class without adding 
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
        return NULL;
    }

    pmc->vtable->init(interpreter, pmc, 0);
    return pmc;
}

PMC *
pmc_new_sized(struct Parrot_Interp *interpreter, INTVAL base_type, INTVAL size)
{
    PMC *pmc = new_pmc_header(interpreter);

    if (!pmc) {
        internal_exception(ALLOCATION_ERROR,
                           "Parrot VM: PMC allocation failed!\n");
        return NULL;
    }

    pmc->flags = 0;
    pmc->data = 0;

    pmc->vtable = &(Parrot_base_vtables[base_type]);

    if (!pmc->vtable || !pmc->vtable->init) {
        /* This is usually because you either didn't call init_world early 
         * enough or you added a new PMC class without adding 
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
        return NULL;
    }

    pmc->vtable->init(interpreter, pmc, size);
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
