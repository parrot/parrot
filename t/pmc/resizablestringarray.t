#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 28;

=head1 NAME

t/pmc/resizablestringarray.t - ResizableStringArray PMC

=head1 SYNOPSIS

	% prove t/pmc/ResizableStringArray.t

=head1 DESCRIPTION

Tests C<ResizableStringArray> PMC. Checks size, sets various elements, including
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

output_is(<<'CODE', <<'OUTPUT', "Setting array size");
	new P0,.ResizableStringArray

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

output_is(<<'CODE', <<'OUTPUT', "Setting first element");
        new P0, .ResizableStringArray
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
        new P0, .ResizableStringArray
        set P0, 2

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

# TODO: Rewrite these properly when we have exceptions

output_is(<<'CODE', <<'OUTPUT', "Setting out-of-bounds elements");
        new P0, .ResizableStringArray
        set P0, 1

	set P0[1], -7
	print "ok 1\n"

	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "Getting out-of-bounds elements");
        new P0, .ResizableStringArray
        set P0, 1

	set I0, P0[1]
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT


output_is(<<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs");
@{[ $fp_equality_macro ]}
     new P0, .ResizableStringArray
     new P1, .Key

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "bleep"

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

     end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys");
@{[ $fp_equality_macro ]}
     new P0, .ResizableStringArray
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

.sub _main
    .local pmc pmc1
    pmc1 = new ResizableStringArray
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

pir_output_is(<< 'CODE', << 'OUTPUT', "push string");

.sub _main
    .local pmc pmc1
    pmc1 = new ResizableStringArray
    pmc1[2009] = "two zero zero nine"
    push pmc1, "two zero one zero"
    .local int elements
    elements = pmc1
    print elements
    print "\n"
    .local string last
    last = pmc1[2010]
    print last
    print "\n"
    end
.end
CODE
2011
two zero one zero
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "creation");
        new P0, .ResizableStringArray
        set I0, P0
        print "Created ResizableStringArray with "
        print I0
        print " elements to start with.\n"
        end
CODE
Created ResizableStringArray with 0 elements to start with.
OUTPUT


output_is(<<'CODE', <<'OUTPUT', 'basic pop');
     new P0, .ResizableStringArray
     set P0[0], "foo"
     set P0[1], "bar"
     set P0[2], "bax"
     pop S0, P0
     eq S0, "bax", OK1
     print "not "
OK1: print "ok 1\n"

     pop S0, P0
     eq S0, "bar", OK2
     print "not "
OK2: print "ok 2\n"

     pop S0, P0
     eq S0, "foo", OK3
     print "not "
OK3: print "ok 3\n"
     end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'pop many values');
     new P0, .ResizableStringArray
     set I0, 0
L1:  set S0, I0
     set P0[I0], S0
     inc I0
     lt I0, 1000, L1

L2:  dec I0
     set S1, I0
     pop S0, P0
     eq S0, S1, OK
     branch NOT_OK
OK:  gt I0, 0, L2
     print "ok\n"
     end

NOT_OK:
     print S0
     print "\n"
     print S1
     print "\n"
     end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'push/pop');
     new P0, .ResizableStringArray
     push P0, "abcde"
     push P0, "bcdea"
     push P0, "cdeab"
     pop S0, P0
     eq S0, "cdeab", OK1
     print "not "
OK1: print "ok 1\n"
     end
CODE
ok 1
OUTPUT

output_like(<<'CODE', <<'OUTPUT', 'pop from empty array');
     new P0, .ResizableStringArray
     pop S0, P0
     end
CODE
/ResizableStringArray: Can't pop from an empty array!/
OUTPUT
#'

pir_output_is(<< 'CODE', << 'OUTPUT', "push and pop");
.sub test :main
       .local string s, s_elem
       .local pmc pmc_arr
       .local int elements

       s = 'a'
       pmc_arr = new ResizableStringArray

       print_num_elements( pmc_arr )

       push pmc_arr, s
       print s
       print_num_elements( pmc_arr )

       push pmc_arr, 'b'
       print 'b'
       print_num_elements( pmc_arr )

       print_num_elements( pmc_arr )

       s_elem= pop pmc_arr
       print s_elem
       print_num_elements( pmc_arr )

       s_elem= pop pmc_arr
       print s_elem
       print_num_elements( pmc_arr )

    pmc_arr = 63
    push pmc_arr, 'd'
    push pmc_arr, 'e'
    push pmc_arr, 'f'
    push pmc_arr, 'g'
    s_elem = pop pmc_arr
    s_elem = pop pmc_arr
    s_elem = pop pmc_arr
    print s_elem
    print_num_elements(pmc_arr)
