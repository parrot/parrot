/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/io/socket.c - Socket IO_VTABLE

=head1 DESCRIPTION

This file implements the Socket IO_VTABLE and some helper routines.

=head2 IO_VTABLE Functions

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

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void io_socket_adv_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    size_t offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_socket_close(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_socket_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE * io_socket_get_encoding(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_socket_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOHANDLE io_socket_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOOFF_T io_socket_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_socket_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_socket_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_socket_open(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *path),
    INTVAL flags,
    ARGIN(STRING * mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle);

static INTVAL io_socket_read_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGOUT(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

static PIOOFF_T io_socket_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_socket_set_eof(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL is_eof)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_socket_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void io_socket_set_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T pos)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static PIOOFF_T io_socket_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static size_t io_socket_total_size(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_socket_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

#define ASSERT_ARGS_io_socket_adv_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_get_piohandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_get_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_is_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_is_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_io_socket_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_socket_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_set_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_total_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_socket_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void io_socket_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL
idx)>

Setup the Socket IO_VTABLE.

=cut

*/

void
io_socket_setup_vtable(PARROT_INTERP, ARGMOD_NULLOK(IO_VTABLE *vtable), INTVAL idx)
{
    ASSERT_ARGS(io_socket_setup_vtable)
    if (vtable == NULL)
        vtable = IO_EDITABLE_IO_VTABLE(interp, idx);
    vtable->number = idx;
    vtable->flags = PIO_VF_DEFAULT_READ_BUF     /* Use a read buffer by default */
                  | PIO_VF_FLUSH_ON_CLOSE;      /* Flush the socket on close    */
    vtable->name = "Socket";
    vtable->read_b = io_socket_read_b;
    vtable->write_b = io_socket_write_b;
    vtable->flush = io_socket_flush;
    vtable->is_eof = io_socket_is_eof;
    vtable->set_eof = io_socket_set_eof;
    vtable->tell = io_socket_tell;
    vtable->seek = io_socket_seek;
    vtable->adv_position = io_socket_adv_position;
    vtable->set_position = io_socket_set_position;
    vtable->get_position = io_socket_get_position;
    vtable->open = io_socket_open;
    vtable->is_open = io_socket_is_open;
    vtable->close = io_socket_close;
    vtable->get_encoding = io_socket_get_encoding;
    vtable->set_flags = io_socket_set_flags;
    vtable->get_flags = io_socket_get_flags;
    vtable->total_size = io_socket_total_size;
}

/*

=item C<static INTVAL io_socket_read_b(PARROT_INTERP, PMC *handle, char *buffer,
size_t byte_length)>

Read a number of bytes from the socket with C<recv>. Notice that C<recv> may
hang if there is no data to read, so don't call it too often.

=cut

*/

static INTVAL
io_socket_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_socket_read_b)
    PIOHANDLE os_handle;
    GETATTR_Socket_os_handle(interp, handle, os_handle);
    return Parrot_io_internal_recv(interp, os_handle, buffer, byte_length);
}

/*

=item C<static INTVAL io_socket_write_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Write a number of bytes to the socket with C<send>.

=cut

*/

static INTVAL
io_socket_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_socket_write_b)
    PIOHANDLE os_handle;
    GETATTR_Socket_os_handle(interp, handle, os_handle);
    return Parrot_io_internal_send(interp, os_handle, buffer, byte_length);
}

/*

=item C<static INTVAL io_socket_flush(PARROT_INTERP, PMC *handle)>

Flush the socket. Currently this does nothing.

=cut

*/

static INTVAL
io_socket_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_flush)
    /* TODO: Do we need to fsync the socket? */
    return 0;
}

/*

=item C<static INTVAL io_socket_is_eof(PARROT_INTERP, PMC *handle)>

Sockets are not "passed-the-end" so long as the connection is open. Return 0.

=item C<static void io_socket_set_eof(PARROT_INTERP, PMC *handle, INTVAL
is_eof)>

Do nothing.

=cut

*/

static INTVAL
io_socket_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_is_eof)
    UNUSED(interp);
    UNUSED(handle);
    return 0;
}

static void
io_socket_set_eof(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL is_eof)
{
    ASSERT_ARGS(io_socket_set_eof)
    UNUSED(interp);
    UNUSED(handle);
    UNUSED(is_eof);
}

/*

=item C<static PIOOFF_T io_socket_tell(PARROT_INTERP, PMC *handle)>

Sockets do not have tell. Throw an exception.

=cut

*/

static PIOOFF_T
io_socket_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_tell)
    const IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "tell");
    return (PIOOFF_T)0;
}

/*

=item C<static PIOOFF_T io_socket_seek(PARROT_INTERP, PMC *handle, PIOOFF_T
offset, INTVAL whence)>

Sockets do not have a concept of seek. Throw an exception.

=cut

*/

