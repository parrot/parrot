/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/register.c - Register handling routines

=head1 DESCRIPTION

Parrot has 4 register sets, one for each of its basic types. There are
32 registers in each set.

Each register set has a register frame stack for saving and restoring
its contents. Note that, whereas the C<push{i,n,s,p}> opcodes push all
32 registers on to the stack, in the C implementation a register frame
is actually only I<half> the register set. The opcode calls the the
C<Parrot_push_{i,n,s,p}()> function twice, once for each half of the
set.

=head2 Functions

Note that the API header for this file is F<include/parrot/regfuncs.h>
not F<include/parrot/register.h> - that contains the various registers
and register frame stacks.

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<void
setup_register_stacks(Parrot_Interp, struct Parrot_Context *)>

Sets up the register stacks.

=item C<void Parrot_push_regs(Interp *)>

Save all registers onto the register stack.

=item C<void Parrot_pop_regs(Interp *)>

Restore all registers from register stack.

=cut

*/

void
setup_register_stacks(Parrot_Interp interpreter)
{
    CONTEXT(interpreter->ctx)->reg_stack =
        register_new_stack(interpreter,
            "Regs_", sizeof(struct parrot_regs_t));

}

void
Parrot_push_regs(Interp *interpreter)
{
    struct parrot_regs_t *bp = stack_prepare_push(interpreter,
            &CONTEXT(interpreter->ctx)->reg_stack);
    memcpy(bp, interpreter->ctx.bp, sizeof(struct parrot_regs_t));
}

void
Parrot_pop_regs(Interp* interpreter)
{
    /*
     * TODO just move the base pointer - no copying needed
     */
    struct parrot_regs_t *bp = stack_prepare_pop(interpreter,
            &CONTEXT(interpreter->ctx)->reg_stack);
    memcpy(interpreter->ctx.bp, bp, sizeof(struct parrot_regs_t));
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

=item C<void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* stack)>

Marks the register stack and it's registers as live.

=cut

*/

void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    struct parrot_regs_t *regs;
    int i;
    PObj *obj;

    for (; ; chunk = chunk->prev) {
        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
        regs = (struct parrot_regs_t *)STACK_DATAP(chunk);
        for (i = 0; i < NUM_REGISTERS; ++i) {
            obj = (PObj *)BP_REG_PMC(regs, i);
            if (obj)
                pobject_lives(interpreter, obj);
            obj = (PObj *)BP_REG_STR(regs, i);
            if (obj)
                pobject_lives(interpreter, obj);
        }
    }
}



/*

=item C<void
Parrot_push_on_stack(void *thing, INTVAL size, INTVAL type)>

Unimplemented at present.

=cut

*/

void
Parrot_push_on_stack(void *thing, INTVAL size, INTVAL type)
{
    UNUSED(thing);
    UNUSED(size);
    UNUSED(type);
}

/*

=item C<void
Parrot_pop_off_stack(void *thing, INTVAL type)>

Unimplemented at present.

=cut

*/

void
Parrot_pop_off_stack(void *thing, INTVAL type)
{
    UNUSED(thing);
    UNUSED(type);
}


/*

=back

=head1 SEE ALSO

F<include/parrot/register.h>, F<include/parrot/regfuncs.h>, and
F<src/stack_common.c>

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
