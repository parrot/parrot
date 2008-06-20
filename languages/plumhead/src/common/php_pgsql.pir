# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pgsql.pir - PHP pgsql  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int pg_affected_rows(resource result)>

Returns the number of affected tuples

=cut

.sub 'pg_affected_rows'
    not_implemented()
.end

=item C<bool pg_cancel_query(resource connection)>

Cancel request

=cut

.sub 'pg_cancel_query'
    not_implemented()
.end

=item C<string pg_client_encoding([resource connection])>

Get the current client encoding

=cut

.sub 'pg_client_encoding'
    not_implemented()
.end

=item C<bool pg_close([resource connection])>

Close a PostgreSQL connection

=cut

.sub 'pg_close'
    not_implemented()
.end

=item C<resource pg_connect(string connection_string[, int connect_type] | [string host, string port [, string options [, string tty,]]] string database)>

Open a PostgreSQL connection

=cut

.sub 'pg_connect'
    not_implemented()
.end

=item C<bool pg_connection_busy(resource connection)>

Get connection is busy or not

=cut

.sub 'pg_connection_busy'
    not_implemented()
.end

=item C<bool pg_connection_reset(resource connection)>

Reset connection (reconnect)

=cut

.sub 'pg_connection_reset'
    not_implemented()
.end

=item C<int pg_connection_status(resource connnection)>

Get connection status

=cut

.sub 'pg_connection_status'
    not_implemented()
.end

=item C<array pg_convert(resource db, string table, array values[, int options])>

Check and convert values for PostgreSQL SQL statement

=cut

.sub 'pg_convert'
    not_implemented()
.end

=item C<bool pg_copy_from(resource connection, string table_name , array rows [, string delimiter [, string null_as]])>

Copy table from array

=cut

.sub 'pg_copy_from'
    not_implemented()
.end

=item C<array pg_copy_to(resource connection, string table_name [, string delimiter [, string null_as]])>

Copy table to array

=cut

.sub 'pg_copy_to'
    not_implemented()
.end

=item C<string pg_dbname([resource connection])>

Get the database name

=cut

.sub 'pg_dbname'
    not_implemented()
.end

=item C<mixed pg_delete(resource db, string table, array ids[, int options])>

Delete records has ids (id=>value)

=cut

.sub 'pg_delete'
    not_implemented()
.end

=item C<bool pg_end_copy([resource connection])>

Sync with backend. Completes the Copy command

=cut

.sub 'pg_end_copy'
    not_implemented()
.end

=item C<string pg_escape_bytea([resource connection,] string data)>

Escape binary for bytea type

=cut

.sub 'pg_escape_bytea'
    not_implemented()
.end

=item C<string pg_escape_string([resource connection,] string data)>

Escape string for text/char type

=cut

.sub 'pg_escape_string'
    not_implemented()
.end

=item C<resource pg_execute([resource connection,] string stmtname, array params)>

Execute a prepared query

=cut

.sub 'pg_execute'
    not_implemented()
.end

=item C<array pg_fetch_all(resource result)>

Fetch all rows into array

=cut

.sub 'pg_fetch_all'
    not_implemented()
.end

=item C<array pg_fetch_all_columns(resource result [, int column_number])>

Fetch all rows into array

=cut

.sub 'pg_fetch_all_columns'
    not_implemented()
.end

=item C<array pg_fetch_array(resource result [, int row [, int result_type]])>

Fetch a row as an array

=cut

.sub 'pg_fetch_array'
    not_implemented()
.end

=item C<array pg_fetch_assoc(resource result [, int row])>

Fetch a row as an assoc array

=cut

.sub 'pg_fetch_assoc'
    not_implemented()
.end

=item C<object pg_fetch_object(resource result [, int row [, string class_name [, NULL|array ctor_params]]])>

Fetch a row as an object

=cut

.sub 'pg_fetch_object'
    not_implemented()
.end

=item C<mixed pg_fetch_result(resource result, [int row_number,] mixed field_name)>

Returns values from a result identifier

=cut

.sub 'pg_fetch_result'
    not_implemented()
.end

=item C<array pg_fetch_row(resource result [, int row [, int result_type]])>

Get a row as an enumerated array

=cut

.sub 'pg_fetch_row'
    not_implemented()
.end

=item C<int pg_field_is_null(resource result, [int row,] mixed field_name_or_number)>

Test if a field is NULL

=cut

.sub 'pg_field_is_null'
    not_implemented()
.end

=item C<string pg_field_name(resource result, int field_number)>

Returns the name of the field

=cut

.sub 'pg_field_name'
    not_implemented()