.end

.sub print_num_elements
       .param pmc pmc_arr
       .local int elements
       elements= pmc_arr
       print '['
       print elements
       print "]\n"
       .return()
.end

CODE
[0]
a[1]
b[2]
[2]
b[1]
a[0]
e[64]
OUTPUT


pir_output_like(<< 'CODE', << 'OUTPUT', "pop bounds checking");
.sub 'test' :main
       P0 = new .ResizableStringArray
       pop S0, P0
.end
CODE
/ResizableStringArray: Can't pop from an empty array!.*/
OUTPUT
#'


pir_output_is(<< 'CODE', << 'OUTPUT', "unshift and shift");
.sub test :main
       .local string s, s_elem
       .local pmc pmc_arr
       .local int elements

       s= 'a'
       pmc_arr= new ResizableStringArray

       print_num_elements( pmc_arr )

       unshift pmc_arr, s
       print s
       print_num_elements( pmc_arr )

       unshift pmc_arr, 'b'
       print 'b'
       print_num_elements( pmc_arr )

       print_num_elements( pmc_arr )

       s_elem= shift pmc_arr
       print s_elem
       print_num_elements( pmc_arr )

       s_elem= shift pmc_arr
       print s_elem
       print_num_elements( pmc_arr )

    pmc_arr = 62
    unshift pmc_arr, 'c'
    unshift pmc_arr, 'd'
    unshift pmc_arr, 'e'
    unshift pmc_arr, 'f'
    s_elem = shift pmc_arr
    s_elem = shift pmc_arr
    s_elem = shift pmc_arr
    print s_elem
    print_num_elements(pmc_arr)

    # Set same size array is currently
    pmc_arr = 63
    print_num_elements(pmc_arr)
.end

.sub print_num_elements
       .param pmc pmc_arr
       .local int elements
       elements= pmc_arr
       print '['
       print elements
       print "]\n"
       .return()
.end

CODE
[0]
a[1]
b[2]
[2]
b[1]
a[0]
d[63]
[63]
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "shift pmc");
.sub test :main
       .local string s, s_elem
       .local pmc pmc_arr, p_elem
       .local int elements

       pmc_arr= new .ResizableStringArray
	   push pmc_arr, 'a'
	   push pmc_arr, 'b'

       print_num_elements( pmc_arr )

	   p_elem = shift pmc_arr
	   print p_elem
       print_num_elements( pmc_arr )

       p_elem = shift pmc_arr
       print p_elem
       print_num_elements( pmc_arr )

       print_num_elements( pmc_arr )

.end

.sub print_num_elements
       .param pmc pmc_arr
       .local int elements
       elements = pmc_arr
       print '['
       print elements
       print "]\n"
       .return()
.end

CODE
[2]
a[1]
b[0]
[0]
OUTPUT


pir_output_like(<< 'CODE', << 'OUTPUT', "shift bounds checking");
.sub 'test' :main
       P0 = new .ResizableStringArray
       shift S0, P0
.end
CODE
/ResizableStringArray: Can't shift from an empty array!.*/
OUTPUT
#'


output_is(<<'CODE', <<'OUTPUT', "aerobics", todo => 'not yet working');
        new P0, .ResizableStringArray
        set I10, 10000

        set I1, 0
        set I0, 0
buildup:
        ge I0, I10, postBuildUp

        mod I4, I1, 2
        set S4, I4
        push P0, S4
        add I1, 1    # Push P0, mod I1++, 2
        mod I4, I1, 2
        set S4, I4
        push P0, S4
        add I1, 1    # Push P0, mod I1++, 2
        mod I4, I1, 2
        set S4, I4
        push P0, S4
        add I1, 1    # Push P0, mod I1++, 2

        pop S2, P0
        set I2, S2
        mul I3, I0, 3
        add I3, 2
        mod I3, 2
        ne I2, I3, errFirstPop  # fail if pop != mod I0 * 3 + 2, 2

        pop S2, P0
        set I2, S2
        mul I3, I0, 3
        add I3, 1
        mod I3, 2
        ne I2, I3, errSecondPop  # fail if pop != mod I0 * 3 + 1, 2

        set I2, P0
        add I3, I0, 1
        ne I2, I3, errBuildLen   # fail if length != I0 + 1

        add I0, 1
        branch buildup
