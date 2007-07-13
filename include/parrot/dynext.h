/* dynext.h
*
* $Id$
*
*   Parrot dynamic extensions
*/

#ifndef PARROT_DYNEXT_H_GUARD
#define PARROT_DYNEXT_H_GUARD

/* HEADERIZER BEGIN: src/dynext.c */

PARROT_API
PMC * Parrot_clone_lib_into( Interp *d, Interp *s, PMC *lib_pmc );

PARROT_API
PMC * Parrot_init_lib( PARROT_INTERP,
    PMC *(*load_func)(NULLOK(Interp *)),
    void (*init_func)(Interp *,
    NULLOK(PMC *)) )
        __attribute__nonnull__(1);

PARROT_API
PMC * Parrot_load_lib( PARROT_INTERP, NULLOK(STRING *lib), PMC *initializer )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/dynext.c */

#endif /* PARROT_DYNEXT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
