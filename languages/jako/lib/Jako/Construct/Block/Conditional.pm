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
eval "use warnings";

package Jako::Construct::Block::Conditional;

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

  if ($kind eq 'if' or $kind eq 'unless') {
    $left  = $self->left->compile($compiler);
    $op    = $self->op;
    $right = $self->right->compile($compiler);
  }

  if ($kind eq 'if') {
    $op = $compiler->invert_relop($op);
  }
  elsif ($kind eq 'unless') {
    $kind = 'if';
  }

  if ($kind eq 'if') {
    $compiler->emit("${prefix}_TEST:");
    $compiler->emit("  if $left $op $right goto ${prefix}_ELSE");
    $compiler->emit("${prefix}_THEN:");

    if ($self->content) {
      $compiler->emit(".namespace ${namespace}_THEN");
      $compiler->indent;
      $self->SUPER::compile($compiler);
      $compiler->outdent;
      $compiler->emit(".endnamespace ${namespace}_THEN");
    }

    $compiler->emit("  goto ${prefix}_LAST");
  }
  elsif ($kind eq 'else') {
    $compiler->emit("${prefix}_ELSE:");

    if ($self->content) {
      $compiler->emit(".namespace ${namespace}_ELSE");
      $compiler->indent;
      $self->SUPER::compile($compiler);
      $compiler->outdent;
      $compiler->emit(".endnamespace ${namespace}_ELSE");
    }

    $compiler->emit("${prefix}_LAST:");
  }

  return 1;
}


1;
