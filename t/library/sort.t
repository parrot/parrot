#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/sort.t - Sorting

=head1 SYNOPSIS

	% perl -Ilib t/library/sort.t

=head1 DESCRIPTION

Tests sorting.

=cut

use strict;

use Parrot::Test tests => 9;

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

    simple( array )
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
.include "library/Data/Sort.imc"
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

    simple( array )
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
.include "library/Data/Sort.imc"
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

    simple( array )
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
.include "library/Data/Sort.imc"
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

    simple( array )
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
.include "library/Data/Sort.imc"
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

    simple( array )
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
.include "library/Data/Sort.imc"
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

    simple( array )
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
.include "library/Data/Sort.imc"
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

output_is(<<'CODE', <<'OUT', "sorting letters");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    push array, "w"
    push array, "x"
    push array, "h"
    push array, "y"

    simple( array )
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
.include "library/Data/Sort.imc"
CODE
h
w
x
y
OUT

output_is(<<'CODE', <<'OUT', "sorting PerlString letters");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    new tmp, .PerlString
    set tmp, "w"
    push array, tmp

    new tmp, .PerlString
    set tmp, "x"
    push array, tmp

    new tmp, .PerlString
    set tmp, "h"
    push array, tmp

    new tmp, .PerlString
    set tmp, "y"
    push array, tmp

    simple( array )
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
.include "library/Data/Sort.imc"
CODE
h
w
x
y
OUT

output_is(<<'CODE', <<'OUT', "sorting strings");
##PIR##
.sub _main
    .local pmc array
    .local int i
    .local int j
    .local pmc tmp
    
    new array, .PerlArray
    new tmp, .PerlString
    push array, "hello"
    push array, "hash2"
    push array, "hello2"
    push array, "aaaa2"
    push array, "bbb"
    push array, "bbbbbb"
    push array, "aaaa1"

    simple( array )
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
.include "library/Data/Sort.imc"
CODE
aaaa1
aaaa2
bbb
bbbbbb
hash2
hello
hello2
OUT
