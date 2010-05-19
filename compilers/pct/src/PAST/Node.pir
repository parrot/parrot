# $Id$

=head1 NAME

PAST - Parrot abstract syntax tree

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
for compiling programs in Parrot.

=cut

.namespace [ 'PAST';'Node' ]

.sub 'onload' :anon :load :init
    ##   create the PAST::Node base class
    .local pmc p6meta, base
    p6meta = new 'P6metaclass'
    base = p6meta.'new_class'('PAST::Node', 'parent'=>'PCT::Node')

    p6meta.'new_class'('PAST::Op', 'parent'=>base)
    p6meta.'new_class'('PAST::Stmts', 'parent'=>base)
    p6meta.'new_class'('PAST::Val', 'parent'=>base)
    p6meta.'new_class'('PAST::Var', 'parent'=>base)
    p6meta.'new_class'('PAST::Block', 'parent'=>base)
    p6meta.'new_class'('PAST::Control', 'parent'=>base)
    p6meta.'new_class'('PAST::VarList', 'parent'=>base)

    .return ()
.end

=head1 PAST Node types

=head2 PAST::Node

C<PAST::Node> is the base class for all PAST nodes, and is
derived from PCT::Node.  A node has an array component to
hold its children, and a hash component for its attributes.
However, we tend to use accessor methods for accessing the node's
attributes instead of accessing the hash directly.

Every PAST node inherits C<name>, C<source>, and C<pos> attributes
from C<PCT::Node>.  The C<name> attribute is the node's name, if
any, while C<source> and C<pos> are used to identify the location
in the original source code for the node.  The C<source> and C<pos>
values are generally set by the C<node> method inherited from
C<PCT::Node>.

Other node attributes are generally defined by subclasses of C<PAST::Node>.

=over 4

=item returns([value])

Accessor method -- sets/returns the return type for the invocant.

=cut

.sub 'returns' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('returns', value, has_value)
.end


=item arity([value])

Accessor method -- sets/returns the arity (number of expected arguments)
for the node.

=cut

.sub 'arity' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('arity', value, has_value)
.end


=item named([value])

Accessor method -- for named arguments, sets/returns the name to be
associated with the argument.

=cut

.sub 'named' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('named', value, has_value)
.end


=item flat([value])

Accessor method -- sets/returns the "flatten" flag on arguments.

=cut

.sub 'flat' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('flat', value, has_value)
.end

.sub 'handlers' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('handlers', value, has_value)
.end


=item lvalue([flag])

Get/set the C<lvalue> attribute, which indicates whether this
variable is being used in an lvalue context.

=cut

.sub 'lvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('lvalue', value, has_value)
.end


=back

=head2 PAST::Val

C<PAST::Val> nodes represent constant values in the abstract
syntax tree.  The C<name> attribute represents the value of the
node.

=over 4

=item value([value])

Get/set the constant value for this node.

=cut

.namespace [ 'PAST';'Val' ]

.sub 'value' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('value', value, has_value)
.end

=item lvalue([value])

Throw an exception if we try to make a PAST::Val into an lvalue.

=cut

.sub 'lvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    unless has_value goto normal
    unless value goto normal
    die "Unable to set lvalue on PAST::Val node"
  normal:
    .tailcall self.'attr'('lvalue', value, has_value)
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
"parameter", "keyed", "attribute" and "register", representing
HLL global, lexical, block parameter, array/hash variables, object
members and (optionally named) Parrot registers respectively.

=cut

.namespace [ 'PAST';'Var' ]

.sub 'scope' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('scope', value, has_value)
.end


=item isdecl([flag])

Get/set the node's C<isdecl> attribute (for lexical variables) to C<flag>.
A true value of C<isdecl> indicates that the variable given by
this node is to be created within the current lexical scope.
Otherwise, the node refers to a lexical variable from an outer scope.

=cut

.sub 'isdecl' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('isdecl', value, has_value)
.end


=item namespace([namespace])

Get/set the variable's namespace attribute to the array of strings
given by C<namespace>.  Useful only for variables with a C<scope>
of 'package'.

=cut

.sub 'namespace' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('namespace', value, has_value)
.end


=item slurpy([flag])

Get/set the node's C<slurpy> attribute (for parameter variables) to C<flag>.
A true value of C<slurpy> indicates that the parameter variable given by this
node is to be created as a slurpy parameter (consuming all remaining arguments
passed in).

