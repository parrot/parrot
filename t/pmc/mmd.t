#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/mmd.t - Multi-Method Dispatch

=head1 SYNOPSIS

	% perl t/pmc/mmd.t

=head1 DECSRIPTION

Tests the multi-method dispatch.

=cut

use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUTPUT', "type");
    new P0, .Integer
    new P1, .Integer
    new P2, .Integer
    set P1, 10
    set P2, 3
    div P0, P1, P2
    print P0
    print "\n"
    end
CODE
3
OUTPUT

