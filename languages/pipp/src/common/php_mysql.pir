# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_mysql.pir - PHP mysql  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int mysql_affected_rows([int link_identifier])>

Gets number of affected rows in previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysql_affected_rows'
    not_implemented()
.end

=item C<string mysql_client_encoding([int link_identifier])>

Returns the default character set for the current connection

NOT IMPLEMENTED.

=cut

.sub 'mysql_client_encoding'
    not_implemented()
.end

=item C<bool mysql_close([int link_identifier])>

Close a MySQL connection

NOT IMPLEMENTED.

=cut

.sub 'mysql_close'
    not_implemented()
.end

=item C<resource mysql_connect([string hostname[:port][:/path/to/socket] [, string username [, string password [, bool new [, int flags]]]]])>

Opens a connection to a MySQL Server

NOT IMPLEMENTED.

=cut

.sub 'mysql_connect'
    not_implemented()
.end

=item C<bool mysql_create_db(string database_name [, int link_identifier])>

Create a MySQL database

NOT IMPLEMENTED.

=cut

.sub 'mysql_create_db'
    not_implemented()
.end

=item C<bool mysql_data_seek(resource result, int row_number)>

Move internal result pointer

NOT IMPLEMENTED.

=cut

.sub 'mysql_data_seek'
    not_implemented()
.end

=item C<resource mysql_db_query(string database_name, string query [, int link_identifier])>

Sends an SQL query to MySQL

NOT IMPLEMENTED.

=cut

.sub 'mysql_db_query'
    not_implemented()
.end

=item C<bool mysql_drop_db(string database_name [, int link_identifier])>

Drops (delete) a MySQL database

NOT IMPLEMENTED.

=cut

.sub 'mysql_drop_db'
    not_implemented()
.end

=item C<int mysql_errno([int link_identifier])>

Returns the number of the error message from previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysql_errno'
    not_implemented()
.end

=item C<string mysql_error([int link_identifier])>

Returns the text of the error message from previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysql_error'
    not_implemented()
.end

=item C<string mysql_escape_string(string to_be_escaped)>

Escape string for mysql query

NOT IMPLEMENTED.

=cut

.sub 'mysql_escape_string'
    not_implemented()
.end

=item C<array mysql_fetch_array(resource result [, int result_type])>

Fetch a result row as an array (associative, numeric or both)

NOT IMPLEMENTED.

=cut

.sub 'mysql_fetch_array'
    not_implemented()
.end

=item C<array mysql_fetch_assoc(resource result)>

Fetch a result row as an associative array

NOT IMPLEMENTED.

=cut

.sub 'mysql_fetch_assoc'
    not_implemented()
.end

=item C<object mysql_fetch_field(resource result [, int field_offset])>

Gets column information from a result and return as an object

NOT IMPLEMENTED.

=cut

.sub 'mysql_fetch_field'
    not_implemented()
.end

=item C<array mysql_fetch_lengths(resource result)>

Gets max data size of each column in a result

NOT IMPLEMENTED.

=cut

.sub 'mysql_fetch_lengths'
    not_implemented()
.end

=item C<object mysql_fetch_object(resource result [, string class_name [, NULL|array ctor_params]])>

Fetch a result row as an object

NOT IMPLEMENTED.

=cut

.sub 'mysql_fetch_object'
    not_implemented()
.end

=item C<array mysql_fetch_row(resource result)>

Gets a result row as an enumerated array

NOT IMPLEMENTED.

=cut

.sub 'mysql_fetch_row'
    not_implemented()
.end

=item C<string mysql_field_flags(resource result, int field_offset)>

Gets the flags associated with the specified field in a result

NOT IMPLEMENTED.

=cut

.sub 'mysql_field_flags'
    not_implemented()
.end

=item C<int mysql_field_len(resource result, int field_offset)>

Returns the length of the specified field

NOT IMPLEMENTED.

=cut

.sub 'mysql_field_len'
    not_implemented()
.end

=item C<string mysql_field_name(resource result, int field_index)>

Gets the name of the specified field in a result

NOT IMPLEMENTED.

=cut

.sub 'mysql_field_name'
    not_implemented()
.end

=item C<bool mysql_field_seek(resource result, int field_offset)>

Sets result pointer to a specific field offset

NOT IMPLEMENTED.

=cut

.sub 'mysql_field_seek'
    not_implemented()
.end

=item C<string mysql_field_table(resource result, int field_offset)>

Gets name of the table the specified field is in

NOT IMPLEMENTED.

=cut

.sub 'mysql_field_table'
    not_implemented()
.end

=item C<string mysql_field_type(resource result, int field_offset)>

Gets the type of the specified field in a result

NOT IMPLEMENTED.

=cut

.sub 'mysql_field_type'
    not_implemented()
.end

=item C<bool mysql_free_result(resource result)>

