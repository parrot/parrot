# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1

PMC registers can contain instances of array or hash data types, or
more advanced types based on these two. If a PMC type implements the
array or hash interfaces, they can be accessed using integer or string
keys.

An array is a type of PMC that contains elements that are indexed by
number. Array indices must be integer values, not floating point ones.
Arrays also have a large group of special opcodes that operate on them:
C<push>, C<pop>, C<shift>, and C<unshift>.

=cut

.sub main :main

    .local pmc myarray
    myarray = new 'ResizableStringArray'

    myarray[0] = "Foo"
    push myarray, "Bar"
    unshift myarray, "Baz"

    $S0 = join " ", myarray
    say $S0

    $S1 = myarray[2]
    print $S1
    print "'\n"

    $S2 = pop myarray
    say $S2

    $S3 = shift myarray
    say $S3

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

