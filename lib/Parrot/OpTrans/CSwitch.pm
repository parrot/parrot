#
# CSwitch.pm CSwitch Prederefed
#        this is a mixture of prederefed register addressing and
#        switched runloop
#        Please consult the corresponding OpTrans files for more
#
# Author: leo
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans::CSwitch;

use Parrot::OpTrans;
use Parrot::OpTrans::CPrederef;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans::CPrederef);

sub core_type {
    return 'PARROT_SWITCH_CORE';
}

sub core_prefix { return "switch_"; }

#
# suffix()
#

sub suffix
{
  return "_switch";
}

sub defines
{
  return <<END;
#define REL_PC ((size_t)((opcode_t*)cur_opcode - (opcode_t*)interpreter->prederef.code))
#define CUR_OPCODE (interpreter->code->byte_code + REL_PC)


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
# goto_address()
#

sub goto_address
{
  my ($self, $addr) = @_;
#print STDERR "pbcc: map_ret_abs($addr)\n";
  if ($addr eq '0') {
  	return "return (0);"
  } else {
  	return " {cur_opcode = (opcode_t *) opcode_to_prederef(interpreter, $addr); goto SWITCH_AGAIN; }";
  }
}

#
# goto_offset()
#

sub goto_offset
{
  my ($self, $offset) = @_;
  return "{ cur_opcode += $offset; goto SWITCH_AGAIN; }";
}
#
# goto_pop()
#

sub goto_pop
{
  my ($self) = @_;
  return "{ cur_opcode = (opcode_t*)opcode_to_prederef(interpreter,pop_dest(interpreter));\n  goto SWITCH_AGAIN; }";
}

#############################################
# ops2c code generation functions
#
# the run core function
sub run_core_func_decl {
    my ($self, $core) = @_;
    "opcode_t * " .
    $self->core_prefix .
    "$core(opcode_t *cur_op, Parrot_Interp interpreter)";
}

sub run_core_func_start {
    return <<END_C;
    opcode_t *cur_opcode = cur_op;

    do {
SWITCH_AGAIN:
    cur_opcode = CHECK_EVENTS(interpreter, cur_opcode);
    if (!cur_opcode)
        break;
    switch (*cur_opcode) {
END_C
}

sub run_core_finish {
    my ($self, $base) = @_;
    my $bs = $base . $self->suffix . '_';
    my $c = <<END_C;
	default:
	    if (*cur_opcode >= 0 && *cur_opcode < (opcode_t)${bs}op_lib.op_count) {
		*cur_opcode = CORE_OPS_wrapper__;
		continue;
	    }
	    internal_exception(1, "illegal opcode\\n");
	    break;
	} /* switch */
    } while (1);
    return NULL;
}
END_C
    $c .= " /* " . $self->core_prefix . "$base */\n\n";
    $c;
}
