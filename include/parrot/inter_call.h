/* inter_call.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *Id: inter_call.h 17714 2007-03-24 17:04:39Z tewk
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

#define CALL_STATE_x_ISSET(o, x) (o & CALL_STATE_ ## x)
#define CALL_STATE_x_SET(o, x) (o |= CALL_STATE_ ## x)
#define CALL_STATE_x_UNSET(o, x) (o &= ~CALL_STATE_ ## x)

#define CALL_STATE_MASK_MASK(o)       (CALL_STATE_X_ISSET(o, MASK))
#define CALL_STATE_SIG_ISSET(o)       (CALL_STATE_X_ISSET(o, SIG))
#define CALL_STATE_OP_ISSET(o)        (CALL_STATE_X_ISSET(o, OP))
#define CALL_S_D_MASK_MASK(o)         (o & CALL_S_D_MASK)
#define CALL_STATE_FLATTEN_ISSET(o)   (CALL_STATE_X_ISSET(o, FLATTEN))
#define CALL_STATE_NEXT_ARG_ISSET(o)  (CALL_STATE_X_ISSET(o, NEXT_ARG))

#define CALL_STATE_SIG_SET(o)       (CALL_STATE_X_SET(o, SIG))
#define CALL_STATE_OP_SET(o)        (CALL_STATE_X_SET(o, OP))
#define CALL_STATE_FLATTEN_SET(o)   (CALL_STATE_X_SET(o, FLATTEN))
#define CALL_STATE_NEXT_ARG_SET(o)  (CALL_STATE_X_SET(o, NEXT_ARG))

#define CALL_STATE_SIG_UNSET(o)       (CALL_STATE_X_UNSET(o, SIG))
#define CALL_STATE_OP_UNSET(o)        (CALL_STATE_X_UNSET(o, OP))
#define CALL_STATE_FLATTEN_UNSET(o)   (CALL_STATE_X_UNSET(o, FLATTEN))
#define CALL_STATE_NEXT_ARG_UNSET(o)  (CALL_STATE_X_UNSET(o, NEXT_ARG))

struct call_state_item {
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
    struct call_state_item src;
    struct call_state_item dest;
    UnionVal val;
    int n_actual_args;  /* arguments incl. flatten */
    int optionals;      /* sum of optionals */
    int params;         /* sum of params */
    int first_named;    /* param idx of 1st named */
    UINTVAL named_done; /* bit mask, 1 if named was assigned */
    STRING *name;       /* name of argument if any */
    PMC *key;           /* to iterate a flattening hash */
};

typedef enum arg_pass_t {
    PARROT_PASS_PARAMS          = 0x00,
    PARROT_PASS_RESULTS         = 0x01,
} arg_pass_t;

PARROT_API int Parrot_init_arg_indexes_and_sig_pmc(Interp *interp, parrot_context_t *ctx,
        opcode_t *indexes, PMC* sig_pmc, struct call_state_item *st);

PARROT_API int Parrot_init_arg_sig(Interp *, parrot_context_t *ctx,
        const char *sig, void *ap, struct call_state_item *st);

PARROT_API int Parrot_init_arg_op(Interp *, parrot_context_t *ctx,
        opcode_t *pc, struct call_state_item *st);

PARROT_API void Parrot_process_args(Interp *interp, struct call_state *st,
        arg_pass_t param_or_result);

PARROT_API int Parrot_init_arg_nci(Interp *, struct call_state *st, const char *sig);
PARROT_API int Parrot_init_ret_nci(Interp *, struct call_state *st, const char *sig);

PARROT_API int Parrot_fetch_arg(Interp *, struct call_state *st);
PARROT_API int Parrot_fetch_arg_nci(Interp *, struct call_state *st);
PARROT_API void Parrot_convert_arg(Interp *, struct call_state *st);
PARROT_API int Parrot_store_arg(Interp *, struct call_state *st);

PARROT_API void parrot_pass_args(Interp *, parrot_context_t *src_ctx,
        parrot_context_t *dest_ctx, opcode_t *src_indexes, opcode_t *dest_indexes,
        arg_pass_t param_or_result);
opcode_t * parrot_pass_args_fromc(Interp *, const char *sig,
        opcode_t *dest, parrot_context_t * ctx, va_list ap);

void* set_retval(Interp*, int sig_ret, parrot_context_t *ctx);
INTVAL set_retval_i(Interp*, int sig_ret, parrot_context_t *ctx);
FLOATVAL set_retval_f(Interp*, int sig_ret, parrot_context_t *ctx);
STRING* set_retval_s(Interp*, int sig_ret, parrot_context_t *ctx);
PMC* set_retval_p(Interp*, int sig_ret, parrot_context_t *ctx);

/* PMC Method Invoke */
PARROT_API void Parrot_PCCINVOKE(Interp* interp, PMC* pmc, STRING *method_name,
  const char *signature, ... );

#define ASSERT_SIG_PMC(sig) \
    assert(PObj_is_PMC_TEST(sig) && \
           sig->vtable->base_type == enum_class_FixedIntegerArray)

#define SIG_ELEMS(sig) PMC_int_val(sig)
#define SIG_ARRAY(sig) (INTVAL*)PMC_data(sig)
#define SIG_ITEM(sig, idx) (SIG_ARRAY(sig))[idx]
#define ADD_OP_VAR_PART(interp, seg, pc, n) do { \
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
