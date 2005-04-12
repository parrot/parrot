#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/tqueue.t - Thread Queue

=head1 SYNOPSIS

	% perl -Ilib t/pmc/tqueue.t

=head1 DESCRIPTION

Tests the thread queue.

=cut

use Parrot::Test tests => 1;
use Test::More;

output_is(<<'CODE', <<'OUT', "thread safe queue 1");
    new P10, .TQueue
    print "ok 1\n"
    set I0, P10
    print I0
    print "\n"
    new P7, .Integer
    set P7, 2
    push P10, P7
    new P7, .Integer
    set P7, 3
    push P10, P7
    set I0, P10
    print I0
    print "\n"

    shift P8, P10
    print P8
    print "\n"
    shift P8, P10
    print P8
    print "\n"
    end
CODE
ok 1
0
2
2
3
OUT
