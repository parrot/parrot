# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's basic PMC types.

=head1 BASIC PMC TYPES

PMCs are objects, so to use a PMC, you first have to
instantiate an object for the PMC using the 'new' opcode and
the name of a class.

The simple data types have a corresponding PMC type. The
Integer type is like $I0, the Float type is like $N0, and
the String type is like $S0.

Any data type more complex than a simple integer, float, or
string (such as an array or hash) is also a PMC. Some PMC
types are built into Parrot directly.  Some can be loaded
dynamically. Some types are defined as classes in PIR code.
We'll talk about some of these other types later.

=cut

.sub main :main
    $P0 = new ['Integer']
    $P0 = 42
    say $P0

    $P1 = new ['Float']
    $P1 = 6.35
    say $P1

    $P2 = new ['ResizableStringArray']
    $P2[0] = "Foo"
    $P2[1] = "Bar"
    $P2[2] = "Baz"

    $S1 = join " ", $P2
    say $S1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

