#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 23;

=head1 NAME

t/pmc/resizablebooleanarray.t - testing the ResizableBooleanArray PMC

=head1 SYNOPSIS

    % prove t/pmc/resizablebooleanarray.t

=head1 DESCRIPTION

Tests C<ResizableBooleanArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting array size" );
    new P0, 'ResizableBooleanArray'

    set I0,P0
    eq I0,0,OK_1
    print "not "
OK_1:   print "ok 1\n"

    set P0,1
    set I0,P0
    eq I0,1,OK_2
    print "not "
OK_2:   print "ok 2\n"

    set P0,5
    set I0,P0
    eq I0,5,OK_3
    print "not "
OK_3:   print "ok 3\n"

    set P0,50
    set I0,P0
    eq I0,50,OK_4
    print "not "
OK_4:   print "ok 4\n"

    set P0,7
    set I0,P0
    eq I0,7,OK_5
    print "not "
OK_5:   print "ok 5\n"
        end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting first element" );
        new P0, 'ResizableBooleanArray'
        set P0, 1

    set P0[0],-7
    set I0,P0[0]
    eq I0,1,OK_1
    print "not "
OK_1:   print "ok 1\n"

    set P0[0],3.7
    set N0,P0[0]
    eq N0,1.0,OK_2
    print "not "
OK_2:   print "ok 2\n"

    set P0[0],"17"
    set S0,P0[0]
    eq S0,"1",OK_3
    print "not "
OK_3:   print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting second element" );
        new P0, 'ResizableBooleanArray'
        set P0, 2

    set P0[1], -7
    set I0, P0[1]
    eq I0,1,OK_1
    print "not "
OK_1:   print "ok 1\n"

    set P0[1], 3.7
    set N0, P0[1]
    eq N0,1.0,OK_2
    print "not "
OK_2:   print "ok 2\n"

    set P0[1],"17"
    set S0, P0[1]
    eq S0,"1",OK_3
    print "not "
OK_3:   print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting negatively indexed elements" );
    new P0, 'ResizableBooleanArray'

    push_eh caught
    set P0[-1], 1
    pop_eh
    print "no exception"
    end
caught:
    say "caught an exception"
    end
CODE
caught an exception
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Getting negatively indexed elements" );
    new P0, 'ResizableBooleanArray'
    set P0, 1

    set I0, P0[-1]
    print "got "
    say I0
    end
CODE
got 0
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting out-of-bounds elements" );
    new P0, 'ResizableBooleanArray'

    set P0[1], -7
    set I0, P0[1]
    eq I0,1,OK_1
    print "not "
OK_1:   print "ok 1\n"

    set P0[0], 3.7
    set N0, P0[0]
    eq N0,1.0,OK_2
    print "not "
OK_2:   print "ok 2\n"

    set P0[5],"17"
    set S0, P0[5]
    eq S0,"1",OK_3
    print "not "
OK_3:   print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Getting out-of-bounds elements" );
        new P0, 'ResizableBooleanArray'
        set P0, 1

    set I0, P0[1]
    print "ok 1\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs" );
     .include 'include/fp_equality.pasm'
     new P0, 'ResizableBooleanArray'
     new P1, 'Key'

     set P1, 0
     set P0[P1], 25

     set P1, 1
     set P0[P1], 2.5

     set P1, 2
     set P0[P1], "17"

     set I0, P0[0]
     eq I0, 1, OK1
     print "not "