.end

=item C<int pg_field_num(resource result, string field_name)>

Returns the field number of the named field

=cut

.sub 'pg_field_num'
    not_implemented()
.end

=item C<int pg_field_prtlen(resource result, [int row,] mixed field_name_or_number)>

Returns the printed length

=cut

.sub 'pg_field_prtlen'
    not_implemented()
.end

=item C<int pg_field_size(resource result, int field_number)>

Returns the internal size of the field

=cut

.sub 'pg_field_size'
    not_implemented()
.end

=item C<mixed pg_field_table(resource result, int field_number[, bool oid_only])>

Returns the name of the table field belongs to, or table's oid if oid_only is true

=cut

.sub 'pg_field_table'
    not_implemented()
.end

=item C<string pg_field_type(resource result, int field_number)>

Returns the type name for the given field

=cut

.sub 'pg_field_type'
    not_implemented()
.end

=item C<string pg_field_type_oid(resource result, int field_number)>

Returns the type oid for the given field

=cut

.sub 'pg_field_type_oid'
    not_implemented()
.end

=item C<bool pg_free_result(resource result)>

Free result memory

=cut

.sub 'pg_free_result'
    not_implemented()
.end

=item C<array pg_get_notify([resource connection[, result_type]])>

Get asynchronous notification

=cut

.sub 'pg_get_notify'
    not_implemented()
.end

