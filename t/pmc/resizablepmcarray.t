#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 25;

=head1 NAME

t/pmc/resizablepmcarray.t - testing the ResizablePMCArray PMC

=head1 SYNOPSIS

	% prove t/pmc/resizablepmcarray.t

=head1 DESCRIPTION

Tests C<ResizablePMCArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut


my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq (	J, K, L )
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	gt	N2, 0.000001, .$FPEQNOK

	restore N2
	restore	N1
	restore	N0
	branch	.L
.local $FPEQNOK:
	restore N2
	restore	N1
	restore	N0
.endm
.macro fp_ne(	J,K,L)
	save	N0
	save	N1
	save	N2

	set	N0, .J
	set	N1, .K
	sub	N2, N1,N0
	abs	N2, N2
	lt	N2, 0.000001, .$FPNENOK

	restore	N2
	restore	N1
	restore	N0
	branch	.L
.local $FPNENOK:
	restore	N2
	restore	N1
	restore	N0
.endm
ENDOFMACRO

pasm_output_is(<<'CODE', <<'OUTPUT', "Setting array size");
	new P0,.ResizablePMCArray

	set I0,P0
	eq I0,0,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0,1
	set I0,P0
	eq I0,1,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0,5
	set I0,P0
	eq I0,5,OK_3
	print "not "
OK_3:	print "ok 3\n"

	set P0,9
	set I0,P0
	eq I0,9,OK_4
	print "not "
OK_4:	print "ok 4\n"

	set P0,7
	set I0,P0
	eq I0,7,OK_5
	print "not "
OK_5:	print "ok 5\n"
        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "Setting negative array size");
	new P0, .ResizablePMCArray
        set P0, -1
        end
CODE
/ResizablePMCArray: Can't resize!/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .ResizablePMCArray
        set P0, 1

	set P0[0],-7
	set I0,P0[0]
	eq I0,-7,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0[0],3.7
	set N0,P0[0]
	eq N0,3.7,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0[0],"muwhahaha"
	set S0,P0[0]
	eq S0,"muwhahaha",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Setting second element");
        new P0, .ResizablePMCArray

	set P0[1], -7
	set I0, P0[1]
	eq I0,-7,OK_1
	print "not "
OK_1:	print "ok 1\n"

	set P0[1], 3.7
	set N0, P0[1]
	eq N0,3.7,OK_2
	print "not "
OK_2:	print "ok 2\n"

	set P0[1],"purple"
	set S0, P0[1]
	eq S0,"purple",OK_3
	print "not "
OK_3:	print "ok 3\n"

	end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Setting last element");
        new P0, .ResizablePMCArray
        set P0, 10
        new P1, .Integer
        set P1, 1234
	set P0[-1], P1
        new P2, .Integer
        set P2, P0[9]
        print P2
        print "\n"
	end
CODE
1234
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Getting last element");
        new P0, .ResizablePMCArray
        set P0, 100
        new P1, .Integer
        set P1, 4321
	set P0[99], P1
        new P2, .Integer
        set P2, P0[-1]
        print P2
        print "\n"
	end
CODE
4321
OUTPUT

# TODO: Rewrite these properly when we have exceptions

