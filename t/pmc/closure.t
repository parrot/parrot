#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/pmc/closure.t - test Closure PMC


=head1 SYNOPSIS

	% prove t/pmc/closure.t

=head1 DESCRIPTION

Tests the Closure PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
	new P0, .Closure
	print "ok 1\n"
.end
CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUTPUT', 'Make sure we can sweep closures.');
## This is a regression test for a bug in which Closure:mark expected
## sub->outer_ctx to be initialized, regardless of whether the closure
## had ever been called.
.sub _test_1 :main
	.lex "X", $P40
	$P40 = new Integer
	$P40 = 22
	.const .Sub $P43 = "___internal_test_1_0_"
	newclosure $P44, $P43
	sweep 1
        print "We lived.\n"
.end
.sub ___internal_test_1_0_ :outer('_test_1')
	print "This is never actually run.\n"
.end
CODE
We lived.
OUTPUT

# remember to change the number of tests :-)
BEGIN { plan tests => 2; }
