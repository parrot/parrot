## $Id$

=head1 TITLE

Bool - Javascript Boolean Type and values

=head1 DESCRIPTION

This file sets up the Javascript C<Boolean> type, and initializes
symbols for C<Boolean::True> and C<Boolean::False>.

=head1 Methods

=over 4

=cut

.namespace ['JSBoolean']

.sub 'onload' :anon :init :load
    .local pmc jsmeta, boolproto, booleanclass
    booleanclass = get_root_global ['parrot'], 'Boolean'
    jsmeta = get_hll_global ['JSObject'], '$!JSMETA'
    boolproto = jsmeta.'new_class'('JSBoolean', 'parent'=>booleanclass)
    #boolproto = jsmeta.'new_class'('Boolean')
    #boolproto.'!IMMUTABLE'()
    jsmeta.'register'('Boolean', 'parent'=>boolproto, 'protoobject'=>boolproto)

    $P0 = boolproto.'new'()
    $P0 = 0
    set_hll_global ['JSBoolean'], 'false', $P0

    $P0 = boolproto.'new'()
    $P0 = 1
    set_hll_global ['JSBoolean'], 'true', $P0
.end

.sub 'get_string' :vtable
   $I0 = self
   unless self goto f
  .return ("true")
  f:
  .return ("false")
.end

.sub 'get_integer1' #:vtable
  .param pmc self
   $I0 = self
  .return ($I0)
.end


.sub 'ACCEPTS' :method
    .param pmc topic
    .return (self)
.end


.sub 'js' :method
    if self goto false
    .return ('false')
  false:
    .return ('true')
.end


=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
