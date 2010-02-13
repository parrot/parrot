/* context.h
 *  Copyright (C) 2009-2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Context
 */

#ifndef PARROT_CONTEXT_H_GUARD
#define PARROT_CONTEXT_H_GUARD

#include "parrot/string.h"
#include "parrot/compiler.h"

struct PackFile_Constant;

typedef union {
    PMC         **regs_p;
    STRING      **regs_s;
} Regs_ps;

typedef union {
    FLOATVAL     *regs_n;
    INTVAL       *regs_i;
} Regs_ni;

#include "pmc/pmc_callcontext.h"
typedef struct Parrot_CallContext_attributes Parrot_Context;

/*
 * Macros to make accessing registers more convenient/readable.
 */

#ifndef NDEBUG

#  define CTX_REG_NUM(p, x) (*Parrot_pcc_get_FLOATVAL_reg(interp, (p), (x)))
#  define CTX_REG_INT(p, x) (*Parrot_pcc_get_INTVAL_reg(interp, (p), (x)))
#  define CTX_REG_PMC(p, x) (*Parrot_pcc_get_PMC_reg(interp, (p), (x)))
#  define CTX_REG_STR(p, x) (*Parrot_pcc_get_STRING_reg(interp, (p), (x)))

#  define REG_NUM(interp, x) (*Parrot_pcc_get_FLOATVAL_reg((interp), (interp)->ctx, (x)))
#  define REG_INT(interp, x) (*Parrot_pcc_get_INTVAL_reg((interp), (interp)->ctx, (x)))
#  define REG_PMC(interp, x) (*Parrot_pcc_get_PMC_reg((interp), (interp)->ctx, (x)))
#  define REG_STR(interp, x) (*Parrot_pcc_get_STRING_reg((interp), (interp)->ctx, (x)))

#else /* NDEBUG */

/* Manually inlined macros. Used in optimised builds */

#  define __C(c) (PMC_data_typed((c), Parrot_Context*))

#  define CTX_REG_NUM(p, x) (__C(p)->bp.regs_n[-1L - (x)])
#  define CTX_REG_INT(p, x) (__C(p)->bp.regs_i[(x)])
#  define CTX_REG_PMC(p, x) (__C(p)->bp_ps.regs_p[-1L - (x)])
#  define CTX_REG_STR(p, x) (__C(p)->bp_ps.regs_s[(x)])

#  define REG_NUM(interp, x) CTX_REG_NUM((interp)->ctx, (x))
#  define REG_INT(interp, x) CTX_REG_INT((interp)->ctx, (x))
#  define REG_PMC(interp, x) CTX_REG_PMC((interp)->ctx, (x))
#  define REG_STR(interp, x) CTX_REG_STR((interp)->ctx, (x))

#endif

/*
 * and a set of macros to access a register by offset, used
 * in JIT emit prederef code
 * The offsets are relative to interp->ctx.bp.
 *
 * Reg order in imcc/reg_alloc.c is "INSP"   TODO make defines
 */

#define REGNO_INT 0
#define REGNO_NUM 1
#define REGNO_STR 2
#define REGNO_PMC 3

#define __CTX Parrot_pcc_get_context_struct(interp, interp->ctx)
#define _SIZEOF_INTS    (sizeof (INTVAL) * __CTX->n_regs_used[REGNO_INT])
#define _SIZEOF_NUMS    (sizeof (FLOATVAL) * __CTX->n_regs_used[REGNO_NUM])
#define _SIZEOF_PMCS    (sizeof (PMC*) * __CTX->n_regs_used[REGNO_PMC])
#define _SIZEOF_STRS    (sizeof (STRING*) * __CTX->n_regs_used[REGNO_STR])

#define REG_OFFS_NUM(x) (sizeof (FLOATVAL) * (-1L - (x)))
#define REG_OFFS_INT(x) (sizeof (INTVAL) * (x))
#define REG_OFFS_PMC(x) (_SIZEOF_INTS + sizeof (PMC*) * \
        (__CTX->n_regs_used[REGNO_PMC] - 1L - (x)))
#define REG_OFFS_STR(x) (sizeof (STRING*) * (x) + _SIZEOF_INTS + _SIZEOF_PMCS)


/* Context accessors functions */

