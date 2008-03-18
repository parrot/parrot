=head1 Multi-Level Keys

This example demonstrates multiple keys with array and hash access. Note that
the keys aren't auto instantiating, so the objects at each level have to be
created.

=cut

.sub main :main

    .local pmc myhash, innerarray
    myhash  = new 'Hash'
    innerarray = new 'ResizableIntegerArray'

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

