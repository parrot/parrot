/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/io/win32.c - Win32 Socket utility functions

=head1 DESCRIPTION

This file implements OS-specific Socket functions for Win32 platforms.

=head2 References

Win32 System Programming, 2nd Edition.

=head2 Functions

=over 4

=cut

*/

#ifdef WIN32
#  include <windows.h>
#endif

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_socket.h"

#ifdef PIO_OS_WIN32

/* HEADERIZER HFILE: include/parrot/io_win32.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void get_sockaddr_in(PARROT_INTERP,
    ARGIN(PMC * sockaddr),
    ARGIN(const char* host),
    int port)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_get_sockaddr_in __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sockaddr) \
    , PARROT_ASSERT_ARG(host))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Helper macros to get sockaddr_in */
#  define SOCKADDR_LOCAL(p) ((struct sockaddr_in*)VTABLE_get_pointer(interp, \
              PARROT_SOCKET((p))->local))
#  define SOCKADDR_REMOTE(p) ((struct sockaddr_in*)VTABLE_get_pointer(interp, \
              PARROT_SOCKET((p))->remote))

/*

=item C<INTVAL Parrot_io_socket_win32(PARROT_INTERP, PMC * s, int fam, int type,
int proto)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_socket_win32(PARROT_INTERP, ARGIN(PMC * s), int fam, int type, int proto)
{
    ASSERT_ARGS(Parrot_io_socket_win32)

    const int sock = socket(fam, type, proto);
    if (sock >= 0) {
        int       i    = 1;
        setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char*)&i, sizeof (i));
        Parrot_io_set_os_handle(interp, s, sock);
        SOCKADDR_REMOTE(s)->sin_family = fam;
        return 0;
    }
    return -1;
}

/*

=item C<INTVAL Parrot_io_connect_win32(PARROT_INTERP, PMC *socket, PMC *r)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

INTVAL
Parrot_io_connect_win32(PARROT_INTERP, ARGMOD(PMC *socket), ARGIN(PMC *r))
{
    ASSERT_ARGS(Parrot_io_connect_win32)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);

    if (!r)
        return -1;

    PARROT_SOCKET(socket)->remote = r;

AGAIN:
    if ((connect((int)io->os_handle, (struct sockaddr *)SOCKADDR_REMOTE(socket),
            sizeof (struct sockaddr_in))) != 0) {
        switch (errno) {
          case WSAEINTR:
            goto AGAIN;
          case WSAEINPROGRESS:
            goto AGAIN;
          case WSAEISCONN:
            return 0;
          default:
            return -1;
        }
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_bind_win32(PARROT_INTERP, PMC *socket, PMC *sockaddr)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

INTVAL
Parrot_io_bind_win32(PARROT_INTERP, ARGMOD(PMC *socket), ARGMOD(PMC *sockaddr))
{
    ASSERT_ARGS(Parrot_io_bind_win32)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
    struct sockaddr_in * saddr;

    if (!sockaddr)
        return -1;

    PARROT_SOCKET(socket)->local = sockaddr;

    saddr = SOCKADDR_LOCAL(socket);

    if ((bind((int)io->os_handle, (struct sockaddr *) saddr,
            sizeof (struct sockaddr_in))) == -1) {
        return -1;
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_listen_win32(PARROT_INTERP, PMC *socket, INTVAL sec)>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

INTVAL
Parrot_io_listen_win32(SHIM_INTERP, ARGMOD(PMC *socket), INTVAL sec)
{
    ASSERT_ARGS(Parrot_io_listen_win32)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
    if ((listen((int)io->os_handle, sec)) == -1) {
        return -1;
    }
    return 0;
}

/*

=item C<PMC * Parrot_io_accept_win32(PARROT_INTERP, PMC *socket)>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_accept_win32(PARROT_INTERP, ARGMOD(PMC *socket))
{
    ASSERT_ARGS(Parrot_io_accept_win32)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
    PMC * newio   = Parrot_io_new_socket_pmc(interp,
            PIO_F_SOCKET | PIO_F_READ|PIO_F_WRITE);
    Parrot_Socklen_t    addrlen = sizeof (struct sockaddr_in);
    struct sockaddr_in *saddr;
    int newsock;

    PARROT_SOCKET(newio)->local  = PARROT_SOCKET(socket)->local;
    PARROT_SOCKET(newio)->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);
    saddr                        = SOCKADDR_REMOTE(newio);

    newsock = accept((int)io->os_handle, (struct sockaddr *)saddr, &addrlen);

    if (newsock == -1) {
        return PMCNULL;
    }

    PARROT_SOCKET(newio)->os_handle = (void*)newsock;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket */

    return newio;
}

