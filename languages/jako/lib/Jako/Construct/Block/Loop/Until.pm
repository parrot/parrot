#
# Until.pm
#
# Copyright (C) 2002-2005, The Perl Foundation.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Loop::Until;

use Carp;

use base qw(Jako::Construct::Block::Loop);

#
# new()
#

sub new {
    my $class = shift;

    confess "Expected 5 args!" unless @_ == 5;

    my ( $block, $prefix, $left, $op, $right ) = @_;

    my $self = bless {
        BLOCK => $block,

        PREFIX => $prefix,
        KIND   => 'until',
        LEFT   => $left,
        OP     => $op,
        RIGHT  => $right,

        CONTENT => []
    }, $class;

    $block->push_content($self);

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
