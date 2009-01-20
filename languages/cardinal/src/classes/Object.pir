## $Id$

=head1 TITLE

Object - Cardinal Object class

=head1 DESCRIPTION

This file sets up the base classes and methods for Cardinal's
object system.  Differences (and conflicts) between Parrot's
object model and the Cardinal model means we have to do a little
name and method trickery here and there, and this file takes
care of much of that.

Still heavily based off of Perl 6's.

=head2 Functions

=over

=item onload()

Perform initializations and create the base classes.

=cut

.namespace ['CardinalObject']

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    load_bytecode 'P6object.pbc'
    $P0 = get_root_global ['parrot'], 'P6metaclass'
    $P0.'new_class'('CardinalObject', 'attr'=>'%!properties')
    cardinalmeta = $P0.'HOW'()
    set_hll_global ['CardinalObject'], '!CARDINALMETA', cardinalmeta
.end


=item !keyword_class(name)

Internal helper method to create a class.

=cut

.sub '!keyword_class' :method
    .param string name
    .local pmc class, resolve_list, methods, iter

    # Create class.
    class = newclass name

    # Set resolve list to include all methods of the class.
    methods = inspect class, 'methods'
    iter = new 'Iterator', methods
    resolve_list = new 'ResizableStringCardinalArray'
resolve_loop:
    unless iter goto resolve_loop_end
    $P0 = shift iter
    push resolve_list, $P0
    goto resolve_loop
resolve_loop_end:
    class.'resolve_method'(resolve_list)

    .return(class)
.end

=item !keyword_role(name)

Internal helper method to create a role.

=cut

.sub '!keyword_role' :method
    .param string name
    .local pmc info, role

    # Need to make sure it ends up attached to the right
    # namespace.
    info = new 'Hash'
    info['name'] = name
    $P0 = new 'ResizablePMCCardinalArray'
    $P0[0] = name
    info['namespace'] = $P0

    # Create role.
    role = new 'Role', info

    # Stash in namespace.
    $P0 = new 'ResizableStringCardinalArray'
    set_hll_global $P0, name, role

    .return(role)
.end

=item !keyword_does(class, role_name)

Internal helper method to implement the functionality of the does keyword.

=cut

.sub '!keyword_does' :method
    .param pmc class
    .param string role_name
    .local pmc role
    role = get_hll_global role_name
    addrole class, role
.end

=item !keyword_has(class, attr_name)

Adds an attribute with the given name to the class.

=cut

.sub '!keyword_has' :method
    .param pmc class
    .param string attr_name
    addattribute class, attr_name
.end

=back

=head2 Object methods

=over

=item new()

Create a new object having the same class as the invocant.

=cut

.sub 'new' :method
    .param pmc args :slurpy
    .param pmc named_args :named :slurpy
    # Instantiate.
    .local pmc cardinalmeta
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    $P0 = cardinalmeta.'get_parrotclass'(self)
    $P1 = $P0.'new'()
#print 'constructing a new object w/ id'
#$P98 = $P1.'object_id'()
#say $P98
    $P2 = $P1.'HOW'()
    $I0 = $P2.'can'(self,'initialize')
    unless $I0, no_initialize
    $P2 = $P1.'initialize'(args :flat, named_args :named :flat)
  no_initialize:

    .return ($P1)
.end

=item WHENCE()

Return the invocant's auto-vivification closure.

=cut

.sub 'WHENCE' :method
    $P0 = self.'WHAT'()
    $P1 = $P0.'WHENCE'()
    .return ($P1)
.end

=item REJECTS(topic)

Define REJECTS methods for objects (this would normally
be part of the Pattern role, but we put it here for now
until we get roles).

=cut

.sub 'REJECTS' :method
    .param pmc topic
    $P0 = self.'ACCEPTS'(topic)
    $P1 = not $P0
    .return ($P1)
.end

=item true()

Defines the .true method on all objects via C<prefix:?>.

=cut

