/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/pic.c - Polymorphic Inline Cache

=head1 DESCRIPTION

The PIC supports inline caching for MMD and object method lookups in
prederefed run cores. Additionally opcodes that do some kind of lookup
like C<new_p_sc> are changed to faster variants.

For non-prederefed run-cores there's a less efficient variant which
is basically:

 * the bytecode segment has an index per cached opcode (code->pic_index)
 * this index points into pic_store
 * TODO use the cache in opcodes

=head1 OPERATION SCHEME

Given this bytecode:

    0               1              2    3    4                5
  +--------------+---------------+----+----+-----------------+----------+
  | infix_ic_p_p | .MMD_SUBTRACT | P5 | P6 | callmethodcc_sc | "method" |
  +--------------+---------------+----+----+-----------------+----------+

In init_prederef the opcodes are replaced with prederef__, operands
are replaced with their addresses (&) in the const table or offsets
(+) in the register frame:

    0               1              2    3    4                5
  +--------------+---------------+----+----+-----------------+----------+
  | prederef__   | .MMD_SUBTRACT | +P5| +P6| prederef__      |&"method" |
  +--------------+---------------+----+----+-----------------+----------+

we have code->pic_index with an index into pic_store - the pic_index is
half the size of the bytecode and addressed with pc_offset/2:

    0   1   2
  +---+---+---+
  | 1 |   | 2 |
  +---+---+---+

During predereferencing the opcode gets rewritten to the PIC variant,
the constant infix operation number is replaced with a pointer to the MIC
in the pic_store at the index pic_index:

    0                    1     2    3
  +--------------------+-----+----+----+-----------------------+-----+
  | pic_infix___ic_p_p | MIC1|+P5 |+P6 | pic_callmethodcc___sc | MIC2|
  +--------------------+-----+----+----+-----------------------+-----+

This can be further optimized due to static inlining:

    0                    1     2    3
  +--------------------+-----+----+----+-----------------------+-----+
  | pic_inline_sub_p_p | MIC1|+P5 |+P6 | pic_callmethodcc___sc | MIC2|
  +--------------------+-----+----+----+-----------------------+-----+

The opcode is an opcode number for the switched core or the actual code address
for the direct-threaded CGP core. With a little help of the JIT system we could
also dynamicall create inlined code.

Runcores with r/o (mmaped) bytecode can't be rewritten in this way, the
lookup of the cache has to be done in the opcode itself.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include <assert.h>
#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cgp.h"
#endif

#if HAS_JIT
#include "parrot/exec.h"
#include "parrot/jit.h"
#endif

#define PIC_TEST 1

/* needs a Makefile dependency */
/* #include "pmc/pmc_integer.h" */

extern void Parrot_Integer_i_subtract_Integer(Interp* , PMC* pmc, PMC* value);

#define OP_AS_OFFS(o) (_reg_base + ((opcode_t*)cur_opcode)[o])

/*
 * hack to turn on inlining - just sub_p_p for mops done
 */

#define ENABLE_INLINING 0

/*

=item C<void parrot_PIC_alloc_store(Interp *, struct PackFile_ByteCode *, size_t n);>

Initialize the PIC storage for the given code segment with the capacitiy of
holding at least C<n> MIC entries. The PIC_store itself, room for C<n> MICs and
some space for PICs is allocated as one piece. MICs are returned from the start
of usable memory, PICs from the rear.

=item C<void parrot_PIC_destroy(Interp *, struct PackFile_ByteCode *);>

Free memory for the PIC storage.

=cut

*/

void
parrot_PIC_alloc_store(Interp *interpreter,
        struct PackFile_ByteCode *cs, size_t n)
{
    size_t size, poly;
    Parrot_PIC_store *store;

    /*
     * estimated 95% of calls are monomorphic, 5% are polymorphic
     * we need therefore:
     */
#define POLYMORPHIC 0.05

