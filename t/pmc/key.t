#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/key.t - Keys

=head1 SYNOPSIS

	% perl t/pmc/key.t

=head1 DESCRIPTION

Tests the C<Key> PMC.

=cut

use Parrot::Test tests => 2;
use Test::More;

output_is(<<'CODE', <<'OUT', 'traverse key chain');
    new P0, .Key
    set P0, "1"
    new P1, .Key
    set P1, "2"
    push P0, P1
    new P2, .Key
    set P2, "3"
    push P1, P2

    set P4, P0
l1:
    defined I0, P0
    unless I0, e1
    print P0
    shift P0, P0
    branch l1
e1:
    print "\n"

    set P0, P4
l2:
    defined I0, P0
    unless I0, e2
    print P0
    shift P0, P0
    branch l2
e2:
    print "\n"
    end
CODE
123
123
OUT

output_is(<<'CODE', <<'OUT', 'iter key chain');
    new P0, .Key
    set P0, "1"
    new P1, .Key
    set P1, "2"
    push P0, P1
    new P2, .Key
    set P2, "3"
    push P1, P2

    .include "iterator.pasm"
    new P5, .Iterator, P0
    print "ok 1\n"
    set P5, .ITERATE_FROM_START
lp:
    unless P5, end
    shift P4, P5
    print P4
    branch lp
end:
    print "\n"
    end
CODE
ok 1
123
OUT