postBuildUp:

        set I0, 0
checkBuildUpLeft:
        ge I0, I10, postCheckBuildUpLeft
        set S2, P0[I0]
        set I2, S2
        mul I3, I0, 3
        mod I3, 2
        ne I2, I3, errLeftGet
        add I0, 1
        branch checkBuildUpLeft
postCheckBuildUpLeft:

        mul I0, I10, -1
checkBuildUpRight:
        ge I0, 0, postCheckBuildUpRight
        set S2, P0[I0]
        set I2, S2
        add I3, I0, I10
        mul I3, 3
        mod I3, 2
        ne I2, I3, errRightGet
        add I0, 1
        branch checkBuildUpRight
postCheckBuildUpRight:

        set I0, I10
tearDown:
        le I0, 0, postTearDown
        pop S2, P0
        set I2, S2
        sub I3, I0, 1
        mod I3, 2
        ne I2, I3, errTearDown

        sub I0, 1
        branch tearDown
postTearDown:

        print "I need a shower.\n"
        end
errFirstPop:
        print "FAILED: first pop\n"
        bsr info
        end
errSecondPop:
        print "FAILED: second pop\n"
        bsr info
        end
errBuildLen:
        print "FAILED: buildup length\n"
        bsr info
        end
errLeftGet:
        print "FAILED: left get\n"
        bsr info
        end
errRightGet:
        print "FAILED: right get\n"
        bsr info
        end
errTearDown:
        print "FAILED: tear down cap\n"
        bsr info
        end
info:
        print "Found: "
        print I2
        print "\nWanted: "
        print I3
        print "\n"
        ret
CODE
I need a shower.
OUTPUT


my $SPEEDUP = $ENV{RUNNING_MAKE_TEST} ? "gc_debug 0\n" : "";
output_is($SPEEDUP . <<'CODE', <<'OUTPUT', "direct access");
    new P0, .ResizableStringArray
    set S0, ""
    set S1, "abcdefghijklmnopqrst"
    set I10, 100000
    set I0, 0
lp:
    mod I2, I0, 2
    set S30, I2
    set P0[I0], S30
    inc I0
    mod I9, I0, 100
    ne I9, 0, lp1
    # force GC => 142 DOD + 142 collects / 10^5 accesses
    new P1, .PerlArray
    set P1[I0], I0
    concat S0, S1, S1
    set S2, S0
    set S0, S1
    set S2, ""
lp1:
    le I0, I10, lp

    set I0, 0
lp2:
    mod I2, I0, 2
    set S29, P0[I0]
    set I16, S29
    ne I2, I16, err
    inc I0
    le I0, I10, lp2
    print "ok\n"
    end
err:
    print "err: wanted "
    print I0
    print " got "
    print S29
    print "\n"
    end
CODE
ok
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "direct access 2");
    #new P0, .IntList
    new P0, .ResizableStringArray
    set I10, 1100000
    set I0, 1
lp1:
    add I1, I0, 5
    mod I2, I1, 2
    set S2, I2
    set P0[I0], S2
    add I3, I1, I0
    mod I2, I3, 2
    set S2, I2
    push P0, S2
    shl I0, I0, 1
    inc I0
    le I0, I10, lp1

    set I0, 1
lp2:
    add I1, I0, 5
    mod I5, I1, 2
    # check at I0
    set S2, P0[I0]
    set I2, S2
    ne I2, I5, err
    add I4, I0, 1
    # and pushed value at I0+1
    set S4, P0[I4]
    set I4, S4
    add I3, I1, I0
    mod I5, I3, 2
    ne I5, I4, err

    shl I0, I0, 1
    inc I0
    le I0, I10, lp2
    print "ok\n"
    end
err:
    print "not ok "
    print I0
    print " "
    print I1
    print " "
    print I2
    print " "
    print I3
    print " "
    print I4
    print " "
    print I5
    print " "
    print I6
    print " "
    print I7
    print "\n"

    end
