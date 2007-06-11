/* mmd.h
 *  Copyright (C) 2003-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the API header for the mmd subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#pragma once
#ifndef PARROT_MMD_H_GUARD
#define PARROT_MMD_H_GUARD

#include "parrot/config.h"
#include "parrot/compiler.h"
#include "parrot/parrot.h"

/* function typedefs */
typedef PMC*    (*mmd_f_p_ppp)(Interp *, PMC *, PMC *, PMC *);
typedef PMC*    (*mmd_f_p_pip)(Interp *, PMC *, INTVAL, PMC *);
typedef PMC*    (*mmd_f_p_pnp)(Interp *, PMC *, FLOATVAL, PMC *);
typedef PMC*    (*mmd_f_p_psp)(Interp *, PMC *, STRING *, PMC *);

typedef void    (*mmd_f_v_pp)(Interp *, PMC *, PMC *);
typedef void    (*mmd_f_v_pi)(Interp *, PMC *, INTVAL);
typedef void    (*mmd_f_v_pn)(Interp *, PMC *, FLOATVAL);
typedef void    (*mmd_f_v_ps)(Interp *, PMC *, STRING *);

typedef INTVAL  (*mmd_f_i_pp) (Interp *, PMC *, PMC *);

typedef struct _MMD_init {
        INTVAL func_nr;
        INTVAL left, right;
        funcptr_t func_ptr;
} MMD_init;

typedef struct _MMD_table {
    funcptr_t *mmd_funcs;     /* The functions for the MMD table */
    UINTVAL x;               /* The x coord for each table */
    UINTVAL y;               /* The y coord for each table */
} MMD_table;


/* HEADERIZER BEGIN: src/mmd.c */

PARROT_API funcptr_t get_mmd_dispatch_type( Interp *interp /*NN*/,
    INTVAL func_nr,
    INTVAL left_type,
    INTVAL right_type,
    int *is_pmc /*NN*/  )
        __attribute__nonnull__(1)
        __attribute__nonnull__(5)
        __attribute__warn_unused_result__;

PARROT_API void mmd_add_by_class( Interp *interp /*NN*/,
    INTVAL functype,
    STRING *left_class /*NN*/,
    STRING *right_class /*NN*/,
    funcptr_t funcptr /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_API void mmd_add_function( Interp *interp /*NN*/,
    INTVAL func_nr,
    funcptr_t function )
        __attribute__nonnull__(1);

PARROT_API void mmd_destroy( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API INTVAL mmd_dispatch_i_pp( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    PMC *right /*NN*/,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API PMC* mmd_dispatch_p_pip( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    INTVAL right,
    PMC *dest,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API PMC* mmd_dispatch_p_pnp( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    FLOATVAL right,
    PMC *dest,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API PMC* mmd_dispatch_p_ppp( Interp *interp,
    PMC *left /*NN*/,
    PMC *right /*NN*/,
    PMC *dest,
    INTVAL func_nr )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API PMC* mmd_dispatch_p_psp( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    STRING *right,
    PMC *dest,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void mmd_dispatch_v_pn( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    FLOATVAL right,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void mmd_dispatch_v_pp( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    PMC *right /*NN*/,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void mmd_dispatch_v_ps( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    STRING *right,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void mmd_register( Interp *interp /*NN*/,
    INTVAL func_nr,
    INTVAL left_type,
    INTVAL right_type,
    funcptr_t funcptr /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API void mmd_register_sub( Interp *interp /*NN*/,
    INTVAL func_nr,
    INTVAL left_type,
    INTVAL right_type,
    PMC *sub /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(5);

PARROT_API PMC * mmd_vtfind( Interp *interp /*NN*/,
    INTVAL func_nr,
    INTVAL left,
    INTVAL right )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API void Parrot_mmd_rebuild_table( Interp* interp /*NN*/,
    INTVAL type,
    INTVAL func_nr )
        __attribute__nonnull__(1);

PARROT_API void Parrot_mmd_register_table( Interp* interp,
    INTVAL type,
    const MMD_init *mmd_table,
    INTVAL n );

PARROT_API PMC * Parrot_MMD_search_default_infix( Interp *interp /*NN*/,
    STRING *meth,
    INTVAL left_type,
    INTVAL right_type )
        __attribute__nonnull__(1);

PARROT_API PMC * Parrot_mmd_sort_candidate_list( Interp *interp /*NN*/,
    PMC *candidates )
        __attribute__nonnull__(1);

void mmd_dispatch_v_pi( Interp *interp /*NN*/,
    PMC *left /*NN*/,
    INTVAL right,
    INTVAL func_nr )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/mmd.c */

/*
 * in src/objects.c :
 */
PARROT_API const char* Parrot_MMD_method_name(Interp* i, INTVAL idx);
PARROT_API INTVAL Parrot_MMD_method_idx(Interp *interp, const char *name);

#endif /* PARROT_MMD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
