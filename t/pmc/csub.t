#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/csub.t - test CSub PMC


=head1 SYNOPSIS

	% prove t/pmc/csub.t

=head1 DESCRIPTION

Tests the CSub PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
	new P0, .CSub
	print "ok 1\n"
.end
CODE
ok 1
OUT


