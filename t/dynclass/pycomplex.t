
#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/pyint.t - Python Complex type

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/pyint.t

=head1 DESCRIPTION

Tests the Python Integer PMC.

=cut

use Parrot::Test tests => 4;

pir_output_is(<< 'CODE', << 'OUTPUT', "eq");

.sub main :main
    loadlib P1, "python_group"
    new $P1, "PyComplex"
    new $P2, "PyComplex"

    set $P1, "3+4j"
    set $P2, "3+4j"

    iseq $I0, $P1, $P2
    print $I0
    print "\n"
.end
CODE
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "sub");
.sub main :main
    .local pmc d, i, c
    d = new "PyObject"
    i = new "PyInt"
    c = new "PyComplex"
    i = 2
    c = "5+2j"
    d = c - i
    print d
    print "\n"
    typeof $S0, d
    print $S0
    print "\n"
    d = i - c
    print d
    print "\n"
    typeof $S0, d
    print $S0
    print "\n"
.end
CODE
(3+2j)
PyComplex
(-3-2j)
PyComplex
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "abs - test registered type");
.HLL "Python", "python_group"
.sub main :main
    .local pmc d, c
    c = new .PyComplex
    c = "3+4j"
    d = n_abs c
    print d
    print "\n"
    $S0 = typeof d
    print $S0
    print "\n"
.end
CODE
5.0
PyFloat
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "n_abs - test registered type");
.pragma n_operators 1
.HLL "Python", "python_group"
.sub main :main
    .local pmc d, c
    c = new .PyComplex
    c = "3+4j"
    d = abs c
    print d
    print "\n"
    $S0 = typeof d
    print $S0
    print "\n"
.end


CODE
5.0
PyFloat
OUTPUT

