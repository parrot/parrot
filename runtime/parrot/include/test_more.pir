# Copyright (C) 2007-2008, Parrot Foundation.

=head1 Purpose

This file contains all the boilerplate code for starting off a test written in PIR using
Test::More's subs. In order to use it, simply include it in the :main routine of your test script.

Imports several subs into the current namespace from Test::More.

This is intended to be broadly usable. Feel free to use Test::More
directly, of course, but this provides a handy shortcut for setting up
simple test file written in parrot.

=cut

    $P99 = load_bytecode 'Test/More.pbc'
    $I0 = $P99.'is_initialized'('load')
    if $I0 goto __test_more_done_initialization
    $P98 = $P99.'subs_by_tag'('load')
    $P98 = iter $P98
  __test_more_init_top:
    unless $P98 goto __test_more_init_bottom
    $P97 = shift $P98
    $P97()
    goto __test_more_init_top
  __test_more_init_bottom:
    $P99.'mark_initialized'('load')
  __test_more_done_initialization:

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_root_namespace [ 'parrot'; 'Test'; 'More' ]
    exports = split ' ', 'plan diag ok nok is is_deeply is_null like substring isa_ok skip skip_all isnt todo throws_type throws_like lives_ok dies_ok throws_substring done_testing'

    test_namespace.'export_to'(curr_namespace, exports)

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
