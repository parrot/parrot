#!perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 27;

=head1 NAME

t/pmc/iterator.t - Test the Iterator PMC

=head1 SYNOPSIS

    % prove t/pmc/iterator.t

=head1 DESCRIPTION

Tests the C<Iterator> PMC.

=cut

# TT #1478: Split this test into aggregate specific one.

pasm_output_is( <<'CODE', <<'OUTPUT', "new iter" );
.pcc_sub :main main:
    new P2, ['ResizablePMCArray']
    iter P1, P2
    print "ok 1\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "old-style Iterator now disallowed" );
.pcc_sub :main main:
    push_eh THROWN
    new P0, ['ResizablePMCArray']
    new P1, ['Iterator'], P0
    print "not "
THROWN:
    pop_eh
    print "ok 1\n"
    end
CODE
ok 1
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "keyed access on String and Hash PMCs" );
.pcc_sub :main main:
    new P0, ['String']
    set P0, "I am a very long string."
    new P2, ['Integer']
    set P2, 1
    iter P1, P0
    set I0, P1[P2]
    eq I0, 32, OK1
    print "not "
OK1:print "ok 1\n"

    set P2, 0
    set I0, P1[P2]
    eq I0, 73, OK2
    print "not "
OK2:print "ok 2\n"

    set P2, 5
    set S0, P1[P2]
    eq S0, 'a', OK3
    print "not "
OK3:print "ok 3\n"

    new P0, ['Hash']
    set P0['derp'], 3.257
    set P0['herp'], 2
    iter P1, P0
    set P2, 'herp'
    set N0, P1[P2]
    eq N0, 2, OK4
    print "not "
OK4:print "ok 4\n"

    set P2, 'derp'
    set N0, P1[P2]
    eq N0, 3.257, OK5
    print "not "
OK5:print "ok 5\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "keyed exist and defined on String and Hash PMCs" );
.pcc_sub :main main:
    new P0, ['String']
    set P0, 'somelongstring'
    iter P1, P0

    new P2, ['Integer']
    set P2, 2
    exists I0, P1[P2]
    eq I0, 1, OK1
    print "not "
OK1:print "ok 1\n"

    set P2, 20
    exists I0, P1[P2]
    eq I0, 0, OK2
    print "not "
OK2:print "ok 2\n"

    defined I0, P1
    eq I0, 1, OK3
    print "not "
OK3:print "ok 3\n"


    new P0, ['Hash']
    set P0['something'], 'stringg'
    set P0['nothing'], 'something'
    iter P1, P0
    set P2, 'something'
    defined I0, P1[P2]
    eq I0, 1, OK4
    print "not "
OK4:print "ok 4\n"

    set P2, 'somenothing'
    defined I0, P1[P2]
    eq I0, 0, OK5
    print "not "
OK5:print "ok 5\n"
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "get_iter" );
.pcc_sub :main main:
    new P0, ['ResizableIntegerArray']
    push P0, 20
    iter P1, P0
    iter P2, P1

    issame I0, P1, P2
    eq I0, 1, OK
    print "not "
OK: print "ok\n"
    end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "next()" );
.sub _main :main
    .local pmc str, str2, iterate
    str = new ['String']
    str = '0hey'
    iterate = iter str

    str2 = iterate.'next'()
    eq str2, '0', OK1
    print "not "
OK1:print "ok 1 - next returns first character\n"

    eq str, '0hey', OK2
    print "not "
OK2:print "ok 2 - does not touch input\n"

    str2 = iterate.'next'()
    eq str2, 'h', OK3
    print "not "
OK3:print "ok 3 - next returns second character\n"
.end
CODE
ok 1 - next returns first character
ok 2 - does not touch input
ok 3 - next returns second character
OUTPUT

TODO: {
pir_output_is( <<'CODE', <<'OUTPUT', "custom subclass, set_integer_native", todo => "subclassing init VTABLE method is not properly overridden." );

.sub _main :main
    .local pmc myiter, inst
    myiter = subclass 'Iterator', 'MyIter'
    #myiter = newclass 'MyIter'
    inst = new ['MyIter']

    push_eh THROWN
    inst = 1
    print "not "
THROWN:
    pop_eh
    print "ok\n"
.end

.namespace ["MyIter"]
.sub init :vtable
    print "init\n"
    .return()
.end

CODE
ok
OUTPUT
}

