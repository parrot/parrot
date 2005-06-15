#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 6;

##############################
# Parrot Calling Conventions:  Tail call optimization.

$ENV{TEST_PROG_ARGS} = '-Oc';

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, final position");

.sub _main @MAIN
	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
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

.sub _funcall
	.param pmc function
	.param pmc argv :slurp

	print "[doing _funcall]\n"
	$I33 = defined function
	if $I33 goto doit
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
doit:
	function(argv :flatten)
	.pcc_tail_return
.end

## Return quotient and remainder as two integers.
.sub _floor
	.param pmc arg1
	.param pmc arg2

	$P1 = new Integer
	$P1 = arg1 / arg2
	## truncate.
	$I1 = $P1
	$P1 = $I1
	$P2 = new Integer
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

	$P1 = new Integer
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
	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
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

.sub _funcall
	.param pmc function
	.param pmc argv :slurp

	print "[doing _funcall]\n"
	$I33 = defined function
	unless $I33 goto bad_func
doit:
	function(argv :flatten)
	.pcc_tail_return
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
.end

## Return quotient and remainder as two integers.
.sub _floor
	.param pmc arg1
	.param pmc arg2

	$P1 = new Integer
	$P1 = arg1 / arg2
	## truncate.
	$I1 = $P1
	$P1 = $I1
	$P2 = new Integer
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

	$P1 = new Integer
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

	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
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

.sub _funcall
	.param pmc function
	.param pmc argv :slurp

	print "[doing _funcall]\n"
	$I33 = defined function
	if $I33 goto doit
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
doit:
	function(argv :flatten)
.end

## Return quotient and remainder as two integers.
.sub _floor
	.param pmc arg1
	.param pmc arg2

	$P1 = new Integer
	$P1 = arg1 / arg2
	## truncate.
	$I1 = $P1
	$P1 = $I1
	$P2 = new Integer
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

	$P1 = new Integer
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

pir_output_is(<<'CODE', <<'OUT', ":flatten in .return");

.sub _main @MAIN

	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
	$P2 = 3
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

.sub _funcall
	.param pmc function
	.param pmc argv :slurp

	$I33 = defined function
	unless $I33 goto bad_func
doit:
	($P35 :slurp) = function(argv :flatten)
        $I35 = $P35
        print "[got "
        print $I35
        print " results]\n"
	.pcc_begin_return
	.return $P35 :flatten
	.pcc_end_return
bad_func:
	printerr "_funcall:  Bad function.\n"
	die
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
	.param pmc arg1
	.param pmc arg2

	$P1 = new Integer
	$P1 = arg1 + arg2
	.pcc_begin_return
	.return $P1
	.return arg1
	.return arg2
	.pcc_end_return
.end
CODE
[got 3 results]
_fib_step returned 3 values, 23, 20, and 3.
OUT

pir_output_is(<<'CODE', <<'OUT', "new tail call syntax");
.sub main @MAIN
    $S0 = foo()
    print $S0
.end

.sub foo
    .return bar()
    print "never\n"
.end

.sub bar
    .return ("ok\n")
.end
CODE
ok
OUT

pir_output_is(<<'CODE', <<'OUT', "new tail method call syntax");
.sub main @MAIN
    .local pmc cl, o, n
    cl = newclass "Foo"
    addattribute cl, "n"
    o = new "Foo"
    n = new Integer
    n = 2000   # beyond recursion limit of 1000
    setattribute o, "Foo\0n", n
    o."go"()
    n = getattribute o, "Foo\0n"
    print n
    print "\n"
.end

.namespace ["Foo"]
.sub go method
    .local pmc n
    n = getattribute self, "Foo\0n"
    dec n
    unless n goto done
    .return self."go"()
done:
.end

CODE
0
OUT
