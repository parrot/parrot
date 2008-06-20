# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_interbase.pir - PHP interbase  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool ibase_add_user(resource service_handle, string user_name, string password [, string first_name [, string middle_name [, string last_name]]])>

Add a user to security database

=cut

.sub 'ibase_add_user'
    not_implemented()
.end

=item C<int ibase_affected_rows( [ resource link_identifier ] )>

Returns the number of rows affected by the previous INSERT, UPDATE or DELETE statement

=cut

.sub 'ibase_affected_rows'
    not_implemented()
.end

=item C<mixed ibase_backup(resource service_handle, string source_db, string dest_file [, int options [, bool verbose]])>

Initiates a backup task in the service manager and returns immediately

=cut

.sub 'ibase_backup'
    not_implemented()
.end

=item C<bool ibase_blob_add(resource blob_handle, string data)>

Add data into created blob

=cut

.sub 'ibase_blob_add'
    not_implemented()
.end

=item C<bool ibase_blob_cancel(resource blob_handle)>

Cancel creating blob

=cut

.sub 'ibase_blob_cancel'
    not_implemented()
.end

=item C<string ibase_blob_close(resource blob_handle)>

Close blob

=cut

.sub 'ibase_blob_close'
    not_implemented()
.end

=item C<resource ibase_blob_create([resource link_identifier])>

Create blob for adding data

=cut

.sub 'ibase_blob_create'
    not_implemented()
.end

=item C<bool ibase_blob_echo([ resource link_identifier, ] string blob_id)>

Output blob contents to browser

=cut

.sub 'ibase_blob_echo'
    not_implemented()
.end

=item C<string ibase_blob_get(resource blob_handle, int len)>

Get len bytes data from open blob

=cut

.sub 'ibase_blob_get'
    not_implemented()
.end

=item C<string ibase_blob_import([ resource link_identifier, ] resource file)>

Create blob, copy file in it, and close it

=cut

.sub 'ibase_blob_import'
    not_implemented()
.end

=item C<array ibase_blob_info([ resource link_identifier, ] string blob_id)>

Return blob length and other useful info

=cut

.sub 'ibase_blob_info'
    not_implemented()
.end

=item C<resource ibase_blob_open([ resource link_identifier, ] string blob_id)>

Open blob for retrieving data parts

=cut

.sub 'ibase_blob_open'
    not_implemented()
.end

=item C<bool ibase_close([resource link_identifier])>

Close an InterBase connection

=cut

.sub 'ibase_close'
    not_implemented()
.end

=item C<bool ibase_commit( resource link_identifier )>

Commit transaction

=cut

.sub 'ibase_commit'
    not_implemented()
.end

=item C<bool ibase_commit_ret( resource link_identifier )>

Commit transaction and retain the transaction context

=cut

.sub 'ibase_commit_ret'
    not_implemented()
.end

=item C<resource ibase_connect(string database [, string username [, string password [, string charset [, int buffers [, int dialect [, string role]]]]]])>

Open a connection to an InterBase database

=cut

.sub 'ibase_connect'
    not_implemented()
.end

=item C<string ibase_db_info(resource service_handle, string db, int action [, int argument])>

Request statistics about a database

=cut

.sub 'ibase_db_info'
    not_implemented()
.end

=item C<bool ibase_delete_user(resource service_handle, string user_name, string password [, string first_name [, string middle_name [, string last_name]]])>

Delete a user from security database

=cut

.sub 'ibase_delete_user'
    not_implemented()
.end

=item C<bool ibase_drop_db([resource link_identifier])>

Drop an InterBase database

=cut

.sub 'ibase_drop_db'
    not_implemented()
.end

=item C<int ibase_errcode(void)>

Return error code

=cut

.sub 'ibase_errcode'
    not_implemented()
.end

=item C<string ibase_errmsg(void)>

Return error message

=cut

.sub 'ibase_errmsg'
    not_implemented()
.end

=item C<mixed ibase_execute(resource query [, mixed bind_arg [, mixed bind_arg [, ...]]])>

Execute a previously prepared query

=cut

.sub 'ibase_execute'
    not_implemented()
.end

=item C<array ibase_fetch_assoc(resource result [, int fetch_flags])>

Fetch a row  from the results of a query

=cut

.sub 'ibase_fetch_assoc'
    not_implemented()
.end

=item C<object ibase_fetch_object(resource result [, int fetch_flags])>

Fetch a object from the results of a query

=cut

.sub 'ibase_fetch_object'
    not_implemented()
.end

=item C<array ibase_fetch_row(resource result [, int fetch_flags])>

Fetch a row  from the results of a query

=cut

