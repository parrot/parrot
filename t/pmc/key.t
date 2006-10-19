#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/pmc/key.t - Keys

=head1 SYNOPSIS

    % prove t/pmc/key.t

=head1 DESCRIPTION

Tests the C<Key> PMC.

=cut

pasm_output_is(<<'CODE', <<'OUT', 'traverse key chain');
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

pasm_output_is(<<'CODE', <<'OUT', 'extract int from string keys');
new P0, .ResizableStringArray
push P0, "ok 1\n"
push P0, "ok 2\n"
set S0, 0
set P1, P0[S0]
print P1
set P1, P0["1"]
print P1
end
CODE
ok 1
ok 2
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
