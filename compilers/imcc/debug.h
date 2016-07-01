/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

#ifndef PARROT_IMCC_DEBUG_H_GUARD
#define PARROT_IMCC_DEBUG_H_GUARD


#define DEBUG_PARROT 0x0001
#define DEBUG_LEXER  0x0002
#define DEBUG_PARSER 0x0004
#define DEBUG_IMC    0x0008
#define DEBUG_CFG    0x0010
#define DEBUG_OPT1   0x0020
#define DEBUG_OPT2   0x0040
#define DEBUG_SPILL  0x0080

#define DEBUG_AST    0x0100
#define DEBUG_REG    0x0200
#define DEBUG_REG2   0x0400

#define DEBUG_PBC    0x1000
#define DEBUG_PBC_CONST    0x2000
#define DEBUG_PBC_FIXUP    0x4000

/* HEADERIZER BEGIN: compilers/imcc/debug.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void dump_cfg(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_dominance_frontiers(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_dominators(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_instructions(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

void dump_labels(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_loops(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void dump_symreg(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void IMCC_debug(
    ARGMOD(imc_info_t * imcc),
    int level,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

PARROT_DOES_NOT_RETURN
void IMCC_fatal(
    ARGMOD(imc_info_t * imcc),
    int code,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

PARROT_DOES_NOT_RETURN
void IMCC_fatal_standalone(
    ARGMOD(imc_info_t * imcc),
    int code,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

PARROT_DOES_NOT_RETURN
void IMCC_fataly(
    ARGMOD(imc_info_t * imcc),
    int code,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

void IMCC_info(
    ARGMOD(imc_info_t * imcc),
    int level,
    ARGIN(const char *fmt),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

void IMCC_warning(ARGMOD(imc_info_t * imcc), ARGIN(const char *fmt), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

#define ASSERT_ARGS_dump_cfg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dump_dominance_frontiers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dump_dominators __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dump_instructions __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dump_labels __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dump_loops __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dump_symreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_IMCC_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fmt))
#define ASSERT_ARGS_IMCC_fatal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fmt))
#define ASSERT_ARGS_IMCC_fatal_standalone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fmt))
#define ASSERT_ARGS_IMCC_fataly __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fmt))
#define ASSERT_ARGS_IMCC_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fmt))
#define ASSERT_ARGS_IMCC_warning __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fmt))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/debug.c */


#endif /* PARROT_IMCC_DEBUG_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
