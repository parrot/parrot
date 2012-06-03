# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about writing tests in Parrot.

=head1 WRITING TESTS

This example demonstrates writing tests using the PIR version of Test::More.
(Worth explaining a little of how ok, is, skip, and todo work.)

Also demonstrates exporting from one namespace to another (should be updated
to use particle's Exporter).

=cut

.sub _main :main
    load_bytecode 'Test/More.pbc'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Test'; 'More' ]
    exports = split " ", "plan ok is isa_ok skip todo"
    test_namespace.'export_to'(curr_namespace, exports)

    plan( 4 )

    ok(1, "first test")

    $I0 = 2
    is($I0, 2, "second test")

    skip(1, "skipped test")

    todo(1, 42, "todo test")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

