# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_mysqli.pir - PHP mysqli  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<mixed mysqli_affected_rows(object link)>

Get number of affected rows in previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_affected_rows'
    not_implemented()
.end

=item C<bool mysqli_autocommit(object link, bool mode)>

Turn auto commit on or of

NOT IMPLEMENTED.

=cut

.sub 'mysqli_autocommit'
    not_implemented()
.end

=item C<bool mysqli_change_user(object link, string user, string password, string database)>

Change logged-in user of the active connection

NOT IMPLEMENTED.

=cut

.sub 'mysqli_change_user'
    not_implemented()
.end

=item C<string mysqli_character_set_name(object link)>

Returns the name of the character set used for this connection

NOT IMPLEMENTED.

=cut

.sub 'mysqli_character_set_name'
    not_implemented()
.end

=item C<bool mysqli_close(object link)>

Close connection

NOT IMPLEMENTED.

=cut

.sub 'mysqli_close'
    not_implemented()
.end

=item C<bool mysqli_commit(object link)>

Commit outstanding actions and close transaction

NOT IMPLEMENTED.

=cut

.sub 'mysqli_commit'
    not_implemented()
.end

=item C<object mysqli_connect([string hostname [,string username [,string passwd [,string dbname [,int port [,string socket]]]]]])>

Open a connection to a mysql server

NOT IMPLEMENTED.

=cut

.sub 'mysqli_connect'
    not_implemented()
.end

=item C<int mysqli_connect_errno(void)>

Returns the numerical value of the error message from last connect command

NOT IMPLEMENTED.

=cut

.sub 'mysqli_connect_errno'
    not_implemented()
.end

=item C<string mysqli_connect_error(void)>

Returns the text of the error message from previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_connect_error'
    not_implemented()
.end

=item C<bool mysqli_data_seek(object result, int offset)>

Move internal result pointer

NOT IMPLEMENTED.

=cut

.sub 'mysqli_data_seek'
    not_implemented()
.end

=item C<void mysqli_debug(string debug)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_debug'
    not_implemented()
.end

