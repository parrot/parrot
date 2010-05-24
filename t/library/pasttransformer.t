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

    plan(6)
    test_change_node_attributes()
    test_change_node_types()
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

=item test_change_node_types()

Use PAST::Transformer::Negate to replace negative number Vals with Ops subtracting the positive number from 0. It tests that PAST::Transformers can replace a node with a node of a different type. PAST::Walker::CountOps is used to ensure that the number of PAST::Ops changes correctly.

=cut

.sub test_change_node_types
    .local pmc past, result, counter, transformer
    past = build_test_change_node_types_past()
    counter = new ['PAST'; 'Walker'; 'CountOps']
    transformer = new ['PAST'; 'Transformer'; 'Negate']

    counter.'reset'()
    counter.'walk'(past)
    $P0 = getattribute counter, 'count'
    is($P0, 0, "The initial tree has no PAST::Op nodes.")
    
    result = transformer.'walk'(past)

    counter.'reset'()
    counter.'walk'(result)
    $P0 = getattribute counter, 'count'
    is($P0, 2, "The appropriate nodes were transformed to Ops.")
.end

.sub build_test_change_node_types_past
    .local pmc past
    past = new ['PAST'; 'Block']
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(0)
    push past, $P0
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(-7)
    push past, $P0
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(5)
    push past, $P0
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(-32)
    push past, $P0

    .return (past)
.end

=back

=head1 Helper classes

=cut

.sub register_classes
    $P1 = get_class ['PAST'; 'Transformer']
    $P0 = subclass $P1, ['PAST'; 'Transformer'; 'Increment']
    $P0 = subclass $P1, ['PAST'; 'Transformer'; 'Negate']
    
    $P1 = get_class ['PAST'; 'Walker']
    $P0 = subclass $P1, ['PAST'; 'Walker'; 'SumVals']
    addattribute $P0, 'count'
    addattribute $P0, 'sum'
    $P0 = subclass $P1, ['PAST'; 'Walker'; 'CountOps']
    addattribute $P0, 'count'
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

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Negate'], ['PAST'; 'Val'])
    .param pmc walker
    .param pmc node
    .local pmc result
    $I0 = node.'value'()
    if $I0 < 0 goto negative
    result = clone node
    .return (result)
negative:
    $I1 = neg $I0
    result = new ['PAST'; 'Op']
    result.'pirop'("neg")
    $P0 = clone node
    $P0.'value'($I1)
    push result, $P0
    .return (result)
.end

.sub 'walk' :multi(['PAST'; 'Walker'; 'CountOps'], ['PAST'; 'Op'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'count'
    inc $P0
    setattribute walker, 'count', $P0
    .tailcall 'walkChildren'(walker, node)
.end

.namespace ['PAST'; 'Walker'; 'SumVals']

.sub 'reset' :method
    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'count', $P0
    setattribute self, 'sum', $P0
.end

.namespace ['PAST'; 'Walker'; 'CountOps']

.sub 'reset' :method
    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'count', $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
