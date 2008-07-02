# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pdo.pir - PHP pdo  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void PDO::__construct(string dsn, string username, string passwd [, array options])>



NOT IMPLEMENTED.

=cut

.sub 'PDO::__construct'
    not_implemented()
.end

=item C<int PDO::__sleep()>

Prevents serialization of a PDO instance

NOT IMPLEMENTED.

=cut

.sub 'PDO::__sleep'
    not_implemented()
.end

=item C<int PDO::__wakeup()>

Prevents use of a PDO instance that has been unserialized

NOT IMPLEMENTED.

=cut

.sub 'PDO::__wakeup'
    not_implemented()
.end

=item C<bool PDO::beginTransaction()>

Initiates a transaction

NOT IMPLEMENTED.

=cut

.sub 'PDO::beginTransaction'
    not_implemented()
.end

=item C<bool PDO::commit()>

Commit a transaction

NOT IMPLEMENTED.

=cut

.sub 'PDO::commit'
    not_implemented()
.end

=item C<string PDO::errorCode()>

Fetch the error code associated with the last operation on the database handle

NOT IMPLEMENTED.

=cut

.sub 'PDO::errorCode'
    not_implemented()
.end

=item C<int PDO::errorInfo()>

Fetch extended error information associated with the last operation on the database handle

NOT IMPLEMENTED.

=cut

.sub 'PDO::errorInfo'
    not_implemented()
.end

=item C<long PDO::exec(string query)>

Execute a query that does not return a row set, returning the number of affected rows

NOT IMPLEMENTED.

=cut

.sub 'PDO::exec'
    not_implemented()
.end

=item C<mixed PDO::getAttribute(long attribute)>

Get an attribute

NOT IMPLEMENTED.

=cut

.sub 'PDO::getAttribute'
    not_implemented()
.end

=item C<string PDO::lastInsertId([string seqname])>

Returns the id of the last row that we affected on this connection.  Some databases require a sequence or table name to be passed in.  Not always meaningful.

NOT IMPLEMENTED.

=cut

.sub 'PDO::lastInsertId'
    not_implemented()
.end

=item C<object PDO::prepare(string statment [, array options])>

Prepares a statement for execution and returns a statement object

NOT IMPLEMENTED.

=cut

.sub 'PDO::prepare'
    not_implemented()
.end

=item C<object PDO::query(string sql [, PDOStatement::setFetchMode() args])>

Prepare and execute $sql; returns the statement object for iteration

NOT IMPLEMENTED.

=cut

.sub 'PDO::query'
    not_implemented()
.end

=item C<string PDO::quote(string string [, int paramtype])>

quotes string for use in a query.  The optional paramtype acts as a hint for drivers that have alternate quoting styles.  The default value is PDO_PARAM_STR

NOT IMPLEMENTED.

=cut

.sub 'PDO::quote'
    not_implemented()
.end

=item C<bool PDO::rollBack()>

roll back a transaction

NOT IMPLEMENTED.

=cut

.sub 'PDO::rollBack'
    not_implemented()
.end

=item C<bool PDO::setAttribute(long attribute, mixed value)>

Set an attribute

NOT IMPLEMENTED.

=cut

.sub 'PDO::setAttribute'
    not_implemented()
.end

=item C<int PDOStatement::__sleep()>

Prevents serialization of a PDOStatement instance

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::__sleep'
    not_implemented()
.end

=item C<int PDOStatement::__wakeup()>

Prevents use of a PDOStatement instance that has been unserialized

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::__wakeup'
    not_implemented()
.end

=item C<bool PDOStatement::bindColumn(mixed $column, mixed &$param [, int $type [, int $maxlen [, mixed $driverdata]]])>

bind a column to a PHP variable.  On each row fetch $param will contain the value of the corresponding column.  $column is the 1-based offset of the column, or the column name.  For portability, don't call this before execute().

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::bindColumn'
    not_implemented()
.end

