/* context.h
 *  Copyright (C) 2009-2011, Parrot Foundation.
 *  Overview:
 *     Context
 */

#ifndef PARROT_CONTEXT_H_GUARD
#define PARROT_CONTEXT_H_GUARD

#include "parrot/string.h"
#include "parrot/compiler.h"

struct PackFile_ConstTable;

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

#define CONTEXT_STRUCT(c) (PMC_data_typed((c), Parrot_Context *))

/*
 * Macros to make accessing registers more convenient/readable.
 */

#ifndef NDEBUG
#  define CTX_REG_PMC(i, p, x) (*Parrot_pcc_get_PMC_reg((i), (p), (x)))
#  define CTX_REG_STR(i, p, x) (*Parrot_pcc_get_STRING_reg((i), (p), (x)))
#  define CTX_REG_NUM(i, p, x) (*Parrot_pcc_get_FLOATVAL_reg((i), (p), (x)))
#  define CTX_REG_INT(i, p, x) (*Parrot_pcc_get_INTVAL_reg((i), (p), (x)))
#else /* NDEBUG */
/* Manually inlined macros. Used in optimized builds */
#  define CTX_REG_PMC(i, p, x) (CONTEXT_STRUCT(p)->bp_ps.regs_p[-1L - (x)])
#  define CTX_REG_STR(i, p, x) (CONTEXT_STRUCT(p)->bp_ps.regs_s[(x)])
#  define CTX_REG_NUM(i, p, x) (CONTEXT_STRUCT(p)->bp.regs_n[-1L - (x)])
#  define CTX_REG_INT(i, p, x) (CONTEXT_STRUCT(p)->bp.regs_i[(x)])
#endif

#define REG_NUM(interp, x) CTX_REG_NUM((interp), (interp)->ctx, (x))
#define REG_INT(interp, x) CTX_REG_INT((interp), (interp)->ctx, (x))
#define REG_PMC(interp, x) CTX_REG_PMC((interp), (interp)->ctx, (x))
#define REG_STR(interp, x) CTX_REG_STR((interp), (interp)->ctx, (x))


#define REGNO_INT 0
#define REGNO_NUM 1
#define REGNO_STR 2
#define REGNO_PMC 3

/* Context accessors functions */

/*
 * For optimized builds we provide macros which directly poke into
 * Parrot_Context.
 */

/* HEADERIZER BEGIN: src/call/context_accessors.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
UINTVAL Parrot_pcc_dec_recursion_depth_func(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_errors_off_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_errors_on_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL Parrot_pcc_errors_test_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_caller_ctx_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_PURE_FUNCTION
Parrot_Context* Parrot_pcc_get_context_struct_func(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ctx));

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_continuation_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_handlers_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
INTVAL Parrot_pcc_get_HLL_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_pcc_get_lex_pad_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_namespace_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
FLOATVAL Parrot_pcc_get_num_constant_func(PARROT_INTERP,
    ARGIN(const PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
FLOATVAL * Parrot_pcc_get_num_constants_func(PARROT_INTERP,
    ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_object_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_outer_ctx_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
opcode_t* Parrot_pcc_get_pc_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_pmc_constant_func(PARROT_INTERP,
    ARGIN(const PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
PMC ** Parrot_pcc_get_pmc_constants_func(PARROT_INTERP,
    ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL Parrot_pcc_get_recursion_depth_func(PARROT_INTERP,
    ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_signature_func(PARROT_INTERP, ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
STRING ** Parrot_pcc_get_str_constants_func(PARROT_INTERP,
    ARGIN(const PMC *ctx))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
STRING* Parrot_pcc_get_string_constant_func(PARROT_INTERP,
    ARGIN(const PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_inc_recursion_depth_func(PARROT_INTERP, ARGIN(PMC *ctx))
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
    ARGIN(const struct PackFile_ConstTable *ct))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

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
    ARGIN(const PMC *ctx),
    ARGIN_NULLOK(opcode_t *pc))
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
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_trace_flags_on_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL Parrot_pcc_trace_flags_test_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_warnings_off_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_warnings_on_func(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL Parrot_pcc_warnings_test_func(PARROT_INTERP,
    ARGIN(const PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_pcc_dec_recursion_depth_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_errors_off_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_errors_on_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_errors_test_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_caller_ctx_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_context_struct_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_pcc_get_continuation_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_handlers_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_HLL_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_lex_pad_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_namespace_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_num_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_num_constants_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_object_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_outer_ctx_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_pc_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_pmc_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_pmc_constants_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_recursion_depth_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_signature_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_str_constants_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_get_string_constant_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_inc_recursion_depth_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_caller_ctx_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(caller_ctx))
#define ASSERT_ARGS_Parrot_pcc_set_constants_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(ct))
#define ASSERT_ARGS_Parrot_pcc_set_continuation_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_set_handlers_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(handlers))
#define ASSERT_ARGS_Parrot_pcc_set_HLL_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
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
#define ASSERT_ARGS_Parrot_pcc_set_signature_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_trace_flags_off_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_trace_flags_on_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_trace_flags_test_func \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_warnings_off_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_warnings_on_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_pcc_warnings_test_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ctx))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/context_accessors.c */

