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

use Jako::Compiler;

use base qw(Jako::Construct::Block);


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $kind        = $self->kind;
  my $peer        = $self->peer;

  my $prefix;

  if ($self->prefix) {
    $prefix = $self->prefix;
  }
  else {
    $prefix = $self->peer ? $peer->prefix : $compiler->block_label($kind);
    $self->prefix($prefix);
  }

  my $namespace = $prefix;

  my $left;
  my $op;
  my $right;

  if ($kind eq 'while' or $kind eq 'until') {
    $left  = $self->left->value;
    $op    = $self->op;
    $right = $self->right->value;
  }

  if ($kind eq 'while') {
    $op = $compiler->invert_relop($op); # Invert the sense for 'while' loops.
  }

  if ($kind eq 'while' or $kind eq 'until') {
    $compiler->emit("${prefix}_NEXT:");
    $compiler->emit("  if $left $op $right goto ${prefix}_LAST");
    $compiler->emit("${prefix}_REDO:");

    if ($self->content) {
      $compiler->emit(".namespace ${namespace}");
      $compiler->indent;
      $self->SUPER::compile($compiler);
      $compiler->outdent;
      $compiler->emit(".endnamespace ${namespace}");
    }
  }
  elsif ($kind eq 'continue') {
    $compiler->emit("${prefix}_CONT:");

    if ($self->content) {
      $compiler->emit(".namespace ${namespace}_CONT");
      $compiler->indent;
      $self->SUPER::compile($compiler);
      $compiler->outdent;
      $compiler->emit(".endnamespace ${namespace}_CONT");
    }

    $compiler->emit("  goto ${prefix}_NEXT");
    $compiler->emit("${prefix}_LAST:");
  }
  else {
    $self->INTERNAL_ERROR("Unrecognized kind of block '%s'", $kind);
  }

  return 1;
}


1;
