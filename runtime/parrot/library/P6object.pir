
=head1 NAME

P6object - Perl 6-like methods and metaclasses for Parrot

=head1 SYNOPSIS

    .sub 'main'
        load_bytecode "dumper.pbc"

        # load this library
        load_bytecode 'P6object.pbc'

        ##  grab the P6metaclass protoobject
        .local pmc p6meta
        p6meta = get_hll_global 'P6metaclass'

        ##  create a new class ABC::Def with three attributes
        p6meta.'new_class'('ABC::Def', 'attr'=>'$a @b %c')

        ##  get the protoobject for ABC::Def
        .local pmc defproto
        defproto = get_hll_global ['ABC'], 'Def'

        ##  use the protoobject to create a new ABC::Def object
        .local pmc obj
        obj = defproto.'new'()

        ##  get the class protoobject from any object
        $P0 = obj.'WHAT'()

        ##  get the metaclass for any object
        $P0 = obj.'HOW'()

        ##  create a new class MyHash as a subclass of Parrot's 'Hash'
        p6meta.'new_class'('MyHash', 'parent'=>'Hash')

        ##  tell Parrot classes to use a specific protoobject
        $P0 = get_hll_global 'MyHash'
        p6meta.'register'('Hash', 'protoobject'=>$P0)
        $P1 = new 'Hash'               # create a Hash
        $P2 = $P1.'WHAT'()             # get its protoobject
        $S3 = $P2                      # stringify
        say $S3                        # "MyHash\n"

=head1 DESCRIPTION

C<P6object> is intended to add Perl 6-like behaviors to objects
in Parrot.  It creates and maintains protoobjects, and supplies
C<.WHAT> and C<.HOW> methods to objects and protoobjects in Parrot.
Protoobjects also have a default C<.new> method for creating
new instances of a class (classes are able to override this, however).

=head1 CLASSES

=head2 P6object

C<P6object> is the base class for objects that make use of the
P6metamodel.  It supplies the C<.WHAT> and C<.HOW> methods.

=over 4

=item onload() :anon :tag('init') :tag('load')

Initializes the P6object system.  Builds protoobjects for
C<P6object> and C<P6metaclass>.

=cut

.namespace ['P6object']

.sub 'onload' :anon :tag('init') :tag('load')
    $P0 = newclass 'P6protoobject'

    $P0 = newclass 'P6object'
    addattribute $P0, '%!properties'

    $P1 = subclass $P0, 'P6metaclass'
    addattribute $P1, 'parrotclass'
    addattribute $P1, 'protoobject'
    addattribute $P1, 'longname'
    addattribute $P1, 'shortname'

    $P2 = new 'P6metaclass'
    $P2.'register'($P0)
    $P3 = $P2.'register'($P1)
    setattribute $P3, 'protoobject', $P3

    $P0 = new ['Boolean']
    set_hll_global ['P6protoobject'], 'False', $P0
    $P0 = new ['Boolean']
    assign $P0, 1
    set_hll_global ['P6protoobject'], 'True', $P0
.end


=item HOW()

Return the C<P6metaclass> of the invocant.

=cut

.sub 'HOW' :method :nsentry
    $P0 = typeof self
    $P1 = getprop 'metaclass', $P0
    .return ($P1)
.end


=item WHAT()

Return the C<P6protoobject> for the invocant.

=cut

.sub 'WHAT' :method :nsentry
    .local pmc how, what
    how = self.'HOW'()
    what = getattribute how, 'protoobject'
    .return (what)
.end


=item WHERE()

Return the memory address for the invocant.

=cut

.sub 'WHERE' :method :nsentry
    $I0 = get_id self
    .return ($I0)
.end


=item WHO()

Return the package for the object.

=cut

.sub 'WHO' :method :nsentry
    $P0 = typeof self
    $P0 = getprop 'metaclass', $P0
    $P0 = getattribute $P0, 'parrotclass'
    $P0 = $P0.'get_namespace'()
    .return ($P0)
.end


=item PROTOOVERRIDES()

Return a list of methods to be overridden in protoobjects
for the class.  Defaults to 'new' (i.e., any '.new' method
in a class will override the one given for P6protoobject
below).

=cut

.sub 'PROTOOVERRIDES' :method
    .return ('new')
.end


=back

=head2 P6metaclass

=over

=item isa(x)

Return a true value if the invocant 'isa' C<x>.

=cut

