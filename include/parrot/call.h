/* call.h
 *  Copyright (C) 2001-2008, Parrot Foundation.
 *  SVN Info
 *  $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *     Call argument handling.
 *  History:
 *     Initial version by leo on 2005/07/22
 *     Major changes by mdiep in April 2007
 *  Notes:
 *  References:
 *     pdd03 - Calling Conventions
 */

#ifndef PARROT_INTER_CALL_H_GUARD
#define PARROT_INTER_CALL_H_GUARD

#include "parrot/context.h"

/* Wrap the jump buffer in a struct, to make it a linked list. Jump buffers are
 * used to resume execution at a point in the runloop where an exception
 * handler can be run. Ultimately this information should be part of
 * Parrot_Context, but at this point a new context isn't created for every
 * runloop ID, so it still needs to be a separate stack for a while longer. */

typedef struct parrot_runloop_t {
    Parrot_jump_buff         resume;        /* jmp_buf */
    struct parrot_runloop_t *prev;          /* interpreter's runloop
                                             * jump buffer stack */
    opcode_t                *handler_start; /* Used in exception handling */
} parrot_runloop_t;

typedef parrot_runloop_t Parrot_runloop;

typedef enum call_state_mode {
    /* argument fetching/putting modes */
    CALL_STATE_SIG     = 0x100, /* runops, nci. In case we're interfacing with
                                   C and va_lists. */
    CALL_STATE_OP      = 0x200, /* get_, set_ ops. In case we're interfacing
                                   with Parrot code and get the signature from
                                   call_state_item.u.op. */
    CALL_S_D_MASK      = 0x300, /* src/dest mask */

    CALL_STATE_FLATTEN = 0x400  /* whether we are busy in a :flat argument */
} call_state_mode;

typedef struct call_state_item {
    /* We have one call_state_item for both the caller (source,
       arguments/returns) and the callee (destination, parameters/results). */
    int mode;                /* this specifies:
                             - where we get our arguments from / where we put
                               our parameters (from C code or from set_*,get_*)
                             - if we're in the middle of a :flat */

    union {
        struct {             /* In case the caller (or callee? FIXME) is C */
            void       *ap;  /* a ptr to va_list */
            const char *sig; /* C string describing the type of each argument */
        } sig;

        struct {             /* In case the caller/callee was Parrot code: */
            opcode_t *pc;    /* array of 'indexes' for each argument:
                               - if it's a constant, the constant number
                               - if it's a register, the register number */
            PMC *signature;  /* a PMC array holding a Call_bits_enum_t
                                signature for each argument */
        } op;
    } u;

    PMC   *ctx;              /* the source or destination context */
    INTVAL used;             /* src: whether this argument has been consumed
                              * (or: whether the previous arg has?) */
    INTVAL i;                /* number of args/params already processed */
    INTVAL n;                /* number of args/params to match.
                              * may include :slurpys and :flats */
    INTVAL sig;              /* type of current arg/param
                              * (counting from 1, the i'th) */

    /* We might encounter a :flat. */
    /* FIXME bgeron: is this used for :slurpys?
     * I can't find a reference in slurpy-filling code. */

    PMC   *slurp;             /* PMC in which to put the args we slurp up
                               * or source from where to flatten */
    INTVAL slurp_i;           /* index of :flat/:slurpy arg/param to match */
    INTVAL slurp_n;           /* number of :flat/:slurpy args/params to match */
} call_state_item;

typedef union UnionCallStateVal {
    struct _ptrs {               /* or two pointers, both are defines */
        DPOINTER * _struct_val;
        PMC *      _pmc_val;
    } _ptrs;
    struct _i {
        INTVAL _int_val;         /* or 2 intvals */
        INTVAL _int_val2;
    } _i;
    FLOATVAL _num_val;                       /* or one float */
    struct parrot_string_t * _string_val;    /* or a pointer to a string */
} UnionCallStateVal;

#define UVal_ptr(u)       (u)._ptrs._struct_val
#define UVal_pmc(u)       (u)._ptrs._pmc_val
#define UVal_int(u)       (u)._i._int_val
#define UVal_int2(u)      (u)._i._int_val2
#define UVal_num(u)       (u)._num_val
#define UVal_str(u)       (u)._string_val

typedef struct call_state {
    call_state_item src;
    call_state_item dest;
    UnionCallStateVal val;
    int n_actual_args;  /* arguments incl. flatten */
    int optionals;      /* sum of optionals */
    int params;         /* sum of params */
    int first_named;    /* param idx of 1st named */
    UINTVAL named_done; /* bit mask, 1 if named was assigned */
    STRING *name;       /* name of argument if any */
    PMC *key;           /* to iterate a flattening hash */
} call_state;

