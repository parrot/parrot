#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/dynclass/pyclass.t - Python Class type

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/pyclass.t

=head1 DESCRIPTION

Tests the Python Class PMC.

=cut

use Parrot::Test tests => 6;

pir_output_is(<< 'CODE', << 'OUTPUT', "attribute");

.sub main :main
    loadlib $P0, "python_group"

    getclass $P1, 'PyType'
    subclass $P2, $P1, 'c'

    find_type $I2, "PyInt"
    new $P3, $I2
    $P3 = 1
    setprop $P2, 'a', $P3

    $P4=$P2()

    getattribute $P5, $P4, 'a'
    print $P5
    print "\n"
.end
CODE
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "method");

.sub __main__
    loadlib $P0, "python_group"

    getclass $P1, 'PyType'
    subclass $P2, $P1, 'c'

    find_type $I2, "PyFunc"
    newsub $P3, $I2, _m
    setprop $P2, 'm', $P3

    $P4=$P2()

    $P5=$P4.m()
    print $P5
    print "\n"
    end
.end

.sub _m :anon
    find_type $I0, "PyInt"
    new $P0, $I0
    $P0 = 1
    .return ($P0)
.end
CODE
1
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "classname");

.sub main :main
    loadlib $P0, "python_group"

    getclass $P1, 'PyType'
    subclass $P2, $P1, 'c'

    find_type $I2, "PyString"
    new $P3, $I2
    $P3 = 'c'
    setprop $P2, '__name__', $P3

    $P4=$P2()

    getattribute $P5, $P4, '__class__'
    getattribute $P6, $P5, '__name__'
    print $P6
    print "\n"
.end
CODE
c
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "delprop");

.sub main :main
    loadlib $P0, "python_group"

    getclass $P1, 'PyType'
    subclass $P2, $P1, 'c'
    subclass $P3, $P2, 'd'

    find_type $I2, "PyInt"
    new $P3, $I2
    $P3 = 1
    setprop $P2, 'x', $P3

    getattribute $P4, $P2, 'x'
    print $P4
    print "\n"

    delprop $P2, 'x'

    newsub $P5, .Exception_Handler, _handler
    set_eh $P5

    getattribute $P6, $P2, 'x'
    print $P6
    print "\n"

    clear_eh
_handler:
    set S0, P5["_message"]
    print_item S0
    print_newline
    end

.end
CODE
1
AttributeError: c instance has no attribute 'x'
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "nested subclasses");

.sub main :main
    loadlib $P0, "python_group"

    getclass $P1, 'PyType'
    subclass $P2, $P1, 'c'

    find_type $I2, "PyInt"
    new $P3, $I2
    $P3 = 1
    setprop $P2, 'a', $P3

    find_type $I3, "PyFunc"
    newsub $P4, $I3, _m
    setprop $P2, 'm', $P4

    subclass $P5, $P2, 'd'

    $P6=$P5()

    getattribute $P7, $P6, 'a'
    print $P7
    print "\n"

    $P8=$P6.m()
    print $P8
    print "\n"
    end
.end

.sub _m
    find_type $I0, "PyInt"
    new $P0, $I0
    $P0 = 2
    .return ($P0)
.end
CODE
1
2
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "overriding builtins");

.sub __main__ :main
    new_pad 0
    loadlib P1, 'python_group'
    find_global P0, 'PyBuiltin', '__load__'
    invoke

    find_lex $P1, 'int'
    subclass $P0, $P1, 'TT'

    find_type $I0, 'PyFunc'
    newsub $P2, $I0, ___repr__
    setprop $P0, '__repr__', $P2

    find_type $I1, 'PyInt'
    new $P3, $I1
    $P3 = 5

    $P4=$P0($P3)
    print_item $P4

    get_repr $S1, $P4
    print_item $S1
    print_newline

    .return ()
.end

.sub ___repr__ :anon, method
    find_type $I0, 'PyObject'
    new $P0, $I0
    find_type $I1, 'PyString'
    new $P1, $I1
    $P1 = "T(%d)"
    $P2 = P5
    $P0 = $P1 % $P2
    .return ($P0)
.end
CODE
5 T(5)
OUTPUT
