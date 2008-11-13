#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/oo/mro-c3.t - test the C3 Method Resolution Order for Parrot OO

=head1 SYNOPSIS

    % prove t/oo/mro-c3.t

=head1 DESCRIPTION

Tests the C3 Method Resolution order for the OO implementation.

=cut

pir_output_is( <<'CODE', <<'OUT', 'single parent' );
.sub 'test' :main
    .local pmc A, B

    A = new 'Class'
    $P0 = get_global 'testA'
    A.'add_method'("foo", $P0)
    A.'add_method'("bar", $P0)

    B = new 'Class'
    B.'add_parent'(A)
    $P0 = get_global 'testB'
    B.'add_method'("foo", $P0)

    $P0 = B.'new'()
    $P0.'foo'()
    $P0.'bar'()
.end

.sub testA :method
    print "Method from A called\n"
.end
.sub testB :method
    print "Method from B called\n"
.end
CODE
Method from B called
Method from A called
OUT

pir_output_is( <<'CODE', <<'OUT', 'grandparent' );
.sub 'test' :main
    .local pmc A, B, C

    A = new 'Class'
    $P0 = get_global 'testA'
    A.'add_method'("foo", $P0)
    A.'add_method'("bar", $P0)
    A.'add_method'("baz", $P0)

    B = new 'Class'
    B.'add_parent'(A)
    $P0 = get_global 'testB'
    B.'add_method'("foo", $P0)
    B.'add_method'("bar", $P0)

    C = new 'Class'
    C.'add_parent'(B)
    $P0 = get_global 'testC'
    C.'add_method'("foo", $P0)

    $P0 = C.'new'()
    $P0.'foo'()
    $P0.'bar'()
    $P0.'baz'()
.end

.sub testA :method
    print "Method from A called\n"
.end
.sub testB :method
    print "Method from B called\n"
.end
.sub testC :method
    print "Method from C called\n"
.end
CODE
Method from C called
Method from B called
Method from A called
OUT

pir_output_is( <<'CODE', <<'OUT', 'multiple inheritance' );
.sub 'test' :main
    .local pmc A, B, C

    A = newclass 'A'
    $P0 = get_global 'testA'
    A.'add_method'("foo", $P0)
    A.'add_method'("bar", $P0)
    A.'add_method'("baz", $P0)

    B = newclass 'B'
    $P0 = get_global 'testB'
    B.'add_method'("foo", $P0)
    B.'add_method'("bar", $P0)

    C = newclass 'C'
    C.'add_parent'(B)
    C.'add_parent'(A)
    $P0 = get_global 'testC'
    C.'add_method'("foo", $P0)

    $P0 = C.'new'()
    $P0.'foo'()
    $P0.'bar'()
    $P0.'baz'()
.end

.sub testA :method
    print "Method from A called\n"
.end
.sub testB :method
    print "Method from B called\n"
.end
.sub testC :method
    print "Method from C called\n"
.end
CODE
Method from C called
Method from B called
Method from A called
OUT

pir_output_is( <<'CODE', <<'OUT', 'diamond inheritance' );
.sub 'test' :main
    .local pmc A, B, C, D

    A = newclass 'A'
    $P0 = get_global 'testA'
    A.'add_method'("foo", $P0)
    A.'add_method'("bar", $P0)
    A.'add_method'("baz", $P0)
    A.'add_method'("wag", $P0)

    B = newclass 'B'
    B.'add_parent'(A)
    $P0 = get_global 'testB'
    B.'add_method'("foo", $P0)
    B.'add_method'("bar", $P0)
    B.'add_method'("baz", $P0)

    C = newclass 'C'
    C.'add_parent'(A)
    $P0 = get_global 'testC'
    C.'add_method'("foo", $P0)
    C.'add_method'("bar", $P0)

    D = newclass 'D'
    D.'add_parent'(C)
    D.'add_parent'(B)
    $P0 = get_global 'testD'
    D.'add_method'("foo", $P0)

    $P0 = D.'new'()
    $P0.'foo'()
    $P0.'bar'()
    $P0.'baz'()
    $P0.'wag'()
.end

.sub testA :method
    print "Method from A called\n"
.end
.sub testB :method
    print "Method from B called\n"
.end
.sub testC :method
    print "Method from C called\n"
.end
.sub testD :method
    print "Method from D called\n"
.end
CODE
Method from D called
Method from C called
Method from B called
Method from A called
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
