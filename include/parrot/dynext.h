/* dynext.h
*
* $Id$
*
*   Parrot dynamic extensions
*/

#ifndef PARROT_DYNEXT_H_GUARD
#define PARROT_DYNEXT_H_GUARD

/* dynamic lib/oplib/PMC loading */
PARROT_API Parrot_PMC
Parrot_load_lib(Parrot_Interp interp,
                Parrot_String lib, Parrot_PMC initializer);

/* dynamic lib/oplib/PMC init */
PARROT_API Parrot_PMC
Parrot_init_lib(Parrot_Interp interp,
                Parrot_PMC(*load_func)(Parrot_Interp),
                void (*init_func)(Parrot_Interp, Parrot_PMC));

/* for cloning live iterpreters to create new threads */
PARROT_API Parrot_PMC
Parrot_clone_lib_into(Parrot_Interp dest_interp, Parrot_Interp source_interp,
                      Parrot_PMC lib_pmc);

#endif /* PARROT_DYNEXT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