pasm_output_is( <<'CODE', <<'OUTPUT', "int test" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['ResizablePMCArray']    # empty array
    new P2, ['ResizablePMCArray']    # array with 2 elements
    push P2, 10
    push P2, 20
    set I0, P2
    iter P1, P2
    print "ok 1\n"
    set I1, P1
    eq I0, I1, ok2        # iter.length() == array.length()
    print "not "
ok2:    print "ok 2\n"
    iter P1, P0
    set P1, .ITERATE_FROM_START
    print "ok 3\n"
    unless P1, ok4        # if(iter) == false on empty
    print "not "
ok4:    print "ok 4\n"
    iter P1, P2
    set P1, .ITERATE_FROM_START
    if P1, ok5        # if(iter) == true on non empty
    print "not "
ok5:    print "ok 5\n"
    # now iterate over P2
    # while (P1) { element = shift(P1) }
    unless P1, nok6
        shift I3, P1
    eq I3, 10, ok6
nok6:    print "not "
ok6:    print "ok 6\n"
    unless P1, nok7
        shift I3, P1
    eq I3, 20, ok7
nok7:    print "not "
ok7:    print "ok 7\n"
    unless P1, ok8        # if(iter) == false after last
    print "not "
ok8:    print "ok 8\n"

    # now iterate from end
    set P1, .ITERATE_FROM_END
    if P1, ok9        # if(iter) == true on non empty
    print "not "
ok9:    print "ok 9\n"
    # while (P1) { element = pop(P1) }
    unless P1, nok10
        pop I3, P1
    eq I3, 20, ok10
nok10:    print "not "
ok10:    print "ok 10\n"
    unless P1, nok11
        pop I3, P1
    eq I3, 10, ok11
nok11:    print "not "
ok11:    print "ok 11\n"
    unless P1, ok12        # if(iter) == false after last
    print "not "
ok12:    print "ok 12\n"
    end

CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Hash iter 1" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['Hash']    # empty Hash
    new P2, ['Hash']    # Hash with 2 elements
    set P2["ab"], 100
    set P2["xy"], "value"
    set I0, P2
    iter P1, P2
    print "ok 1\n"
    set I1, P1
    eq I0, I1, ok2        # iter.length() == hash.length()
    print "not "
ok2:    print "ok 2\n"
    iter P1, P0
    set P1, .ITERATE_FROM_START
    print "ok 3\n"
    unless P1, ok4        # if(iter) == false on empty
    print "not "
ok4:    print "ok 4\n"
    iter P1, P2
    set P1, .ITERATE_FROM_START
    if P1, ok5        # if(iter) == true on non empty
    print "not "
ok5:    print "ok 5\n"
    # now iterate over P2
    # while (P1) { key = shift(P1) }
    unless P1, nok6
        shift S3, P1        # get hash.key
    eq S3, "ab", ok6
    eq S3, "xy", ok6
nok6:    print " not "
ok6:    print "ok 6\n"
    unless P1, nok7
        shift S3, P1
    eq S3, "ab", ok7
    eq S3, "xy", ok7
nok7:    print "not "
ok7:    print "ok 7\n"
    unless P1, ok8        # if(iter) == false after last
    print "not "
ok8:    print "ok 8\n"
    end

CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Hash iter 1" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['Hash']    # empty Hash
    new P2, ['Hash']    # Hash with 2 elements
    set P2["ab"], 100
    set P2["xy"], "value"
    set I0, P2
    iter P1, P2
    print "ok 1\n"
    set I1, P1
    eq I0, I1, ok2        # iter.length() == hash.length()
    print "not "
ok2:    print "ok 2\n"
    iter P1, P0
    set P1, .ITERATE_FROM_START
    print "ok 3\n"
    unless P1, ok4        # if(iter) == false on empty
    print "not "
ok4:    print "ok 4\n"
    iter P1, P2
    set P1, .ITERATE_FROM_START
    if P1, ok5        # if(iter) == true on non empty
    print "not "
ok5:    print "ok 5\n"
    # now iterate over P2
    # while (P1) { key = shift(P1) }
    unless P1, nok6
        shift S3, P1        # get hash.key
    eq S3, "ab", ok6
    eq S3, "xy", ok6
nok6:    print " not "
ok6:    print "ok 6\n"
    unless P1, nok7
        shift S3, P1
    eq S3, "ab", ok7
    eq S3, "xy", ok7
nok7:    print "not "
ok7:    print "ok 7\n"
    unless P1, ok8        # if(iter) == false after last
    print "not "
ok8:    print "ok 8\n"
    end

CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Hash iter 2" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P0, ['Hash']    # Hash for iteration
    new P2, ['Hash']    # for test

    set I0, 65
    set I1, 35
    set I10, I1
fill:
    chr S0, I0
    set P0[S0], I0
    inc I0
    dec I1
    if I1, fill

    iter P1, P0
    set I0, P1
    eq I0, I10, ok1
    print "not "
ok1:
    print "ok 1\n"
    set P1, .ITERATE_FROM_START
get:
    unless P1, done
        shift S3, P1        # get hash.key
    set I0, P0[S3]        # and value
    set P2[S3], I0
    branch get

done:
    set I0, P2
    eq I0, I10, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT
pasm_output_is( <<'CODE', <<OUTPUT, "string iteration forward" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P2, ['String']
    set P2, "parrot"
    iter P1, P2
    set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end        # while (entries) ...
    shift S1, P1
    print S1
    branch iter_loop
iter_end:
    print "\n"
    print P2
    print "\n"
    end
CODE
parrot
parrot
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "string iteration backward" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P2, ['String']
    set P2, "parrot"
    iter P1, P2
    set P1, .ITERATE_FROM_END
iter_loop:
        unless P1, iter_end        # while (entries) ...
    pop S1, P1
    print S1
    branch iter_loop
iter_end:
    print "\n"
    print P2
    print "\n"
    end
CODE
torrap
parrot
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "string iteration forward get ord" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P2, ['String']
    set P2, "ABC"
    iter P1, P2
    set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end        # while (entries) ...
    shift I1, P1
    print I1
    branch iter_loop
iter_end:
    print "\n"
    print P2
    print "\n"
    end
CODE
656667
ABC
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "string iteration backward get ord" );
.pcc_sub :main main:
.include "iterator.pasm"
    new P2, ['String']
    set P2, "ABC"
    iter P1, P2
    set P1, .ITERATE_FROM_END
iter_loop:
        unless P1, iter_end        # while (entries) ...
    pop I1, P1
    print I1
    branch iter_loop
iter_end:
    print "\n"
    print P2
    print "\n"
    end
CODE
676665
ABC
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "String iterator in PIR" );

