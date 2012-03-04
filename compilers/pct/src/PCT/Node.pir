
=head1 NAME

PCT::Node - base class for PAST and POST nodes

=head1 DESCRIPTION

This file implements the base class for abstract syntax tree (PAST)
and opcode syntax tree (POST) nodes in the Parrot Compiler Toolkit.

=cut

.namespace [ 'PCT';'Node' ]

.sub 'onload' :anon :tag('load') :tag('init')
    ##   create the PCT::Node base class
    .local pmc p6meta
    p6meta = new 'P6metaclass'
    p6meta.'new_class'('PCT::Node', 'parent'=>'Capture')

    $P0 = box 10
    set_hll_global ['PCT';'Node'], '$!serno', $P0

    .return ()
.end

=head1 PCT::Node

C<PCT::Node> is the base class for all PAST and POST nodes.  It's
derived from class C<Capture>, so that it has both array and hash
components.  The array component is used to maintain a node's children,
while the hash component contains the attributes of the node.  In general
we provide and use accessor methods for a node's attributes, instead
of accessing the hash component directly.

Every PAST/POST node has C<name>, C<source>, and C<pos> attributes.
The C<name> attribute is the node's name, if any, while C<source>
and C<pos> are used to identify the location in the original source
code for the node.  The C<source> and C<pos> values are generally
set by the C<node> method below.

Other node attributes are generally defined by subclasses of C<PCT::Node>.

=over 4

=item init([child1, child2, ..., ] [attr1=>val1, attr2=>val2, ... ])

Initialize a node with the given children and attributes.
Adds each child to the node (using the C<append> method, below) and
calls the appropriate accessor method for each attribute.
And returns the node.

=cut

.sub 'init' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    $I0 = elements children
    unless $I0 goto children_end
    $P0 = self.'list'()
    $P0.'append'(children)
  children_end:

    .local pmc it
    it = iter adverbs
  adverbs_loop:
    unless it goto adverbs_end
    $S0 = shift it
    $P0 = it[$S0]
    $P1 = find_method self, $S0
    self.$P1($P0)
    goto adverbs_loop
  adverbs_end:
    .return (self)
.end


=item new([child1, child2, ..., ] [attr1=>val1, attr2=>val2, ...])

Create a new PAST node of initialized with the given
children and attributes.  Returns the newly created node.

=cut

.sub 'new' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    $P0 = self.'HOW'()
    $P0 = getattribute $P0, 'parrotclass'
    $P1 = new $P0
    $P1.'init'(children :flat, adverbs :flat :named)
    .return ($P1)
.end


=item clone()

Clone the node.

=cut

.sub 'clone' :method
    $P0 = clone self
    .return ($P0)
.end


=item unshift(child)

Add C<child> to the beginning of the invocant's list of children.

=item shift()

Remove the first child from the invocant's list of children.
Returns the child.

=item push(child)

Add C<child> to the end of the invocant's list of children.

=item pop()

Remove the last child from the invocant's list of children.
Returns the child.

=cut

.sub 'unshift' :method
    .param pmc value
    unshift self, value
.end

.sub 'shift' :method
    $P0 = shift self
    .return ($P0)
.end

.sub 'push' :method
    .param pmc value
    push self, value
.end

.sub 'pop' :method
    $P0 = pop self
    .return ($P0)
.end


=item push_new(class, [child1, child2, ..., ] [attr1=>val1, attr2=>val2, ...])

(Deprecated.)  Creates a new node of type C<class>, initializes it with the
given children and attributes, and adds it to the end of the invocant's
array of children.  Returns the newly created node.

=cut

.sub 'push_new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named
    $P0 = split '::', class
    $P0 = new $P0
    $P0.'init'(children :flat, adverbs :flat :named)
    push self, $P0
    .return ($P0)
.end


=item iterator( )

Returns a newly initialized iterator for the invocant's list of
children.

=cut

.sub 'iterator' :method
    .local pmc it
    $P0 = self.'list'()
    it = iter $P0
    .return (it)
.end


=item node([val])

Sets the invocant's C<source> and C<pos> attributes to those
of C<val>.  If C<val> is another PAST node, then C<source> and C<pos>
are simply copied from that node, otherwise C<val> is assumed to be
a C<Match> object and obtains source/position information from that.

=cut

.sub 'node' :method
    .param pmc node

    if null node goto done
    $I0 = isa node, ['PGE';'Match']
    if $I0 goto node_match
    $I0 = isa node, ['PCT';'Node']
    if $I0 goto node_pct
  node_misc:
    $I0 = can node, 'orig'
    unless $I0 goto err_unknown
    $I0 = can node, 'from'
    unless $I0 goto err_unknown
    .local pmc source, pos
    source = node.'orig'()
    pos = node.'from'()
    goto node_done
  node_match:
    source = getattribute node, '$.target'
    pos    = node.'from'()
    goto node_done
  node_pct:
    source = node['source']
    pos    = node['pos']
  node_done:
    self['source'] = source
    self['pos']    = pos
  done:
    .return ()

  err_unknown:
    $S0 = typeof node
    $S0 = concat "Don't know how to save info from node of type ", $S0
    die $S0
.end


=item name([value])

Accessor method -- sets/returns the C<name> attribute of the invocant.

=cut

.sub 'name' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('name', value, has_value)
.end


=item attr(STR attrname, PMC value, INT has_value)

Helper method for accessors.  If C<has_value> is true then set
the invocant's value of C<attrname> to C<value>.  Returns the
(resulting) value of C<attrname> in the invocant.

=cut

.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int has_value
    .param pmc default         :optional
    .param int has_default     :opt_flag
    if has_value goto setattr
    value = self[attrname]
    unless null value goto value_done
    unless has_default goto value_undef
    .return (default)
  value_undef:
    value = new 'Undef'
  value_done:
    .return (value)
  setattr:
    self[attrname] = value
    .return (value)
.end


=item unique([STR fmt])

Generate a unique number that can be used as an identifier.
If C<fmt> is provided, then it will be used as a prefix to the
unique number.

=cut

.sub 'unique' :method
    .param string fmt          :optional
    .param int has_fmt         :opt_flag

    if has_fmt goto unique_1
    fmt = ''
  unique_1:
    $P0 = get_global '$!serno'
    $S0 = $P0
    $S0 = concat fmt, $S0
    inc $P0
    .return ($S0)
.end


=item isa([type])

Ask the current object's metaclass if C<self> is a C<type>, through its C<isa>
method. If so, return 1, else return 0.

=cut

.sub 'isa' :method
    .param pmc type
    $P0 = self.'HOW'()
    $I0 = $P0.'isa'(self, type)
    .return ($I0)
.end


=item VTABLE get_bool()

Return true since the node is defined.

=cut

.sub '' :vtable('get_bool') :method
    .return (1)
.end


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2006-11-20  Patrick Michaud added first draft of POD documentation.
2007-11-21  Re-implementation with pdd26 compliance, compiler toolkit
2007-12-07  Refactor PAST::Node into separate PCT::Node component.

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
