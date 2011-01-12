/*
Copyright (C) 2001-2011, Parrot Foundation.

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

=item C<INTVAL Parrot_io_socket_is_closed(PARROT_INTERP, PMC *socket)>

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
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL
Parrot_io_socket_is_closed(PARROT_INTERP, ARGMOD(PMC *socket))
{
    ASSERT_ARGS(Parrot_io_socket_is_closed)
    const PIOHANDLE os_handle = Parrot_io_get_os_handle(interp, socket);

    return os_handle == PIO_INVALID_HANDLE;
}

/*

=item C<void Parrot_io_socket_initialize_handle(PARROT_INTERP, PMC *socket)>

Initialize a Socket PMC

=cut

*/

PARROT_EXPORT
void
Parrot_io_socket_initialize_handle(SHIM_INTERP, ARGMOD(PMC *socket))
{
    ASSERT_ARGS(Parrot_io_socket_initialize_handle)
    PARROT_SOCKET(socket)->os_handle = (PIOHANDLE)PIO_INVALID_HANDLE;
}

/*

=item C<INTVAL Parrot_io_poll_handle(PARROT_INTERP, PMC *pmc, INTVAL which,
INTVAL sec, INTVAL usec)>

Polls C<*pmc> for the events in C<which> every C<sec> seconds + C<usec>
microseconds.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_poll_handle(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL which, INTVAL sec, INTVAL usec)
{
    ASSERT_ARGS(Parrot_io_poll_handle)
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);

    if (Parrot_io_socket_is_closed(interp, pmc))
        return -1;

    return Parrot_io_poll(interp, io->os_handle, which, sec, usec);
}

/*

=item C<INTVAL Parrot_io_socket_handle(PARROT_INTERP, PMC *socket, INTVAL fam,
INTVAL type, INTVAL proto)>

Creates and returns a socket using the specified address family, socket type,
and protocol number. Check the returned PMC with a boolean test to see whether
the socket was successfully created.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL
Parrot_io_socket_handle(PARROT_INTERP, ARGMOD_NULLOK(PMC *socket), INTVAL fam,
            INTVAL type, INTVAL proto)
{
    ASSERT_ARGS(Parrot_io_socket_handle)
    PMC       *new_socket;
    PIOHANDLE  os_handle;

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

    os_handle = Parrot_io_socket(interp, fam, type, proto);

    if (os_handle == PIO_INVALID_HANDLE)
        return -1;

    SETATTR_Socket_os_handle(interp, new_socket, os_handle);

    return 0;
}

/*

=item C<STRING * Parrot_io_recv_handle(PARROT_INTERP, PMC *pmc, size_t len)>

Receives a message from the connected socket C<*pmc> in C<*buf>.  Returns C<-1>
if it fails.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_recv_handle(PARROT_INTERP, ARGMOD(PMC *pmc), size_t len)
{
    ASSERT_ARGS(Parrot_io_recv_handle)
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);
    STRING *res;
    size_t  received;

    if (Parrot_io_socket_is_closed(interp, pmc))
        return STRINGNULL;

    /* This must stay ASCII to make Rakudo and UTF-8 work for now */
    res = Parrot_str_new_noinit(interp, len);

    received     = Parrot_io_recv(interp, io->os_handle, res->strstart,
                        res->bufused);

    if (received < 0) {
        /* TODO: error handling */
        return STRINGNULL;
    }

    res->bufused = received;
    res->strlen  = received;

    return res;
}

/*

=item C<INTVAL Parrot_io_send_handle(PARROT_INTERP, PMC *pmc, STRING *buf)>

Sends the message C<*buf> to the connected socket C<*pmc>.  Returns
C<-1> if it cannot send the message.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_send_handle(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(STRING *buf))
{
    ASSERT_ARGS(Parrot_io_send_handle)
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);

    if (Parrot_io_socket_is_closed(interp, pmc))
        return -1;

    return Parrot_io_send(interp, io->os_handle, buf->strstart, buf->bufused);
}

/*

=item C<INTVAL Parrot_io_connect_handle(PARROT_INTERP, PMC *pmc, PMC *address)>

Connects C<*pmc> to C<*address>.  Returns C<-1> on failure.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_connect_handle(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_connect_handle)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);

    if (Parrot_io_socket_is_closed(interp, pmc))
        return -1;
    if (PMC_IS_NULL(address))
        return -1;

    io->remote = address;

    return Parrot_io_connect(interp, io->os_handle,
                VTABLE_get_pointer(interp, address));
}

/*

=item C<INTVAL Parrot_io_bind_handle(PARROT_INTERP, PMC *pmc, PMC *address)>

Binds C<*pmc>'s socket to the local address and port specified by
C<*address>.  Returns C<-1> on failure.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_bind_handle(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_bind_handle)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);

    if (Parrot_io_socket_is_closed(interp, pmc))
        return -1;
    if (PMC_IS_NULL(address))
        return -1;

    io->local = address;

    return Parrot_io_bind(interp, io->os_handle,
                VTABLE_get_pointer(interp, address));
}

/*

=item C<INTVAL Parrot_io_listen_handle(PARROT_INTERP, PMC *pmc, INTVAL backlog)>

Listens for new connections on socket C<*pmc>.  Returns C<-1> on failure.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_listen_handle(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL backlog)
{
    ASSERT_ARGS(Parrot_io_listen_handle)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);

    if (Parrot_io_socket_is_closed(interp, pmc))
        return -1;

    return Parrot_io_listen(interp, io->os_handle, backlog);
}

/*

=item C<PMC * Parrot_io_accept_handle(PARROT_INTERP, PMC *pmc)>

Accepts a new connection and returns a newly created C<ParrotIO> socket.
Returns C<NULL> on failure.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_accept_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_accept_handle)
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);
    Parrot_Socket_attributes *new_io;
    PMC       *new_pmc;
    PIOHANDLE  os_handle;

    if (Parrot_io_socket_is_closed(interp, pmc))
        return PMCNULL;

    new_pmc = Parrot_io_new_socket_pmc(interp,
                PIO_F_SOCKET | PIO_F_READ | PIO_F_WRITE);
    new_io  = PARROT_SOCKET(new_pmc);

    new_io->local  = io->local;
    new_io->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);

    os_handle = Parrot_io_accept(interp, io->os_handle,
                    VTABLE_get_pointer(interp, new_io->remote));
    /* TODO: error check */
    new_io->os_handle = os_handle;

    return new_pmc;
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
