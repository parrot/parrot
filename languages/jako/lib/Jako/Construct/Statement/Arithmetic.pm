#
# Arithmetic.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Statement::Arithmetic;

use Carp;

use base qw(Jako::Construct::Statement);

sub new
{
  my $class = shift;
  my ($block, $dest, $left, $op, $right) = @_;

  confess("Block (" . ref($block) . ") not!") unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess("Dest (" . ref($dest) . ") is not Identifier!") unless UNIVERSAL::isa($dest, 'Jako::Construct::Expression::Value::Identifier');
  confess("Left (" . ref($left) . ") is not Value") unless UNIVERSAL::isa($left, 'Jako::Construct::Expression::Value');
  confess("Right (" . ref($right) . ") is not Value") unless UNIVERSAL::isa($right, 'Jako::Construct::Expression::Value');

  my $self = bless {
    BLOCK => $block,

    DEST  => $dest,
    LEFT  => $left,
    OP    => $op,
    RIGHT => $right,

    DEBUG => 1,
    FILE  => $dest->file,
    LINE  => $dest->line
  }, $class;

  $block->push_content($self);

  return $self;
}

sub dest  { return shift->{DEST};  }
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

  my $dest_ident = $self->dest;

  my $block = $self->block;
  my $dest  = $self->dest;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  my $dest_sym = $block->find_symbol($dest->value);
  $self->SYNTAX_ERROR("Assigning to unknown variable %s.", $dest->value) unless $dest_sym;
  my $dest_type = $dest_sym->type;

  my $left_type;
  if (UNIVERSAL::isa($left, 'Jako::Construct::Expression::Value::Identifier')) {
    my $left_sym = $block->find_symbol($left->value);
    $self->SYNTAX_ERROR("Expression involves unknown variable %s.", $left->value) unless $left_sym;
    $left_type = $left_sym->type;
  }
  else {
    $left_type = $left->type;
  }

  my $right_type;
  if (UNIVERSAL::isa($right, 'Jako::Construct::Expression::Value::Identifier')) {
    my $right_sym = $block->find_symbol($right->value);
    $self->SYNTAX_ERROR("Expression involves unknown variable %s.", $right->value) unless $right_sym;
    $right_type = $right_sym->type;
  }
  else {
    $right_type = $right->type;
  }

#  $self->DEBUG(0, "Arithmetic with dest type $dest_type...");
#  $self->DEBUG(0, "Arithmetic with left type $left_type...");
#  $self->DEBUG(0, "Arithmetic with right type $right_type...");

  $self->INTERNAL_ERROR("No type for dest!")  unless defined $dest_type;
  $self->INTERNAL_ERROR("No type for left!")  unless defined $left_type;
  $self->INTERNAL_ERROR("No type for right!") unless defined $right_type;

  $self->SYNTAX_ERROR("Can't do arithmetic on strings") if UNIVERSAL::isa($dest_type, 'Jako::Construct::Type::String');
  $self->SYNTAX_ERROR("Can't do arithmetic on strings") if UNIVERSAL::isa($left_type, 'Jako::Construct::Type::String');
  $self->SYNTAX_ERROR("Can't do arithmetic on strings") if UNIVERSAL::isa($right_type, 'Jako::Construct::Type::String');

  $self->SYNTAX_ERROR("Can't do arithmetic on PMCs") if UNIVERSAL::isa($dest_type, 'Jako::Construct::Type::PMC');
  $self->SYNTAX_ERROR("Can't do arithmetic on PMCs") if UNIVERSAL::isa($left_type, 'Jako::Construct::Type::PMC');
  $self->SYNTAX_ERROR("Can't do arithmetic on PMCs") if UNIVERSAL::isa($right_type, 'Jako::Construct::Type::PMC');

  my $calc_type = $left_type;
  $calc_type = $right_type if UNIVERSAL::isa($right_type, 'Jako::Construct::Type::Number');

#  $self->DEBUG(0, "   ...calc type $calc_type...");

  unless ($left_type->name eq $calc_type->name) {
#    $self->DEBUG(0, "   ...converting left...");
    my $temp = $compiler->temp_reg($calc_type);
    $left = $left->compile($compiler);
    $compiler->emit("  $temp = $left");
    $left = $temp;
  }
  else {
    $left = $left->compile($compiler);
  }

  unless ($right_type->name eq $calc_type->name) {
#    $self->DEBUG(0, "   ...converting right...");
    my $temp = $compiler->temp_reg($calc_type);
    $right = $right->compile($compiler);
    $compiler->emit("  $temp = $right");
    $right = $temp;
  }
  else {
    $right = $right->compile($compiler);
  }

  my $dest_name = $dest->value;
  $dest = $dest->compile($compiler);

  unless ($dest_type->name eq $calc_type->name) {
    my $temp = $compiler->temp_reg($calc_type);
    $compiler->emit("  $temp = $left $op $right");
    $compiler->emit("  $dest = $temp");
  }
  else {
    $compiler->emit("  $dest = $left $op $right");
  }

  if (($dest_ident->kind eq 'var') and ($dest_ident->scope eq 'global')) {
    my $pmc_type = $dest_ident->type->imcc_pmc;
    my $pmc_reg = $compiler->temp_pmc();

    $compiler->emit("  $pmc_reg = new $pmc_type");
    $compiler->emit("  $pmc_reg = $dest");
    $compiler->emit("  global \"$dest_name\" = $pmc_reg");
  }

  return 1;
}


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  my $block = $self->block;
  my $dest  = $self->dest;
  my $left  = $self->left;
  my $op    = $self->op;
  my $right = $self->right;

  $handler->start_element({ Name => 'assign' });
  $dest->sax($handler);
  $handler->start_element({ Name => 'op', Attributes => { kind => 'infix', name => $op } });
  $left->sax($handler);
  $right->sax($handler);
  $handler->end_element({ Name => 'op' });
  $handler->end_element({ Name => 'assign' });
}


1;
