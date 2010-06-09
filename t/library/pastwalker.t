#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/pastwalker.t

=head1 DESCRIPTION

Test PAST::Walker.

=head1 SYNOPSIS

    % prove t/library/pastwalker.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'PCT.pbc'
    load_bytecode 'PAST/Walker.pbc'
    register_classes()

    plan(6)
    test_count_node_types()
.end

=head1 Tests

=over 4

=item test_count_node_types()

Uses PAST::Walker::NodeCounter to count the number of each node type in a PAST. It tests that traversal of all node types does work.

=cut

.sub 'test_count_node_types'
    .local pmc walker, past
    walker = new ['PAST';'Walker';'NodeCounter']
    walker.'reset'()

    past = 'build_count_node_types_past'()

    walker.'walk'(past)

    $P2 = getattribute walker, 'counts'

    $P3 = $P2['blocks']
    is($P3, 2, "PAST::Block")

    $P3 = $P2['ops']
    is($P3, 3, "PAST::Op")

    $P3 = $P2['vars']
    is($P3, 2, "PAST::Var")

    $P3 = $P2['vals']
    is($P3, 1, "PAST::Val")

    $P3 = $P2['stmts']
    is($P3, 2, "PAST::Stmts")

    $P3 = $P2['varlists']
    is($P3, 1, "PAST::VarList")
.end

.sub 'build_count_node_types_past'
    .local pmc past
    past = new ['PAST';'Block']

    $P0 = new ['PAST'; 'Var']
    push past, $P0
    $P0 = new ['PAST'; 'Op']
    $P0.'pirop'("call")
    $P1 = new ['PAST'; 'Var']
    push $P0, $P1
    $P1 = new ['PAST'; 'Val']
    push $P0, $P1
    push past, $P0
    $P0 = new ['PAST'; 'Stmts']
    $P1 = new ['PAST'; 'Op']
    push $P0, $P1
    $P1 = new ['PAST'; 'Op']
    push $P0, $P1
    $P1 = new ['PAST'; 'VarList']
    push $P0, $P1
    $P1 = new ['PAST'; 'Block']
    push $P0, $P1
    push past, $P0
    $P0 = new ['PAST'; 'Stmts']
    push past, $P0
    .return (past)
.end

=back

=head1 Helper classes

=cut

.sub 'register_classes'
    $P0 = subclass ['PAST'; 'Walker'], ['PAST'; 'Walker'; 'NodeCounter']
    addattribute $P0, 'counts'
.end

.namespace ['PAST'; 'Walker']

.sub 'walk' :multi(['PAST';'Walker';'NodeCounter'], ['PAST';'Block'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'counts'
    $I0 = $P0['blocks']
    inc $I0
    $P0['blocks'] = $I0
    'walkChildren'(walker, node)
.end

.sub 'walk' :multi(['PAST';'Walker';'NodeCounter'], ['PAST';'Op'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'counts'
    $I0 = $P0['ops']
    inc $I0
    $P0['ops'] = $I0
    'walkChildren'(walker, node)
.end

.sub 'walk' :multi(['PAST';'Walker';'NodeCounter'], ['PAST';'Stmts'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'counts'
    $I0 = $P0['stmts']
    inc $I0
    $P0['stmts'] = $I0
    'walkChildren'(walker, node)
.end

.sub 'walk' :multi(['PAST';'Walker';'NodeCounter'], ['PAST';'Val'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'counts'
    $I0 = $P0['vals']
    inc $I0
    $P0['vals'] = $I0
    'walkChildren'(walker, node)
.end

.sub 'walk' :multi(['PAST';'Walker';'NodeCounter'], ['PAST';'Var'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'counts'
    $I0 = $P0['vars']
    inc $I0
    $P0['vars'] = $I0
    'walkChildren'(walker, node)
.end

.sub 'walk' :multi(['PAST';'Walker';'NodeCounter'], ['PAST';'VarList'])
    .param pmc walker
    .param pmc node
    $P0 = getattribute walker, 'counts'
    $I0 = $P0['varlists']
    inc $I0
    $P0['varlists'] = $I0
    'walkChildren'(walker, node)
.end

.namespace ['PAST'; 'Walker'; 'NodeCounter']

.sub 'reset' :method
    $P0 = new 'Hash'
    setattribute self, 'counts', $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
