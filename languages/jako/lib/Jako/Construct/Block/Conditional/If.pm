#
# If.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Conditional::If;

use base qw(Jako::Construct::Block::Conditional);

#
# new()
#

sub new
{
  my $class = shift;
  my ($block, $left, $op, $right) = @_;

  my $index = ++$Jako::Compiler::block_count; # TODO: YUCK!

  my $prefix    = "_UNLESS_$index";

  my $self = bless {
    BLOCK     => $block,
    KIND      => 'if',
    PREFIX    => $prefix,
    NAMESPACE => $prefix,
    LEFT      => $left,
    OP        => $op,
    RIGHT     => $right,
    CONTENT   => [ ]
  }, $class;

  $block->push_content($self);

  return $self;
}

1;

