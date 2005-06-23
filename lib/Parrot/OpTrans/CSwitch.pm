# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans::CSwitch - C Switch Transform

=head1 DESCRIPTION

C<Parrot::OpTrans::CSwitch> inherits from C<Parrot::OpTrans::CPrederef>
to provide a mixture of predereferenced register addressing and a
C<switch>ed run loop.

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

sub core_type
{
    return 'PARROT_SWITCH_CORE';
}

=item C<core_prefix()>

The prefix is C<'switch_'>.

=cut

sub core_prefix
{
    return "switch_";
}

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
#define REL_PC ((size_t)((opcode_t*)cur_opcode - (opcode_t*)interpreter->code->prederef.code))
#define CUR_OPCODE (interpreter->code->base.data + REL_PC)


static void** opcode_to_prederef(Interp* interpreter,
                                        opcode_t* opcode_addr)
{
    INTVAL offset_in_ops;
    if (opcode_addr == NULL) return NULL;
    offset_in_ops = opcode_addr - (opcode_t*) interpreter->code->base.data;
    return interpreter->code->prederef.code + offset_in_ops;
}

#define OP_AS_OFFS(o) (_reg_base + ((opcode_t*)cur_opcode)[o])

/*
 * if we are using CHECK_EVENTS elsewhere this macro should (again)
 * be in includes/parrot/event.h
 *
 * This gives +50 % performance
 */

#undef  CHECK_EVENTS
#define CHECK_EVENTS(i, n)   \\
	interpreter->task_queue->head ?  \\
		Parrot_do_check_events(i, n) : n
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

    if ($addr eq '0')
    {
  	    return "return (0);"
    }
    else
    {
  	    return <<EOC;
	    {
	       cur_opcode = (opcode_t *) opcode_to_prederef(interpreter, $addr);
	       goto SWITCH_RELOAD;
            }
EOC
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

sub run_core_func_decl
{
    my ($self, $core) = @_;

    return "opcode_t * " .
        $self->core_prefix .
        "$core(opcode_t *cur_op, Parrot_Interp interpreter)";
}

=item C<run_core_func_start()>

Returns the C code prior to the run core function.

=cut

sub run_core_func_start
{
    return <<END_C;
#if defined(__GNUC__) && defined(I386) && __GNUC__ < 4 
    register opcode_t *cur_opcode asm ("esi") = cur_op;
    register char *   _reg_base   asm ("edi");
#else
    opcode_t *cur_opcode = cur_op;
    char * _reg_base;
#endif

SWITCH_RELOAD:
    _reg_base = (char*)interpreter->ctx.bp;
    do {
SWITCH_AGAIN:
    cur_opcode = CHECK_EVENTS(interpreter, cur_opcode);
    if (!cur_opcode)
        break;
    switch (*cur_opcode) {
END_C
}

=item C<run_core_split($base)>

If defined return code to split e.g. a switch.

=cut

sub run_core_split
{
    my ($self) = @_;
    $self->{split_count}++;

    return <<END_C;
    default:
    switch (*cur_opcode) {
END_C
}

=item C<run_core_finish($base)>

Returns the C code following the run core function.

=cut

sub run_core_finish
{
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
END_C
    for (my $i = 0; $i < $self->{split_count}; $i++) {
	$c .= <<END_C;
    } /* switch $i */
END_C
    }
	$c .= <<END_C;
    } while (1);
    return NULL;
}
END_C

    $c .= " /* " . $self->core_prefix . "$base */\n\n";

    return $c;
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
