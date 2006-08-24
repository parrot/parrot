#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;


=head1 NAME

t/op/globals.t - Global Variables

=head1 SYNOPSIS

	% prove t/op/globals.t

=head1 DESCRIPTION

Tests the C<get_global> and C<set_global> operations.

LEGACY: Tests the C<store_global> and C<find_global> operations.

=cut

pasm_output_is(<<'CODE', '12', "set/get");
	new P0, .Integer
	new P1, .Integer
	set P0, 12
	set P1, 7
	set_global "Integer", P0
	get_global P1, "Integer"
	print P1
	end
CODE

pasm_output_like(<<'CODE', <<'OUTPUT', "get null global");
       null S0
       get_global P1, S0
       end
CODE
/Tried to get null global/
OUTPUT

pasm_output_is(<<'CODE', <<OUT, "not found null");
	get_global P1, "no_such_global"
	print "ok 1\n"
	defined I0, P1
	unless I0, ok2
	print "not "
ok2:	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUT

pir_output_is(<<'CODE', <<OUT, "get/set global with key");
.namespace [ "Monkey" ]
.sub main :main
	set_it()
	$P1 = get_hll_global [ "Monkey" ; "Toaster" ], "Explosion"
	print $P1
.end
.sub set_it
	$P0 = new .String
	$P0 = "Ook...BANG!\n"
	set_global [ "Toaster" ], "Explosion", $P0
.end
CODE
Ook...BANG!
OUT

pir_output_is(<<'CODE', <<OUT, "get/set root global with key");
.namespace [ "Monkey" ]
.sub main :main
	set_it()
	$P1 = get_hll_global [ "Monkey" ; "Toaster" ], "Explosion"
	print $P1
.end
.sub set_it
	$P0 = new .String
	$P0 = "Ook...BANG!\n"
	set_root_global [ "parrot"; "Monkey"; "Toaster" ], "Explosion", $P0
.end
CODE
Ook...BANG!
OUT


#----------------------------------------------------------------
# LEGACY
#----------------------------------------------------------------

pasm_output_is(<<'CODE', '12', "Fetch and store");
	new P0, .Integer
	new P1, .Integer
	set P0, 12
	set P1, 7
	store_global "Integer", P0
	find_global P1, "Integer"
	print P1
	end
CODE

pasm_output_like(<<'CODE', <<'OUTPUT', "Find null global");
       null S0
       find_global P1, S0
       end
CODE
/Tried to get null global/
OUTPUT

pasm_output_is(<<'CODE', <<OUT, "not found null");
	find_global P1, "no_such_global"
	print "ok 1\n"
	defined I0, P1
	unless I0, ok2
	print "not "
ok2:	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUT

pir_output_is(<<'CODE', <<OUT, "find/store global with key");
.sub main :main
	set_it()
	$P1 = find_global [ "Monkey" ; "Toaster" ], "Explosion"
	print $P1
.end
.sub set_it
	$P0 = new .String
	$P0 = "Ook...BANG!\n"
	store_global [ "Monkey" ; "Toaster" ], "Explosion", $P0
.end
CODE
Ook...BANG!
OUT
