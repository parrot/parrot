#
# Label.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Label;

use Carp;

use base qw(Jako::Construct);

1;

#
# new()
#

sub new
{
  my $class = shift;
  my ($block, $ident) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Ident is not!" unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');

  my $self = bless {
    BLOCK => $block,

    IDENT => $ident,

    DEBUG => 1,
    FILE  => $ident->file,
    LINE  => $ident->line
  }, $class;

  $block->push_content($self);

  return $self;
}


#
# ACCESSOR:
#

sub ident { return shift->{IDENT}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $block = $self->block;
  my $ident = $self->ident->value;

  $compiler->emit("_LABEL_$ident:");

  return;
}


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;
  
  $handler->start_element({ Name => 'label', Attributes => { name => $self->ident->value } });
  $handler->end_element({ Name => 'label' });
}


1;
