 # Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's logical operations.

=head1 LOGICAL OPERATIONS

The logical operations are short-circuiting, so if the first
argument to an 'or' is true, the second will never be
evaluated. If the first argument to an 'and' operation is
false, the other arguments are never evaluated either. This
is a common logical optimization used by compiler designers.
PIR only allows variables as arguments to operations, so the
short-circuiting is only relevant if the argument is a PMC
that has side-effects on access to the boolean value. We'll
talk about these side effects later.

=cut

.sub main :main

    $I0 = 0 && 1    # returns 0
    $I1 = and 1, 2  # returns 2

    $I2 = or 1, 0   # returns 1
    $I3 = or 0, 2   # returns 2

    print $I0
    print " "
    print $I1
    print "\n"
    print $I2
    print " "
    print $I3
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