=item C<int pg_get_pid([resource connection)>

Get backend(server) pid

=cut

.sub 'pg_get_pid'
    not_implemented()
.end

=item C<resource pg_get_result(resource connection)>

Get asynchronous query result

=cut

.sub 'pg_get_result'
    not_implemented()
.end

=item C<string pg_host([resource connection])>

Returns the host name associated with the connection

=cut

.sub 'pg_host'
    not_implemented()
.end

=item C<mixed pg_insert(resource db, string table, array values[, int options])>

Insert values (filed=>value) to table

=cut

.sub 'pg_insert'
    not_implemented()
.end

=item C<string pg_last_error([resource connection])>

Get the error message string

=cut

.sub 'pg_last_error'
    not_implemented()
.end

=item C<string pg_last_notice(resource connection)>

Returns the last notice set by the backend

=cut

.sub 'pg_last_notice'
    not_implemented()
.end

=item C<string pg_last_oid(resource result)>

Returns the last object identifier

=cut

.sub 'pg_last_oid'
    not_implemented()
.end

=item C<bool pg_lo_close(resource large_object)>

Close a large object

=cut

.sub 'pg_lo_close'
    not_implemented()
.end

=item C<int pg_lo_create([resource connection])>

Create a large object

=cut

.sub 'pg_lo_create'
    not_implemented()
.end

=item C<bool pg_lo_export([resource connection, ] int objoid, string filename)>

Export large object direct to filesystem

=cut

.sub 'pg_lo_export'
    not_implemented()
.end

=item C<int pg_lo_import([resource connection, ] string filename)>

Import large object direct from filesystem

=cut

.sub 'pg_lo_import'
    not_implemented()
.end

=item C<resource pg_lo_open([resource connection,] int large_object_oid, string mode)>

Open a large object and return fd

=cut

.sub 'pg_lo_open'
    not_implemented()
.end

=item C<string pg_lo_read(resource large_object [, int len])>

Read a large object

=cut

.sub 'pg_lo_read'
    not_implemented()
.end

=item C<int pg_lo_read_all(resource large_object)>

Read a large object and send straight to browser

=cut

.sub 'pg_lo_read_all'
    not_implemented()
.end

=item C<bool pg_lo_seek(resource large_object, int offset [, int whence])>

Seeks position of large object

=cut

.sub 'pg_lo_seek'
    not_implemented()
.end

=item C<int pg_lo_tell(resource large_object)>

Returns current position of large object

=cut

.sub 'pg_lo_tell'
    not_implemented()
.end

=item C<bool pg_lo_unlink([resource connection,] string large_object_oid)>

Delete a large object

=cut

.sub 'pg_lo_unlink'
    not_implemented()
.end

=item C<int pg_lo_write(resource large_object, string buf [, int len])>

Write a large object

=cut

.sub 'pg_lo_write'
    not_implemented()
.end

=item C<array pg_meta_data(resource db, string table)>

Get meta_data

=cut

.sub 'pg_meta_data'
    not_implemented()
.end

=item C<int pg_num_fields(resource result)>

Return the number of fields in the result

=cut

.sub 'pg_num_fields'
    not_implemented()
.end

=item C<int pg_num_rows(resource result)>

Return the number of rows in the result

=cut

.sub 'pg_num_rows'
    not_implemented()
.end

=item C<string pg_options([resource connection])>

Get the options associated with the connection

=cut

.sub 'pg_options'
    not_implemented()
.end

=item C<string|false pg_parameter_status([resource connection,] string param_name)>

Returns the value of a server parameter

=cut

.sub 'pg_parameter_status'
    not_implemented()
.end

=item C<resource pg_pconnect(string connection_string | [string host, string port [, string options [, string tty,]]] string database)>

Open a persistent PostgreSQL connection

=cut

.sub 'pg_pconnect'
    not_implemented()
.end

=item C<bool pg_ping([resource connection])>

Ping database. If connection is bad, try to reconnect.

=cut

.sub 'pg_ping'
    not_implemented()
.end

=item C<int pg_port([resource connection])>

Return the port number associated with the connection

=cut

.sub 'pg_port'
    not_implemented()
.end

=item C<resource pg_prepare([resource connection,] string stmtname, string query)>

Prepare a query for future execution

=cut

.sub 'pg_prepare'
    not_implemented()
.end

=item C<bool pg_put_line([resource connection,] string query)>

Send null-terminated string to backend server

=cut

.sub 'pg_put_line'
    not_implemented()
.end

=item C<resource pg_query([resource connection,] string query)>

Execute a query

=cut

.sub 'pg_query'
    not_implemented()
.end

=item C<resource pg_query_params([resource connection,] string query, array params)>

Execute a query

=cut

.sub 'pg_query_params'
    not_implemented()
.end

=item C<string pg_result_error(resource result)>

Get error message associated with result

=cut

.sub 'pg_result_error'
    not_implemented()
.end

=item C<string pg_result_error_field(resource result, int fieldcode)>

Get error message field associated with result

=cut

.sub 'pg_result_error_field'
    not_implemented()
.end

=item C<bool pg_result_seek(resource result, int offset)>

Set internal row offset

=cut

.sub 'pg_result_seek'
    not_implemented()
.end

=item C<mixed pg_result_status(resource result[, long result_type])>

Get status of query result

=cut

.sub 'pg_result_status'
    not_implemented()
.end

=item C<mixed pg_select(resource db, string table, array ids[, int options])>

Select records that has ids (id=>value)

=cut

.sub 'pg_select'
    not_implemented()
.end

=item C<bool pg_send_execute(resource connection, string stmtname, array params)>

Executes prevriously prepared stmtname asynchronously

=cut

.sub 'pg_send_execute'
    not_implemented()
.end

=item C<bool pg_send_prepare(resource connection, string stmtname, string query)>

Asynchronously prepare a query for future execution

=cut

.sub 'pg_send_prepare'
    not_implemented()
.end

=item C<bool pg_send_query(resource connection, string query)>

Send asynchronous query

=cut

.sub 'pg_send_query'
    not_implemented()
.end

=item C<bool pg_send_query_params(resource connection, string query)>

Send asynchronous parameterized query

=cut

.sub 'pg_send_query_params'
    not_implemented()
.end

=item C<int pg_set_client_encoding([resource connection,] string encoding)>

Set client encoding

=cut

.sub 'pg_set_client_encoding'
    not_implemented()
.end

=item C<int pg_set_error_verbosity([resource connection,] int verbosity)>

Set error verbosity

=cut

.sub 'pg_set_error_verbosity'
    not_implemented()
.end

=item C<bool pg_trace(string filename [, string mode [, resource connection]])>

Enable tracing a PostgreSQL connection

=cut

.sub 'pg_trace'
    not_implemented()
.end

=item C<int pg_transaction_status(resource connnection)>

Get transaction status

=cut

.sub 'pg_transaction_status'
    not_implemented()
.end

=item C<string pg_tty([resource connection])>

Return the tty name associated with the connection

=cut

.sub 'pg_tty'
    not_implemented()
.end

=item C<string pg_unescape_bytea(string data)>

Unescape binary for bytea type

=cut

.sub 'pg_unescape_bytea'
    not_implemented()
.end

=item C<bool pg_untrace([resource connection])>

Disable tracing of a PostgreSQL connection

=cut

.sub 'pg_untrace'
    not_implemented()
.end

=item C<mixed pg_update(resource db, string table, array fields, array ids[, int options])>

Update table using values (field=>value) and ids (id=>value)

=cut

.sub 'pg_update'
    not_implemented()
.end

=item C<array pg_version([resource connection])>

Returns an array with client, protocol and server version (when available)

=cut

.sub 'pg_version'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
