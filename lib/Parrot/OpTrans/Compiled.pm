#
# CGoto.pm
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans::Compiled;

use Parrot::OpTrans;
use vars qw(@ISA);
@ISA = qw(Parrot::OpTrans);

sub defines
{
  return <<END;
#define CUR_OPCODE cur_opcode
#define IREG(i) interpreter->ctx.int_reg.registers[i]
#define NREG(i) interpreter->ctx.num_reg.registers[i]
#define PREG(i) interpreter->ctx.pmc_reg.registers[i]
#define SREG(i) interpreter->ctx.string_reg.registers[i]
#define CONST(i) interpreter->code->const_table->constants[i]
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
  return "cur_opcode = $addr;\ngoto switch_label";
}


sub expr_offset {
    my ($self, $offset) = @_;
    return sprintf("&&PC_%d", $self->pc + $offset);
}

#
# goto_offset()
#

sub goto_offset
{
  my ($self, $offset) = @_;
  if ($offset =~ /^-?\d+$/) {
  return sprintf("goto PC_%d", $self->pc + $offset);
  } else {
      return sprintf("cur_opcode = &&PC_%d; cur_opcode += %s; goto switch_label", $self->pc, $offset);
  }
#print STDERR "pbcc: map_ret_rel($offset)\n";
}


#
# goto_pop()
#

sub goto_pop
{
  my ($self) = @_;
  return "goto *pop_dest(interpreter)";
}

#
# access_arg()
#

my %arg_maps = (
  'i'  => "IREG(%ld)",
  'n'  => "NREG(%ld)",
  'p'  => "PREG(%ld)",
  's'  => "SREG(%ld)",
  'k'  => "PREG(%ld)",
  'ki' => "IREG(%ld)",

  'ic' => "%ld",
  'nc' => "CONST(%ld)->number",
  'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
  'sc' => "CONST(%ld)->string",
  'kc' => "CONST(%ld)->key",
  'kic' => "%ld",
);

sub access_arg
{
  my ($self, $type, $num, $op) = @_;
#print STDERR "pbcc: map_arg($type, $num)\n";
  return sprintf($arg_maps{$type}, $self->arg($num - 1));
}


#
# restart_address()
#

sub restart_address
{
  my ($self, $addr) = @_;
  die "pbc2c.pl: Cannot handle RESUME ops!";
}


#
# restart_offset()
#

sub restart_offset
{
  my ($self, $offset) = @_;
  die "pbc2c.pl: Cannot handle RESUME ops!";
}


1;

