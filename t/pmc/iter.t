#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/iter.t - Iteration

=head1 SYNOPSIS

	% perl -I lib t/pmc/iter.t

=head1 DESCRIPTION

Tests the C<Iterator> PMC.

=cut

use Parrot::Test tests => 37;
use Test::More qw(skip);

output_is(<<'CODE', <<'OUTPUT', "new iter");
	new P2, .PerlArray
	new P1, .Iterator, P2
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "int test");
    .include "iterator.pasm"
	new P0, .PerlArray	# empty array
	new P2, .PerlArray	# array with 2 elements
	push P2, 10
	push P2, 20
	set I0, P2
	new P1, .Iterator, P2
	print "ok 1\n"
	set I1, P1
	eq I0, I1, ok2		# iter.length() == array.length()
	print "not "
ok2:	print "ok 2\n"
	new P1, .Iterator, P0
	set P1, .ITERATE_FROM_START
	print "ok 3\n"
	unless P1, ok4		# if(iter) == false on empty
	print "not "
ok4:	print "ok 4\n"
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_START
	if P1, ok5		# if(iter) == true on non empty
	print "not "
ok5:	print "ok 5\n"
	# now iterate over P2
	# while (P1) { element = shift(P1) }
	unless P1, nok6
        shift I3, P1
	eq I3, 10, ok6
nok6:	print "not "
ok6:	print "ok 6\n"
	unless P1, nok7
        shift I3, P1
	eq I3, 20, ok7
nok7:	print "not "
ok7:	print "ok 7\n"
	unless P1, ok8		# if(iter) == false after last
	print "not "
ok8:	print "ok 8\n"

	# now iterate from end
	set P1, .ITERATE_FROM_END
	if P1, ok9		# if(iter) == true on non empty
	print "not "
ok9:	print "ok 9\n"
	# while (P1) { element = pop(P1) }
	unless P1, nok10
        pop I3, P1
	eq I3, 20, ok10
nok10:	print "not "
ok10:	print "ok 10\n"
	unless P1, nok11
        pop I3, P1
	eq I3, 10, ok11
nok11:	print "not "
ok11:	print "ok 11\n"
	unless P1, ok12		# if(iter) == false after last
	print "not "
ok12:	print "ok 12\n"
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

output_is(<<'CODE', <<'OUTPUT', "hash iter 1");
    .include "iterator.pasm"
	new P0, .PerlHash	# empty Hash
	new P2, .PerlHash	# Hash with 2 elements
	set P2["ab"], 100
	set P2["xy"], "value"
	set I0, P2
	new P1, .Iterator, P2
	print "ok 1\n"
	set I1, P1
	eq I0, I1, ok2		# iter.length() == hash.length()
	print "not "
ok2:	print "ok 2\n"
	new P1, .Iterator, P0
	set P1, .ITERATE_FROM_START
	print "ok 3\n"
	unless P1, ok4		# if(iter) == false on empty
	print "not "
ok4:	print "ok 4\n"
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_START
	if P1, ok5		# if(iter) == true on non empty
	print "not "
ok5:	print "ok 5\n"
	# now iterate over P2
	# while (P1) { key = shift(P1) }
	unless P1, nok6
        shift S3, P1		# get hash.key
	eq S3, "ab", ok6
	eq S3, "xy", ok6
nok6:	print " not "
ok6:	print "ok 6\n"
	unless P1, nok7
        shift S3, P1
	eq S3, "ab", ok7
	eq S3, "xy", ok7
nok7:	print "not "
ok7:	print "ok 7\n"
	unless P1, ok8		# if(iter) == false after last
	print "not "
ok8:	print "ok 8\n"
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

output_is(<<'CODE', <<'OUTPUT', "hash iter 2");
    .include "iterator.pasm"
	new P0, .PerlHash	# Hash for iteration
	new P2, .PerlHash	# for test

	set I0, 65
	set I1, 35
	set I10, I1
fill:
	chr S0, I0
	set P0[S0], I0
	# XXX
	# swapping the next two lines breaks JIT/i386
	# the reason is the if/unless optimization: When the
	# previous opcode sets flags, these are used - but
	# there is no check, that the same register is used in the "if".
	inc I0
	dec I1
	if I1, fill

	new P1, .Iterator, P0
	set I0, P1
	eq I0, I10, ok1
	print "not "
ok1:
	print "ok 1\n"
	set P1, .ITERATE_FROM_START
get:
	unless P1, done
        shift S3, P1		# get hash.key
	set I0, P0[S3]		# and value
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

output_is(<<'CODE', <<OUTPUT, "string iteration forward");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "parrot"
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end		# while (entries) ...
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

