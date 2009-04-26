# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 Hashes

Hashes, also known in some places as "dictionaries" or "associative arrays"
are like array structures except they are indexed by strings instead of
integers. There are dedicated Hash PMCs, and a number of other PMCs that
implement the hash interface as well.

Hash PMCs are indexed using C<[ ]> square brackets with a string inside them.

Arrays are typically considered to be homogeneous structures where all
elements in the array are of the same type. This is why Parrot has types
like "FixedIntegerArray" and "ResizableStringArray", which only contain
integers or strings respectively. Hashes are usually treated as being
heterogeneous, where each bucket in the hash can contain an element of a
different type.

=cut

.sub main :main

    .local pmc myhash
    myhash = new 'Hash'

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

