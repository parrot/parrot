#! perl
# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;
use Parrot::Config;

=head1 NAME

t/dynpmc/subproxy.t - test if Sub is overridable via hll_map()

=head1 SYNOPSIS

        % prove t/dynpmc/subproxy.t

=head1 DESCRIPTION

Tests the hll mapping of Sub PMCs. The test is using SubProxy, which
happens to be a Sub.

=cut

pir_output_is( << 'CODE', << 'OUTPUT', "loadlib" );
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

pir_output_is( << 'CODE', << 'OUTPUT', "test type of hll_map'ped .Sub" );
.sub main :main
    .local pmc b, f
    b = get_global 'bar'
    $S0 = typeof b
    say $S0
    f = get_root_global ['some'], 'foo'
    $S0 = typeof f
    say $S0
.end

.sub bar
    noop
.end

.HLL "Some"
.loadlib "subproxy"
.sub load :anon :immediate
    .local pmc interp
    .local pmc sub,subproxy
    interp = getinterp
    sub = get_class 'Sub'
    subproxy = get_class 'SubProxy'
    interp.'hll_map'(sub,subproxy)
.end

.sub foo
    noop
.end
CODE
Sub
SubProxy
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
