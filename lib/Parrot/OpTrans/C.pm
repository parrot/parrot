#
# C.pm
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans::C;

use Parrot::OpTrans;
use vars qw(@ISA %arg_maps);
@ISA = qw(Parrot::OpTrans);


#
# defines()
#

sub defines
{
  return <<END;
#undef CONST
#define REL_PC     ((size_t)(cur_opcode - interpreter->code->byte_code))
#define CUR_OPCODE cur_opcode
#define IREG(i) interpreter->ctx.int_reg.registers[cur_opcode[i]]
#define NREG(i) interpreter->ctx.num_reg.registers[cur_opcode[i]]
#define PREG(i) interpreter->ctx.pmc_reg.registers[cur_opcode[i]]
#define SREG(i) interpreter->ctx.string_reg.registers[cur_opcode[i]]
#define CONST(i) interpreter->code->const_table->constants[cur_opcode[i]]
END
}

sub gen_goto {
    my ($self, $where_str) = @_;
    return "return (opcode_t *)$where_str";
}

sub expr_address {
  my ($self, $addr) = @_;
  return $addr;
}

sub expr_offset {
    my ($self, $offset) = @_;
    return "cur_opcode + $offset";
}

sub expr_pop {
    my ($self) = @_;
    return "pop_dest(interpreter)";
}

#
# access_arg()
#

%arg_maps = (
  'op' => "cur_opcode[%ld]",

  'i'  => "IREG(%ld)",
  'n'  => "NREG(%ld)",
  'p'  => "PREG(%ld)",
  's'  => "SREG(%ld)",
  'k'  => "PREG(%ld)",
  'ki' => "IREG(%ld)",

  'ic' => "cur_opcode[%ld]",
  'nc' => "CONST(%ld)->number",
  'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
  'sc' => "CONST(%ld)->string",
  'kc' => "CONST(%ld)->key",
  'kic' => "cur_opcode[%ld]"
);

sub access_arg
{
  my ($self, $type, $num, $op) = @_;

  die "Unrecognized type '$type' for num '$num' in opcode @{[$op->full_name]}"
    unless exists $arg_maps{$type};

  return sprintf($arg_maps{$type}, $num);
}


#
# restart_offset()
#

sub restart_offset
{
  my ($self, $offset) = @_;
  return "interpreter->resume_offset = REL_PC + $offset; interpreter->resume_flag = 1";
}


#
# restart_address()
#

sub restart_address
{
  my ($self, $addr) = @_;
  return "interpreter->resume_offset = $addr; interpreter->resume_flag = 1";
}


1;

