
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

use Parrot::Test tests => 1;

pir_output_is(<< 'CODE', << 'OUTPUT', "eq");

.sub main @MAIN
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
