#
# CGoto.pm
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans::CGoto;

use Parrot::OpTrans;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans);

sub suffix { return "_cg"; }
sub core_prefix {
    return "cg_";
}


sub core_type {
    return 'PARROT_CGOTO_CORE';
}

sub defines
{
  return <<END;
#undef CONST
#define REL_PC     ((size_t)(cur_opcode - interpreter->code->byte_code))
#define CUR_OPCODE cur_opcode
#define IREG(i) interpreter->int_reg.registers[cur_opcode[i]]
#define NREG(i) interpreter->num_reg.registers[cur_opcode[i]]
#define PREG(i) interpreter->pmc_reg.registers[cur_opcode[i]]
#define SREG(i) interpreter->string_reg.registers[cur_opcode[i]]
#define CONST(i) interpreter->code->const_table->constants[cur_opcode[i]]
END
}


#
# pc()
#

sub pc
{
  my $self = shift;

  if (@_) {
    $self->{PC} = shift;
  }
  else {
    return $self->{PC};
  }
}


#
# args()
#

sub args
{
  my $self = shift;

  if (@_) {
    $self->{ARGS} = [ @_ ];
  }
  else {
    return $self->{ARGS};
  }

}


#
# arg()
#

sub arg
{
  my $self = shift;

  return $self->{ARGS}[shift];
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
    goto *ops_addr[*(cur_opcode = (opcode_t *)$addr)]";
  }
}


sub expr_offset {
    my ($self, $offset) = @_;
    return "cur_opcode + $offset";
}

#
# goto_offset()
#

sub goto_offset
{
  my ($self, $offset) = @_;
  return "goto *ops_addr[*(cur_opcode += $offset)]";
}


#
# goto_pop()
#

sub goto_pop
{
  my ($self) = @_;
  return "opcode_t* pop_addr = (opcode_t*)pop_dest(interpreter);\ncur_opcode = pop_addr;goto *ops_addr[*(pop_addr)]";
}

#
# access_arg()
#

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

sub access_arg
{
  my ($self, $type, $num, $op) = @_;
#print STDERR "pbcc: map_arg($type, $num)\n";
  die "Unrecognized type '$type' for num '$num'" unless exists $arg_maps{$type};

  return sprintf($arg_maps{$type}, $num );
}


#
# restart_address()
#

sub restart_address
{
  my ($self, $addr) = @_;
  return "interpreter->resume_offset = $addr; interpreter->resume_flag = 1";
}


#
# restart_offset()
#

sub restart_offset
{
  my ($self, $offset) = @_;
  return "interpreter->resume_offset = REL_PC + $offset; interpreter->resume_flag = 1";
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

sub ops_addr_decl {
    my ($self, $bs) = @_;
    "static void **${bs}ops_addr;\n\n";
}

sub run_core_func_start {
    return <<END_C;
#if defined(__GNUC__) && defined(I386) && defined(NO_DYNOPS)
    register opcode_t *cur_opcode asm ("esi") = cur_op;
#else
    opcode_t *cur_opcode = cur_op;
#endif

    static void *l_ops_addr[] = {
END_C
}

sub run_core_after_addr_table {
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

sub run_core_finish {
    my ($self, $base) = @_;
    return "\n} /* " . $self->core_prefix . "$base */\n\n";

}

sub init_func_init1 {
    my ($self, $base) = @_;
    my $cg_func = $self->core_prefix . $base;
    my $bs = $base . $self->suffix . '_';
    return <<END_C;
 	if (!${bs}op_lib.op_func_table)
            ${bs}op_lib.op_func_table = (op_func_t *) $cg_func(0, 0);
END_C
}

sub init_set_dispatch {
    my ($self, $bs) = @_;
    return <<END_C;
        ${bs}ops_addr = (void**) init;
END_C
}
1;

