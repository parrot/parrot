#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/multisub.t - Multi Sub PMCs

=head1 SYNOPSIS

	% perl -Ilib t/pmc/multisub.t

=head1 DESCRIPTION

Tests the creation and invocation Perl6 multi subs.

=cut

use Parrot::Test tests => 1;
use Test::More;
use Parrot::Config;

output_is(<<'CODE', <<'OUTPUT', "create PMC");
    new P0, .MultiSub
    print "ok 1\n"
    elements I0, P0
    print I0
    print "\n"
    end
CODE
ok 1
0
OUTPUT

