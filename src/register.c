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

=cut

*/

void
setup_register_stacks(Parrot_Interp interpreter, struct Parrot_Context *ctx)
{
    ctx->int_reg_stack = register_new_stack(interpreter,
            "IntReg_", sizeof(struct IRegFrame));

    ctx->string_reg_stack = register_new_stack(interpreter,
            "StringReg_", sizeof(struct SRegFrame));

    ctx->num_reg_stack = register_new_stack(interpreter,
            "NumReg_", sizeof(struct NRegFrame));

    ctx->pmc_reg_stack = register_new_stack(interpreter,
            "PMCReg_", sizeof(struct PRegFrame));

    ctx->reg_stack = register_new_stack(interpreter,
            "Register_", sizeof(struct parrot_regs_t));

    ctx->bp = (struct parrot_regs_t *)STACK_DATAP(ctx->reg_stack);

}


/*

=item C<void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* stack)>

Marks the INT or NUM register stack as live.

=item C<void
mark_pmc_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* stack)>

Marks the PMC register stack as live.

=cut

*/

void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    for (; ; chunk = chunk->prev) {
        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
    }
}

void
mark_pmc_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    UINTVAL j;
    for ( ; ; chunk = chunk->prev) {
        struct PRegFrame *pf = (struct PRegFrame *)STACK_DATAP(chunk);

        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
        /* TODO for variable sized chunks use buflen */
        for (j = 0; j < NUM_REGISTERS/2; j++) {
            PObj* reg = (PObj*) pf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
        }
    }
}

void
mark_reg_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    UINTVAL j;
    PObj *obj;

    for ( ; ; chunk = chunk->prev) {
        struct parrot_regs_t *regs = (struct parrot_regs_t *)STACK_DATAP(chunk);

        pobject_lives(interpreter, (PObj*)chunk);

        for (j = 0; j < NUM_REGISTERS; j++) {
            obj = (PObj*) BP_REG_PMC(regs, j);
            if (obj)
                pobject_lives(interpreter, obj);
            obj = (PObj*) BP_REG_STR(regs, j);
            if (obj)
                pobject_lives(interpreter, obj);
        }
        if (chunk == chunk->prev)
            break;
    }
}

/*

=item C<void
mark_string_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* stack)>

Mark the contents of the string register stack as live.

=cut

*/

void
mark_string_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    UINTVAL j;
    for ( ; ; chunk = chunk->prev) {
        struct SRegFrame *sf = (struct SRegFrame *)STACK_DATAP(chunk);

        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
        for (j = 0; j < NUM_REGISTERS/2; j++) {
            PObj* reg = (PObj*) sf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
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

#define REG_PUSH Parrot_push_i
#define REG_POP Parrot_pop_i
#define REG_CLEAR Parrot_clear_i
#define REG_STACK int_reg_stack
#define REG_TYPE int_reg
#define REG_FRAME IRegFrame
#define REG_NULL 0
#include "generic_register.c"

#define REG_PUSH Parrot_push_s
#define REG_POP Parrot_pop_s
#define REG_CLEAR Parrot_clear_s
#define REG_STACK string_reg_stack
#define REG_TYPE string_reg
#define REG_FRAME SRegFrame
#define REG_NULL NULL
#include "generic_register.c"

#define REG_PUSH Parrot_push_n
#define REG_POP Parrot_pop_n
#define REG_CLEAR Parrot_clear_n
#define REG_STACK num_reg_stack
#define REG_TYPE num_reg
#define REG_FRAME NRegFrame
#define REG_NULL 0.0
#include "generic_register.c"

#define REG_PUSH Parrot_push_p
#define REG_POP Parrot_pop_p
#define REG_CLEAR Parrot_clear_p
#define REG_STACK pmc_reg_stack
#define REG_TYPE pmc_reg
#define REG_FRAME PRegFrame
#define REG_NULL PMCNULL
#include "generic_register.c"


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
