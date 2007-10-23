=head1 TITLE

Protoobject.pir - PIR implementation for creating protoobjects

=head1 SYNOPSIS

    load_bytecode 'Protoobject.pbc'
    .local pmc protomaker, fooclass, fooproto

    # create a protoobject for class Foo
    protomaker = new 'Protomaker'
    fooclass = get_class 'Foo'
    fooproto = protoobj.'new_proto'(fooclass)

    # create a subclass 'NS::Bar' from 'Foo' with attributes
    .local pmc barclass, barproto
    protoobj = new 'Protomaker'
    fooclass = get_class 'Foo'
    (barclass, barproto) = protoobj.'new_subclass'(fooclass, 'NS::Bar', '$attr')

=head1 DESCRIPTION

Objects of class C<Protomaker> are used to construct and initialize
"protoobjects" for Parrot classes.  The concept of protoobjects
comes from Perl 6; I<protoobjects> are "empty" instances of a class --
i.e., they are instances that are simply more undefined than a
normal instance.

Newly created protoobjects are automatically added as symbols in
a corresponding namespace -- for example, the protoobject for
C<Foo::Bar::Baz> is automatically entered as the 'Baz' symbol
in the C<['Foo';'Bar']> namespace.

=head2 Methods

=over 4

=item new_proto(class)

Create and initialize a new protoobject for C<class>.
The newly created protoobject is placed as an entry in
the appropriate namespace and returned.

=cut

.namespace [ 'Protomaker' ]

.sub '__onload' :init :load
    $P0 = newclass 'Protomaker'
    $P1 = new 'Protomaker'
    $P1.'new_proto'($P0)
.end


.sub 'new_proto' :method
    .param pmc class

    #  create a protoobject
    .local pmc protoobject
    protoobject = new class

    #  now, store the protoobject into the appropriate namespace
    #  split class into namespace components
    .local pmc ns
    .local string basename
    $S0 = class
    ns = split ';', $S0
    basename = pop ns
    if ns goto have_ns
    #  If we didn't find a separate namespace, perhaps it's a
    #  (legacy) double-colon separated classname
    ns = split '::', basename
    basename = pop ns
  have_ns:

    set_hll_global ns, basename, protoobject
    .return (protoobject)
.end


=item new_subclass(baseclass, name [, attr1, attr2, ...] )

Helper method to create subclasses and their corresponding
protoobjects as a single method call.  This method creates
a subclass of C<baseclass> with the given C<name>, adds
attributes C<attr1>, C<attr2>, etc. to the subclass, and
then creates a corresponding protoobject for the subclass.

The C<name> parameter is either an array of strings or a
string with namespace identifiers separated by double colons (C<::>).

The method returns the subclass object and its corresponding
protoobject.

=cut

.sub 'new_subclass' :method
    .param pmc baseclass
    .param pmc name
    .param pmc attrs           :slurpy

    .local pmc subc
    subc = subclass baseclass, name

    unless attrs goto done_attrs
    .local pmc iter
    iter = new 'Iterator', attrs
  iter_loop:
    unless iter goto done_attrs
    $S0 = shift attrs
    addattribute subc, $S0
    goto iter_loop
  done_attrs:

    .local pmc subp
    subp = self.'new_proto'(subc)
    .return (subc, subp)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

