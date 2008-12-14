#
# Bare.pm
#
# Copyright (C) 2002-2005, The Perl Foundation.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Bare;

use Carp;

use Jako::Compiler;

use base qw(Jako::Construct::Block);

#
# compile()
#

sub compile {
    my $self = shift;
    my ($compiler) = @_;

    my $namespace = "BARE";    # TODO: Don't we need to do better than this?

    if ( $self->content ) {
        $compiler->indent;
        $self->SUPER::compile($compiler);
        $compiler->outdent;
    }

    return 1;
}

#
# sax()
#

sub sax {
    my $self = shift;
    my ($handler) = @_;

    $handler->start_element( { Name => 'block', Attributes => { kind => $self->kind } } );
    $_->sax($handler) foreach $self->content;
    $handler->end_element( { Name => 'block' } );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
