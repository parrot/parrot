## $Id$

=head1 TITLE

Object - JS Array class

=head1 DESCRIPTION

This file sets up the base classes and methods for JS's
object system.  Differences (and conflicts) between Parrot's
object model and the JS model means we have to do a little
name and method trickery here and there, and this file takes
care of much of that.

=cut

.namespace []
.sub '' :anon :init :load
    .local pmc jsmeta
    load_bytecode 'PCT.pbc'
    $P0 = get_root_global ['parrot'], 'P6metaclass'
    $P0.'new_class'('JSArray', 'parent'=>'JSObject')
    jsmeta = $P0.'HOW'()
    set_hll_global ['JSArray'], '$!JSMETA', jsmeta
.end

=head2 Methods

=over 4

=item clone()

Returns a copy of the object.

NOTE: Don't copy what this method does; it's a tad inside-out. We should be
overriding the clone vtable method to call .clone() really. But if we do that,
we can't current get at the Object PMC's clone method, so for now we do it
like this.

=cut

.namespace ['JSArray']
.sub 'Set' :method
    .param pmc key
    .param pmc val
    self[key] = val
    .return(self)
.end

.namespace ['JSArray']
.sub 'Get' :method
    .param pmc key
    .local pmc val
    val = self[key]
    .return(val)
.end

.namespace ['JSArray']
.sub 'clone' :method
    .param pmc new_attrs :slurpy :named

    # Make a clone.
    .local pmc result
    $I0 = isa self, 'ObjectRef'
    unless $I0 goto do_clone
    self = deref self
  do_clone:
    result = clone self

    # Set any new attributes.
    .local pmc it
    it = iter new_attrs
  it_loop:
    unless it goto it_loop_end
    $S0 = shift it
    $P0 = new_attrs[$S0]
    $S0 = concat '!', $S0
    $P1 = result.$S0()
    'infix:='($P1, $P0)
    goto it_loop
  it_loop_end:

    .return (result)
.end


=item defined()

Return true if the object is defined.

=cut

.namespace ['JSArray']
.sub 'defined' :method
    $P0 = get_hll_global ['Bool'], 'True'
    .return ($P0)
.end


=item hash

Return invocant in hash context.

=cut

.namespace ['JSArray']
.sub 'hash' :method
    .tailcall self.'Hash'()
.end

.namespace []
.sub 'hash'
    .param pmc values :slurpy
    .tailcall values.'Hash'()
.end

=item item

Return invocant in item context.  Default is to return self.

=cut

.namespace ['JSArray']
.sub 'item' :method
    .return (self)
.end

.namespace []
.sub 'item'
    .param pmc x               :slurpy
    $I0 = elements x
    unless $I0 == 1 goto have_x
    x = shift x
  have_x:
    $I0 = can x, 'item'
    unless $I0 goto have_item
    x = x.'item'()
  have_item:
    .return (x)
.end


=item list

Return invocant in list context.  Default is to return a List containing self.

=cut

.namespace ['JSArray']
.sub 'list' :method
    $P0 = new 'List'
    push $P0, self
    .return ($P0)
.end

=item print()

Print the object.

=cut

.namespace ['JSArray']
.sub 'print' :method
    $P0 = get_hll_global 'print'
    .tailcall $P0(self)
.end

=item say()

Print the object, followed by a newline.

=cut

.namespace ['JSArray']
.sub 'say' :method
    $P0 = get_hll_global 'say'
    .tailcall $P0(self)
.end

=item true()

Boolean value of object -- defaults to C<.defined> (S02).

=cut

.namespace ['JSArray']
.sub 'true' :method
    .tailcall self.'defined'()
.end

=back

=head2 Coercion methods

=over 4

=item Array()

=cut

.namespace ['JSArray']
.sub 'Array' :method
    $P0 = new 'JSArray'
    $P0.'!STORE'(self)
    .return ($P0)
.end

=item Hash()

=cut

.namespace ['JSArray']
.sub 'Hash' :method
    $P0 = new 'JSHash'
    $P0.'!STORE'(self)
    .return ($P0)
.end

=item Iterator()

=cut

.sub 'Iterator' :method
    $P0 = self.'list'()
    .tailcall $P0.'Iterator'()
.end

=item Scalar()

Default Scalar() gives reference type semantics, returning
an object reference (unless the invocant already is one).

=cut

.namespace ['JSArray']
.sub '' :method('Scalar') :anon
    $I0 = isa self, 'ObjectRef'
    unless $I0 goto not_ref
    .return (self)
  not_ref:
    $P0 = new 'ObjectRef', self
    .return ($P0)
.end

.namespace []
.sub 'Scalar'
    .param pmc source
    $I0 = isa source, 'ObjectRef'
    if $I0 goto done
    $I0 = can source, 'Scalar'
    if $I0 goto can_scalar
    $I0 = does source, 'scalar'
    source = new 'ObjectRef', source
  done:
    .return (source)
  can_scalar:
    .tailcall source.'Scalar'()
.end

=item Str()

Return a string representation of the invocant.  Default is
the object's type and address.

=cut

.namespace ['JSArray']
.sub 'Str' :method
    $P0 = new 'ResizableStringArray'
    $P1 = self.'WHAT'()
    push $P0, $P1
    $I0 = get_addr self
    push $P0, $I0
    #$S0 = sprintf "[object Object %s 0x%x]", $P0
    $S0 = sprintf "[object Object]", $P0
    .return ($S0)
.end

=back

=head2 Special methods

=over 4

=item new()

Create a new object having the same class as the invocant.

=cut

.namespace ['JSArray']
.sub 'new' :method
    .param pmc init_parents :slurpy
    .param pmc init_this    :named :slurpy

    # Instantiate.
    .local pmc jsmeta
    jsmeta = get_hll_global ['JSArray'], '$!JSMETA'
    $P0 = jsmeta.'get_parrotclass'(self)
    $P1 = new $P0
    .return ($P1)
.end

=back

=head2 Vtable functions

=cut

.namespace ['JSArray']
.sub '' :vtable('decrement') :method
    $P0 = self.'pred'()
    'infix:='(self, $P0)
    .return(self)
.end

.sub '' :vtable('defined') :method
    $I0 = self.'defined'()
    .return ($I0)
.end

.sub '' :vtable('get_bool') :method
    $I0 = self.'true'()
    .return ($I0)
.end

.sub '' :vtable('get_iter') :method
    .tailcall self.'Iterator'()
.end

.sub '' :vtable('get_string') :method
    $S0 = self.'Str'()
    .return ($S0)
.end

.sub '' :vtable('increment') :method
    $P0 = self.'succ'()
    'infix:='(self, $P0)
    .return(self)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
