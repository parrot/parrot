/* global_setup.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Performs all the global setting up of things. This includes the
 *      (very few) global variables that Parrot totes around
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#define INSIDE_GLOBAL_SETUP
#include "parrot/parrot.h"

/* These functions are defined in the auto-generated file core_pmcs.c */
extern void Parrot_initialize_core_pmcs(Interp *interp);
extern void Parrot_register_core_pmcs(Interp *interp, PMC* registry);

void
init_world(Interp *interpreter)
{
    PMC* key;
    string_init();              /* Set up the string subsystem */

    /* Call base vtable class constructor methods */
    Parrot_initialize_core_pmcs(interpreter);

    /* Now register the names of the PMCs */

    /* We need a hash */
    Parrot_base_classname_hash = pmc_new(interpreter, enum_class_PerlHash);

    /* Now fill the hash */
    Parrot_register_core_pmcs(interpreter, Parrot_base_classname_hash);
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
