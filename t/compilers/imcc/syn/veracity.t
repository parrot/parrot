#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use Parrot::Test tests => 5;

pir_output_is( <<'CODE', <<'OUT', "Positive and negative integers" );
.sub test :main
    $I0 = 1
    unless $I0 goto not_one
    say "1 is true"

    not_one:
    $I0 = -1
    unless $I0 goto not_neg_one
    say "-1 is true"

    not_neg_one:

    end
.end
CODE
1 is true
-1 is true
OUT

pir_output_is( <<'CODE', <<'OUT', "Integer zeros" );
.sub test :main
    $I0 = 0
    if $I0 goto not_zero
    say "0 is false"

    not_zero:
    $I0 = -0
    if $I0 goto not_neg_zero
    say "-0 is false"

    not_neg_zero:

    end
.end
CODE
0 is false
-0 is false
OUT

pir_output_is( <<'CODE', <<'OUT', "Positive and negative floats" );
.sub test :main
    $N0 = 1.0
    unless $N0 goto not_one
    say "1.0 is true"

    not_one:
    $N0 = -1.0
    unless $N0 goto not_neg_one
    say "-1.0 is true"

    not_neg_one:
    $N0 = 0.5
    unless $N0 goto not_pfive
    say "0.5 is true"

    not_pfive:
    $N0 = 1e-33
    unless $N0 goto not_small
    say "1e-33 is true"

    not_small:
    end
.end
CODE
1.0 is true
-1.0 is true
0.5 is true
1e-33 is true
OUT

#TODO: {

#local $TODO = "Failing due to FLOAT_IS_ZERO macro";

pir_output_is( <<'CODE', <<'OUT', "Float zeros" );
.sub test :main
    $N0 = 0.0
    if $N0 goto not_zero
    say "0.0 is false"

    not_zero:
    $N0 = -0.0
    if $N0 goto not_neg_zero
    say "-0.0 is false"

    not_neg_zero:

    end
.end
CODE
0.0 is false
-0.0 is false
OUT

#}

SKIP: {
    skip 'failing on win32' => 1 if $^O =~ m/win32/i;

pir_output_is( <<'CODE', <<'OUT', "Float NaN" );
.sub test :main
    $N0 = 'NaN'
    unless $N0 goto not_nan
    say "NaN is true"

    not_nan:
    end
.end
CODE
NaN is true
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
