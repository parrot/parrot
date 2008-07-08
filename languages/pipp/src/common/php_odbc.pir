# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_odbc.pir - PHP odbc  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool birdstep_autocommit(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_autocommit'
    not_implemented()
.end

=item C<bool birdstep_close(int id)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_close'
    not_implemented()
.end

=item C<bool birdstep_commit(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_commit'
    not_implemented()
.end

=item C<int birdstep_connect(string server, string user, string pass)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_connect'
    not_implemented()
.end

=item C<int birdstep_exec(int index, string exec_str)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_exec'
    not_implemented()
.end

=item C<bool birdstep_fetch(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_fetch'
    not_implemented()
.end

=item C<string birdstep_fieldname(int index, int col)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_fieldname'
    not_implemented()
.end

=item C<int birdstep_fieldnum(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_fieldnum'
    not_implemented()
.end

=item C<bool birdstep_freeresult(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_freeresult'
    not_implemented()
.end

=item C<bool birdstep_off_autocommit(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_off_autocommit'
    not_implemented()
.end

=item C<mixed birdstep_result(int index, int col)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_result'
    not_implemented()
.end

=item C<bool birdstep_rollback(int index)>



NOT IMPLEMENTED.

=cut

.sub 'birdstep_rollback'
    not_implemented()
.end

=item C<mixed odbc_autocommit(resource connection_id [, int OnOff])>

Toggle autocommit mode or get status

NOT IMPLEMENTED.

=cut

.sub 'odbc_autocommit'
    not_implemented()
.end

=item C<bool odbc_binmode(int result_id, int mode)>

Handle binary column data

NOT IMPLEMENTED.

=cut

.sub 'odbc_binmode'
    not_implemented()
.end

=item C<void odbc_close(resource connection_id)>

Close an ODBC connection

NOT IMPLEMENTED.

=cut

.sub 'odbc_close'
    not_implemented()
.end

=item C<void odbc_close_all(void)>

Close all ODBC connections

NOT IMPLEMENTED.

=cut

.sub 'odbc_close_all'
    not_implemented()
.end

=item C<resource odbc_columnprivileges(resource connection_id, string catalog, string schema, string table, string column)>

Returns a result identifier that can be used to fetch a list of columns and associated privileges for the specified table

NOT IMPLEMENTED.

=cut

.sub 'odbc_columnprivileges'
    not_implemented()
.end

=item C<resource odbc_columns(resource connection_id [, string qualifier [, string owner [, string table_name [, string column_name]]]])>

Returns a result identifier that can be used to fetch a list of column names in specified tables

NOT IMPLEMENTED.

=cut

.sub 'odbc_columns'
    not_implemented()
.end

=item C<bool odbc_commit(resource connection_id)>

Commit an ODBC transaction

NOT IMPLEMENTED.

=cut

.sub 'odbc_commit'
    not_implemented()
.end

=item C<resource odbc_connect(string DSN, string user, string password [, int cursor_option])>

Connect to a datasource

NOT IMPLEMENTED.

=cut

.sub 'odbc_connect'
    not_implemented()
.end

=item C<string odbc_cursor(resource result_id)>

Get cursor name

NOT IMPLEMENTED.

=cut

.sub 'odbc_cursor'
    not_implemented()
.end

=item C<array odbc_data_source(resource connection_id, int fetch_type)>

Return information about the currently connected data source

NOT IMPLEMENTED.

=cut

.sub 'odbc_data_source'
    not_implemented()
.end

=item C<string odbc_error([resource connection_id])>

Get the last error code

NOT IMPLEMENTED.

=cut

.sub 'odbc_error'
    not_implemented()
.end

=item C<string odbc_errormsg([resource connection_id])>

Get the last error message

NOT IMPLEMENTED.

=cut

.sub 'odbc_errormsg'
    not_implemented()
.end

=item C<resource odbc_exec(resource connection_id, string query [, int flags])>

Prepare and execute an SQL statement

NOT IMPLEMENTED.

=cut

.sub 'odbc_exec'
    not_implemented()
.end

=item C<bool odbc_execute(resource result_id [, array parameters_array])>

Execute a prepared statement

NOT IMPLEMENTED.

=cut

.sub 'odbc_execute'
    not_implemented()
.end

=item C<array odbc_fetch_array(int result [, int rownumber])>

Fetch a result row as an associative array

NOT IMPLEMENTED.

=cut

.sub 'odbc_fetch_array'
    not_implemented()
.end

=item C<int odbc_fetch_into(resource result_id, array result_array, [, int rownumber])>

Fetch one result row into an array

NOT IMPLEMENTED.

=cut

.sub 'odbc_fetch_into'
    not_implemented()
.end

=item C<object odbc_fetch_object(int result [, int rownumber])>

Fetch a result row as an object

NOT IMPLEMENTED.

=cut

.sub 'odbc_fetch_object'
    not_implemented()
.end

=item C<bool odbc_fetch_row(resource result_id [, int row_number])>

Fetch a row

NOT IMPLEMENTED.

=cut

.sub 'odbc_fetch_row'
    not_implemented()
.end

=item C<int odbc_field_len(resource result_id, int field_number)>

Get the length (precision) of a column

NOT IMPLEMENTED.

=cut

.sub 'odbc_field_len'
    not_implemented()
.end

=item C<string odbc_field_name(resource result_id, int field_number)>

Get a column name

NOT IMPLEMENTED.

=cut

.sub 'odbc_field_name'
    not_implemented()
.end

=item C<int odbc_field_num(resource result_id, string field_name)>

Return column number

NOT IMPLEMENTED.

=cut

.sub 'odbc_field_num'
    not_implemented()
.end

=item C<int odbc_field_scale(resource result_id, int field_number)>

Get the scale of a column

NOT IMPLEMENTED.

=cut

.sub 'odbc_field_scale'
    not_implemented()
.end

=item C<string odbc_field_type(resource result_id, int field_number)>

Get the datatype of a column

NOT IMPLEMENTED.

=cut

.sub 'odbc_field_type'
    not_implemented()
.end

=item C<resource odbc_foreignkeys(resource connection_id, string pk_qualifier, string pk_owner, string pk_table, string fk_qualifier, string fk_owner, string fk_table)>

Returns a result identifier to either a list of foreign keys in the specified table or a list of foreign keys in other tables that refer to the primary key in the specified table

NOT IMPLEMENTED.

=cut

.sub 'odbc_foreignkeys'
    not_implemented()
.end

=item C<bool odbc_free_result(resource result_id)>

Free resources associated with a result

NOT IMPLEMENTED.

=cut

.sub 'odbc_free_result'
    not_implemented()
.end

=item C<resource odbc_gettypeinfo(resource connection_id [, int data_type])>

Returns a result identifier containing information about data types supported by the data source

NOT IMPLEMENTED.

=cut

.sub 'odbc_gettypeinfo'
    not_implemented()
.end

=item C<bool odbc_longreadlen(int result_id, int length)>

Handle LONG columns

NOT IMPLEMENTED.

=cut

.sub 'odbc_longreadlen'
    not_implemented()
.end

=item C<bool odbc_next_result(resource result_id)>

Checks if multiple results are avaiable

NOT IMPLEMENTED.

=cut

.sub 'odbc_next_result'
    not_implemented()
.end

=item C<int odbc_num_fields(resource result_id)>

Get number of columns in a result

NOT IMPLEMENTED.

=cut

.sub 'odbc_num_fields'
    not_implemented()
.end

=item C<int odbc_num_rows(resource result_id)>

Get number of rows in a result

NOT IMPLEMENTED.

=cut

.sub 'odbc_num_rows'
    not_implemented()
.end

=item C<resource odbc_pconnect(string DSN, string user, string password [, int cursor_option])>

Establish a persistent connection to a datasource

NOT IMPLEMENTED.

=cut

.sub 'odbc_pconnect'
    not_implemented()
.end

=item C<resource odbc_prepare(resource connection_id, string query)>

Prepares a statement for execution

NOT IMPLEMENTED.

=cut

.sub 'odbc_prepare'
    not_implemented()
.end

=item C<resource odbc_primarykeys(resource connection_id, string qualifier, string owner, string table)>

Returns a result identifier listing the column names that comprise the primary key for a table

NOT IMPLEMENTED.

=cut

.sub 'odbc_primarykeys'
    not_implemented()
.end

=item C<resource odbc_procedurecolumns(resource connection_id [, string qualifier, string owner, string proc, string column])>

Returns a result identifier containing the list of input and output parameters, as well as the columns that make up the result set for the specified procedures

NOT IMPLEMENTED.

=cut

.sub 'odbc_procedurecolumns'
    not_implemented()
.end

=item C<resource odbc_procedures(resource connection_id [, string qualifier, string owner, string name])>

Returns a result identifier containg the list of procedure names in a datasource

NOT IMPLEMENTED.

=cut

.sub 'odbc_procedures'
    not_implemented()
.end

=item C<mixed odbc_result(resource result_id, mixed field)>

Get result data

NOT IMPLEMENTED.

=cut

.sub 'odbc_result'
    not_implemented()
.end

=item C<int odbc_result_all(resource result_id [, string format])>

Print result as HTML table

NOT IMPLEMENTED.

=cut

.sub 'odbc_result_all'
    not_implemented()
.end

=item C<bool odbc_rollback(resource connection_id)>

Rollback a transaction

NOT IMPLEMENTED.

=cut

.sub 'odbc_rollback'
    not_implemented()
.end

=item C<bool odbc_setoption(resource conn_id|result_id, int which, int option, int value)>

Sets connection or statement options

NOT IMPLEMENTED.

=cut

.sub 'odbc_setoption'
    not_implemented()
.end

=item C<resource odbc_specialcolumns(resource connection_id, int type, string qualifier, string owner, string table, int scope, int nullable)>

Returns a result identifier containing either the optimal set of columns that uniquely identifies a row in the table or columns that are automatically updated when any value in the row is updated by a transaction

NOT IMPLEMENTED.

=cut

.sub 'odbc_specialcolumns'
    not_implemented()
.end

=item C<resource odbc_statistics(resource connection_id, string qualifier, string owner, string name, int unique, int accuracy)>

Returns a result identifier that contains statistics about a single table and the indexes associated with the table

NOT IMPLEMENTED.

=cut

.sub 'odbc_statistics'
    not_implemented()
.end

=item C<resource odbc_tableprivileges(resource connection_id, string qualifier, string owner, string name)>

Returns a result identifier containing a list of tables and the privileges associated with each table

NOT IMPLEMENTED.

=cut

.sub 'odbc_tableprivileges'
    not_implemented()
.end

=item C<resource odbc_tables(resource connection_id [, string qualifier [, string owner [, string name [, string table_types]]]])>

Call the SQLTables function

NOT IMPLEMENTED.

=cut

.sub 'odbc_tables'
    not_implemented()
.end

=item C<bool solid_fetch_prev(resource result_id)>



NOT IMPLEMENTED.

=cut

.sub 'solid_fetch_prev'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
