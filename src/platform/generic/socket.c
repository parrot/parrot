/*
Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

src/platform/generic/socket.c - UNIX socket functions

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../../io/io_private.h"
#include "pmc/pmc_socket.h"

/* Windows defines file handles as void * and sockets as unsigned int.
 * We use void * for Windows PIOHANDLEs, so we have to cast them for the
 * socket API.
 */

#ifdef _WIN32

#  define PIO_INVALID_SOCKET    INVALID_SOCKET

#  define PIO_SOCK_ERRNO        WSAGetLastError()

#  define PIO_SOCK_EINTR        WSAEINTR
#  define PIO_SOCK_EINPROGRESS  WSAEINPROGRESS
#  define PIO_SOCK_EISCONN      WSAEISCONN
#  define PIO_SOCK_ECONNRESET   WSAECONNRESET
#  define PIO_SOCK_EWOULDBLOCK  WSAEWOULDBLOCK

typedef SOCKET PIOSOCKET;

#else

#  define PIO_INVALID_SOCKET      -1

#  define PIO_SOCK_ERRNO          errno

#  define PIO_SOCK_EINTR          EINTR
#  define PIO_SOCK_EINPROGRESS    EINPROGRESS
#  define PIO_SOCK_EISCONN        EISCONN
#  define PIO_SOCK_ECONNRESET     ECONNRESET

#  ifdef EWOULDBLOCK
#    define PIO_SOCK_EWOULDBLOCK  EWOULDBLOCK
#  else
#    define PIO_SOCK_EWOULDBLOCK  EAGAIN
#  endif

typedef int PIOSOCKET;

#endif

/* HEADERIZER HFILE: none */

/*

=back

=head2 Networking

These could be native extensions but they probably should be here if we
wish to make them integrated with the async IO system.

Very minimal stubs for now, maybe someone will run with these.

=over 4

=cut

*/

/*

=item C<PIOHANDLE Parrot_io_socket(PARROT_INTERP, int fam, int type, int proto)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PIOHANDLE
Parrot_io_socket(PARROT_INTERP, int fam, int type, int proto)
{
    const PIOSOCKET sock = socket(fam, type, proto);
    int i = 1;

    if (sock == PIO_INVALID_SOCKET)
        return PIO_INVALID_HANDLE;

    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &i, sizeof (i));

    return (PIOHANDLE)sock;
}

/*

=item C<INTVAL Parrot_io_connect(PARROT_INTERP, PIOHANDLE os_handle, void
*addr)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

INTVAL
Parrot_io_connect(PARROT_INTERP, PIOHANDLE os_handle, ARGIN(void *addr))
{
AGAIN:
    if ((connect((PIOSOCKET)os_handle, (struct sockaddr *)addr,
            sizeof (struct sockaddr_in))) != 0) {
        switch (PIO_SOCK_ERRNO) {
          case PIO_SOCK_EINTR:
            goto AGAIN;
          case PIO_SOCK_EINPROGRESS:
            goto AGAIN;
          case PIO_SOCK_EISCONN:
            return 0;
          default:
            return -1;
        }
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_bind(PARROT_INTERP, PIOHANDLE os_handle, void *addr)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

INTVAL
Parrot_io_bind(PARROT_INTERP, PIOHANDLE os_handle, ARGMOD(void *addr))
{
    struct sockaddr_in * saddr;

    if ((bind((PIOSOCKET)os_handle, (struct sockaddr *)addr,
            sizeof (struct sockaddr_in))) == -1) {
        return -1;
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_listen(PARROT_INTERP, PIOHANDLE os_handle, INTVAL sec)>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

INTVAL
Parrot_io_listen(SHIM_INTERP, PIOHANDLE os_handle, INTVAL sec)
{
    if ((listen((PIOSOCKET)os_handle, sec)) == -1) {
        return -1;
    }
    return 0;
}

/*

=item C<PIOHANDLE Parrot_io_accept(PARROT_INTERP, PIOHANDLE os_handle, void
*addr)>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PIOHANDLE
Parrot_io_accept(PARROT_INTERP, PIOHANDLE os_handle, ARGOUT(void *addr))
{
    Parrot_Socklen_t addrlen = sizeof (struct sockaddr_in);
    PIOSOCKET newsock;

    newsock = accept((PIOSOCKET)os_handle, (struct sockaddr *)addr, &addrlen);

    if (newsock == PIO_INVALID_SOCKET)
        return PIO_INVALID_HANDLE;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket */

    return (PIOHANDLE)newsock;
}

