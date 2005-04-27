/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/pic.c - Polymorphic Inline Cache

=head1 DESCRIPTION

The PIC supports inline caching for MMD and object method lookups in
prederefed run cores. Additionally opcodes that do some kind of lookup
like C<new_p_sc> are changed to faster variants.

TODO For non-prederefed run-cores there's a less efficient variant which
is basically:

 * the bytecode segment has an index per cached opcode
 * this index points into pic_store

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include <assert.h>

#define OP_AS_OFFS(o) (_reg_base + ((opcode_t*)cur_opcode)[o])

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
    store->mic    = (Parrot_MIC**)((char*)store + sizeof(Parrot_PIC_store));
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
    return store->mic[n];
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
    }
    /*
     * else set default prederef code address
     */
    if (core == PARROT_SWITCH_CORE)
        *pc_pred = (void**) op;
    else
        *pc_pred = ((void **)prederef_op_func)[op];
}

/*

=back

=head1 AUTHOR

Leopold Toetsch with many hints from Ken Fox.

=head1 SEE ALSO

F<src/mmd.c>, F<src/object.c>, F<src/interpreter.c>, F<ops/core_ops_cgp.c>,
F<include/parrot/pic.h>

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
