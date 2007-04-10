=head1 NAME

PAST - Parrot abstract syntax tree

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
for compiling programs in Parrot.

=cut

.namespace [ 'PAST' ]

.sub '__onload' :load :init
    load_bytecode 'TGE.pbc'
    $P0 = getclass 'TGE::Grammar'
    $P1 = subclass $P0, 'POST::Grammar'

    ##   create the PAST::Node base class
    ##   XXX: Eventually we want this to be a subclass of
    ##   Capture, but as of now Capture isn't working.
    ##   So, we'll simulate it for now.
    .local pmc base
    load_bytecode 'Parrot/Capture_PIR.pir'
    base = subclass 'Capture_PIR', 'PAST::Node'

    $P0 = subclass base, 'PAST::Op'
    $P0 = subclass base, 'PAST::Stmts'
    $P0 = subclass base, 'PAST::Val'
    $P0 = subclass base, 'PAST::Var'
    $P0 = subclass base, 'PAST::Block'
    $P0 = subclass base, 'PAST::VarList'

    $P0 = new .Integer
    $P0 = 10
    set_hll_global ['PAST::Node'], '$!serno', $P0

    .return ()
.end

=head1 PAST Node types

=head2 PAST::Node

C<PAST::Node> is the base class for all PAST (and POST) nodes.  It's
derived from class C<Capture>, so that it has both array and hash
components.  The array component is used to maintain a node's children,
while the hash component contains the attributes of the node.  In general
we provide and use accessor methods for a node's attributes, instead
of accessing the hash component directly.

Every PAST node predefines C<name>, C<source>, and C<pos> attributes.
The C<name> attribute is the node's name, if any, while C<source>
and C<pos> are used to identify the location in the original source
code for the node.  The C<source> and C<pos> values are generally
set by the C<node> method below.

Other node attributes are generally defined by subclasses of C<PAST::Node>.

=over 4

=item init([child1, child2, ..., ] [attr1=>val1, attr2=>val2, ... ])

Initialize a PAST node with the given children and attributes.
Adds each child to the node (using the C<push> method, below) and
calls the appropriate accessor method for each attribute.

=cut

.namespace [ 'PAST::Node' ]

.sub 'init' :method
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    .local pmc iter
    iter = new .Iterator, children
  children_loop:
    unless iter goto children_end
    $P0 = shift iter
    push self, $P0
    goto children_loop
  children_end:

    iter = new .Iterator, adverbs
  adverbs_loop:
    unless iter goto adverbs_end
    $S0 = shift iter
    $P0 = iter[$S0]
    $P1 = find_method self, $S0
    self.$P1($P0)
    goto adverbs_loop
  adverbs_end:
  end:
    .return ()
.end


=item new(class, [child1, child2, ..., ] [attr1=>val1, attr2=>val2, ...])

Create a new PAST node of type C<class> initialized with the given
children and attributes.  Returns the newly created node.

=cut

.sub 'new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named

    $I0 = find_type class
    $P0 = new $I0
    $P0.'init'(children :flat, 'node'=>self, adverbs :flat :named)
    .return ($P0)
.end


=item push(child)

Add C<child> to the end of the invocant's list of children.

=cut

.sub 'push' :method
    .param pmc value
    push self, value
.end


=item push_new(class, [child1, child2, ..., ] [attr1=>val1, attr2=>val2, ...])

Creates a new PAST node of type C<class>, initializes it with the
given children and attributes, and adds it to the end of the invocant's
array of children.  Returns the newly created PAST node.

=cut

.sub 'push_new' :method
    .param string class
    .param pmc children        :slurpy
    .param pmc adverbs         :slurpy :named
    $P0 = self.'new'(class, children :flat, adverbs :flat :named)
    push self, $P0
    .return ($P0)
.end


=item iterator( )

Returns a newly initialized iterator for the invocant's list of
children.

=cut

.sub 'iterator' :method
    .local pmc iter
    $P0 = self.'get_array'()
    iter = new .Iterator, $P0
    iter = 0
    .return (iter)
.end


=item node([val])

Sets the invocant's C<source> and C<pos> attributes to those
of C<val>.  If C<val> is another PAST node, then C<source> and C<pos>
are simply copied from that node, otherwise C<val> is assumed to be
a C<Match> object and obtains source/position information from that.

=cut

.sub 'node' :method
    .param pmc node
    $I0 = isa node, 'PAST::Node'
    if $I0 goto clone_past
  clone_pge:
    $S0 = node
    $I0 = node.'from'()
    self['source'] = $S0
    self['pos'] = $I0
    .return ()
  clone_past:
    $P0 = node['source']
    $P1 = node['pos']
    self['source'] = $P0
    self['pos'] = $P1
    .return ()
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
    if has_value goto setattr
    value = self[attrname]
    unless null value goto getattr
    value = new .Undef
  getattr:
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


