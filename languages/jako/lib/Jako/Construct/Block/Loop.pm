#
# Loop.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Loop;

use Carp;

use base qw(Jako::Construct::Block);

=no

my %comp_ops = (
  'eq' => sub { $_[0] == $_[1] },
  'ne' => sub { $_[0] != $_[1] },
  'le' => sub { $_[0] <= $_[1] },
  'lt' => sub { $_[0] <  $_[1] },
  'ge' => sub { $_[0] >= $_[1] },
  'gt' => sub { $_[0] >  $_[1] },

  '==' => '',
  '!=' => 'ne',
  '<=' => 'le',
  '<'  => 'lt',
  '>=' => 'ge',
  '>'  => 'gt',

  '!eq' => 'ne',
  '!ne' => 'eq',
  '!le' => 'gt',
  '!lt' => 'ge',
  '!ge' => 'lt',
  '!gt' => 'le',
);

=cut

sub left      { return shift->{LEFT};      }
sub op        { return shift->{OP};        }
sub right     { return shift->{RIGHT};     }
sub kind      { return shift->{KIND};      }
sub namespace { return shift->{NAMESPACE}; }
sub prefix    { return shift->{PREFIX};    }

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  my $namespace = $self->namespace;
  my $prefix    = $self->prefix;
  my $kind      = $self->kind;

  my $left;
  my $op;
  my $right;

  if ($kind eq 'while' or $kind eq 'until') {
    $left  = $self->left->value;
    $op    = $self->op;
    $right = $self->right->value;
  }

  if ($kind eq 'while') {
    $op = Jako::Compiler::invert_relop($op); # Invert the sense for 'while' loops.
  }

  if ($kind eq 'while' or $kind eq 'until') {
    print $fh "${prefix}_NEXT:\n";
    print $fh ".namespace $namespace\n";
    print $fh "  if $left $op $right goto ${prefix}_LAST\n";
    print $fh "${prefix}_REDO:\n";

    $self->SUPER::compile($fh);

    print $fh ".endnamespace $namespace\n";
  }
  elsif ($kind eq 'continue') {
    print $fh "${prefix}_CONT:\n";
    print $fh ".namespace $namespace\n";

    $self->SUPER::compile($fh);

    print $fh ".endnamespace $namespace\n";
    print $fh "  goto ${prefix}_NEXT\n";
    print $fh "${prefix}_LAST:\n";
  }
  else {
    $self->INTERNAL_ERROR("Unrecognized kind of block '%s'", $kind);
  }

  return 1;
}


1;

