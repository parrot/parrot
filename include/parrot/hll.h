/* hll.h
 *  Copyright (C) 2005-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the API header for the HLL subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_HLL_H_GUARD
#define PARROT_HLL_H_GUARD

/* this invalid HLL type means "no HLL" when passed to the below functions */
#define PARROT_HLL_NONE -1

/* this is guaranteed always to be the internal "parrot" pseudo-HLL */
#define PARROT_HLL_PARROT 0

/* HEADERIZER BEGIN: src/hll.c */

PARROT_API
PMC* Parrot_get_ctx_HLL_namespace( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_get_ctx_HLL_type( Interp *interp /*NN*/, INTVAL core_type )
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_get_HLL_id( Interp *interp /*NN*/, STRING *hll_name /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API
STRING * Parrot_get_HLL_name( Interp *interp /*NN*/, INTVAL id )
        __attribute__nonnull__(1);

PARROT_API
PMC* Parrot_get_HLL_namespace( Interp *interp /*NN*/, int hll_id )
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_get_HLL_type( Interp *interp /*NN*/,
    INTVAL hll_id,
    INTVAL core_type )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_regenerate_HLL_namespaces( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_register_HLL( Interp *interp /*NN*/,
    STRING *hll_name /*NULLOK*/,
    STRING *hll_lib )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_register_HLL_type( Interp *interp /*NN*/,
    INTVAL hll_id,
    INTVAL core_type,
    INTVAL hll_type )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/hll.c */

#endif /* PARROT_HLL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
