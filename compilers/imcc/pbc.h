/*
 * $Id$
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

#ifndef PARROT_IMCC_PBC_H_GUARD
#define PARROT_IMCC_PBC_H_GUARD

/* HEADERIZER BEGIN: compilers/imcc/pbc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

int e_pbc_close(PARROT_INTERP, SHIM(void *param))
        __attribute__nonnull__(1);

int e_pbc_emit(PARROT_INTERP,
    SHIM(void *param),
    ARGIN(const IMC_Unit *unit),
    ARGIN(const Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

int e_pbc_end_sub(PARROT_INTERP, SHIM(void *param), ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

int e_pbc_new_sub(PARROT_INTERP, SHIM(void *param), ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

int e_pbc_open(PARROT_INTERP, SHIM(const char *param))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
INTVAL IMCC_int_from_reg(PARROT_INTERP, ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * IMCC_string_from__STRINGC(PARROT_INTERP, ARGIN(char *buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * IMCC_string_from_reg(PARROT_INTERP, ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_e_pbc_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_e_pbc_emit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_e_pbc_end_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_e_pbc_new_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_e_pbc_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_IMCC_int_from_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_IMCC_string_from__STRINGC __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_IMCC_string_from_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/pbc.c */

#endif /* PARROT_IMCC_PBC_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

