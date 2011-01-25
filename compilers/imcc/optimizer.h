/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

#ifndef PARROT_IMCC_OPTIMIZER_H_GUARD
#define PARROT_IMCC_OPTIMIZER_H_GUARD

#include "unit.h"

/* HEADERIZER BEGIN: compilers/imcc/optimizer.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
int cfg_optimize(ARGMOD(imc_info_t *imcc), ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char * get_neg_op(ARGIN(const char *op), ARGOUT(int *n))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*n);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants(
    ARGMOD(imc_info_t *imcc),
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
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r)
        FUNC_MODIFIES(*ok);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_subst_constants_umix(
    ARGMOD(imc_info_t *imcc),
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

int optimize(ARGMOD(imc_info_t *imcc), ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

int pre_optimize(ARGMOD(imc_info_t *imcc), ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

#define ASSERT_ARGS_cfg_optimize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_get_neg_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(op) \
    , PARROT_ASSERT_ARG(n))
#define ASSERT_ARGS_IMCC_subst_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(ok))
#define ASSERT_ARGS_IMCC_subst_constants_umix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_optimize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_pre_optimize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/optimizer.c */

#endif /* PARROT_IMCC_OPTIMIZER_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