output_is(<<'CODE', <<OUTPUT, "string iteration backward");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "parrot"
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_END
iter_loop:
        unless P1, iter_end		# while (entries) ...
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

output_is(<<'CODE', <<OUTPUT, "string iteration forward get ord");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "ABC"
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end		# while (entries) ...
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

output_is(<<'CODE', <<OUTPUT, "string iteration backward get ord");
.include "iterator.pasm"
	new P2, .PerlString
	set P2, "ABC"
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_END
iter_loop:
        unless P1, iter_end		# while (entries) ...
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


output_is(<< 'CODE', << 'OUTPUT', "PerlString iterator in PIR");
##PIR##
.include "iterator.pasm"
.sub _main
    .local pmc string_1
    string_1 = new PerlString
    string_1 = "abcd\x65\x66\x67"
    print string_1
    print "\n"

    .local pmc iter_1
    iter_1 = new Iterator, string_1
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

output_is(<<'CODE', <<'OUTPUT', "Index access for Iterator on PerlString");
##PIR##
.include "iterator.pasm"
.sub _main
    .local pmc string_1
    string_1 = new PerlString
    string_1 = "abcd\x65\x66\x67"
    print 'PerlString new: '
    print string_1
    print "\n"

    .local pmc iter_1
    iter_1 = new Iterator, string_1
    iter_1 = .ITERATE_FROM_START

    .local int    code_point_1
    .local float  code_point_2
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
PerlString new: abcdefg
Iterator shift_integer: 97
Iterator get_integer_keyed_int 2: 100
Iterator get_integer_keyed_int 0: 98
Iterator get_integer_keyed_int -1: 97
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "Index access for Iterator on PerlArray");
##PIR##
.include "iterator.pasm"
.sub _main
    .local pmc array_1
    array_1 = new PerlArray
    push array_1, 'a'
    push array_1, 'b'
    push array_1, 'c'
    push array_1, 'd'
    push array_1, 'e'
    push array_1, 'f'
    push array_1, '7'
    push array_1, '-8.8'

    print 'PerlArray get_string: '
    print array_1
    print "\n"

    .local pmc iter_1
    iter_1 = new Iterator, array_1
    iter_1 = .ITERATE_FROM_START

    print 'Iterator get_string: '
    print iter_1
    print "\n"

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
    iter_2 = new Iterator, array_1
    iter_2 = .ITERATE_FROM_END

    print 'Iterator get_string: '
    print iter_1
    print "\n"

    print 'Iterator shift_float: '
    .local float elem_2
    shift elem_2, iter_2
    print elem_2
    print "\n"

    print 'Iterator get_integer: '
    .local int elem_3
    elem_3 = iter_2[-1]
    print elem_3
    print "\n"

    end
.end
CODE
PerlArray get_string: 8
Iterator get_string: 8
Iterator shift_string: a
Iterator get_string_keyed_int 2: d
Iterator get_string_keyed_int -1: a
Iterator get_string_keyed_int 0: b
Iterator get_pmc_keyed_int 3: e
Iterator exists_keyed_int 3: 1
Iterator exists_keyed_int 28: 0
Iterator defined_keyed_int 3: 1
Iterator defined_keyed_int -1278: 0
Iterator get_string: 8
Iterator shift_float: -8.800000
Iterator get_integer: 7
OUTPUT


SKIP: {
skip("N/Y: length of rest of array ", 1);
output_is(<<'CODE', <<'OUTPUT', "shift + index access");
    .include "iterator.pasm"

	new P2, .PerlArray	# array with 4 elements
	push P2, 10
	push P2, 20
	push P2, 30
	push P2, 40
	new P1, .Iterator, P2
	set P1, .ITERATE_FROM_START

	set I0, P1		# arr.length
	eq I0, 4, ok1
	print I0
	print " not "
ok1:	print "ok 1\n"

	shift I0, P1		# get one
	eq I0, 10, ok2
	print "not "
ok2:	print "ok 2\n"

	shift I0, P1		# get one
	eq I0, 20, ok3
	print "not "
ok3:	print "ok 3\n"

	set I0, P1		# arr.length of rest
	eq I0, 2, ok6
	print I0
	print " not "
ok6:	print "ok 6\n"

        print P1
	end
CODE
ok 1
ok 2
ok 3
ok 6
2
OUTPUT
}

output_is(<<'CODE', <<'OUTPUT', "slice syntax");
   new P0, .PerlArray
   slice P2, P0[2 .. 3, 4, 5 ..6]
   slice P2, P0[10 ..]
   slice P2, P0[.. 11]
   slice P2, P0[I1..3]
   new P1, .PerlHash
   slice P2, P1["0","a".."b","c"]
   print "ok\n"
   end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice creates an iterator");
   new P0, .PerlArray
   slice P2, P0[2 .. 3, 4, 5 ..6]
   typeof S0, P2
   print S0
   print "\n"
   end
