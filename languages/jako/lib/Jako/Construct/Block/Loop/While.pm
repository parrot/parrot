#
# While.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Loop::While;

use base qw(Jako::Construct::Block::Loop);

#
# new()
#

sub new
{
  my $class = shift;
  my ($block, $namespace, $prefix, $left, $op, $right) = @_;

  my $self = bless {
    BLOCK     => $block,
    NAMESPACE => $prefix,
    PREFIX    => $prefix,
    KIND      => 'while',
    LEFT      => $left,
    OP        => $op,
    RIGHT     => $right,
    CONTENT   => [ ]
  }, $class;

  $block->push_content($self);

  return $self;
}

1;