/*

=item C<INTVAL Parrot_io_send_win32(PARROT_INTERP, PMC *socket, STRING *s)>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_send_win32(SHIM_INTERP, ARGMOD(PMC *socket), ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_io_send_win32)
    int error, bytes, byteswrote;
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);

    bytes = s->bufused;
    byteswrote = 0;
AGAIN:
    /*
     * Ignore encoding issues for now.
     */
    if ((error = send((int)io->os_handle, (char *)s->strstart + byteswrote,
                    bytes, 0)) >= 0) {
        byteswrote += error;
        bytes -= error;
        if (!bytes) {
            return byteswrote;
        }
        goto AGAIN;
    }
    else {
        switch (errno) {
          case WSAEINTR:
            goto AGAIN;
#  ifdef WSAEWOULDBLOCK
          case WSAEWOULDBLOCK:
            goto AGAIN;
#  else
          case WSAEAGAIN:
            goto AGAIN;
#  endif
          case EPIPE:
            /* XXX why close it here and not below */
            close((int)io->os_handle);
            return -1;
          default:
            return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_recv_win32(PARROT_INTERP, PMC *socket, STRING **s)>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_recv_win32(PARROT_INTERP, ARGMOD(PMC *socket), ARGOUT(STRING **s))
{
    ASSERT_ARGS(Parrot_io_recv_win32)
    int error;
    unsigned int bytesread = 0;
    char buf[2048];
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);

AGAIN:
    if ((error = recv((int)io->os_handle, buf, 2048, 0)) >= 0) {
        bytesread += error;
        /* The charset should probably be 'binary', but right now httpd.pir
         * only works with 'ascii'
         */
        *s = string_make(interp, buf, bytesread, "ascii", 0);
        return bytesread;
    }
    else {
        switch (errno) {
          case EINTR:
            goto AGAIN;
#  ifdef WSAEWOULDBLOCK
          case WSAEWOULDBLOCK:
            goto AGAIN;
#  else
          case WSAEAGAIN:
            goto AGAIN;
#  endif
          case WSAECONNRESET:
            /* XXX why close it on err return result is -1 anyway */
            close((int)io->os_handle);
            *s = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);
            return -1;
          default:
            close((int)io->os_handle);
            *s = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);
            return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_poll_win32(PARROT_INTERP, PMC *socket, int which, int
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
Parrot_io_poll_win32(SHIM_INTERP, ARGMOD(PMC *socket), int which, int sec,
    int usec)
{
    ASSERT_ARGS(Parrot_io_poll_win32)
    int n;
    fd_set r, w, e;
    struct timeval t;
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);

    t.tv_sec = sec;
    t.tv_usec = usec;
    FD_ZERO(&r); FD_ZERO(&w); FD_ZERO(&e);
    /* These should be defined in header */
    if (which & 1) FD_SET((int)io->os_handle, &r);
    if (which & 2) FD_SET((int)io->os_handle, &w);
    if (which & 4) FD_SET((int)io->os_handle, &e);
AGAIN:
    if ((select((int)io->os_handle+1, &r, &w, &e, &t)) >= 0) {
        n = (FD_ISSET((int)io->os_handle, &r) ? 1 : 0);
        n |= (FD_ISSET((int)io->os_handle, &w) ? 2 : 0);
        n |= (FD_ISSET((int)io->os_handle, &e) ? 4 : 0);
        return n;
    }
    else {
        switch (errno) {
            case EINTR:        goto AGAIN;
            default:           return -1;
        }
    }
}

/*

=item C<static void get_sockaddr_in(PARROT_INTERP, PMC * sockaddr, const char*
host, int port)>

Get a C<sockaddr_in> structure to connect to the given host.

=cut

*/

static void
get_sockaddr_in(PARROT_INTERP, ARGIN(PMC * sockaddr), ARGIN(const char* host),
            int port)
{
    ASSERT_ARGS(get_sockaddr_in)
    struct sockaddr_in *sa;
    /* Hard coded to IPv4 for now */
    const int family = AF_INET;

    sa = (struct sockaddr_in*)VTABLE_get_pointer(interp, sockaddr);
    sa->sin_addr.S_un.S_addr = inet_addr(host);
    if (sa->sin_addr.S_un.S_addr != -1) {
        /* Success converting numeric IP */
    }
    else {
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

    sa->sin_family = family;
    sa->sin_port = htons(port);
}

/*

=item C<PMC * Parrot_io_sockaddr_in(PARROT_INTERP, STRING *addr, INTVAL port)>

Create a new Sockaddr PMC to connect to the given address and port.

=cut

*/


PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_sockaddr_in(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port)
{
    ASSERT_ARGS(Parrot_io_sockaddr_in)
    PMC  * sockaddr;
    char * const s = Parrot_str_to_cstring(interp, addr);
    sockaddr = Parrot_pmc_new(interp, enum_class_Sockaddr);
    get_sockaddr_in(interp, sockaddr, s, port);
    Parrot_str_free_cstring(s);
    return sockaddr;
}

#endif /* PIO_OS_WIN32 */

/*

=back

=head1 SEE ALSO

F<src/io/win32.c>,
F<src/io/win32_socket.c>,
F<src/io/io.c>,
F<src/io/io_private.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
