#
# CPrederef.pm
#
# Inherits from C.pm
#

use strict;
#use warnings;

package Parrot::OpTrans::CPrederef;

use Parrot::OpTrans;
use vars qw(@ISA);
use Parrot::OpTrans::C;
@ISA = qw(Parrot::OpTrans::C);

sub core_type {
    return 'PARROT_PREDEREF_CORE';
}

sub prefix { return 'Parrot_pred_'; }

#
# defines()
#

sub defines
{
  return <<END;
#define REL_PC ((size_t)(cur_opcode - interpreter->prederef.code))
#define CUR_OPCODE (interpreter->code->byte_code + REL_PC)

static opcode_t* prederef_to_opcode(struct Parrot_Interp* interpreter,
                                           void** prederef_addr)
{
    INTVAL offset_in_ops;
    if (prederef_addr == NULL) return NULL;
    offset_in_ops = prederef_addr - interpreter->prederef.code;
    return (opcode_t*) interpreter->code->byte_code + offset_in_ops;
}

static void** opcode_to_prederef(struct Parrot_Interp* interpreter,
                                        opcode_t* opcode_addr)
{
    INTVAL offset_in_ops;
    if (opcode_addr == NULL) return NULL;
    offset_in_ops = opcode_addr - (opcode_t*) interpreter->code->byte_code;
    return interpreter->prederef.code + offset_in_ops;
}

END
}


#
# suffix()
#

sub suffix
{
  return "_prederef";
}

sub opsarraytype { return 'void *' };

sub gen_goto {
    my ($self, $where_str) = @_;
    return "return $where_str";
}


# expr_pop
#
# Addresses on the stack are pointers into the bytecode array, and so
# must be converted to pointers into the prederef array.
#

sub expr_pop
{
  my ($self) = @_;
  return "opcode_to_prederef(interpreter, pop_dest(interpreter))";
}

# expr_address
#
# Same logic as expr_pop
#

sub expr_address
{
  my ($self, $addr) = @_;
  return "opcode_to_prederef(interpreter, $addr)";
}

# expr_offset and goto_offset
#
# CPrederef is funky in that expr OFFSET(n) uses a pointer to the
# original bytecode, but goto OFFSET(n) returns a pointer into the
# prederef array. (see expr_pop, above, for a description of why this
# works.)
#

sub expr_offset {
    my ($self, $offset) = @_;
    return "CUR_OPCODE + $offset";
}

sub goto_offset {
    my ($self, $offset) = @_;
    return "return cur_opcode + $offset";
}

sub goto_address {
    my ($self, $addr) = @_;
    return "return opcode_to_prederef(interpreter,  (opcode_t *)$addr)";
}

#
# access_arg()
#

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

1;