.include "iterator.pasm"
.sub _main :main
    .local pmc string_1
    string_1 = new ['String']
    string_1 = "abcd\x65\x66\x67"
    print string_1
    print "\n"

    .local pmc iter_1
    iter_1 = iter string_1
    iter_1 = .ITERATE_FROM_START

    .local int code_point_1
ITER_LOOP:
    unless iter_1 goto ITER_END
    shift code_point_1, iter_1
    print code_point_1
    print "\n"
    branch ITER_LOOP
ITER_END:
    print "reached end\n"
    end
.end
CODE
abcdefg
97
98
99
100
101
102
103
reached end
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Index access for Iterator on String" );

.include "iterator.pasm"
.sub _main :main
    .local pmc string_1
    string_1 = new ['String']
    string_1 = "abcd\x65\x66\x67"
    print 'String new: '
    print string_1
    print "\n"

    .local pmc iter_1
    iter_1 = iter string_1
    iter_1 = .ITERATE_FROM_START

    .local int    code_point_1
    .local num  code_point_2
    .local string code_point_3
    .local pmc    code_point_4

    print 'Iterator shift_integer: '
    shift code_point_1, iter_1
    print code_point_1
    print "\n"

    print 'Iterator get_integer_keyed_int 2: '
    code_point_1 = iter_1[2]
    print code_point_1
    print "\n"

    print 'Iterator get_integer_keyed_int 0: '
    code_point_1 = iter_1[0]
    print code_point_1
    print "\n"

    print 'Iterator get_integer_keyed_int -1: '
    code_point_1 = iter_1[-1]
    print code_point_1
    print "\n"

    end
