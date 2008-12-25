=head1 NAME

NCIGENAST - NCIGEN abstract syntax tree

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
for doing syntax analysis on c99 programs.

=cut

.namespace [ 'NCIGENAST';'Node' ]

.sub 'onload' :anon :load :init
    ##   create the NCIGENAST::Node base class
    .local pmc p6meta, base, vardecl
    p6meta = new 'P6metaclass'
    base = p6meta.'new_class'('NCIGENAST::Node', 'parent'=>'PCT::Node')

    vardecl = p6meta.'new_class'('NCIGENAST::VarDecl', 'parent'=>base)
    p6meta.'new_class'('NCIGENAST::Decls',     'parent'=>base)

    p6meta.'new_class'('NCIGENAST::TypeDef',   'parent'=>vardecl)
    p6meta.'new_class'('NCIGENAST::FuncDecl',  'parent'=>vardecl)
    p6meta.'new_class'('NCIGENAST::Param',     'parent'=>vardecl)
    p6meta.'new_class'('NCIGENAST::Struct',    'parent'=>vardecl)
    p6meta.'new_class'('NCIGENAST::Union',     'parent'=>vardecl)

    .return ()
.end

.sub 'clone' :method
    $P0 = clone self
    .return ($P0)
.end

.sub 'item' :method
    .return (self)
.end

=head1 NCIGENAST Node types

=head2 NCIGENAST::Node

C<NCIGENAST::Node> is the base class for all NCIGENAST nodes, and is
derived from PCT::Node.  A node has an array component to
hold its children, and a hash component for its attributes.
However, we tend to use accessor methods for accessing the node's
attributes instead of accessing the hash directly.

Every NCIGENAST node inherits C<name>, C<source>, and C<pos> attributes
from C<PCT::Node>.  The C<name> attribute is the node's name, if
any, while C<source> and C<pos> are used to identify the location
in the original source code for the node.  The C<source> and C<pos>
values are generally set by the C<node> method inherited from
C<PCT::Node>.

Other node attributes are generally defined by subclasses of C<NCIGENAST::Node>.

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


=item flat([value]

Accessor method -- sets/returns the "flatten" flag on arguments.

=cut

.sub 'flat' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('flat', value, has_value)
.end


=back

=head2 NCIGENAST::TypeDef

C<NCIGENAST::Val> nodes represent constant values in the abstract
syntax tree.  The C<name> attribute represents the value of the
node.

=over 4

=item value([value])

Get/set the constant value for this node.

=cut

.namespace [ 'NCIGENAST';'TypeDef' ]

.sub 'value' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('value', value, has_value)
.end

=back

=head2 NCIGENAST::Var

C<NCIGENAST::Var> nodes represent variables within the abstract
syntax tree.  The variable name (if any) is given as the node's
C<name> attribute.

=over 4

=item scope([value])

Get/set the NCIGENAST::Var node's "scope" (i.e., how the variable
is accessed or set).  Allowable values include "package", "lexical",
"parameter", and "keyed", representing HLL global, lexical, block
parameter, and array/hash variables respectively.

=cut

.namespace [ 'NCIGENAST';'VarDecl' ]

.sub 'source' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('source', value, has_value)
.end

.sub 'type' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('type', value, has_value)
.end

.sub 'extern' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('extern', value, has_value)
.end

.sub 'pointer' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pointer', value, has_value)
.end

.sub 'builtin_type' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('builtin_type', value, has_value)
.end

.sub 'complex' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('complex', value, has_value)
.end

.sub 'primitive_type' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('primitive_type', value, has_value)
.end

.sub 'pointer_cnt' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('pointer_cnt', value, has_value)
.end

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


=item lvalue([flag])

Get/set the C<lvalue> attribute, which indicates whether this
variable is being used in an lvalue context.

=cut

.sub 'lvalue' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .tailcall self.'attr'('lvalue', value, has_value)
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


=item viviself([type])

If the variable needs to be instantiated, then C<type> indicates
either the type of the value to create for the node or (future
implementation) a NCIGENAST tree to create the value.

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


=back

=head2 NCIGENAST::Op

C<NCIGENAST::Op> nodes represent the operations in an abstract syntax
tree.  The primary function of the node is given by its C<pasttype>,
secondary functions may be given by the node's C<name>, C<pirop>,
or other attributes.


=head1 HISTORY


=head1 COPYRIGHT

Copyright (C) 2006-2008, The Perl Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
