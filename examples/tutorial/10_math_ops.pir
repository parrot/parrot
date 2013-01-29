# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's math operations.

=head1 MATH OPERATIONS

Many common math operations have simple operator syntax in
PIR. Operators like C<+>, C<->, C</> and C<*> are all
implemented in PIR, but so are a few less common ones such
as C<<< << >>>, C<<< >> >>>, C<|>, C<&>, C<^>  and C<%>.

=cut

.sub main :main

    $I0 = 5
    $I1 = $I0 + 2
    print $I1
    print "\n"

    $N0 = 6.7
    $N1 = $N0 - 1.5
    print $N1
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

