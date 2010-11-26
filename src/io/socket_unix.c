/*
Copyright (C) 2001-2009, Parrot Foundation.

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
#include "pmc/pmc_sockaddr.h"

#ifdef PIO_OS_UNIX

#  include <sys/socket.h>

/* HEADERIZER HFILE: include/parrot/io_unix.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void get_addrinfo(PARROT_INTERP,
    ARGIN(PMC * addrinfo),
    ARGIN(const char *host),
    int port,
    int protocol,
    int family,
    int passive)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void get_sockaddr_in(PARROT_INTERP,
    ARGIN(PMC * sockaddr),
    ARGIN(const char* host),
    int port,
    const int family)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_get_addrinfo __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(addrinfo) \
    , PARROT_ASSERT_ARG(host))
#define ASSERT_ARGS_get_sockaddr_in __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sockaddr) \
    , PARROT_ASSERT_ARG(host))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*
static void get_sockaddr_in(PARROT_INTERP, ARGIN(PMC * sockaddr),
    ARGIN(const char* host), ARGIN(int port));
static void
get_addrinfo(PARROT_INTERP, ARGIN(PMC * addrinfo), ARGIN(const char *host), ARGIN(int port));
*/

/*

=back

=head2 Networking

These could be native extensions but they probably should be here if we
wish to make them integrated with the async IO system.

Very minimal stubs for now, maybe someone will run with these.

=over 4

=item C<PMC * Parrot_io_sockaddr_in(PARROT_INTERP, STRING *addr, INTVAL port,
INTVAL family)>

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
Parrot_io_sockaddr_in(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port, INTVAL family)
{
    ASSERT_ARGS(Parrot_io_sockaddr_in)

    char * const s        = Parrot_str_to_cstring(interp, addr);
    PMC  * const sockaddr = Parrot_pmc_new(interp, enum_class_Sockaddr);

    get_sockaddr_in(interp, sockaddr, s, port, family);
    Parrot_str_free_cstring(s);
    return sockaddr;
}

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
Parrot_io_getaddrinfo(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port, INTVAL protocol, INTVAL family, INTVAL passive)
{
    ASSERT_ARGS(Parrot_io_getaddrinfo)

    char * const s        = Parrot_str_to_cstring(interp, addr);
    PMC  * const addrinfo = Parrot_pmc_new(interp, enum_class_Addrinfo);

    /* set family: 0 means any (AF_INET or AF_INET6) for getaddrinfo, so treat
     * it specially */
    int fam = (family != 0 ? pio_pf[family] : 0);

    get_addrinfo(interp, addrinfo, s, port, protocol, fam, passive);
    Parrot_str_free_cstring(s);
    return addrinfo;
}


/*

=item C<PMC * Parrot_io_remote_address(PARROT_INTERP, PMC *sock)>

C<Parrot_io_remote_address()> returns the remote address of the given sock
PMC. It can be used to find out to which address the connection was actually
established (in case of the remote server having multiple IPv4 and/or IPv6
addresses.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_remote_address(PARROT_INTERP, ARGIN(PMC *sock))
{
    ASSERT_ARGS(Parrot_io_remote_address)

    PMC * const addrinfo = VTABLE_clone(interp, PARROT_SOCKET(sock)->remote);

    return addrinfo;
}

/*

=item C<PMC * Parrot_io_local_address(PARROT_INTERP, PMC *sock)>

C<Parrot_io_local_address()> returns the local address of the given sock
PMC. It can be used to find out to which address the socket was actually
bound (when binding to "localhost" without explicitly specifying an address
family, for example).

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_local_address(PARROT_INTERP, ARGIN(PMC *sock))
{
    ASSERT_ARGS(Parrot_io_local_address)

    PMC * const addrinfo = VTABLE_clone(interp, PARROT_SOCKET(sock)->local);

    return addrinfo;
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

=item C<INTVAL Parrot_io_connect_unix(PARROT_INTERP, PMC *sock, PMC *r)>

Takes the Addrinfo PMC C<*r> and tries to establish a connection. A new socket
PMC will be created because the Addrinfo may contain addresses of multiple
families (IPv4 and IPv6).

=cut

*/

INTVAL
Parrot_io_connect_unix(PARROT_INTERP, ARGMOD(PMC *sock), ARGIN(PMC *r))
{
    ASSERT_ARGS(Parrot_io_connect_unix)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(sock);
    struct addrinfo *res = VTABLE_get_pointer(interp, r);
    struct addrinfo *walk;
    int fd = -1;
    int i = 1;

    if (!r)
        return -1;


    for (walk = res; walk != NULL; walk = walk->ai_next) {
        fd = socket(walk->ai_family, walk->ai_socktype, walk->ai_protocol);
        if (fd < 0) {
            /* Cannot create socket. Not necessarily an error, for example not
             * on FreeBSD, where getaddrinfo() returns IPv6 addresses even
             * when the libc does not offer IPv6 support and thus fails in
             * socket(). */
            continue;
        }

        if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &i, sizeof(i)) == -1) {
            perror("Error setting SO_REUSEADDR:");
            continue;
        }

        /* XXX: this effectively overwrites any previously set sockets. is that alright? */
        Parrot_io_set_os_handle(interp, sock, fd);

AGAIN:
        if (connect(fd, walk->ai_addr, walk->ai_addrlen) != 0) {
            switch (errno) {
              case EINTR:
                goto AGAIN;
              case EINPROGRESS:
                goto AGAIN;
              case EISCONN:
                break;
              default:
                close(fd);
                fd = -1;
                continue;
            }
        }

        PARROT_SOCKET(sock)->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);

        VTABLE_set_pointer(interp, PARROT_SOCKET(sock)->remote, walk);
        return 0;
    }

    if (fd == -1)
        return -1;
}