.namespace ['P6metaclass']
.sub 'isa' :method :multi(_,_, _)
    .param pmc obj
    .param pmc x

    .local pmc parrotclass
    parrotclass = self.'get_parrotclass'(x)
    $P0 = obj.'WHAT'()
    $I0 = isa $P0, parrotclass
    .return ($I0)
.end

=item can(x)

Return a true value if the invocant 'can' C<x>.

=cut

.sub 'can' :method
    .param pmc obj
    .param string x
    $P0 = obj.'WHAT'()
    $I0 = can $P0, x
    .return ($I0)
.end


=item add_parent(parentclass [, 'to'=>parrotclass])

Deprecated; use add_parent(class, parentclass)

=cut

.sub 'add_parent' :method :multi(_,_)
    .param pmc parentclass
    .param pmc options         :slurpy :named

    $P0 = options['to']
    unless null $P0 goto have_to
    $P0 = self
  have_to:
    .tailcall self.'add_parent'($P0, parentclass)
.end


=item add_parent(class, parentclass)

=cut

.sub 'add_parent' :method :multi(_,_,_)
    .param pmc obj
    .param pmc parentclass

    parentclass = self.'get_parrotclass'(parentclass)

    .local pmc parrotclass
    parrotclass = self.'get_parrotclass'(obj)
    if null parrotclass goto end

    ##  if parrotclass isa parentclass, we're done
    $I0 = isa parrotclass, parentclass
    if $I0 goto end
    ##  if parrotclass isa PMCProxy, we do method mixins
    $S0 = typeof parrotclass
    if $S0 == 'PMCProxy' goto parent_proxy
    ##  add parent directly to parrotclass, we're done
    parrotclass.'add_parent'(parentclass)
    goto end

  parent_proxy:
    ##  iterate over parent's mro and methods, adding them to parrotclass' namespace
    .local pmc mroiter, methods, methoditer
    $P0 = parentclass.'inspect'('all_parents')
    mroiter = iter $P0
  mro_loop:
    unless mroiter goto mro_end
    $P0 = shift mroiter
    methods = $P0.'methods'()
    methoditer = iter methods
  method_loop:
    unless methoditer goto mro_loop
    .local string methodname
    .local pmc methodpmc
    methodname = shift methoditer
    methodpmc = methods[methodname]
    # don't add NativePCCMethods
    $I0 = isa methodpmc, 'NativePCCMethod'
    if $I0 goto method_loop
    # don't add NCI methods (they don't work)
    $I0 = isa methodpmc, 'NCI'
    if $I0 goto method_loop
    # if there's no existing entry, add method directly
    push_eh add_method_failed
    $P0 = inspect parrotclass, 'methods'
    $P0 = $P0[methodname]
    if null $P0 goto add_method
    # if existing entry isn't a MultiSub, skip it
    $I0 = isa $P0, ['MultiSub']
    unless $I0 goto method_loop
    parrotclass.'add_method'(methodname, methodpmc)
    pop_eh
    goto method_loop
  add_method:
    parrotclass.'add_method'(methodname, methodpmc)
  add_method_failed:
    pop_eh
    goto method_loop
  mro_end:

  end:
.end
.sub 'add_parent' :method :multi(_,P6metaclass,_)
    .param pmc obj
    .param pmc parentclass
    $P0 = getattribute obj, 'parrotclass'
    self.'add_parent'($P0, parentclass)
.end


=item add_method(name, method, [, 'to'=>parrotclass])

Add C<method> with C<name> to C<parrotclass>.

DEPRECATED. Use add_method(class, name, method)

=cut

.sub 'add_method' :method :multi(_,_,_)
    .param string name
    .param pmc method
    .param pmc options         :slurpy :named

    $P0 = options['to']
    unless null $P0 goto have_to
    $P0 = self
  have_to:
    .tailcall self.'add_method'($P0, name, method)
.end


=item add_method(class, name, method)

Add C<method> with C<name> to C<class>.

=cut


.sub 'add_method' :method :multi(_,_,_,_)
    .param pmc obj
    .param string name
    .param pmc method

    .local pmc parrotclass
    parrotclass = self.'get_parrotclass'(obj)
    parrotclass.'add_method'(name, method)
.end


=item add_attribute(class, name)

Add C<method> with C<name> to C<class>.

=cut

.sub 'add_attribute' :method
    .param pmc obj
    .param string name
    .param pmc options         :slurpy :named
    .local pmc parrotclass
    parrotclass = self.'get_parrotclass'(obj)
    parrotclass.'add_attribute'(name)
.end


=item add_role(role, [, 'to'=>parrotclass])

Add C<role> to C<parrotclass>.

DEPRECATED. Use compose_role(class, role)

