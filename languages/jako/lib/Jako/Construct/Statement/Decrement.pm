#
# Decrement.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
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

  my $ident = $self->ident->value;

  $compiler->emit("  dec $ident");

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
