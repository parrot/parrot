#! perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(lib . ../lib ../../lib);
use Parrot::Test tests => 21;
use Test::More;

=head1 NAME

t/pmc/fixedpmcarray.t - FixedPMCArray PMC

=head1 SYNOPSIS

    % prove t/pmc/fixedpmcarray.t

=head1 DESCRIPTION

Tests C<FixedPMCArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting array size" );
    new P0,'FixedPMCArray'

    set I0,P0
    eq I0,0,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0,1
    set I0,P0
    eq I0,1,OK_2
    print "not "
OK_2:    print "ok 2\n"

        end
CODE
ok 1
ok 2
OUTPUT

pasm_error_output_like( <<'CODE', <<'OUTPUT', "Resetting array size (and getting an exception)" );
    new P0, 'FixedPMCArray'

    set I0,P0
    set P0,1
    set P0,2
    print "Should have gotten an exception\n "


        end
CODE
/FixedPMCArray: Can't resize!
current instr\.:/
OUTPUT

#VIM's syntax highlighter needs this line

pasm_output_is( <<'CODE', <<'OUTPUT', "Truth and falsehood" );
        new P0, 'FixedPMCArray'

        set P0, 0
        if P0, NOK_1
        branch OK_1
NOK_1:  print "not "
OK_1:   print "ok 1\n"
        unless P0, OK_2
        print "not "
OK_2:   print "ok 2\n"

        set P0, 1
        unless P0, NOK_3
        branch OK_3
NOK_3:  print "not "
OK_3:   print "ok 3\n"
        if P0, OK_4
        print "not "
OK_4:   print "ok 4\n"

        end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting first element" );
        new P0, 'FixedPMCArray'
        set P0, 1

    set P0[0],-7
    set I0,P0[0]
    eq I0,-7,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0[0],3.7
    set N0,P0[0]
    eq N0,3.7,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0[0],"muwhahaha"
    set S0,P0[0]
    eq S0,"muwhahaha",OK_3
    print "not "
OK_3:    print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting second element" );
        new P0, 'FixedPMCArray'
        set P0, 2

    set P0[1], -7
    set I0, P0[1]
    eq I0,-7,OK_1
    print "not "
OK_1:    print "ok 1\n"

    set P0[1], 3.7
    set N0, P0[1]
    eq N0,3.7,OK_2
    print "not "
OK_2:    print "ok 2\n"

    set P0[1],"purple"
    set S0, P0[1]
    eq S0,"purple",OK_3
    print "not "
OK_3:    print "ok 3\n"

    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Setting negatively indexed elements" );
    new P0, 'FixedPMCArray'
    set P0, 1

    push_eh caught
    set P0[-1], -7
    pop_eh
    say "no exception"
    end
caught:
    say "caught an exception"
    end
CODE
caught an exception
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Getting negatively indexed elements" );
    new P0, 'FixedPMCArray'
    set P0, 1

    push_eh caught
    set I0, P0[-1]
    pop_eh
    say "no exception"
    end
caught:
    say "caught an exception"
    end
CODE
caught an exception
OUTPUT


pasm_output_is( <<'CODE', <<'OUTPUT', "Setting out-of-bounds elements" );
    new P0, 'FixedPMCArray'
    set P0, 1

    push_eh caught
    set P0[1], -7
    pop_eh
    say "no exception"
    end
caught:
    say "caught an exception"
    end
CODE
caught an exception
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "Getting out-of-bounds elements" );
    new P0, 'FixedPMCArray'
    set P0, 1

    push_eh caught
    set I0, P0[1]
    pop_eh
    say "no exception"
    end
caught:
    say "caught an exception"
    end
CODE
caught an exception
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via PMC keys, access via INTs" );
     .include 'include/fp_equality.pasm'
     new P0, 'FixedPMCArray'
     set P0, 3
     new P1, 'Key'

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
     .fp_eq_pasm(N0, 2.5, OK2)
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

pasm_output_is( <<"CODE", <<'OUTPUT', "Set via INTs, access via PMC Keys" );
     .include 'include/fp_equality.pasm'
     new P0, 'FixedPMCArray'
     set P0, 1024

     set P0[25], 125
     set P0[128], 10.2
     set P0[513], "cow"
     new P1, 'Integer'
     set P1, 123456
     set P0[1023], P1

     new P2, 'Key'
     set P2, 25
     set I0, P0[P2]
     eq I0, 125, OK1
     print "not "
OK1: print "ok 1\\n"

     set P2, 128
     set N0, P0[P2]
     .fp_eq_pasm(N0, 10.2, OK2)
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

