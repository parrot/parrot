/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/platform/generic/socket.c - UNIX socket functions

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#ifdef _WIN32

#  ifdef __MINGW32__
#    include <w32api.h>
#    if WINVER < Windows2000
#      error Minimum requirement for Parrot on Windows is Windows 2000 \
             - might want to check windef.h
#    endif
#  endif
#  include <ws2tcpip.h>
#  undef CONST

#else /* _WIN32 */

#  include "parrot/has_header.h"

/* FreeBSD wants this order:

     #include <sys/types.h>
     #include <sys/socket.h>
     #include <netinet/in.h>
     #include <arpa/inet.h>

   as netinet/in.h relies on things defined earlier
*/

#  ifdef PARROT_HAS_HEADER_SYSTYPES
#    include <sys/types.h>
#  endif /* PARROT_HAS_HEADER_SYSTYPES */

#  ifdef PARROT_HAS_HEADER_SYSSOCKET
#    include <sys/socket.h>
#  endif /* PARROT_HAS_HEADER_SYSSOCKET */

#  ifdef PARROT_HAS_HEADER_NETINETIN
#    include <netinet/in.h>
#  endif /* PARROT_HAS_HEADER_NETINETIN */

#  ifdef PARROT_HAS_HEADER_ARPAINET
#    include <arpa/inet.h>
#  endif /* PARROT_HAS_HEADER_ARPAINET */

#  ifdef PARROT_HAS_HEADER_NETDB
#    include <netdb.h>
#  endif /* PARROT_HAS_HEADER_NETDB */

#endif /* _WIN32 */

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

/*
 * Mapping between PIO_PF_* constants and system-specific PF_* constants.
 *
 * Uses -1 for unsupported protocols.
 */

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

/*
 * Mapping between PIO_SOCK_* constants and system-specific SOCK_* constants.
 * Uses -1 for unsupported socket types.
 */

static int pio_sock[PIO_SOCK_MAX+1] = {
#ifdef SOCK_PACKET
    SOCK_PACKET,    /* PIO_SOCK_PACKET */
#else
    -1,             /* PIO_SOCK_PACKET */
#endif
#ifdef SOCK_STREAM
    SOCK_STREAM,    /* PIO_SOCK_STREAM */
#else
    -1,             /* PIO_SOCK_STREAM */
#endif
#ifdef SOCK_DGRAM
    SOCK_DGRAM,     /* PIO_SOCK_DGRAM */
#else
    -1,             /* PIO_SOCK_DGRAM */
#endif
#ifdef SOCK_RAW
    SOCK_RAW,       /* PIO_SOCK_RAW */
#else
    -1,             /* PIO_SOCK_RAW */
#endif
#ifdef SOCK_RDM
    SOCK_RDM,      /* PIO_SOCK_RDM */
#else
    -1,            /* PIO_SOCK_RDM */
#endif
#ifdef SOCK_SEQPACKET
    SOCK_SEQPACKET, /* PIO_SOCK_SEQPACKET */
#else
    -1,             /* PIO_SOCK_SEQPACKET */
#endif
};


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
INTVAL protocol, INTVAL fam, INTVAL passive)>

C<Parrot_io_getaddrinfo()> calls get_addrinfo() to convert hostnames or IP
addresses to sockaddrs (and more) and returns an Addrinfo PMC which can be
passed to C<Parrot_io_connect_unix()> or C<Parrot_io_bind_unix()>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_getaddrinfo(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port,
        INTVAL protocol, INTVAL fam, INTVAL passive)
{
#ifdef PARROT_HAS_IPV6
    PMC *array;

    struct addrinfo hints;
    struct addrinfo *ai, *walk;
    /* We need to pass the port as a string (because you could also use a
     * service specification from /etc/services). The highest port is 65535,
     * so we need 5 characters + trailing null-byte. */
    char portstr[6];
    int  ret;

    /* convert Parrot's family to system family */
    if (fam < 0
    ||  fam >= PIO_PF_MAX
    || (fam = pio_pf[fam]) < 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "unsupported protocol family: %ld", fam);

    memset(&hints, 0, sizeof (struct addrinfo));
    if (passive)
        hints.ai_flags = AI_PASSIVE;

    hints.ai_family   = fam;
    hints.ai_protocol = protocol;

    snprintf(portstr, sizeof (portstr), "%ld", port);

    {
        /* Limited scope for the C string to prevent mistakes */
        char *s = STRING_IS_NULL(addr)
                ? (char *) NULL
                : Parrot_str_to_cstring(interp, addr);
        ret = getaddrinfo(s, portstr, &hints, &ai);

        Parrot_str_free_cstring(s);
    }

    if (ret != 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "getaddrinfo failed: %Ss: %Ss", addr,
                Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));

    array = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);

    for (walk = ai; walk; walk = walk->ai_next) {
        PMC *sockaddr = Parrot_pmc_new(interp, enum_class_Sockaddr);
        Parrot_Sockaddr_attributes *sa_attrs = PARROT_SOCKADDR(sockaddr);

        sa_attrs->family   = walk->ai_family;
        sa_attrs->type     = walk->ai_socktype;
        sa_attrs->protocol = walk->ai_protocol;
        sa_attrs->len      = walk->ai_addrlen;
        sa_attrs->pointer  = Parrot_gc_allocate_memory_chunk(interp,
                                    walk->ai_addrlen);

        memcpy(sa_attrs->pointer, walk->ai_addr, walk->ai_addrlen);

        VTABLE_push_pmc(interp, array, sockaddr);
    }

    freeaddrinfo(ai);

    return array;

