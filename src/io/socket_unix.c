/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/io/unix.c - UNIX IO utility functions

=head1 DESCRIPTION

This file implements unbuffered, low-level, UNIX-specific functionality.
"UNIX" is a generalization, it may be necessary to create separate OS-specific
functions for UNIX flavors.

These functions are not part of Parrot's API. Don't call them directly, call
the C<PIO_*> macros instead. Each platform defines the standard set of macros,
which call the correct functions for that platform.

=head2 References:

APitUE - W. Richard Stevens, AT&T SFIO, Perl 5 (Nick Ing-Simmons)

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_socket.h"

#ifdef PIO_OS_UNIX

#  include <sys/socket.h>

/* HEADERIZER HFILE: include/parrot/io_unix.h */

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

/*
static void get_sockaddr_in(PARROT_INTERP, ARGIN(PMC * sockaddr),
    ARGIN(const char* host), ARGIN(int port));
*/

/*

=back

=head2 Networking

These could be native extensions but they probably should be here if we
wish to make them integrated with the async IO system.

Very minimal stubs for now, maybe someone will run with these.

=over 4

=item C<PMC * Parrot_io_sockaddr_in(PARROT_INTERP, STRING *addr, INTVAL port)>

C<Parrot_io_sockaddr_in()> is not part of the layer and so must be C<extern>.

XXX: We can probably just write our own routines (C<htons()>,
C<inet_aton()>, etc.) and take this out of platform specific compilation

=cut

*/

/* Helper macros to get sockaddr_in */
#  define SOCKADDR_LOCAL(p) ((struct sockaddr_in*)VTABLE_get_pointer(interp, \
                PARROT_SOCKET((p))->local))
#  define SOCKADDR_REMOTE(p) ((struct sockaddr_in*)VTABLE_get_pointer(interp, \
                PARROT_SOCKET((p))->remote))


PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_sockaddr_in(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port)
{
    ASSERT_ARGS(Parrot_io_sockaddr_in)

    char * const s        = Parrot_str_to_cstring(interp, addr);
    PMC  * const sockaddr = Parrot_pmc_new(interp, enum_class_Sockaddr);

    get_sockaddr_in(interp, sockaddr, s, port);
    Parrot_str_free_cstring(s);
    return sockaddr;
}


/*

=item C<INTVAL Parrot_io_socket_unix(PARROT_INTERP, PMC *s, int fam, int type,
int proto)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_socket_unix(PARROT_INTERP, ARGIN(PMC *s), int fam, int type, int proto)
{
    ASSERT_ARGS(Parrot_io_socket_unix)
    const int sock = socket(fam, type, proto);
    if (sock >= 0) {
        int i = 1;
        setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &i, sizeof (i));
        Parrot_io_set_os_handle(interp, s, sock);
        SOCKADDR_REMOTE(s)->sin_family = fam;
        return 0;
    }
    return -1;
}

/*

=item C<INTVAL Parrot_io_connect_unix(PARROT_INTERP, PMC *socket, PMC *r)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

INTVAL
Parrot_io_connect_unix(PARROT_INTERP, ARGMOD(PMC *socket), ARGIN(PMC *r))
{
    ASSERT_ARGS(Parrot_io_connect_unix)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);

    if (!r)
        return -1;

    PARROT_SOCKET(socket)->remote = r;

AGAIN:
    if ((connect(io->os_handle, (struct sockaddr *)SOCKADDR_REMOTE(socket),
            sizeof (struct sockaddr_in))) != 0) {
        switch (errno) {
          case EINTR:
            goto AGAIN;
          case EINPROGRESS:
            goto AGAIN;
          case EISCONN:
            return 0;
          default:
            return -1;
        }
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_bind_unix(PARROT_INTERP, PMC *socket, PMC *sockaddr)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

INTVAL
Parrot_io_bind_unix(PARROT_INTERP, ARGMOD(PMC *socket), ARGMOD(PMC *sockaddr))
{
    ASSERT_ARGS(Parrot_io_bind_unix)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
    struct sockaddr_in * saddr;

    if (!sockaddr)
        return -1;

    PARROT_SOCKET(socket)->local = sockaddr;

    saddr = SOCKADDR_LOCAL(socket);

    if ((bind(io->os_handle, (struct sockaddr *) saddr,
            sizeof (struct sockaddr_in))) == -1) {
        return -1;
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_listen_unix(PARROT_INTERP, PMC *socket, INTVAL sec)>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

INTVAL
Parrot_io_listen_unix(SHIM_INTERP, ARGMOD(PMC *socket), INTVAL sec)
{
    ASSERT_ARGS(Parrot_io_listen_unix)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
    if ((listen(io->os_handle, sec)) == -1) {
        return -1;
    }
    return 0;
}

/*

=item C<PMC * Parrot_io_accept_unix(PARROT_INTERP, PMC *socket)>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_accept_unix(PARROT_INTERP, ARGMOD(PMC *socket))
{
    ASSERT_ARGS(Parrot_io_accept_unix)
    Parrot_Socket_attributes * io = PARROT_SOCKET(socket);
    PMC * newio   = Parrot_io_new_socket_pmc(interp,
            PIO_F_SOCKET | PIO_F_READ|PIO_F_WRITE);
    Parrot_Socklen_t    addrlen = sizeof (struct sockaddr_in);
    struct sockaddr_in *saddr;
    int newsock;

    PARROT_SOCKET(newio)->local  = PARROT_SOCKET(socket)->local;
    PARROT_SOCKET(newio)->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);
    saddr                        = SOCKADDR_REMOTE(newio);

    newsock = accept(io->os_handle, (struct sockaddr *)saddr, &addrlen);

    if (newsock == -1) {
        return PMCNULL;
    }

    PARROT_SOCKET(newio)->os_handle = newsock;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket */

    return newio;
}

