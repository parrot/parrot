#
# Decrement.pm
#
# Copyright (C) 2002-2005, The Perl Foundation.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Statement::Decrement;

use Carp;

use base qw(Jako::Construct::Statement);

sub new
{
  my $class = shift;
  my ($block, $ident) = @_;

  confess("Block (" . ref($block) . ") not!") unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess("Identifier (" . ref($ident) . ") is not!") unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');

  my $self = bless {
    BLOCK => $block,
    IDENT => $ident
  }, $class;

  $block->push_content($self);

  return $self;
}

sub ident  { return shift->{IDENT};  }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;
  
  my $ident_name = $self->ident->value;

  my $ident = $self->ident->compile($compiler);
  
  $compiler->emit("  dec $ident");
  
  if (($self->ident->kind eq 'var') and ($self->ident->scope eq 'global')) {
    my $pmc_type = $self->ident->type->imcc_pmc;
    my $pmc_reg = $compiler->temp_pmc();
    $compiler->emit("  $pmc_reg = new $pmc_type");
    $compiler->emit("  $pmc_reg = $ident");
    $compiler->emit("  global \"$ident_name\" = $pmc_reg");
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

  $handler->start_element({ Name => 'op', Attributes => { kind => 'postfix', name => '--' } });
  $self->ident->sax($handler);
  $handler->end_element({ Name => 'op' });
}


1;
