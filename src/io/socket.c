/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/io/socket.c - Socket I/O API

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
#include "pmc/pmc_sockaddr.h"

#include <stdarg.h>

/* HEADERIZER HFILE: src/io/io_private.h */

io_socket_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable)
{
    ASSERT_ARGS(io_socket_setup_vtable)
    vtable->name = "Socket";
    vtable->read_s = io_socket_read_s;
    vtable->read_b = io_socket_read_b;
    vtable->write_s = io_socket_write_s;
    vtable->readline_s = io_socket_readline_s;
    vtable->readall_s = io_socket_readall_s;
    vtable->flush = io_socket_flush;
    vtable->is_eof = io_socket_is_eof;
    vtable->tell = io_socket_tell;
    vtable->peek_b = io_socket_peek_b;
    vtable->seek = io_socket_seek;
    vtable->open = io_socket_open;
    vtable->is_open = io_socket_is_open;
    vtable->close = io_socket_close;
    vtable->get_encoding = io_socket_get_encoding;
    vtable->set_flags = io_socket_set_flags;
    vtable->get_flags = io_socket_get_flags;
}


static STRING *
io_socket_read_s(PARROT_INTERP, ARGMOD(PMC *handle), size_t char_length)
{
    ASSERT_ARGS(io_socket_read_s)
}

static INTVAL
io_socket_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_socket_read_b)
}

static INTVAL
io_socket_write_s(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *s), size_t char_length)
{
    ASSERT_ARGS(io_socket_write_s)
}

static INTVAL
io_socket_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_socket_write_b)
}

static STRING *
io_socket_readline_s(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL terminator)
{
    ASSERT_ARGS(io_socket_readline_s)
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "readline");
}

static STRING *
io_socket_readall_s(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_readall_s)
}

static INTVAL
io_socket_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_flush_s)
}

static INTVAL
io_socket_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_readall_s)
}

static PIOOFF_T
io_socket_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_tell)
}

static INTVAL
io_socket_seek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_seek)
}

static INTVAL
io_socket_peek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_peek_b)
}

static INTVAL
io_socket_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags)
{
    ASSERT_ARGS(io_socket_open)
}

static INTVAL
io_socket_is_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_socket_is_open)
}

static INTVAL
io_socket_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_close)

    INTVAL result = 0;
    if (PARROT_SOCKET(pmc)) {
        Parrot_Socket_attributes *data_struct = PARROT_SOCKET(handle);

        if (data_struct->os_handle != PIO_INVALID_HANDLE)
            result = Parrot_io_close_socket(interp, data_struct->os_handle);
        data_struct->os_handle = PIO_INVALID_HANDLE;
    }
    return result;
}

/*

=item C<INTVAL Parrot_io_socket_is_closed(PARROT_INTERP, PMC *socket)>

Returns 1 if the socket is closed, 0 if it is open.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
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
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't poll closed socket");

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

    if (PMC_IS_NULL(socket))
        new_socket = Parrot_io_new_socket_pmc(interp,
                PIO_F_SOCKET|PIO_F_READ|PIO_F_WRITE);
    else
        new_socket = socket;

    os_handle = Parrot_io_socket(interp, fam, type, proto);

    SETATTR_Socket_os_handle(interp, new_socket, os_handle);
    SETATTR_Socket_family(interp, new_socket, fam);
    SETATTR_Socket_type(interp, new_socket, type);
    SETATTR_Socket_protocol(interp, new_socket, proto);

    return 0;
}

/*

=item C<STRING * Parrot_io_recv_handle(PARROT_INTERP, PMC *pmc, size_t len)>

Receives a message from the connected socket C<*pmc> in C<*buf>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_recv_handle(PARROT_INTERP, ARGMOD(PMC *pmc), size_t len)
{
    ASSERT_ARGS(Parrot_io_recv_handle)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);
    STRING *res;
    INTVAL  received;

    if (Parrot_io_socket_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't recv from closed socket");

    /* This must stay ASCII to make Rakudo and UTF-8 work for now */
    res      = Parrot_str_new_noinit(interp, len);
    received = Parrot_io_recv(interp, io->os_handle, res->strstart, len);

    res->bufused = received;
    res->strlen  = received;

    return res;
}

/*

=item C<INTVAL Parrot_io_socket_recv_to_buffer(PARROT_INTERP, PMC *socket, char
* buffer, size_t len)>

Read C<len> bytes from C<socket> and add them to the C<buffer>.

=item C<INTVAL Parrot_io_socket_send_from_buffer(PARROT_INTERP, PMC *socket,
const char *buffer, size_t len)>

Write C<len> bytes from C<buffer> to C<socket>.

=cut

*/

