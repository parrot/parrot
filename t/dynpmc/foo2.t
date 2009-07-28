#! perl
# Copyright (C) 2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/dynpmc/foo.t - Test for a very simple dynamic PMC

=head1 SYNOPSIS

        % prove t/dynpmc/foo.t

=head1 DESCRIPTION

Tests the Foo PMC.

=cut

pir_output_is( << 'CODE', << 'OUTPUT', "dynpmcs can use SUPER to call parent dynpmc VTABLE functions" );

.sub main :main
    $P0 = loadlib 'foo_group'
    $P1 = new "Foo2"

    $I1 = $P1
    say $I1
.end
CODE
43
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
