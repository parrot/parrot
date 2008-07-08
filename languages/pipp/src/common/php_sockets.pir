# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sockets.pir - PHP sockets  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<resource socket_accept(resource socket)>

Accepts a connection on the listening socket fd

NOT IMPLEMENTED.

=cut

.sub 'socket_accept'
    not_implemented()
.end

=item C<bool socket_bind(resource socket, string addr [, int port])>

Binds an open socket to a listening port, port is only specified in AF_INET family.

NOT IMPLEMENTED.

=cut

.sub 'socket_bind'
    not_implemented()
.end

=item C<void socket_clear_error([resource socket])>

Clears the error on the socket or the last error code.

NOT IMPLEMENTED.

=cut

.sub 'socket_clear_error'
    not_implemented()
.end

=item C<void socket_close(resource socket)>

Closes a file descriptor

NOT IMPLEMENTED.

=cut

.sub 'socket_close'
    not_implemented()
.end

=item C<bool socket_connect(resource socket, string addr [, int port])>

Opens a connection to addr:port on the socket specified by socket

NOT IMPLEMENTED.

=cut

.sub 'socket_connect'
    not_implemented()
.end

=item C<resource socket_create(int domain, int type, int protocol)>

Creates an endpoint for communication in the domain specified by domain, of type specified by type

NOT IMPLEMENTED.

=cut

.sub 'socket_create'
    not_implemented()
.end

=item C<resource socket_create_listen(int port[, int backlog])>

Opens a socket on port to accept connections

NOT IMPLEMENTED.

=cut

.sub 'socket_create_listen'
    not_implemented()
.end

=item C<bool socket_create_pair(int domain, int type, int protocol, array &fd)>

Creates a pair of indistinguishable sockets and stores them in fds.

NOT IMPLEMENTED.

=cut

.sub 'socket_create_pair'
    not_implemented()
.end

=item C<mixed socket_get_option(resource socket, int level, int optname)>

Gets socket options for the socket

NOT IMPLEMENTED.

=cut

.sub 'socket_get_option'
    not_implemented()
.end

=item C<bool socket_getpeername(resource socket, string &addr[, int &port])>

Queries the remote side of the given socket which may either result in host/port or in a UNIX filesystem path, dependent on its type.

NOT IMPLEMENTED.

=cut

.sub 'socket_getpeername'
    not_implemented()
.end

=item C<bool socket_getsockname(resource socket, string &addr[, int &port])>

Queries the remote side of the given socket which may either result in host/port or in a UNIX filesystem path, dependent on its type.

NOT IMPLEMENTED.

=cut

.sub 'socket_getsockname'
    not_implemented()
.end

=item C<int socket_last_error([resource socket])>

Returns the last socket error (either the last used or the provided socket resource)

NOT IMPLEMENTED.

=cut

.sub 'socket_last_error'
    not_implemented()
.end

=item C<bool socket_listen(resource socket[, int backlog])>

Sets the maximum number of connections allowed to be waited for on the socket specified by fd

NOT IMPLEMENTED.

=cut

.sub 'socket_listen'
    not_implemented()
.end

=item C<string socket_read(resource socket, int length [, int type])>

Reads a maximum of length bytes from socket

NOT IMPLEMENTED.

=cut

.sub 'socket_read'
    not_implemented()
.end

=item C<int socket_recv(resource socket, string &buf, int len, int flags)>

Receives data from a connected socket

NOT IMPLEMENTED.

=cut

.sub 'socket_recv'
    not_implemented()
.end

=item C<int socket_recvfrom(resource socket, string &buf, int len, int flags, string &name [, int &port])>

Receives data from a socket, connected or not

NOT IMPLEMENTED.

=cut

.sub 'socket_recvfrom'
    not_implemented()
.end

=item C<int socket_select(array &read_fds, array &write_fds, array &except_fds, int tv_sec[, int tv_usec])>

Runs the select() system call on the sets mentioned with a timeout specified by tv_sec and tv_usec

NOT IMPLEMENTED.

=cut

.sub 'socket_select'
    not_implemented()
.end

=item C<int socket_send(resource socket, string buf, int len, int flags)>

Sends data to a connected socket

NOT IMPLEMENTED.

=cut

.sub 'socket_send'
    not_implemented()
.end

=item C<int socket_sendto(resource socket, string buf, int len, int flags, string addr [, int port])>

Sends a message to a socket, whether it is connected or not

NOT IMPLEMENTED.

=cut

.sub 'socket_sendto'
    not_implemented()
.end

=item C<bool socket_set_block(resource socket)>

Sets blocking mode on a socket resource

NOT IMPLEMENTED.

=cut

.sub 'socket_set_block'
    not_implemented()
.end

=item C<bool socket_set_nonblock(resource socket)>

Sets nonblocking mode on a socket resource

NOT IMPLEMENTED.

=cut

.sub 'socket_set_nonblock'
    not_implemented()
.end

=item C<bool socket_set_option(resource socket, int level, int optname, int|array optval)>

Sets socket options for the socket

NOT IMPLEMENTED.

=cut

.sub 'socket_set_option'
    not_implemented()
.end

=item C<bool socket_shutdown(resource socket[, int how])>

Shuts down a socket for receiving, sending, or both.

NOT IMPLEMENTED.

=cut

.sub 'socket_shutdown'
    not_implemented()
.end

=item C<string socket_strerror(int errno)>

Returns a string describing an error

NOT IMPLEMENTED.

=cut

.sub 'socket_strerror'
    not_implemented()
.end

=item C<int socket_write(resource socket, string buf[, int length])>

Writes the buffer to the socket resource, length is optional

NOT IMPLEMENTED.

=cut

.sub 'socket_write'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
