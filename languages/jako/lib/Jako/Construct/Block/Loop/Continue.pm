#
# Continue.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Block::Loop::Continue;

use Carp;

use base qw(Jako::Construct::Block::Loop);


#
# new()
#

sub new
{
  my $class = shift;

  confess "Expected parent and peer blocks." unless @_ == 2;

  my ($block, $peer) = @_;

  my $self = bless {
    BLOCK     => $block,

    KIND      => 'continue',
    PEER      => $peer,

    CONTENT   => [ ]
  }, $class;

  $block->push_content($self);

  return $self;
}

sub peer { return shift->{PEER}; }

1;

