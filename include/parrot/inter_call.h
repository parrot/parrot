/* inter_call.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *Id: inter_call.h 17714 2007-03-24 17:04:39Z tewk
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

enum call_state_mode {
    /* arg processing states
     *       <src>_<dest>           sd  nibbles    */

    CALL_STATE_SIG        =  0x100,     /* runops, nci */
    CALL_STATE_OP         =  0x200,     /* get_, set_ ops */
    CALL_S_D_MASK         =  0x300,     /* src/dest mask */

    CALL_STATE_FLATTEN    =  0x400      /* flatten src */

};

typedef struct call_state_item {
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
    INTVAL used;
    INTVAL i;
    INTVAL n;
    INTVAL sig;
    PMC *slurp;
    INTVAL slurp_i;
    INTVAL slurp_n;
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

/* HEADERIZER BEGIN: src/inter_call.c */

PARROT_API void Parrot_convert_arg( Interp *interp /*NN*/,
    call_state *st /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API int Parrot_fetch_arg( Interp *interp /*NN*/,
    call_state *st /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API int Parrot_fetch_arg_nci( Interp *interp /*NN*/,
    call_state *st /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API int Parrot_init_arg_indexes_and_sig_pmc( Interp *interp,
    parrot_context_t *ctx /*NN*/,
    opcode_t *indexes /*NN*/,
    PMC* sig_pmc /*NN*/,
    call_state_item *st /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_API int Parrot_init_arg_nci( Interp *interp /*NN*/,
    call_state *st /*NN*/,
    const char *sig /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API int Parrot_init_arg_op( Interp *interp,
    parrot_context_t *ctx /*NN*/,
    opcode_t *pc /*NULLOK*/,
    call_state_item *st /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_API int Parrot_init_arg_sig( Interp *interp,
    parrot_context_t *ctx,
    const char *sig /*NN*/,
    void *ap,
    call_state_item *st /*NN*/ )
        __attribute__nonnull__(3)
        __attribute__nonnull__(5);

PARROT_API int Parrot_init_ret_nci( Interp *interp /*NN*/,
    call_state *st /*NN*/,
    const char *sig /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void parrot_pass_args( Interp *interp /*NN*/,
    parrot_context_t *src_ctx /*NN*/,
    parrot_context_t *dest_ctx /*NN*/,
    opcode_t *src_indexes /*NN*/,
    opcode_t *dest_indexes /*NN*/,
    arg_pass_t param_or_result )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_API void Parrot_PCCINVOKE( Interp* interp,
    PMC* pmc,
    STRING *method_name,
    const char *signature,
    ... );

PARROT_API void Parrot_process_args( Interp *interp /*NN*/,
    call_state *st /*NN*/,
    arg_pass_t param_or_result )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

opcode_t * parrot_pass_args_fromc( Interp *interp /*NN*/,
    const char *sig,
    opcode_t *dest,
    parrot_context_t *old_ctxp,
    va_list ap )
        __attribute__nonnull__(1);

int Parrot_store_arg( Interp *interp, call_state *st /*NN*/ )
        __attribute__nonnull__(2);

void* set_retval( Interp *interp /*NN*/,
    int sig_ret,
    parrot_context_t *ctx /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

FLOATVAL set_retval_f( Interp *interp /*NN*/,
    int sig_ret,
    parrot_context_t *ctx /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

INTVAL set_retval_i( Interp *interp /*NN*/,
    int sig_ret,
    parrot_context_t *ctx /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PMC* set_retval_p( Interp *interp /*NN*/,
    int sig_ret,
    parrot_context_t *ctx /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

STRING* set_retval_s( Interp *interp /*NN*/,
    int sig_ret,
    parrot_context_t *ctx /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

/* HEADERIZER END: src/inter_call.c */

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