/* Map Context manipulating functions to functions or macros */
#ifdef NDEBUG
#  define Parrot_pcc_get_context_struct(i, c) CONTEXT_STRUCT(c)

#  define Parrot_pcc_get_num_constants(i, c) (CONTEXT_STRUCT(c)->num_constants)
#  define Parrot_pcc_get_str_constants(i, c) (CONTEXT_STRUCT(c)->str_constants)
#  define Parrot_pcc_get_pmc_constants(i, c) (CONTEXT_STRUCT(c)->pmc_constants)
#  define Parrot_pcc_set_constants(i, c, ct) do { \
    CONTEXT_STRUCT(c)->num_constants = (ct)->num.constants; \
    CONTEXT_STRUCT(c)->str_constants = (ct)->str.constants; \
    CONTEXT_STRUCT(c)->pmc_constants = (ct)->pmc.constants; \
} while (0)

#  define Parrot_pcc_get_continuation(i, c) (CONTEXT_STRUCT(c)->current_cont)
#  define Parrot_pcc_get_caller_ctx(i, c) (CONTEXT_STRUCT(c)->caller_ctx)
#  define Parrot_pcc_get_namespace(i, c) (CONTEXT_STRUCT(c)->current_namespace)
#  define Parrot_pcc_get_object(i, c) (CONTEXT_STRUCT(c)->current_object)
#  define Parrot_pcc_get_lex_pad(i, c) (CONTEXT_STRUCT(c)->lex_pad)
#  define Parrot_pcc_get_handlers(i, c) (CONTEXT_STRUCT(c)->handlers)

#  define Parrot_pcc_get_pc(i, c) (CONTEXT_STRUCT(c)->current_pc)
#  define Parrot_pcc_set_pc(i, c, value) (CONTEXT_STRUCT(c)->current_pc = (value))

#  define Parrot_pcc_get_HLL(i, c) (CONTEXT_STRUCT(c)->current_HLL)
#  define Parrot_pcc_set_HLL(i, c, value) (CONTEXT_STRUCT(c)->current_HLL = (value))

#  define Parrot_pcc_get_outer_ctx(i, c) (CONTEXT_STRUCT(c)->outer_ctx)

#  define Parrot_pcc_get_signature(i, c) (CONTEXT_STRUCT(c)->current_sig)

#  define Parrot_pcc_get_num_constant(i, c, idx) (CONTEXT_STRUCT(c)->num_constants[(idx)])
#  define Parrot_pcc_get_string_constant(i, c, idx) (CONTEXT_STRUCT(c)->str_constants[(idx)])
#  define Parrot_pcc_get_pmc_constant(i, c, idx) (CONTEXT_STRUCT(c)->pmc_constants[(idx)])

#  define Parrot_pcc_get_recursion_depth(i, c) (CONTEXT_STRUCT(c)->recursion_depth)
#  define Parrot_pcc_dec_recursion_depth(i, c) (--CONTEXT_STRUCT(c)->recursion_depth)
#  define Parrot_pcc_inc_recursion_depth(i, c) (CONTEXT_STRUCT(c)->recursion_depth++)

#  define Parrot_pcc_warnings_on(i, c, flags)   (CONTEXT_STRUCT(c)->warns |= (flags))
#  define Parrot_pcc_warnings_off(i, c, flags)  (CONTEXT_STRUCT(c)->warns &= ~(flags))
#  define Parrot_pcc_warnings_test(i, c, flags) (CONTEXT_STRUCT(c)->warns & (flags))

#  define Parrot_pcc_errors_on(i, c, flags)     (CONTEXT_STRUCT(c)->errors |= (flags))
#  define Parrot_pcc_errors_off(i, c, flags)    (CONTEXT_STRUCT(c)->errors &= ~(flags))
#  define Parrot_pcc_errors_test(i, c, flags)   (CONTEXT_STRUCT(c)->errors & (flags))

#  define Parrot_pcc_trace_flags_on(i, c, flags)     (CONTEXT_STRUCT(c)->trace_flags |= (flags))
#  define Parrot_pcc_trace_flags_off(i, c, flags)    (CONTEXT_STRUCT(c)->trace_flags &= ~(flags))
#  define Parrot_pcc_trace_flags_test(i, c, flags)   (CONTEXT_STRUCT(c)->trace_flags & (flags))

