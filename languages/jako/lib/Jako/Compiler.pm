#
# Compiler.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Compiler;

use Carp;
use FileHandle;

use base qw(Jako::Processor);


#
# block_label()
#

sub block_label
{
  my $self = shift;
  my ($kind) = @_;

  return sprintf("_%s_%d", uc $kind, ++$self->{BLOCK_COUNT});
}


#
# temp_reg()
#

sub temp_reg
{
  my $self = shift;
  my ($type) = @_;

  $type = shift->code if ref $type;

  return '$' . $type . $self->{REG_COUNT}{$type}++;
}

sub temp_int { return shift->temp_reg('I'); }
sub temp_num { return shift->temp_reg('N'); }
sub temp_obj { return shift->temp_reg('P'); }
sub temp_str { return shift->temp_reg('S'); }


#
# anon_lbl()
#

my $anon_lbl_count = 0;

sub anon_lbl
{
  my $self = shift;
  return '_ANON_LABEL_' . ++$self->{ANON_LBL_COUNT};
}


#
# invert_relop()
#

my %inverted_ops = (
  '==' => '!=',
  '!=' => '==',
  '<=' => '>',
  '<'  => '>=',
  '>=' => '<',
  '>'  => '<='
);

sub invert_relop
{
  my $self = shift;
  my $op = shift;
 
  confess "Undefined op!" unless defined $op;

  my $new_op = $inverted_ops{$op};

  confess "Unrecognized op '$op'!" unless defined $new_op;

  return $new_op;
}
 

#
# new()
#

sub new
{
  my $class = shift;

  return bless {
    FILE           => undef,
    LINE           => undef,
    LABELS         => [ ],
    COMMENTS       => [ ],
    LAST_OP        => 'noop',
    INDENT         => 0,
    REG_COUNT      => {  'I' => 0, 'N' => 0, 'P' => 0, 'S' => 0 },
    ANON_LBL_COUNT => 0,
    BLOCK_COUNT    => 0
  }, $class;
}


#
# indent()
#

sub indent
{
  my $self = shift;
  $self->{INDENT} += 4;
}


#
# outdent()
#

sub outdent
{
  my $self = shift;
  $self->{INDENT} -= 4;
  
  confess "Unbalanced indent/outdent!" if $self->{INDENT} < 0;
}


#
# emit()
#

sub emit
{
  my $self = shift;

  unshift(@_, " " x $self->{INDENT});
  
  my $fh = $self->{FH};

  print $fh @_, "\n";
}


#
# compile()
#

sub compile
{
  my $self = shift;

  my ($root, $fh) = @_;

  $fh = FileHandle->new(">-") unless defined $fh;

  $self->{FH} = $fh;

  $root->compile($self);
}


1;
