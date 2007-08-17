=head1 Purpose

contain all the boilerplate code for starting off a test written in PIR using
Test::More's subs.

Imports several subs into the current namespace from Test::More.

=cut

    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Test'; 'More' ]
    exports = split " ", "plan diag ok is is_deeply like isa_ok"

    test_namespace."export_to"(curr_namespace, exports)

# XXX This isn't really valid PIR. It's a PIR snippet. Should the coda
# have to go here?

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

