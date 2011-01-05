#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

t/oo/root_new.t - Test OO instantiation via root_new

=head1 SYNOPSIS

    % prove t/oo/root_new.t

=head1 DESCRIPTION

Tests OO features related to instantiating new objects
via the C<root_new> opcode.

=cut

.sub main :main
    .include 'except_types.pasm'
    .include 'test_more.pir'
    plan(6)

    instantiate_from_key_pmc()
    .const 'Sub' test2 = 'instantiate_from_key_pmc_in_foreign_hll'
    test2()
.end


#
# Utility sub
#
.sub _test_instance
    .param pmc obj
    .param string in_str

    # Set up local variables
    .local pmc key_pmc
    .local string class_name

    key_pmc = new 'Key'
    $P0 = split ' ', in_str
    $S0 = shift $P0
    $I1 = 1
    key_pmc    = $S0
    class_name = $S0

  LOOP:
    $I0 = elements $P0
    if $I0 == 0 goto BEGIN_TEST
    $S1 = shift $P0
    $P1 = new 'Key'
    $P1 = $S1
    push key_pmc, $P1
    class_name = concat class_name, ';'
    class_name = concat class_name, $S1
    $I1 += 1
    goto LOOP

    # Start testing
  BEGIN_TEST:
    .local string typeof_message
    typeof_message = concat 'New instance is of type: ', class_name
    $S1 = typeof obj
    is($S1, class_name, typeof_message)

    .local string keypmc_message
    $S2 = get_repr key_pmc
    keypmc_message = concat 'The object isa ', $S2
    $I2 = isa obj, key_pmc
    ok($I2, keypmc_message)

    unless $I1 == 1 goto END_TEST
    isa_ok(obj, class_name)

  END_TEST:
    .return()
.end


#############################################################################

.sub instantiate_from_key_pmc
    $P0 = root_new ['parrot';'Integer']
    _test_instance($P0, 'Integer')
.end


.HLL 'foreign'
.sub instantiate_from_key_pmc_in_foreign_hll
    $P0 = root_new ['parrot';'Integer']
    _test_instance($P0, 'Integer')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