typedef enum arg_pass_t {
    PARROT_PASS_PARAMS          = 0x00,
    PARROT_PASS_RESULTS         = 0x01
} arg_pass_t;

/* HEADERIZER BEGIN: src/call/pcc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_convert_arg(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

PARROT_EXPORT
int Parrot_fetch_arg(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

PARROT_EXPORT
int Parrot_fetch_arg_nci(PARROT_INTERP, ARGMOD(call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

PARROT_EXPORT
int Parrot_init_arg_indexes_and_sig_pmc(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(opcode_t *indexes),
    ARGIN_NULLOK(PMC *sig_pmc),
    ARGMOD(call_state_item *sti))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*sti);

PARROT_EXPORT
void Parrot_init_arg_nci(PARROT_INTERP,
    ARGOUT(call_state *st),
    ARGIN(const char *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*st);

PARROT_EXPORT
int Parrot_init_arg_op(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(opcode_t *pc),
    ARGIN(call_state_item *sti))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_EXPORT
int Parrot_init_arg_sig(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(const char *sig),
    ARGIN_NULLOK(void *ap),
    ARGMOD(call_state_item *sti))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*sti);

PARROT_EXPORT
void Parrot_init_ret_nci(PARROT_INTERP,
    ARGOUT(call_state *st),
    ARGIN(const char *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*st);

PARROT_EXPORT
void parrot_pass_args(PARROT_INTERP,
    ARGMOD(PMC *src_ctx),
    ARGMOD(PMC *dest_ctx),
    ARGMOD_NULLOK(opcode_t *src_indexes),
    ARGMOD_NULLOK(opcode_t *dest_indexes),
    arg_pass_t param_or_result)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*src_ctx)
        FUNC_MODIFIES(*dest_ctx)
        FUNC_MODIFIES(*src_indexes)
        FUNC_MODIFIES(*dest_indexes);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_pcc_build_sig_object_from_varargs(PARROT_INTERP,
    ARGIN_NULLOK(PMC *obj),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_invoke_from_sig_object(PARROT_INTERP,
    ARGIN(PMC *sub_obj),
    ARGIN(PMC *sig_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_invoke_method_from_c_args(PARROT_INTERP,
    ARGIN(PMC* pmc),
    ARGMOD(STRING *method_name),
    ARGIN(const char *signature),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*method_name);

PARROT_EXPORT
void Parrot_pcc_invoke_sub_from_c_args(PARROT_INTERP,
    ARGIN(PMC *sub_obj),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_PCCINVOKE(PARROT_INTERP,
    ARGIN(PMC* pmc),
    ARGMOD(STRING *method_name),
    ARGIN(const char *signature),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*method_name);

PARROT_EXPORT
void Parrot_process_args(PARROT_INTERP,
    ARGMOD(call_state *st),
    arg_pass_t param_or_result)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*st);

PARROT_EXPORT
int Parrot_store_arg(PARROT_INTERP, ARGIN(const call_state *st))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
opcode_t * parrot_pass_args_fromc(PARROT_INTERP,
    ARGIN(const char *sig),
    ARGMOD(opcode_t *dest),
    ARGIN(PMC *old_ctxp),
    va_list ap)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*dest);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * set_retval(PARROT_INTERP, int sig_ret, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

FLOATVAL set_retval_f(PARROT_INTERP, int sig_ret, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

INTVAL set_retval_i(PARROT_INTERP, int sig_ret, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* set_retval_p(PARROT_INTERP, int sig_ret, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING* set_retval_s(PARROT_INTERP, int sig_ret, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_convert_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_Parrot_fetch_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_Parrot_fetch_arg_nci __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_Parrot_init_arg_indexes_and_sig_pmc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(sti)
#define ASSERT_ARGS_Parrot_init_arg_nci __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_init_arg_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(sti)
#define ASSERT_ARGS_Parrot_init_arg_sig __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(sig) \
    || PARROT_ASSERT_ARG(sti)
#define ASSERT_ARGS_Parrot_init_ret_nci __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_parrot_pass_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(src_ctx) \
    || PARROT_ASSERT_ARG(dest_ctx)
#define ASSERT_ARGS_Parrot_pcc_build_sig_object_from_varargs \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_pcc_invoke_from_sig_object \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub_obj) \
    || PARROT_ASSERT_ARG(sig_obj)
#define ASSERT_ARGS_Parrot_pcc_invoke_method_from_c_args \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc) \
    || PARROT_ASSERT_ARG(method_name) \
    || PARROT_ASSERT_ARG(signature)
#define ASSERT_ARGS_Parrot_pcc_invoke_sub_from_c_args \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub_obj) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_PCCINVOKE __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc) \
    || PARROT_ASSERT_ARG(method_name) \
    || PARROT_ASSERT_ARG(signature)
#define ASSERT_ARGS_Parrot_process_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_Parrot_store_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(st)
#define ASSERT_ARGS_parrot_pass_args_fromc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sig) \
    || PARROT_ASSERT_ARG(dest) \
    || PARROT_ASSERT_ARG(old_ctxp)
#define ASSERT_ARGS_set_retval __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_set_retval_f __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_set_retval_i __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_set_retval_p __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_set_retval_s __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/pcc.c */

