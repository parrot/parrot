# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_dbase.pir - PHP dbase  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool dbase_add_record(int identifier, array data)>

Adds a record to the database

NOT IMPLEMENTED.

=cut

.sub 'dbase_add_record'
    not_implemented()
.end

=item C<bool dbase_close(int identifier)>

Closes an open dBase-format database file

NOT IMPLEMENTED.

=cut

.sub 'dbase_close'
    not_implemented()
.end

=item C<bool dbase_create(string filename, array fields)>

Creates a new dBase-format database file

NOT IMPLEMENTED.

=cut

.sub 'dbase_create'
    not_implemented()
.end

=item C<bool dbase_delete_record(int identifier, int record)>

Marks a record to be deleted

NOT IMPLEMENTED.

=cut

.sub 'dbase_delete_record'
    not_implemented()
.end

=item C<array dbase_get_header_info(int database_handle)>



NOT IMPLEMENTED.

=cut

.sub 'dbase_get_header_info'
    not_implemented()
.end

=item C<array dbase_get_record(int identifier, int record)>

Returns an array representing a record from the database

NOT IMPLEMENTED.

=cut

.sub 'dbase_get_record'
    not_implemented()
.end

=item C<array dbase_get_record_with_names(int identifier, int record)>

Returns an associative array representing a record from the database

NOT IMPLEMENTED.

=cut

.sub 'dbase_get_record_with_names'
    not_implemented()
.end

=item C<int dbase_numfields(int identifier)>

Returns the number of fields (columns) in the database

NOT IMPLEMENTED.

=cut

.sub 'dbase_numfields'
    not_implemented()
.end

=item C<int dbase_numrecords(int identifier)>

Returns the number of records in the database

NOT IMPLEMENTED.

=cut

.sub 'dbase_numrecords'
    not_implemented()
.end

=item C<int dbase_open(string name, int mode)>

Opens a dBase-format database file

NOT IMPLEMENTED.

=cut

.sub 'dbase_open'
    not_implemented()
.end

=item C<bool dbase_pack(int identifier)>

Packs the database (deletes records marked for deletion)

NOT IMPLEMENTED.

=cut

.sub 'dbase_pack'
    not_implemented()
.end

=item C<bool dbase_replace_record(int identifier, array data, int recnum)>

Replaces a record to the database

NOT IMPLEMENTED.

=cut

.sub 'dbase_replace_record'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
