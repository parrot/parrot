#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/dynclass/pyclass.t - Python Class type

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/pyclass.t

=head1 DESCRIPTION

Tests the Python Class PMC.

=cut

use Parrot::Test tests => 2;

SKIP : {
    skip("can't inherit getprop yet", 1);

output_is(<< 'CODE', << 'OUTPUT', "attribute");
##PIR##
.sub main @MAIN
    loadlib $P0, "python_group"

    getclass $P1, 'PyClass'
    subclass $P2, $P1, 'c'

    find_type $I2, "PyInt"
    new $P3, $I2
    $P3 = 1
    setprop $P2, 'a', $P3

    $P4=$P2()

    getprop $P5, 'a', $P4
    print $P5
    print "\n"
.end
CODE
1
OUTPUT
}

output_is(<< 'CODE', << 'OUTPUT', "method");
##PIR##
.sub __main__
    loadlib $P0, "python_group"

    getclass $P1, 'PyClass'
    subclass $P2, $P1, 'c'

    find_type $I2, "PyFunc"
    newsub $P3, $I0, _m
    setprop $P2, 'm', $P3

    $P4=$P2()

    $P5=$P4.m()
    print $P5
    print "\n"
    end
.end

.sub _m non_prototyped
    find_type $I0, "PyInt"
    new $P0, $I0
    $P0 = 1
    .return ($P0)
.end
CODE
1
OUTPUT