/* HEADERIZER BEGIN: src/call/ops.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void free_runloop_jump_point(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void new_runloop_jump_point(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void * Parrot_run_meth_fromc(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    SHIM(STRING *meth))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void* Parrot_run_meth_fromc_arglist(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    ARGIN(STRING *meth),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL /*@alt void@*/
Parrot_run_meth_fromc_arglist_retf(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    ARGIN(STRING *meth),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
INTVAL /*@alt void@*/
Parrot_run_meth_fromc_arglist_reti(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    ARGIN(STRING *meth),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void* Parrot_run_meth_fromc_args(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    ARGIN(STRING *meth),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL /*@alt void@*/
Parrot_run_meth_fromc_args_retf(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    ARGIN(STRING *meth),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_run_meth_fromc_args_reti(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN_NULLOK(PMC *obj),
    ARGIN(STRING *meth),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_runops_fromc(PARROT_INTERP, ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void * Parrot_runops_fromc_arglist(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL /*@alt void@*/
Parrot_runops_fromc_arglist_retf(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_runops_fromc_arglist_reti(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_runops_fromc_args(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
void * Parrot_runops_fromc_args_event(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
FLOATVAL /*@alt void@*/
Parrot_runops_fromc_args_retf(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_runops_fromc_args_reti(PARROT_INTERP,
    ARGIN(PMC *sub),
    ARGIN(const char *sig),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void destroy_runloop_jump_points(PARROT_INTERP)
        __attribute__nonnull__(1);

void really_destroy_runloop_jump_points(
    ARGIN_NULLOK(Parrot_runloop *jump_point));

void runops(PARROT_INTERP, size_t offs)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_free_runloop_jump_point __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_runloop_jump_point __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_run_meth_fromc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub)
#define ASSERT_ARGS_Parrot_run_meth_fromc_arglist __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_run_meth_fromc_arglist_retf \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_run_meth_fromc_arglist_reti \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_run_meth_fromc_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_run_meth_fromc_args_retf \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_run_meth_fromc_args_reti \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub)
#define ASSERT_ARGS_Parrot_runops_fromc_arglist __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc_arglist_retf \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc_arglist_reti \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc_args __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc_args_event \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc_args_retf __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_Parrot_runops_fromc_args_reti __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub) \
    || PARROT_ASSERT_ARG(sig)
#define ASSERT_ARGS_destroy_runloop_jump_points __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_really_destroy_runloop_jump_points \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_runops __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/ops.c */

#define ASSERT_SIG_PMC(sig) do {\
    PARROT_ASSERT(!PMC_IS_NULL(sig)); \
    PARROT_ASSERT(PObj_is_PMC_TEST(sig)); \
    PARROT_ASSERT((sig)->vtable->base_type == enum_class_FixedIntegerArray); \
} while (0)

/* XXX Remove interp from this */
#define ADD_OP_VAR_PART(interp, seg, pc, n) do { \
    if (*(pc) == PARROT_OP_set_args_pc || \
            *(pc) == PARROT_OP_get_results_pc || \
            *(pc) == PARROT_OP_get_params_pc || \
            *(pc) == PARROT_OP_set_returns_pc) { \
        PMC * const sig = (seg)->const_table->constants[(pc)[1]]->u.key; \
        (n) += VTABLE_elements((interp), sig); \
    } \
} while (0)

/* Context manipulating functions */

/* HEADERIZER BEGIN: src/call/context.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_clear_i(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_clear_n(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_clear_p(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_clear_s(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
struct PackFile_Constant ** Parrot_pcc_constants(PARROT_INTERP,
    ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_dec_recursion_depth(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_errors_off(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_errors_on(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_errors_test(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_caller_ctx(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_Context* Parrot_pcc_get_context_struct(PARROT_INTERP,
    ARGIN_NULLOK(PMC *ctx))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_continuation(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
FLOATVAL * Parrot_pcc_get_FLOATVAL_reg(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_handlers(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_pcc_get_HLL(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
INTVAL Parrot_pcc_get_int_constant(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
INTVAL * Parrot_pcc_get_INTVAL_reg(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_pcc_get_lex_pad(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_namespace(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
FLOATVAL Parrot_pcc_get_num_constant(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_object(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_outer_ctx(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t* Parrot_pcc_get_pc(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_pmc_constant(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC ** Parrot_pcc_get_PMC_reg(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
size_t Parrot_pcc_get_pred_offset(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_get_recursion_depth(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Regs_ni* Parrot_pcc_get_regs_ni(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Regs_ps* Parrot_pcc_get_regs_ps(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_get_regs_used(PARROT_INTERP, ARGIN(PMC *ctx), int type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t* Parrot_pcc_get_results(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_results_signature(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING* Parrot_pcc_get_string_constant(PARROT_INTERP,
    ARGIN(PMC *ctx),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING ** Parrot_pcc_get_STRING_reg(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_get_sub(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_inc_recursion_depth(PARROT_INTERP, ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_caller_ctx(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *caller_ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void Parrot_pcc_set_constants(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(struct PackFile_Constant **constants))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_continuation(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *_continuation))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_handers(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *handlers))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_HLL(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL hll)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_lex_pad(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *lex_pad))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_namespace(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *_namespace))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_object(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *object))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_outer_ctx(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(PMC *outer_ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_pc(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_pred_offset(PARROT_INTERP,
    ARGIN(PMC *ctx),
    size_t pred_offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void Parrot_pcc_set_regs_ni(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(Regs_ni *bp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void Parrot_pcc_set_regs_ps(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN(Regs_ps *bp_ps))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pcc_set_regs_used(PARROT_INTERP,
    ARGIN(PMC *ctx),
    int type,
    INTVAL num)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_results(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_results_signature(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_set_sub(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_trace_flags_off(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_trace_flags_on(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_trace_flags_test(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_warnings_off(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_warnings_on(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
UINTVAL Parrot_pcc_warnings_test(PARROT_INTERP,
    ARGIN(PMC *ctx),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pop_context(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_push_context(PARROT_INTERP, ARGIN(const INTVAL *n_regs_used))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void create_initial_context(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_alloc_context(PARROT_INTERP,
    ARGIN(const INTVAL *number_regs_used),
    ARGIN_NULLOK(PMC *old))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

size_t Parrot_pcc_calculate_context_size(SHIM_INTERP,
    ARGIN(const UINTVAL *number_regs_used))
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * Parrot_set_new_context(PARROT_INTERP,
    ARGIN(const INTVAL *number_regs_used))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_clear_i __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_clear_n __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_clear_p __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_clear_s __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_pcc_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_dec_recursion_depth \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_errors_off __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_errors_on __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_errors_test __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_caller_ctx __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_context_struct __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_pcc_get_continuation __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_FLOATVAL_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_handlers __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_HLL __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_int_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_INTVAL_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_lex_pad __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_num_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_object __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_outer_ctx __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_pc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_pmc_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_PMC_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_pred_offset __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_recursion_depth \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_regs_ni __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_regs_ps __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_regs_used __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_results __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_results_signature \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_string_constant \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_STRING_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_get_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_inc_recursion_depth \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_caller_ctx __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(caller_ctx)
#define ASSERT_ARGS_Parrot_pcc_set_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_continuation __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_handers __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(handlers)
#define ASSERT_ARGS_Parrot_pcc_set_HLL __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_lex_pad __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(lex_pad)
#define ASSERT_ARGS_Parrot_pcc_set_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_object __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_outer_ctx __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(outer_ctx)
#define ASSERT_ARGS_Parrot_pcc_set_pc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_pred_offset __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_regs_ni __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(bp)
#define ASSERT_ARGS_Parrot_pcc_set_regs_ps __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx) \
    || PARROT_ASSERT_ARG(bp_ps)
#define ASSERT_ARGS_Parrot_pcc_set_regs_used __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_results __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_results_signature \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_set_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_trace_flags_off __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_trace_flags_on __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_trace_flags_test __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_warnings_off __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_warnings_on __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pcc_warnings_test __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_Parrot_pop_context __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_push_context __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(n_regs_used)
#define ASSERT_ARGS_create_initial_context __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_alloc_context __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(number_regs_used)
#define ASSERT_ARGS_Parrot_pcc_calculate_context_size \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(number_regs_used)
#define ASSERT_ARGS_Parrot_set_new_context __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(number_regs_used)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/context.c */

#endif /* PARROT_INTER_CALL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
