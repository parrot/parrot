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

# expr_pop
#
# Addresses on the stack are pointers into the bytecode array, and so
# must be converted to pointers into the prederef array.
#

sub expr_pop
{
  my ($self) = @_;
  return "(((opcode_t *)pop_dest(interpreter) - (opcode_t *)interpreter->code->byte_code) + interpreter->prederef_code)";
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

    'ic' => "(*(INTVAL *)cur_opcode[%ld])",
    'nc' => "(*(FLOATVAL *)cur_opcode[%ld])",
    'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
    'sc' => "(*(STRING **)cur_opcode[%ld])",
  );

  die "Unrecognized type '$type' for num '$num' in opcode @{[$op->full_name]}"
    unless exists $arg_maps{$type};

  return sprintf($arg_maps{$type}, $num);
}

1;

