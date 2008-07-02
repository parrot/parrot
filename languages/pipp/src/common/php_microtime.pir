# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_microtime.pir - PHP microtime Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array getrusage([int who])>

Returns an array of usage statistics

NOT IMPLEMENTED.

=cut

.sub 'getrusage'
    not_implemented()
.end

=item C<array gettimeofday([bool get_as_float])>

Returns the current time as array

NOT IMPLEMENTED.

=cut

.sub 'gettimeofday'
    not_implemented()
.end

=item C<mixed microtime([bool get_as_float])>

Returns either a string or a float containing the current time in seconds and microseconds

NOT IMPLEMENTED.

=cut

.sub 'microtime'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
