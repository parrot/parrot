=head1

Shows how to create arrays, keyed access to arrays, and the basic array
operations (which are similar to Perl).

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