pir_output_like(
    <<'CODE',

.sub main :main
     .local pmc compares, cmp_fun
     # RT #46855 doesnt work wit prederef of JIT
     bounds 1
     compares = new 'Integer'
     compares = 0
     set_global "compares", compares
    cmp_fun = get_global "cmp_fun"
     sort_ar()
     sort_ar(cmp_fun)
.end
.sub sort_ar
    .param pmc cmp_fun :optional
    .local pmc compares
    compares = get_global "compares"
    compares = 0
    .local pmc ar
    new ar, 'FixedPMCArray'
    ar = 5
    ar[0] = 10
    ar[1] = 2
    ar[2] = 5
    ar[3] = 9
    ar[4] = 1
    ar."sort"(cmp_fun)
    print "ok 1\n"

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
     print "compares: "
     print compares
     print "\n"
.end

.sub cmp_fun
    .param pmc a
    .param pmc b
    $I0 = cmp a, b
    .local pmc compares
    compares = get_global "compares"
    inc compares
    .begin_return
    .set_return $I0
    .end_return
.end
CODE

    qr/ok 1
1 2 5 9 10 x
compares: 0
ok 1
1 2 5 9 10 x
compares: [1-9]\d*/, "sort"
);

pir_output_is( << 'CODE', << 'OUTPUT', "check whether interface is done" );

.sub _main
    .local pmc pmc1
    pmc1 = new 'FixedPMCArray'
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

pir_error_output_like( <<'CODE', <<'OUTPUT', "Getting unitialized elements" );

.sub main :main
    .local pmc arr1
    arr1 = new 'FixedPMCArray'
    arr1 = 2005
    .local pmc elem_1956
    elem_1956 = arr1[1956]
    .local string type_1956
    type_1956 = typeof elem_1956
    print type_1956
.end
CODE
/Null PMC access in name()/
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "Multi keys" );

.sub test :main
    .local pmc    matrix, row
    .local pmc    elem_in_pmc
    .local pmc    elem_out_pmc
    .local int    elem_out_int
    .local num    elem_out_num
    .local string elem_out_string

    matrix = new 'FixedPMCArray'
    matrix = 1
    row = new 'FixedPMCArray'
    row = 4           # assing with an integer, number, pmc, string
    matrix[0] = row
    matrix[0;0] = 128
    matrix[0;1] = 128.128
    elem_in_pmc = new 'Integer'
    elem_in_pmc = 256
    matrix[0;2] = elem_in_pmc
    matrix[0;3] = "asdf"

    elem_out_int = matrix[0;0]
    print "set_integer_keyed, get_integer_keyed: "
    print elem_out_int
    print "\n"

    print "set_integer_keyed, get_pmc_keyed: "
    elem_out_pmc = matrix[0;0]
    print elem_out_pmc
    print "\n"

    print "set_integer_keyed, get_number_keyed: "
    elem_out_num = matrix[0;0]
    print elem_out_num
    print "\n"

    print "set_integer_keyed, get_string_keyed: "
    elem_out_string = matrix[0;0]
    print elem_out_string
    print "\n"

    print "set_number_keyed, get_pmc_keyed: "
    elem_out_pmc = matrix[0;1]
    print elem_out_pmc
    print "\n"

    print "set_number_keyed, get_number_keyed: "
    elem_out_num = matrix[0;1]
    print elem_out_num
    print "\n"

    print "set_number_keyed, get_string_keyed: "
    elem_out_string = matrix[0;1]
    print elem_out_string
    print "\n"

    elem_out_int = matrix[0;2]
    print "set_pmc_keyed, get_integer_keyed: "
    print elem_out_int
    print "\n"

    print "set_pmc_keyed, get_pmc_keyed: "
    elem_out_pmc = matrix[0;2]
    print elem_out_pmc
    print "\n"

    print "set_pmc_keyed, get_number_keyed: "
    elem_out_num = matrix[0;2]
    print elem_out_num
    print "\n"

    print "set_pmc_keyed, get_string_keyed: "
    elem_out_string = matrix[0;2]
    print elem_out_string
    print "\n"

    elem_out_int = matrix[0;0]
    print "set_integer_keyed, get_integer_keyed: "
    print elem_out_int
    print "\n"

    print "set_integer_keyed, get_pmc_keyed: "
    elem_out_pmc = matrix[0;0]
    print elem_out_pmc
    print "\n"

    print "set_integer_keyed, get_number_keyed: "
    elem_out_num = matrix[0;0]
    print elem_out_num
    print "\n"

    print "set_integer_keyed, get_string_keyed: "
    elem_out_string = matrix[0;0]
    print elem_out_string
    print "\n"

