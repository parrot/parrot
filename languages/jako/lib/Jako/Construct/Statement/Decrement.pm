#
# Decrement.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

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
  my ($fh) = @_;

  my $ident = $self->ident->value;

  print $fh "  dec $ident\n";

  return 1;
}

1;
