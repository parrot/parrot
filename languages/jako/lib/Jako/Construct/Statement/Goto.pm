#
# Goto.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Statement::Goto;

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
  my ($block, $ident, $cond, $left, $op, $right) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Ident is not!" if defined $ident and not UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');
  confess "Left is not Value!" if defined $left and not UNIVERSAL::isa($left, 'Jako::Construct::Expression::Value');
  confess "Right is not Value!" if defined $right and not UNIVERSAL::isa($right, 'Jako::Construct::Expression::Value');

  my $self = bless {
    BLOCK => $block,

    IDENT => $ident,
    COND  => $cond,
    LEFT  => $left,
    OP    => $op,
    RIGHT => $right,

    DEBUG => 1,
    FILE  => $ident->file,
    LINE  => $ident->line
  }, $class;

  $block->push_content($self);

  return $self;
}


#
# ACCESSORS:
#

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
  my $name  = $self->ident ? $self->ident->value : undef;
  my $cond  = $self->cond;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  if (!defined $cond) {
    $compiler->emit("  goto _LABEL_$name");
  } else {
    $left  = $left->compile($compiler);
    $right = $right->compile($compiler);

    if ($cond eq 'unless') {
      $op = $compiler->invert_relop($op);
      $cond = 'if';
    }

    $compiler->emit("  $cond $left $op $right goto _LABEL_$name");
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
  my $name  = $self->ident ? $self->ident->value : undef;
  my $cond  = $self->cond;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  if (defined $cond) {
    $handler->start_element({ Name => 'cond', Attributes => { kind => $cond } });
    $handler->start_element({ Name => 'block', Attributes => { kind => 'test' } });
    $handler->start_element({ Name => 'op', Attributes => { kind => 'infix', name => $op } });
    $left->sax($handler);
    $right->sax($handler);
    $handler->end_element({ Name => 'op' });
    $handler->end_element({ Name => 'block' });
    $handler->start_element({ Name => 'block', Attributes => { kind => 'then' } });
  }

  $handler->start_element({ Name => 'goto', Attributes => { label => $name } });
  $handler->end_element({ Name => 'goto' });

  if (defined $cond) {
    $handler->end_element({ Name => 'block' });
    $handler->end_element({ Name => 'cond' });
  }
}


1;
