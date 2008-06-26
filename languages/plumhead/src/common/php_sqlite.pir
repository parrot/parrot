# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sqlite.pir - PHP sqlite  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array sqlite_array_query(resource db, string query [ , int result_type [, bool decode_binary]])>

Executes a query against a given database and returns an array of arrays.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_array_query'
    not_implemented()
.end

=item C<void sqlite_busy_timeout(resource db, int ms)>

Set busy timeout duration. If ms <= 0, all busy handlers are disabled.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_busy_timeout'
    not_implemented()
.end

=item C<int sqlite_changes(resource db)>

Returns the number of rows that were changed by the most recent SQL statement.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_changes'
    not_implemented()
.end

=item C<void sqlite_close(resource db)>

Closes an open sqlite database.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_close'
    not_implemented()
.end

=item C<mixed sqlite_column(resource result, mixed index_or_name [, bool decode_binary])>

Fetches a column from the current row of a result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_column'
    not_implemented()
.end

=item C<bool sqlite_create_aggregate(resource db, string funcname, mixed step_func, mixed finalize_func[, long num_args])>

Registers an aggregate function for queries.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_create_aggregate'
    not_implemented()
.end

=item C<bool sqlite_create_function(resource db, string funcname, mixed callback[, long num_args])>

Registers a "regular" function for queries.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_create_function'
    not_implemented()
.end

=item C<array sqlite_current(resource result [, int result_type [, bool decode_binary]])>

Fetches the current row from a result set as an array.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_current'
    not_implemented()
.end

=item C<string sqlite_error_string(int error_code)>

Returns the textual description of an error code.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_error_string'
    not_implemented()
.end

=item C<string sqlite_escape_string(string item)>

Escapes a string for use as a query parameter.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_escape_string'
    not_implemented()
.end

=item C<boolean sqlite_exec(string query, resource db[, string &error_message])>

Executes a result-less query against a given database

NOT IMPLEMENTED.

=cut

.sub 'sqlite_exec'
    not_implemented()
.end

=item C<object sqlite_factory(string filename [, int mode [, string &error_message]])>

Opens a SQLite database and creates an object for it. Will create the database if it does not exist.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_factory'
    not_implemented()
.end

=item C<array sqlite_fetch_all(resource result [, int result_type [, bool decode_binary]])>

Fetches all rows from a result set as an array of arrays.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_fetch_all'
    not_implemented()
.end

=item C<array sqlite_fetch_array(resource result [, int result_type [, bool decode_binary]])>

Fetches the next row from a result set as an array.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_fetch_array'
    not_implemented()
.end

=item C<resource sqlite_fetch_column_types(string table_name, resource db [, int result_type])>

Return an array of column types from a particular table.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_fetch_column_types'
    not_implemented()
.end

=item C<object sqlite_fetch_object(resource result [, string class_name [, NULL|array ctor_params [, bool decode_binary]]])>

Fetches the next row from a result set as an object.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_fetch_object'
    not_implemented()
.end

=item C<string sqlite_fetch_single(resource result [, bool decode_binary])>

Fetches the first column of a result set as a string.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_fetch_single'
    not_implemented()
.end

=item C<string sqlite_field_name(resource result, int field_index)>

Returns the name of a particular field of a result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_field_name'
    not_implemented()
.end

=item C<bool sqlite_has_prev(resource result)>

* Returns whether a previous row is available.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_has_prev'
    not_implemented()
.end

=item C<int sqlite_key(resource result)>

Return the current row index of a buffered result.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_key'
    not_implemented()
.end

=item C<int sqlite_last_error(resource db)>

Returns the error code of the last error for a database.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_last_error'
    not_implemented()
.end

=item C<int sqlite_last_insert_rowid(resource db)>

Returns the rowid of the most recently inserted row.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_last_insert_rowid'
    not_implemented()
.end

=item C<string sqlite_libencoding()>

Returns the encoding (iso8859 or UTF-8) of the linked SQLite library.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_libencoding'
    not_implemented()
.end

=item C<string sqlite_libversion()>

Returns the version of the linked SQLite library.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_libversion'
    not_implemented()
.end

=item C<bool sqlite_next(resource result)>

Seek to the next row number of a result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_next'
    not_implemented()
.end

=item C<int sqlite_num_fields(resource result)>

Returns the number of fields in a result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_num_fields'
    not_implemented()
.end

=item C<int sqlite_num_rows(resource result)>

Returns the number of rows in a buffered result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_num_rows'
    not_implemented()
.end

=item C<resource sqlite_open(string filename [, int mode [, string &error_message]])>

Opens a SQLite database. Will create the database if it does not exist.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_open'
    not_implemented()
.end

=item C<resource sqlite_popen(string filename [, int mode [, string &error_message]])>

Opens a persistent handle to a SQLite database. Will create the database if it does not exist.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_popen'
    not_implemented()
.end

=item C<bool sqlite_prev(resource result)>

* Seek to the previous row number of a result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_prev'
    not_implemented()
.end

=item C<resource sqlite_query(string query, resource db [, int result_type [, string &error_message]])>

Executes a query against a given database and returns a result handle.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_query'
    not_implemented()
.end

=item C<bool sqlite_rewind(resource result)>

Seek to the first row number of a buffered result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_rewind'
    not_implemented()
.end

=item C<bool sqlite_seek(resource result, int row)>

Seek to a particular row number of a buffered result set.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_seek'
    not_implemented()
.end

=item C<array sqlite_single_query(resource db, string query [, bool first_row_only [, bool decode_binary]])>

Executes a query and returns either an array for one single column or the value of the first row.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_single_query'
    not_implemented()
.end

=item C<string sqlite_udf_decode_binary(string data)>

Decode binary encoding on a string parameter passed to an UDF.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_udf_decode_binary'
    not_implemented()
.end

=item C<string sqlite_udf_encode_binary(string data)>

Apply binary encoding (if required) to a string to return from an UDF.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_udf_encode_binary'
    not_implemented()
.end

=item C<resource sqlite_unbuffered_query(string query, resource db [ , int result_type [, string &error_message]])>

Executes a query that does not prefetch and buffer all data.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_unbuffered_query'
    not_implemented()
.end

=item C<bool sqlite_valid(resource result)>

Returns whether more rows are available.

NOT IMPLEMENTED.

=cut

.sub 'sqlite_valid'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
