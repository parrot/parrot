#!perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/pmc/enumerate.t - test Enumerate PMC


=head1 SYNOPSIS

	% prove t/pmc/enumerate.t

=head1 DESCRIPTION

Tests the Enumerate PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
	new P1, .Array
	new P0, .Enumerate, P1
	print "ok 1\n"
.end
CODE
ok 1
OUT


# remember to change the number of tests :-)
BEGIN { plan tests => 1; }
