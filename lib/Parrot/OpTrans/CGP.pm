#
# CGP.pm CGoto Prederefed
#        this is a mixture of prederefed register addressing and the
#        CGoto runloop
#        Please consult the corresponding OpTrans files for more
#
# Author: leo
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans::CGP;

use Parrot::OpTrans;
use Parrot::OpTrans::CPrederef;
use Parrot::OpTrans::CGoto;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans::CPrederef Parrot::OpTrans::CGoto);


sub core_type {
    return 'PARROT_CGP_CORE';
}

#
# suffix()
#

sub suffix
{
  return "_cgp";
}

sub core_prefix {
    return "cgp_";
}

sub defines
{
  return <<END;
#define REL_PC ((size_t)((opcode_t*)cur_opcode - (opcode_t*)interpreter->prederef.code))
#define CUR_OPCODE (interpreter->code->byte_code + REL_PC)


PARROT_INLINE static void**
opcode_to_prederef(struct Parrot_Interp* interpreter,
                                        opcode_t* opcode_addr)
{
    return interpreter->prederef.code +
        (opcode_addr - (opcode_t*) interpreter->code->byte_code);
}

END
}
#
# goto_address()
#

sub goto_address
{
  my ($self, $addr) = @_;
#print STDERR "pbcc: map_ret_abs($addr)\n";
  if ($addr eq '0') {
  	return "return (0);"
  } else {
  	return "if ((opcode_t *) $addr == 0)
	  return 0;
   goto **(cur_opcode = (opcode_t *)
	opcode_to_prederef(interpreter, $addr))";
  }
}

#
# goto_offset()
#

sub goto_offset
{
  my ($self, $offset) = @_;
  return "goto **(cur_opcode += $offset)";
}
#
# goto_pop()
#

sub goto_pop
{
  my ($self) = @_;
  return "goto ** (cur_opcode = (opcode_t*)opcode_to_prederef(interpreter,pop_dest(interpreter)))";
}

#############################################
# ops2c code generation functions
#