static PIOOFF_T
io_socket_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_socket_seek)
    const IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    UNUSED(offset);
    UNUSED(whence);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "seek");
    return 0;
}

/*

=item C<static void io_socket_adv_position(PARROT_INTERP, PMC *handle, size_t
offset)>

Do nothing. Sockets don't keep track of position.

=item C<static void io_socket_set_position(PARROT_INTERP, PMC *handle, PIOOFF_T
pos)>

Do nothing. Sockets don't keep track of position.

=item C<static PIOOFF_T io_socket_get_position(PARROT_INTERP, PMC *handle)>

Do nothing. Sockets don't keep track of position.

=cut

*/

static void
io_socket_adv_position(PARROT_INTERP, ARGMOD(PMC *handle), size_t offset)
{
    ASSERT_ARGS(io_socket_adv_position)
    UNUSED(handle)
    UNUSED(offset)
    /* Socket doesn't keep track of position internally. Ignore this. */
}

static void
io_socket_set_position(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T pos)
{
    ASSERT_ARGS(io_socket_set_position)
    UNUSED(handle)
    UNUSED(pos)
    /* Socket doesn't keep track of position internally. Ignore. */
}

static PIOOFF_T
io_socket_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_get_position)
    /* Socket doesn't keep track of position internally. Return 0 */
    return (PIOOFF_T)0;
}

/*

=item C<static INTVAL io_socket_open(PARROT_INTERP, PMC *handle, STRING *path,
INTVAL flags, STRING * mode)>

Do nothing. Sockets use connect and accept instead of open.

=cut

*/

static INTVAL
io_socket_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path),
        INTVAL flags, ARGIN(STRING * mode))
{
    ASSERT_ARGS(io_socket_open)
    PIOHANDLE os_handle;
    GETATTR_Socket_os_handle(interp, handle, os_handle);
    UNUSED(flags);
    UNUSED(mode);
    return Parrot_io_internal_flush(interp, os_handle);
}

/*

=item C<static INTVAL io_socket_is_open(PARROT_INTERP, PMC *handle)>

Determine if the socket is currently connected and open.

=cut

*/

static INTVAL
io_socket_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_is_open)
    PIOHANDLE os_handle;
    GETATTR_Socket_os_handle(interp, handle, os_handle);
    return os_handle != PIO_INVALID_HANDLE;
}

/*

=item C<static INTVAL io_socket_close(PARROT_INTERP, PMC *handle)>

Disconnect the socket.

=cut

*/

static INTVAL
io_socket_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_socket_close)
    INTVAL result = 0;
    PIOHANDLE os_handle;
    GETATTR_Socket_os_handle(interp, handle, os_handle);

    if (os_handle != PIO_INVALID_HANDLE)
        result = Parrot_io_internal_close_socket(interp, os_handle);
    SETATTR_Socket_os_handle(interp, handle, PIO_INVALID_HANDLE);
    return result;
}

/*

=item C<static void io_socket_set_flags(PARROT_INTERP, PMC *handle, INTVAL
flags)>

Do nothing.

=item C<static INTVAL io_socket_get_flags(PARROT_INTERP, PMC *handle)>

Return C<PIO_F_WRITE | PIO_F_READ>. Sockets are always flagged r/w.

=cut

*/

static void
io_socket_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(io_socket_set_flags)
    UNUSED(flags)
    /* Ignore, for now */
}

static INTVAL
io_socket_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_socket_get_flags)
    /* For now, just say that all sockets are read/write handles */
    return PIO_F_WRITE | PIO_F_READ;
}

/*

=item C<static size_t io_socket_total_size(PARROT_INTERP, PMC *handle)>

Return C<0>. Sockets do not have a concept of total size.

=cut

*/

static size_t
io_socket_total_size(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_socket_total_size)
    const IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "total_size");
    return (size_t)0;
}

/*

=item C<static PIOHANDLE io_socket_get_piohandle(PARROT_INTERP, PMC *handle)>

Get the OS-level C<socket> object.

=cut

*/

static PIOHANDLE
io_socket_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_socket_get_piohandle)
    PIOHANDLE os_handle;
    GETATTR_Socket_os_handle(interp, handle, os_handle);
    return os_handle;
}

/*

=item C<static const STR_VTABLE * io_socket_get_encoding(PARROT_INTERP, PMC
*handle)>

Get the encoding of this socket, if one is set.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE *
io_socket_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_socket_get_encoding)
    STRING           *encoding_str;
    const STR_VTABLE *encoding;

    GETATTR_Socket_encoding(interp, handle, encoding_str);
    if (!STRING_IS_NULL(encoding_str))
        return Parrot_find_encoding_by_string(interp, encoding_str);
    return Parrot_binary_encoding_ptr;
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
