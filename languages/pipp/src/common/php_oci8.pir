# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_oci8.pir - PHP oci8  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool oci_bind_array_by_name(resource stmt, string name, array &var, int max_table_length [, int max_item_length [, int type ]])>

Bind a PHP array to an Oracle PL/SQL type by name

NOT IMPLEMENTED.

=cut

.sub 'oci_bind_array_by_name'
    not_implemented()
.end

=item C<bool oci_bind_by_name(resource stmt, string name, mixed &var, [, int maxlength [, int type]])>

Bind a PHP variable to an Oracle placeholder by name

NOT IMPLEMENTED.

=cut

.sub 'oci_bind_by_name'
    not_implemented()
.end

=item C<bool oci_cancel(resource stmt)>

Cancel reading from a cursor

NOT IMPLEMENTED.

=cut

.sub 'oci_cancel'
    not_implemented()
.end

=item C<bool oci_close(resource connection)>

Disconnect from database

NOT IMPLEMENTED.

=cut

.sub 'oci_close'
    not_implemented()
.end

=item C<bool oci_collection_append(string value)>

Append an object to the collection

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_append'
    not_implemented()
.end

=item C<bool oci_collection_assign(object from)>

Assign a collection from another existing collection

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_assign'
    not_implemented()
.end

=item C<bool oci_collection_element_assign(int index, string val)>

Assign element val to collection at index ndx

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_element_assign'
    not_implemented()
.end

=item C<string oci_collection_element_get(int ndx)>

Retrieve the value at collection index ndx

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_element_get'
    not_implemented()
.end

=item C<int oci_collection_max()>

Return the max value of a collection. For a varray this is the maximum length of the array

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_max'
    not_implemented()
.end

=item C<int oci_collection_size()>

Return the size of a collection

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_size'
    not_implemented()
.end

=item C<bool oci_collection_trim(int num)>

Trim num elements from the end of a collection

NOT IMPLEMENTED.

=cut

.sub 'oci_collection_trim'
    not_implemented()
.end

=item C<bool oci_commit(resource connection)>

Commit the current context

NOT IMPLEMENTED.

=cut

.sub 'oci_commit'
    not_implemented()
.end

