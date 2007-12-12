/*
 * $Id$
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

#ifndef PARROT_IMCC_OPTIMIZER_H_GUARD
#define PARROT_IMCC_OPTIMIZER_H_GUARD

#include "unit.h"

/* HEADERIZER BEGIN: compilers/imcc/optimizer.c */

PARROT_WARN_UNUSED_RESULT
int cfg_optimize(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Basic_block * find_outer(NOTNULL(IMC_Unit *unit), NOTNULL(Basic_block *blk))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char * get_neg_op(ARGIN(const char *op), NOTNULL(int *n))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants(PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    ARGIN(const char *name),
    NOTNULL(SymReg **r),
    int n,
    NOTNULL(int *ok))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(6);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants_umix(PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    ARGIN(const char *name),
    NOTNULL(SymReg **r),
    int n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

int is_invariant(PARROT_INTERP,
    NOTNULL(IMC_Unit * unit),
    NOTNULL(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int loop_one(PARROT_INTERP, NOTNULL(IMC_Unit *unit), int bnr)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int loop_optimization(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int max_loop_depth(NOTNULL(IMC_Unit *unit))
        __attribute__nonnull__(1);

int move_ins_out(PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(Instruction **ins),
    NOTNULL(Basic_block *bb))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

int optimize(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int pre_optimize(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
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

