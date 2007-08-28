#! perl
# Copyright (C) 2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 8;
use Parrot::Config;

=head1 NAME

t/dynpmc/rational.t - Test for the Rational PMC

=head1 SYNOPSIS

        % prove t/dynpmc/rational.t

=head1 DESCRIPTION

This is just a stub, as the rational PMC is not implemented yet.

=cut

pir_output_is( << 'CODE', << 'OUTPUT', "get_integer" );

.sub main :main
    loadlib P1, "rational"
    find_type $I0, "Rational"
    new $P1, $I0

    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
43
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "loadlib with relative pathname, no ext" );
.sub main :main
    ## load a relative pathname without the extension.  loadlib will convert the
    ## '/' characters to '\\' on windows.
    $S0 = "runtime/parrot/dynext/rational"
    loadlib P1, $S0

    ## ensure that we can still make Rational instances.
    find_type $I0, "Rational"
    new $P1, $I0
    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
43
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "loadlib with absolute pathname, no ext" );
.sub main :main
    ## get cwd in $S0.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["prefix"]

    ## convert cwd to an absolute pathname without the extension, and load it.
    ## this should always find the version in the build directory, since that's
    ## the only place "make test" will work.
    $S0 = concat "/runtime/parrot/dynext/rational"
    loadlib P1, $S0

    ## ensure that we can still make Rational instances.
    find_type $I0, "Rational"
    new $P1, $I0
    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
43
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "loadlib with relative pathname & ext" );
.sub main :main
    ## get load_ext in $S0.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["load_ext"]

    ## load a relative pathname with an extension.
    $S0 = concat "runtime/parrot/dynext/rational", $S0
    loadlib P1, $S0

    ## ensure that we can still make Rational instances.
    find_type $I0, "Rational"
    new $P1, $I0
    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
43
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "loadlib with absolute pathname & ext" );
.sub main :main
    ## get cwd in $S0, load_ext in $S1.
    .include "iglobals.pasm"
    $P11 = getinterp
    $P12 = $P11[.IGLOBALS_CONFIG_HASH]
    $S0 = $P12["prefix"]
    $S1 = $P12["load_ext"]

    ## convert $S0 to an absolute pathname with extension, and load it.
    ## this should always find the version in the build directory, since that's
    ## the only place "make test" will work.
    $S0 = concat $S0, "/runtime/parrot/dynext/rational"
    $S0 = concat $S0, $S1
    loadlib P1, $S0

    ## ensure that we can still make Rational instances.
    find_type $I0, "Rational"
    new $P1, $I0
    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
43
OUTPUT

SKIP: {
    skip( "No BigInt Lib configured", 1 ) if !$PConfig{gmp};

    pir_output_is( << 'CODE', << 'OUTPUT', "inherited add" );
.sub _main :main
    .local pmc d, l, r
    $P0 = loadlib "rational"
    print "ok\n"
    l = new "Rational"
    l = 43
    r = new BigInt
    r = 0x7ffffff
    d = new Undef
    add d, l, r
    print d
    print "\n"
    $S0 = typeof d
    print $S0
    print "\n"
.end
CODE
ok
134217770
BigInt
OUTPUT

}

pir_output_is( << 'CODE', << 'OUTPUT', ".HLL 1" );
# load our Rational test (pseudo) language
# it defines one PMC type "Rational"
.HLL "Rational", "rational"
.sub main :main
    new $P1, "Rational"      # load by name
    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
43
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', ".HLL 2" );
.HLL "Rational", "rational"
.sub main :main
    new $P1, 'Rational'       # load by index
    $I1 = $P1
    print $I1
    print "\n"
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
