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

PMC* pmc_new(struct Parrot_Interp *interpreter, PMC* pmc, INTVAL base_type) {
    if (pmc) { /* We've got some memory */
        if (pmc->vtable && pmc->vtable->new) { /* And it even looks like a PMC */
            PMC* newpmc = pmc->vtable->new(interpreter, pmc);
            /* Ensure it's the type we want */
            if (newpmc->vtable->type(interpreter, newpmc) != base_type) {
                newpmc->vtable->morph(interpreter, newpmc, base_type);
            }
            return newpmc;
        }
    } else {
      pmc = new_pmc_header(interpreter);
    }
    pmc->flags = 0;
    pmc->data  = 0;
    pmc->vtable = &(Parrot_base_vtables[base_type]);
    return pmc;
}
