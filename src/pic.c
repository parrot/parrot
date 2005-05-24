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

In init_prederef the opcodes are replaced with prederef__, operands are
replaced with their addresses:

    0               1              2    3    4                5
  +--------------+---------------+----+----+-----------------+----------+
  | prederef__   |&.MMD_SUBTRACT | &P5| &P6| prederef__      |&"method" |
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
  | pic_infix___ic_p_p | MIC1|&P5 |&P6 | pic_callmethodcc___sc | MIC2|
  +--------------------+-----+----+----+-----------------------+-----+

This can be further optimized due to static inlining:

    0                    1     2    3
  +--------------------+-----+----+----+-----------------------+-----+
  | pic_inline_sub_p_p | MIC1|&P5 |&P6 | pic_callmethodcc___sc | MIC2|
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

/* needs a Makefile dependency */
/* #include "../classes/pmc_integer.h" */

extern void Parrot_Integer_i_subtract_Integer(Interp* , PMC* pmc, PMC* value);

#define OP_AS_OFFS(o) (_reg_base + ((opcode_t*)cur_opcode)[o])

/*
 * hack to turn on inlining - just sub_p_p for mops done
 */

#define ENABLE_INLINING 1

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
parrot_pic_opcode(Interp *interpreter, int op)
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

#define N_STATIC_TYPES 500
static INTVAL pmc_type_numbers[N_STATIC_TYPES];

void
parrot_PIC_prederef(Interp *interpreter, opcode_t op, void **pc_pred, int core)
{
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    char * _reg_base = (char*)interpreter->ctx.bp;
    opcode_t *cur_opcode = (opcode_t*)pc_pred;

    switch (op) {
        case PARROT_OP_new_p_sc:
            {
                STRING *class;
                INTVAL type;
                class = *(STRING **)cur_opcode[2];
                type = pmc_type(interpreter, class);
                if (!type) {
                    Parrot_autoload_class(interpreter, class);
                    type = pmc_type(interpreter, class);
                }
                if (type <= 0)
                    real_exception(interpreter, NULL, NO_CLASS,
                            "Class '%Ss' not found", class);
                if (type >= N_STATIC_TYPES)
                    internal_exception(1, "Unimp: too many classes");
                /*
                 * the prederef bytecode needs the address of
                 * an INTVAL holding the type
                 *
                 * TODO if beyond limit use a malloced array
                 *      or just C<break> instead w/o rewriting the op
                 */
                pmc_type_numbers[type] = type;
                pc_pred[2] = pmc_type_numbers + type;
                op = PARROT_OP_new_p_ic;
            }
            break;
        case PARROT_OP_infix_ic_p_p:
            {
                Parrot_MIC *mic;
                size_t n;
                struct PackFile_ByteCode *cs = interpreter->code;

                n = cur_opcode - (opcode_t*)cs->prederef.code;
                /*
                 * pic_index is half the size of the code
                 */
                n = cs->pic_index->data[n / 2];
                mic = parrot_PIC_alloc_mic(interpreter, n);
                mic->m.func_nr = *(INTVAL*) cur_opcode[1];
                pc_pred[1] = (void*) mic;
                op = PARROT_OP_pic_infix___ic_p_p;
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
    if (!mic->lru.lr_type)
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
        pic->lru[2].lr_type = pic->lru[1].lr_type;
        pic->lru[2].f.sub = pic->lru[1].f.sub;
        pic->lru[1].lr_type = pic->lru[0].lr_type;
        pic->lru[1].f.sub = pic->lru[0].f.sub;
        pic->lru[0].lr_type = mic->lru.lr_type;
        pic->lru[0].f.sub = mic->lru.f.sub;
        mic->lru.lr_type = 0;
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
        ((void**)cur_opcode)[1] = (void*)real_op;
        mic->lru.f.sub = (PMC*)F2DPTR(func);
    }
    else {
        int op = PARROT_OP_pic_infix___ic_p_p;

#if ENABLE_INLINING
        if (func == (funcptr_t)Parrot_Integer_i_subtract_Integer && !mic->pic)
            op = PARROT_OP_pic_inline_sub___ic_p_p;
#endif
        ((void**)cur_opcode)[0] =
            parrot_pic_opcode(interpreter, op);
        mic->lru.f.real_function = func;
    }
    mic->lru.lr_type = (left_type << 16) | right_type;
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
