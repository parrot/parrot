#
# CPrederef.pm
#

use strict;
#use warnings;

package Parrot::OpTrans::CPrederef;

use Parrot::OpTrans;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans);


#
# defines()
#

sub defines
{
  return <<END;
#define REL_PC ((size_t)(cur_opcode - interpreter->prederef_code))
#define CUR_OPCODE (((opcode_t *)interpreter->code->byte_code) + REL_PC)
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


#
# goto_address()
#

sub goto_address
{
  my ($self, $addr) = @_;
  return "return $addr";
}


#
# goto_offset()
#

sub goto_offset
{
  my ($self, $offset) = @_;
  return "return cur_opcode + $offset";
}


#
# goto_pop()
#

sub goto_pop
{
  my ($self) = @_;
  return "return pop_dest(interpreter)";
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

    'ic' => "(*(INTVAL *)&cur_opcode[%ld])",
    'nc' => "(*(FLOATVAL *)cur_opcode[%ld])",
    'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
    'sc' => "(*(STRING **)cur_opcode[%ld])",
  );

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

