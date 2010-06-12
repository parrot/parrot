# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

PAST::Walker - A tool for traversing PAST::Nodes.

=head1 DESCRIPTION

A tool for traversing Parrot Abstract Syntax Trees.

=cut

.sub 'onload' :anon :init :load
    load_bytecode 'P6object.pbc'
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PAST::Walker')
.end

.namespace ['PAST'; 'Walker']

=head1 PAST::Walker

=head2 Multi-methods

The PAST::Walker interface is specified by a pair of multi-methods. Each of these takes a PAST::Walker and a PAST::Node. In addition, there are PAST::Walker methods of the same name as each multi-method that take a PAST::Node argument and call the appropriate multi-method with the invocant and the argument.

=over 4

=item walk(walker, node)

By default, 'walk' simply calls 'walkChildren'.

Subclasses should override this for specific PAST::Node subclasses in order to perform useful actions on the node. Subclasses that wish to traverse on the node's children must remember to call 'walkChildren' in their specialization of the multi-method.

=cut

.sub 'walk' :multi(['PAST';'Walker'], ['PAST';'Node'])
    .param pmc walker
    .param pmc node
    .tailcall 'walkChildren'(walker, node)
.end

.sub 'walk' :multi(['PAST';'Walker'], _)
    .param pmc walker
    .param pmc node
    .return  (node)
.end

=item walkChildren(walker, node)

Iterates through the children of node, calling 'walk' with the walker and each child node. This should not generally be overridden.

=cut

.sub 'walkChildren' :multi(_, ['PAST';'Node'])
    .param pmc walker
    .param pmc node
    .local int max, curr
    .local pmc child
    max = elements node
    curr = 0

loop:
    ge curr, max, end
    child = node[curr]
    'walk'(walker, child)
    inc curr
    branch loop
end:
.end

=back

=head2 Convenience methods

Convenience methods on PAST::Walker objects are provided to make traversing PASTs more convenient in code outside of the PAST::Walker namespace.

=over 4

=item walk(node)

walker->walk(node) is equivalent to PAST::Walker::walk(walker, node).

=cut

.sub 'walk' :method
    .param pmc node
    .tailcall 'walk'(self, node)
.end

=item walkChildren(node)

walker->walkChildren(node) is equivalent to PAST::Walker::walkChildren(walker, node).

=cut

.sub 'walkChildren' :method
    .param pmc node
    .tailcall 'walkChildren'(self, node)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