/*

=item C<INTVAL Parrot_io_bind_unix(PARROT_INTERP, PMC *sock, PMC *sockaddr)>

Takes the Addrinfo PMC C<*sockaddr> and creates a listening socket. A new
socket needs to be created because C<*sockaddr> may contain addresses of
multiple families (IPv4 and IPv6). An example is binding to "localhost"
which resolves to ::1 and 127.0.0.1. If you are on FreeBSD and have no
IPv6 support, the first attempt to create a socket and bind it would fail.

=cut

*/

INTVAL
Parrot_io_bind_unix(PARROT_INTERP, ARGMOD(PMC *sock), ARGMOD(PMC *sockaddr))
{
    ASSERT_ARGS(Parrot_io_bind_unix)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(sock);
    struct addrinfo *res = VTABLE_get_pointer(interp, sockaddr);
    struct addrinfo *walk;
    int fd = -1;
    int i = 1;

    if (!sockaddr)
        return -1;

    for (walk = res; walk != NULL; walk = walk->ai_next) {
        fd = socket(walk->ai_family, walk->ai_socktype, walk->ai_protocol);
        if (fd < 0) {
            /* Cannot create socket. Not necessarily an error, for example not
             * on FreeBSD, where getaddrinfo() returns IPv6 addresses even
             * when the libc does not offer IPv6 support and thus fails in
             * socket(). */
            continue;
        }

        if (walk->ai_family == AF_INET6) {
            if (setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &i, sizeof(i)) == -1) {
                perror("Error setting IPV6_V6ONLY:");
                continue;
            }
        }

        /* XXX: this effectively overwrites any previously set sockets. is that alright? */
        Parrot_io_set_os_handle(interp, sock, fd);

        if (bind(fd, walk->ai_addr, walk->ai_addrlen) != 0) {
            close(fd);
            fd = -1;
            continue;
        }

        PARROT_SOCKET(sock)->local = Parrot_pmc_new(interp, enum_class_Sockaddr);

        VTABLE_set_pointer(interp, PARROT_SOCKET(sock)->local, walk);
        return 0;
    }

    if (fd == -1)
        return -1;
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
    Parrot_Socklen_t    addrlen = sizeof (struct sockaddr_storage);
    Parrot_Sockaddr_attributes *remotedata;
    struct sockaddr_storage *saddr;
    int newsock;

    PARROT_SOCKET(newio)->local  = PARROT_SOCKET(socket)->local;
    PARROT_SOCKET(newio)->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);
    saddr                        = SOCKADDR_REMOTE(newio);

    newsock = accept(io->os_handle, (struct sockaddr *)saddr, &addrlen);

    if (newsock == -1) {
        return PMCNULL;
    }

    /* Set the length for the remote sockaddr PMC so that it can distinguish
     * between sockaddr_in and sockaddr_in6 */
    remotedata = PARROT_SOCKADDR(PARROT_SOCKET(newio)->remote);
    remotedata->len = addrlen;

    PARROT_SOCKET(newio)->os_handle = newsock;

    /* Optionally do a getaddrinfo() to resolve remote IP address.
     * This should be based on an option set in the master socket.
     *
     * XXX: instead of resolving here, we should use the flags for
     * getnameinfo() in the VTABLE get_string of the Sockaddr PMC.
     * At the moment, it uses NI_NUMERICHOST, but when called
     * differently, it will resolve the address. The advantage is
     * that we only resolve when someone actually accesses the
     * name. -- Michael Stapelberg */

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
        /* The encoding should probably be 'binary', but right now httpd.pir
         * only works with 'ascii'
         */
        *s = Parrot_str_new_init(interp, buf, bytesread,
                Parrot_ascii_encoding_ptr, 0);
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
            *s = Parrot_str_new_noinit(interp, 0);
            return -1;
          default:
            close(io->os_handle);
            *s = Parrot_str_new_noinit(interp, 0);
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
host, int port, const int family)>

Get a new C<sockaddr_in> structure for the given PMC to connect to the
specified host, port and address family.

=cut

*/

static void
get_sockaddr_in(PARROT_INTERP, ARGIN(PMC * sockaddr), ARGIN(const char* host),
            int port, const int family)
{
    ASSERT_ARGS(get_sockaddr_in)

    struct sockaddr_in * const sa = (struct sockaddr_in*)VTABLE_get_pointer(interp, sockaddr);

    /* FIXME ::1, which is localhost in IPv6, does not seem to be 
        handled properly by the following code
    */
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

static void
get_addrinfo(PARROT_INTERP, ARGIN(PMC * addrinfo), ARGIN(const char *host), int port, int protocol, int family, int passive)
{
    ASSERT_ARGS(get_addrinfo)

    struct addrinfo hints;
    struct addrinfo *res;
    /* We need to pass the port as a string (because you could also use a
     * service specification from /etc/services). The highest port is 65535,
     * so we need 5 characters + trailing null-byte. */
    char portstr[6];
    int ret;

    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_protocol = protocol;
    if (passive)
        hints.ai_flags = AI_PASSIVE;
    hints.ai_family = family;
    snprintf(portstr, sizeof(portstr), "%u", port);

    if ((ret = getaddrinfo(host, portstr, &hints, &res)) != 0) {
        fprintf(stderr, "getaddrinfo failure: %s\n", gai_strerror(ret));
        return;
    }

    VTABLE_set_pointer(interp, addrinfo, res);
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
