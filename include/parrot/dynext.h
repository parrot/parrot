/* dynext.h
*
* $Id$
*
*   Parrot dynamic extensions
*/

#if !defined(PARROT_DYNEXT_H_GUARD)
#define PARROT_DYNEXT_H_GUARD


/* dynamic lib/oplib/PMC loading */
PARROT_API PMC *Parrot_load_lib(Interp *interpreter, STRING *lib, PMC *initializer);

/* dynamic lib/oplib/PMC init */
PARROT_API PMC *
Parrot_init_lib(Interp *interpreter,
                PMC *(*load_func)(Interp *),
                void (*init_func)(Interp *, PMC *));

/* for cloning live iterpreters to create new threads */
PARROT_API PMC *
Parrot_clone_lib_into(Interp *dest_interp, Interp *source_interp, PMC *lib_pmc);

#endif /* PARROT_DYNEXT_H_GUARD */

