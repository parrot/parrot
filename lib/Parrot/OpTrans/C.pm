# Copyright: 2002 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans::C - Ops to C Code Generation

=head1 DESCRIPTION

C<Parrot::OpTrans::C> inherits from C<Parrot::OpTrans> to provide a
function-based (slow or fast core) run loop.

=head2 Instance Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans::C;

use Parrot::OpTrans;
use vars qw(@ISA %arg_maps);
@ISA = qw(Parrot::OpTrans);

=item C<core_type()>

Returns C<PARROT_FUNCTION_CORE>.

=cut

sub core_type
{
    return 'PARROT_FUNCTION_CORE';
}

=item C<core_prefix()>

Returns an empty string.

=cut

sub core_prefix
{
    return "";
}

=item C<defines()>

Returns the C C<#define> macros for register access etc.

=cut

sub defines
{
    return <<END;
#undef CONST
#define REL_PC     ((size_t)(cur_opcode - interpreter->code->byte_code))
#define CUR_OPCODE cur_opcode
#define IREG(i) REG_INT(cur_opcode[i])
#define NREG(i) REG_NUM(cur_opcode[i])
#define PREG(i) REG_PMC(cur_opcode[i])
#define SREG(i) REG_STR(cur_opcode[i])
#define CONST(i) interpreter->code->const_table->constants[cur_opcode[i]]
END
}

=item C<gen_goto($where)>

Reimplements the superclass method so that C<$where> is suitably cast.

=cut

sub gen_goto
{
    my ($self, $where_str) = @_;

    return "return (opcode_t *)$where_str";
}

=item C<expr_address($address)>

Returns the C code for C<ADDRESS($address)>. Called by C<goto_address()>.

=cut

sub expr_address
{
    my ($self, $addr) = @_;

    return $addr;
}

=item C<expr_offset($offset)>

Returns the C code for C<OFFSET($offset)>. Called by C<goto_offset()>.

=cut

sub expr_offset
{
    my ($self, $offset) = @_;

    return "cur_opcode + $offset";
}

=item C<expr_pop()>

Returns the C code for C<POP()>. Called by C<goto_offset()>.

=cut

sub expr_pop
{
    my ($self) = @_;

    return "pop_dest(interpreter)";
}

%arg_maps = (
  'op' => "cur_opcode[%ld]",

  'i'  => "IREG(%ld)",
  'n'  => "NREG(%ld)",
  'p'  => "PREG(%ld)",
  's'  => "SREG(%ld)",
  'k'  => "PREG(%ld)",
  'ki' => "IREG(%ld)",

  'ic' => "cur_opcode[%ld]",
  'nc' => "CONST(%ld)->u.number",
  'pc' => "CONST(%ld)->u.key",
  'sc' => "CONST(%ld)->u.string",
  'kc' => "CONST(%ld)->u.key",
  'kic' => "cur_opcode[%ld]"
);

=item C<access_arg($type, $value, $op)>

Returns the C code for the specified op argument type (see
C<Parrot::OpTrans>) and value. C<$op> is an instance of C<Parrot::Op>.

=cut

sub access_arg
{
    my ($self, $type, $num, $op) = @_;

    die "Unrecognized type '$type' for num '$num' in opcode @{[$op->full_name]}"
        unless exists $arg_maps{$type};

    return sprintf($arg_maps{$type}, $num);
}

=item C<restart_offset($offset)>

Returns the C code for C<restart OFFSET($offset)>.

=cut

sub restart_offset
{
    my ($self, $offset) = @_;

    return "interpreter->resume_offset = REL_PC + $offset; interpreter->resume_flag = 1";
}

=item C<restart_address($address)>

Returns the C code for C<restart ADDRESS($address)>.

=cut

sub restart_address
{
    my ($self, $addr) = @_;

    return "interpreter->resume_offset = $addr; interpreter->resume_flag = 1";
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::CPrederef>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::Compiled>

=back

=cut

1;

