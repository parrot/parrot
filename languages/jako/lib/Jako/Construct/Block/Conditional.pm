#
# Conditional.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Conditional;

use Carp;

use Jako::Compiler;

use base qw(Jako::Construct::Block);

sub kind      { return shift->{KIND};      }
sub prefix    { return shift->{PREFIX};    }
sub left      { return shift->{LEFT};      }
sub op        { return shift->{OP};        }
sub right     { return shift->{RIGHT};     }
sub namespace { return shift->{NAMESPACE}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  my $prefix    = $self->prefix;
  my $namespace = $self->namespace;
  my $kind      = $self->kind;

  my $left;
  my $op;
  my $right;

  if ($kind eq 'if' or $kind eq 'unless') {
    $left  = $self->left->compile($fh);
    $op    = $self->op;
    $right = $self->right->compile($fh);
  }

  if ($kind eq 'if') {
    $op = Jako::Compiler::invert_relop($op);
  }
  elsif ($kind eq 'unless') {
    $kind = 'if';
  }

  if ($kind eq 'if') {
    print $fh "${prefix}_TEST:\n";
    print $fh "  if $left $op $right goto ${prefix}_ELSE\n";
    print $fh "${prefix}_THEN:\n";

    if ($self->content) {
      print $fh ".namespace ${namespace}_THEN\n";
      $self->SUPER::compile($fh);
      print $fh ".endnamespace ${namespace}_THEN\n";
    }

    print $fh "  goto ${prefix}_LAST\n";
  }
  elsif ($kind eq 'else') {
    print $fh "${prefix}_ELSE:\n";

    if ($self->content) {
      print $fh ".namespace ${namespace}_ELSE\n";
      $self->SUPER::compile($fh);
      print $fh ".endnamespace ${namespace}_ELSE\n";
    }

    print $fh "${prefix}_LAST:\n";
  }

  return 1;
}


1;