=item escape(STR name)

Returns C<name> in a format that can be compiled by PIR.

=cut

.sub 'escape' :method
    .param string str
    str = escape str
    str = concat '"', str
    str = concat str, '"'
    $I0 = index str, '\x'
    if $I0 >= 0 goto unicode
    $I0 = index str, '\u'
    if $I0 >= 0 goto unicode
    .return (str)
  unicode:
    str = concat 'unicode:', str
    .return (str)
.end


=item name([value])

Accessor method -- sets/returns the C<name> attribute of the invocant.

=cut

.sub 'name' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('name', value, has_value)
.end

.sub 'atype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('atype', value, has_value)
.end

=item compile(code [, adverbs :slurpy :named])

(Deprecated.)  Compile the given PAST tree according to C<adverbs>.

=cut

.sub 'compile'
    .param pmc source
    .param pmc adverbs         :slurpy :named

    $P0 = compreg 'PAST'
    .return $P0.'compile'(source, adverbs :flat :named)
.end


=back

=head2 PAST::Val

C<PAST::Val> nodes represent constant values in the abstract
syntax tree.  The C<name> attribute represents the value of the
node.

=over 4

=item vtype([value])

Get/set the type of the value (as a Parrot class identifier).
For example, a string value might use C<.String>, or an
integer might use a language-specific C<['MyInt']> class.

=cut

.namespace [ 'PAST::Val' ]

.sub 'vtype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('vtype', value, has_value)
.end


=item ctype([value])

Get/set the argument types for which this C<PAST::Val> node may be
rendered directly into PIR code as a Parrot constant instead of
first generating a PMC.  C<value> is a sequence of character
representing the various argument types for which the node's
name is a usable constant:

    i    I registers or int
    n    N register or num
    +    Any numeric argument (int/num)
    s    S register or string
    ~    Any string argument

If C<ctype> isn't set, then the PAST::Val node always results in
a newly generated PMC initialized with the node's name.

=cut

.sub 'ctype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('ctype', value, has_value)
.end


=back

=head2 PAST::Var

C<PAST::Var> nodes represent variables within the abstract
syntax tree.  The variable name (if any) is given as the node's
C<name> attribute.

=over 4

=item scope([value])

Get/set the PAST::Var node's "scope" (i.e., how the variable
is accessed or set).  Allowable values include "package", "lexical",
"parameter", and "keyed", representing HLL global, lexical, block
parameter, and array/hash variables respectively.

=cut

.namespace [ 'PAST::Var' ]

.sub 'scope' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('scope', value, has_value)
.end


=item ismy([flag])

Get/set the node's C<ismy> attribute (for lexical variables) to C<flag>.
A true value of C<ismy> indicates that the variable given by
this node is to be created within the current lexical scope.
Otherwise, the node refers to a lexical variable from an outer scope.

=cut

.sub 'ismy' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('ismy', value, has_value)
.end

=item isslurpy([flag])

Get/set the node's C<isslurpy> attribute (for parameter variables) to C<flag>.
A true value of C<isslurpy> indicates that the parameter variable given by this
node is to be created as a slurpy parameter (consuming all remaining arguments
passed in).

=cut

.sub 'isslurpy' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('isslurpy', value, has_value)
.end


=item viviself([type])

If the variable needs to be instantiated, then C<type> indicates
either the type of the value to create for the node or (future
implementation) a PAST tree to create the value.

=cut

.sub 'viviself' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('viviself', value, has_value)
.end


=item islvalue([flag])

Get/set the C<islvalue> attribute, which indicates whether this
variable is being used in an lvalue context.

=cut

.sub 'islvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('islvalue', value, has_value)
.end


=item bindvalue([value])

Private PAST attribute that indicates the value to be bound to this
variable at runtime (e.g., for binding or assignment).

=cut

.sub 'bindvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('bindvalue', value, has_value)
.end

=back

=head2 PAST::Op

C<PAST::Op> nodes represent the operations in an abstract syntax
tree.  The primary function of the node is given by its C<pasttype>,
secondary functions may be given by the node's C<name>, C<pirop>,
or other attributes.

=over 4

=item pasttype([type])

A C<PAST::Op> node's C<pasttype> determines the type of operation to
be performed.  Predefined values of C<pasttype> are:

assign     - Copy the value of the node's second child into
             the variable expression given by its first child.

bind       - Bind the variable given by the node's first child
             to the value given by its second child.

if         - Evaluate the first child; if the first child is
             true then evaluate the second child (if any)
             otherwise evaluate the third child (if any).
             If either the second or third child are missing,
             then they evaluate as the result of the first child.

unless     - Same as 'if' above, but reverse the evaluation
             of the second and third children nodes.

while      - Evaluate the first child, if the result is
             true then evaluate the second child and repeat.

until      - Evaluate the first child, if the result is
             false then evaluate the second child and repeat.

