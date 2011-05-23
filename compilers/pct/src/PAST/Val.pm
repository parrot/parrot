class PAST::Val is PAST::Node;

=NAME PAST::Val

=for DESCRIPTION
C<PAST::Val> nodes represent constant values in the abstract
syntax tree.  The C<name> attribute represents the value of the
node.

=item value([value])
Get/set the constant value for this node.

method value($value?) {
    self.attr('value', $value, pir::defined($value));
}

=item lvalue([value])
Throw an exception if we try to make a PAST::Val into an lvalue.

method lvalue($value?) {
    my $has_value := pir::defined($value);

    if $has_value && $value {
        die('Unable to set lvalue on PAST::Val node');
    }

    self.attr('lvalue', $value, $has_value);
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

