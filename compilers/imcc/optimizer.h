/*
 * $Id$
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

#ifndef PARROT_IMCC_OPTIMIZER_H_GUARD
#define PARROT_IMCC_OPTIMIZER_H_GUARD

#include "unit.h"

/* HEADERIZER BEGIN: compilers/imcc/optimizer.c */

int cfg_optimize( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

const char * get_neg_op( NOTNULL(const char *op), NOTNULL(int *n) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants( PARROT_INTERP,
    IMC_Unit * unit,
    NOTNULL(const char *name),
    SymReg **r,
    int n,
    NOTNULL(int *ok) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(6);

Instruction * IMCC_subst_constants_umix( PARROT_INTERP,
    IMC_Unit * unit,
    NOTNULL(const char *name),
    SymReg **r,
    int n )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

int optimize( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int pre_optimize( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: compilers/imcc/optimizer.c */

#endif /* PARROT_IMCC_OPTIMIZER_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

