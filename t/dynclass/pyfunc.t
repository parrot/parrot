#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/dynclass/pyfunc.t - Python Functions

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/pyfunc.t

=head1 DESCRIPTION

Tests Python Functions.

=cut

use Parrot::Test tests => 4;

my $base = << 'CODE';
##PIR##
.sub __main__ @MAIN
    new_pad 0
    loadlib P1, "python_group"

    find_type $I0, "PyFunc"       
    newsub $P0, $I0, _f0          

    $P0[0] = 'x'
    $P0[1] = 'y'
    $P0[2] = 'z'

    find_type $I1, "PyList"        
    new $P1, $I1                  
    $P1[0] = "uno"
    $P1[1] = "dos"
    $P1[2] = "tres"
    setprop $P0, 'func_defaults', $P1

    store_lex -1, 'f', $P0

    testcase()
.end

.sub _f0 @ANON
    .param object x   
    .param object y   
    .param object z   

    print_item x
    print_item y
    print_item z
    print_newline                 

    .return ()
.end

CODE

output_is($base . << 'CODE', << 'OUTPUT', "full");
.sub testcase
    find_lex $P0, "f"

    find_type $I2, "PyString"        
    new $P1, $I2                  
    new $P2, $I2                  
    new $P3, $I2                  
    $P1 = "one"
    $P2 = "two"
    $P3 = "three"

    $P0($P1,$P2,$P3)
.end
CODE
one two three
OUTPUT

output_is($base . << 'CODE', << 'OUTPUT', "defaults");
.sub testcase
    find_lex $P0, "f"

    find_type $I2, "PyString"        
    new $P1, $I2                  
    new $P2, $I2                  
    $P1 = "one"
    $P2 = "two"

    $P0($P1,$P2)
    $P0($P1)
    $P0()
.end
CODE
one two tres
one dos tres
uno dos tres
OUTPUT

output_is($base . << 'CODE', << 'OUTPUT', "positional expression");
.sub testcase
    find_lex $P0, "f"

    find_type $I1, "PyList"
    new $P1, $I1

    find_type $I2, "PyDict"
    new $P2, $I2

    $P0.__call__($P1, $P2)

    push $P1, "one"

    $P0.__call__($P1, $P2)

    push $P1, "two"

    $P0.__call__($P1, $P2)
.end
CODE
uno dos tres
one dos tres
one two tres
OUTPUT

output_is($base . << 'CODE', << 'OUTPUT', "keyword expression");
.sub testcase
    find_lex $P0, "f"

    find_type $I1, "PyList"
    new $P1, $I1

    find_type $I2, "PyDict"
    new $P2, $I2

    $P2['y'] = "two"

    $P0.__call__($P1, $P2)

    $P2['z'] = "three"

    $P0.__call__($P1, $P2)

    $P2['x'] = "one"

    $P0.__call__($P1, $P2)
.end
CODE
uno two tres
uno two three
one two three
OUTPUT
