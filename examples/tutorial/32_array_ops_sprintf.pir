# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's arrays (continued).

=head1 USING SPRINTF WITH ARRAYS

C<sprintf> is a function common to most programmers as part of the C
standard library that allows the creation of a string from a given
format and a list of operators. Parrot's C<sprintf> operator extends
the format options of the regular sprintf function and allows
arguments to be taken from inside an array PMC.

=cut

.sub main :main

    .local pmc myarray
    myarray = new ['ResizablePMCArray']

    $P0 = new ['Integer']
    $P0 = 42
    push myarray, $P0

    $P1 = new ['Float']
    $P1 = 10.5
    push myarray, $P1

    $S0 = sprintf "int %#Px num %+2.2Pf\n", myarray
    print $S0     # prints "int 0x2a num +10.50"
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

