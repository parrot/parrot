#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 3;

##############################
# Parrot Calling Conventions:  Tail call optimization.

$ENV{TEST_PROG_ARGS} = '-Oc';

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, final position");

.sub _main @MAIN

	$P1 = new PerlInt
	$P1 = 20
	$P2 = new PerlInt
	$P2 = 3
	newsub $P99, .Sub, _floor
	($P3, $P4) = _funcall($P99, $P1, $P2)
	print "_floor returned "
	print argcP
	print " values, "
	print $P3
	print " and "
	print $P4
	print ".\n"
	newsub $P98, .Sub, _fib_step
	($P3, $P4, $P5) = _funcall($P98, $P1, $P2)
	print "_fib_step returned "
	print argcP
	print " values, "
	print $P3
	print ", "
	print $P4
	print ", and "
	print $P5
	print ".\n"
.end

.sub _funcall non_prototyped
	.param pmc function
	.local pmc argv
	argv = foldup 1

	print "[doing _funcall]\n"
	$I33 = defined function
	if $I33 goto doit
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
doit:
	.pcc_begin prototyped
	.flatten_arg argv
	.pcc_call function
	.pcc_end
	.pcc_begin_return
	.pcc_end_return
.end

## Return quotient and remainder as two integers.
.sub _floor
	.param pmc arg1
	.param pmc arg2

	$P1 = new PerlInt
	$P1 = arg1 / arg2
	## truncate.
	$I1 = $P1
	$P1 = $I1
	$P2 = new PerlInt
	$P2 = arg1 % arg2
	.pcc_begin_return
	.return $P1
	.return $P2
	.pcc_end_return
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
	.param pmc arg1
	.param pmc arg2

	$P1 = new PerlInt
	$P1 = arg1 + arg2
	.pcc_begin_return
	.return $P1
	.return arg1
	.return arg2
	.pcc_end_return
.end
CODE
[doing _funcall]
_floor returned 2 values, 6 and 2.
[doing _funcall]
_fib_step returned 3 values, 23, 20, and 3.
OUT

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, intermediate position");

.sub _main @MAIN

	$P1 = new PerlInt
	$P1 = 20
	$P2 = new PerlInt
	$P2 = 3
	newsub $P99, .Sub, _floor
	($P3, $P4) = _funcall($P99, $P1, $P2)
	print "_floor returned "
	print argcP
	print " values, "
	print $P3
	print " and "
	print $P4
	print ".\n"
	newsub $P98, .Sub, _fib_step
	($P3, $P4, $P5) = _funcall($P98, $P1, $P2)
	print "_fib_step returned "
	print argcP
	print " values, "
	print $P3
	print ", "
	print $P4
	print ", and "
	print $P5
	print ".\n"
.end

.sub _funcall non_prototyped
	.param pmc function
	.local pmc argv
	argv = foldup 1

	print "[doing _funcall]\n"
	$I33 = defined function
	unless $I33 goto bad_func
doit:
	.pcc_begin prototyped
	.flatten_arg argv
	.pcc_call function
	.pcc_end
	.pcc_begin_return
	.pcc_end_return
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
.end

## Return quotient and remainder as two integers.
.sub _floor
	.param pmc arg1
	.param pmc arg2

	$P1 = new PerlInt
	$P1 = arg1 / arg2
	## truncate.
	$I1 = $P1
	$P1 = $I1
	$P2 = new PerlInt
	$P2 = arg1 % arg2
	.pcc_begin_return
	.return $P1
	.return $P2
	.pcc_end_return
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
	.param pmc arg1
	.param pmc arg2

	$P1 = new PerlInt
	$P1 = arg1 + arg2
	.pcc_begin_return
	.return $P1
	.return arg1
	.return arg2
	.pcc_end_return
.end
CODE
[doing _funcall]
_floor returned 2 values, 6 and 2.
[doing _funcall]
_fib_step returned 3 values, 23, 20, and 3.
OUT

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, implicit final return");

.sub _main @MAIN

	$P1 = new PerlInt
	$P1 = 20
	$P2 = new PerlInt
	$P2 = 3
	newsub $P99, .Sub, _floor
	($P3, $P4) = _funcall($P99, $P1, $P2)
	print "_floor returned "
	print argcP
	print " values, "
	print $P3
	print " and "
	print $P4
	print ".\n"
	newsub $P98, .Sub, _fib_step
	($P3, $P4, $P5) = _funcall($P98, $P1, $P2)
	print "_fib_step returned "
	print argcP
	print " values, "
	print $P3
	print ", "
	print $P4
	print ", and "
	print $P5
	print ".\n"
.end

.sub _funcall non_prototyped
	.param pmc function
	.local pmc argv
	argv = foldup 1

	print "[doing _funcall]\n"
	$I33 = defined function
	if $I33 goto doit
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
doit:
	.pcc_begin prototyped
	.flatten_arg argv
	.pcc_call function
	.pcc_end
.end

## Return quotient and remainder as two integers.
.sub _floor
	.param pmc arg1
	.param pmc arg2

	$P1 = new PerlInt
	$P1 = arg1 / arg2
	## truncate.
	$I1 = $P1
	$P1 = $I1
	$P2 = new PerlInt
	$P2 = arg1 % arg2
	.pcc_begin_return
	.return $P1
	.return $P2
	.pcc_end_return
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
	.param pmc arg1
	.param pmc arg2

	$P1 = new PerlInt
	$P1 = arg1 + arg2
	.pcc_begin_return
	.return $P1
	.return arg1
	.return arg2
	.pcc_end_return
.end
CODE
[doing _funcall]
_floor returned 2 values, 6 and 2.
[doing _funcall]
_fib_step returned 3 values, 23, 20, and 3.
OUT