/*

=item C<INTVAL Parrot_io_send_unix(PARROT_INTERP, PMC *socket, STRING *s)>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_send_unix(SHIM_INTERP, ARGMOD(PMC *socket), ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_io_send_unix)
    int error, bytes, byteswrote;
    Parrot_Socket_attributes * io = PARROT_SOCKET(socket);

    bytes = s->bufused;
    byteswrote = 0;
AGAIN:
    /*
     * Ignore encoding issues for now.
     */
    if ((error = send(io->os_handle, (char *)s->strstart + byteswrote,
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
          case EINTR:
            goto AGAIN;
#  ifdef EWOULDBLOCK
          case EWOULDBLOCK:
            goto AGAIN;
#  else
          case EAGAIN:
            goto AGAIN;
#  endif
          case EPIPE:
            /* XXX why close it here and not below */
            close(io->os_handle);
            return -1;
          default:
            return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_recv_unix(PARROT_INTERP, PMC *socket, STRING **s)>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_recv_unix(PARROT_INTERP, ARGMOD(PMC *socket), ARGOUT(STRING **s))
{
    ASSERT_ARGS(Parrot_io_recv_unix)
    int error;
    unsigned int bytesread = 0;
    char buf[2048];
    Parrot_Socket_attributes * io = PARROT_SOCKET(socket);

AGAIN:
    if ((error = recv(io->os_handle, buf, 2048, 0)) >= 0) {
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
#  ifdef EWOULDBLOCK
          case EWOULDBLOCK:
            goto AGAIN;
#  else
          case EAGAIN:
            goto AGAIN;
#  endif
          case ECONNRESET:
            /* XXX why close it on err return result is -1 anyway */
            close(io->os_handle);
            *s = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);
            return -1;
          default:
            close(io->os_handle);
            *s = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);
            return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_poll_unix(PARROT_INTERP, PMC *socket, int which, int
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
Parrot_io_poll_unix(SHIM_INTERP, ARGMOD(PMC *socket), int which, int sec,
    int usec)
{
    ASSERT_ARGS(Parrot_io_poll_unix)
    fd_set r, w, e;
    struct timeval t;
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);

    t.tv_sec = sec;
    t.tv_usec = usec;
    FD_ZERO(&r); FD_ZERO(&w); FD_ZERO(&e);
    /* These should be defined in header */
    if (which & 1) FD_SET(io->os_handle, &r);
    if (which & 2) FD_SET(io->os_handle, &w);
    if (which & 4) FD_SET(io->os_handle, &e);
AGAIN:
    if ((select(io->os_handle+1, &r, &w, &e, &t)) >= 0) {
        int n;
        n = (FD_ISSET(io->os_handle, &r) ? 1 : 0);
        n |= (FD_ISSET(io->os_handle, &w) ? 2 : 0);
        n |= (FD_ISSET(io->os_handle, &e) ? 4 : 0);
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

Get a new C<sockaddr_in> structure for the given PMC to connect to the
specified host and port.

=cut

*/

static void
get_sockaddr_in(PARROT_INTERP, ARGIN(PMC * sockaddr), ARGIN(const char* host),
            int port)
{
    ASSERT_ARGS(get_sockaddr_in)
    /* Hard coded to IPv4 for now */
    const int family = AF_INET;

    struct sockaddr_in * const sa = (struct sockaddr_in*)VTABLE_get_pointer(interp, sockaddr);
#  ifdef PARROT_DEF_INET_ATON
    if (inet_aton(host, &sa->sin_addr) != 0) {
#  else
    /* positive retval is success */
    if (inet_pton(family, host, &sa->sin_addr) > 0) {
#  endif
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


#endif /* PIO_OS_UNIX */

/*

=back

=head1 SEE ALSO

F<src/io/common.c>,
F<src/io/win32.c>,
F<src/io/stdio.c>,
F<src/io/io_private.h>,
F<include/parrot/io_unix.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