#else

#  define Parrot_pcc_get_context_struct(i, c) Parrot_pcc_get_context_struct_func((i), (c))

#  define Parrot_pcc_get_num_constants(i, c) Parrot_pcc_get_num_constants_func((i), (c))
#  define Parrot_pcc_get_str_constants(i, c) Parrot_pcc_get_str_constants_func((i), (c))
#  define Parrot_pcc_get_pmc_constants(i, c) Parrot_pcc_get_pmc_constants_func((i), (c))
#  define Parrot_pcc_set_constants(i, c, value) Parrot_pcc_set_constants_func((i), (c), (value))

#  define Parrot_pcc_get_continuation(i, c) Parrot_pcc_get_continuation_func((i), (c))

#  define Parrot_pcc_get_caller_ctx(i, c) Parrot_pcc_get_caller_ctx_func((i), (c))

#  define Parrot_pcc_get_namespace(i, c) Parrot_pcc_get_namespace_func((i), (c))

#  define Parrot_pcc_get_pc(i, c) Parrot_pcc_get_pc_func((i), (c))
#  define Parrot_pcc_set_pc(i, c, value) Parrot_pcc_set_pc_func((i), (c), (value))

#  define Parrot_pcc_get_HLL(i, c) Parrot_pcc_get_HLL_func((i), (c))
#  define Parrot_pcc_set_HLL(i, c, value) Parrot_pcc_set_HLL_func((i), (c), (value))

#  define Parrot_pcc_get_object(i, c) Parrot_pcc_get_object_func((i), (c))

#  define Parrot_pcc_get_lex_pad(i, c) Parrot_pcc_get_lex_pad_func((i), (c))

#  define Parrot_pcc_get_handlers(i, c) Parrot_pcc_get_handlers_func((i), (c))

#  define Parrot_pcc_get_outer_ctx(i, c) Parrot_pcc_get_outer_ctx_func((i), (c))

#  define Parrot_pcc_get_signature(i, c) Parrot_pcc_get_signature_func((i), (c))

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


#ifdef NDEBUG
#  define Parrot_pcc_set_continuation(i, c, value) do { \
        CONTEXT_STRUCT(c)->current_cont = (value);      \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_caller_ctx(i, c, value) do {   \
        CONTEXT_STRUCT(c)->caller_ctx = (value);        \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_namespace(i, c, value) do {    \
        CONTEXT_STRUCT(c)->current_namespace = (value); \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_object(i, c, value) do {       \
        CONTEXT_STRUCT(c)->current_object = (value);    \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_lex_pad(i, c, value) do {      \
        CONTEXT_STRUCT(c)->lex_pad = (value);           \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_handlers(i, c, value) do {     \
        CONTEXT_STRUCT(c)->handlers = (value);          \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_outer_ctx(i, c, value) do {    \
        CONTEXT_STRUCT(c)->outer_ctx = (value);         \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_signature(i, c, value) do {    \
        CONTEXT_STRUCT(c)->current_sig = (value);       \
        PARROT_GC_WRITE_BARRIER((i), (c));              \
    } while (0)
#  define Parrot_pcc_set_context(i, c)   do {           \
        CURRENT_CONTEXT(i) = (c);                       \
    } while (0)
#else
#  define Parrot_pcc_set_continuation(i, c, value) Parrot_pcc_set_continuation_func((i), (c), (value))
#  define Parrot_pcc_set_caller_ctx(i, c, value) Parrot_pcc_set_caller_ctx_func((i), (c), (value))
#  define Parrot_pcc_set_namespace(i, c, value) Parrot_pcc_set_namespace_func((i), (c), (value))
#  define Parrot_pcc_set_object(i, c, value) Parrot_pcc_set_object_func((i), (c), (value))
#  define Parrot_pcc_set_lex_pad(i, c, value) Parrot_pcc_set_lex_pad_func((i), (c), (value))
#  define Parrot_pcc_set_handlers(i, c, value) Parrot_pcc_set_handlers_func((i), (c), (value))
#  define Parrot_pcc_set_outer_ctx(i, c, value) Parrot_pcc_set_outer_ctx_func((i), (c), (value))
#  define Parrot_pcc_set_signature(i, c, value) Parrot_pcc_set_signature_func((i), (c), (value))
#  define Parrot_pcc_set_context(i, c)   Parrot_pcc_set_context_func((i), (c))
#endif /* ifdef NDEBUG */

#endif /* PARROT_CONTEXT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
