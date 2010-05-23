#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$
=head1 NAME

t/library/pasttransformer.t

=head1 DESCRIPTION

Test PAST::Transformer.

=head1 SYNOPSIS

    % prove t/library/pasttransformer.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'PCT.pbc'
    load_bytecode 'PAST/Transformer.pbc'
    load_bytecode 'PAST/Walker.pbc'
    register_classes()

    plan(4)
    test_change_node_attributes()
.end

=head1 Tests

=over 4

=item test_change_node_attributes()

Uses PAST::Transformer::Increment to add 1 to each PAST::Value node. It tests that modifying attributes with a PAST::Transformer works. PAST::Walker::SumVals is used to verify that the transformation has occured correctly.

=cut

.sub test_change_node_attributes
    .local pmc past, result, summer, transformer
    past = build_test_change_node_attributes_past()
    summer = new ['PAST'; 'Walker'; 'SumVals']
    transformer = new ['PAST'; 'Transformer'; 'Increment']

    summer.'reset'()
    summer.'walk'(past)
    $P0 = getattribute summer, 'sum'
    is($P0, 78, "Initial sum worked correctly.")
    $P1 = getattribute summer, 'count'
    is($P1, 4, "Initial count worked correctly.")

    result = transformer.'walk'(past)

    summer.'reset'()
    summer.'walk'(result)
    $P0 = getattribute summer, 'sum'
    is($P0, 82, "The sum changed correctly.")
    $P1 = getattribute summer, 'count'
    is($P1, 4, "The count stayed the same correctly.")
.end

.sub build_test_change_node_attributes_past
    .local pmc result
    result = new ['PAST'; 'Block']
    $P0 = new ['PAST'; 'Var']
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(37)
    push $P0, $P1
    push result, $P0
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(24)
    push result, $P0
    $P0 = new ['PAST'; 'Block']
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(5)
    push $P0, $P1
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(12)
    push $P0, $P1
    push result, $P0
    .return (result)
.end

=back

=head1 Helper classes

=cut

.sub register_classes
    $P1 = get_class ['PAST'; 'Transformer']
    $P0 = subclass $P1, ['PAST'; 'Transformer'; 'Increment']
    $P1 = get_class ['PAST'; 'Walker']
    $P0 = subclass $P1, ['PAST'; 'Walker'; 'SumVals']
    addattribute $P0, 'count'
    addattribute $P0, 'sum'
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Increment'], ['PAST'; 'Val'])
    .param pmc walker
    .param pmc node
    .local pmc result
    result = clone node
    $P0 = result.'value'()
    inc $P0
    result.'value'($P0)
    .return (result)
.end

.sub 'walk' :multi(['PAST'; 'Walker'; 'SumVals'], ['PAST'; 'Val'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'sum'
    $P1 = node.'value'()
    $P0 = $P0 + $P1
    setattribute walker, 'sum', $P0
    $P0 = getattribute walker, 'count'
    inc $P0
    setattribute walker, 'count', $P0
.end

.namespace ['PAST'; 'Walker'; 'SumVals']

.sub 'reset' :method
    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'count', $P0
    setattribute self, 'sum', $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
