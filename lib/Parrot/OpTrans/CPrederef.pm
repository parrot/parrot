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
#define CUR_OPCODE (interpreter->code->byte_code + REL_PC)

#ifdef _MSC_VER
#define inline __inline
typedef int ssize_t;
#endif

static INLINE opcode_t* prederef_to_opcode(struct Parrot_Interp* interpreter,
                                           void** prederef_addr)
{
    ssize_t offset_in_ops;
    if (prederef_addr == NULL) return NULL;
    offset_in_ops = prederef_addr - interpreter->prederef_code;
    return (opcode_t*) interpreter->code->byte_code + offset_in_ops;
}

static INLINE void** opcode_to_prederef(struct Parrot_Interp* interpreter,
                                        opcode_t* opcode_addr)
{
    ssize_t offset_in_ops;
    if (opcode_addr == NULL) return NULL;
    offset_in_ops = opcode_addr - (opcode_t*) interpreter->code->byte_code;
    return interpreter->prederef_code + offset_in_ops;
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
    return "return opcode_to_prederef(interpreter, $addr)";
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

