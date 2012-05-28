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
    vtable->read_b = io_socket_read_b;
    vtable->flush = io_socket_flush;
    vtable->is_eof = io_socket_is_eof;
    vtable->tell = io_socket_tell;
    vtable->seek = io_socket_seek;
    vtable->open = io_socket_open;
    vtable->is_open = io_socket_is_open;
    vtable->close = io_socket_close;
    vtable->get_encoding = io_socket_get_encoding;
    vtable->set_flags = io_socket_set_flags;
    vtable->get_flags = io_socket_get_flags;
}

static INTVAL
io_socket_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_socket_read_b)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(handle);

    return Parrot_io_recv(interp, io->os_handle, buffer, byte_length);
}

static INTVAL
io_socket_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_socket_write_b)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(socket);
    return Parrot_io_send(interp, io->os_handle, buffer, byte_length);
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
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "eof");
}

static PIOOFF_T
io_socket_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_tell)
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "tell");
}

static INTVAL
io_socket_seek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_seek)
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "seek");
}

static INTVAL
io_socket_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags)
{
    ASSERT_ARGS(io_socket_open)
    const PIOHANDLE os_handle = Parrot_io_get_os_handle(interp, socket);
    Parrot_io_internal_flush(interp, os_handle);
}

static INTVAL
io_socket_is_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_socket_is_open)
    const PIOHANDLE os_handle = Parrot_io_get_os_handle(interp, socket);
    return os_handle != PIO_INVALID_HANDLE;
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

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