/*

=item C<INTVAL Parrot_io_send(PARROT_INTERP, PIOHANDLE os_handle, const char
*buf, size_t len)>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_send(PARROT_INTERP, PIOHANDLE os_handle, ARGIN(const char *buf),
        size_t len)
{
    int error, byteswrote;

    byteswrote = 0;
AGAIN:
    if ((error = send((PIOSOCKET)os_handle, buf + byteswrote, len, 0)) >= 0) {
        byteswrote += error;
        len        -= error;
        if (!len) {
            return byteswrote;
        }
        goto AGAIN;
    }
    else {
        switch (PIO_SOCK_ERRNO) {
          case PIO_SOCK_EINTR:
          case PIO_SOCK_EWOULDBLOCK:
            goto AGAIN;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Write error: %s", strerror(errno));
        }
    }
}

/*

=item C<INTVAL Parrot_io_recv(PARROT_INTERP, PIOHANDLE os_handle, char *buf,
size_t len)>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_recv(PARROT_INTERP, PIOHANDLE os_handle, ARGOUT(char *buf), size_t len)
{
    int error;
    unsigned int bytesread = 0;

AGAIN:
    if ((error = recv((PIOSOCKET)os_handle, buf, len, 0)) >= 0) {
        bytesread += error;
        return bytesread;
    }
    else {
        switch (PIO_SOCK_ERRNO) {
          case PIO_SOCK_EINTR:
          case PIO_SOCK_EWOULDBLOCK:
            goto AGAIN;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Read error: %s", strerror(errno));
        }
    }
}

/*

=item C<INTVAL Parrot_io_poll(PARROT_INTERP, PIOHANDLE os_handle, int which, int
sec, int usec)>

Utility function for polling a single IO stream with a timeout.

Returns a 1 | 2 | 4 (read, write, error) value.

This is not equivalent to any specific POSIX or BSD socket call, but
it is a useful, common primitive.

Not at all useful --leo.

Also, a buffering layer above this may choose to reimplement by checking
the read buffer.

=cut

*/

INTVAL
Parrot_io_poll(SHIM_INTERP, PIOHANDLE os_handle, int which, int sec,
    int usec)
{
    fd_set r, w, e;
    struct timeval t;
    PIOSOCKET sock = (PIOSOCKET)os_handle;

    t.tv_sec = sec;
    t.tv_usec = usec;
    FD_ZERO(&r); FD_ZERO(&w); FD_ZERO(&e);
    /* These should be defined in header */
    if (which & 1) FD_SET(sock, &r);
    if (which & 2) FD_SET(sock, &w);
    if (which & 4) FD_SET(sock, &e);
AGAIN:
    if ((select(sock + 1, &r, &w, &e, &t)) >= 0) {
        int n;
        n = (FD_ISSET(sock, &r) ? 1 : 0);
        n |= (FD_ISSET(sock, &w) ? 2 : 0);
        n |= (FD_ISSET(sock, &e) ? 4 : 0);
        return n;
    }
    else {
        switch (PIO_SOCK_ERRNO) {
            case PIO_SOCK_EINTR:  goto AGAIN;
            default:              return -1;
        }
    }
}

/*

=item C<void Parrot_io_sockaddr_in(PARROT_INTERP, void *addr, STRING *host_str,
int port)>

Fill in a C<sockaddr_in> structure to connect to the specified host and port.

=cut

*/

void
Parrot_io_sockaddr_in(PARROT_INTERP, ARGOUT(void *addr),
        ARGIN(STRING *host_str), int port)
{
    char * const host   = Parrot_str_to_cstring(interp, host_str);
    /* Hard coded to IPv4 for now */
    const int    family = AF_INET;
    int          success;

    struct sockaddr_in * const sa = (struct sockaddr_in*)addr;

#ifdef _WIN32
    sa->sin_addr.S_un.S_addr = inet_addr(host);
    success = sa->sin_addr.S_un.S_addr != -1;
#else
#  ifdef PARROT_DEF_INET_ATON
    success = inet_aton(host, &sa->sin_addr) != 0;
#  else
    /* positive retval is success */
    success = inet_pton(family, host, &sa->sin_addr) > 0;
#  endif
#endif

    if (!success) {
        /* Maybe it is a hostname, try to lookup */
        /* XXX Check PIO option before doing a name lookup,
         * it may have been toggled off.
         */
        struct hostent *he = gethostbyname(host);
        /* XXX FIXME - Handle error condition better */
        if (!he) {
            fprintf(stderr, "gethostbyname failure [%s]\n", host);
            return;
        }
        memcpy((char*)&sa->sin_addr, he->h_addr, sizeof (sa->sin_addr));
    }

    Parrot_str_free_cstring(host);

    sa->sin_family = family;
    sa->sin_port = htons(port);
}

/*

=item C<INTVAL Parrot_io_close_socket(PARROT_INTERP, PIOHANDLE handle)>

Closes the given file descriptor.  Returns 0 on success, -1 on error.

=cut

*/

INTVAL
Parrot_io_close_socket(SHIM_INTERP, PIOHANDLE handle)
{
#ifdef _WIN32
    return closesocket((PIOSOCKET)handle);
#else
    return close((PIOSOCKET)handle);
#endif
}



/*

=back

=head1 SEE ALSO

F<src/io/common.c>,
F<src/io/win32.c>,
F<src/io/stdio.c>,
F<src/io/io_private.h>,
F<include/parrot/io.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
