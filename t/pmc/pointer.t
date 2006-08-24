#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/pointer.t - test the Pointer PMC


=head1 SYNOPSIS

	% prove t/pmc/pointer.t

=head1 DESCRIPTION

Tests the Pointer PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
	new P0, .Pointer
	print "ok 1\n"
.end
CODE
ok 1
OUT