    poly = (size_t)(n * POLYMORPHIC) * sizeof(Parrot_PIC);
    if (!poly)
        poly = 2 * sizeof(Parrot_PIC);
    size = n * sizeof(Parrot_MIC) + poly + sizeof(Parrot_PIC_store);

    store = mem_sys_allocate_zeroed(size);
    SET_NULL_P(store->prev, Parrot_PIC_store*);
    cs->pic_store = store;

    store->pic    = (Parrot_PIC*)((char *)store + size);
    store->usable = poly;
    store->mic    = (Parrot_MIC*)((char*)store + sizeof(Parrot_PIC_store));
    store->n_mics = n;
}

void
parrot_PIC_destroy(Interp *interpreter, struct PackFile_ByteCode *cs)
{
    Parrot_PIC_store *store, *prev;

    for (store = cs->pic_store; store; ) {
        prev = store->prev;
        mem_sys_free(store);
        store = prev;
    }
    cs->pic_store = NULL;
}

/*

=item C<int parrot_PIC_op_is_cached(Interp *, int op_code);>

Return true, if the opcode needs a PIC slot.

*/

int
parrot_PIC_op_is_cached(Interp *interpreter, int op_code)
{
    switch (op_code) {
        case PARROT_OP_infix_ic_p_p: return 1;
        case PARROT_OP_get_params_pc: return 1;
        case PARROT_OP_set_returns_pc: return 1;
        case PARROT_OP_set_args_pc: return 1;
    }
    return 0;
}
/*

=item C<Parrot_MIC* parrot_PIC_alloc_mic(Interp*, size_t n);>

=item C<Parrot_MIC* parrot_PIC_alloc_pic(Interp*);>

Allocate a new PIC or MIC structure for the C<n>th cached opcode in this
bytecode segement.

=cut

*/

Parrot_MIC*
parrot_PIC_alloc_mic(Interp*interpreter, size_t n)
{
    Parrot_PIC_store *store;

    store = interpreter->code->pic_store;
    assert(n < store->n_mics);
    return store->mic + n;
}

Parrot_PIC*
parrot_PIC_alloc_pic(Interp* interpreter)
{
    Parrot_PIC_store *store, *new_store;
    size_t size;

    store = interpreter->code->pic_store;
    if (store->usable < sizeof(Parrot_PIC)) {
        size = (size_t)(store->n_mics * POLYMORPHIC) * sizeof(Parrot_PIC);
        if (size == 0)
            size = 2 * sizeof(Parrot_PIC);
        new_store = mem_sys_allocate_zeroed(size + sizeof(Parrot_PIC_store));
        new_store->prev = store;
        interpreter->code->pic_store = new_store;

        new_store->pic    = (Parrot_PIC*)((char *)new_store + size +
            sizeof(Parrot_PIC_store));
        new_store->usable = size;
        /*
         * the addon store has only poly-morphic slots
         * point the monomorphic to the old store
         */
        new_store->mic    = store->mic;
        new_store->n_mics = store->n_mics;
        store = new_store;
    }
    store->usable -= sizeof(Parrot_PIC);
    return --store->pic;
}

/*

=item C<void parrot_PIC_prederef(Interp *, opcode_t op, void **pc_pred, int type)>

Define either the normal prederef function or the PIC stub, if PIC for
this opcode function is available. Called from C<do_prederef>.

=cut

*/


void *
parrot_pic_opcode(Interp *interpreter, INTVAL op)
{
    int core = interpreter->run_core;
#ifdef HAVE_COMPUTED_GOTO
    op_lib_t *cg_lib;
#endif

    if (core == PARROT_SWITCH_CORE)
        return (void*) op;
#ifdef HAVE_COMPUTED_GOTO
    cg_lib = PARROT_CORE_CGP_OPLIB_INIT(1);
    return ((void**)cg_lib->op_func_table)[op];
#else
    return NULL;
#endif
}

