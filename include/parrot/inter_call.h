/* inter_call.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *     Call argument handling.
 *  History:
 *     Initial version by leo on on 2005/07/22
 *  Notes:
 *  References:
 */

#if !defined(PARROT_INTER_CALL_H_GUARD)
#define PARROT_INTER_CALL_H_GUARD

enum call_state_mode {
    /* arg processing states
     *       <src>_<dest>           sd  nibbles    */
    CALL_STATE_POS_POS          = 0x00,
    CALL_STATE_OPT              = 0x01,  /* dest only */
    CALL_STATE_SLURP            = 0x02,  /* dest only */
    CALL_STATE_NAMED_x          = 0x40,
    CALL_STATE_END_x            = 0x80,
    CALL_STATE_x_NAMED          = 0x04,
    CALL_STATE_x_END            = 0x08,
    CALL_STATE_POS_POS_OPT      = CALL_STATE_OPT, 
    CALL_STATE_POS_POS_SLURP    = CALL_STATE_SLURP,
    CALL_STATE_POS_NAMED        = CALL_STATE_x_NAMED,
    CALL_STATE_POS_NAMED_OPT    = CALL_STATE_POS_NAMED|CALL_STATE_OPT,
    CALL_STATE_POS_END          = CALL_STATE_x_END, 
    CALL_STATE_NAMED_POS        = CALL_STATE_NAMED_x,
    CALL_STATE_NAMED_POS_OPT    = CALL_STATE_NAMED_x|CALL_STATE_OPT,
    CALL_STATE_NAMED_POS_SLURP  = CALL_STATE_NAMED_x|CALL_STATE_SLURP,
    CALL_STATE_NAMED_NAMED      = CALL_STATE_NAMED_x|CALL_STATE_x_NAMED,
    CALL_STATE_NAMED_NAMED_OPT  = CALL_STATE_NAMED_NAMED|CALL_STATE_OPT,
    CALL_STATE_NAMED_NAMED_SLURP= CALL_STATE_NAMED_NAMED|CALL_STATE_SLURP,
    CALL_STATE_END_POS_OPT      = CALL_STATE_END_x|CALL_STATE_OPT,
    CALL_STATE_END_NAMED_NAMED  = CALL_STATE_END_x|CALL_STATE_NAMED_NAMED,
    CALL_STATE_END_POS_NAMED    = CALL_STATE_END_x|CALL_STATE_POS_NAMED,
    CALL_STATE_END_NAMED_OPT    = CALL_STATE_END_x|CALL_STATE_POS_NAMED_OPT,
    CALL_STATE_END_END          = CALL_STATE_END_x|CALL_STATE_x_END,
    CALL_STATE_MASK             = 0xff,

    CALL_STATE_SIG        =  0x100,     /* runops, nci */
    CALL_STATE_OP         =  0x200,     /* get_, set_ ops */
    CALL_S_D_MASK         =  0x300,     /* src/dest mask */

    CALL_STATE_FLATTEN    =  0x400,     /* flatten src */
    CALL_STATE_NEXT_ARG   =  0x800

};

struct call_state_1 {
    int mode;       /* from_sig, from_set_ops, flatten ...*/
    union {
        struct {
            void *ap;   /* a ptr to va_list */
            const char *sig;
        } sig;
        struct {
            opcode_t *pc;
            PMC *signature;
        } op;
    } u;
    parrot_context_t *ctx;
    INTVAL i;
    INTVAL n;
    INTVAL sig;
    PMC *slurp;
    INTVAL slurp_i;
    INTVAL slurp_n;
};

struct call_state {
    struct call_state_1 src;
    struct call_state_1 dest;
    UnionVal val;
    int n_actual_args;  /* arguments incl. flatten */
    int optionals;      /* sum of optionals */
    int params;         /* sum of params */
    int first_named;    /* param idx of 1st named */
    UINTVAL named_done; /* bit mask, 1 if named was assigned */
    STRING *name;       /* name of argument if any */
    PMC *key;           /* to iterate a flattening hash */
};

PARROT_API int Parrot_init_arg_sig(Interp *, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_1 *st);

PARROT_API int Parrot_init_arg_op(Interp *, parrot_context_t *ctx,
        opcode_t *pc, struct call_state_1 *st);

PARROT_API int Parrot_init_arg_nci(Interp *, struct call_state *st, const char *sig);
PARROT_API int Parrot_init_ret_nci(Interp *, struct call_state *st, const char *sig);

PARROT_API int Parrot_fetch_arg(Interp *, struct call_state *st);
PARROT_API int Parrot_fetch_arg_nci(Interp *, struct call_state *st);
PARROT_API void Parrot_convert_arg(Interp *, struct call_state *st);
PARROT_API int Parrot_store_arg(Interp *, struct call_state *st);

opcode_t * parrot_pass_args(Interp *, parrot_context_t *src_ctx,
        parrot_context_t *dest_ctx, int what);
opcode_t * parrot_pass_args_fromc(Interp *, const char *sig,
        opcode_t *dest, parrot_context_t * ctx, va_list ap);
opcode_t *
parrot_pass_args_to_result(Interp *interpreter, const char *sig,
        opcode_t *dest, parrot_context_t * old_ctxp, va_list ap);

FLOATVAL set_retval_f(Interp*, int sig_ret, parrot_context_t *ctx);
void* set_retval(Interp*, int sig_ret, parrot_context_t *ctx);
INTVAL set_retval_i(Interp*, int sig_ret, parrot_context_t *ctx);

#define ASSERT_SIG_PMC(sig) \
    assert(PObj_is_PMC_TEST(sig) && \
           sig->vtable->base_type == enum_class_FixedIntegerArray)

#define SIG_ELEMS(sig) PMC_int_val(sig)
#define SIG_ARRAY(sig) (INTVAL*)PMC_data(sig)
#define SIG_ITEM(sig, idx) (SIG_ARRAY(sig))[idx]
#define ADD_OP_VAR_PART(interpreter, seg, pc, n) do { \
    if (*pc == PARROT_OP_set_args_pc || \
            *pc == PARROT_OP_get_results_pc || \
            *pc == PARROT_OP_get_params_pc || \
            *pc == PARROT_OP_set_returns_pc) { \
        PMC *sig; \
        sig = seg->const_table->constants[pc[1]]->u.key; \
        n += SIG_ELEMS(sig); \
    } \
} while (0)


#endif /* PARROT_INTER_CALL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