#else /* PARROT_HAS_IPV6 */

    const char *host;
    char *cstring;
    int   success;
    PMC  *sockaddr;
    PMC  *array;

    const size_t addr_len = sizeof (struct sockaddr_in);
    struct sockaddr_in *sa;

    Parrot_Sockaddr_attributes *sa_attrs;

    sa       = (struct sockaddr_in *)Parrot_gc_allocate_memory_chunk(interp,
                                            addr_len);
    sockaddr = Parrot_pmc_new(interp, enum_class_Sockaddr);
    sa_attrs = PARROT_SOCKADDR(sockaddr);

    sa_attrs->family   = PF_INET;
    sa_attrs->type     = 0;
    sa_attrs->protocol = 0;
    sa_attrs->len      = addr_len;
    sa_attrs->pointer  = sa;

    if (STRING_IS_NULL(addr)) {
        cstring = NULL;
        host    = "127.0.0.1";
    }
    else {
        cstring = Parrot_str_to_cstring(interp, addr);
        host    = cstring;
    }

#  ifdef _WIN32
    sa->sin_addr.S_un.S_addr = inet_addr(host);
    success = sa->sin_addr.S_un.S_addr != -1;
#  else
#    ifdef PARROT_DEF_INET_ATON
    success = inet_aton(host, &sa->sin_addr) != 0;
#    else
    /* positive retval is success */
    success = inet_pton(PF_INET, host, &sa->sin_addr) > 0;
#    endif
#  endif

    if (!success) {
        /* Maybe it is a hostname, try to lookup */
        /* XXX Check PIO option before doing a name lookup,
         * it may have been toggled off.
         */
        const struct hostent * const he = gethostbyname(host);

        if (!he) {
            if (cstring)
                Parrot_str_free_cstring(cstring);
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "getaddrinfo failed: %s", host);
        }

        memcpy((char*)&sa->sin_addr, he->h_addr, sizeof (sa->sin_addr));
    }

    if (cstring)
        Parrot_str_free_cstring(cstring);

    sa->sin_family = PF_INET;
    sa->sin_port = htons(port);

    array = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
    VTABLE_push_pmc(interp, array, sockaddr);

    return array;
#endif /* PARROT_HAS_IPV6 */
}

/*

=item C<INTVAL Parrot_io_addr_match(PARROT_INTERP, PMC *sa, INTVAL fam, INTVAL
type, INTVAL protocol)>

Returns true if the address C<sa> matches C<family>, C<type> and C<protocol>.

=cut

*/

INTVAL
Parrot_io_addr_match(PARROT_INTERP, ARGIN(PMC *sa), INTVAL fam,
        INTVAL type, INTVAL protocol)
{
    Parrot_Sockaddr_attributes * const sa_data = PARROT_SOCKADDR(sa);

    /* convert Parrot's family to system family */
    if (fam < 0
    ||  fam >= PIO_PF_MAX
    || (fam = pio_pf[fam]) < 0)
        return 0;

    /* convert Parrot's socket type to system type */
    if (type < 0
    ||  type >= PIO_SOCK_MAX
    || (type = pio_sock[type]) < 0)
        return 0;

    return sa_data->family   == fam
    &&    (sa_data->type     == 0
    ||     sa_data->type     == type)
    &&    (sa_data->protocol == 0
    ||     sa_data->protocol == protocol);
}

/*

=item C<STRING * Parrot_io_getnameinfo(PARROT_INTERP, const void *addr, INTVAL
len)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_getnameinfo(PARROT_INTERP, ARGIN(const void *addr), INTVAL len)
{
    /* TODO: get hostname, not only numeric */