OK1: print "ok 1\\n"

     set N0, P0[1]
     .fp_eq_pasm(N0, 1.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     set S0, P0[2]
     eq S0, "1", OK3
     print "not "
OK3: print "ok 3\\n"

     end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys" );
     .include 'include/fp_equality.pasm'
     new P0, 'ResizableBooleanArray'
     set P0, 1

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "17"
     new P1, 'Integer'
     set P1, 123456
     set P0[1023], P1

     new P2, 'Key'
     set P2, 25
     set I0, P0[P2]
     eq I0, 1, OK1
     print "not "
OK1: print "ok 1\\n"

     set P2, 128
     set N0, P0[P2]
     .fp_eq_pasm(N0, 1.0, OK2)
     print "not "
OK2: print "ok 2\\n"

     set P2, 513
     set S0, P0[P2]
     eq S0, "1", OK3
     print "not "
OK3: print "ok 3\\n"

     set P2, 1023
     set P3, P0[P2]
     set I1, P3
     eq I1, 1, OK4
     print "not "
OK4: print "ok 4\\n"

     end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );
.sub _main
    .local pmc pmc1
    pmc1 = new 'ResizableBooleanArray'
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

pir_output_is( << 'CODE', << 'OUTPUT', "push integer" );
.sub _main
    .local pmc pmc1
    pmc1 = new 'ResizableBooleanArray'
    pmc1[9999] = 0
    push pmc1, 10001
    .local int elements
    elements = pmc1
    print elements
    print "\n"
    .local string last
    last = pmc1[10000]
    print last
    print "\n"
    end
.end
CODE
10001
1
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "creation" );
        new P0, 'ResizableBooleanArray'
        set I0, P0
        print "Created ResizableBooleanArray with "
        print I0
        print " elements to start with.\n"
        end
CODE
Created ResizableBooleanArray with 0 elements to start with.
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "push and pop" );
.sub test :main
       .local int i, i_elem
       .local pmc pmc_arr
       .local int elements

       i = 1
       pmc_arr = new 'ResizableBooleanArray'

       print_num_elements( pmc_arr )

       push pmc_arr, i
       print i
       print_num_elements( pmc_arr )

       push pmc_arr, 0
       print 0
       print_num_elements( pmc_arr )

       print_num_elements( pmc_arr )

       i_elem= pop pmc_arr
       print i_elem
       print_num_elements( pmc_arr )

       i_elem= pop pmc_arr
       print i_elem
       print_num_elements( pmc_arr )

    pmc_arr = 62
    push pmc_arr, 0
    push pmc_arr, 1
    push pmc_arr, 0
    push pmc_arr, 1
    i_elem = pop pmc_arr
    i_elem = pop pmc_arr
    i_elem = pop pmc_arr
    print i_elem
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
1[1]
0[2]
[2]
0[1]
1[0]
1[63]
OUTPUT

pir_error_output_like( << 'CODE', << 'OUTPUT', "pop bounds checking" );
.sub 'test' :main
       $P0 = new 'ResizableBooleanArray'
       pop $I0, $P0
.end
CODE
/ResizableBooleanArray: Can't pop from an empty array!.*/
OUTPUT

#'

pir_output_is( << 'CODE', << 'OUTPUT', "unshift and shift" );
.sub test :main
       .local int i, i_elem
       .local pmc pmc_arr
       .local int elements

       i= 1
       pmc_arr = new 'ResizableBooleanArray'

       # No elements are set
       print_num_elements( pmc_arr )

       # Set two of the first three elements
       pmc_arr[0] = 1
       pmc_arr[2] = 1
       print_num_elements( pmc_arr )

       # Unshift a "1"  element on
       unshift pmc_arr, i
       print i
       print_num_elements( pmc_arr )

       # Unshift a "0"  element on
       unshift pmc_arr, 0
       print 0
       print_num_elements( pmc_arr )

       # Shift an element off
       i_elem= shift pmc_arr
       print i_elem
       print_num_elements( pmc_arr )

       # Shift an element off
       i_elem= shift pmc_arr
       print i_elem
       print_num_elements( pmc_arr )

       # Resize the array
       pmc_arr = 62
       print_num_elements(pmc_arr)

       # Unshift 4 elements on
       unshift pmc_arr, 1
       unshift pmc_arr, 1
       unshift pmc_arr, 0
       unshift pmc_arr, 1
       print_num_elements(pmc_arr)

       # Shift 3 elements off
       i_elem = shift pmc_arr
       i_elem = shift pmc_arr
       i_elem = shift pmc_arr
       print i_elem
       print_num_elements(pmc_arr)

       # Set same size array is currently
       pmc_arr = 63
       print_num_elements(pmc_arr)

       # Set 101th element
       pmc_arr[100] = 1
       print_num_elements(pmc_arr)

       # Shift off 99 elements
      .local int counter
      counter = 98