=item C<bool PDOStatement::bindParam(mixed $paramno, mixed &$param [, int $type [, int $maxlen [, mixed $driverdata]]])>

bind a parameter to a PHP variable.  $paramno is the 1-based position of the placeholder in the SQL statement (but can be the parameter name for drivers that support named placeholders).  This isn't supported by all drivers.  It should be called prior to execute().

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::bindParam'
    not_implemented()
.end

=item C<bool PDOStatement::bindValue(mixed $paramno, mixed $param [, int $type ])>

bind an input parameter to the value of a PHP variable.  $paramno is the 1-based position of the placeholder in the SQL statement (but can be the parameter name for drivers that support named placeholders).  It should be called prior to execute().

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::bindValue'
    not_implemented()
.end

=item C<bool PDOStatement::closeCursor()>

Closes the cursor, leaving the statement ready for re-execution.

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::closeCursor'
    not_implemented()
.end

=item C<int PDOStatement::columnCount()>

Returns the number of columns in the result set

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::columnCount'
    not_implemented()
.end

=item C<void PDOStatement::debugDumpParams()>

A utility for internals hackers to debug parameter internals

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::debugDumpParams'
    not_implemented()
.end

=item C<string PDOStatement::errorCode()>

Fetch the error code associated with the last operation on the statement handle

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::errorCode'
    not_implemented()
.end

=item C<array PDOStatement::errorInfo()>

Fetch extended error information associated with the last operation on the statement handle

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::errorInfo'
    not_implemented()
.end

=item C<bool PDOStatement::execute([array $bound_input_params])>

Execute a prepared statement, optionally binding parameters

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::execute'
    not_implemented()
.end

=item C<mixed PDOStatement::fetch([int $how = PDO_FETCH_BOTH [, int $orientation [, int $offset]]])>

Fetches the next row and returns it, or false if there are no more rows

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::fetch'
    not_implemented()
.end

=item C<array PDOStatement::fetchAll([int $how = PDO_FETCH_BOTH [, string class_name [, NULL|array ctor_args]]])>

Returns an array of all of the results.

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::fetchAll'
    not_implemented()
.end

=item C<string PDOStatement::fetchColumn([int column_number])>

Returns a data of the specified column in the result set.

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::fetchColumn'
    not_implemented()
.end

=item C<mixed PDOStatement::fetchObject(string class_name [, NULL|array ctor_args])>

Fetches the next row and returns it as an object.

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::fetchObject'
    not_implemented()
.end

=item C<mixed PDOStatement::getAttribute(long attribute)>

Get an attribute

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::getAttribute'
    not_implemented()
.end

=item C<array PDOStatement::getColumnMeta(int $column)>

Returns meta data for a numbered column

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::getColumnMeta'
    not_implemented()
.end

=item C<bool PDOStatement::nextRowset()>

Advances to the next rowset in a multi-rowset statement handle. Returns true if it succeded, false otherwise

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::nextRowset'
    not_implemented()
.end

=item C<int PDOStatement::rowCount()>

Returns the number of rows in a result set, or the number of rows affected by the last execute().  It is not always meaningful.

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::rowCount'
    not_implemented()
.end

=item C<bool PDOStatement::setAttribute(long attribute, mixed value)>

Set an attribute

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::setAttribute'
    not_implemented()
.end

=item C<bool PDOStatement::setFetchMode(int mode [mixed* params])>

Changes the default fetch mode for subsequent fetches (params have different meaning for different fetch modes)

NOT IMPLEMENTED.

=cut

.sub 'PDOStatement::setFetchMode'
    not_implemented()
.end

=item C<array pdo_drivers()>

Return array of available PDO drivers

NOT IMPLEMENTED.

=cut

.sub 'pdo_drivers'
    not_implemented()
.end

=item C<array pdo_drivers()>

Return array of available PDO drivers

NOT IMPLEMENTED.

=cut

.sub 'pdo_drivers'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