#ifdef PARROT_HAS_IPV6
    char buf[INET6_ADDRSTRLEN+1];
    /* numeric port maximum is 65535, so 5 chars */
    char portbuf[6];

    getnameinfo((const struct sockaddr *)addr, len, buf, sizeof (buf),
            portbuf, sizeof (portbuf), NI_NUMERICHOST | NI_NUMERICSERV);

    return Parrot_str_format_data(interp, "%s:%s", buf, portbuf);

#else /* PARROT_HAS_IPV6 */

    const struct sockaddr_in *sa = (const struct sockaddr_in *)addr;
    char *buf = inet_ntoa(sa->sin_addr);

    return Parrot_str_format_data(interp, "%s:%u", buf, ntohs(sa->sin_port));
#endif /* PARROT_HAS_IPV6 */
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
    PIOSOCKET sock;
    const int value = 1;

    /* convert Parrot's family to system family */
    if (fam < 0
    ||  fam >= PIO_PF_MAX
    || (fam = pio_pf[fam]) < 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "unsupported protocol family: %ld", fam);

    /* convert Parrot's socket type to system type */
    if (type < 0
    ||  type >= PIO_SOCK_MAX
    || (type = pio_sock[type]) < 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "unsupported socket type: %ld", type);

    sock = socket(fam, type, proto);

    if (sock == PIO_INVALID_SOCKET)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "creating socket failed: %Ss",
                Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));

    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &value, sizeof (value));

#ifdef IPV6_V6ONLY
    if (fam == AF_INET6)
        setsockopt(sock, IPPROTO_IPV6, IPV6_V6ONLY, &value, sizeof (value));
#endif

    return (PIOHANDLE)sock;
}

/*

=item C<void Parrot_io_connect(PARROT_INTERP, PIOHANDLE os_handle, void *addr,
INTVAL addr_len)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

void
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
            return;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "connect failed: %Ss",
                    Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));
        }
    }
}

/*

=item C<void Parrot_io_bind(PARROT_INTERP, PIOHANDLE os_handle, void *addr,
INTVAL addr_len)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

void
Parrot_io_bind(PARROT_INTERP, PIOHANDLE os_handle, ARGMOD(void *addr),
        INTVAL addr_len)
{
    if (bind((PIOSOCKET)os_handle, (struct sockaddr *)addr, addr_len) != 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "bind failed: %Ss",
                Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));
}

/*

=item C<void Parrot_io_listen(PARROT_INTERP, PIOHANDLE os_handle, INTVAL sec)>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

void
Parrot_io_listen(PARROT_INTERP, PIOHANDLE os_handle, INTVAL sec)
{
    if (listen((PIOSOCKET)os_handle, sec) != 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "listen failed: %Ss",
                Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));
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
    Parrot_Socklen_t addr_len = sizeof (struct sockaddr_storage);
    struct sockaddr_storage *addr =
        (struct sockaddr_storage *)Parrot_gc_allocate_memory_chunk(interp,
                                        addr_len);
    Parrot_Sockaddr_attributes *sa_attrs = PARROT_SOCKADDR(remote_addr);
    PIOSOCKET newsock;

    newsock = accept((PIOSOCKET)os_handle, (struct sockaddr *)addr, &addr_len);

    if (newsock == PIO_INVALID_SOCKET)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "accept failed: %Ss",
                Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));

    sa_attrs->len     = addr_len;
    sa_attrs->pointer = addr;

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
                    "send failed: %Ss",
                    Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));
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
                    "recv failed: %Ss",
                    Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));
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
Parrot_io_poll(PARROT_INTERP, PIOHANDLE os_handle, int which, int sec,
    int usec)
{
    fd_set r, w, e;
    struct timeval t;
    int n;
    PIOSOCKET sock = (PIOSOCKET)os_handle;

    t.tv_sec = sec;
    t.tv_usec = usec;
    FD_ZERO(&r); FD_ZERO(&w); FD_ZERO(&e);
    /* These should be defined in header */
    if (which & 1) FD_SET(sock, &r);
    if (which & 2) FD_SET(sock, &w);
    if (which & 4) FD_SET(sock, &e);
AGAIN:
    if (select(sock + 1, &r, &w, &e, &t) < 0) {
        switch (PIO_SOCK_ERRNO) {
            case PIO_SOCK_EINTR:
                goto AGAIN;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                        "select failed: %Ss",
                        Parrot_platform_strerror(interp, PIO_SOCK_ERRNO));
        }
    }

    n  = (FD_ISSET(sock, &r) ? 1 : 0);
    n |= (FD_ISSET(sock, &w) ? 2 : 0);
    n |= (FD_ISSET(sock, &e) ? 4 : 0);

    return n;
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
