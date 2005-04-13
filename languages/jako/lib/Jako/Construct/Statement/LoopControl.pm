#
# LoopControl.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Statement::LoopControl;

use Carp;

use base qw(Jako::Construct::Statement);

my %block_types = (
  'while'    => { PREFIX => "_W", NEXT => 'CONT', REDO => 'REDO', LAST => 'LAST' },
  'if'       => { PREFIX => "_I", NEXT => 'TEST', REDO => 'THEN', LAST => 'ELSE' },
  'sub'      => { PREFIX => "_S", NEXT => 'TEST', REDO => 'THEN', LAST => 'ELSE' }, # TODO: fix these
);


#
# new()
#

sub new
{
  my $class = shift;
  my ($block, $kind, $ident, $cond, $left, $op, $right) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Ident is not!" if defined $ident and not UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');
  confess "Left is not Value!" if defined $left and not UNIVERSAL::isa($left, 'Jako::Construct::Expression::Value');
  confess "Right is not Value!" if defined $right and not UNIVERSAL::isa($right, 'Jako::Construct::Expression::Value');

  my $self = bless {
    BLOCK => $block,

    KIND  => $kind,
    IDENT => $ident,
    COND  => $cond,
    LEFT  => $left,
    OP    => $op,
    RIGHT => $right,

    DEBUG => 1,
    FILE  => $ident ? $ident->file : undef,  # TODO: YUCK!!!
    LINE  => $ident ? $ident->line : undef
  }, $class;

  $block->push_content($self);

  return $self;
}


#
# ACCESSORS:
#

sub kind  { return shift->{KIND};  }
sub ident { return shift->{IDENT}; }
sub cond  { return shift->{COND};  }
sub left  { return shift->{LEFT};  }
sub op    { return shift->{OP};    }
sub right { return shift->{RIGHT}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $block = $self->block;
  my $kind  = $self->kind;
  my $name  = $self->ident ? $self->ident->value : undef;
  my $cond  = $self->cond;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  #
  # Locate the block we'll be applying the control statement to:
  #

  my $loop_block = $block->find_block('while', $name);

  unless (defined $loop_block) {
    if (defined $name) {
      $self->SYNTAX_ERROR("No loop '%s' in loop control.", $name);
    } else {
      $self->SYNTAX_ERROR("No loop active in loop control.");
    }
  }

  #
  # Generate the code:
  #

  my $prefix = $loop_block->prefix;
  my $suffix = $block_types{'while'}{uc $kind};

  my $label = "${prefix}_${suffix}";

  if (!defined $cond) {
    $compiler->emit("  goto $label");
  } else {
    if ($cond eq 'unless') {
      $op = $compiler->invert_relop($op);
      $cond = 'if';
    }

    $left  = $left->compile($compiler);
    $right = $right->compile($compiler);

    $compiler->emit("  $cond $left $op $right goto $label");
  }

  return;
}


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  my $block = $self->block;
  my $kind  = $self->kind;
  my $name  = $self->ident ? $self->ident->value : undef;
  my $cond  = $self->cond;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  if (defined $cond) {
    $handler->start_element({ Name => 'cond', Attributes => { kind => $kind } });
    $handler->start_element({ Name => 'block', Attributes => { kind => 'test' } });
    $handler->start_element({ Name => 'op', Attributes => { kind => 'infix', name => $op } });
    $left->sax($handler);
    $right->sax($handler);
    $handler->end_element({ Name => 'op' });
    $handler->end_element({ Name => 'block' });
    $handler->start_element({ Name => 'block', Attributes => { kind => 'then' } });
  }

  if ($name) {
    $handler->start_element({ Name => $kind, Attributes => { loop => $name } });
  }
  else {
    $handler->start_element({ Name => $kind });
  }
  $handler->end_element({ Name => $kind });

  if (defined $cond) {
    $handler->end_element({ Name => 'block' });
    $handler->end_element({ Name => 'cond' });
  }
}


1;