.sub 'true' :method
        .tailcall 'prefix:?'(self)
.end

.sub 'object_id' :method
        get_addr $I0, self
        .return ($I0)
.end

=item get_bool(vtable)

Returns true if he object is defined, false otherwise

=cut

.sub '' :vtable('get_bool')
   $I0 = 'defined'(self)
   .return ($I0)
.end

=item print()

=item say()

Print the object

=cut

.sub 'print' :method
    $P0 = get_hll_global 'print'
    .tailcall $P0(self)
.end

.sub 'puts' :method
    $P0 = get_hll_global 'puts'
    .tailcall $P0(self)
.end

=item to_s()

Return a CardinalString representation of the object.

=cut

.sub 'to_s' :method
    $P0 = new 'CardinalString'
    $P0 = self
    .return ($P0)
.end

=item inspect()

This is the same a to_s by default unless overriden

=cut

.sub 'inspect' :method
    $P0 = self.'to_s'()
.end

.sub 'puts' :method
    $P0 = get_hll_global 'puts'
    .tailcall $P0(self)
.end

=item !cloneattr(attrlist)

Create a clone of self, also cloning the attributes given by attrlist.

=cut

.sub '!cloneattr' :method
    .param string attrlist
    .local pmc result
    .local pmc cardinalmeta
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    $P0 = cardinalmeta.'get_parrotclass'(self)
    result = new $P0

    .local pmc attr_it
    attr_it = split ' ', attrlist
  attr_loop:
    unless attr_it goto attr_end
    $S0 = shift attr_it
    unless $S0 goto attr_loop
    $P1 = getattribute self, $S0
    unless $P1 goto set_default
    $P1 = clone $P1
    setattribute result, $S0, $P1
    goto attr_loop
  set_default:
    $P2 = new 'CardinalInteger'
    $P2 = 0
    setattribute result, $S0, $P2
    goto attr_loop
  attr_end:
    .return (result)
.end

=item methods()

Get a list of all methods in the object.

=cut

.include 'library/dumper.pir'
.sub 'methods' :method
    $P0 = class self
    $P1 = $P0.'methods'()
    .local pmc meth_iter
    meth_iter = new 'Iterator', $P1
    .local pmc method_list
    method_list = new 'CardinalArray'
  methods_loop:
    unless meth_iter goto methods_loop_end
    $P0 = shift meth_iter
    method_list.'push'($P0)
    goto methods_loop
  methods_loop_end:
    .return(method_list)
.end

.sub 'class' :method
        $P0 = new 'CardinalString'
        $S0 = self.'WHAT'()
        $P0.'concat'($S0)
        .return ($P0)
.end

.sub 'defined' :method
       $P0 = get_hll_global ['Bool'], 'False'
       .return ($P0)
.end

.sub 'nil?' :method
    $P0 = get_hll_global 'nil'
    if self == $P0 goto yes
    goto no
    yes:
      $P0 = get_hll_global ['Bool'], 'True'
      .return ($P0)
    no:
      $P0 = get_hll_global ['Bool'], 'False'
      .return ($P0)
.end

.sub 'freeze' :method
   #Parrots freeze seems to mean the same as Javas serialize
   #Rubys freeze means to set the object as readonly. I think Perl6 gives their objects a role of Mutable, then checks for that role in infix:=
   #freeze $S0, self
   #.return (self)
   #self = $S0
   #.return ($S0)
   #share_ro $P0, self
   .return (self)
.end

.sub 'is_a?' :method
        .param pmc test
        .local pmc metaclass
        .local int result
        metaclass = self.'HOW'()
        result = metaclass.'isa'(test)
        if result goto yes
        goto no
        yes:
          $P0 = get_hll_global ['Bool'], 'True'
          .return ($P0)
        no:
          $P0 = get_hll_global ['Bool'], 'False'
.end

.sub 'kind_of?' :method
        .param pmc test
        $P0 = self.'is_a?'(test)
        .return ($P0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