static int
pass_int(Interp *interpreter, PMC *sig, char *src_base, void **src, 
		char *dest_base, void **dest)
{
    INTVAL arg;
    int i, n = SIG_ELEMS(sig);
    for (i = 2 ; n; ++i, --n) {
        arg = *(INTVAL *)(src_base + ((opcode_t*)src)[i]);
        *(INTVAL *)(dest_base + ((opcode_t*)dest)[i])= arg;
    }
    return i;
}

static int
pass_num(Interp *interpreter, PMC *sig, char *src_base, void **src, 
		char *dest_base, void **dest)
{
    FLOATVAL arg;
    int i, n = SIG_ELEMS(sig);
    for (i = 2 ; n; ++i, --n) {
        arg = *(FLOATVAL *)(src_base + ((opcode_t*)src)[i]);
        *(FLOATVAL *)(dest_base + ((opcode_t*)dest)[i])= arg;
    }
    return i;
}

static int
pass_str(Interp *interpreter, PMC *sig, char *src_base, void **src, 
		char *dest_base, void **dest)
{
    STRING* arg;
    int i, n = SIG_ELEMS(sig);
    for (i = 2 ; n; ++i, --n) {
        arg = *(STRING* *)(src_base + ((opcode_t*)src)[i]);
        *(STRING* *)(dest_base + ((opcode_t*)dest)[i])= arg;
    }
    return i;
}

static int
pass_pmc(Interp *interpreter, PMC *sig, char *src_base, void **src, 
		char *dest_base, void **dest)
{
    PMC* arg;
    int i, n = SIG_ELEMS(sig);
    for (i = 2 ; n; ++i, --n) {
        arg = *(PMC* *)(src_base + ((opcode_t*)src)[i]);
        *(PMC* *)(dest_base + ((opcode_t*)dest)[i])= arg;
    }
    return i;
}

static int
pass_mixed(Interp *interpreter, PMC *sig, char *src_base, void **src, 
		char *dest_base, void **dest)
{
    PMC* argP;
    int i, n = SIG_ELEMS(sig);
    INTVAL *bitp, bits;
    INTVAL argI;
    FLOATVAL argN;
    STRING *argS;

    ASSERT_SIG_PMC(sig);
    bitp = SIG_ARRAY(sig);
    for (i = 2 ; n; ++i, --n) {
        bits = *bitp++;
        switch (bits) {
            case PARROT_ARG_INTVAL:
                argI = *(INTVAL *)(src_base + ((opcode_t*)src)[i]);
                *(INTVAL *)(dest_base + ((opcode_t*)dest)[i])= argI;
                break;
            case PARROT_ARG_INTVAL|PARROT_ARG_CONSTANT:
                argI = (INTVAL)(src)[i];
                *(INTVAL *)(dest_base + ((opcode_t*)dest)[i])= argI;
                break;
            case PARROT_ARG_FLOATVAL:
                argN = *(FLOATVAL *)(src_base + ((opcode_t*)src)[i]);
                *(FLOATVAL *)(dest_base + ((opcode_t*)dest)[i])= argN;
                break;
            case PARROT_ARG_FLOATVAL|PARROT_ARG_CONSTANT:
                argN = *(FLOATVAL*)(src)[i];
                *(FLOATVAL *)(dest_base + ((opcode_t*)dest)[i])= argN;
                break;
            case PARROT_ARG_STRING:
                argS = *(STRING **)(src_base + ((opcode_t*)src)[i]);
                *(STRING* *)(dest_base + ((opcode_t*)dest)[i])= argS;
                break;
            case PARROT_ARG_STRING|PARROT_ARG_CONSTANT:
                argS = (STRING*)(src)[i];
                *(STRING* *)(dest_base + ((opcode_t*)dest)[i])= argS;
                break;
            case PARROT_ARG_PMC:
                argP = *(PMC **)(src_base + ((opcode_t*)src)[i]);
                *(PMC* *)(dest_base + ((opcode_t*)dest)[i])= argP;
                break;
            case PARROT_ARG_PMC|PARROT_ARG_CONSTANT:
                argP = (PMC*)(src)[i];
                *(PMC* *)(dest_base + ((opcode_t*)dest)[i])= argP;
                break;
            default:
                internal_exception(1, "bogus signature 0x%x", bits);
                break;
        }
    }
    return i;
}
/*
 * return argument count and type of the signature or -1 if not pic-able
 * the type PARROT_ARG_CONSTANT stands for mixed types or constants
 */
