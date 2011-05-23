class PAST::Var is PAST::Node;

=NAME PAST::Var

=for DESCRIPTION
C<PAST::Var> nodes represent variables within the abstract
syntax tree.  The variable name (if any) is given as the node's
C<name> attribute.

=item scope([value])
Get/set the PAST::Var node's "scope" (i.e., how the variable
is accessed or set).  Allowable values include "package", "lexical",
"parameter", "keyed", "attribute" and "register", representing
HLL global, lexical, block parameter, array/hash variables, object
members and (optionally named) Parrot registers respectively.

method scope($value?) {
    self.attr('scope', $value, pir::defined($value));
}


=item isdecl([flag])
Get/set the node's C<isdecl> attribute (for lexical variables) to C<flag>.
A true value of C<isdecl> indicates that the variable given by
this node is to be created within the current lexical scope.
Otherwise, the node refers to a lexical variable from an outer scope.

method isdecl($value?) {
    self.attr('isdecl', $value, pir::defined($value));
}


=item namespace([namespace])
Get/set the variable's namespace attribute to the array of strings
given by C<namespace>.  Useful only for variables with a C<scope>
of 'package'.

method namespace($value?) {
    self.attr('namespace', $value, pir::defined($value));
}


=item slurpy([flag])
Get/set the node's C<slurpy> attribute (for parameter variables) to C<flag>.
A true value of C<slurpy> indicates that the parameter variable given by this
node is to be created as a slurpy parameter (consuming all remaining arguments
passed in).

method slurpy($value?) {
    self.attr('slurpy', $value, pir::defined($value));
}


=item call_sig([flag])
Get/set the node's C<call_sig> attribute (for parameter variables) to C<flag>.
A true value of C<call_sig> indicates that the parameter variable given by this
node is to be created as a C<:call_sig> parameter. If you use this, it should be
the only parameter.

method call_sig($value?) {
    self.attr('call_sig', $value, pir::defined($value));
}


=item viviself([type])
If the variable needs to be instantiated, then C<type> indicates
either the type of the value to create for the node or (future
implementation) a PAST tree to create the value.

method viviself($value?) {
    self.attr('viviself', $value, pir::defined($value));
}


=item vivibase([type])
For keyed nodes, C<type> indicates the type of aggregate to
create for the base if the base doesn't specify its own 'viviself'
attribute.

method vivibase($value?) {
    self.attr('vivibase', $value, pir::defined($value));
}

=item multitype([type])
Get/set MMD type of Var when used as parameter of Block.

method multitype($value?) {
    self.attr('multitype', $value, pir::defined($value));
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

