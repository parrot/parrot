# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's classes.

=head1 CLASSES

If we combine the ideas of namespaces, subroutines, and global variables,
we are well along our way to the concept of a class. Classes are
high-level constructs that keep data and code together into a single
unit.

A class definition in PIR consists of two parts: Creating a new class
PMC object, and creating the methods for that class. The class PMC
can be created with the C<newclass> and C<subclass> opcodes. Data fields,
called "attributes" can be added to the class with the C<addattribute>
opcode. Once a class PMC has been created, objects of that class
can be instantiated like normal with the c<new> opcode.

The functions of a class are called methods, and are created in a
namespace with the same name as the class. In the example below, the
class is called "Foo", and all the methods of that class are located
in C<.namespace ["Foo"]>. Methods also need to have the C<:method>
flag on them, to differentiate them from normal subroutines.

Inside a method, the C<self> keyword acts like an additional parameter
that contains the PMC object of the class that the method was called
on.

This example creates a class "Foo" with two attributes "bar" and "baz".
It also has two setter and two accessor methods, one for each attribute.

=cut

.sub main :main
    .local pmc myclass, myobj

    myclass = newclass 'Foo'
    addattribute myclass, 'bar'
    addattribute myclass, 'baz'

    myobj = new ['Foo']
    myobj.'set_bar'("Hello")
    myobj.'set_baz'(5)

    $S0 = myobj.'get_bar'()
    say $S0

    $I0 = myobj.'get_baz'()
    print $I0
    print "\n"

.end


.namespace ['Foo']

.sub get_bar :method
    $P0 = getattribute self, "bar"
    .return($P0)
.end

.sub set_bar :method
    .param string value

    $P0 = new ['String']
    $P0 = value
    setattribute self, "bar", $P0
.end

.sub get_baz :method
    $P0 = getattribute self, "baz"
    .return($P0)
.end

.sub set_baz :method
    .param int value

    $P0 = new ['Integer']
    $P0 = value
    setattribute self, "baz", $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