/*
 * For optimised builds we provide macros which directly poke into
 * Parrot_Context.
 */

/* HEADERIZER BEGIN: src/call/context_accessors.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
UINTVAL Parrot_pcc_dec_recursion_depth_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_errors_off_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_errors_on_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_errors_test_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_caller_ctx_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
struct PackFile_Constant ** Parrot_pcc_get_constants_func(PARROT_INTERP,
    ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_Context* Parrot_pcc_get_context_struct_func(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ctx))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_continuation_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_handlers_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_pcc_get_HLL_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
INTVAL Parrot_pcc_get_int_constant_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_pcc_get_lex_pad_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_namespace_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
FLOATVAL Parrot_pcc_get_num_constant_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_object_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_outer_ctx_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t* Parrot_pcc_get_pc_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_pmc_constant_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
size_t Parrot_pcc_get_pred_offset_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_get_recursion_depth_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_results_signature_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_signature_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING* Parrot_pcc_get_string_constant_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_inc_recursion_depth_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_caller_ctx_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *caller_ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void Parrot_pcc_set_constants_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(struct PackFile_Constant **constants))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_continuation_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *_continuation))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_handlers_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *handlers))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_HLL_func(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL hll)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_lex_pad_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *lex_pad))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_namespace_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *_namespace))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_object_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *object))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_outer_ctx_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *outer_ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_pc_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_pred_offset_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    size_t pred_offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_results_signature_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_signature_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *sig_object))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_trace_flags_off_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_trace_flags_on_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_trace_flags_test_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_warnings_off_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_warnings_on_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_warnings_test_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_pcc_dec_recursion_depth_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_errors_off_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_errors_on_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_errors_test_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_caller_ctx_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_constants_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_context_struct_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pcc_get_continuation_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_handlers_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_HLL_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_int_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_lex_pad_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_namespace_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_num_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_object_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_outer_ctx_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_pc_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_pmc_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_pred_offset_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_recursion_depth_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_results_signature_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_signature_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_string_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_inc_recursion_depth_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_caller_ctx_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(caller_ctx))
#define ASSERT_ARGS_Parrot_pcc_set_constants_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_continuation_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_handlers_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(handlers))
#define ASSERT_ARGS_Parrot_pcc_set_HLL_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_lex_pad_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(lex_pad))
#define ASSERT_ARGS_Parrot_pcc_set_namespace_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_object_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_outer_ctx_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(outer_ctx))
#define ASSERT_ARGS_Parrot_pcc_set_pc_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_pred_offset_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_results_signature_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_signature_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_trace_flags_off_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_trace_flags_on_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_trace_flags_test_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_warnings_off_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_warnings_on_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_warnings_test_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/context_accessors.c */

/* Map Context manipulating functions to functions or macros */
#ifdef NDEBUG
#  define Parrot_pcc_get_context_struct(i, c) (PMC_data_typed((c), Parrot_Context*))

#  define Parrot_pcc_get_constants(i, c) (__C(c)->constants)
#  define Parrot_pcc_set_constants(i, c, value) (__C(c)->constants = (value))

#  define Parrot_pcc_get_continuation(i, c) (__C(c)->current_cont)
#  define Parrot_pcc_set_continuation(i, c, value) (__C(c)->current_cont = (value))

#  define Parrot_pcc_get_caller_ctx(i, c) (__C(c)->caller_ctx)
#  define Parrot_pcc_set_caller_ctx(i, c, value) (__C(c)->caller_ctx = (value))

#  define Parrot_pcc_get_results_signature(i, c) (__C(c)->results_signature)
#  define Parrot_pcc_set_results_signature(i, c, value) (__C(c)->results_signature = (value))

#  define Parrot_pcc_get_namespace(i, c) (__C(c)->current_namespace)
#  define Parrot_pcc_set_namespace(i, c, value) (__C(c)->current_namespace = (value))

#  define Parrot_pcc_get_pred_offset(i, c) (__C(c)->pred_offset)
#  define Parrot_pcc_set_pred_offset(i, c, value) (__C(c)->pred_offset = (value))

#  define Parrot_pcc_get_pc(i, c) (__C(c)->current_pc)
#  define Parrot_pcc_set_pc(i, c, value) (__C(c)->current_pc = (value))

