# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's mult-level keys.

=head1 MULTI-LEVEL KEYS

Hashes and arrays can be combined in a number of ways to
make interesting and complex data structures. A hash may
contain an array PMC, which in turn can contain other arrays
or hashes. In these cases, the keys for each level can be
combined together to form a single unique key for a data
element in the structure.

This technique works equally well for arrays-of-arrays,
hashes-of-hashes, and combination structures as well.

=cut

.sub main :main

    .local pmc myhash, innerarray
    myhash  = new ['Hash']
    innerarray = new ['ResizableIntegerArray']

    $I0 = 2
    innerarray[2] = 42
    myhash["answer"] = innerarray

    $I0 = myhash["answer";$I0]        # $i = $hash{"answer"}[2]
    print $I0
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

