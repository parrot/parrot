#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/info.t - Info Ops

=head1 SYNOPSIS

	% perl t/op/info.t

=head1 DECSRIPTION

Tests the information finding operations.

=cut

# These tests test the information providing opcodes
use Parrot::Test tests => 1;

output_is(<<'CODE', 'yes', "find_type");
	set I0, .PerlArray
	find_type I1, "PerlArray"
	eq I0, I1, YES
 NO:	print "no"
	end
 YES:   print "yes"
	end
CODE

