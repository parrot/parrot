# $Id$

=head1 NAME

P6object - Perl 6-like methods and metaclasses for Parrot

=head1 SYNOPSIS

    .sub 'main'
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

=item onload() :anon :init :load

Initializes the P6object system.  Builds protoobjects for
C<P6object> and C<P6metaclass>.

=cut

.namespace ['P6object']

.sub 'onload' :anon :init :load
    ##  create the %!metaclass hash for parrotclass => metaclass mapping
    $P0 = new 'Hash'
    set_hll_global ['P6metaclass'], '%!metaclass', $P0

    $P0 = newclass 'P6protoobject'

    $P0 = newclass 'P6object'

    $P1 = subclass $P0, 'P6metaclass'
    addattribute $P1, 'parrotclass'
    addattribute $P1, 'protoobject'
    addattribute $P1, 'longname'
    addattribute $P1, 'shortname'

    $P2 = new 'P6metaclass'
    $P2.'register'($P0)
    $P3 = $P2.'register'($P1)
    setattribute $P3, 'protoobject', $P3
.end


=item HOW()

Return the C<P6metaclass> of the invocant.

=cut

.sub 'HOW' :method
    .local pmc parrotclass, mhash, how
    mhash = get_hll_global ['P6metaclass'], '%!metaclass'
    parrotclass = typeof self
    $I0 = get_addr parrotclass
    how = mhash[$I0]
    unless null how goto end
    $S0 = parrotclass
    how = mhash[$S0]
  end:
    .return (how)
.end


=item WHAT()

Return the C<P6protoobject> for the invocant.

=cut

.sub 'WHAT' :method
    .local pmc how, what
    how = self.'HOW'()
    .return how.'WHAT'()
.end


=back

=head2 P6metaclass

=over

=item WHAT()

Return the protoobject for this metaclass.

=cut

.namespace ['P6metaclass']

.sub 'WHAT' :method
    $P0 = getattribute self, 'protoobject'
    .return ($P0)
.end

=item isa(x)

Return a true value if the invocant 'isa' C<x>.

=cut

.sub 'isa' :method
    .param pmc x

    .local pmc parrotclass
    parrotclass = self.'get_parrotclass'(x)
    $P0 = self.'WHAT'()
    $I0 = isa $P0, parrotclass
    .return ($I0)
.end

=item register(parrotclass [, 'name'=>name] [, 'protoobject'=>proto])

Sets objects of type C<parrotclass> to use C<protoobject>,
and verifies that C<parrotclass> has P6object methods defined
on it.  This happens either by setting C<P6object> as a parent
of C<parrotclass>, or by individually composing C<P6object>'s methods
into C<parrotclass>.

The C<name> parameter causes objects to be registered using a name
that differs from the parrotclass name.  This is useful when needing
to map to a class name that already exists in Parrot (e.g., 'Hash'
or 'Object').

=cut

.sub 'register' :method
    .param pmc parrotclass
    .param pmc options         :slurpy :named

    ##  get the true parrotclass
    $I0 = isa parrotclass, 'Class'
    if $I0 goto have_parrotclass
    parrotclass = self.'get_parrotclass'(parrotclass)
  have_parrotclass:

    ##  get the mapping hash
    .local pmc mhash
    mhash = get_hll_global ['P6metaclass'], '%!metaclass'

    ##  make sure parrotclass isa P6object or has P6object methods
    $I0 = isa parrotclass, 'P6object'
    if $I0 goto p6object_done
    $S0 = typeof parrotclass
    if $S0 == 'PMCProxy' goto p6object_proxy
    $P0 = get_class 'P6object'
    parrotclass.'add_parent'($P0)
    goto p6object_done
  p6object_proxy:
    ##  iterate over P6object's methods, adding them to parrotclass' namespace
    .local pmc methods, iter, parrotclassns
    $P0 = get_class 'P6object'
    methods = $P0.'methods'()
    iter = new 'Iterator', methods
    parrotclassns = parrotclass.'get_namespace'()
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    $P0 = parrotclassns.'find_sub'($S0)
    unless null $P0 goto iter_loop
    $P0 = methods[$S0]
    parrotclassns.'add_sub'($S0, $P0)
    goto iter_loop
  iter_end:
  p6object_done:

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

    ##  get the metaclass (how) from :protoobject, or create one
    .local pmc how
    $P0 = options['protoobject']
    if null $P0 goto make_how
    how = $P0.'HOW'()
    goto have_how
  make_how:
    ##  create a metaclass for parrotclass
    how = new 'P6metaclass'
    setattribute how, 'parrotclass', parrotclass

    ##  create an anonymous class for the protoobject
    .local pmc protoclass, protoobject
    protoclass = new 'Class'
    $P0 = get_class 'P6protoobject'
    ##  P6protoobject methods override parrotclass methods...
    protoclass.'add_parent'($P0)
    protoclass.'add_parent'(parrotclass)
    ##  ...except for 'new'
    $P0 = parrotclass.'methods'()
    $P1 = $P0['new']
    if null $P1 goto have_protoclass
    protoclass.'add_method'('new', $P1)
  have_protoclass:
    ##  register the protoclass in %!metaobject
    $I0 = get_addr protoclass
    mhash[$I0] = how
    ##  create the protoobject for parrotclass
    protoobject = new protoclass
    setattribute how, 'protoobject', protoobject

    ##  store the long and short names in the protoobject
    .local pmc longname, shortname
    $S0 = join '::', ns
    longname = new 'String'
    longname = $S0
    shortname = ns[-1]
    setattribute how, 'longname', longname
    setattribute how, 'shortname', shortname

  have_how:
    ##  store the protoobject in appropriate namespace
    protoobject = how.'WHAT'()
    $S0 = pop ns
    set_hll_global ns, $S0, protoobject

    ##  map parrotclass to the metaobject
    $I0 = get_addr parrotclass
    mhash[$I0] = how
    $S0 = parrotclass
    mhash[$S0] = how

    ##  return the protoobject
    .return (protoobject)
