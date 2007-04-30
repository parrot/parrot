#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id: $

=head1 NAME

range.t

=head1 SYNOPSIS

    % prove range.t

=head1 DESCRIPTION

Tests the Range class.

=cut

.sub main :main
    # load this library
    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exports = split " ", "plan diag ok is is_deeply like isa_ok"

    test_namespace."export_to"(curr_namespace, exports)

    load_bytecode 'Range.pir' # XXX eventually convert to pbc.

    plan(5)

    # XXX Convert this to the PDD15 way of creating an object
    # at the same time you specify the attributes...

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    ok(1, 'Created new range')
    $I0 = $P0.'shift'()
    is($I0, 1, '1 - 1st')
    $I0 = $P0.'shift'()
    is($I0, 2, '1 - 2nd')
    $I0 = $P0.'shift'()
    is($I0, 3, '1 - 3rd')

    push_eh test_1_catch
      $I0 = $P0.'shift'()
      ok(0,'1 - exhausted')
      goto test_2
    clear_eh
    
test_1_catch:
    # XXX should have more thorough exception check
    ok(1,'1 - exhuasted')

test_2: 
 

.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
