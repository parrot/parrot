#
# Return.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Statement::Return;

use Carp;

use base qw(Jako::Construct::Statement);


#
# new()
#

sub new
{
  my $class = shift;
  my ($block, $value, $cond, $left, $op, $right) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Value is not!" if defined $value and not UNIVERSAL::isa($value, 'Jako::Construct::Expression::Value');
  confess "Left is not Value!" if defined $left and not UNIVERSAL::isa($left, 'Jako::Construct::Expression::Value');
  confess "Right is not Value!" if defined $right and not UNIVERSAL::isa($right, 'Jako::Construct::Expression::Value');

  my $self = bless {
    BLOCK => $block,

    VALUE => $value,
    COND  => $cond,
    LEFT  => $left,
    OP    => $op,
    RIGHT => $right,

    DEBUG => 1,
    FILE  => defined $value ? $value->file : undef, # TODO: YUCK!
    LINE  => defined $value ? $value->line : undef, # TODO: YUCK!
  }, $class;

  $block->push_content($self);

  return $self;
}


#
# ACCESSORS:
#

sub value { return shift->{VALUE}; }
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
  my $value = $self->value;
  my $cond  = $self->cond;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  #
  # Find the enclosing sub block:
  #

  my $sub_block = $block->find_block('sub');

  $self->SYNTAX_ERROR("Cannot use 'return' outside of subroutine.")
    unless (defined $sub_block);

  my $sub_name = $sub_block->name;

  my $return_type = $sub_block->type;

  my $anon;

  if (defined $cond) {
    $left  = $left->compile($compiler);
    $right = $right->compile($compiler);

    if ($cond eq 'if') {
      $op = $compiler->invert_relop($op);
    }
    else {
      $cond = 'if';
    }

    $anon = $compiler->anon_lbl();

    $compiler->emit("  $cond $left $op $right goto $anon");
  }

  #
  # Compile the return value, if any:
  #

  if (defined $value) {
    $self->SYNTAX_ERROR("'return' with argument in subroutine that does not return a value.")
      unless defined $return_type;

    my $arg_type = $value->type;
    my $ret_val = $value->compile($compiler);

    if ($arg_type->name ne $return_type->name) { # TODO: Yuck! should be able to compare directly.
      my $temp = $compiler->temp_reg($return_type);
      $compiler->emit("  $temp = $ret_val");
      $ret_val = $temp;
    }

    $compiler->emit("  .return $ret_val");
  }

  #
  # Go to the subroutine exit point:
  #

  $compiler->emit("  goto _${sub_name}_LEAVE");

  if (defined $cond) {
    $compiler->emit("$anon:");
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
  my $value = $self->value;
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

  $handler->start_element({ Name => 'return' });
  $value->sax($handler) if defined $value;
  $handler->end_element({ Name => 'return' });

  if (defined $cond) {
    $handler->end_element({ Name => 'block' });
    $handler->end_element({ Name => 'cond' });
  }
}


1;
