# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sybase_ct.pir - PHP sybase_ct  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int sybase_affected_rows([int link_id])>

Get number of affected rows in last query

NOT IMPLEMENTED.

=cut

.sub 'sybase_affected_rows'
    not_implemented()
.end

=item C<bool sybase_close([int link_id])>

Close Sybase connection

NOT IMPLEMENTED.

=cut

.sub 'sybase_close'
    not_implemented()
.end

=item C<int sybase_connect([string host [, string user [, string password [, string charset [, string appname]]]]])>

Open Sybase server connection

NOT IMPLEMENTED.

=cut

.sub 'sybase_connect'
    not_implemented()
.end

=item C<bool sybase_data_seek(int result, int offset)>

Move internal row pointer

NOT IMPLEMENTED.

=cut

.sub 'sybase_data_seek'
    not_implemented()
.end

=item C<void sybase_deadlock_retry_count(int retry_count)>

Sets deadlock retry count

NOT IMPLEMENTED.

=cut

.sub 'sybase_deadlock_retry_count'
    not_implemented()
.end

=item C<array sybase_fetch_array(int result)>

Fetch row as array

NOT IMPLEMENTED.

=cut

.sub 'sybase_fetch_array'
    not_implemented()
.end

=item C<array sybase_fetch_assoc(int result)>

Fetch row as array without numberic indices

NOT IMPLEMENTED.

=cut

.sub 'sybase_fetch_assoc'
    not_implemented()
.end

=item C<object sybase_fetch_field(int result [, int offset])>

Get field information

NOT IMPLEMENTED.

=cut

.sub 'sybase_fetch_field'
    not_implemented()
.end

=item C<object sybase_fetch_object(int result [, mixed object])>

Fetch row as object

NOT IMPLEMENTED.

=cut

.sub 'sybase_fetch_object'
    not_implemented()
.end

=item C<array sybase_fetch_row(int result)>

Get row as enumerated array

NOT IMPLEMENTED.

=cut

.sub 'sybase_fetch_row'
    not_implemented()
.end

=item C<bool sybase_field_seek(int result, int offset)>

Set field offset

NOT IMPLEMENTED.

=cut

.sub 'sybase_field_seek'
    not_implemented()
.end

=item C<bool sybase_free_result(int result)>

Free result memory

NOT IMPLEMENTED.

=cut

.sub 'sybase_free_result'
    not_implemented()
.end

=item C<string sybase_get_last_message(void)>

Returns the last message from server (over min_message_severity)

NOT IMPLEMENTED.

=cut

.sub 'sybase_get_last_message'
    not_implemented()
.end

=item C<void sybase_min_client_severity(int severity)>

Sets minimum client severity

NOT IMPLEMENTED.

=cut

.sub 'sybase_min_client_severity'
    not_implemented()
.end

=item C<void sybase_min_server_severity(int severity)>

Sets minimum server severity

NOT IMPLEMENTED.

=cut

.sub 'sybase_min_server_severity'
    not_implemented()
.end

=item C<int sybase_num_fields(int result)>

Get number of fields in result

NOT IMPLEMENTED.

=cut

.sub 'sybase_num_fields'
    not_implemented()
.end

=item C<int sybase_num_rows(int result)>

Get number of rows in result

NOT IMPLEMENTED.

=cut

.sub 'sybase_num_rows'
    not_implemented()
.end

=item C<int sybase_pconnect([string host [, string user [, string password [, string charset [, string appname]]]]])>

Open persistent Sybase connection

NOT IMPLEMENTED.

=cut

.sub 'sybase_pconnect'
    not_implemented()
.end

=item C<int sybase_query(string query [, int link_id])>

Send Sybase query

NOT IMPLEMENTED.

=cut

.sub 'sybase_query'
    not_implemented()
.end

=item C<string sybase_result(int result, int row, mixed field)>

Get result data

NOT IMPLEMENTED.

=cut

.sub 'sybase_result'
    not_implemented()
.end

=item C<bool sybase_select_db(string database [, int link_id])>

Select Sybase database

NOT IMPLEMENTED.

=cut

.sub 'sybase_select_db'
    not_implemented()
.end

=item C<bool sybase_set_message_handler(mixed error_func [, resource connection])>

Set the error handler, to be called when a server message is raised.
If error_func is NULL the handler will be deleted

NOT IMPLEMENTED.

=cut

.sub 'sybase_set_message_handler'
    not_implemented()
.end

=item C<int sybase_unbuffered_query(string query [, int link_id])>

Send Sybase query

NOT IMPLEMENTED.

=cut

.sub 'sybase_unbuffered_query'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
