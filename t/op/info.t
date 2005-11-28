#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;


=head1 NAME

t/op/info.t - Info Ops

=head1 SYNOPSIS

	% prove t/op/info.t

=head1 DESCRIPTION

Tests the information finding operations.

=cut


output_is(<<'CODE', 'yes', "find_type");
	set I0, .PerlArray
	find_type I1, "PerlArray"
	eq I0, I1, YES
 NO:	print "no"
	end
 YES:   print "yes"
	end
CODE


## remember to change the number of tests :-)
BEGIN { plan tests => 1; }
