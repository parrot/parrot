## $Id$

=head1 NAME

src/classes/Completion.pir - Completion objects

=head1 DESCRIPTION

=cut

.namespace []

.sub '' :anon :load :init
    .local pmc jsmeta, nilproto
    jsmeta = get_hll_global ['JSObject'], '$!JSMETA'
    nilproto = jsmeta.'new_class'('Completion', 'parent'=>'Failure')
    $P0 = nilproto.'new'()
    set_hll_global ['Undefined'], 'undef', $P0
    .end
.end

=head2 Methods

=over

=item 'list'

=cut

.namespace ['Completion']
.sub 'list' :method
    $P0 = new 'List'
    .return ($P0)
.end


=item 'shift'

=cut

.namespace ['Completion']
.sub 'shift' :method :vtable('shift_pmc')
    .return (self)
.end

=back

=head2 Coercion methods

=over

=item Scalar

=cut

.namespace ['Completion']
.sub 'Scalar' :method
    $P0 = new 'Failure'
    .return ($P0)
.end


=back

=head2 Private methods

=over

=item !flatten

Return an empty list when flattened.

=cut

.namespace ['Completion']
.sub '!flatten' :method
    .tailcall self.'list'()
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

