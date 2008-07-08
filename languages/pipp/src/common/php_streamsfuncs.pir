# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_streamsfuncs.pir - PHP streamsfuncs Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<resource stream_context_create([array options])>

Create a file context and optionally set parameters

NOT IMPLEMENTED.

=cut

.sub 'stream_context_create'
    not_implemented()
.end

=item C<resource stream_context_get_default([array options])>

Get a handle on the default file/stream context and optionally set parameters

NOT IMPLEMENTED.

=cut

.sub 'stream_context_get_default'
    not_implemented()
.end

=item C<array stream_context_get_options(resource context|resource stream)>

Retrieve options for a stream/wrapper/context

NOT IMPLEMENTED.

=cut

.sub 'stream_context_get_options'
    not_implemented()
.end

=item C<bool stream_context_set_option(resource context|resource stream, string wrappername, string optionname, mixed value)>

Set an option for a wrapper

NOT IMPLEMENTED.

=cut

.sub 'stream_context_set_option'
    not_implemented()
.end

=item C<bool stream_context_set_params(resource context|resource stream, array options)>

Set parameters for a file context

NOT IMPLEMENTED.

=cut

.sub 'stream_context_set_params'
    not_implemented()
.end

=item C<long stream_copy_to_stream(resource source, resource dest [, long maxlen [, long pos]])>

Reads up to maxlen bytes from source stream and writes them to dest stream.

NOT IMPLEMENTED.

=cut

.sub 'stream_copy_to_stream'
    not_implemented()
.end

=item C<resource stream_filter_append(resource stream, string filtername[, int read_write[, string filterparams]])>

Append a filter to a stream

NOT IMPLEMENTED.

=cut

.sub 'stream_filter_append'
    not_implemented()
.end

=item C<resource stream_filter_prepend(resource stream, string filtername[, int read_write[, string filterparams]])>

Prepend a filter to a stream

NOT IMPLEMENTED.

=cut

.sub 'stream_filter_prepend'
    not_implemented()
.end

=item C<bool stream_filter_remove(resource stream_filter)>

Flushes any data in the filter's internal buffer, removes it from the chain, and frees the resource

NOT IMPLEMENTED.

=cut

.sub 'stream_filter_remove'
    not_implemented()
.end

=item C<long stream_get_contents(resource source [, long maxlen [, long offset]])>

Reads all remaining bytes (or up to maxlen bytes) from a stream and returns them as a string.

NOT IMPLEMENTED.

=cut

.sub 'stream_get_contents'
    not_implemented()
.end

=item C<string stream_get_line(resource stream, int maxlen [, string ending])>

Read up to maxlen bytes from a stream or until the ending string is found

NOT IMPLEMENTED.

=cut

.sub 'stream_get_line'
    not_implemented()
.end

=item C<array stream_get_meta_data(resource fp)>

Retrieves header/meta data from streams/file pointers

NOT IMPLEMENTED.

=cut

.sub 'stream_get_meta_data'
    not_implemented()
.end

=item C<array stream_get_transports()>

Retrieves list of registered socket transports

NOT IMPLEMENTED.

=cut

.sub 'stream_get_transports'
    not_implemented()
.end

=item C<array stream_get_wrappers()>

Retrieves list of registered stream wrappers

NOT IMPLEMENTED.

=cut

.sub 'stream_get_wrappers'
    not_implemented()
.end

=item C<bool stream_is_local(resource stream|string url)>



NOT IMPLEMENTED.

=cut

.sub 'stream_is_local'
    not_implemented()
.end

=item C<int stream_select(array &read_streams, array &write_streams, array &except_streams, int tv_sec[, int tv_usec])>

Runs the select() system call on the sets of streams with a timeout specified by tv_sec and tv_usec

NOT IMPLEMENTED.

=cut

.sub 'stream_select'
    not_implemented()
.end

=item C<bool stream_set_blocking(resource socket, int mode)>

Set blocking/non-blocking mode on a socket or stream

NOT IMPLEMENTED.

=cut

.sub 'stream_set_blocking'
    not_implemented()
.end

=item C<bool stream_set_timeout(resource stream, int seconds, int microseconds)>

Set timeout on stream read to seconds + microseonds

NOT IMPLEMENTED.

=cut

.sub 'stream_set_timeout'
    not_implemented()
.end

=item C<int stream_set_write_buffer(resource fp, int buffer)>

Set file write buffer

NOT IMPLEMENTED.

=cut

.sub 'stream_set_write_buffer'
    not_implemented()
.end

=item C<resource stream_socket_accept(resource serverstream, [ double timeout, string &peername ])>

Accept a client connection from a server socket

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_accept'
    not_implemented()
.end

=item C<resource stream_socket_client(string remoteaddress [, long &errcode, string &errstring, double timeout, long flags, resource context])>

Open a client connection to a remote address

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_client'
    not_implemented()
.end

=item C<int stream_socket_enable_crypto(resource stream, bool enable [, int cryptokind, resource sessionstream])>

Enable or disable a specific kind of crypto on the stream

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_enable_crypto'
    not_implemented()
.end

=item C<string stream_socket_get_name(resource stream, bool want_peer)>

Returns either the locally bound or remote name for a socket stream

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_get_name'
    not_implemented()
.end

=item C<array stream_socket_pair(int domain, int type, int protocol)>

Creates a pair of connected, indistinguishable socket streams

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_pair'
    not_implemented()
.end

=item C<string stream_socket_recvfrom(resource stream, long amount [, long flags [, string &remote_addr]])>

Receives data from a socket stream

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_recvfrom'
    not_implemented()
.end

=item C<long stream_socket_sendto(resouce stream, string data [, long flags [, string target_addr]])>

Send data to a socket stream.  If target_addr is specified it must be in dotted quad (or [ipv6]) format

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_sendto'
    not_implemented()
.end

=item C<resource stream_socket_server(string localaddress [, long &errcode, string &errstring, long flags, resource context])>

Create a server socket bound to localaddress

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_server'
    not_implemented()
.end

=item C<int stream_socket_shutdown(resource stream, int how)>

causes all or part of a full-duplex connection on the socket associated
with stream to be shut down.  If how is SHUT_RD,  further receptions will
be disallowed. If how is SHUT_WR, further transmissions will be disallowed.
If how is SHUT_RDWR,  further  receptions and transmissions will be
disallowed.

NOT IMPLEMENTED.

=cut

.sub 'stream_socket_shutdown'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