=cut

.sub 'add_role' :method
    .param pmc role
    .param pmc options         :slurpy :named

    $P0 = options['to']
    unless null $P0 goto have_to
    $P0 = self
  have_to:
    .tailcall self.'compose_role'($P0, role)
.end


=item compose_role(class, role)

Add C<role> to C<class>.

=cut

.sub 'compose_role' :method
    .param pmc obj
    .param pmc role

    .local pmc parrotclass
    parrotclass = self.'get_parrotclass'(obj)
    parrotclass.'add_role'(role)
.end


=item register(parrotclass [, 'name'=>name] [, 'protoobject'=>proto]
               [, 'parent'=>parentclass] [, 'hll'=>hll] [, 'how'=>how)

Sets objects of type C<parrotclass> to use C<protoobject>,
and verifies that C<parrotclass> has P6object methods defined
on it.  This happens either by setting C<P6object> as a parent
of C<parrotclass>, or by individually composing C<P6object>'s methods
into C<parrotclass>.

The C<name> parameter causes objects to be registered using a name
that differs from the parrotclass name.  This is useful when needing
to map to a class name that already exists in Parrot (e.g., 'Hash'
or 'Object').

The C<how> parameter allows you to specify an already-existing metaclass
instance to be used for this class rather than creating a new one.

=cut

.sub 'register' :method
    .param pmc parrotclass
    .param pmc options         :slurpy :named

    ##  get the true parrotclass
    $I0 = isa parrotclass, 'Class'
    if $I0 goto have_parrotclass
    parrotclass = self.'get_parrotclass'(parrotclass)
  have_parrotclass:

    ## get the hll, either from options or the caller's namespace
    .local pmc hll
    hll = options['hll']
    $I0 = defined hll
    if $I0, have_hll
    $P0 = getinterp
    $P0 = $P0['namespace';1]
    $P0 = $P0.'get_name'()
    hll = shift $P0
    options['hll'] = hll
  have_hll:

    ##  add any needed parent classes
    .local pmc parentclass
    parentclass = options['parent']
    if null parentclass goto parent_done
    $I0 = isa parentclass, 'P6protoobject'
    if $I0 goto parent_single
    $I0 = does parentclass, 'array'
    if $I0 goto parent_array
    $S0 = typeof parentclass
    if $S0 == 'String' goto parent_string
  parent_single:
    self.'add_parent'(parentclass, 'to'=>parrotclass)
    goto parent_done
  parent_string:
    $S0 = parentclass
    parentclass = split ' ', $S0
  parent_array:
    .local pmc it, item
    it = iter parentclass
  parent_loop:
    unless it goto parent_done
    item = shift it
    $S0 = item
    $P0 = split ';', $S0
    $I0 = elements $P0
    eq $I0, 1, no_parent_hll
    $S0 = shift $P0
    goto have_parent_hll
  no_parent_hll:
    $S0 = hll
  have_parent_hll:
    $P0 = shift $P0
    $S1 = $P0
    $P0 = split '::', $S1
    unshift $P0, $S0
    $S0 = pop $P0
    item = get_root_global $P0, $S0
    self.'add_parent'(item, 'to'=>parrotclass)
    goto parent_loop
  parent_done:
    $I0 = isa parrotclass, 'P6object'
    if $I0 goto isa_p6object_already
    self.'add_parent'('P6object', 'to'=>parrotclass)
  isa_p6object_already:

    ##  determine parrotclass' canonical p6-name
    .local string name
    .local pmc ns
    name = options['name']
    if name goto have_name
    ##  use the name of parrotclass if :name not supplied
    name = parrotclass
  have_name:
    ##  Parrot joins namespaces with ';'
    ns = split ';', name
    $I0 = elements ns
    if $I0 > 1 goto have_ns
    ##  but perhaps it's a (legacy) ::-delimited name instead
    ns = split '::', name
  have_ns:

    ##  get the metaclass (how) from :how, or :protoobject, or create one
    .local pmc how
    how = options['how']
    unless null how goto have_how
    $P0 = options['protoobject']
    if null $P0 goto make_how
    how = $P0.'HOW'()
    goto how_setup
  make_how:
    ##  create a metaclass for parrotclass
    $P0 = typeof self
    how = new $P0
    setattribute how, 'parrotclass', parrotclass
  have_how:

    ##  create an anonymous class for the protoobject
    .local pmc protoclass, protoobject
    protoclass = new 'Class'
    $P0 = get_class 'P6protoobject'
    ##  P6protoobject methods override parrotclass methods...
    protoclass.'add_parent'($P0)
    protoclass.'add_parent'(parrotclass)
    protoobject = new protoclass
    ##  ...except for the ones that don't
    .local pmc protooverrides
    (protooverrides :slurpy) = protoobject.'PROTOOVERRIDES'()
  override_loop:
    unless protooverrides goto override_end
    .local string methodname
    methodname = shift protooverrides
    unless methodname goto override_loop
    $P0 = parrotclass.'inspect'('all_parents')
    it = iter $P0
  method_loop:
    unless it goto method_end
    $P0 = shift it
    $P0 = $P0.'methods'()
    $P0 = $P0[methodname]
    if null $P0 goto method_loop
    protoclass.'add_method'(methodname, $P0)
  method_end:
    goto override_loop
  override_end:
  have_protoobject:
    ##  save the protoobject into the metaclass
    setattribute how, 'protoobject', protoobject

    ##  attach the metaclass object to the protoclass
    setprop protoclass, 'metaclass', how

    ##  store the long and short names in the protoobject; skip if anonymous
    .local pmc longname, shortname
    $I0 = elements ns
    if $I0 == 0 goto anonymous_class
    $S0 = join '::', ns
    longname = new 'String'
    longname = $S0
    shortname = ns[-1]
    setattribute how, 'longname', longname
    setattribute how, 'shortname', shortname

    ##  store the protoobject in appropriate namespace
    unshift ns, hll
    $S0 = pop ns
    set_root_global ns, $S0, protoobject
    ##  store the protoobject in the default export namespace
    push ns, 'EXPORT'
    push ns, 'ALL'
    set_root_global ns, $S0, protoobject
    goto how_setup

    ##  anonymous classes have empty strings for shortname and longname
  anonymous_class:
    longname = new 'String'
    shortname = new 'String'
    setattribute how, 'longname', longname
    setattribute how, 'shortname', shortname

  how_setup:
    ##  attach the metaclass object to the parrotclass
    setprop parrotclass, 'metaclass', how

    ##  return the protoobject
    .return (protoobject)
.end


=item new_class(name [, 'parent'=>parentclass] [, 'attr'=>attr] [, 'hll'=>hll])

Create a new class called C<name> as a subclass of C<parentclass>.
When C<name> is a string, then double-colons will be treated as separators.
If C<parentclass> isn't supplied, defaults to using C<P6object>
as the parent.  The C<attr> parameter is a list of attribute names
to be added to the class, specified as either an array or a string
of names separated by spaces.

=cut

.sub 'new_class' :method
    .param pmc name
    .param pmc options         :slurpy :named

    .local pmc parrotclass, hll

    hll = options['hll']
    $I0 = defined hll
    if $I0, have_hll
    $P0 = getinterp
    $P0 = $P0['namespace';1]
    $P0 = $P0.'get_name'()
    hll = shift $P0
    options['hll'] = hll
  have_hll:

    .local pmc class_ns, ns
    $S0 = typeof name
    $I0 = isa name, 'String'
    if $I0, parrotclass_string
    $I0 = isa name, 'ResizableStringArray'
    if $I0, parrotclass_array
    parrotclass = newclass name
    goto have_parrotclass
  parrotclass_string:
    $S0 = name
    class_ns = split '::', $S0
    unshift class_ns, hll
    $P0 = get_root_namespace
    ns = $P0.'make_namespace'(class_ns)
    parrotclass = newclass ns
    goto have_parrotclass
  parrotclass_array:
    class_ns = name
    unshift class_ns, hll
    $P0 = get_root_namespace
    ns = $P0.'make_namespace'(class_ns)
    parrotclass = newclass ns
    goto have_parrotclass
  have_parrotclass:

    .local pmc attrlist, it
    attrlist = options['attr']
    if null attrlist goto attr_done
    $I0 = does attrlist, 'array'
    if $I0 goto have_attrlist
    $S0 = attrlist
    attrlist = split ' ', $S0
  have_attrlist:
    it = iter attrlist
  iter_loop:
    unless it goto iter_end
    $S0 = shift it
    unless $S0 goto iter_loop
    addattribute parrotclass, $S0
    goto iter_loop
  iter_end:
  attr_done:
    .tailcall self.'register'(parrotclass, options :named :flat)
.end


=item get_proto(name)

Retrieve the protoobject for C<name>.  Return null if no
protoobject exists, or whatever is present isn't a protoobject.

=cut

.sub 'get_proto' :method
    .param string name
    .local pmc ns, proto
    ns = split '::', name
    $S0 = pop ns
    proto = get_hll_global ns, $S0
    if null proto goto done
    $I0 = isa proto, ['P6protoobject']
    if $I0 goto done
    null proto
  done:
    .return (proto)
.end


=item get_parrotclass(x)

Multimethod helper to return the parrotclass for C<x>.

=cut

.sub 'get_parrotclass' :method
    .param pmc x
    .param pmc hll :named('hll') :optional
    .param int has_hll :opt_flag
    if null x goto done
    .local pmc parrotclass
    parrotclass = x
    $S0 = typeof x
    if $S0 == 'Class' goto done
    if $S0 == 'PMCProxy' goto done
    $I0 = isa x, 'String'
    if $I0 goto x_string
    $I0 = isa x, 'NameSpace'
    if $I0 goto x_ns
    $I0 = isa x, 'P6object'
    if $I0 goto x_p6object
    $P0 = typeof x
    .return ($P0)
  x_p6object:
    $P0 = x.'HOW'()
    parrotclass = getattribute $P0, 'parrotclass'
    .return (parrotclass)
  x_string:
    $I0 = isa x, 'P6protoobject'
    if $I0 goto x_p6object
    parrotclass = get_class x
    unless null parrotclass goto done
    $S0 = x
    $P0 = split '::', $S0
    unless has_hll goto no_hll
    unshift $P0, hll
    x = get_root_namespace $P0
    unless null x goto x_ns
    $S0 = shift $P0
  no_hll:
    x = get_hll_namespace $P0
  x_ns:
    if null x goto done
    $I0 = isa x, 'P6protoobject'
    if $I0 goto x_p6object
    parrotclass = get_class x
  done:
    .return (parrotclass)
.end

=back

=head2 P6protoobject

=over 4

=item get_string()

Returns the "shortname" of the protoobject's class and parens.

=cut

.namespace ['P6protoobject']

.sub 'VTABLE_get_string' :method :vtable('get_string')
    $P0 = self.'HOW'()
    $P1 = getattribute $P0, 'longname'
    $S0 = $P1
    $S0 = concat $S0, '()'
    .return ($S0)
.end

=item defined()

Protoobjects are always treated as being undefined.

=cut

.sub 'VTABLE_defined' :method :vtable('defined')
    .return (0)
.end


=item name()

Have protoobjects return their longname in response to a
C<typeof_s_p> opcode.

=cut

.sub 'VTABLE_name' :method :vtable('name')
    $P0 = self.'HOW'()
    $P1 = getattribute $P0, 'longname'
    .return ($P1)
.end


=item new()

Provides a default constructor for creating objects in
the class.

Note that unlike Perl 6, the C<new> method here exists only
in the protoobject and not in the individual instances of
the class.  (If you want all objects in a class to have a
C<new> method, then define one in the class and it
will be used in lieu of this one.)

=cut

.sub 'new' :method
    .local pmc parrotclass
    $P0 = self.'HOW'()
    ##  for speed we access the 'parrotclass' attribute directly here
    parrotclass = getattribute $P0, 'parrotclass'
    $P1 = new parrotclass
    .return ($P1)
.end


=item ACCEPTS(topic)

=cut

.sub 'ACCEPTS' :method
    .param pmc topic
    .local pmc topichow, topicwhat, parrotclass

    $P0 = self.'HOW'()
    parrotclass = $P0.'get_parrotclass'(self)

    # Perl6Object (legacy) and Mu accept anything.
    $S0 = parrotclass
    if $S0 == 'Perl6Object' goto accept
    if $S0 == 'Mu' goto accept

    # Otherwise, just try a normal check.
    $I0 = can topic, 'HOW'
    unless $I0 goto reject
    topicwhat = topic.'WHAT'()
    $I0 = isa topicwhat, parrotclass
    if $I0 goto accept
    $I0 = does topic, parrotclass
    if $I0 goto accept

    # If this fails, and we want Any, and it's something form outside
    # of the Perl 6 world, we'd best just accept it.
    unless $S0 == 'Any' goto reject
    $I0 = isa topicwhat, 'Mu'
    unless $I0 goto accept
  reject:
    $P0 = get_global 'False'
    .return ($P0)

  accept:
    $P0 = get_global 'True'
    .return ($P0)
.end


=back

=head1 AUTHOR

Written and maintained by Patrick R. Michaud, C<< pmichaud at pobox.com >>.
Please send patches, feedback, and suggestions to the parrot-dev mailing
list or to C< parrotbug@parrotcode.org >.

=head1 COPYRIGHT

Copyright (C) 2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