CODE
Iterator
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter simple array elements");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   push P0, 600
   slice P2, P0[0, 1, 4]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok\n"
   end
CODE
100
200
500
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter simple array elements - repeat");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   slice P2, P0[2, 4]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:

   slice P2, P0[2, 4]		# this is the same PF constant
   set P2, .ITERATE_FROM_START
lp2:
   unless P2, ex2
   shift I0, P2
   print I0
   print "\n"
   branch lp2
ex2:
   print "ok\n"
   end
CODE
300
500
300
500
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter string");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "parrot"
	slice P1, P2[0,1,4,5]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end		# while (entries) ...
	shift S1, P1
	print S1
	branch iter_loop
iter_end:
	print "\n"
	print P2
	print "\n"
	end
CODE
paot
parrot
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter start range");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   slice P2, P0[..2]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok\n"
   end
CODE
100
200
300
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter end range");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   slice P2, P0[2 ..]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok\n"
   end
CODE
300
400
500
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter start range, value");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   push P0, 600
   slice P2, P0[..2, 4]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok\n"
   end
CODE
100
200
300
500
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter range, value");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   push P0, 600
   push P0, 700
   slice P2, P0[1 ..3,6]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok\n"
   end
CODE
200
300
400
700
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "slice iter range, range");
   .include "iterator.pasm"
   new P0, .PerlArray
   push P0, 100
   push P0, 200
   push P0, 300
   push P0, 400
   push P0, 500
   push P0, 600
   push P0, 700
   push P0, 800
   slice P2, P0[1 ..3, 5 ..]
   set P2, .ITERATE_FROM_START
lp:
   unless P2, ex
   shift I0, P2
   print I0
   print "\n"
   branch lp
ex:
   print "ok\n"
   end
CODE
200
300
400
600
700
800
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter string range");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "parrot rocks"
	slice P1, P2[1 ..3 ,5, 8 ..9]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	branch iter_loop
iter_end:
	print "\n"
	print P2
	print "\n"
	end
CODE
arrtoc
parrot rocks
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter string range 2");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "parrot rocks"
	slice P1, P2[ ..3 ,5, 8 ..]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	branch iter_loop
iter_end:
	print "\n"
	print P2
	print "\n"
	end
CODE
parrtocks
parrot rocks
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter string variable range");
    .include "iterator.pasm"
	new P2, .PerlString
	set P2, "parrot rocks"
	set I0, 1
	set I1, 3
	set I2, 8
	set I3, 9
	slice P1, P2[I0 ..I1 ,5, I2 ..I3]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	branch iter_loop
iter_end:
	print "\n"
	print P2
	print "\n"
	end
CODE
arrtoc
parrot rocks
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter hash values");
    .include "iterator.pasm"
	new P2, .PerlHash
	set P2["a"], 100
	set P2["b"], 200
	set P2["c"], 300
	set P2["d"], 400
	slice P1, P2["b", "c"]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
CODE
200
300
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter hash values 2");
    .include "iterator.pasm"
	new P2, .PerlHash
	set P2["a"], 100
	set P2["b"], 200
	set P2["c"], 300
	set P2["d"], 400
	set P2["e"], 500
	slice P1, P2["b", "c", "a", "a", "e"]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
CODE
200
300
100
100
500
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter range");
    .include "iterator.pasm"
	new P2, .PerlHash
	set P2["a"], 10
	set P2["b"], 20
	set P2["c"], 30
	set P2["d"], 40
	set P2["e"], 50
	slice P1, P2["a".. "c"]
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
CODE
10
20
30
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter range 2");
    .include "iterator.pasm"
	new P2, .PerlHash
	set P2["a"], 10
	set P2["b"], 20
	set P2["c"], 30
	set P2["d"], 40
	set P2["e"], 50
	set P2["A"], 11
	set P2["B"], 21
	set P2["C"], 31
	set P2["D"], 41
	set P2["E"], 51
	slice P1, P2["a".. "c", 'C' .. 'E']
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S1, P1
	print S1
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
CODE
10
20
30
31
41
51
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "slice iter range - vars");
    .include "iterator.pasm"
	new P2, .PerlHash
	set P2["a"], 10
	set P2["b"], 20
	set P2["c"], 30
	set P2["d"], 40
	set P2["e"], 50
	set P2["A"], 11
	set P2["B"], 21
	set P2["C"], 31
	set P2["D"], 41
	set P2["E"], 51
	set S0, 'a'
	set S1, 'c'
	set S2, 'C'
	set S3, 'E'
	slice P1, P2[S0 .. S1, S2 .. S3, 'A']
	set P1, .ITERATE_FROM_START
