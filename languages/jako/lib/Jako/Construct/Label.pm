#
# Label.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

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
  my ($fh) = @_;

  my $block = $self->block;
  my $ident = $self->ident->value;

  print $fh "_LABEL_$ident:\n";

  return;
}


1;
