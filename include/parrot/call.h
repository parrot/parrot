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

    Parrot_Context *ctx;     /* the source or destination context */
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

typedef struct call_state {
    call_state_item src;
    call_state_item dest;
    UnionVal val;
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
    ARGIN(Parrot_Context *ctx),
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
    ARGIN(Parrot_Context *ctx),
    ARGIN_NULLOK(opcode_t *pc),
    ARGIN(call_state_item *sti))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_EXPORT
int Parrot_init_arg_sig(PARROT_INTERP,
    ARGIN(Parrot_Context *ctx),
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
    ARGMOD(Parrot_Context *src_ctx),
    ARGMOD(Parrot_Context *dest_ctx),
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
    ARGIN_NULLOK(PMC* obj),
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
int Parrot_store_arg(SHIM_INTERP, ARGIN(const call_state *st))
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
opcode_t * parrot_pass_args_fromc(PARROT_INTERP,
    ARGIN(const char *sig),
    ARGMOD(opcode_t *dest),
    ARGIN(Parrot_Context *old_ctxp),
    va_list ap)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*dest);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * set_retval(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

FLOATVAL set_retval_f(PARROT_INTERP,
    int sig_ret,
    ARGIN(Parrot_Context *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

INTVAL set_retval_i(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* set_retval_p(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING* set_retval_s(PARROT_INTERP, int sig_ret, ARGIN(Parrot_Context *ctx))
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
       PARROT_ASSERT_ARG(st)
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
Parrot_Context * Parrot_runops_fromc(PARROT_INTERP, ARGIN(PMC *sub))
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

#define ASSERT_SIG_PMC(sig) \
    PARROT_ASSERT(PObj_is_PMC_TEST(sig)); \
    PARROT_ASSERT((sig)->vtable->base_type == enum_class_FixedIntegerArray)

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


#endif /* PARROT_INTER_CALL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