#  define Parrot_pcc_get_HLL(i, c) (__C(c)->current_HLL)
#  define Parrot_pcc_set_HLL(i, c, value) (__C(c)->current_HLL = (value))

#  define Parrot_pcc_get_object(i, c) (__C(c)->current_object)
#  define Parrot_pcc_set_object(i, c, value) (__C(c)->current_object = (value))

#  define Parrot_pcc_get_lex_pad(i, c) (__C(c)->lex_pad)
#  define Parrot_pcc_set_lex_pad(i, c, value) (__C(c)->lex_pad = (value))

#  define Parrot_pcc_get_handlers(i, c) (__C(c)->handlers)
#  define Parrot_pcc_set_handlers(i, c, value) (__C(c)->handlers = (value))

#  define Parrot_pcc_get_outer_ctx(i, c) (__C(c)->outer_ctx)
#  define Parrot_pcc_set_outer_ctx(i, c, value) (__C(c)->outer_ctx = (value))

#  define Parrot_pcc_get_signature(i, c) (__C(c)->current_sig)
#  define Parrot_pcc_set_signature(i, c, value) (__C(c)->current_sig = (value))

#  define Parrot_pcc_get_int_constant(i, c, idx) (__C(c)->constants[(idx)]->u.integer)
#  define Parrot_pcc_get_num_constant(i, c, idx) (__C(c)->constants[(idx)]->u.number)
#  define Parrot_pcc_get_string_constant(i, c, idx) (__C(c)->constants[(idx)]->u.string)
#  define Parrot_pcc_get_pmc_constant(i, c, idx) (__C(c)->constants[(idx)]->u.key)

#  define Parrot_pcc_get_recursion_depth(i, c) (__C(c)->recursion_depth)
#  define Parrot_pcc_dec_recursion_depth(i, c) (--__C(c)->recursion_depth)
#  define Parrot_pcc_inc_recursion_depth(i, c) (__C(c)->recursion_depth++)

#  define Parrot_pcc_warnings_on(i, c, flags)   (__C(c)->warns |= (flags))
#  define Parrot_pcc_warnings_off(i, c, flags)  (__C(c)->warns &= ~(flags))
#  define Parrot_pcc_warnings_test(i, c, flags) (__C(c)->warns & (flags))

#  define Parrot_pcc_errors_on(i, c, flags)     (__C(c)->errors |= (flags))
#  define Parrot_pcc_errors_off(i, c, flags)    (__C(c)->errors &= ~(flags))
#  define Parrot_pcc_errors_test(i, c, flags)   (__C(c)->errors & (flags))

#  define Parrot_pcc_trace_flags_on(i, c, flags)     (__C(c)->trace_flags |= (flags))
#  define Parrot_pcc_trace_flags_off(i, c, flags)    (__C(c)->trace_flags &= ~(flags))
#  define Parrot_pcc_trace_flags_test(i, c, flags)   (__C(c)->trace_flags & (flags))

#else

#  define Parrot_pcc_get_context_struct(i, c) Parrot_pcc_get_context_struct_func((i), (c))

#  define Parrot_pcc_get_constants(i, c) Parrot_pcc_get_constants_func((i), (c))
#  define Parrot_pcc_set_constants(i, c, value) Parrot_pcc_set_constants_func((i), (c), (value))

#  define Parrot_pcc_get_continuation(i, c) Parrot_pcc_get_continuation_func((i), (c))
#  define Parrot_pcc_set_continuation(i, c, value) Parrot_pcc_set_continuation_func((i), (c), (value))

#  define Parrot_pcc_get_caller_ctx(i, c) Parrot_pcc_get_caller_ctx_func((i), (c))
#  define Parrot_pcc_set_caller_ctx(i, c, value) Parrot_pcc_set_caller_ctx_func((i), (c), (value))

#  define Parrot_pcc_get_results_signature(i, c) Parrot_pcc_get_results_signature_func((i), (c))
#  define Parrot_pcc_set_results_signature(i, c, value) Parrot_pcc_set_results_signature_func((i), (c), (value))

#  define Parrot_pcc_get_namespace(i, c) Parrot_pcc_get_namespace_func((i), (c))
#  define Parrot_pcc_set_namespace(i, c, value) Parrot_pcc_set_namespace_func((i), (c), (value))

