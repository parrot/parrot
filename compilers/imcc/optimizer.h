/*
 * $Id$
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

#ifndef PARROT_IMCC_OPTIMIZER_H_GUARD
#define PARROT_IMCC_OPTIMIZER_H_GUARD

#include "unit.h"

/* HEADERIZER BEGIN: compilers/imcc/optimizer.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
int cfg_optimize(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Basic_block * find_outer(
    ARGIN(const IMC_Unit *unit),
    ARGIN(const Basic_block *blk))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char * get_neg_op(ARGIN(const char *op), ARGOUT(int *n))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*n);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n,
    ARGOUT(int *ok))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(6)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r)
        FUNC_MODIFIES(*ok);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants_umix(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

int is_invariant(PARROT_INTERP,
    ARGIN(const IMC_Unit *unit),
    ARGIN(const Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int loop_one(PARROT_INTERP, ARGMOD(IMC_Unit *unit), int bnr)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

int loop_optimization(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
int max_loop_depth(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

int move_ins_out(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Instruction **ins),
    ARGIN(const Basic_block *bb))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins);

int optimize(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

int pre_optimize(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/optimizer.c */

#endif /* PARROT_IMCC_OPTIMIZER_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