pasm_output_is(<<'CODE', <<'OUTPUT', "Setting out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1

	set P0[1], -7
	print "ok 1\n"

	end
CODE
ok 1
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "Setting -ve out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1
        new P1, .Integer
        set P1, 12345

	set P0[-10], P1
	end
CODE
/ResizablePMCArray: index out of bounds!/
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1

	set I0, P0[1]
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

pasm_output_like(<<'CODE', <<'OUTPUT', "Getting -ve out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1
        new P1, .Integer
	set P1, P0[-10]
	end
CODE
/ResizablePMCArray: index out of bounds!/
OUTPUT

pasm_output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
@{[ $fp_equality_macro ]}
     new P0, .ResizablePMCArray
     new P1, .Key

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "bleep"

     new P2, .String
     set P2, "Bloop"
     set P1, 3
     set P0[P1], P2

     set I0, P0[0]
     eq I0, 25, OK1
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq(N0, 2.5, OK2)
     print "not "
OK2: print "ok 2\\n"

     set S0, P0[2]
     eq S0, "bleep", OK3
     print "not "
OK3: print "ok 3\\n"

     new P3, .Undef
     set P3, P0[3]
     set S0, P3
     eq S0, "Bloop", OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is(<<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys");
@{[ $fp_equality_macro ]}
     new P0, .ResizablePMCArray
     set P0, 1

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "cow"
     new P1, .Integer
     set P1, 123456
     set P0[1023], P1

     new P2, .Key
     set P2, 25
     set I0, P0[P2]
     eq I0, 125, OK1
     print "not "
OK1: print "ok 1\\n"

     set P2, 128
     set N0, P0[P2]
     .fp_eq(N0, 10.2, OK2)
     print "not "
OK2: print "ok 2\\n"

     set P2, 513
     set S0, P0[P2]
     eq S0, "cow", OK3
     print "not "
OK3: print "ok 3\\n"

     set P2, 1023
     set P3, P0[P2]
     set I1, P3
     eq I1, 123456, OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub test :main
    .local pmc pmc1
    pmc1 = new ResizablePMCArray
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "array"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "inherited sort method");

.sub test :main
    .local pmc ar
    ar = new ResizablePMCArray

    ar[0] = 10
    ar[1] = 2
    ar[2] = 5
    ar[3] = 9
    ar[4] = 1

    .local pmc cmp_fun
    null cmp_fun
    ar."sort"(cmp_fun)

    .local pmc it
    iter it, ar
lp:
    unless it goto done
    $P0 = shift it
    print $P0
    print " "
    goto lp
done:
    print "x\n"

    end
.end
CODE
1 2 5 9 10 x
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "push pmc");

.sub test :main
    .local pmc pmc_arr, pmc_9999, pmc_10000
    pmc_arr = new ResizablePMCArray
    pmc_9999  = new Float
    pmc_9999  = 10000.10000
    pmc_10000 = new Float
    pmc_10000 = 123.123
    pmc_arr[9999] = pmc_9999
    push pmc_arr, pmc_10000
    .local int elements
    elements = pmc_arr
    print elements
    print "\n"
    .local pmc last
    last = pmc_arr[10000]
    print last
    print "\n"
    end
.end
CODE
10001
123.123
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "push integer");

.sub test :main
    .local pmc pmc_arr, pmc_9999
    .local int int_10000
    pmc_arr = new ResizablePMCArray
    pmc_9999  = new Float
    pmc_9999  = 10000.10000
    int_10000 = 123
    pmc_arr[9999] = pmc_9999
    push pmc_arr, int_10000
    .local int elements
    elements = pmc_arr
    print elements
    print "\n"
    .local pmc last
    last = pmc_arr[10000]
    print last
    print "\n"
    end
.end
CODE
10001
123
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "push string");

.sub test :main
    .local pmc pmc_arr, pmc_9999
    .local string string_10000
    pmc_arr = new ResizablePMCArray
    pmc_9999  = new Float
    pmc_9999  = 10000.10000
    string_10000 = '123asdf'
    pmc_arr[9999] = pmc_9999
    push pmc_arr, string_10000
    .local int elements
    elements = pmc_arr
    print elements
    print "\n"
    .local pmc last
    last = pmc_arr[10000]
    print last
    print "\n"
    end
.end
CODE
10001
123asdf
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "shift integer");

.sub test :main
    .local pmc pmc_arr, elem
    pmc_arr = new ResizablePMCArray
    push pmc_arr, 4
    push pmc_arr, 3
    push pmc_arr, 2
    push pmc_arr, 1
    push pmc_arr, 0

    .local int elements

    elements = pmc_arr
    print elements
    print "\n"

    elem = shift pmc_arr
    print elem
    print ' '
    elements = pmc_arr
    print elements
    print "\n"

    elem = shift pmc_arr
    print elem
    print ' '
    elements = pmc_arr
    print elements
    print "\n"

    elem = shift pmc_arr
    print elem
    print ' '
    elements = pmc_arr
    print elements
    print "\n"

    elem = shift pmc_arr
    print elem
    print ' '
    elements = pmc_arr
    print elements
    print "\n"

    elem = shift pmc_arr
    print elem
    print ' '
    elements = pmc_arr
    print elements
    print "\n"

.end
CODE
5
4 4
3 3
2 2
1 1
0 0
OUTPUT

