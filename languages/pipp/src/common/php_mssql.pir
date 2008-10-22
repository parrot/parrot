# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_mssql.pir - PHP mssql  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool mssql_bind(resource stmt, string param_name, mixed var, int type [, int is_output [, int is_null [, int maxlen]]])>

Adds a parameter to a stored procedure or a remote stored procedure

NOT IMPLEMENTED.

=cut

.sub 'mssql_bind'
    not_implemented()
.end

=item C<bool mssql_close([resource conn_id])>

Closes a connection to a MS-SQL server

NOT IMPLEMENTED.

=cut

.sub 'mssql_close'
    not_implemented()
.end

=item C<int mssql_connect([string servername [, string username [, string password [, bool new_link]]])>

Establishes a connection to a MS-SQL server

NOT IMPLEMENTED.

=cut

.sub 'mssql_connect'
    not_implemented()
.end

=item C<bool mssql_data_seek(resource result_id, int offset)>

Moves the internal row pointer of the MS-SQL result associated with the specified result identifier to pointer to the specified row number

NOT IMPLEMENTED.

=cut

.sub 'mssql_data_seek'
    not_implemented()
.end

=item C<mixed mssql_execute(resource stmt [, bool skip_results = false])>

Executes a stored procedure on a MS-SQL server database

NOT IMPLEMENTED.

=cut

.sub 'mssql_execute'
    not_implemented()
.end

=item C<array mssql_fetch_array(resource result_id [, int result_type])>

Returns an associative array of the current row in the result set specified by result_id

NOT IMPLEMENTED.

=cut

.sub 'mssql_fetch_array'
    not_implemented()
.end

=item C<array mssql_fetch_assoc(resource result_id)>

Returns an associative array of the current row in the result set specified by result_id

NOT IMPLEMENTED.

=cut

.sub 'mssql_fetch_assoc'
    not_implemented()
.end

=item C<int mssql_fetch_batch(resource result_index)>

Returns the next batch of records

NOT IMPLEMENTED.

=cut

.sub 'mssql_fetch_batch'
    not_implemented()
.end

=item C<object mssql_fetch_field(resource result_id [, int offset])>

Gets information about certain fields in a query result

NOT IMPLEMENTED.

=cut

.sub 'mssql_fetch_field'
    not_implemented()
.end

=item C<object mssql_fetch_object(resource result_id [, int result_type])>

Returns a pseudo-object of the current row in the result set specified by result_id

NOT IMPLEMENTED.

=cut

.sub 'mssql_fetch_object'
    not_implemented()
.end

=item C<array mssql_fetch_row(resource result_id)>

Returns an array of the current row in the result set specified by result_id

NOT IMPLEMENTED.

=cut

.sub 'mssql_fetch_row'
    not_implemented()
.end

=item C<int mssql_field_length(resource result_id [, int offset])>

Get the length of a MS-SQL field

NOT IMPLEMENTED.

=cut

.sub 'mssql_field_length'
    not_implemented()
.end

=item C<string mssql_field_name(resource result_id [, int offset])>

Returns the name of the field given by offset in the result set given by result_id

NOT IMPLEMENTED.

=cut

.sub 'mssql_field_name'
    not_implemented()
.end

=item C<bool mssql_field_seek(int result_id, int offset)>

Seeks to the specified field offset

NOT IMPLEMENTED.

=cut

.sub 'mssql_field_seek'
    not_implemented()
.end

=item C<string mssql_field_type(resource result_id [, int offset])>

Returns the type of a field

NOT IMPLEMENTED.

=cut

.sub 'mssql_field_type'
    not_implemented()
.end

=item C<bool mssql_free_result(resource result_index)>

Free a MS-SQL result index

NOT IMPLEMENTED.

=cut

.sub 'mssql_free_result'
    not_implemented()
.end

=item C<bool mssql_free_statement(resource result_index)>

Free a MS-SQL statement index

NOT IMPLEMENTED.

=cut

.sub 'mssql_free_statement'
    not_implemented()
.end

=item C<string mssql_get_last_message(void)>

Gets the last message from the MS-SQL server

NOT IMPLEMENTED.

=cut

.sub 'mssql_get_last_message'
    not_implemented()
.end

=item C<string mssql_guid_string(string binary [,int short_format])>

Converts a 16 byte binary GUID to a string

NOT IMPLEMENTED.

=cut

.sub 'mssql_guid_string'
    not_implemented()
.end

=item C<int mssql_init(string sp_name [, resource conn_id])>

Initializes a stored procedure or a remote stored procedure

NOT IMPLEMENTED.

=cut

.sub 'mssql_init'
    not_implemented()
.end

=item C<void mssql_min_error_severity(int severity)>

Sets the lower error severity

NOT IMPLEMENTED.

=cut

.sub 'mssql_min_error_severity'
    not_implemented()
.end

=item C<void mssql_min_message_severity(int severity)>

Sets the lower message severity

NOT IMPLEMENTED.

=cut

.sub 'mssql_min_message_severity'
    not_implemented()
.end

=item C<bool mssql_next_result(resource result_id)>

Move the internal result pointer to the next result

NOT IMPLEMENTED.

=cut

.sub 'mssql_next_result'
    not_implemented()
.end

=item C<int mssql_num_fields(resource mssql_result_index)>

Returns the number of fields fetched in from the result id specified

NOT IMPLEMENTED.

=cut

.sub 'mssql_num_fields'
    not_implemented()
.end

=item C<int mssql_num_rows(resource mssql_result_index)>

Returns the number of rows fetched in from the result id specified

NOT IMPLEMENTED.

=cut

.sub 'mssql_num_rows'
    not_implemented()
.end

=item C<int mssql_pconnect([string servername [, string username [, string password [, bool new_link]]]])>

Establishes a persistent connection to a MS-SQL server

NOT IMPLEMENTED.

=cut

.sub 'mssql_pconnect'
    not_implemented()
.end

=item C<resource mssql_query(string query [, resource conn_id [, int batch_size]])>

Perform an SQL query on a MS-SQL server database

NOT IMPLEMENTED.

=cut

.sub 'mssql_query'
    not_implemented()
.end

=item C<string mssql_result(resource result_id, int row, mixed field)>

Returns the contents of one cell from a MS-SQL result set

NOT IMPLEMENTED.

=cut

.sub 'mssql_result'
    not_implemented()
.end

=item C<int mssql_rows_affected(resource conn_id)>

Returns the number of records affected by the query

NOT IMPLEMENTED.

=cut

.sub 'mssql_rows_affected'
    not_implemented()
.end

=item C<bool mssql_select_db(string database_name [, resource conn_id])>

Select a MS-SQL database

NOT IMPLEMENTED.

=cut

.sub 'mssql_select_db'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
