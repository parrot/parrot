
=head1 NAME

POST - Parrot opcode syntax tree

=head1 DESCRIPTION

This file implements the various opcode syntax tree nodes
for compiling programs in Parrot.

=cut

.namespace [ 'POST' ]

.sub '__onload' :load :init
    .local pmc p6meta, base

    ##  create POST classes
    p6meta = new 'P6metaclass'
    base = p6meta.'new_class'('POST::Node', 'parent'=>'PCT::Node')

    .return ()
.end


=head1 POST Node types

=head2 POST::Node

C<POST::Node> is the base class for all POST nodes.  It's derived from class
C<PCT::Node> (see F<compilers/pct/src/PCT/Node.pir>).

=over 4

=cut

.namespace [ 'POST';'Node' ]

=item result([value])

Get or set the result value of this node.  If the result value
is set to another POST node, then that node's result is used
as the result of the current node.

=cut

.sub 'result' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag

    if has_value == 1 goto set_value
    value = self['result']
    if null value goto result_null
    $I0 = isa value, ['POST';'Node']
    if $I0 goto result_node
    .return (value)
  result_node:
    .tailcall value.'result'()
  result_null:
    .return ('')
  set_value:
    self['result'] = value
    .return (value)
.end


=item get_string()

Returns the result of the current node as a string.

=cut

.sub 'get_string' :vtable :method
    $S0 = self.'result'()
    .return ($S0)
.end


=item push_pirop(pirop [,arglist :slurpy] [,adverbs :slurpy :named])

Shortcut for creating and adding a new POST::Op node with opcode
C<pirop> and any supplied arguments or options.  Returns the
newly created node.

=cut

.sub 'push_pirop' :method
    .param pmc pirop
    .param pmc arglist         :slurpy
    .param pmc adverbs         :slurpy :named
    adverbs['pirop'] = pirop
    $P0 = get_hll_global ['POST'], 'Op'
    $P1 = $P0.'new'(arglist :flat, adverbs :flat :named)
    self.'push'($P1)
    .return ($P1)
.end


=item escape(str)

Return C<str> as a PIR constant string.  (Deprecated in favor of
C<POST::Compiler.escape>.)

=cut

.sub 'escape' :method
    .param string str
    $P0 = get_hll_global ['PAST'], 'Compiler'
    str = $P0.'escape'(str)
    .return (str)
.end

=back

=cut


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2007-11-21  Significant refactor as part of Parrot Compiler Toolkit

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
