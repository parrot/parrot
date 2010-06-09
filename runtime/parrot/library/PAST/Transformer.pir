# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

PAST::Transformer - A tool for traversing and modifying PAST::Nodes.

=head1 DESCRIPTION

A tool for traversing and modifying Parrot Abstract Syntax Trees.

=cut

.sub 'onload' :anon :init :load
    load_bytecode 'PAST/Walker.pbc'
    load_bytecode 'P6object.pbc'
    .local pmc p6meta, base
    p6meta = new 'P6metaclass'
    base = get_class ['PAST'; 'Walker']
    p6meta.'new_class'('PAST::Transformer', 'parent'=> base)
.end

.namespace ['PAST'; 'Walker']

=head1 PAST::Transformer

=head2 Multi-methods

As a PAST::Walker subclass, PAST::Transformer's interface consists of two multi-methods in the PAST::Walker namespace, 'walk' and 'walkChildren'. It also declares the helper function PAST::Walker::replaceChildren. PAST::Transformer subclasses, unlike PAST::Walker subclasses, should return the desired node to replace the original node. If the original node should be unchanged, return it. If the node should be removed from its parent, return null.

=over 4

=item walk(walker, node)

By default, 'walk' calls 'walkChildren', calls 'replaceChildren' with the node and the result, and returns the node with its children transformed.

Subclasses should override this for specific PAST::Node subclasses in order to transform the node. Subclasses that wish to transform the node's children must remember to call 'walkChildren' and 'replaceChildren' in their specialization of the multi-method.

=cut

.sub 'walk' :multi(['PAST';'Transformer'], ['PAST';'Node'])
    .param pmc walker
    .param pmc node
    .local pmc newChildren, result
    result = node
    newChildren = 'walkChildren'(walker, node)
    'replaceChildren'(result, newChildren)
    .return (result)
.end

=item walkChildren(walker, node)

Iterates through the children of node, calling 'walk' with the walker and each child node. This should not generally be overridden.

It returns an array of the results from the children. This should be supplied to 'replaceChildren'.

=cut

.sub 'walkChildren' :multi(['PAST';'Transformer'], ['PAST';'Node'])
    .param pmc walker
    .param pmc node
    .local pmc result
    .local int index, max
    result = new 'ResizablePMCArray'
    index = 0
    max = elements node
    ge index, max, end
loop:
    $P0 = node[index]
    $P1 = 'walk'(walker, $P0)
    result[index] = $P1
    inc index
    lt index, max, loop
end:
    .return (result)
.end

=back

=head2 Helper functions

=over 4

=item replaceChildren(node, newChildren)

Replaces the children of node with the nodes in newChildren. This should be called with the result node and the result of 'walkChildren' in speccializations of 'walk' that wish to transform the subtrees of a node.

=cut

.sub 'replaceChildren'
    .param pmc node
    .param pmc newChildren
    .local int childIndex, max
    .local pmc ignore
    max = elements newChildren
    $I0 = elements node
    unless $I0 > 0 goto clear_done
clear_loop:
    ignore = pop node
    dec $I0
    if $I0 > 0 goto clear_loop
clear_done:
    childIndex = 0
    ge childIndex, max, end
add_loop:
    $P0 = newChildren[childIndex]
    if null $P0 goto add_reloop
    push node, $P0
add_reloop:
    inc childIndex
    lt childIndex, max, add_loop
end:
    .return ()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