Free result memory

NOT IMPLEMENTED.

=cut

.sub 'mysql_free_result'
    not_implemented()
.end

=item C<string mysql_get_client_info(void)>

Returns a string that represents the client library version

NOT IMPLEMENTED.

=cut

.sub 'mysql_get_client_info'
    not_implemented()
.end

=item C<string mysql_get_host_info([int link_identifier])>

Returns a string describing the type of connection in use, including the server host name

NOT IMPLEMENTED.

=cut

.sub 'mysql_get_host_info'
    not_implemented()
.end

=item C<int mysql_get_proto_info([int link_identifier])>

Returns the protocol version used by current connection

NOT IMPLEMENTED.

=cut

.sub 'mysql_get_proto_info'
    not_implemented()
.end

=item C<string mysql_get_server_info([int link_identifier])>

Returns a string that represents the server version number

NOT IMPLEMENTED.

=cut

.sub 'mysql_get_server_info'
    not_implemented()
.end

=item C<string mysql_info([int link_identifier])>

Returns a string containing information about the most recent query

NOT IMPLEMENTED.

=cut

.sub 'mysql_info'
    not_implemented()
.end

=item C<int mysql_insert_id([int link_identifier])>

Gets the ID generated from the previous INSERT operation

NOT IMPLEMENTED.

=cut

.sub 'mysql_insert_id'
    not_implemented()
.end

=item C<resource mysql_list_dbs([int link_identifier])>

List databases available on a MySQL server

NOT IMPLEMENTED.

=cut

.sub 'mysql_list_dbs'
    not_implemented()
.end

=item C<resource mysql_list_fields(string database_name, string table_name [, int link_identifier])>

List MySQL result fields

NOT IMPLEMENTED.

=cut

.sub 'mysql_list_fields'
    not_implemented()
.end

=item C<resource mysql_list_processes([int link_identifier])>

Returns a result set describing the current server threads

NOT IMPLEMENTED.

=cut

.sub 'mysql_list_processes'
    not_implemented()
.end

=item C<resource mysql_list_tables(string database_name [, int link_identifier])>

List tables in a MySQL database

NOT IMPLEMENTED.

=cut

.sub 'mysql_list_tables'
    not_implemented()
.end

=item C<int mysql_num_fields(resource result)>

Gets number of fields in a result

NOT IMPLEMENTED.

=cut

.sub 'mysql_num_fields'
    not_implemented()
.end

=item C<int mysql_num_rows(resource result)>

Gets number of rows in a result

NOT IMPLEMENTED.

=cut

.sub 'mysql_num_rows'
    not_implemented()
.end

=item C<resource mysql_pconnect([string hostname[:port][:/path/to/socket] [, string username [, string password [, int flags]]]])>

Opens a persistent connection to a MySQL Server

NOT IMPLEMENTED.

=cut

.sub 'mysql_pconnect'
    not_implemented()
.end

=item C<bool mysql_ping([int link_identifier])>

Ping a server connection. If no connection then reconnect.

NOT IMPLEMENTED.

=cut

.sub 'mysql_ping'
    not_implemented()
.end

=item C<resource mysql_query(string query [, int link_identifier])>

Sends an SQL query to MySQL

NOT IMPLEMENTED.

=cut

.sub 'mysql_query'
    not_implemented()
.end

=item C<string mysql_real_escape_string(string to_be_escaped [, int link_identifier])>

Escape special characters in a string for use in a SQL statement, taking into account the current charset of the connection

NOT IMPLEMENTED.

=cut

.sub 'mysql_real_escape_string'
    not_implemented()
.end

=item C<mixed mysql_result(resource result, int row [, mixed field])>

Gets result data

NOT IMPLEMENTED.

=cut

.sub 'mysql_result'
    not_implemented()
.end

=item C<bool mysql_select_db(string database_name [, int link_identifier])>

Selects a MySQL database

NOT IMPLEMENTED.

=cut

.sub 'mysql_select_db'
    not_implemented()
.end

=item C<bool mysql_set_charset(string csname [, int link_identifier])>

sets client character set

NOT IMPLEMENTED.

=cut

.sub 'mysql_set_charset'
    not_implemented()
.end

=item C<string mysql_stat([int link_identifier])>

Returns a string containing status information

NOT IMPLEMENTED.

=cut

.sub 'mysql_stat'
    not_implemented()
.end

=item C<int mysql_thread_id([int link_identifier])>

Returns the thread id of current connection

NOT IMPLEMENTED.

=cut

.sub 'mysql_thread_id'
    not_implemented()
.end

=item C<resource mysql_unbuffered_query(string query [, int link_identifier])>

Sends an SQL query to MySQL, without fetching and buffering the result rows

NOT IMPLEMENTED.

=cut

.sub 'mysql_unbuffered_query'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
