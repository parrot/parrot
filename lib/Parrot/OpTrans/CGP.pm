# Copyright: 2002 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans::CGP - C Goto Predereferenced Transform

=head1 DESCRIPTION

C<Parrot::OpTrans::CGP> inherits from C<Parrot::OpTrans::CPrederef> and
C<Parrot::OpTrans::CGoto> to provide predereferenced register addressing
and C C<goto> run loop.

=head2 Instance Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans::CGP;

use Parrot::OpTrans;
use Parrot::OpTrans::CPrederef;
use Parrot::OpTrans::CGoto;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans::CPrederef Parrot::OpTrans::CGoto);

=item C<core_type()>

Returns C<PARROT_CGP_CORE>.

=cut

sub core_type
{
    return 'PARROT_CGP_CORE';
}

=item C<suffix()>

The suffix is C<'_cgp'>.

=cut

sub suffix
{
    return "_cgp";
}

=item C<core_prefix()>

The core prefix is C<'cgp_'>.

=cut

sub core_prefix
{
    return "cgp_";
}

=item C<defines()>

Returns the C C<#define> macros required by the ops.

=cut

sub defines
{
    return <<END;
#define REL_PC ((size_t)((opcode_t*)cur_opcode - (opcode_t*)interpreter->code->prederef.code))
#define CUR_OPCODE (interpreter->code->base.data + REL_PC)


PARROT_INLINE static void**
opcode_to_prederef(Interp* interpreter, opcode_t* opcode_addr)
{
    return interpreter->code->prederef.code +
        (opcode_addr - (opcode_t*) interpreter->code->base.data);
}

#define OP_AS_OFFS(o) (_reg_base + ((opcode_t*)cur_opcode)[o])

END
}

=item C<goto_address($address)>

Transforms the C<goto ADDRESS($address)> macro in an ops file into the
relevant C code.

=cut

sub goto_address
{
    my ($self, $addr) = @_;

    #print STDERR "pbcc: map_ret_abs($addr)\n";

    if ($addr eq '0')
    {
        return "return (0);"
    }
    else
    {
        return "if ((opcode_t *) $addr == 0)
	  return 0;
   _reg_base = (char*)interpreter->ctx.bp.regs_i;
   goto *((void*)*(cur_opcode = (opcode_t *)
	opcode_to_prederef(interpreter, $addr)))";
  }
}

=item C<goto_offset($offset)>

Transforms the C<goto OFFSET($offset)> macro in an ops file into the
relevant C code.

=cut

sub goto_offset
{
    my ($self, $offset) = @_;

    return "goto *((void*)*(cur_opcode += $offset))";
}

=item C<goto_pop()>

Transforms the C<goto POP()> macro in an ops file into the relevant C
code.

=cut

sub goto_pop
{
    my ($self) = @_;

    return "goto *((void*)* (cur_opcode = (opcode_t*)opcode_to_prederef(interpreter,pop_dest(interpreter))))";
}

sub run_core_func_start
{
    return <<END_C;
#if defined(__GNUC__) && defined(I386) && __GNUC__ < 4
    register opcode_t *cur_opcode asm ("esi") = cur_op;
    register char *   _reg_base   asm ("edi");
#else
    opcode_t *cur_opcode = cur_op;
    char * _reg_base;
#endif

    static void *const l_ops_addr[] = {
END_C
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::CPrederef>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::Compiled>

=back

=cut

1;
