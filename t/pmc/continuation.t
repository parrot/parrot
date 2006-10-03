#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/pmc/continuation.t - test Continuation PMC


=head1 SYNOPSIS

	% prove t/pmc/continuation.t

=head1 DESCRIPTION

Tests the Continuation PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
	new P0, .Continuation
	print "ok 1\n"
.end
CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUT', 'continuations preserve bsr/ret state.');
## Here is a trace of execution, keyed by labels.
##   L1:  bsr to rtn1
## rtn1:  create a continuation that directs us to L6, and (we expect) captures
##        captures the whole dynamic state, including the return address to L3.
##   L3:  return back to main
##   L4:  if we're here the first time, call rtn2
## rtn2:  call the continuation from that routine.
##   L6:  print "Continuation called." and return, which should take us . . .
##   L3:  here the second time, where we print "done." and exit.
.sub test_control_cont :main
L1:
	.local int return_count
	.local pmc cont
	return_count = 0
	bsr rtn1
L3:
	unless return_count goto L4
	print "done.\n"
	end
L4:
	inc return_count
	bsr rtn2
	print "Oops; shouldn't have returned from rtn2.\n"
	end
L6:
	print "Continuation called.\n"
	ret
rtn1:
	print "Taking continuation.\n"
	cont = new .Continuation
	set_addr cont, L6
	ret
rtn2:
	print "Calling continuation.\n"
	cont()
	ret
.end
CODE
Taking continuation.
Calling continuation.
Continuation called.
done.
OUT

pir_output_is(<<'CODE', <<'OUT', 'continuations call actions.');
## the test_cont_action sub creates a continuation and passes it to _test_1
## twice:  the first time returns normally, the second time returns via the
## continuation.
.sub test_cont_action :main
	## debug 0x80
	.local pmc cont
	cont = new .Continuation
	set_addr cont, continued
	_test_1(4, cont)
	_test_1("bar", cont)
	print "oops; no "
continued:
	print "continuation called.\n"
.end

## set up C<pushaction> cleanup, and pass our arguments to _test_2.
.sub _test_1
	.param pmc arg1
	.param pmc cont
	print "_test_1\n"
	.const .Sub $P43 = "___internal_test_1_0_"
	pushaction $P43
	$P50 = _test_2(arg1, cont)
	print "got "
	print $P50
	print "\n"
	.return ($P50)
.end

## cleanup sub used by _test_1, which just shows whether or not the action was
## called at the right time.
.sub ___internal_test_1_0_
	.local pmc arg1
	print "unwinding\n"
	.return ()
.end

## return 3*n if n is an integer, else invoke the continuation.
.sub _test_2
	.param pmc n
	.param pmc cont
	typeof $I40, n
	if $I40 != .Integer goto L3
	$P44 = n_mul n, 3
	.return ($P44)
L3:
	cont()
.end
CODE
_test_1
got 12
unwinding
_test_1
unwinding
continuation called.
OUT

pir_output_like(<<'CODE', <<'OUT', 'continuation action context');
## this makes sure that returning via the continuation causes the action to be
## invoked in the right dynamic context (i.e. without the error handler).
.sub test_cont_action :main
	.local pmc cont
	cont = new .Continuation
	set_addr cont, continued
	_test_1("bar", cont)
	print "oops; no "
continued:
	print "continuation called.\n"
.end

## set up C<pushaction> cleanup, and pass our arguments to _test_2.
.sub _test_1
	.param pmc arg1
	.param pmc cont
	print "_test_1\n"
	.const .Sub $P43 = "___internal_test_1_0_"
	pushaction $P43
	$P50 = _test_2(arg1, cont)
	print "got "
	print $P50
	print "\n"
	.return ($P50)
.end

## cleanup sub used by _test_1, which just shows whether or not the action was
## called at the right time.
.sub ___internal_test_1_0_
	.local pmc arg1
	print "unwinding\n"
	$P0 = new .Exception
	$P0["_message"] = "something happened"
	throw $P0
.end

## invoke the continuation within an error handler.
.sub _test_2
	.param pmc n
	.param pmc cont
	push_eh L3
	cont()
	print "oops"
L3:
	.local pmc exception
	.get_results (exception, $S0)
	print "Error: "
	print exception
	print "\n"
.end
CODE
/\A_test_1
unwinding
something happened
current instr/
OUT

# end of tests.
