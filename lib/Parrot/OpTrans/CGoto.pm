# Copyright: 2002 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans::CGoto - CGoto Transform

=head1 DESCRIPTION

Used to generate C code from Parrot operations.

C<Parrot::OpTrans::CGoto> inherits from C<Parrot::OpTrans> to provide a
C C<goto> run loop.

=head2 Instance Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans::CGoto;

use Parrot::OpTrans;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans);

=item C<suffix()>

The suffix is C<'_cg'>.

=cut

sub suffix
{
    return "_cg";
}

=item C<core_prefix()>

The core prefix is C<'cg_'>.

=cut

sub core_prefix
{
    return "cg_";
}

=item C<core_type()>

The core type is C<PARROT_CGOTO_CORE>.

=cut

sub core_type
{
    return 'PARROT_CGOTO_CORE';
}

=item C<defines()>

Returns the C C<#define> macros required by the ops.

=cut

sub defines
{
    return <<END;
#undef CONST
#define REL_PC     ((size_t)(cur_opcode - interpreter->code->byte_code))
#define CUR_OPCODE cur_opcode
#define IREG(i) REG_INT(cur_opcode[i])
#define NREG(i) REG_NUM(cur_opcode[i])
#define PREG(i) REG_PMC(cur_opcode[i])
#define SREG(i) REG_STR(cur_opcode[i])
#define CONST(i) interpreter->code->const_table->constants[cur_opcode[i]]
END
}

=item C<pc($pc)>

=item C<pc()>

Sets/gets the current position in Parrot code.

=cut

sub pc
{
    my $self = shift;

    if (@_)
    {
        $self->{PC} = shift;
    }
    else
    {
        return $self->{PC};
    }
}

=item C<args(@args)>

=item C<args()>

Sets/gets the transform's arguments.

=cut

sub args
{
    my $self = shift;

    if (@_)
    {
        $self->{ARGS} = [ @_ ];
    }
    else
    {
        return $self->{ARGS};
    }
}

=item C<arg($index)>

Returns the argument at C<$index>.

=cut

sub arg
{
    my $self = shift;

    return $self->{ARGS}[shift];
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
  	    return "if ((opcode_t *) $addr == 0)
	  return 0;
    goto *ops_addr[*(cur_opcode = (opcode_t *)$addr)]";
    }
}

=item C<expr_offset($offset)>

Transforms the C<OFFSET($offset)> macro in an ops file into the
relevant C code.

=cut

sub expr_offset
{
    my ($self, $offset) = @_;

    return "cur_opcode + $offset";
}

=item C<goto_offset($offset)>

Transforms the C<goto OFFSET($offset)> macro in an ops file into the
relevant C code.

=cut

sub goto_offset
{
    my ($self, $offset) = @_;

    return "goto *ops_addr[*(cur_opcode += $offset)]";
}

=item C<goto_pop()>

Transforms the C<goto POP()> macro in an ops file into the relevant C
code.

=cut

sub goto_pop
{
    my ($self) = @_;

    return "opcode_t* pop_addr = (opcode_t*)pop_dest(interpreter);\ncur_opcode = pop_addr;goto *ops_addr[*(pop_addr)]";
}

my %arg_maps = (
    'op' => "cur_opcode[%ld]",

    'i'  => "IREG(%ld)",
    'n'  => "NREG(%ld)",
    'p'  => "PREG(%ld)",
    's'  => "SREG(%ld)",
    'k'  => "PREG(%ld)",
    'ki' => "IREG(%ld)",

    'ic' => "cur_opcode[%ld]",
    'nc' => "CONST(%ld)->u.number",
    'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
    'sc' => "CONST(%ld)->u.string",
    'kc' => "CONST(%ld)->u.key",
    'kic' => "cur_opcode[%ld]"
);

=item C<access_arg($type, $num, $op)>

Returns the C code for the specified op argument type (see
C<Parrot::OpTrans>) and value. C<$op> is an instance of C<Parrot::Op>.

=cut

sub access_arg
{
    my ($self, $type, $num, $op) = @_;

    #print STDERR "pbcc: map_arg($type, $num)\n";

    die "Unrecognized type '$type' for num '$num'" unless exists $arg_maps{$type};

    return sprintf($arg_maps{$type}, $num );
}

=item C<restart_address($address)>

Returns the C code for C<restart ADDRESS($address)>.

=cut

sub restart_address
{
    my ($self, $addr) = @_;

    return "interpreter->resume_offset = $addr; interpreter->resume_flag = 1";
}

=item C<restart_offset($offset)>

Returns the C code for C<restart OFFSET($offset)>.

=cut

sub restart_offset
{
    my ($self, $offset) = @_;

    return "interpreter->resume_offset = REL_PC + $offset; interpreter->resume_flag = 1";
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

=item C<ops_addr_decl($base_suffix)>

Returns the C code for the ops address declaration.

=cut

sub ops_addr_decl
{
    my ($self, $bs) = @_;

    return "static void **${bs}ops_addr;\n\n";
}

=item C<run_core_func_start()>

Returns the C code prior to the run core function.

=cut

sub run_core_func_start
{
    return <<END_C;
#if defined(__GNUC__) && defined(I386) /* && defined(NO_DYNOPS) */
    register opcode_t *cur_opcode asm ("esi") = cur_op;
#else
    opcode_t *cur_opcode = cur_op;
#endif

    static void *l_ops_addr[] = {
END_C
}

=item C<run_core_after_addr_table($base_suffix)>

Returns the run core C code for section after the address table.

=cut

sub run_core_after_addr_table
{
    my ($self, $bs) = @_;

    return <<END_C;

/* #ifdef HAVE_NESTED_FUNC */
#ifdef __GNUC__
    static void _check(void);
    static void _check(void) {
	int lo_var_ptr;
	if (!interpreter->lo_var_ptr)
	    interpreter->lo_var_ptr = (void*)&lo_var_ptr;
    }
#endif
/* #endif */

    if (!${bs}ops_addr)
	${bs}ops_addr = l_ops_addr;
    if (cur_opcode == 0) {
        return (opcode_t *)${bs}ops_addr ;
    }
END_C
}

=item C<run_core_finish($base)>

Returns the C code following the run core function.

=cut

sub run_core_finish
{
    my ($self, $base) = @_;

    return "\n} /* " . $self->core_prefix . "$base */\n\n";
}

=item C<init_func_init1($base)>

Returns the C code for the init function.

=cut

sub init_func_init1
{
    my ($self, $base) = @_;
    my $cg_func = $self->core_prefix . $base;
    my $bs = $base . $self->suffix . '_';

    return <<END_C;
 	if (!${bs}op_lib.op_func_table)
            ${bs}op_lib.op_func_table = (op_func_t *) $cg_func(0, 0);
END_C
}

=item C<init_set_dispatch($base_suffix)>

Returns the C code to initialize the dispatch mechanism within the core's
initialization function.

=cut

sub init_set_dispatch
{
    my ($self, $bs) = @_;

    return <<END_C;
        ${bs}ops_addr = (void**) init;
END_C
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CPrederef>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::Compiled>

=cut

1;

