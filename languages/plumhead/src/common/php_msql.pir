# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_msql.pir - PHP msql  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int msql_affected_rows(resource query)>

Return number of affected rows

NOT IMPLEMENTED.

=cut

.sub 'msql_affected_rows'
    not_implemented()
.end

=item C<bool msql_close([resource link_identifier])>

Close an mSQL connection

NOT IMPLEMENTED.

=cut

.sub 'msql_close'
    not_implemented()
.end

=item C<int msql_connect([string hostname[:port]] [, string username] [, string password])>

Open a connection to an mSQL Server

NOT IMPLEMENTED.

=cut

.sub 'msql_connect'
    not_implemented()
.end

=item C<bool msql_create_db(string database_name [, resource link_identifier])>

Create an mSQL database

NOT IMPLEMENTED.

=cut

.sub 'msql_create_db'
    not_implemented()
.end

=item C<bool msql_data_seek(resource query, int row_number)>

Move internal result pointer

NOT IMPLEMENTED.

=cut

.sub 'msql_data_seek'
    not_implemented()
.end

=item C<resource msql_db_query(string database_name, string query [, resource link_identifier])>

Send an SQL query to mSQL

NOT IMPLEMENTED.

=cut

.sub 'msql_db_query'
    not_implemented()
.end

=item C<bool msql_drop_db(string database_name [, resource link_identifier])>

Drop (delete) an mSQL database

NOT IMPLEMENTED.

=cut

.sub 'msql_drop_db'
    not_implemented()
.end

=item C<string msql_error(void)>

Returns the text of the error message from previous mSQL operation

NOT IMPLEMENTED.

=cut

.sub 'msql_error'
    not_implemented()
.end

=item C<array msql_fetch_array(resource query [, int result_type])>

Fetch a result row as an associative array

NOT IMPLEMENTED.

=cut

.sub 'msql_fetch_array'
    not_implemented()
.end

=item C<object msql_fetch_field(resource query [, int field_offset])>

Get column information from a result and return as an object

NOT IMPLEMENTED.

=cut

.sub 'msql_fetch_field'
    not_implemented()
.end

=item C<object msql_fetch_object(resource query [, resource result_type])>

Fetch a result row as an object

NOT IMPLEMENTED.

=cut

.sub 'msql_fetch_object'
    not_implemented()
.end

=item C<array msql_fetch_row(resource query)>

Get a result row as an enumerated array

NOT IMPLEMENTED.

=cut

.sub 'msql_fetch_row'
    not_implemented()
.end

=item C<string msql_field_flags(resource query, int field_offset)>

Get the flags associated with the specified field in a result

NOT IMPLEMENTED.

=cut

.sub 'msql_field_flags'
    not_implemented()
.end

=item C<int msql_field_len(int query, int field_offet)>

Returns the length of the specified field

NOT IMPLEMENTED.

=cut

.sub 'msql_field_len'
    not_implemented()
.end

=item C<string msql_field_name(resource query, int field_index)>

Get the name of the specified field in a result

NOT IMPLEMENTED.

=cut

.sub 'msql_field_name'
    not_implemented()
.end

=item C<bool msql_field_seek(resource query, int field_offset)>

Set result pointer to a specific field offset

NOT IMPLEMENTED.

=cut

.sub 'msql_field_seek'
    not_implemented()
.end

=item C<string msql_field_table(resource query, int field_offset)>

Get name of the table the specified field is in

NOT IMPLEMENTED.

=cut

.sub 'msql_field_table'
    not_implemented()
.end

=item C<string msql_field_type(resource query, int field_offset)>

Get the type of the specified field in a result

NOT IMPLEMENTED.

=cut

.sub 'msql_field_type'
    not_implemented()
.end

=item C<bool msql_free_result(resource query)>

Free result memory

NOT IMPLEMENTED.

=cut

.sub 'msql_free_result'
    not_implemented()
.end

=item C<resource msql_list_dbs([resource link_identifier])>

List databases available on an mSQL server

NOT IMPLEMENTED.

=cut

.sub 'msql_list_dbs'
    not_implemented()
.end

=item C<resource msql_list_fields(string database_name, string table_name [, resource link_identifier])>

List mSQL result fields

NOT IMPLEMENTED.

=cut

.sub 'msql_list_fields'
    not_implemented()
.end

=item C<resource msql_list_tables(string database_name [, resource link_identifier])>

List tables in an mSQL database

NOT IMPLEMENTED.

=cut

.sub 'msql_list_tables'
    not_implemented()
.end

=item C<int msql_num_fields(resource query)>

Get number of fields in a result

NOT IMPLEMENTED.

=cut

.sub 'msql_num_fields'
    not_implemented()
.end

=item C<int msql_num_rows(resource query)>

Get number of rows in a result

NOT IMPLEMENTED.

=cut

.sub 'msql_num_rows'
    not_implemented()
.end

=item C<int msql_pconnect([string hostname[:port]] [, string username] [, string password])>

Open a persistent connection to an mSQL Server

NOT IMPLEMENTED.

=cut

.sub 'msql_pconnect'
    not_implemented()
.end

=item C<resource msql_query(string query [, resource link_identifier])>

Send an SQL query to mSQL

NOT IMPLEMENTED.

=cut

.sub 'msql_query'
    not_implemented()
.end

=item C<string msql_result(int query, int row [, mixed field])>

Get result data

NOT IMPLEMENTED.

=cut

.sub 'msql_result'
    not_implemented()
.end

=item C<bool msql_select_db(string database_name [, resource link_identifier])>

Select an mSQL database

NOT IMPLEMENTED.

=cut

.sub 'msql_select_db'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
