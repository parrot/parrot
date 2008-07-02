# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_fsock.pir - PHP fsock Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<resource fsockopen(string hostname, int port [, int errno [, string errstr [, float timeout]]])>

Open Internet or Unix domain socket connection

NOT IMPLEMENTED.

=cut

.sub 'fsockopen'
    not_implemented()
.end

=item C<resource pfsockopen(string hostname, int port [, int errno [, string errstr [, float timeout]]])>

Open persistent Internet or Unix domain socket connection

NOT IMPLEMENTED.

=cut

.sub 'pfsockopen'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