.end
CODE
String new: abcdefg
Iterator shift_integer: 97
Iterator get_integer_keyed_int 2: 100
Iterator get_integer_keyed_int 0: 98
Iterator get_integer_keyed_int -1: 97
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "Index access for Iterator on ResizablePMCArray" );

.include "iterator.pasm"
.sub _main :main
    .local pmc array_1
    array_1 = new ['ResizablePMCArray']
    push array_1, 'a'
    push array_1, 'b'
    push array_1, 'c'
    push array_1, 'd'
    push array_1, 'e'
    push array_1, 'f'
    push array_1, '7'
    push array_1, '-8.8'

    print 'ResizablePMCArray get_string: '
    print array_1
    print "\n"

    .local pmc iter_1
    iter_1 = iter array_1
    iter_1 = .ITERATE_FROM_START

    .local string elem_1

    print 'Iterator shift_string: '
    shift elem_1, iter_1
    print elem_1
    print "\n"

    print 'Iterator get_string_keyed_int 2: '
    elem_1 = iter_1[2]
    print elem_1
    print "\n"

    print 'Iterator get_string_keyed_int -1: '
    elem_1 = iter_1[-1]
    print elem_1
    print "\n"

    print 'Iterator get_string_keyed_int 0: '
    elem_1 = iter_1[0]
    print elem_1
    print "\n"

    print 'Iterator get_pmc_keyed_int 3: '
    .local pmc elem_2
    elem_2 = iter_1[3]
    print elem_2
    print "\n"

    .local int flag

    print 'Iterator exists_keyed_int 3: '
    flag = exists iter_1[3]
    print flag
    print "\n"

    print 'Iterator exists_keyed_int 28: '
    flag = exists iter_1[28]
    print flag
    print "\n"


    print 'Iterator defined_keyed_int 3: '
    flag = defined iter_1[3]
    print flag
    print "\n"

    print 'Iterator defined_keyed_int -1278: '
    flag = defined iter_1[-1278]
    print flag
    print "\n"

    .local pmc iter_2
    iter_2 = iter array_1
    iter_2 = .ITERATE_FROM_END

    print 'Iterator shift_float: '
    .local num felem_2
    pop felem_2, iter_2
    print felem_2
    print "\n"

    print 'Iterator get_integer: '
    .local int elem_3
    elem_3 = iter_2[-1]
    print elem_3
    print "\n"

    end
.end
CODE
ResizablePMCArray get_string: 8
Iterator shift_string: a
Iterator get_string_keyed_int 2: d
Iterator get_string_keyed_int -1: a
Iterator get_string_keyed_int 0: b
Iterator get_pmc_keyed_int 3: e
Iterator exists_keyed_int 3: 1
Iterator exists_keyed_int 28: 0
Iterator defined_keyed_int 3: 1
Iterator defined_keyed_int -1278: 0
Iterator shift_float: -8.8
Iterator get_integer: 7
OUTPUT

TODO: {
    pasm_output_is( <<'CODE', <<'OUTPUT', "shift + index access" );
    .pcc_sub :main main:
    .include "iterator.pasm"

    new P2, ['ResizablePMCArray']    # array with 4 elements
    push P2, 10
    push P2, 20
    push P2, 30
    push P2, 40
    iter P1, P2
    set P1, .ITERATE_FROM_START

    set I0, P1        # arr.length
    eq I0, 4, ok1
    print I0
    print " not "
ok1:    print "ok 1\n"

    shift I0, P1        # get one
    eq I0, 10, ok2
    print "not "
ok2:    print "ok 2\n"

    shift I0, P1        # get one
    eq I0, 20, ok3
    print "not "
ok3:    print "ok 3\n"

    set I0, P1        # arr.length of rest
    eq I0, 2, ok6
    print I0
    print " not "
ok6:    print "ok 6\n"

    print I0
    print "\n"
    end
CODE
ok 1
ok 2
ok 3
ok 6
2
OUTPUT
}



