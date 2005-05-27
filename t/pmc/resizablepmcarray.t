#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/resizablepmcarray.t - testing the ResizablePMCArray PMC

=head1 SYNOPSIS

	% perl -Ilib t/pmc/resizablepmcarray.t

=head1 DESCRIPTION

Tests C<ResizablePMCArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

use Parrot::Test tests => 23;

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

output_is(<<'CODE', <<'OUTPUT', "Setting array size");
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

output_like(<<'CODE', <<'OUTPUT', "Setting negative array size");
	new P0, .ResizablePMCArray
        set P0, -1
        end
CODE
/ResizablePMCArray: Can't resize!/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
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

output_is(<<'CODE', <<'OUTPUT', "Setting second element");
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

output_is(<<'CODE', <<'OUTPUT', "Setting last element");
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

output_is(<<'CODE', <<'OUTPUT', "Getting last element");
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

output_is(<<'CODE', <<'OUTPUT', "Setting out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1

	set P0[1], -7
	print "ok 1\n"

	end
CODE
ok 1
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Setting -ve out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1
        new P1, .Integer
        set P1, 12345

	set P0[-10], P1
	end
CODE
/ResizablePMCArray: index out of bounds!/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1

	set I0, P0[1]
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "Getting -ve out-of-bounds elements");
        new P0, .ResizablePMCArray
        set P0, 1
        new P1, .Integer
	set P1, P0[-10]
	end
CODE
/ResizablePMCArray: index out of bounds!/
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
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

output_is(<<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys");
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

.sub test @MAIN
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

.sub test @MAIN
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

.sub test @MAIN
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

.sub test @MAIN
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

.sub test @MAIN
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

.sub test @MAIN
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

output_is(<< 'CODE', << 'OUTPUT', "unshift pmc");
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

output_is(<<'CODE', <<'OUT', "get_mro");
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

.sub test @MAIN
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

.sub test @MAIN
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

.sub test @MAIN
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
.end
CODE
int in ResizableIntegerArray: 42
OUTPUT

# don't forget to change the number of tests
