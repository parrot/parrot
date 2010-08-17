=head1 TITLE

Parrot::Exception - Auxiliary methods for Exceptions

=head1 VERSION

 $Id$

=head1 SYNOPSIS

        load_bytecode 'Parrot/Exception.pbc'
        # ...
        $S0 = 'XYZ'
        $P0 = get_class 'Exception'
        $P1 = $P0.'new'('Error in "', $S0, '" module')
        throw $P1

=head1 DESCRIPTION

This module provides some additional support for using Parrot's
built-in Exception class.  The principal method is C<new>, which
simplifies the task of building and populating Exception objects.

=head2 Methods

=over 4

=item new([arg, ...])

Build an C<Exception> object, initializing its message component
to be the concatenation of any arguments supplied.  Returns the
newly created C<Exception>.

=cut

.namespace [ 'Exception' ]

.sub 'new' :method
    .param pmc args            :slurpy
    .local pmc ex
    .local string message
    ex      = new 'Exception'
    if null args goto end

    message = join '', args
    ex      = message
  end:
    .return (ex)
.end

=back

=head1 AUTHOR

Patrick R. Michaud <pmichaud@pobox.com>

=head1 COPYRIGHT

Copyright (C) 2007-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
