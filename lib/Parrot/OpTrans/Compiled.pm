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
#define REL_PC (cur_opcode - start_code)
#define IREG(i) interpreter->int_reg.registers[i]
#define NREG(i) interpreter->num_reg.registers[i]
#define PREG(i) interpreter->pmc_reg.registers[i]
#define SREG(i) interpreter->string_reg.registers[i]
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


#
# expr_offset()
#
# On offset expression is always an offset from start_code, because
# the 'ret' instruction may be in a different runops core. 'ret' will
# always treat saved addresses as relative to start_code, because that
# interpretation is global across all runops cores.
#
sub expr_offset {
    my ($self, $offset) = @_;
    return sprintf("start_code + %d + %s", $self->pc, $offset);
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
  return "cur_opcode = pop_dest(interpreter);\ngoto switch_label";
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
  'nc' => "CONST(%ld)->u.number",
  'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
  'sc' => "CONST(%ld)->u.string",
  'kc' => "CONST(%ld)->u.key",
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

