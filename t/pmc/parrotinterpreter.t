#!perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/pmc/parrotinterpreter.t - test the ParrotInterpreter PMC


=head1 SYNOPSIS

	% prove t/pmc/parrotinterpreter.t

=head1 DESCRIPTION

Tests the ParrotInterpreter PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
	new P0, .ParrotInterpreter
	print "ok 1\n"
.end
CODE
ok 1
OUT


# remember to change the number of tests :-)
BEGIN { plan tests => 1; }