shift_loop:
       i_elem = shift pmc_arr
       dec counter
       if counter > 0 goto shift_loop

       print i_elem
       print_num_elements(pmc_arr)
.end

.sub print_num_elements
       .param pmc pmc_arr
       .local int elements
       elements= pmc_arr
       print '['
       print elements
       print "]\n"
       $I0 = pmc_arr[0]
       print $I0
       print ', '
       $I0 = pmc_arr[1]
       print $I0
       print ', '
       $I0 = pmc_arr[2]
       print $I0
       print "\n"
       .return()
.end

CODE
[0]
0, 0, 0
[3]
1, 0, 1
1[4]
1, 1, 0
0[5]
0, 1, 1
0[4]
1, 1, 0
1[3]
1, 0, 1
[62]
1, 0, 1
[66]
1, 0, 1
1[63]
1, 1, 0
[63]
1, 1, 0
[101]
1, 1, 0
0[3]
0, 0, 1
OUTPUT

pir_error_output_like( << 'CODE', << 'OUTPUT', "shift bounds checking" );
.sub 'test' :main
       $P0 = new 'ResizableBooleanArray'
       shift $I0, $P0
.end
CODE
/ResizableBooleanArray: Can't shift from an empty array!.*/
OUTPUT

#'

pasm_output_is( <<'CODE', <<'OUTPUT', "aerobics" );
        new P0, 'ResizableBooleanArray'
        set I10, 10000

        set I1, 0
        set I0, 0
buildup:
        ge I0, I10, postBuildUp

        mod I4, I1, 2
        push P0, I4
        add I1, 1    # Push P0, mod I1++, 2
        mod I4, I1, 2
        push P0, I4
        add I1, 1    # Push P0, mod I1++, 2
        mod I4, I1, 2
        push P0, I4
        add I1, 1    # Push P0, mod I1++, 2

        pop I2, P0
        mul I3, I0, 3
        add I3, 2
        mod I3, 2
        ne I2, I3, errFirstPop  # fail if pop != mod I0 * 3 + 2, 2

        pop I2, P0
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
        set I2, P0[I0]
        mul I3, I0, 3
        mod I3, 2
        ne I2, I3, errLeftGet
        add I0, 1
        branch checkBuildUpLeft
postCheckBuildUpLeft:

        mul I0, I10, -1
checkBuildUpRight:
        ge I0, 0, postCheckBuildUpRight
        set I2, P0[I0]
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
        pop I2, P0
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

pasm_output_is( <<'CODE', <<'OUTPUT', "direct access 2" );
    #new P0, 'IntList'
    new P0, 'ResizableBooleanArray'
    set I10, 550000
    set I0, 1
lp1:
    add I1, I0, 5
    mod I2, I1, 2
    set P0[I0], I2
    add I3, I1, I0
    mod I2, I3, 2
    push P0, I2
    shl I0, I0, 1
    inc I0
    le I0, I10, lp1

    set I0, 1
lp2:
    add I1, I0, 5
    mod I5, I1, 2
    # check at I0
    set I2, P0[I0]
    ne I2, I5, err
    add I4, I0, 1
    # and pushed value at I0+1
    set I4, P0[I4]
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

pasm_output_is( <<'CODE', <<'OUTPUT', "sparse access" );
    new P0, 'ResizableBooleanArray'
       set I10, 110000
       set I0, 1
lp1:
       add I1, I0, 5
    mod I9, I1, 2
       set P0[I0], I9
       add I3, I1, I0
    mod I9, I3, 2
       push P0, I9
       shl I0, I0, 1
       inc I0
       le I0, I10, lp1

       set I0, 1
