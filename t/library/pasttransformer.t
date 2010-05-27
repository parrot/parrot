#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$
=head1 NAME

t/library/pasttransformer.t

=head1 DESCRIPTION

Test PAST::Transformer. The tests are currently far from exhaustive.

=head1 SYNOPSIS

    % prove t/library/pasttransformer.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'PCT.pbc'
    load_bytecode 'PAST/Transformer.pbc'
    load_bytecode 'PAST/Walker.pbc'
    register_classes()

    plan(3)
    test_change_node_attributes()
    test_change_node_types()
    test_delete_nodes()
.end

=head1 Tests

=over 4

=item test_change_node_attributes()

Uses PAST::Transformer::Increment to add 1 to each PAST::Value node. It tests that modifying attributes with a PAST::Transformer works.

=cut

.sub test_change_node_attributes
    .local pmc past, result, target, transformer
    past = build_test_change_node_attributes_past()
    transformer = new ['PAST'; 'Transformer'; 'Increment']

    result = transformer.'walk'(past)

    target = build_test_change_node_attrs_target()
    $S0 = "Node attributes can be changed by PAST::Transformers."
    is (result, target, $S0)
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

.sub build_test_change_node_attrs_target
    .local pmc result
    result = new ['PAST'; 'Block']
    $P0 = new ['PAST'; 'Var']
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(38)
    push $P0, $P1
    push result, $P0
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(25)
    push result, $P0
    $P0 = new ['PAST'; 'Block']
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(6)
    push $P0, $P1
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(13)
    push $P0, $P1
    push result, $P0
    .return (result)
.end

=item test_change_node_types()

Use PAST::Transformer::Negate to replace negative number Vals with Ops subtracting the positive number from 0. It tests that PAST::Transformers can replace a node with a node of a different type. PAST::Walker::CountOps is used to ensure that the number of PAST::Ops changes correctly.

=cut

.sub test_change_node_types
    .local pmc past, result, target, transformer
    past = build_test_change_node_types_past()
    transformer = new ['PAST'; 'Transformer'; 'Negate']

    result = transformer.'walk'(past)

    target = build_test_change_node_types_target()
    is(result, target, "Node types can be changed by PAST::Transformers.")
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

.sub build_test_change_node_types_target
    .local pmc past
    past = new ['PAST'; 'Block']
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(0)
    push past, $P0
    $P0 = new ['PAST'; 'Op']
    $P0.'pirop'('neg')
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(7)
    push $P0, $P1
    push past, $P0
    $P0 = new ['PAST'; 'Val']
    $P0.'value'(5)
    push past, $P0
    $P0 = new ['PAST'; 'Op']
    $P0.'pirop'('neg')
    $P1 = new ['PAST'; 'Val']
    $P1.'value'(32)
    push $P0, $P1
    push past, $P0

    .return (past)
.end

=item test_delete_nodes()

Uses PAST::Transformer::Trim to delete PAST::Blocks with multiple children. It tests that deletion works. PAST::Walker::CountBlocks is used to count the PAST::Blocks.

=cut

.sub test_delete_nodes
    .local pmc past, result, target, transformer
    past = build_test_delete_nodes_past()
    transformer = new ['PAST'; 'Transformer'; 'Trim']

    result = transformer.'walk'(past)

    target = build_test_delete_nodes_target()
    is(result, target, "Nodes can be deleted by PAST::Transformers.")
.end

.sub build_test_delete_nodes_past
    .local pmc past
    past = new ['PAST';'Block']
    $P0 = new ['PAST'; 'Stmts']
    $P1 = new ['PAST'; 'Var']
    push $P0, $P1
    $P1 = new ['PAST'; 'Block']
    $P2 = new ['PAST'; 'Val']
    push $P1, $P2
    push $P0, $P1
    $P1 = new ['PAST'; 'Block']
    $P2 = new ['PAST'; 'Op']
    push $P1, $P2
    $P2 = new ['PAST'; 'VarList']
    push $P1, $P2
    push $P0, $P1
    $P1 = new ['PAST'; 'Block']
    $P2 = new ['PAST'; 'Val']
    push $P1, $P2
    $P2 = clone $P2
    push $P1, $P2
    $P2 = clone $P2
    push $P1, $P2
    push $P0, $P1
    push past, $P0
    .return (past)
.end

.sub build_test_delete_nodes_target
    .local pmc past
    past = new ['PAST';'Block']
    $P0 = new ['PAST'; 'Stmts']
    $P1 = new ['PAST'; 'Var']
    push $P0, $P1
    $P1 = new ['PAST'; 'Block']
    $P2 = new ['PAST'; 'Val']
    push $P1, $P2
    push $P0, $P1
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
    $P0 = subclass $P1, ['PAST'; 'Transformer'; 'Trim']
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

.sub 'walk' :multi(['PAST'; 'Transformer'; 'Trim'], ['PAST'; 'Block'])
    .param pmc walker
    .param pmc node
    .local pmc result
    $I0 = elements node
    if $I0 > 1 goto multiple
    result = node
    $P0 = 'walkChildren'(walker, node)
    'replaceChildren'(result, $P0)
    .return (result)
multiple:
    result = null
    .return (result)
.end

.include 'pastcompare.pir'

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