=item C<resource oci_connect(string user, string pass [, string db [, string charset [, int session_mode ]])>

Connect to an Oracle database and log on. Returns a new session.

NOT IMPLEMENTED.

=cut

.sub 'oci_connect'
    not_implemented()
.end

=item C<bool oci_define_by_name(resource stmt, string name, mixed &var [, int type])>

Define a PHP variable to an Oracle column by name

NOT IMPLEMENTED.

=cut

.sub 'oci_define_by_name'
    not_implemented()
.end

=item C<array oci_error([resource stmt|connection|global])>

Return the last error of stmt|connection|global. If no error happened returns false.

NOT IMPLEMENTED.

=cut

.sub 'oci_error'
    not_implemented()
.end

=item C<bool oci_execute(resource stmt [, int mode])>

Execute a parsed statement

NOT IMPLEMENTED.

=cut

.sub 'oci_execute'
    not_implemented()
.end

=item C<bool oci_fetch(resource stmt)>

Prepare a new row of data for reading

NOT IMPLEMENTED.

=cut

.sub 'oci_fetch'
    not_implemented()
.end

=item C<int oci_fetch_all(resource stmt, array &output[, int skip[, int maxrows[, int flags]]])>

Fetch all rows of result data into an array

NOT IMPLEMENTED.

=cut

.sub 'oci_fetch_all'
    not_implemented()
.end

=item C<array oci_fetch_array( resource stmt [, int mode ])>

Fetch a result row as an array

NOT IMPLEMENTED.

=cut

.sub 'oci_fetch_array'
    not_implemented()
.end

=item C<array oci_fetch_assoc( resource stmt )>

Fetch a result row as an associative array

NOT IMPLEMENTED.

=cut

.sub 'oci_fetch_assoc'
    not_implemented()
.end

=item C<object oci_fetch_object( resource stmt )>

Fetch a result row as an object

NOT IMPLEMENTED.

=cut

.sub 'oci_fetch_object'
    not_implemented()
.end

=item C<array oci_fetch_row( resource stmt )>

Fetch a result row as an enumerated array

NOT IMPLEMENTED.

=cut

.sub 'oci_fetch_row'
    not_implemented()
.end

=item C<bool oci_field_is_null(resource stmt, int col)>

Tell whether a column is NULL

NOT IMPLEMENTED.

=cut

.sub 'oci_field_is_null'
    not_implemented()
.end

=item C<string oci_field_name(resource stmt, int col)>

Tell the name of a column

NOT IMPLEMENTED.

=cut

.sub 'oci_field_name'
    not_implemented()
.end

=item C<int oci_field_precision(resource stmt, int col)>

Tell the precision of a column

NOT IMPLEMENTED.

=cut

.sub 'oci_field_precision'
    not_implemented()
.end

=item C<int oci_field_scale(resource stmt, int col)>

Tell the scale of a column

NOT IMPLEMENTED.

=cut

.sub 'oci_field_scale'
    not_implemented()
.end

=item C<int oci_field_size(resource stmt, int col)>

Tell the maximum data size of a column

NOT IMPLEMENTED.

=cut

.sub 'oci_field_size'
    not_implemented()
.end

=item C<mixed oci_field_type(resource stmt, int col)>

Tell the data type of a column

NOT IMPLEMENTED.

=cut

.sub 'oci_field_type'
    not_implemented()
.end

=item C<int oci_field_type_raw(resource stmt, int col)>

Tell the raw oracle data type of a column

NOT IMPLEMENTED.

=cut

.sub 'oci_field_type_raw'
    not_implemented()
.end

=item C<bool oci_free_collection()>

Deletes collection object

NOT IMPLEMENTED.

=cut

.sub 'oci_free_collection'
    not_implemented()
.end

=item C<bool oci_free_descriptor()>

Deletes large object description

NOT IMPLEMENTED.

=cut

.sub 'oci_free_descriptor'
    not_implemented()
.end

=item C<bool oci_free_statement(resource stmt)>

Free all resources associated with a statement

NOT IMPLEMENTED.

=cut

.sub 'oci_free_statement'
    not_implemented()
.end

=item C<void oci_internal_debug(int onoff)>

Toggle internal debugging output for the OCI extension

NOT IMPLEMENTED.

=cut

.sub 'oci_internal_debug'
    not_implemented()
.end

=item C<bool oci_lob_append( object lob )>

Appends data from a LOB to another LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_append'
    not_implemented()
.end

=item C<bool oci_lob_close()>

Closes lob descriptor

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_close'
    not_implemented()
.end

=item C<bool oci_lob_copy( object lob_to, object lob_from [, int length ] )>

Copies data from a LOB to another LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_copy'
    not_implemented()
.end

=item C<bool oci_lob_eof()>

Checks if EOF is reached

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_eof'
    not_implemented()
.end

=item C<int oci_lob_erase( [ int offset [, int length ] ] )>

Erases a specified portion of the internal LOB, starting at a specified offset

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_erase'
    not_implemented()
.end

=item C<bool oci_lob_export([string filename [, int start [, int length]]])>

Writes a large object into a file

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_export'
    not_implemented()
.end

=item C<bool oci_lob_flush( [ int flag ] )>

Flushes the LOB buffer

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_flush'
    not_implemented()
.end

=item C<bool oci_lob_import( string filename )>

Loads file into a LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_import'
    not_implemented()
.end

=item C<bool oci_lob_is_equal( object lob1, object lob2 )>

Tests to see if two LOB/FILE locators are equal

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_is_equal'
    not_implemented()
.end

=item C<string oci_lob_load()>

Loads a large object

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_load'
    not_implemented()
.end

=item C<string oci_lob_read( int length )>

Reads particular part of a large object

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_read'
    not_implemented()
.end

=item C<bool oci_lob_rewind()>

Rewind pointer of a LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_rewind'
    not_implemented()
.end

=item C<bool oci_lob_save( string data [, int offset ])>

Saves a large object

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_save'
    not_implemented()
.end

=item C<bool oci_lob_seek( int offset [, int whence ])>

Moves the pointer of a LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_seek'
    not_implemented()
.end

=item C<int oci_lob_size()>

Returns size of a large object

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_size'
    not_implemented()
.end

=item C<int oci_lob_tell()>

Tells LOB pointer position

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_tell'
    not_implemented()
.end

=item C<bool oci_lob_truncate( [ int length ])>

Truncates a LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_truncate'
    not_implemented()
.end

=item C<int oci_lob_write( string string [, int length ])>

Writes data to current position of a LOB

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_write'
    not_implemented()
.end

=item C<bool oci_lob_write_temporary(string var [, int lob_type])>

Writes temporary blob

NOT IMPLEMENTED.

=cut

.sub 'oci_lob_write_temporary'
    not_implemented()
.end

=item C<object oci_new_collection(resource connection, string tdo [, string schema])>

Initialize a new collection

NOT IMPLEMENTED.

=cut

.sub 'oci_new_collection'
    not_implemented()
.end

=item C<resource oci_new_connect(string user, string pass [, string db])>

Connect to an Oracle database and log on. Returns a new session.

NOT IMPLEMENTED.

=cut

.sub 'oci_new_connect'
    not_implemented()
.end

=item C<resource oci_new_cursor(resource connection)>

Return a new cursor (Statement-Handle) - use this to bind ref-cursors!

NOT IMPLEMENTED.

=cut

.sub 'oci_new_cursor'
    not_implemented()
.end

=item C<object oci_new_descriptor(resource connection [, int type])>

Initialize a new empty descriptor LOB/FILE (LOB is default)

NOT IMPLEMENTED.

=cut

.sub 'oci_new_descriptor'
    not_implemented()
.end

=item C<int oci_num_fields(resource stmt)>

Return the number of result columns in a statement

NOT IMPLEMENTED.

=cut

.sub 'oci_num_fields'
    not_implemented()
.end

=item C<int oci_num_rows(resource stmt)>

Return the row count of an OCI statement

NOT IMPLEMENTED.

=cut

.sub 'oci_num_rows'
    not_implemented()
.end

=item C<resource oci_parse(resource connection, string query)>

Parse a query and return a statement

NOT IMPLEMENTED.

=cut

.sub 'oci_parse'
    not_implemented()
.end

=item C<bool oci_password_change(resource connection, string username, string old_password, string new_password)>

Changes the password of an account

NOT IMPLEMENTED.

=cut

.sub 'oci_password_change'
    not_implemented()
.end

=item C<resource oci_pconnect(string user, string pass [, string db [, string charset ]])>

Connect to an Oracle database using a persistent connection and log on. Returns a new session.

NOT IMPLEMENTED.

=cut

.sub 'oci_pconnect'
    not_implemented()
.end

=item C<string oci_result(resource stmt, mixed column)>

Return a single column of result data

NOT IMPLEMENTED.

=cut

.sub 'oci_result'
    not_implemented()
.end

=item C<bool oci_rollback(resource connection)>

Rollback the current context

NOT IMPLEMENTED.

=cut

.sub 'oci_rollback'
    not_implemented()
.end

=item C<string oci_server_version(resource connection)>

Return a string containing server version information

NOT IMPLEMENTED.

=cut

.sub 'oci_server_version'
    not_implemented()
.end

=item C<bool oci_set_prefetch(resource stmt, int prefetch_rows)>

Sets the number of rows to be prefetched on execute to prefetch_rows for stmt

NOT IMPLEMENTED.

=cut

.sub 'oci_set_prefetch'
    not_implemented()
.end

=item C<string oci_statement_type(resource stmt)>

Return the query type of an OCI statement

NOT IMPLEMENTED.

=cut

.sub 'oci_statement_type'
    not_implemented()
.end

=item C<int ocifetchinto(resource stmt, array &output [, int mode])>

Fetch a row of result data into an array

NOT IMPLEMENTED.

=cut

.sub 'ocifetchinto'
    not_implemented()
.end

=item C<bool ocigetbufferinglob()>

Returns current state of buffering for a LOB

NOT IMPLEMENTED.

=cut

.sub 'ocigetbufferinglob'
    not_implemented()
.end

=item C<bool ocisetbufferinglob( boolean flag )>

Enables/disables buffering for a LOB

NOT IMPLEMENTED.

=cut

.sub 'ocisetbufferinglob'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
