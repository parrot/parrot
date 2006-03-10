#! perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;
use Parrot::Config;


=head1 NAME

t/dynpmc/sub.t - test if Sub is overridable by .HLL_map

=head1 SYNOPSIS

	% prove t/dynpmc/sub.t

=head1 DESCRIPTION

Tests the .HLL_map of Sub PMCs. The test is using .SubProxy, which
happens to be a .Sub.

=cut


pir_output_is(<< 'CODE', << 'OUTPUT', "loadlib");
.sub main :main
    .local pmc lib
    lib = loadlib "subproxy"
    unless lib goto not_loaded
    print "ok\n"
    end
not_loaded:
    print "not loaded\n"
.end
CODE
ok
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "test type of HLL_mapped .Sub");
.sub main :main
    .const .Sub b = 'bar'
    $S0 = typeof b
    print $S0
    print "\n"
    .const .Sub f = 'foo'
    $S0 = typeof f
    print $S0
    print "\n"
.end

.sub bar
    noop
.end

.HLL "Some", "subproxy"
.HLL_map .Sub, .SubProxy

.sub foo
    noop
.end
CODE
Sub
SubProxy
OUTPUT