.sub 'ibase_fetch_row'
    not_implemented()
.end

=item C<array ibase_field_info(resource query_result, int field_number)>

Get information about a field

=cut

.sub 'ibase_field_info'
    not_implemented()
.end

=item C<bool ibase_free_event_handler(resource event)>

Frees the event handler set by ibase_set_event_handler()

=cut

.sub 'ibase_free_event_handler'
    not_implemented()
.end

=item C<bool ibase_free_query(resource query)>

Free memory used by a query

=cut

.sub 'ibase_free_query'
    not_implemented()
.end

=item C<bool ibase_free_result(resource result)>

Free the memory used by a result

=cut

.sub 'ibase_free_result'
    not_implemented()
.end

=item C<int ibase_gen_id(string generator [, int increment [, resource link_identifier ]])>

Increments the named generator and returns its new value

=cut

.sub 'ibase_gen_id'
    not_implemented()
.end

=item C<bool ibase_maintain_db(resource service_handle, string db, int action [, int argument])>

Execute a maintenance command on the database server

=cut

.sub 'ibase_maintain_db'
    not_implemented()
.end

=item C<bool ibase_modify_user(resource service_handle, string user_name, string password [, string first_name [, string middle_name [, string last_name]]])>

Modify a user in security database

=cut

.sub 'ibase_modify_user'
    not_implemented()
.end

=item C<bool ibase_name_result(resource result, string name)>

Assign a name to a result for use with ... WHERE CURRENT OF <name> statements

=cut

.sub 'ibase_name_result'
    not_implemented()
.end

=item C<int ibase_num_fields(resource query_result)>

Get the number of fields in result

=cut

.sub 'ibase_num_fields'
    not_implemented()
.end

=item C<int ibase_num_params(resource query)>

Get the number of params in a prepared query

=cut

.sub 'ibase_num_params'
    not_implemented()
.end

=item C<int ibase_num_rows( resource result_identifier )>

Return the number of rows that are available in a result

=cut

.sub 'ibase_num_rows'
    not_implemented()
.end

=item C<array ibase_param_info(resource query, int field_number)>

Get information about a parameter

=cut

.sub 'ibase_param_info'
    not_implemented()
.end

=item C<resource ibase_pconnect(string database [, string username [, string password [, string charset [, int buffers [, int dialect [, string role]]]]]])>

Open a persistent connection to an InterBase database

=cut

.sub 'ibase_pconnect'
    not_implemented()
.end

=item C<resource ibase_prepare([resource link_identifier, ] string query)>

Prepare a query for later execution

=cut

.sub 'ibase_prepare'
    not_implemented()
.end

=item C<mixed ibase_query([resource link_identifier, [ resource link_identifier, ]] string query [, mixed bind_arg [, mixed bind_arg [, ...]]])>

Execute a query

=cut

.sub 'ibase_query'
    not_implemented()
.end

=item C<mixed ibase_restore(resource service_handle, string source_file, string dest_db [, int options [, bool verbose]])>

Initiates a restore task in the service manager and returns immediately

=cut

.sub 'ibase_restore'
    not_implemented()
.end

=item C<bool ibase_rollback( resource link_identifier )>

Rollback transaction

=cut

.sub 'ibase_rollback'
    not_implemented()
.end

=item C<bool ibase_rollback_ret( resource link_identifier )>

Rollback transaction and retain the transaction context

=cut

.sub 'ibase_rollback_ret'
    not_implemented()
.end

=item C<string ibase_server_info(resource service_handle, int action)>

Request information about a database server

=cut

.sub 'ibase_server_info'
    not_implemented()
.end

=item C<resource ibase_service_attach(string host, string dba_username, string dba_password)>

Connect to the service manager

=cut

.sub 'ibase_service_attach'
    not_implemented()
.end

=item C<bool ibase_service_detach(resource service_handle)>

Disconnect from the service manager

=cut

.sub 'ibase_service_detach'
    not_implemented()
.end

=item C<resource ibase_set_event_handler([resource link_identifier,] callback handler, string event [, string event [, ...]])>

Register the callback for handling each of the named events

=cut

.sub 'ibase_set_event_handler'
    not_implemented()
.end

=item C<resource ibase_trans([int trans_args [, resource link_identifier [, ... ], int trans_args [, resource link_identifier [, ... ]] [, ...]]])>

Start a transaction over one or several databases

=cut

.sub 'ibase_trans'
    not_implemented()
.end

=item C<string ibase_wait_event([resource link_identifier,] string event [, string event [, ...]])>

Waits for any one of the passed Interbase events to be posted by the database, and returns its name

=cut

.sub 'ibase_wait_event'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
