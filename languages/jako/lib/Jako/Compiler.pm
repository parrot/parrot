#
# Compiler.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Compiler;

use Carp;
use FileHandle;

use base qw(Jako::Processor);

my %reg_count = ( # Registers
  I => 0,
  N => 0,
  P => 0,
  S => 0
);

sub temp_reg { my $type = shift->code; return '$' . $type . $reg_count{$type}++; }
sub temp_int { return '$I' . $reg_count{'I'}++; }
sub temp_num { return '$N' . $reg_count{'N'}++; }
sub temp_str { return '$S' . $reg_count{'S'}++; }

my $anon_lbl_count = 0;

sub anon_lbl { return '_ANON_LABEL_' . ++$anon_lbl_count; }

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
    FILE     => undef,
    LINE     => undef,
    LABELS   => [ ],
    COMMENTS => [ ],
    LAST_OP  => 'noop',
    INDENT   => 0
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

