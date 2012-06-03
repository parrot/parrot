# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's associative arrays.

=head1 ASSOCIATIVE ARRAYS

Associative arrays, also known in some places as "dictionaries" or
"hashes" are like ordered arrays except they are indexed by strings
instead of integers. Parrot has a dedicated Hash PMC, and a number of
other PMCs that implement the associative array interface as well.

Associative arryas are indexed using C<[ ]> square brackets with a
string inside them.

Ordered arrays are often homogeneous structures where all elements in
the array are of the same type. This is why Parrot has types like
"FixedIntegerArray" and "ResizableStringArray", which only contain
integers or strings respectively. Associative arrays are often
heterogeneous, where each element may be a different type.

=cut

.sub main :main

    .local pmc myhash
    myhash = new ['Hash']

    myhash['foo'] = 5
    myhash['bar'] = "Hello"

    $I0 = myhash['foo']
    print $I0
    print "\n"

    $P0 = myhash['foo']
    $S0 = typeof $P0
    say $S0

    $P1 = myhash['bar']
    $S1 = typeof $P1
    say $S1

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

