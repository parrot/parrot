#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 6;

##############################
# Parrot Calling Conventions:  Tail call optimization.

$ENV{TEST_PROG_ARGS} = '-Oc';

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, final position");
.sub _main :main
    $P1 = new Integer
    $P1 = 20
    $P2 = new Integer
    $P2 = 3
    .const .Sub f = "_floor"
    .const .Sub c = "_funcall"
    set_args "(0,0,0)", f, $P1, $P2
    get_results "(0,0)", $P3, $P4
    invokecc c
    print "_floor returned "
    print 2      # TODO argcP
    print " values, "
    print $P3
    print " and "
    print $P4
    print ".\n"
    .const .Sub s = "_fib_step"
    set_args "(0,0,0)", s, $P1, $P2
    get_results "(0,0,0)", $P3, $P4, $P5
    invokecc c
    print "_fib_step returned "
    print 3    # TODO argcP
    print " values, "
    print $P3
    print ", "
    print $P4
    print ", and "
    print $P5
    print ".\n"
.end

.sub _funcall
    .local pmc function
    .local pmc argv
    get_params "(0,0x8)", function, argv
    print "[doing _funcall]\n"
    $I33 = defined function
    if $I33 goto doit
bad_func:
    printerr "_funcall:  Bad function.\n"
    exit 0
doit:
    set_args "(0x8)", argv
    tailcall function
.end

## Return quotient and remainder as two integers.
.sub _floor
    .local pmc arg1
    .local pmc arg2
    get_params "(0,0)", arg1, arg2
    $P1 = new Integer
    $P1 = arg1 / arg2
    ## truncate.
    $I1 = $P1
    $P1 = $I1
    $P2 = new Integer
    $P2 = arg1 % arg2
    set_returns "(0,0)", $P1, $P2
    returncc
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
    .local pmc arg1
    .local pmc arg2
    get_params "(0,0)", arg1, arg2
    $P1 = new Integer
    $P1 = arg1 + arg2
    set_returns "(0,0,0)", $P1, arg1, arg2
    returncc
.end
CODE
[doing _funcall]
_floor returned 2 values, 6 and 2.
[doing _funcall]
_fib_step returned 3 values, 23, 20, and 3.
OUT

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, intermediate position");

.sub _main :main
	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
	$P2 = 3
	.const .Sub f = "_floor"
	.const .Sub s = "_fib_step"
	($P3, $P4) = _funcall(f, $P1, $P2)
	print "_floor returned "
	print 2
	print " values, "
	print $P3
	print " and "
	print $P4
	print ".\n"
	($P3, $P4, $P5) = _funcall(s, $P1, $P2)
	print "_fib_step returned "
	print 3
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
	.param pmc argv :slurpy

	print "[doing _funcall]\n"
	$I33 = defined function
	unless $I33 goto bad_func
doit:
	.return function(argv :flat)
bad_func:
	printerr "_funcall:  Bad function.\n"
	exit 0
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
	.return($P1, $P2)
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
	.param pmc arg1
	.param pmc arg2

	$P1 = new Integer
	$P1 = arg1 + arg2
	.return ($P1, arg1,  arg2)
.end
CODE
[doing _funcall]
_floor returned 2 values, 6 and 2.
[doing _funcall]
_fib_step returned 3 values, 23, 20, and 3.
OUT

pir_output_is(<<'CODE', <<'OUT', "tail call optimization, implicit final return");

.sub _main :main

	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
	$P2 = 3
	.const .Sub f = "_floor"
	.const .Sub s = "_fib_step"
	($P3, $P4) = _funcall(f, $P1, $P2)
	print "_floor returned "
	print 2
	print " values, "
	print $P3
	print " and "
	print $P4
	print ".\n"
	($P3, $P4, $P5) = _funcall(s, $P1, $P2)
	print "_fib_step returned "
	print 3
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
	.param pmc argv :slurpy

	print "[doing _funcall]\n"
	$I33 = defined function
	if $I33 goto doit
bad_func:
	printerr "_funcall:  Bad function.\n"
	exit 0
doit:
	.return function(argv :flat)
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
	.return($P1, $P2)
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

.sub _main :main

	$P1 = new Integer
	$P1 = 20
	$P2 = new Integer
	$P2 = 3
	.const .Sub s = "_fib_step"
	($P3, $P4, $P5) = _funcall(s, $P1, $P2)
	print "_fib_step returned "
	print 3
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
	.param pmc argv :slurpy

	$I33 = defined function
	unless $I33 goto bad_func
doit:
	($P35 :slurpy) = function(argv :flat)
        $I35 = $P35
        print "[got "
        print $I35
        print " results]\n"
	.return ($P35 :flat)
bad_func:
	printerr "_funcall:  Bad function.\n"
	exit 0
.end

## Return the sum and the two arguments as three integers.
.sub _fib_step
	.param pmc arg1
	.param pmc arg2

	$P1 = new Integer
	$P1 = arg1 + arg2
	.return ($P1, arg1,  arg2)
.end
CODE
[got 3 results]
_fib_step returned 3 values, 23, 20, and 3.
OUT

pir_output_is(<<'CODE', <<'OUT', "new tail call syntax");
.sub main :main
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
.sub main :main
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
