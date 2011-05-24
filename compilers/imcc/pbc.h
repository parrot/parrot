/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

#ifndef PARROT_IMCC_PBC_H_GUARD
#define PARROT_IMCC_PBC_H_GUARD

/* HEADERIZER BEGIN: compilers/imcc/pbc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void e_pbc_close(ARGMOD(imc_info_t * imcc), void *param)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

int e_pbc_emit(
    ARGMOD(imc_info_t * imcc),
    void *param,
    ARGIN(const IMC_Unit *unit),
    ARGIN(const Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* imcc);

void e_pbc_end_sub(
    ARGMOD(imc_info_t * imcc),
    void *param,
    ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

void e_pbc_new_sub(
    ARGMOD(imc_info_t * imcc),
    void *param,
    ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

int e_pbc_open(ARGMOD(imc_info_t * imcc))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

PARROT_WARN_UNUSED_RESULT
INTVAL IMCC_int_from_reg(ARGMOD(imc_info_t * imcc), ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

void imcc_pbc_add_libdep(ARGMOD(imc_info_t * imcc), ARGIN(STRING *libname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * IMCC_string_from__STRINGC(
    ARGMOD(imc_info_t * imcc),
    ARGIN(char *buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * IMCC_string_from_reg(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

#define ASSERT_ARGS_e_pbc_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_e_pbc_emit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_e_pbc_end_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_e_pbc_new_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_e_pbc_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_IMCC_int_from_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_imcc_pbc_add_libdep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(libname))
#define ASSERT_ARGS_IMCC_string_from__STRINGC __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_IMCC_string_from_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/pbc.c */

#endif /* PARROT_IMCC_PBC_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

