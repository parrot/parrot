/*
Copyright (C) 2001-2003, Parrot Foundation.
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

#ifdef PIO_OS_WIN32

/* HEADERIZER HFILE: none */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#  if PARROT_NET_DEVEL

/*

=item C<PMC * Parrot_io_socket_win32>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_socket_win32(PARROT_INTERP, SHIM(PMC *socket), int fam, int type, int proto)
{
    const int sock = socket(fam, type, proto);

    if (sock >= 0) {
        ParrotIO * const io = Parrot_io_new(interp, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
        io->fd = (PIOHANDLE) sock;
        io->remote.sin_family = (short)fam;
        return io;
    }
    perror("socket:");
    return NULL;
}

/*

=item C<INTVAL Parrot_io_connect_win32>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

INTVAL
Parrot_io_connect_win32(PARROT_INTERP,
        SHIM(PMC *socket),
        ARGMOD(ParrotIO *io),
        ARGIN_NULLOK(STRING *r))
{
    if (r) {
        struct sockaddr_in sa;
        memcpy(&sa, PObj_bufstart(r), sizeof (struct sockaddr));
        io->remote.sin_addr.s_addr = sa.sin_addr.s_addr;
        io->remote.sin_port = sa.sin_port;
    }

    /*    Parrot_io_eprintf(interp, "connect: fd = %d port = %d\n",
     *    io->fd, ntohs(io->remote.sin_port));*/
    if ((connect((SOCKET)io->fd, (struct sockaddr*)&io->remote,
                   sizeof (struct sockaddr))) != 0) {
        Parrot_io_eprintf(interp, "Parrot_io_connect_win32: errno = %d\n",
                    WSAGetLastError());
        return -1;
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_send_win32>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_send_win32(SHIM_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io),
        ARGIN(const STRING *s))
{
    int error, byteswrote, maxwrite;

    const int bytes = sizeof (s); /* XXX This can't be correct, to send the size of a pointer */
    byteswrote = 0;
    maxwrite = 2048;
AGAIN:
    /*
     * Ignore encoding issues for now.
     */
    if ((error = send((SOCKET)io->fd, (char *)PObj_bufstart(s) + byteswrote,
                            PObj_buflen(s), 0)) >= 0) {
        byteswrote += error;
        if (byteswrote >= bytes) {
            return byteswrote;
        }
        else if (bytes - byteswrote < maxwrite) {
            maxwrite = bytes - byteswrote;
        }
        goto AGAIN;
    }
    else {
        switch (errno) {
            case EINTR:
                goto AGAIN;
#    ifdef EWOULDBLOCK
            case EWOULDBLOCK:
                goto AGAIN;
#    else
            case EAGAIN:
                goto AGAIN;
#    endif
            case EPIPE:
                _close((SOCKET)io->fd);
                return -1;
            default:
                return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_recv_win32>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_recv_win32(PARROT_INTERP,
        SHIM(PMC *socket),
        ARGMOD(ParrotIO *io),
        ARGOUT(STRING **s))
{
    int error;
    int err;
    unsigned int bytesread = 0;
    char buf[2048+1];

AGAIN:
    error = recv((SOCKET)io->fd, buf, 2048, 0);
    err = WSAGetLastError();
    if (error > 0) {
        if (error > 0)
            bytesread += error;
        else {
            _close((SOCKET)io->fd);
        }
        /* The charset should probably be 'binary', but right now httpd.pir
         * only works with 'ascii'
         */
        *s = string_make(interp, buf, bytesread, "ascii", 0);
#    if PIO_TRACE
        Parrot_io_eprintf(interp, "Parrot_io_recv_win32: %d bytes\n", bytesread);
#    endif
        return bytesread;
    }
    else {
        switch (err) {
            case WSAEINTR:
                goto AGAIN;
            case WSAEWOULDBLOCK:
                goto AGAIN;
            case WSAECONNRESET:
                _close((SOCKET)io->fd);
#    if PIO_TRACE
                Parrot_io_eprintf(interp, "recv: Connection reset by peer\n");
#    endif
                return -1;
            default:
                _close((SOCKET)io->fd);
#    if PIO_TRACE
                Parrot_io_eprintf(interp, "recv: errno = %d\n", err);
#    endif
                return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_bind_win32>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

INTVAL
Parrot_io_bind_win32(PARROT_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io),
        ARGIN_NULLOK(STRING *l))
{
    struct sockaddr_in sa;

    if (!l)
        return -1;

    memcpy(&sa, PObj_bufstart(l), sizeof (struct sockaddr));
    io->local.sin_addr.s_addr = sa.sin_addr.s_addr;
    io->local.sin_port = sa.sin_port;
    io->local.sin_family = AF_INET;

    if ((bind((SOCKET)io->fd, (struct sockaddr *)&io->local,
              sizeof (struct sockaddr))) == -1) {
        Parrot_io_eprintf(interp, "Parrot_io_bind_win32: errno = %d\n",
                    WSAGetLastError());
        return -1;
    }

    return 0;
}

/*

=item C<INTVAL Parrot_io_listen_win32>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

INTVAL
Parrot_io_listen_win32(SHIM_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io), INTVAL backlog)
{
    if ((listen((SOCKET)io->fd, backlog)) == -1) {
        fprintf(stderr, "listen: errno= ret=%d fd = %d port = %d\n",
             errno, (int)io->fd, ntohs(io->local.sin_port));
        return -1;
    }
    return 0;
}

/*

=item C<PMC * Parrot_io_accept_win32>

Accept a new connection and return a newly created C<Socket> PMC.

=cut

*/

PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_accept_win32(PARROT_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io))
{
    int newsock;
    int err_code;

    ParrotIO * const newio = Parrot_io_new(interp, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
    Parrot_Socklen_t newsize = sizeof (struct sockaddr);

    newsock = accept((SOCKET)io->fd, (struct sockaddr *)&(newio->remote),
                     &newsize);
    err_code = WSAGetLastError();

    if (err_code != 0) {
        fprintf(stderr, "accept: errno=%d", err_code);
        /* Didn't get far enough, free the io */
        mem_sys_free(newio);
        return NULL;
    }

    newio->fd = (PIOHANDLE) newsock;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer
     */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket
     */

    return newio;
}

#  endif

/*

=item C<STRING * Parrot_io_sockaddr_in>

C<Parrot_io_sockaddr_in()> is not part of the layer and so must be C<extern>.

XXX: We can probably just write our own routines (C<htons()>,
C<inet_aton()>, etc.) and take this out of platform specific compilation

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_io_sockaddr_in(PARROT_INTERP, unsigned short port, ARGMOD(STRING *addr))
{
    struct sockaddr_in sa;
    struct hostent *he;
    char * const s = Parrot_str_to_cstring(interp, addr);
    /* Hard coded to IPv4 for now */

    sa.sin_addr.s_addr = inet_addr(s);
    /* Maybe it is a hostname, try to lookup */
    /* XXX Check PIO option before doing a name lookup,
     * it may have been toggled off.
     */
    he = gethostbyname(s);
    Parrot_str_free_cstring(s);

    /* XXX FIXME - Handle error condition better */
    if (!he) {
        fprintf(stderr, "gethostbyname failure [%s]\n", s);
        return NULL;
    }
    memcpy((char*)&sa.sin_addr, he->h_addr, sizeof (sa.sin_addr));

    sa.sin_port = htons(port);

    return string_make(interp, (char *)&sa, sizeof (struct sockaddr), "binary", 0);
}


#endif /* PIO_OS_WIN32 */

/*

=back

=head1 SEE ALSO

F<src/io/win32.c>,
F<src/io/unix_socket.c>,
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