iter_loop:
        unless P1, iter_end
	shift S10, P1
	print S10
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
CODE
10
20
30
31
41
51
11
ok
OUTPUT
output_is(<<'CODE', <<'OUTPUT', "xrange iterator");
##PIR##
.sub main
    .include "iterator.pasm"
        # xrange(10, 14)
	new P2, .Slice
	slice P1, P2[10 .. 14]

	set P1, .ITERATE_FROM_START
#	I0 = P1."len"()
iter_loop:
        unless P1, iter_end
	shift I1, P1
	print I1
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
.end
CODE
10
11
12
13
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "xrange iterator ..n");
##PIR##
.sub main
    .include "iterator.pasm"
        # xrange(4)
	new P2, .Slice
	slice P1, P2[ .. 4]

	set P1, .ITERATE_FROM_START
#	I0 = P1."len"()
iter_loop:
        unless P1, iter_end
	shift I1, P1
	print I1
	print "\n"
	branch iter_loop
iter_end:
	print "ok\n"
	end
.end
CODE
0
1
2
3
ok
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "hash fromkeys - string");
##PIR##
.sub main @MAIN
    .include "iterator.pasm"
    .local pmc hash
    .local pmc value
    .local pmc str
    str = new PerlString
    str = "abcdef"
    hash = new PerlHash
    null value
    hash."fromkeys"(str, value)
    $I0 = hash
    print $I0
    print " "
    .local pmc iter
    iter = new .Iterator, hash
    iter = .ITERATE_FROM_START
iter_loop:
    unless iter, iter_end		# while (entries) ...
    $S0 = shift iter
    print $S0
    print ""
    goto iter_loop
iter_end:
    print "ok\n"
.end
CODE
/6 [abcdef]{6}ok/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "hash fromkeys - array");
##PIR##
.sub main @MAIN
    .include "iterator.pasm"
    .local pmc hash
    .local pmc value
    .local pmc ar
    ar = new PerlArray
    push ar, "a"
    push ar, "b"
    push ar, "c"
    push ar, "d"
    push ar, "e"
    hash = new PerlHash
    null value
    hash."fromkeys"(ar, value)
    $I0 = hash
    print $I0
    print " "
    .local pmc iter
    iter = new .Iterator, hash
    iter = .ITERATE_FROM_START
iter_loop:
    unless iter, iter_end		# while (entries) ...
    $S0 = shift iter
    print $S0
    goto iter_loop
iter_end:
    print "ok\n"
.end

CODE
/5 [abcde]{5}ok/
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "slice, get strings from array");
##PIR##
.sub main @MAIN
    .include "iterator.pasm"
    .local pmc ar
    ar = new PerlArray
    push ar, "a"
    push ar, "b"
    push ar, "c"
    push ar, "d"
    push ar, "e"
    .local pmc iter
    iter = slice ar[1 ..]
    iter = .ITERATE_FROM_START
iter_loop:
    unless iter, iter_end		# while (entries) ...
    $S0 = shift iter
    print $S0
    goto iter_loop
iter_end:
    print "ok\n"
.end
CODE
bcdeok
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "hash fromkeys - array slice");
##PIR##
.sub main @MAIN
    .include "iterator.pasm"
    .local pmc hash
    .local pmc value
    .local pmc ar
    ar = new PerlArray
    push ar, "a"
    push ar, "b"
    push ar, "c"
    push ar, "d"
    push ar, "e"
    .local pmc sl
    sl = slice ar[1 ..]
    hash = new PerlHash
    null value
    hash."fromkeys"(sl, value)
    $I0 = hash
    print $I0
    print " "
    .local pmc iter
    iter = new .Iterator, hash
    iter = .ITERATE_FROM_START
iter_loop:
    unless iter, iter_end		# while (entries) ...
    $S0 = shift iter
    print $S0
    goto iter_loop
iter_end:
    print "ok\n"
.end
CODE
/4 [bcde]{4}ok/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "hash fromkeys - xrange");
##PIR##
.sub main @MAIN
    .include "iterator.pasm"
    .local pmc hash
    .local pmc value
    .local pmc xr
    xr = new Slice
    .local pmc sl
    sl = slice xr[0 .. 10]
    hash = new PerlHash
    null value
    hash."fromkeys"(sl, value)
    $I0 = hash
    print $I0
    print " "
    .local pmc iter
    iter = new .Iterator, hash
    iter = .ITERATE_FROM_START
iter_loop:
    unless iter, iter_end		# while (entries) ...
    $S0 = shift iter
    print $S0
    goto iter_loop
iter_end:
    print "ok\n"
.end
CODE
/10 [0123456789]{10}ok/
OUTPUT
