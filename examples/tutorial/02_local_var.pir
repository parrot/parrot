# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's named variables.

=head1 NAMED VARIABLES

The other kind of variables in PIR are named variables.
You declare these with the .local directive, with the type
of the variable, followed by the name. The types of named
variables are the same set as the types of register
variables, int for integer, num for numbers (floats), string
for strings, and pmc for PMCs (objects).

A simple rule of thumb is to use register variables for
variables that are used on 3 or fewer lines of code, and
named variables for any longer-lived variables.  This is
just a suggestion, but we think it really helps improve code
readability.

=cut

.sub main :main

    .local int answer
    answer = 42     # set local integer var to the integer value 42
    print answer
    print "\n"

    .local num pi
    pi = 3.14159    # set local float var to an approximation of pi
    print pi
    print "\n"

    .local string greeting
    greeting = "Hello"  # set temp string var to "Hello"
    print greeting
    print "\n"

    .local pmc player
    player = new ['String']
    player = "Ford"     # set temp PMC var to "Ford"
    print player
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

