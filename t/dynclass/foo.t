#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/foo.t - Test for a very simple dynamic PMC

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/foo.t

=head1 DESCRIPTION

Tests the Foo PMC.

=cut

use Parrot::Test tests => 1;

pir_output_is(<< 'CODE', << 'OUTPUT', "abs");

.sub main @MAIN
    loadlib P1, "foo"
    find_type $I0, "Foo"
    new $P1, $I0

    $I1 = $P1
    print $I1
    print "\n"
.end
CODE
42
OUTPUT