.end


=item new_class(name [, 'parent'=>parentclass] [, 'attr'=>attr])

Create a new class called C<name> as a subclass of C<parentclass>.
If C<parentclass> isn't supplied, defaults to using C<P6object>
as the parent.  The C<attr> parameter is a list of attribute names
to be added to the class, specified as either an array or a string
of names separated by spaces.

=cut

.sub 'new_class' :method
    .param string name
    .param pmc options         :slurpy :named

    .local pmc parentclass, parrotclass
    parentclass = options['parent']
    if null parentclass goto parent_p6object
    $I0 = does parentclass, 'array'
    if $I0 goto parent_array
    $S0 = typeof parentclass
    if $S0 == 'String' goto parent_string
    parentclass = self.'get_parrotclass'(parentclass)
    parrotclass = subclass parentclass, name
    goto have_parrotclass
  parent_string:
    $S0 = parentclass
    parentclass = split ' ', $S0
  parent_array:
    .local pmc iter
    parrotclass = newclass name
    iter = new 'Iterator', parentclass
  parent_loop:
    unless iter goto have_parrotclass
    $P0 = shift iter
    unless $P0 goto parent_loop
    $P0 = self.'get_parrotclass'($P0)
    parrotclass.'add_parent'($P0)
    goto parent_loop
  parent_p6object:
    parrotclass = subclass 'P6object', name
  have_parrotclass:

    .local pmc attrlist
    attrlist = options['attr']
    if null attrlist goto attr_done
    $I0 = does attrlist, 'array'
    if $I0 goto have_attrlist
    $S0 = attrlist
    attrlist = split ' ', $S0
  have_attrlist:
    iter = new 'Iterator', attrlist
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    unless $S0 goto iter_loop
    addattribute parrotclass, $S0
    goto iter_loop
  iter_end:
  attr_done:
    .return self.'register'(parrotclass, options :named :flat)
.end


=item get_parrotclass(x)

Multimethod helper to return the parrotclass for C<x>.

=cut

.sub 'get_parrotclass' :method :multi(_,Class)
    .param pmc x
    .return (x)
.end

.sub 'get_parrotclass' :method :multi(_,PMCProxy)
    .param pmc x
    .return (x)
.end

.sub 'get_parrotclass' :method :multi(_,P6metaclass)
    .param pmc x
    $P0 = getattribute x, 'parrotclass'
    .return ($P0)
.end

.sub 'get_parrotclass' :method :multi(_,P6oobject)
    .param pmc x
    $P0 = x.'HOW'()
    $P0 = getattribute $P0, 'parrotclass'
    .return ($P0)
.end

.sub 'get_parrotclass' :method :multi(_,String)
    .param pmc x
    $P0 = get_class x
    .return ($P0)
.end

.sub 'get_parrotclass' :method :multi(_,_)
    .param pmc x
    $P0 = typeof x
    .return ($P0)
.end


=back

=head2 P6protoobject

=over 4

=item get_string()  (vtable method)

Returns the "shortname" of the protoobject's class.

=cut

.namespace ['P6protoobject']

.sub 'VTABLE_get_string' :method :vtable('get_string')
    $P0 = self.'HOW'()
    $P1 = getattribute $P0, 'shortname'
    .return ($P1)
.end

=item defined()  (vtable method)

Protoobjects are always treated as being undefined.

=cut

.sub 'VTABLE_defined' :method :vtable('defined')
    .return (0)
.end


=item name()  (vtable method)

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

=back

=head1 AUTHOR

Written and maintained by Patrick R. Michaud, C<< pmichaud at pobox.com >>.
Please send patches, feedback, and suggestions to the parrot-porters
mailing list or to C< parrotbug@perl.org >.

=head1 COPYRIGHT

Copyright (C) 2008, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

