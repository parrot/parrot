#!perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/pmc/none.t - test None PMC


=head1 SYNOPSIS

	% prove t/pmc/none.t

=head1 DESCRIPTION

Tests the None PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
    new P0, .None
    print "ok 1\n"
.end
CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUT', 'get_string returns ""');
.sub 'test' :main
    new P0, .None
    S0 = P0
    eq S0, '', OK
NOK:print "not "
OK: print "ok\n"
.end
CODE
ok
OUT

# remember to change the number of tests :-)
BEGIN { plan tests => 2; }
