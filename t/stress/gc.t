#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/stress/gc.t - Garbage Collection

=head1 SYNOPSIS

	% perl t/stress/gc.t

=head1 DECSRIPTION

Tests garbage collection.

=cut

use Parrot::Test tests => 1;
use Test::More;
use Parrot::PMC qw(%pmc_types);

output_is(<<'CODE', <<'OUTPUT', "arraystress");
	print "starting\n"
	new P0, .PerlInt
	print "ending\n"
	end
CODE
starting
ending
OUTPUT

1;
