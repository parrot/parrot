/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/generic_register.c - Generalized register handling routines

=head1 SYNOPSIS

    #define REG_PUSH Parrot_push_p
    #define REG_POP Parrot_pop_p
    #define REG_CLEAR Parrot_clear_p
    #define REG_STACK pmc_reg_stack
    #define REG_TYPE pmc_reg
    #define REG_FRAME PRegFrame
    #define REG_NULL PMCNULL
    #include "generic_register.c"

=head1 DESCRIPTION

This the generalized register handling routines, it uses macros to
define the things that are not common to all of the register stacks, and
then undefines the macros at the end of the file.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<void
REG_PUSH(Interp *interpreter, void *where)>

Pushes a new register frame onto the corresponding frame stack.

=cut

*/

void
REG_PUSH(Interp *interpreter, void *where)
{
    void* top;
    top = stack_prepare_push(interpreter, &interpreter->ctx.REG_STACK);
    Parrot_memcpy_aligned(top, where, sizeof(struct REG_FRAME));
}

/*

=item C<void
REG_POP(Interp *interpreter, void *where)>

Pops a register frame from the corresponding frame stack.

=cut

*/

void
REG_POP(Interp *interpreter, void *where)
{
    void* top;
    top = stack_prepare_pop(interpreter, &interpreter->ctx.REG_STACK);
    Parrot_memcpy_aligned(where, top, sizeof(struct REG_FRAME));
}

/*

=item C<void
REG_CLEAR(Interp *interpreter)>

Sets each register in the current set to C<REG_NULL>.

=cut

*/

void
REG_CLEAR(Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->ctx.bp->REG_TYPE.registers[i] = REG_NULL;
    }
}

#undef REG_PUSH
#undef REG_POP
#undef REG_CLEAR
#undef REG_STACK
#undef REG_TYPE
#undef REG_FRAME
#undef REG_NULL

/*

=back

=head1 SEE ALSO

F<include/parrot/register.h>, F<include/parrot/regfuncs.h> and F<src/register.c>.

=cut

*/

