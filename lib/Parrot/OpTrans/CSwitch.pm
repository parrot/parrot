# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans::CSwitch - C Switch Transform

=head1 DESCRIPTION

C<Parrot::OpTrans::CSwitch> inherits from C<Parrot::OpTrans::CPrederef>
to provide a mixture of prederefed register addressing and a C<switch>ed 
run loop.

=head2 Instance Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans::CSwitch;

use Parrot::OpTrans;
use Parrot::OpTrans::CPrederef;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans::CPrederef);

=item C<core_type()>

The core type is C<PARROT_SWITCH_CORE>.

=cut

sub core_type {
    return 'PARROT_SWITCH_CORE';
}

=item C<core_prefix()>

The prefix is C<'switch_'>.

=cut

sub core_prefix { return "switch_"; }

=item C<suffix()>

The suffix is C<'_switch'>.

=cut

sub suffix
{
  return "_switch";
}

=item C<defines()>

Returns the C C<#define> macros required by the ops.

=cut

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

=item C<goto_address($address)>

Transforms the C<goto ADDRESS($address)> macro in an ops file into the
relevant C code.

=cut

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

=item C<goto_offset($offset)>

Transforms the C<goto OFFSET($offset)> macro in an ops file into the
relevant C code.

=cut

sub goto_offset
{
  my ($self, $offset) = @_;
  return "{ cur_opcode += $offset; goto SWITCH_AGAIN; }";
}

=item C<goto_pop()>

Transforms the C<goto POP()> macro in an ops file into the relevant C
code.

=cut

sub goto_pop
{
  my ($self) = @_;
  return "{ cur_opcode = (opcode_t*)opcode_to_prederef(interpreter,pop_dest(interpreter));\n  goto SWITCH_AGAIN; }";
}

=item C<run_core_func_decl($core)>

Returns the C code for the run core function declaration.

=cut

sub run_core_func_decl {
    my ($self, $core) = @_;
    "opcode_t * " .
    $self->core_prefix .
    "$core(opcode_t *cur_op, Parrot_Interp interpreter)";
}

=item C<run_core_func_start()>

Returns the C code prior to the run core function.

=cut

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

=item C<run_core_finish($base)>

Returns the C code following the run core function.

=cut

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

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::CPrederef>

=item C<Parrot::OpTrans::Compiled>

=back

=cut

1;
