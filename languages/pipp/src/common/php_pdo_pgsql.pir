# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pdo_pgsql.pir - PHP pdo_pgsql  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string PDO::pgsqlLOBCreate()>

Creates a new large object, returning its identifier.  Must be called inside a transaction.

NOT IMPLEMENTED.

=cut

.sub 'PDO::pgsqlLOBCreate'
    not_implemented()
.end

=item C<resource PDO::pgsqlLOBOpen(string oid [, string mode = 'rb'])>

Opens an existing large object stream.  Must be called inside a transaction.

NOT IMPLEMENTED.

=cut

.sub 'PDO::pgsqlLOBOpen'
    not_implemented()
.end

=item C<bool PDO::pgsqlLOBUnlink(string oid)>

Deletes the large object identified by oid.  Must be called inside a transaction.

NOT IMPLEMENTED.

=cut

.sub 'PDO::pgsqlLOBUnlink'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
