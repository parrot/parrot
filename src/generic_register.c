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
    #define REG_CHUNK_BUF PRegChunkBuf
    #define REG_FRAME PRegFrame
    #define REG_EXCEPTION_STRING "No more P register frames to pop!"
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
REG_PUSH(struct Parrot_Interp *interpreter, void *where)>

Pushes a new register frame onto the corresponding frame stack.

=cut

*/

void
REG_PUSH(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top;
    top = regstack_push_entry(interpreter, &interpreter->ctx.REG_STACK);
    memcpy(&((struct REG_CHUNK_BUF*)top->data.bufstart)->
            REG_FRAME[top->used-1].registers,
            where,
	    sizeof(struct REG_FRAME));
}

/*

=item C<void
REG_POP(struct Parrot_Interp *interpreter, void *where)>

Pops a register frame from the corresponding frame stack.

=cut

*/

void
REG_POP(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top = interpreter->ctx.REG_STACK.top;
    /* Do we even have anything? */
    if (top->used > 0) {
        memcpy(where,
                &((struct REG_CHUNK_BUF*)top->data.bufstart)->
		REG_FRAME[top->used-1].registers,
                sizeof(struct REG_FRAME));
        regstack_pop_entry(interpreter, &interpreter->ctx.REG_STACK);
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, REG_EXCEPTION_STRING);
    }
}

/*

=item C<void
REG_CLEAR(struct Parrot_Interp *interpreter)>

Sets each register in the current set to C<REG_NULL>.

=cut

*/

void
REG_CLEAR(struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->REG_TYPE.registers[i] = REG_NULL;
    }
}

#undef REG_PUSH
#undef REG_POP
#undef REG_CLEAR
#undef REG_STACK
#undef REG_TYPE
#undef REG_CHUNK_BUF
#undef REG_FRAME
#undef REG_EXCEPTION_STRING
#undef REG_NULL

/*

=back

=head1 SEE ALSO

F<include/parrot/register.h>, F<include/parrot/regfuncs.h> and F<src/register.c>.

=cut

*/