#  define Parrot_pcc_get_pred_offset(i, c) Parrot_pcc_get_pred_offset_func((i), (c))
#  define Parrot_pcc_set_pred_offset(i, c, value) Parrot_pcc_set_pred_offset_func((i), (c), (value))

#  define Parrot_pcc_get_pc(i, c) Parrot_pcc_get_pc_func((i), (c))
#  define Parrot_pcc_set_pc(i, c, value) Parrot_pcc_set_pc_func((i), (c), (value))

#  define Parrot_pcc_get_HLL(i, c) Parrot_pcc_get_HLL_func((i), (c))
#  define Parrot_pcc_set_HLL(i, c, value) Parrot_pcc_set_HLL_func((i), (c), (value))

#  define Parrot_pcc_get_object(i, c) Parrot_pcc_get_object_func((i), (c))
#  define Parrot_pcc_set_object(i, c, value) Parrot_pcc_set_object_func((i), (c), (value))

#  define Parrot_pcc_get_lex_pad(i, c) Parrot_pcc_get_lex_pad_func((i), (c))
#  define Parrot_pcc_set_lex_pad(i, c, value) Parrot_pcc_set_lex_pad_func((i), (c), (value))

#  define Parrot_pcc_get_handlers(i, c) Parrot_pcc_get_handlers_func((i), (c))
#  define Parrot_pcc_set_handlers(i, c, value) Parrot_pcc_set_handlers_func((i), (c), (value))

#  define Parrot_pcc_get_outer_ctx(i, c) Parrot_pcc_get_outer_ctx_func((i), (c))
#  define Parrot_pcc_set_outer_ctx(i, c, value) Parrot_pcc_set_outer_ctx_func((i), (c), (value))

#  define Parrot_pcc_get_signature(i, c) Parrot_pcc_get_signature_func((i), (c))
#  define Parrot_pcc_set_signature(i, c, value) Parrot_pcc_set_signature_func((i), (c), (value))

#  define Parrot_pcc_get_int_constant(i, c, idx) Parrot_pcc_get_int_constant_func((i), (c), (idx))
#  define Parrot_pcc_get_num_constant(i, c, idx) Parrot_pcc_get_num_constant_func((i), (c), (idx))
#  define Parrot_pcc_get_string_constant(i, c, idx) Parrot_pcc_get_string_constant_func((i), (c), (idx))
#  define Parrot_pcc_get_pmc_constant(i, c, idx) Parrot_pcc_get_pmc_constant_func((i), (c), (idx))

#  define Parrot_pcc_get_recursion_depth(i, c) Parrot_pcc_get_recursion_depth_func((i), (c))
#  define Parrot_pcc_dec_recursion_depth(i, c) Parrot_pcc_dec_recursion_depth_func((i), (c))
#  define Parrot_pcc_inc_recursion_depth(i, c) Parrot_pcc_inc_recursion_depth_func((i), (c))

#  define Parrot_pcc_warnings_on(i, c, flags) Parrot_pcc_warnings_on_func((i), (c), (flags))
#  define Parrot_pcc_warnings_off(i, c, flags) Parrot_pcc_warnings_off_func((i), (c), (flags))
#  define Parrot_pcc_warnings_test(i, c, flags) Parrot_pcc_warnings_test_func((i), (c), (flags))

#  define Parrot_pcc_errors_on(i, c, flags) Parrot_pcc_errors_on_func((i), (c), (flags))
#  define Parrot_pcc_errors_off(i, c, flags) Parrot_pcc_errors_off_func((i), (c), (flags))
#  define Parrot_pcc_errors_test(i, c, flags) Parrot_pcc_errors_test_func((i), (c), (flags))

#  define Parrot_pcc_trace_flags_on(i, c, flags) Parrot_pcc_trace_flags_on_func((i), (c), (flags))
#  define Parrot_pcc_trace_flags_off(i, c, flags) Parrot_pcc_trace_flags_off_func((i), (c), (flags))
#  define Parrot_pcc_trace_flags_test(i, c, flags) Parrot_pcc_trace_flags_test_func((i), (c), (flags))

#endif /* ifndef NDEBUG */


#endif /* PARROT_CONTEXT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
