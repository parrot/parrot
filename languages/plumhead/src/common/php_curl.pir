# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_curl.pir - PHP curl  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void curl_close(resource ch)>

Close a cURL session

NOT IMPLEMENTED.

=cut

.sub 'curl_close'
    not_implemented()
.end

=item C<resource curl_copy_handle(resource ch)>

Copy a cURL handle along with all of it's preferences

NOT IMPLEMENTED.

=cut

.sub 'curl_copy_handle'
    not_implemented()
.end

=item C<int curl_errno(resource ch)>

Return an integer containing the last error number

NOT IMPLEMENTED.

=cut

.sub 'curl_errno'
    not_implemented()
.end

=item C<string curl_error(resource ch)>

Return a string contain the last error for the current session

NOT IMPLEMENTED.

=cut

.sub 'curl_error'
    not_implemented()
.end

=item C<bool curl_exec(resource ch)>

Perform a cURL session

NOT IMPLEMENTED.

=cut

.sub 'curl_exec'
    not_implemented()
.end

=item C<mixed curl_getinfo(resource ch [, int option])>

Get information regarding a specific transfer

NOT IMPLEMENTED.

=cut

.sub 'curl_getinfo'
    not_implemented()
.end

=item C<resource curl_init([string url])>

Initialize a cURL session

NOT IMPLEMENTED.

=cut

.sub 'curl_init'
    not_implemented()
.end

=item C<int curl_multi_add_handle(resource mh, resource ch)>

Add a normal cURL handle to a cURL multi handle

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_add_handle'
    not_implemented()
.end

=item C<void curl_multi_close(resource mh)>

Close a set of cURL handles

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_close'
    not_implemented()
.end

=item C<int curl_multi_exec(resource mh, int &still_running)>

Run the sub-connections of the current cURL handle

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_exec'
    not_implemented()
.end

=item C<string curl_multi_getcontent(resource ch)>

Return the content of a cURL handle if CURLOPT_RETURNTRANSFER is set

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_getcontent'
    not_implemented()
.end

=item C<array curl_multi_info_read(resource mh [, long msgs_in_queue])>

Get information about the current transfers

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_info_read'
    not_implemented()
.end

=item C<resource curl_multi_init(void)>

Returns a new cURL multi handle

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_init'
    not_implemented()
.end

=item C<int curl_multi_remove_handle(resource mh, resource ch)>

Remove a multi handle from a set of cURL handles

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_remove_handle'
    not_implemented()
.end

=item C<int curl_multi_select(resource mh[, double timeout])>

Get all the sockets associated with the cURL extension, which can then be "selected"

NOT IMPLEMENTED.

=cut

.sub 'curl_multi_select'
    not_implemented()
.end

=item C<bool curl_setopt(resource ch, int option, mixed value)>

Set an option for a cURL transfer

NOT IMPLEMENTED.

=cut

.sub 'curl_setopt'
    not_implemented()
.end

=item C<bool curl_setopt_array(resource ch, array options)>

Set an array of option for a cURL transfer

NOT IMPLEMENTED.

=cut

.sub 'curl_setopt_array'
    not_implemented()
.end

=item C<array curl_version([int version])>

Return cURL version information.

NOT IMPLEMENTED.

=cut

.sub 'curl_version'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