=cut

.sub 'slurpy' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('slurpy', value, has_value)
.end


=item call_sig([flag])

Get/set the node's C<call_sig> attribute (for parameter variables) to C<flag>.
A true value of C<call_sig> indicates that the parameter variable given by this
node is to be created as a C<:call_sig> parameter. If you use this, it should be
the only parameter.

=cut

.sub 'call_sig' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('call_sig', value, has_value)
.end


=item viviself([type])

If the variable needs to be instantiated, then C<type> indicates
either the type of the value to create for the node or (future
implementation) a PAST tree to create the value.

=cut

.sub 'viviself' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('viviself', value, has_value)
.end


=item vivibase([type])

For keyed nodes, C<type> indicates the type of aggregate to
create for the base if the base doesn't specify its own 'viviself'
attribute.

=cut

.sub 'vivibase' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('vivibase', value, has_value)
.end

=item multitype([type])

Get/set MMD type of Var when used as parameter of Block.

=cut

.sub 'multitype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('multitype', value, has_value)
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

for        - Iterate over the first child. For each element,
             invoke the sub in the second child, passing the
             element as the only parameter.

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

.namespace [ 'PAST';'Op' ]

.sub 'pasttype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pasttype', value, has_value)
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
    .tailcall self.'attr'('pirop', value, has_value)
.end


=item lvalue([flag])

Get/set whether this node is an lvalue, or treats its first
child as an lvalue (e.g., for assignment).

=cut

.sub 'lvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('lvalue', value, has_value)
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
    .tailcall self.'attr'('inline', value, has_value)
.end


=item opattr(hash)

Set a variety of C<PAST::Op> attributes based on entries
in C<hash>.  Typically C<hash> is an entry in the operator
precedence table, and the attributes being set correspond
to traits in the grammar.

=cut

.sub 'opattr' :method
    .param pmc hash

    $P0 = split ' ', "pasttype pirop inline lvalue"
    $P1 = iter $P0
  iter_loop:
    unless $P1 goto iter_end
    $S0 = shift $P1
    $P2 = hash[$S0]
    if null $P2 goto iter_loop
    $P3 = find_method self, $S0
    self.$P3($P2)
    goto iter_loop
  iter_end:
.end


=back

=head2 PAST::Stmts

C<PAST::Stmts> is a container of C<PAST::Node> without any specific methods.

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
are 'declaration', 'immediate', and 'method'.  'Declaration' indicates
that a block is simply being defined at this point, while
'immediate' indicates a block that is to be immediately
executed when it is evaluated in the AST (e.g., the immediate
blocks in Perl6 C<if>, C<while>, and other similar statements).

=cut

.namespace [ 'PAST';'Block' ]

.sub 'blocktype' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('blocktype', value, has_value)
.end


=item closure([value])

Get/set the closure flag for the block to C<value>.  If set,
any block reference returned by the node is to a clone of the
block that has captured the current lexical context.

=cut

.sub 'closure' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('closure', value, has_value)
.end


=item control([value])

Get/set the control exception handler for this block to C<value>.
The exception handler can be any PAST tree.  The special (string)
value "return_pir" generates code to handle C<CONTROL_RETURN> exceptions.

=cut

.sub 'control' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('control', value, has_value)
.end


=item loadinit([past])

Get/set the "load initializer" for this block to C<past>.
The load initializer is a set of operations to be performed
as soon as the block is compiled/loaded.  For convenience,
requests to C<loadinit> autovivify an empty C<PAST::Stmts>
node if one does not already exist.

Within the load initializer, the C<block> PMC register is
automatically initialized to refer to the block itself
(to enable attaching properties, adding the block as a method,
storing in a symbol table, etc.).

=cut

.sub 'loadinit' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    if has_value goto getset_value
    $I0 = exists self['loadinit']
    if $I0 goto getset_value
    $P0 = get_hll_global ['PAST'], 'Stmts'
    value = $P0.'new'()
    has_value = 1
  getset_value:
    .tailcall self.'attr'('loadinit', value, has_value)
.end


=item namespace([namespace])

Get/set the namespace for this block.  The C<namespace> argument
can be either a string or an array of strings.

=cut

.sub 'namespace' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('namespace', value, has_value)
.end

=item multi([multi])

Get/set the multi signature for this block.  The C<multi> argument
can be either a string or an array of strings.