CODE
ok
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "sparse access");
    new P0, .ResizableStringArray
       set I10, 110000
       set I0, 1
lp1:
       add I1, I0, 5
    mod I9, I1, 2
       set S9, I9
       set P0[I0], S9
       add I3, I1, I0
    mod I9, I3, 2
       set S9, I9
       push P0, S9
       shl I0, I0, 1
       inc I0
       le I0, I10, lp1

       set I0, 1
lp2:
       add I1, I0, 5
    mod I9, I1, 2
       # check at I0
       set S2, P0[I0]
       set I2, S2
       ne I2, I9, err
       add I4, I0, 1
       # and pushed value at I0+1
       set S4, P0[I4]
       set I4, S4
       add I3, I1, I0
    mod I9, I3, 2
       ne I9, I4, err

       shl I0, I0, 1
       inc I0
       le I0, I10, lp2
       print "ok 1\n"

       # now repeat and fill some holes

       set I0, 777
lp3:
       add I1, I0, 5
    mod I9, I1, 2
       set S9, I9
       set P0[I0], S9
       add I0, I0, 666
       le I0, I10, lp3

       set I0, 777
lp4:
       add I1, I0, 5
    mod I9, I1, 2
       # check at I0
       set S2, P0[I0]
       set I2, S2
       ne I2, I9, err

       add I0, I0, 666
       le I0, I10, lp4
       print "ok 2\n"
       end
err:
       print "not ok "
       print I0
       print " "
       print I1
       print " "
       print I2
       print " "
       print I3
       print " "
       print I4
       print "\n"

       end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "check for zeroedness");
    new P0, .ResizableStringArray
    set I0, 0
lp1:
    set S0, '0'
    push P0, S0
    inc I0
    lt I0, 100, lp1

    set I2, 10000
    #set I0, 100
    set P0, I2
lp2:
    set S1, P0[I0]
    set I1, S1
    ne I1, 0, err
    inc I0
    lt I0, I2, lp2
    print "ok\n"
    end
err:
    print "Found non-zero value "
    print I1
    print " at "
    print I0
    print "\n"
    end
CODE
ok
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "pop into sparse");
    new P0, .ResizableStringArray
       set I10, 100
       set I0, 0
       # push some values at start
lp1:
    mod I5, I0, 2
       set S5, I5
       push P0, S5
       inc I0
       lt I0, I10, lp1

       # create sparse
       set I0, 100000
       set I1, 1000
    mod I5, I1, 2
       #set P0[I0], I1
       set S5, I5
       set P0[I0], S5
       inc I1
lp2:
       # push some values after hole
    mod I5, I1, 2
       set S5, I5
       push P0, S5
       inc I1
       le I1, 1100, lp2
       dec I1

       set I3, P0
lp3:
       set I4, P0
       ne I3, I4, err1
       pop S2, P0
       set I2, S2
       dec I3
    mod I5, I1, 2
       ne I2, I5, err2
       gt I3, I0, cont1
       lt I3, I10, cont1
       set I1, 0

       gt I3, I10, lp3
       set I1, I10

cont1:
       dec I1
       eq I1, 0, ok
       branch lp3
ok:
       print "ok\n"
       end
err1:   set S0, "len"
       branch err
err2:
       set S0, "val"
err:
       print "nok "
       print S0
       print " "
       print I0
       print " "
       print I1
       print " "
       print I2
       print " "
       print I3
       print " "
       print I4
       print " "
       print I5
       end
CODE
ok
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "clone");
     new P0, .ResizableStringArray
     set P0, 1024
     set I0, 0
L1:  set P0[I0], I0
     inc I0
     lt I0, 1024, L1
     clone P1, P0
     set P0, 0
     set S0, P1[0]
     print S0
     print "\n"
     set S0, P1[1023]
     print S0
     print "\n"
     end
CODE
0
1023
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Resizing to negative value");
     new P0, .ResizableStringArray
     set P0, -1
     end
CODE
ResizableStringArray: Can't resize!
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Retrieving from negative index");
     new P0, .ResizableStringArray
     set P0, 100
     set S0, P0[-1]
     end
CODE
ResizableStringArray: index out of bounds!
OUTPUT