=item C<void mysqli_disable_reads_from_master(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_disable_reads_from_master'
    not_implemented()
.end

=item C<void mysqli_disable_rpl_parse(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_disable_rpl_parse'
    not_implemented()
.end

=item C<bool mysqli_dump_debug_info(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_dump_debug_info'
    not_implemented()
.end

=item C<void mysqli_embedded_server_end(void)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_embedded_server_end'
    not_implemented()
.end

=item C<bool mysqli_embedded_server_start(bool start, array arguments, array groups)>

initialize and start embedded server

NOT IMPLEMENTED.

=cut

.sub 'mysqli_embedded_server_start'
    not_implemented()
.end

=item C<void mysqli_enable_reads_from_master(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_enable_reads_from_master'
    not_implemented()
.end

=item C<void mysqli_enable_rpl_parse(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_enable_rpl_parse'
    not_implemented()
.end

=item C<int mysqli_errno(object link)>

Returns the numerical value of the error message from previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_errno'
    not_implemented()
.end

=item C<string mysqli_error(object link)>

Returns the text of the error message from previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_error'
    not_implemented()
.end

=item C<mixed mysqli_fetch_array(object result [,int resulttype])>

Fetch a result row as an associative array, a numeric array, or both

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_array'
    not_implemented()
.end

=item C<mixed mysqli_fetch_assoc(object result)>

Fetch a result row as an associative array

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_assoc'
    not_implemented()
.end

=item C<mixed mysqli_fetch_field(object result)>

Get column information from a result and return as an object

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_field'
    not_implemented()
.end

=item C<mixed mysqli_fetch_field_direct(object result, int offset)>

Fetch meta-data for a single field

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_field_direct'
    not_implemented()
.end

=item C<mixed mysqli_fetch_fields(object result)>

Return array of objects containing field meta-data

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_fields'
    not_implemented()
.end

=item C<mixed mysqli_fetch_lengths(object result)>

Get the length of each output in a result

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_lengths'
    not_implemented()
.end

=item C<mixed mysqli_fetch_object(object result [, string class_name [, NULL|array ctor_params]])>

Fetch a result row as an object

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_object'
    not_implemented()
.end

=item C<array mysqli_fetch_row(object result)>

Get a result row as an enumerated array

NOT IMPLEMENTED.

=cut

.sub 'mysqli_fetch_row'
    not_implemented()
.end

=item C<int mysqli_field_count(object link)>

Fetch the number of fields returned by the last query for the given link


NOT IMPLEMENTED.

=cut

.sub 'mysqli_field_count'
    not_implemented()
.end

=item C<int mysqli_field_seek(object result, int fieldnr)>

Set result pointer to a specified field offset


NOT IMPLEMENTED.

=cut

.sub 'mysqli_field_seek'
    not_implemented()
.end

=item C<int mysqli_field_tell(object result)>

Get current field offset of result pointer

NOT IMPLEMENTED.

=cut

.sub 'mysqli_field_tell'
    not_implemented()
.end

=item C<void mysqli_free_result(object result)>

Free query result memory for the given result handle

NOT IMPLEMENTED.

=cut

.sub 'mysqli_free_result'
    not_implemented()
.end

=item C<object mysqli_get_charset(object link)>

returns a character set object

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_charset'
    not_implemented()
.end

=item C<string mysqli_get_client_info(void)>

Get MySQL client info

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_client_info'
    not_implemented()
.end

=item C<int mysqli_get_client_version(void)>

Get MySQL client info

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_client_version'
    not_implemented()
.end

=item C<string mysqli_get_host_info(object link)>

Get MySQL host info

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_host_info'
    not_implemented()
.end

=item C<int mysqli_get_proto_info(object link)>

Get MySQL protocol information

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_proto_info'
    not_implemented()
.end

=item C<string mysqli_get_server_info(object link)>

Get MySQL server info

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_server_info'
    not_implemented()
.end

=item C<int mysqli_get_server_version(object link)>

Return the MySQL version for the server referenced by the given link

NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_server_version'
    not_implemented()
.end

=item C<object mysqli_get_warnings(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_get_warnings'
    not_implemented()
.end

=item C<string mysqli_info(object link)>

Get information about the most recent query

NOT IMPLEMENTED.

=cut

.sub 'mysqli_info'
    not_implemented()
.end

=item C<resource mysqli_init(void)>

Initialize mysqli and return a resource for use with mysql_real_connect

NOT IMPLEMENTED.

=cut

.sub 'mysqli_init'
    not_implemented()
.end

=item C<mixed mysqli_insert_id(object link)>

Get the ID generated from the previous INSERT operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_insert_id'
    not_implemented()
.end

=item C<bool mysqli_kill(object link, int processid)>

Kill a mysql process on the server

NOT IMPLEMENTED.

=cut

.sub 'mysqli_kill'
    not_implemented()
.end

=item C<bool mysqli_master_query(object link, string query)>

Enforce execution of a query on the master in a master/slave setup

NOT IMPLEMENTED.

=cut

.sub 'mysqli_master_query'
    not_implemented()
.end

=item C<bool mysqli_more_results(object link)>

check if there any more query results from a multi query

NOT IMPLEMENTED.

=cut

.sub 'mysqli_more_results'
    not_implemented()
.end

=item C<bool mysqli_multi_query(object link, string query)>

Binary-safe version of mysql_query()

NOT IMPLEMENTED.

=cut

.sub 'mysqli_multi_query'
    not_implemented()
.end

=item C<bool mysqli_next_result(object link)>

read next result from multi_query

NOT IMPLEMENTED.

=cut

.sub 'mysqli_next_result'
    not_implemented()
.end

=item C<int mysqli_num_fields(object result)>

Get number of fields in result

NOT IMPLEMENTED.

=cut

.sub 'mysqli_num_fields'
    not_implemented()
.end

=item C<mixed mysqli_num_rows(object result)>

Get number of rows in result

NOT IMPLEMENTED.

=cut

.sub 'mysqli_num_rows'
    not_implemented()
.end

=item C<bool mysqli_options(object link, int flags, mixed values)>

Set options

NOT IMPLEMENTED.

=cut

.sub 'mysqli_options'
    not_implemented()
.end

=item C<bool mysqli_ping(object link)>

Ping a server connection or reconnect if there is no connection

NOT IMPLEMENTED.

=cut

.sub 'mysqli_ping'
    not_implemented()
.end

=item C<mixed mysqli_prepare(object link, string query)>

Prepare a SQL statement for execution

NOT IMPLEMENTED.

=cut

.sub 'mysqli_prepare'
    not_implemented()
.end

=item C<mixed mysqli_query(object link, string query [,int resultmode])>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_query'
    not_implemented()
.end

=item C<bool mysqli_real_connect(object link [,string hostname [,string username [,string passwd [,string dbname [,int port [,string socket [,int flags]]]]]]])>

Open a connection to a mysql server

NOT IMPLEMENTED.

=cut

.sub 'mysqli_real_connect'
    not_implemented()
.end

=item C<string mysqli_real_escape_string(object link, string escapestr)>

Escapes special characters in a string for use in a SQL statement, taking into account the current charset of the connection

NOT IMPLEMENTED.

=cut

.sub 'mysqli_real_escape_string'
    not_implemented()
.end

=item C<bool mysqli_real_query(object link, string query)>

Binary-safe version of mysql_query()

NOT IMPLEMENTED.

=cut

.sub 'mysqli_real_query'
    not_implemented()
.end

=item C<bool mysqli_report(int flags)>

sets report level

NOT IMPLEMENTED.

=cut

.sub 'mysqli_report'
    not_implemented()
.end

=item C<bool mysqli_rollback(object link)>

Undo actions from current transaction

NOT IMPLEMENTED.

=cut

.sub 'mysqli_rollback'
    not_implemented()
.end

=item C<int mysqli_rpl_parse_enabled(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_rpl_parse_enabled'
    not_implemented()
.end

=item C<bool mysqli_rpl_probe(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_rpl_probe'
    not_implemented()
.end

=item C<int mysqli_rpl_query_type(string query)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_rpl_query_type'
    not_implemented()
.end

=item C<string mysqli_select_db(object link, string dbname)>

Select a MySQL database

NOT IMPLEMENTED.

=cut

.sub 'mysqli_select_db'
    not_implemented()
.end

=item C<bool mysqli_send_query(object link, string query)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_send_query'
    not_implemented()
.end

=item C<bool mysqli_set_charset(object link, string csname)>

sets client character set

NOT IMPLEMENTED.

=cut

.sub 'mysqli_set_charset'
    not_implemented()
.end

=item C<void mysqli_set_local_infile_default(object link)>

unsets user defined handler for load local infile command

NOT IMPLEMENTED.

=cut

.sub 'mysqli_set_local_infile_default'
    not_implemented()
.end

=item C<bool mysqli_set_local_infile_handler(object link, callback read_func)>

Set callback functions for LOAD DATA LOCAL INFILE

NOT IMPLEMENTED.

=cut

.sub 'mysqli_set_local_infile_handler'
    not_implemented()
.end

=item C<bool mysqli_slave_query(object link, string query)>

Enforce execution of a query on a slave in a master/slave setup

NOT IMPLEMENTED.

=cut

.sub 'mysqli_slave_query'
    not_implemented()
.end

=item C<string mysqli_sqlstate(object link)>

Returns the SQLSTATE error from previous MySQL operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_sqlstate'
    not_implemented()
.end

=item C<bool mysqli_ssl_set(object link ,string key ,string cert ,string ca ,string capath ,string cipher])>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_ssl_set'
    not_implemented()
.end

=item C<mixed mysqli_stat(object link)>

Get current system status

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stat'
    not_implemented()
.end

=item C<mixed mysqli_stmt_affected_rows(object stmt)>

Return the number of rows affected in the last query for the given link

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_affected_rows'
    not_implemented()
.end

=item C<int mysqli_stmt_attr_get(object stmt, long attr)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_attr_get'
    not_implemented()
.end

=item C<int mysqli_stmt_attr_set(object stmt, long attr, long mode)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_attr_set'
    not_implemented()
.end

=item C<bool mysqli_stmt_bind_param(object stmt, string types, mixed variable [,mixed,....])>

Bind variables to a prepared statement as parameters

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_bind_param'
    not_implemented()
.end

=item C<bool mysqli_stmt_bind_result(object stmt, mixed var, [,mixed, ...])>

Bind variables to a prepared statement for result storage

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_bind_result'
    not_implemented()
.end

=item C<bool mysqli_stmt_close(object stmt)>

Close statement

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_close'
    not_implemented()
.end

=item C<void mysqli_stmt_data_seek(object stmt, int offset)>

Move internal result pointer

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_data_seek'
    not_implemented()
.end

=item C<int mysqli_stmt_errno(object stmt)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_errno'
    not_implemented()
.end

=item C<string mysqli_stmt_error(object stmt)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_error'
    not_implemented()
.end

=item C<bool mysqli_stmt_execute(object stmt)>

Execute a prepared statement

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_execute'
    not_implemented()
.end

=item C<mixed mysqli_stmt_fetch(object stmt)>

Fetch results from a prepared statement into the bound variables

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_fetch'
    not_implemented()
.end

=item C<int mysqli_stmt_field_count(object stmt)>

Return the number of result columns for the given statement

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_field_count'
    not_implemented()
.end

=item C<void mysqli_stmt_free_result(object stmt)>

Free stored result memory for the given statement handle

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_free_result'
    not_implemented()
.end

=item C<object mysqli_stmt_get_warnings(object link)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_get_warnings'
    not_implemented()
.end

=item C<mixed mysqli_stmt_init(object link)>

Initialize statement object


NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_init'
    not_implemented()
.end

=item C<mixed mysqli_stmt_insert_id(object stmt)>

Get the ID generated from the previous INSERT operation

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_insert_id'
    not_implemented()
.end

=item C<mixed mysqli_stmt_num_rows(object stmt)>

Return the number of rows in statements result set

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_num_rows'
    not_implemented()
.end

=item C<int mysqli_stmt_param_count(object stmt)>

Return the number of parameter for the given statement

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_param_count'
    not_implemented()
.end

=item C<bool mysqli_stmt_prepare(object stmt, string query)>

prepare server side statement with query


NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_prepare'
    not_implemented()
.end

=item C<bool mysqli_stmt_reset(object stmt)>

reset a prepared statement

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_reset'
    not_implemented()
.end

=item C<mixed mysqli_stmt_result_metadata(object stmt)>

return result set from statement

NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_result_metadata'
    not_implemented()
.end

=item C<bool mysqli_stmt_send_long_data(object stmt, int param_nr, string data)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_send_long_data'
    not_implemented()
.end

=item C<string mysqli_stmt_sqlstate(object stmt)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_sqlstate'
    not_implemented()
.end

=item C<bool mysqli_stmt_store_result(stmt)>



NOT IMPLEMENTED.

=cut

.sub 'mysqli_stmt_store_result'
    not_implemented()
.end

=item C<object mysqli_store_result(object link)>

Buffer result set on client

NOT IMPLEMENTED.

=cut

.sub 'mysqli_store_result'
    not_implemented()
.end

=item C<int mysqli_thread_id(object link)>

Return the current thread ID

NOT IMPLEMENTED.

=cut

.sub 'mysqli_thread_id'
    not_implemented()
.end

=item C<bool mysqli_thread_safe(void)>

Return whether thread safety is given or not

NOT IMPLEMENTED.

=cut

.sub 'mysqli_thread_safe'
    not_implemented()
.end

=item C<mixed mysqli_use_result(object link)>

Directly retrieve query results - do not buffer results on client side

NOT IMPLEMENTED.

=cut

.sub 'mysqli_use_result'
    not_implemented()
.end

=item C<int mysqli_warning_count(object link)>

Return number of warnings from the last query for the given link

NOT IMPLEMENTED.

=cut

.sub 'mysqli_warning_count'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
