#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/globals.t - Global Variables

=head1 SYNOPSIS

	% perl -Ilib t/op/globals.t

=head1 DESCRIPTION

Tests the C<store_global> and C<find_global> operations.

=cut

use Parrot::Test tests => 3;

output_is(<<'CODE', '12', "Fetch and store");
	new P0, .PerlInt
	new P1, .PerlInt
	set P0, 12
	set P1, 7
	store_global "Integer", P0
	find_global P1, "Integer"
	print P1
	end
CODE

output_like(<<'CODE', <<OUT, "not found exception");
	find_global P1, "no_such_global"
	print "ok 1\n"
	print P1
	end
CODE
/Global 'no_such_global' not found/
OUT

output_is(<<'CODE', <<OUT, "not found - error turned off");
        .include "errors.pasm"
        errorsoff .PARROT_ERRORS_GLOBALS_FLAG
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

