#! perl -w
use strict;

use Parrot::Test tests => 6;

output_is(<<'CODE', <<'OUT', "sorting already sorted numbers");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, 0
    push array, 1
    push array, 2
    push array, 3
    push array, 4
    push array, 5
    push array, 6
    push array, 7
    push array, 8
    push array, 9

    _sort( array )
    i = 0
    j = array
LOOP:
    set tmp, array[i]
    print tmp
    print "\n"
    inc i
    if i < j goto LOOP
    end
.end
.include "library/sort.imc"
CODE
0
1
2
3
4
5
6
7
8
9
OUT

output_is(<<'CODE', <<'OUT', "sorting unsorted numbers");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, 9
    push array, 8
    push array, 7
    push array, 6
    push array, 5
    push array, 4
    push array, 3
    push array, 2
    push array, 1
    push array, 0

    _sort( array )
    i = 0
    j = array
LOOP:
    set tmp, array[i]
    print tmp
    print "\n"
    inc i
    if i < j goto LOOP
    end
.end
.include "library/sort.imc"
CODE
0
1
2
3
4
5
6
7
8
9
OUT

output_is(<<'CODE', <<'OUT', "sorting unsorted numbers (2)");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, 4
    push array, 7
    push array, 8
    push array, 1
    push array, 6
    push array, 5
    push array, 3
    push array, 2
    push array, 9
    push array, 0

    _sort( array )
    i = 0
    j = array
LOOP:
    set tmp, array[i]
    print tmp
    print "\n"
    inc i
    if i < j goto LOOP
    end
.end
.include "library/sort.imc"
CODE
0
1
2
3
4
5
6
7
8
9
OUT

output_is(<<'CODE', <<'OUT', "sorting sorted strings");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, "alpha"
    push array, "bravo"
    push array, "charlie"
    push array, "delta"
    push array, "echo"
    push array, "foxtrot"
    push array, "golf"
    push array, "hotel"

    _sort( array )
    i = 0
    j = array
LOOP:
    set tmp, array[i]
    print tmp
    print "\n"
    inc i
    if i < j goto LOOP
    end
.end
.include "library/sort.imc"
CODE
alpha
bravo
charlie
delta
echo
foxtrot
golf
hotel
OUT

output_is(<<'CODE', <<'OUT', "sorting unsorted strings");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, "charlie"
    push array, "hotel"
    push array, "alpha"
    push array, "delta"
    push array, "foxtrot"
    push array, "golf"
    push array, "bravo"
    push array, "echo"

    _sort( array )
    i = 0
    j = array
LOOP:
    set tmp, array[i]
    print tmp
    print "\n"
    inc i
    if i < j goto LOOP
    end
.end
.include "library/sort.imc"
CODE
alpha
bravo
charlie
delta
echo
foxtrot
golf
hotel
OUT

output_is(<<'CODE', <<'OUT', "sorting different types");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, 0.1
    push array, "charlie"
    push array, 2
    push array, "hotel"
    push array, 5
    push array, "alpha"
    push array, 0.2
    push array, "delta"
    push array, 4
    push array, "foxtrot"
    push array, 0.5
    push array, 0.4
    push array, 1
    push array, "golf"
    push array, 0.3
    push array, 3
    push array, "bravo"
    push array, 0.0
    push array, 0
    push array, "echo"

    _sort( array )
    i = 0
    j = array
LOOP:
    set tmp, array[i]
    print tmp
    print "\n"
    inc i
    if i < j goto LOOP
    end
.end
.include "library/sort.imc"
CODE
0
0
0.100000
0.200000
0.300000
0.400000
0.500000
1
2
3
4
5
alpha
bravo
charlie
delta
echo
foxtrot
golf
hotel
OUT