int
parrot_pic_check_sig(Interp *interpreter, PMC *sig1, PMC *sig2, int *type)
{
    int i, n, t0, t1, t2;
    t0 = 0; /* silence compiler uninit warning */

    ASSERT_SIG_PMC(sig1);
    ASSERT_SIG_PMC(sig2);
    n = SIG_ELEMS(sig1);
    if (n != SIG_ELEMS(sig2))
        return -1;
    if (!n) {
        *type = 0;
        return 0;
    }
    for (i = 0; i < n; ++i) {
        t1 = SIG_ITEM(sig1, i);
        t2 = SIG_ITEM(sig2, i);
        if (!i) {
            t0 = t1 & PARROT_ARG_TYPE_MASK;
            *type = t0;
        }
        if (t1 & PARROT_ARG_CONSTANT) {
            *type = PARROT_ARG_CONSTANT;
            t1 &= ~PARROT_ARG_CONSTANT;
        }
        if (t1 & ~PARROT_ARG_TYPE_MASK)
            return -1;
        if (t2 & PARROT_ARG_CONSTANT) {
            *type = PARROT_ARG_CONSTANT;
            t2 &= ~PARROT_ARG_CONSTANT;
        }
        if (t2 & ~PARROT_ARG_TYPE_MASK)
            return -1;
        if (t2 != t1)
            return -1;
        if (t1 != t0)
            *type = PARROT_ARG_CONSTANT;
    }
    return n;
}

static int
is_pic_param(Interp *interpreter, void **pc, Parrot_MIC* mic, opcode_t op)
{
    PMC *sig1, *sig2;
    int n, type;
    parrot_context_t *caller_ctx, *ctx;
    INTVAL const_nr;
    opcode_t *args;
    PMC *ccont;

    /* check params */
    sig1 = (PMC*)(pc[1]);
    ctx = CONTEXT(interpreter->ctx);
    if (op == PARROT_OP_set_returns_pc) {
        ccont = ctx->current_cont;
        if (!PMC_cont(ccont)->address)
            return 0;
	caller_ctx = PMC_cont(ccont)->to_ctx;
        args = caller_ctx->current_results;
    }
    else {
        caller_ctx = ctx->caller_ctx;
        args = interpreter->current_args;
    }
    if (args) {
        const_nr = args[1];
        /* check current_args signature */
        sig2 = caller_ctx->constants[const_nr]->u.key;
        n = parrot_pic_check_sig(interpreter, sig1, sig2, &type);
        if (n == -1)
            return 0;
    }
    else {
        if (SIG_ELEMS(sig1) == 0) {
            sig2 = NULL;
            type = n = 0;
        }
        else
            return 0;
    }
    switch (type) {
        case PARROT_ARG_INTVAL:
            mic->lru.f.real_function = (funcptr_t)pass_int;
            break;
        case PARROT_ARG_FLOATVAL:
            mic->lru.f.real_function = (funcptr_t)pass_num;
            break;
        case PARROT_ARG_STRING:
            mic->lru.f.real_function = (funcptr_t)pass_str;
            break;
        case PARROT_ARG_PMC:
            mic->lru.f.real_function = (funcptr_t)pass_pmc;
            break;
        case PARROT_ARG_CONSTANT:
            mic->lru.f.real_function = (funcptr_t)pass_mixed;
            break;
        default:
            return 0;
    }
    mic->m.sig = sig1;
    /* remember this sig2 - it has to match the other end at call time */
    mic->lru.u.signature = sig2;
    return 1;
}