=cut

.sub 'multi' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('multi', value, has_value)
.end


=item hll([hll])

Get/set the C<hll> for this block.

=cut

.sub 'hll' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('hll', value, has_value)
.end


=item nsentry([nsentry])

Get/set the C<nsentry> for this block.

=cut

.sub 'nsentry' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('nsentry', value, has_value)
.end


=item symbol(name [, attr1 => val1, attr2 => val2, ...])

If called with named arguments, sets the symbol hash corresponding
to C<name> in the current block.  The HLL is free to select
any symbol attributes desired, although the 'scope' attribute
is typically used to assist with lexical scoping of PAST::Var
nodes.

If no named arguments are given, returns the current
attribute hash for symbol C<name>.

=cut

.sub 'symbol' :method
    .param string name
    .param pmc attr            :slurpy :named
    .local pmc symtable
    symtable = self['symtable']
    unless null symtable goto have_symtable
    symtable = new 'Hash'
    self['symtable'] = symtable
  have_symtable:
    .local pmc symbol
    symbol = symtable[name]
    if null symbol goto symbol_empty
    unless attr goto attr_done
    .local pmc it
    it = iter attr
  attr_loop:
    unless it goto attr_done
    $S0 = shift it
    $P0 = attr[$S0]
    symbol[$S0] = $P0
    goto attr_loop
  attr_done:
    .return (symbol)
  symbol_empty:
    unless attr goto symbol_done
    symtable[name] = attr
  symbol_done:
    .return (attr)
.end


=item symbol_defaults([attr1 => val1, attr2 => val2, ... ])

Set default attributes for non-existent symbols in the
symbol hash (see C<symbol> above).  If no named arguments
are given, returns the default attribute hash itself.

Currently we just use the '' entry of the symbol hash to
store the default attributes, but it's probably not safe
to rely on this behavior in the future.

=cut

.sub 'symbol_defaults' :method
    .param pmc attr            :slurpy :named
    .tailcall self.'symbol'('', attr :flat :named)
.end


=item symtable([value])

Get/set the symbol table for the block.  May be deprecated in
favor of the C<symbol> method above.

=cut

.sub 'symtable' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('symtable', value, has_value)
.end


=item lexical([flag])

Get/set whether the block is lexically nested within
the block that contains it.

=cut

.sub 'lexical' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('lexical', value, has_value, 1)
.end


=item compiler([name])

Indicate that the children nodes of this block are to be
compiled using compiler C<name> instead of the standard
PAST compiler.

=cut

.sub 'compiler' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('compiler', value, has_value)
.end

=item compiler_args()

Specify named arguments to be passed to the compiler set
through the compiler attribute. Not used if compiler is
not set.

=cut

.sub 'compiler_args' :method
    .param pmc value           :named :slurpy
    .local int have_value
    have_value = elements value
    .tailcall self.'attr'('compiler_args', value, have_value)
.end

=item subid([subid])

If C<subid> is provided, then sets the subid for this block.
Returns the current subid for the block, generating a unique
subid for the block if one does not already exist.

=cut

.sub 'subid' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    if has_value goto getset_value
    $I0 = exists self['subid']
    if $I0 goto getset_value
    value = self.'unique'()
    .local pmc suffix
    suffix = get_global '$!subid_suffix'
    unless null suffix goto have_suffix
    $N0 = time
    $S0 = $N0
    $S0 = concat '_', $S0
    suffix = box $S0
    set_global '$!subid_suffix', suffix
  have_suffix:
    value .= suffix
    has_value = 1
  getset_value:
    .tailcall self.'attr'('subid', value, has_value)
.end


=item pirflags([pirflags])

Get/set any pirflags for this block.

=cut

.sub 'pirflags' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pirflags', value, has_value)
.end


.namespace [ 'PAST';'Control' ]

.sub 'handle_types' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('handle_types', value, has_value)
.end

.sub 'handle_types_except' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('handle_types_except', value, has_value)
.end


.namespace [ 'PAST';'VarList' ]

.sub 'bindvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('bindvalue', value, has_value)
.end


=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=head1 HISTORY

2006-11-20  Patrick Michaud added first draft of POD documentation.
2007-11-21  Re-implementation with pdd26 compliance, compiler toolkit

=head1 COPYRIGHT

Copyright (C) 2006-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
