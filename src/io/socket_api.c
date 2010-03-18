/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/io/socket_api.c - Socket I/O API

=head1 DESCRIPTION

These are the primary interface functions for working with socket objects.

=head2 Networking Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "api.str"
#include "pmc/pmc_socket.h"

#include <stdarg.h>

/* HEADERIZER HFILE: include/parrot/io.h */

/*

=item C<INTVAL Parrot_io_socket_is_closed(PMC *socket)>

Returns 1 if the socket is closed, 0 if it is open.

=cut

*/


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


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL
Parrot_io_socket_is_closed(ARGMOD(PMC *socket))
{
    ASSERT_ARGS(Parrot_io_socket_is_closed)
#ifdef PIO_OS_WIN32
    return (PARROT_SOCKET(socket)->os_handle == (PIOHANDLE)INVALID_HANDLE_VALUE);
#endif
#ifdef PIO_OS_UNIX
    return (PARROT_SOCKET(socket)->os_handle == (PIOHANDLE)-1);
#endif
#ifdef PIO_OS_STDIO
    return (PARROT_SOCKET(socket)->os_handle == (PIOHANDLE)NULL);
#endif
}

/*

=item C<INTVAL Parrot_io_poll(PARROT_INTERP, PMC *pmc, INTVAL which, INTVAL sec,
INTVAL usec)>

Polls C<*pmc> for the events in C<which> every C<sec> seconds + C<usec>
microseconds.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_poll(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL which, INTVAL sec, INTVAL usec)
{
    ASSERT_ARGS(Parrot_io_poll)
    if (PMC_IS_NULL(pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Can't poll a NULL socket object");

    return PIO_POLL(interp, pmc, which, sec, usec);
}

/*

=item C<INTVAL Parrot_io_socket(PARROT_INTERP, PMC *socket, INTVAL fam, INTVAL
type, INTVAL proto)>

Creates and returns a socket using the specified address family, socket type,
and protocol number. Check the returned PMC with a boolean test to see whether
the socket was successfully created.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL
Parrot_io_socket(PARROT_INTERP, ARGMOD_NULLOK(PMC *socket), INTVAL fam,
            INTVAL type, INTVAL proto)
{
    ASSERT_ARGS(Parrot_io_socket)
    PMC *new_socket;

    /* convert Parrot's family to system family */
    if (fam < 0 || fam >= PIO_PF_MAX)
        return -1;
    fam = pio_pf[fam];
    if (fam < 0)
        return -1;

    /* convert Parrot's socket type to system type */
    if (type < 0 || type >= PIO_SOCK_MAX)
        return -1;
    type = pio_sock[type];
    if (type < 0)
        return -1;

    if (PMC_IS_NULL(socket))
        new_socket = Parrot_io_new_socket_pmc(interp,
                PIO_F_SOCKET|PIO_F_READ|PIO_F_WRITE);
    else
        new_socket = socket;
    /* XXX new_socket is assigned, but never used. Probably a bug? */

    return PIO_SOCKET(interp, socket, fam, type, proto);
}

/*

=item C<INTVAL Parrot_io_recv(PARROT_INTERP, PMC *pmc, STRING **buf)>

Receives a message from the connected socket C<*pmc> in C<*buf>.  Returns C<-1>
if it fails.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_recv(PARROT_INTERP, ARGMOD(PMC *pmc), ARGOUT(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_recv)
    if (Parrot_io_socket_is_closed(pmc))
        return -1;

    return PIO_RECV(interp, pmc, buf);
}

/*

=item C<INTVAL Parrot_io_send(PARROT_INTERP, PMC *pmc, STRING *buf)>

Sends the message C<*buf> to the connected socket C<*pmc>.  Returns
C<-1> if it cannot send the message.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_send(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(STRING *buf))
{
    ASSERT_ARGS(Parrot_io_send)
    if (Parrot_io_socket_is_closed(pmc))
        return -1;

    return PIO_SEND(interp, pmc, buf);
}

/*

=item C<INTVAL Parrot_io_connect(PARROT_INTERP, PMC *pmc, PMC *address)>

Connects C<*pmc> to C<*address>.  Returns C<-1> on failure.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_connect(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_connect)
    if (Parrot_io_socket_is_closed(pmc))
        return -1;

    return PIO_CONNECT(interp, pmc, address);
}

/*

=item C<INTVAL Parrot_io_bind(PARROT_INTERP, PMC *pmc, PMC *address)>

Binds C<*pmc>'s socket to the local address and port specified by
C<*address>.  Returns C<-1> on failure.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_bind(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_bind)
    if (Parrot_io_socket_is_closed(pmc))
        return -1;

    return PIO_BIND(interp, pmc, address);
}

/*

=item C<INTVAL Parrot_io_listen(PARROT_INTERP, PMC *pmc, INTVAL backlog)>

Listens for new connections on socket C<*pmc>.  Returns C<-1> on failure.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_listen(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL backlog)
{
    ASSERT_ARGS(Parrot_io_listen)
    if (Parrot_io_socket_is_closed(pmc))
        return -1;

    return PIO_LISTEN(interp, pmc, backlog);
}

/*

=item C<PMC * Parrot_io_accept(PARROT_INTERP, PMC *pmc)>

Accepts a new connection and returns a newly created C<ParrotIO> socket.
Returns C<NULL> on failure.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_accept(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_accept)
    if (Parrot_io_socket_is_closed(pmc))
        return PMCNULL;

    return PIO_ACCEPT(interp, pmc);
}

/*

=item C<PMC * Parrot_io_new_socket_pmc(PARROT_INTERP, INTVAL flags)>

Creates a new I/O socket object. The value of C<flags> is set
in the returned PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_new_socket_pmc(PARROT_INTERP, INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_new_socket_pmc)
    PMC * const new_io = Parrot_pmc_new(interp, enum_class_Socket);

    Parrot_io_set_flags(interp, new_io, flags);

    return new_io;
}
/*

=back

=head1 SEE ALSO

F<io/api.c>

=cut

*/



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