static int
is_pic_func(Interp *interpreter, void **pc, Parrot_MIC *mic, int core_type)
{
    PMC *sub, *sig_args, *sig_results;
    char *base;
    parrot_context_t *ctx;
    opcode_t *op, n;
    int flags;
    
    /*
     * if we have these opcodes
     *
     *   set_args '(..)' ...
     *   set_p_pc Px, PFunx
     *   get_results '(..)' ...
     *   invokecc_p Px
     *
     * and all args are matching the called sub and we don't have
     * too many args, and only INTVAL or FLOATVAL, the 
     * whole sequence is replaced by the C<callr> pic opcode.  
     *
     * Oh, I forgot to mention - the to-be-called C function is of
     * course compiled on-the-fly by the JIT compiler ;)
     *
     * pc is at set_args
     */

    base = (char*)interpreter->ctx.bp.regs_i;
    ctx = CONTEXT(interpreter->ctx);
    sig_args = (PMC*)(pc[1]);
    ASSERT_SIG_PMC(sig_args);
    n = SIG_ELEMS(sig_args);
    interpreter->current_args = (opcode_t*)pc + ctx->pred_offset;
    pc += 2 + n;
    op = (opcode_t*)pc + ctx->pred_offset;
    if (*op != PARROT_OP_set_p_pc)
        return 0;
    do_prederef(pc, interpreter, core_type);
    sub = (PMC*)(pc[2]);
    assert(PObj_is_PMC_TEST(sub)); 
    if (sub->vtable->base_type != enum_class_Sub)
        return 0;
    pc += 3;    /* results */
    op = (opcode_t*)pc + ctx->pred_offset;
    if (*op != PARROT_OP_get_results_pc)
        return 0;
    do_prederef(pc, interpreter, core_type);
    sig_results = (PMC*)(pc[1]);
    ASSERT_SIG_PMC(sig_results);

    ctx->current_results = (opcode_t*)pc + ctx->pred_offset;
    if (!parrot_pic_is_save_to_jit(interpreter, sub, 
                sig_args, sig_results, &flags))
        return 0;
    mic->lru.f.real_function = parrot_pic_JIT_sub(interpreter, sub, flags);
    mic->m.sig = sig_args;
    return 1;
}

void
parrot_PIC_prederef(Interp *interpreter, opcode_t op, void **pc_pred, int core)
{
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    char * _reg_base = (char*)interpreter->ctx.bp.regs_i;
    opcode_t *cur_opcode = (opcode_t*)pc_pred;
    Parrot_MIC *mic = NULL;

    if (parrot_PIC_op_is_cached(interpreter, op)) {
        struct PackFile_ByteCode *cs = interpreter->code;
        size_t n = cur_opcode - (opcode_t*)cs->prederef.code;
        /*
         * pic_index is half the size of the code
         * XXX if it's there - pbc_merge needs updates
         */
        assert(cs->pic_index);
        n = cs->pic_index->data[n / 2];
        mic = parrot_PIC_alloc_mic(interpreter, n);
    }
    switch (op) {
        case PARROT_OP_new_p_sc:
            {
                STRING *class;
                INTVAL type;
                class = (STRING *)cur_opcode[2];
                type = pmc_type(interpreter, class);
                if (!type) {
                    Parrot_autoload_class(interpreter, class);
                    type = pmc_type(interpreter, class);
                }
                if (type <= 0)
                    real_exception(interpreter, NULL, NO_CLASS,
                            "Class '%Ss' not found", class);
                pc_pred[2] = (void*)type;
                op = PARROT_OP_new_p_ic;
            }
            break;
        case PARROT_OP_infix_ic_p_p:
            mic->m.func_nr = (INTVAL) cur_opcode[1];
            pc_pred[1] = (void*) mic;
            op = PARROT_OP_pic_infix___ic_p_p;
            break;
        case PARROT_OP_get_params_pc:
            if (is_pic_param(interpreter, pc_pred, mic, op)) {
                pc_pred[1] = (void*) mic;
                op = PARROT_OP_pic_get_params___pc;
            }
            break;
        case PARROT_OP_set_returns_pc:
            if (is_pic_param(interpreter, pc_pred, mic, op)) {
                pc_pred[1] = (void*) mic;
                op = PARROT_OP_pic_set_returns___pc;
            }
            break;
        case PARROT_OP_set_args_pc:
            if (is_pic_func(interpreter, pc_pred, mic, core)) {
                pc_pred[1] = (void*) mic;
                op = PARROT_OP_pic_callr___pc;
            }
            break;
    }
    /*
     * rewrite opcode
     */
    if (core == PARROT_SWITCH_CORE)
        *pc_pred = (void**) op;
    else
        *pc_pred = ((void **)prederef_op_func)[op];
}

