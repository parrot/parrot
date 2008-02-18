=head1 Hashes

This example demonstrates using hashes, keyed access, and automatic conversion
of low-level types to pmc types in keyed access.

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

