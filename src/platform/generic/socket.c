/*
Copyright (C) 2001-2011, Parrot Foundation.

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
#include "pmc/pmc_sockaddr.h"

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

#if PARROT_HAS_SOCKLEN_T
typedef socklen_t Parrot_Socklen_t;
#else
typedef int Parrot_Socklen_t;
#endif

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

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

=item C<PMC * Parrot_io_getaddrinfo(PARROT_INTERP, STRING *addr, INTVAL port,
INTVAL protocol, INTVAL family, INTVAL passive)>

C<Parrot_io_getaddrinfo()> calls get_addrinfo() to convert hostnames or IP
addresses to sockaddrs (and more) and returns an Addrinfo PMC which can be
passed to C<Parrot_io_connect_unix()> or C<Parrot_io_bind_unix()>.

=cut

*/

/* TODO: where to move this to? originally from src/io/socket_api.c */
static int pio_pf[PIO_PF_MAX+1] = {
#ifdef PF_LOCAL
    PF_LOCAL,   /* PIO_PF_LOCAL */
#else
    -1,         /* PIO_PF_LOCAL */
#endif
#ifdef PF_UNIX
    PF_UNIX,    /* PIO_PF_UNIX */
#else
    -1,         /* PIO_PF_UNIX */
#endif
#ifdef PF_INET
    PF_INET,    /* PIO_PF_INET */
#else
    -1,         /* PIO_PF_INET */
#endif
#ifdef PF_INET6
    PF_INET6,   /* PIO_PF_INET6 */
#else
    -1,         /* PIO_PF_INET6 */
#endif
};

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_getaddrinfo(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port,
        INTVAL protocol, INTVAL family, INTVAL passive)
{
    char *s;
    PMC *array;

    /* set family: 0 means any (AF_INET or AF_INET6) for getaddrinfo, so treat
     * it specially */
    int fam = (family != 0 ? pio_pf[family] : 0);

    struct addrinfo hints;
    struct addrinfo *ai, *walk;
    /* We need to pass the port as a string (because you could also use a
     * service specification from /etc/services). The highest port is 65535,
     * so we need 5 characters + trailing null-byte. */
    char portstr[6];
    int  ret;

    if (STRING_IS_NULL(addr))
        s = NULL;
    else
        s = Parrot_str_to_cstring(interp, addr);

    memset(&hints, 0, sizeof (struct addrinfo));
    if (passive)
        hints.ai_flags = AI_PASSIVE;

    hints.ai_family   = fam;
    hints.ai_protocol = protocol;

    snprintf(portstr, sizeof (portstr), "%ld", port);

    /* check return value *after* freeing cstring */
    ret = getaddrinfo(s, portstr, &hints, &ai);

    Parrot_str_free_cstring(s);

    if (ret != 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "getaddrinfo failed: %s", s ? s : "(null)");

    array = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);

    for (walk = ai; walk; walk = walk->ai_next) {
        PMC *sockaddr = Parrot_pmc_new(interp, enum_class_Sockaddr);

        VTABLE_set_pointer(interp, sockaddr, walk);
        VTABLE_push_pmc(interp, array, sockaddr);
    }

    freeaddrinfo(ai);

    return array;
}

/*

=item C<STRING * Parrot_io_getnameinfo(PARROT_INTERP, const void *sa, INTVAL
len)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_getnameinfo(PARROT_INTERP, ARGIN(const void *sa), INTVAL len)
{
    /* TODO: get hostname, not only numeric */
    char buf[INET6_ADDRSTRLEN+1];
    /* numeric port maximum is 65535, so 5 chars */
    char portbuf[6];

    getnameinfo((const struct sockaddr *)sa, len, buf, sizeof (buf),
            portbuf, sizeof (portbuf), NI_NUMERICHOST | NI_NUMERICSERV);

    return Parrot_str_format_data(interp, "%s:%s", buf, portbuf);
}

/*

=item C<PIOHANDLE Parrot_io_socket(PARROT_INTERP, int fam, int type, int proto)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_socket(PARROT_INTERP, int fam, int type, int proto)
{
    const PIOSOCKET sock = socket(fam, type, proto);
    const int value = 1;

    if (sock == PIO_INVALID_SOCKET)
        return PIO_INVALID_HANDLE;

    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &value, sizeof (value));

#ifdef IPV6_V6ONLY
    if (fam == AF_INET6)
        setsockopt(sock, IPPROTO_IPV6, IPV6_V6ONLY, &value, sizeof (value));
#endif

    return (PIOHANDLE)sock;
}

/*

=item C<INTVAL Parrot_io_connect(PARROT_INTERP, PIOHANDLE os_handle, void *addr,
INTVAL addr_len)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

INTVAL
Parrot_io_connect(PARROT_INTERP, PIOHANDLE os_handle, ARGIN(void *addr),
        INTVAL addr_len)
{
AGAIN:
    if (connect((PIOSOCKET)os_handle, (struct sockaddr *)addr, addr_len) != 0) {
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

=item C<INTVAL Parrot_io_bind(PARROT_INTERP, PIOHANDLE os_handle, void *addr,
INTVAL addr_len)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

INTVAL
Parrot_io_bind(PARROT_INTERP, PIOHANDLE os_handle, ARGMOD(void *addr),
        INTVAL addr_len)
{
    if (bind((PIOSOCKET)os_handle, (struct sockaddr *)addr, addr_len) != 0) {
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

=item C<PIOHANDLE Parrot_io_accept(PARROT_INTERP, PIOHANDLE os_handle, PMC *
remote_addr)>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PIOHANDLE
Parrot_io_accept(PARROT_INTERP, PIOHANDLE os_handle, ARGOUT(PMC * remote_addr))
{
    struct sockaddr * addr = (struct sockaddr *)VTABLE_get_pointer(interp, remote_addr);
    Parrot_Socklen_t addrlen = sizeof (struct sockaddr_in);
    PIOSOCKET newsock;

    newsock = accept((PIOSOCKET)os_handle, addr, &addrlen);

    if (newsock == PIO_INVALID_SOCKET)
        return PIO_INVALID_HANDLE;

    /* Set the length for the remote sockaddr PMC so that it can distinguish
     * between sockaddr_in and sockaddr_in6 */
    PARROT_SOCKADDR(remote_addr)->len = addrlen;

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