static void
parrot_pic_move(Interp* interpreter, Parrot_MIC *mic)
{
    Parrot_PIC* pic;

    /*
     * MIC slot is empty - use it
     */
    if (!mic->lru.u.type)
        return;
    /*
     * need more cache slots - allocate one PIC
     */
    if (!mic->pic) {
        mic->pic = parrot_PIC_alloc_pic(interpreter);
    }
    else {
        /*
         * PIC was already used - shift slots up
         */
        pic = mic->pic;
        pic->lru[2].u.type = pic->lru[1].u.type;
        pic->lru[2].f.sub = pic->lru[1].f.sub;
        pic->lru[1].u.type = pic->lru[0].u.type;
        pic->lru[1].f.sub = pic->lru[0].f.sub;
        pic->lru[0].u.type = mic->lru.u.type;
        pic->lru[0].f.sub = mic->lru.f.sub;
        mic->lru.u.type = 0;
    }
}

void
parrot_pic_find_infix_v_pp(Interp *interpreter, PMC *left, PMC *right,
                Parrot_MIC *mic, opcode_t *cur_opcode)
{
    funcptr_t func;
    int is_pmc;
    INTVAL left_type, right_type;
    /*
     * if 2 threads are entering here, there is a chance
     * that one moves the lru structure under the other thread
     * and vv - just lock in case
     *
     * TODO
     *
     * if (TRY_LOCK_INTERPRETER(i) == EBUSY)
     *      return;  - reexec
     */
    LOCK_INTERPRETER(interpreter);
    /*
     * move entries back and set topmost entry
     */
    parrot_pic_move(interpreter, mic);
    /*
     * get real dispatch function
     */
    left_type = left->vtable->base_type;
    right_type = right->vtable->base_type;
    func = get_mmd_dispatch_type(interpreter,
            mic->m.func_nr, left_type, right_type, &is_pmc);
    if (is_pmc) {
        size_t offs = cur_opcode - (opcode_t*)interpreter->code->prederef.code;
        opcode_t* real_op = interpreter->code->base.data + offs + 1;
        /* set prederef code address to orig slot for now
         */
        ((void**)cur_opcode)[0] =
            parrot_pic_opcode(interpreter, PARROT_OP_infix_ic_p_p);
        /* restore 1st operand i.e. .MMD_func_nr */
        ((void**)cur_opcode)[1] = (void*)*real_op;
        mic->lru.f.sub = (PMC*)F2DPTR(func);
    }
    else {
        INTVAL op = PARROT_OP_pic_infix___ic_p_p;

#if ENABLE_INLINING
        if (func == (funcptr_t)Parrot_Integer_i_subtract_Integer && !mic->pic)
            op = PARROT_OP_pic_inline_sub___ic_p_p;
#endif
        ((void**)cur_opcode)[0] =
            parrot_pic_opcode(interpreter, op);
        mic->lru.f.real_function = func;
    }
    mic->lru.u.type = (left_type << 16) | right_type;
    UNLOCK_INTERPRETER(interpreter);
}

/*

=back

=head1 AUTHOR

Leopold Toetsch with many hints from Ken Fox.

=head1 SEE ALSO

F<src/mmd.c>, F<src/object.c>, F<src/interpreter.c>, F<ops/core_ops_cgp.c>,
F<include/parrot/pic.h>, F<ops/pic.ops>

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
