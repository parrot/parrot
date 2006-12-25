#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/op/info.t - Info Ops

=head1 SYNOPSIS

    % prove t/op/info.t

=head1 DESCRIPTION

Tests the information finding operations.

=cut

pasm_output_is( <<'CODE', 'yes', "find_type" );
	set I0, .ResizablePMCArray
	find_type I1, "ResizablePMCArray"
	eq I0, I1, YES
 NO:	print "no"
	end
 YES:   print "yes"
	end
CODE


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