.end
CODE
set_integer_keyed, get_integer_keyed: 128
set_integer_keyed, get_pmc_keyed: 128
set_integer_keyed, get_number_keyed: 128
set_integer_keyed, get_string_keyed: 128
set_number_keyed, get_pmc_keyed: 128.128
set_number_keyed, get_number_keyed: 128.128
set_number_keyed, get_string_keyed: 128.128
set_pmc_keyed, get_integer_keyed: 256
set_pmc_keyed, get_pmc_keyed: 256
set_pmc_keyed, get_number_keyed: 256
set_pmc_keyed, get_string_keyed: 256
set_integer_keyed, get_integer_keyed: 128
set_integer_keyed, get_pmc_keyed: 128
set_integer_keyed, get_number_keyed: 128
set_integer_keyed, get_string_keyed: 128
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "equality" );
.sub main :main
    .local pmc fpa1, fpa2, p1, p2
    .local int i
    fpa1 = new 'FixedPMCArray'
    fpa2 = new 'FixedPMCArray'

    print "1:"
    if fpa1 == fpa2 goto L1
    print "not "
L1: say "equal"

    fpa1 = 3
    print "2:"
    if fpa1 == fpa2 goto L2
    print "not "
L2: say "equal"

    fpa2 = 3

    p1 = new 'String'
    p1 = "foobarx"
    p2 = new 'String'
    p2 = "foobarx"

    fpa1[0] = p1
    fpa2[0] = p2

    print "3:"
    if fpa1 == fpa2 goto L3
    print "not "
L3: say "equal"

    p1 = new 'String'
    p2 = new 'String'
    p1 = ''
    p2 = ''

    fpa1[1] = p1

    print "4:"
    if fpa1 == fpa2 goto L4
    print "not "
L4: say "equal"

    fpa2[1] = p2

    print "5:"
    if fpa1 == fpa2 goto L5
    print "not "
L5: say "equal"

.end
CODE
1:equal
2:not equal
3:equal
4:not equal
5:equal
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "defined" );
.sub main :main
    .local pmc arr1
    arr1 = new 'FixedPMCArray'
    arr1 = 2005
    .local int defined_elem_1956
    defined_elem_1956 = defined arr1[1956]
    print defined_elem_1956
    arr1[1956] = 42
    defined_elem_1956 = defined arr1[1956]
    print defined_elem_1956
    .local pmc val
    null val
    arr1[1956] = val
    defined_elem_1956 = defined arr1[1956]
    print defined_elem_1956
    print "\n"
.end
CODE
010
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "elements, get_integer, get_number" );
.sub 'test' :main
    .local pmc arr1
    .local int elems_i
    .local num elems_f
    arr1 = new 'FixedPMCArray'
    arr1 = 0
    elems_i = elements arr1
    if elems_i == 0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1'

    elems_i = arr1
    if elems_i == 0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2'

    elems_f = arr1
    if elems_f == 0 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3'

    arr1 = new 'FixedPMCArray'
    arr1 = 2048
    elems_i = elements arr1
    if elems_i == 2048 goto ok_4
    print 'not '
  ok_4:
    say 'ok 4'

    elems_i = arr1
    if elems_i == 2048 goto ok_5
    print 'not '
  ok_5:
    say 'ok 5'

    elems_f = arr1
    if elems_f == 2048 goto ok_6
    print 'not '
  ok_6:
    say 'ok 6'
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'basic splice');
.sub 'main'
    .local pmc one
    one = new 'Integer'
    one = 1

    .local pmc fpa
    fpa = new 'FixedPMCArray'
    fpa = 5

    splice fpa, one, 0, 5
    print_array( fpa )

    .local pmc two
    two = new 'Integer'
    two = 2

    splice fpa, two, 1, 3
    print_array( fpa )

    .local pmc three
    three = new 'Integer'
    three = 3

    splice fpa, three, 2, 3
    print_array( fpa )
.end

.sub 'print_array'
    .param pmc fpa

    .local pmc it
    iter it, fpa

    .local pmc elem
  iter_start:
    elem = shift it
    print elem
    if it goto iter_start
  iter_end:
    print "\n"
.end
CODE
11111
12221
12333
OUTPUT

pir_error_output_like(<<'CODE', <<'OUTPUT', 'splice out of bounds, offset 0');
.sub 'main'
    .local pmc fpa
    fpa = new 'FixedPMCArray'
    fpa = 5

    .local pmc nil
    nil = new 'Undef'

    splice fpa, nil, 0, 6
.end
CODE
/FixedPMCArray: index out of bounds!/
OUTPUT

pir_error_output_like(<<'CODE', <<'OUTPUT', 'splice out of bounds, big offset');
.sub 'main'
    .local pmc fpa
    fpa = new 'FixedPMCArray'
    fpa = 5

    .local pmc nil
    nil = new 'Undef'

    splice fpa, nil, 6, 0
.end
CODE
/FixedPMCArray: index out of bounds!/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