INTVAL
Parrot_io_socket_recv_to_buffer(PARROT_INTERP, ARGMOD(PMC *socket),
        ARGOUT(char * buffer), size_t len)
{
    ASSERT_ARGS(Parrot_io_socket_recv_to_buffer)

    if (Parrot_io_socket_is_closed(interp, socket))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't recv from closed socket");
    else {
        Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
        return Parrot_io_recv(interp, io->os_handle, buffer, len);
    }
}

INTVAL
Parrot_io_socket_send_from_buffer(PARROT_INTERP, ARGMOD(PMC *socket),
        ARGIN(const char *buffer), size_t len)
{
    ASSERT_ARGS(Parrot_io_socket_send_from_buffer)
    if (Parrot_io_socket_is_closed(interp, socket))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't send to closed socket");
    else {
        Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
        return Parrot_io_send(interp, io->os_handle, buffer, len);
    }
}

/*

=item C<INTVAL Parrot_io_send_handle(PARROT_INTERP, PMC *pmc, STRING *buf)>

Sends the message C<*buf> to the connected socket C<*pmc>.

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
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't send to closed socket");

    return Parrot_io_send(interp, io->os_handle, buf->strstart, buf->bufused);
}

/*

=item C<void Parrot_io_connect_handle(PARROT_INTERP, PMC *pmc, PMC *address)>

Connects C<*pmc> to C<*address>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_connect_handle(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_connect_handle)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);
    int i;

    if (Parrot_io_socket_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't connect closed socket");
    if (PMC_IS_NULL(address))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Address is null");

    /* Iterate over all addresses if an array is passed */
    if (address->vtable->base_type != enum_class_Sockaddr) {
        INTVAL len = VTABLE_elements(interp, address);

        for (i = 0; i < len; ++i) {
            PMC *sa = VTABLE_get_pmc_keyed_int(interp, address, i);
            Parrot_Sockaddr_attributes * const sa_data = PARROT_SOCKADDR(sa);

            if (!Parrot_io_addr_match(interp, sa, io->family, io->type,
                    io->protocol))
                continue;

            io->remote = sa;

            Parrot_io_connect(interp, io->os_handle, sa_data->pointer,
                    sa_data->len);

            return;
        }

        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "No address found for family %d, type %d, proto %d",
                io->family, io->type, io->protocol);
    }

    io->remote = address;

    Parrot_io_connect(interp, io->os_handle,
            VTABLE_get_pointer(interp, address),
            VTABLE_get_integer(interp, address));
}

/*

=item C<void Parrot_io_bind_handle(PARROT_INTERP, PMC *pmc, PMC *address)>

Binds C<*pmc>'s socket to the local address and port specified by
C<*address>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_bind_handle(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_bind_handle)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);
    int i;

    if (Parrot_io_socket_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't bind closed socket");
    if (PMC_IS_NULL(address))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Address is null");

    /* Iterate over all addresses if an array is passed */
    if (address->vtable->base_type != enum_class_Sockaddr) {
        INTVAL len = VTABLE_elements(interp, address);

        for (i = 0; i < len; ++i) {
            PMC *sa = VTABLE_get_pmc_keyed_int(interp, address, i);
            Parrot_Sockaddr_attributes * const sa_data = PARROT_SOCKADDR(sa);

            if (!Parrot_io_addr_match(interp, sa, io->family, io->type,
                    io->protocol))
                continue;

            io->local = sa;

            Parrot_io_bind(interp, io->os_handle, sa_data->pointer,
                    sa_data->len);

            return;
        }

        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "No address found for family %d, type %d, proto %d",
                io->family, io->type, io->protocol);
    }

    io->local = address;

    Parrot_io_bind(interp, io->os_handle,
            VTABLE_get_pointer(interp, address),
            VTABLE_get_integer(interp, address));
}

/*

=item C<void Parrot_io_listen_handle(PARROT_INTERP, PMC *pmc, INTVAL backlog)>

Listens for new connections on socket C<*pmc>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_listen_handle(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL backlog)
{
    ASSERT_ARGS(Parrot_io_listen_handle)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);

    if (Parrot_io_socket_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't listen on closed socket");

    Parrot_io_listen(interp, io->os_handle, backlog);
}

/*

=item C<PMC * Parrot_io_accept_handle(PARROT_INTERP, PMC *pmc)>

Accepts a new connection and returns a newly created C<ParrotIO> socket.
Returns C<NULL> on failure.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_accept_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_accept_handle)
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);
    Parrot_Socket_attributes *new_io;
    PMC       *new_pmc;

    if (Parrot_io_socket_is_closed(interp, pmc))
        return PMCNULL;

    new_pmc = Parrot_io_new_socket_pmc(interp,
                PIO_F_SOCKET | PIO_F_READ | PIO_F_WRITE);
    new_io  = PARROT_SOCKET(new_pmc);

    new_io->local  = io->local;
    new_io->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);

    new_io->os_handle = Parrot_io_accept(interp, io->os_handle, new_io->remote);

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