call       - Call a subroutine, passing the results of any
             child nodes as arguments.  The subroutine to be
             called is given by the node's C<name> attribute,
             if the node has no C<name> attribute then the
             first child is assumed to evaluate to a callable
             sub.

pirop      - Execute the named PIR opcode, passing the results
             of any children nodes as arguments.

inline     - Execute the sequence of PIR statements given
             by the node's C<inline> attribute (a string).
             See the C<inline> method below for details.

callmethod - Invokes a method on an object, using children
             nodes as arguments.  If the node has a C<name>
             attribute, then the first child is the invocant
             and any remaining children are arguments.  If
             the node doesn't have a C<name> attribute, then
             the first child evaluates to the method to be
             called, the second child is the invocant, and
             the remaining children are arguments to the method call.

try        - (preliminary) Execute the code given by the first 
             child, and if any exceptions occur then handle them 
             using the code given by the second child.

If a node doesn't have a value set for C<pasttype>, then it
assumes "pirop" if its C<pirop> attribute is set, otherwise it
assumes "call".

=cut

.namespace [ 'PAST::Op' ]

.sub 'pasttype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pasttype', value, has_value)
.end


=item pirop([opcode])

Get/set the PIR opcode to be executed for this node.  The PAST
implementation knows about the argument types for many of the
PIR opcodes, and will try to automatically convert the results
of any children nodes into the correct types if needed.  (In
general, the implementation tries to convert things to PMCs
whenever it isn't certain what else to do.)  The table of
PIR opcodes that PAST "knows" about is in F<POST.pir>.

=cut

.sub 'pirop' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pirop', value, has_value)
.end


=item returns([type])

Get/set the return type for this operation.  Some operations
require creation of a temporary value to receive the result
value, the C<returns> attribute identifies the type of the
result (default is C<.Undef> if not set).

=cut

.sub 'returns' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('returns', value, has_value)
.end


=item islvalue([flag])

Get/set whether this node is an lvalue, or treats its first
child as an lvalue (e.g., for assignment).

=cut

.sub 'islvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('islvalue', value, has_value)
.end

=item inline([STRING code])

Get/set the code to be used for inline PIR when C<pasttype> is
"inline".  The C<code> argument is PIR text to be inserted in
the final generated code sequence.  Sequences of "%0", "%1",
"%2", ... "%9" in C<code> are replaced with the evaluated
results of the first, second, third, ..., tenth children nodes.
(If you need more than ten arguments to your inline PIR, consider
making it a subroutine call instead.)

The register to hold the result of the inline PIR operation is
given by "%r", "%t", or "%u" in the C<code> string:

  %r   - Generate a unique PMC register for the result.
  %t   - Generate a unique PMC register for the result,
         and initialize it with an object of type C<returns>
         before the execution of the inline PIR.
  %u   - Re-use the first child's PMC (%0) if it's a temporary
         result, otherwise same as %t above.
  %v   - (void) Re-use the first child's PMC (%0) as the result
         of this operation.

=cut

.sub 'inline' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('inline', value, has_value)
.end

=back

=head2 PAST::Block

C<PAST::Block> nodes represent lexical scopes within an abstract
syntax tree, and roughly translate to individual Parrot subroutines.
A C<PAST::Block> node nested within another C<PAST::Block> node
acts like a nested lexical scope.

If the block has a C<name> attribute, that becomes the name of
the resulting Parrot sub, otherwise a unique name is automatically
generated for the block.

=over 4

=item blocktype([STRING type])

Get/set the type of the block.  The currently understood values
are 'declaration' and 'immediate'.  'Declaration' indicates
that a block is simply being defined at this point, while
'immediate' indicates a block that is to be immediately
executed when it is evaluated in the AST (e.g., the immediate
blocks in Perl6 C<if>, C<while>, and other similar statements).

=cut

.namespace [ 'PAST::Block' ]

.sub 'blocktype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('blocktype', value, has_value)
.end


=item symtable([value])

Get/set the symbol table for the block.  In the current implementation,
the data structure for the symbol table is left entirely up to the
caller; PAST doesn't use C<symtable> for any code generation.

=cut

.sub 'symtable' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('symtable', value, has_value)
.end


=item compiler([name])

Indicate that the children nodes of this block are to be 
compiled using compiler C<name> instead of the standard 
PAST compiler.

=cut

.sub 'compiler' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('compiler', value, has_value)
.end


=item pragma([pragma])

Get/set any pragmas (PIR) for this block.

=cut

.sub 'pragma' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('pragma', value, has_value)
.end


.namespace [ 'PAST::VarList' ]

.sub 'bindvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .return self.'attr'('bindvalue', value, has_value)
.end


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2006-11-20  Patrick Michaud added first draft of POD documentation.

=head1 COPYRIGHT

Copyright (C) 2006, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
