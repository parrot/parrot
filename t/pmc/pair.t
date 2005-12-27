#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/pair.t - pair tests

=head1 SYNOPSIS

	% prove t/pmc/pair.t

=head1 DESCRIPTION

Tests the C<Pair> PMC.

=cut

output_is(<<'CODE', <<'OUT', 'create');
    new P0, .Pair
    print "ok 1\n"
    new P1, .Integer
    set P1, 42
    set P0["key"], P1
    print "ok 2\n"
    set P2, P0["key"]
    print P2
    print "\n"
    end
CODE
ok 1
ok 2
42
OUT

pir_output_is(<<'CODE', <<'OUT', 'methods');
.sub main :main
    .local pmc p, kv
    new p, .Pair
    new $P1, .Integer
    set $P1, 42
    set p["key"], $P1

    $P0 = p."key"()
    print_item $P0
    $P0 = p."value"()
    print_item $P0
    kv = p."kv"()
    $I0 = elements kv
    print_item $I0
    $P0 = kv[0]
    print_item $P0
    $P0 = kv[1]
    print_item $P0
    print_newline
.end
CODE
key 42 2 key 42
OUT

SKIP: {
	skip("instantiate disabled", 1);
pir_output_is(<<'CODE', <<'OUT', 'instantiate, assign');
.sub main :main
    .local pmc cl, p, kv, k, v
    k = new .String
    k = "key"
    v = new .String
    v = "value"
    cl = getclass "Pair"
    p = cl."instantiate"(k, v)

    $P0 = p."key"()
    print_item $P0
    $P0 = p."value"()
    print_item $P0

    v = new .Integer
    v = 77
    assign p, v
    $P0 = p."value"()
    print_item $P0

    print_newline
.end
CODE
key value 77
OUT
}
