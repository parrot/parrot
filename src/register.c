/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/register.c - Register handling routines

=head1 DESCRIPTION

Parrot has 4 register sets, one for each of its basic types. The amount
of registers in each set varies depending on the use counts of the
respective subroutine and is determined by the PASM/PIR compiler in
the register allocation pass (F<imcc/reg_alloc.c>).

There is one register stack to support the C<saveall> and
C<restoreall> opcodes. The former copies all registers to a newly
allocated storage and points the register base pointers to this
storage. In C<Parrot_pop_regs> the register base pointers are restored
to the previous values and the allocated register memory is discarded.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<void
setup_register_stacks(Interp *)>

Sets up the register stacks.

=item C<void Parrot_push_regs(Interp *)>

Save all registers onto the register stack.

=item C<void Parrot_pop_regs(Interp *)>

Restore all registers from register stack.

=cut

*/

typedef struct {
    Regs_ni  old_bp_ni;   /* restoreall just resets ptrs */
    Regs_ps  old_bp_ps;
    Regs_ps  bp_ps;       /* pushed regs need DOD marking */
    INTVAL   n_regs_pmc;
    INTVAL   n_regs_str;
} save_regs_t;

void
setup_register_stacks(Interp * interpreter)
{
    CONTEXT(interpreter->ctx)->reg_stack =
        register_new_stack(interpreter,
            "Regs_", sizeof(save_regs_t));

}

void
Parrot_push_regs(Interp *interpreter)
{
    Stack_Chunk_t *chunk, **chunk_p;
    save_regs_t   *save_r;
    parrot_context_t *ctx;
    size_t size_nis, size_nisp;
    void *ptr;

    ctx = CONTEXT(interpreter->ctx);
    chunk_p = &ctx->reg_stack;
    save_r = stack_prepare_push(interpreter, chunk_p);
    save_r->old_bp_ni.regs_i = ctx->bp.regs_i;
    save_r->old_bp_ps.regs_s = ctx->bp_ps.regs_s;
    save_r->n_regs_str = ctx->n_regs_used[REGNO_STR];
    save_r->n_regs_pmc = ctx->n_regs_used[REGNO_PMC];

    size_nis = _SIZEOF_NUMS + _SIZEOF_INTS + _SIZEOF_STRS;
    size_nisp = size_nis + _SIZEOF_PMCS;
    ptr = mem_sys_allocate(size_nisp);
    memcpy(ptr, (char*)ctx->bp.regs_i - _SIZEOF_NUMS, size_nisp);
    save_r->bp_ps.regs_s = (void*) ((char*) ptr + size_nis);
    interpreter->ctx.bp.regs_i = ctx->bp.regs_i =
        (void*) ((char*) ptr + _SIZEOF_NUMS);
    interpreter->ctx.bp_ps = ctx->bp_ps = save_r->bp_ps;
    chunk = *chunk_p;
    PObj_bufstart(chunk) = ptr;
    PObj_buflen  (chunk) = size_nisp;
    PObj_sysmem_SET(chunk);
}

void
Parrot_pop_regs(Interp* interpreter)
{
    Stack_Chunk_t *chunk, **chunk_p;
    save_regs_t   *save_r;
    parrot_context_t *ctx;

    ctx = CONTEXT(interpreter->ctx);
    chunk_p = &ctx->reg_stack;
    save_r = stack_prepare_pop(interpreter, chunk_p);

    /* restore register base pointers */
    interpreter->ctx.bp    = ctx->bp    = save_r->old_bp_ni;
    interpreter->ctx.bp_ps = ctx->bp_ps = save_r->old_bp_ps;
    /* deal with allocated memory, GC handles the chunk itself */
    chunk = *chunk_p;
    mem_sys_free(PObj_bufstart(chunk));
    PObj_bufstart(chunk) = NULL;
    PObj_buflen  (chunk) = 0;
    PObj_sysmem_CLEAR(chunk);
}

/*

=item C<void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* stack)>

Marks the register stack and it's registers as live.

=cut

*/

void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    int i;
    PObj *obj;
    struct Interp_Context ctx;
    save_regs_t   *save_r;

    for (; ; chunk = chunk->prev) {
        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
        save_r = (save_regs_t *)STACK_DATAP(chunk);
        ctx.bp.regs_i    = NULL;
        ctx.bp_ps.regs_p = save_r->bp_ps.regs_p;
        for (i = 0; i < save_r->n_regs_pmc; ++i) {
            obj = (PObj *)CTX_REG_PMC(&ctx, i);
            if (obj)
                pobject_lives(interpreter, obj);
        }
        for (i = 0; i < save_r->n_regs_str; ++i) {
            obj = (PObj *)CTX_REG_STR(&ctx, i);
            if (obj)
                pobject_lives(interpreter, obj);
        }
    }
}


void
Parrot_clear_i(Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; ++i)
        REG_INT(i) = 0;
}

void
Parrot_clear_s(Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; ++i)
        REG_STR(i) = NULL;
}

void
Parrot_clear_p(Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; ++i)
        REG_PMC(i) = PMCNULL;
}

void
Parrot_clear_n(Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; ++i)
        REG_NUM(i) = 0.0;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/register.h> and F<src/stack_common.c>

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
