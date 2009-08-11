#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 4;
use Parrot::Config;

=head1 NAME

t/dynoplibs/obscure.t - Tests for obscure mathematical functions

=head1 SYNOPSIS

        % prove t/dynoblibs/obscure.t

=head1 DESCRIPTION

Tests obscure.ops

=cut

pir_output_like( <<CODE, qr/^42/, "loadlib obscure ops" );
.loadlib 'obscure_ops'
.sub main :main
    print 42
.end
CODE


pir_output_like( <<CODE, qr/^1/, "covers of 0" );
.loadlib 'obscure_ops'
.sub main :main
    .local num x
    covers x, 0
    print x
.end
CODE

pir_output_like( <<CODE, qr/^1/, "covers of pi" );
.loadlib 'obscure_ops'
.sub main :main
    .local num x, pi
    pi = atan 1.0, 1.0
    pi *= 4
    covers x, pi
    print x
.end
CODE

pir_output_like( <<CODE, qr/^0/, "covers of pi/2" );
.loadlib 'obscure_ops'
.sub main :main
    .local num x, halfpi
    halfpi = atan 1.0, 1.0
    halfpi *= 2
    covers x, halfpi
    print x
.end
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