pasm_output_is(<< 'CODE', << 'OUTPUT', "unshift pmc");
    new P0, .ResizablePMCArray
    new P1, .Integer
    set P1, 1
    new P2, .Integer
    set P2, 2
    new P3, .Integer
    set P3, 3
    unshift P0, P1
    unshift P0, P2
    unshift P0, P3
    elements I0, P0
    print I0
    print "\n"
    set P3, P0[0]
    print P3
    print "\n"
    set P3, P0[1]
    print P3
    print "\n"
    set P3, P0[2]
    print P3
    print "\n"
    end
CODE
3
3
2
1
OUTPUT

pasm_output_is(<<'CODE', <<'OUT', "get_mro");
    new P0, .ResizablePMCArray
    get_mro P1, P0
    print "ok 1\n"
    elements I1, P1
    null I0
loop:
    set P2, P1[I0]
    classname S0, P2
    print S0
    print "\n"
    inc I0
    lt I0, I1, loop
    end
CODE
ok 1
ResizablePMCArray
FixedPMCArray
OUT

pir_output_is(<< 'CODE', << 'OUTPUT', "push and pop");

.sub test :main
    .local float f, f_elem
    .local int i, i_elem, elements
    .local pmc p, p_elem, pmc_arr
    .local string s, s_elem

    f= 123.123
    i= 123
    p= new Float
    p= 456.456
    s= "abc"

    pmc_arr= new ResizablePMCArray

    elements= pmc_arr
    print elements
    print "\n"

    push pmc_arr, s
    print s
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    push pmc_arr, p
    print p
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    push pmc_arr, i
    print i
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    push pmc_arr, f
    print f
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    elements= pmc_arr
    print elements
    print "\n"

    f_elem= pop pmc_arr
    print f_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    i_elem= pop pmc_arr
    print i_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    p_elem= pop pmc_arr
    print p_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    s_elem= pop pmc_arr
    print s_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

.end
CODE
0
abc 1
456.456 2
123 3
123.123000 4
4
123.123000 3
123 2
456.456 1
abc 0
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "unshift and shift");

.sub test :main
    .local float f, f_elem
    .local int i, i_elem, elements
    .local pmc p, p_elem, pmc_arr
    .local string s, s_elem

    f= 123.123
    i= 123
    p= new Float
    p= 456.456
    s= "abc"

    pmc_arr= new ResizablePMCArray

    elements= pmc_arr
    print elements
    print "\n"

    unshift pmc_arr, f
    print f
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    unshift pmc_arr, i
    print i
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    unshift pmc_arr, p
    print p
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    unshift pmc_arr, s
    print s
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    print elements
    print "\n"

    s_elem= shift pmc_arr
    print s_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    p_elem= shift pmc_arr
    print p_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    i_elem= shift pmc_arr
    print i_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

    f_elem= shift pmc_arr
    print f_elem
    print ' '
    elements= pmc_arr
    print elements
    print "\n"

.end
CODE
0
123.123000 1
123 2
456.456 3
abc 4
4
abc 3
456.456 2
123 1
123.123000 0
OUTPUT

# An Integer Matrix, as used by befunge as a playing field 
pir_output_is(<< 'CODE', << 'OUTPUT', "multi key access");

.sub test :main
    .local pmc matrix, row_in, row_out
    matrix = new ResizablePMCArray
    row_in = new ResizableIntegerArray
    push row_in, 42
    push matrix, row_in

    .local int elem
    print "int in ResizableIntegerArray: "
    elem = matrix[0;0]
    print elem
    print "\n"

    matrix[0;1] = 43
    print "int in ResizableIntegerArray: "
    elem = matrix[0;1]
    print elem
    print "\n"
    
