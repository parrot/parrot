#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans::CPrederef - C Predereferenced Transform

=head1 DESCRIPTION

C<Parrot::OpTrans::CPrederef> inherits from C<Parrot::OpTrans::C>
to provide predereferenced register addressing run loop.

=head2 Instance Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans::CPrederef;

use Parrot::OpTrans;
use vars qw(@ISA);
use Parrot::OpTrans::C;
@ISA = qw(Parrot::OpTrans::C);

=item C<core_type()>

The core type is C<PARROT_PREDEREF_CORE>.

=cut

sub core_type 
{
    return 'PARROT_PREDEREF_CORE';
}

=item C<prefix()>

The prefix is C<'Parrot_pred_'>.

This is used in C<Parrot::Op>'s C<func_name()>.

=cut

sub prefix 
{ 
    return 'Parrot_pred_'; 
}

=item C<defines()>

Returns the C C<#define> macros required by the ops.

=cut

sub defines
{
    return <<END;
#define REL_PC ((size_t)(cur_opcode - interpreter->prederef.code))
#define CUR_OPCODE (interpreter->code->byte_code + REL_PC)

static opcode_t* prederef_to_opcode(Interp* interpreter,
                                           void** prederef_addr)
{
    INTVAL offset_in_ops;
    if (prederef_addr == NULL) return NULL;
    offset_in_ops = prederef_addr - interpreter->prederef.code;
    return (opcode_t*) interpreter->code->byte_code + offset_in_ops;
}

static void** opcode_to_prederef(Interp* interpreter,
                                        opcode_t* opcode_addr)
{
    INTVAL offset_in_ops;
    if (opcode_addr == NULL) return NULL;
    offset_in_ops = opcode_addr - (opcode_t*) interpreter->code->byte_code;
    return interpreter->prederef.code + offset_in_ops;
}

END
}

=item C<suffix()>

The suffix is C<'_prederef'>.

=cut

sub suffix
{
    return "_prederef";
}

=item C<opsarraytype()>

The ops array type is C<void *>.

=cut

sub opsarraytype 
{ 
    return 'void *' 
};

=item C<gen_goto($where)>

TODO - This is the same implementation as in C<Parrot::OpTrans>. It
should not be duplicated.

=cut

sub gen_goto
{
    my ($self, $where_str) = @_;
    return "return $where_str";
}

=item C<expr_pop()>

Addresses on the stack are pointers into the bytecode array, and so
must be converted to pointers into the prederef array.

=cut

sub expr_pop
{
    my ($self) = @_;
    return "opcode_to_prederef(interpreter, pop_dest(interpreter))";
}

=item C<expr_address($address)>

Same logic as C<expr_pop()>.

=cut

sub expr_address
{
    my ($self, $addr) = @_;
    return "opcode_to_prederef(interpreter, $addr)";
}

=item C<expr_offset($offset)>

=item C<goto_offset($offset)>

=item C<goto_address($address)>

CPrederef is funky in that expr OFFSET(n) uses a pointer to the
original bytecode, but goto OFFSET(n) returns a pointer into the
prederef array. (see expr_pop(), above, for a description of why this
works.)

=cut

sub expr_offset
{
    my ($self, $offset) = @_;
    return "CUR_OPCODE + $offset";
}

sub goto_offset
{
    my ($self, $offset) = @_;
    return "return cur_opcode + $offset";
}

sub goto_address
{
    my ($self, $addr) = @_;
    return "return opcode_to_prederef(interpreter,  (opcode_t *)$addr)";
}

=item C<access_arg($type, $num, $op)>

Returns the C code for the specified op argument type (see
C<Parrot::OpTrans>) and value. C<$op> is an instance of C<Parrot::Op>.

=cut

sub access_arg
{
    my ($self, $type, $num, $op) = @_;

    my %arg_maps = (
        'op' => "cur_opcode[%ld]",
    
        'i'  => "(*(INTVAL *)cur_opcode[%ld])",
        'n'  => "(*(FLOATVAL *)cur_opcode[%ld])",
        'p'  => "(*(PMC **)cur_opcode[%ld])",
        's'  => "(*(STRING **)cur_opcode[%ld])",
        'k'  => "(*(PMC **)cur_opcode[%ld])",
        'ki'  => "(*(INTVAL *)cur_opcode[%ld])",
    
        'ic' => "(*(INTVAL *)cur_opcode[%ld])",
        'nc' => "(*(FLOATVAL *)cur_opcode[%ld])",
        'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
        'sc' => "(*(STRING **)cur_opcode[%ld])",
        'kc' => "(*(PMC **)cur_opcode[%ld])",
        'kic' => "(*(INTVAL *)cur_opcode[%ld])"
    );

    die "Unrecognized type '$type' for num '$num' in opcode @{[$op->full_name]}"
        unless exists $arg_maps{$type};

    return sprintf($arg_maps{$type}, $num);
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::Compiled>

=cut

1;

