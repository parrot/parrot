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

sub defines
{
  return <<END;
#define REL_PC     ((size_t)(cur_opcode - interpreter->code->byte_code))
#define CUR_OPCODE cur_opcode
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
  	return "goto *ops_addr[*(cur_opcode = (opcode_t *)$addr)]";
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

  'i'  => "interpreter->ctx.int_reg.registers[cur_opcode[%ld]]",
  'n'  => "interpreter->ctx.num_reg.registers[cur_opcode[%ld]]",
  'p'  => "interpreter->ctx.pmc_reg.registers[cur_opcode[%ld]]",
  's'  => "interpreter->ctx.string_reg.registers[cur_opcode[%ld]]",
  'k'  => "interpreter->ctx.pmc_reg.registers[cur_opcode[%ld]]",
  'ki'  => "interpreter->ctx.int_reg.registers[cur_opcode[%ld]]",

  'ic' => "cur_opcode[%ld]",
  'nc' => "interpreter->code->const_table->constants[cur_opcode[%ld]]->number",
  'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
  'sc' => "interpreter->code->const_table->constants[cur_opcode[%ld]]->string",
  'kc' => "interpreter->code->const_table->constants[cur_opcode[%ld]]->key",
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

1;

