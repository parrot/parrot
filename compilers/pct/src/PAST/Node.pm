class PAST::Node is PCT::Node;

=NAME PAST - Parrot abstract syntax tree

=begin DESCRIPTION
=head2 PAST::NODE

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

=end DESCRIPTION

=item returns([value])
Accessor method -- sets/returns the return type for the invocant.

method returns($value?) {
    self.attr('returns', $value, pir::defined($value));
}

=item arity([value])
Accessor method -- sets/returns the arity (number of expected arguments)
for the node.

method arity($value?) {
    self.attr('arity', $value, pir::defined($value));
}

=item named([value])
Accessor method -- for named arguments, sets/returns the name to be
associated with the argument.

method named($value?) {
    self.attr('named', $value, pir::defined($value));
}

=item flat([value])
Accessor method -- sets/returns the "flatten" flag on arguments.

method flat($value?) {
    self.attr('flat', $value, pir::defined($value));
}

=item handlers([value])
Accessor method -- sets/returns "handlers"

# TODO: Better description above

method handlers($value?) {
    self.attr('handlers', $value, pir::defined($value));
}


=item lvalue([flag])
Get/set the C<lvalue> attribute, which indicates whether this
variable is being used in an lvalue context.

method lvalue($value?) {
    self.attr('lvalue', $value, pir::defined($value));
}

=item childorder([order])
Get/set the order in which children nodes should be evaluated
(via Compiler::post_children).  If C<order> is 'right' then
children are evaluated last-to-first, otherwise they're
evaluated first-to-last.

method childorder($value?) {
	self.attr('childorder', $value, pir::defined($value));
}

=begin head1
AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=end head1

=begin head1
HISTORY

2011-05-23  Brian Gernhardt converted to NQP
2006-11-20  Patrick Michaud added first draft of POD documentation.
2007-11-21  Re-implementation with pdd26 compliance, compiler toolkit

=end head1

=begin head1
COPYRIGHT

Copyright (C) 2006-2011, Parrot Foundation.

=end head1

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6