pasm_output_is( <<'CODE', <<'OUTPUT', "iter vtable" );
.pcc_sub :main main:
   .include "iterator.pasm"
   new P0, ['ResizablePMCArray']
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   push P0, 600
   push P0, 700
   push P0, 800
   iter P2, P0
   print "ok 1\n"
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok 2\n"
   end
CODE
ok 1
100
200
300
400
500
600
700
800
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "string iteration with get_iter" );
.pcc_sub :main main:
    .include "iterator.pasm"
    new P2, ['String']
    set P2, "parrot"
    iter P1, P2
iter_loop:
        unless P1, iter_end        # while (entries) ...
    shift S1, P1
    print S1
    branch iter_loop
iter_end:
    print "\n"
    print P2
    print "\n"
    end
CODE
parrot
parrot
OUTPUT

TODO: {
    local $TODO = "adding keys during iteration";

    pir_output_is( << 'CODE', << 'OUTPUT', "adding keys during iteration" );
.sub main :main
    .local pmc h, it, ar
    .local string k
    .local int i,v

    h = new ['Hash']
    i = 0
lp1:
    $I0 = i + 65
    k = chr $I0
    h[k] = i
    inc i
    if i < 10 goto lp1

    it = iter h
    ar = new ['ResizablePMCArray']
    i = 20
lp2:
    unless it goto ex
    k = shift it
    v = h[k]
    push ar, v
    if i == 29 goto no_add
    $I0 = i + 65
    k = chr $I0
    h[k] = i
    inc i
no_add:
    goto lp2
ex:
    ar."sort"()
    i = elements ar
lp3:
    dec i
    v = ar[i]
    print v
    print "_"
    if i goto lp3
    print "\n"
.end
# or some such output
CODE
29_28_27_26_25_24_23_22_21_20_9_8_7_6_5_4_3_2_1_0_
OUTPUT
}

pir_output_is( << 'CODE', << 'OUTPUT', "by default, iterate from start" );
.sub main :main
    .local pmc ar, it
    ar= new ['ResizablePMCArray']
    push ar, 'pi'
    push ar, 3
    push ar, 6.28

    it = iter ar
lp: unless it, ex
    $P0 = shift it
    print $P0
    print "\n"
    branch lp
ex:
.end
CODE
pi
3
6.28
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "iterator can be cloned" );
.sub main :main
    .local pmc ar, i1, i2
    ar = new ['ResizableIntegerArray']
    push ar, 17
    i1 = iter ar
    clone i2, i1
.end
CODE
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "cloned iterator independent of original" );
.sub main :main
    .local pmc ar, i1, i2
    ar = new ['ResizableIntegerArray']
    push ar, 17
    push ar, 42

    i1 = iter ar
    clone i2, i1

    .local pmc temp

    shift temp, i1
    unless temp == 17 goto fail

    shift temp, i1
    unless temp == 42 goto fail

    shift temp, i2
    unless temp == 17 goto fail

    shift temp, i2
    unless temp == 42 goto fail

    say "ok"
    end
fail:
    say "not ok"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "clone of partly-advanced iterator" );
.sub main :main
    .local pmc ar, i1, i2
    .local pmc temp
    ar = new ['ResizableIntegerArray']
    push ar, 1
    push ar, 2
    i1 = iter ar

    shift temp, i1
    unless temp == 1 goto fail

    clone i2, i1
    shift temp, i1
    unless temp == 2 goto fail

    shift temp, i2
    unless temp == 2 goto fail

    say "ok"
    end
fail:
    say "not ok"
.end
CODE
ok
OUTPUT

TODO: {
    local $TODO = "cloned iterator doesn't copy the array to which it 'points'";
    pir_output_is(
        <<'CODE', <<'OUTPUT', "cloned iterator doesn't copy the array to which it 'points'" );
.sub main :main
    .local pmc ar, i1, i2
    .local pmc temp
    temp = new ['Integer']
    ar   = new ['ResizableIntegerArray']
    push ar, 1
    i1 = iter ar

    # i1 and i2 now "point" to the same element of the same array.
    clone i2, i1

    # Modify the array ...
    temp = 17
    i1   = temp

    # Now read back the modified value ...
    shift temp, i2

    unless temp == 17 goto fail

    say "ok"
    end
fail:
    say "not ok"
.end
CODE
ok
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
