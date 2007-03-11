#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/oo/mro-c3.t - test the C3 Method Resolution Order for Parrot OO

=head1 SYNOPSIS

    % prove t/oo/mro-c3.t

=head1 DESCRIPTION

Tests the C3 Method Resolution order for the OO implementation.

=cut


# L<PDD15>
# TODO update smartlink
# TODO write real tests :)
pir_output_is( <<'CODE', <<'OUT', 'stup' );
.sub 'test' :main
    say 'ok 1 - just a stub'
.end
CODE
ok 1 - just a stub
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