.end
CODE
int in ResizableIntegerArray: 42
int in ResizableIntegerArray: 43
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "exists and defined");
.sub test :main
    .local pmc array
    array = new ResizablePMCArray
    push array, 'a'
    push array, 'b'
    push array, 'c'
    $P0 = new .Null
    push array, $P0
    push array, 'e'
    $P0 = new .Undef
    push array, $P0
    push array, '7'
    push array, '-8.8'

    .local int flag, index

    ## bounds checking: lower
    index = 0
    bsr EXISTS
    bsr DEFINED

    ## bounds checking: upper
    index = 7
    bsr EXISTS
    bsr DEFINED

    ## bounds checking: negative lower
    index = -1
    bsr EXISTS
    bsr DEFINED

    ## bounds checking: negative upper
    index = -8
    bsr EXISTS
    bsr DEFINED

    ## bounds checking: out-of-bounds
    index = 8
    bsr EXISTS
    bsr DEFINED

    ## bounds checking: negative out-of-bounds
    index = -9
    bsr EXISTS
    bsr DEFINED

    ## null value
    index = 3
    bsr EXISTS
    bsr DEFINED

    ## undefined value
    index = 5
    bsr EXISTS
    bsr DEFINED

    goto END
EXISTS:
    print 'exists_keyed_int '
    print index
    print ': '
    flag = exists array[index]
    print flag
    print "\n"
    ret

DEFINED:
    print 'defined_keyed_int '
    print index
    print ': '
    flag = defined array[index]
    print flag
    print "\n"
    ret

END:
.end
CODE
exists_keyed_int 0: 1
defined_keyed_int 0: 1
exists_keyed_int 7: 1
defined_keyed_int 7: 1
exists_keyed_int -1: 1
defined_keyed_int -1: 1
exists_keyed_int -8: 1
defined_keyed_int -8: 1
exists_keyed_int 8: 0
defined_keyed_int 8: 0
exists_keyed_int -9: 0
defined_keyed_int -9: 0
exists_keyed_int 3: 0
defined_keyed_int 3: 0
exists_keyed_int 5: 1
defined_keyed_int 5: 0
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', '$P1.append()');
.sub test :main
    load_bytecode 'Test/More.pir'

    .local pmc plan
    .local pmc ok
    .local pmc is
    plan = find_global 'Test::More', 'plan'
    ok   = find_global 'Test::More', 'ok'
    is   = find_global 'Test::More', 'is'

    $P1 = new ResizablePMCArray
    push $P1, 'a'
    push $P1, 'b'
    push $P1, 'c'

    $P2 = new FixedPMCArray
    $P2 = 2
    $P0 = new .Null
    $P2[0] = $P0
    $P2[1] = 'e'
    $P0 = new .Undef

    $P3 = new ResizablePMCArray
    push $P3, $P0
    push $P3, '7'
    push $P3, '-8.8'

    $P4 = new ResizablePMCArray

    $P5 = new MultiSub    # extends ResizablePMCArray
    $P99 = new Sub
    push $P5, $P99

    plan( 13 )

    $P4.append( $P4 )
    ok( 1, 'parsing' )

    $I1 = $P4
    is( $I1, 0, 'still size 0' )

    $P10 = $P1
    $I1 = $P10
    $P10.append( $P4 )
    $I2 = $P10
    is( $I1, $I2, 'append empty ResizablePMCArray' )

    $S1 = $P10[2]
    is( $S1, 'c', 'indexing elements' )

    $P10.append( $P2 )
    is( $P10, 5, 'append FixedPMCArray' )

    $S1 = $P10[2]
    is( $S1, 'c', 'indexing elements' )

    $S1 = $P10[4]
    is( $S1, 'e', 'indexing elements' )

    $P3.append( $P10 )
    is( $P3, 8, 'append ResizablePMCArray' )

    $S1 = $P3[2]
    is( $S1, '-8.8', 'indexing elements' )

    $S1 = $P3[4]
    is( $S1, 'b', 'indexing elements' )

    $P3.append( $P5 )
    is( $P3, 9, 'append subclass' )

    $S1 = $P3[2]
    is( $S1, '-8.8', 'indexing elements' )

    $P99 = $P3[8]
    $I99 = isa $P99, 'Sub'
    ok( $I99, 'indexing elements' )
.end
CODE
1..13
ok 1 - parsing
ok 2 - still size 0
ok 3 - append empty ResizablePMCArray
ok 4 - indexing elements
ok 5 - append FixedPMCArray
ok 6 - indexing elements
ok 7 - indexing elements
ok 8 - append ResizablePMCArray
ok 9 - indexing elements
ok 10 - indexing elements
ok 11 - append subclass
ok 12 - indexing elements
ok 13 - indexing elements
OUTPUT


# don't forget to change the number of tests
# vim: expandtab sw=4