lp2:
       add I1, I0, 5
    mod I9, I1, 2
       # check at I0
       set I2, P0[I0]
       ne I2, I9, err
       add I4, I0, 1
       # and pushed value at I0+1
       set I4, P0[I4]
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
       set P0[I0], I9
       add I0, I0, 666
       le I0, I10, lp3

       set I0, 777
lp4:
       add I1, I0, 5
    mod I9, I1, 2
       # check at I0
       set I2, P0[I0]
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

pasm_output_is( <<'CODE', <<'OUTPUT', "check for zeroedness" );
    new P0, 'ResizableBooleanArray'
    set I0, 0
lp1:
    push P0, 0
    inc I0
    lt I0, 100, lp1

    set I2, 10000
    #set I0, 100
    set P0, I2
lp2:
    set I1, P0[I0]
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

pasm_output_is( <<'CODE', <<'OUTPUT', "pop into sparse" );
    new P0, 'ResizableBooleanArray'
       set I10, 100
       set I0, 0
       # push some values at start
loop1:
    mod I5, I0, 2
       push P0, I5
       inc I0
       lt I0, I10, loop1

       # create sparse
       set I0, 100000
       set I1, 1000
    mod I5, I1, 2
       #set P0[I0], I1
       set P0[I0], I5
       inc I1
loop2:
       # push some values after hole
    mod I5, I1, 2
       push P0, I5
       inc I1
       le I1, 1100, loop2
       dec I1

       set I3, P0
lp3:
       set I4, P0
       ne I3, I4, err1
       pop I2, P0
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

pir_output_is( <<'CODE', <<'OUTPUT', "clone" );
.sub _main
    .local pmc rba1, rba2
    .local int i
    rba1 = new 'ResizableBooleanArray'

    rba1[0]    = 1
    rba1[5000] = 1

    rba2 = clone rba1

    i = rba1[5000]
    if i == 1 goto ok_0
    print "nok 0 "

ok_0:
    i = pop rba1
    if i == 1 goto ok_1
    print "nok 1 "

ok_1:
    i = rba1
    if i == 5000 goto ok_2
    print "nok 2 "
    print i

ok_2:
    i = pop rba2
    if i == 1 goto ok_3
    print "nok 3 "

ok_3:
    i = rba2
    if i == 5000 goto ok_4
    print "nok 4 "

ok_4:
    i = rba2[5000] #should be undefined, i.e. 0
    if i == 0 goto ok_5
    print "nok 5 "

ok_5:
    i = pop rba2 #same as previous
    if i == 0 goto ok_6
    print "nok 6 "
    $S0 = rba2
    say $S0
    end

ok_6:
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "clone (alternate)" );
.sub _main
    .local pmc rba1, rba2
    .local int i
    rba1 = new 'ResizableBooleanArray'

    rba1[0]    = 1
    rba1[4]    = 1
    rba1[5004] = 1
    i = shift rba1
    i = shift rba1
    i = shift rba1
    i = shift rba1

    rba2 = clone rba1

    i = rba1[5000]
    if i == 1 goto ok_0
    print "nok 0 "

ok_0:
    i = pop rba1
    if i == 1 goto ok_1
    print "nok 1 "

ok_1:
    i = rba1
    if i == 5000 goto ok_2
    print "nok 2 "
    print i

ok_2:
    i = pop rba2
    if i == 1 goto ok_3
    print "nok 3 "

ok_3:
    i = rba2
    if i == 5000 goto ok_4
    print "nok 4 "

ok_4:
    i = rba2[5000] #should be undefined, i.e. 0
    if i == 0 goto ok_5
    print "nok 5 "

ok_5:
    i = pop rba2 #same as previous
    if i == 0 goto ok_6
    print "nok 6 "
    end

ok_6:
    print "ok\n"
.end
CODE
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
