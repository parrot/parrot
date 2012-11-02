/*
Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

src/io/pipe.c - IO_VTABLE and helpers for Pipes

=head1 DESCRIPTION

This file implements the IO_VTABLE for pipes and helper functions.

=head2 IO_VTABLE Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_filehandle.h"

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void io_pipe_adv_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    size_t offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_close(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE * io_pipe_get_encoding(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_pipe_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOHANDLE io_pipe_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOOFF_T io_pipe_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_open(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *path),
    INTVAL flags,
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_read_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGOUT(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

static PIOOFF_T io_pipe_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_pipe_set_eof(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL is_set)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_pipe_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void io_pipe_set_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T pos)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static PIOOFF_T io_pipe_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static size_t io_pipe_total_size(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_pipe_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

#define ASSERT_ARGS_io_pipe_adv_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_get_piohandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_get_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_is_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_is_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_io_pipe_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_pipe_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_set_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_total_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void io_pipe_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL idx)>

Set up the Pipe IO_VTABLE.

=cut

*/

void
io_pipe_setup_vtable(PARROT_INTERP, ARGMOD_NULLOK(IO_VTABLE *vtable), INTVAL idx)
{
    ASSERT_ARGS(io_pipe_setup_vtable)
    if (vtable == NULL)
        vtable = IO_EDITABLE_IO_VTABLE(interp, idx);
    vtable->number = idx;
    vtable->flags = PIO_VF_DEFAULT_READ_BUF     /* Use read buffers by default */
                  | PIO_VF_MULTI_READABLE       /* Can read multiple times without hanging */
                  | PIO_VF_FLUSH_ON_CLOSE;      /* Flush handle on close */
    vtable->name = "Pipe";
    vtable->read_b = io_pipe_read_b;
    vtable->write_b = io_pipe_write_b;
    vtable->flush = io_pipe_flush;
    vtable->is_eof = io_pipe_is_eof;
    vtable->set_eof = io_pipe_set_eof;
    vtable->tell = io_pipe_tell;
    vtable->seek = io_pipe_seek;
    vtable->adv_position = io_pipe_adv_position;
    vtable->set_position = io_pipe_set_position;
    vtable->get_position = io_pipe_get_position;
    vtable->open = io_pipe_open;
    vtable->is_open = io_pipe_is_open;
    vtable->close = io_pipe_close;
    vtable->get_encoding = io_pipe_get_encoding;
    vtable->set_flags = io_pipe_set_flags;
    vtable->get_flags = io_pipe_get_flags;
    vtable->total_size = io_pipe_total_size;
    vtable->get_piohandle = io_pipe_get_piohandle;
}

/*

=item C<static INTVAL io_pipe_read_b(PARROT_INTERP, PMC *handle, char *buffer,
size_t byte_length)>

Read up to C<byte_length> bytes from the pipe.

=cut

*/

static INTVAL
io_pipe_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_pipe_read_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    const size_t bytes_read = Parrot_io_internal_read(interp, os_handle, buffer, byte_length);
    if (bytes_read == 0) {
        INTVAL flags;
        GETATTR_FileHandle_flags(interp, handle, flags);
        flags |= PIO_F_EOF;
        SETATTR_FileHandle_flags(interp, handle, flags);
    }
    return bytes_read;
}

/*

=item C<static INTVAL io_pipe_write_b(PARROT_INTERP, PMC *handle, char *buffer,
size_t byte_length)>

Write bytes to the pipe.

=cut

*/

static INTVAL
io_pipe_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_pipe_write_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_write(interp, os_handle, buffer, byte_length);
}

/*

=item C<static INTVAL io_pipe_flush(PARROT_INTERP, PMC *handle)>

Flush the pipe.

=cut

*/

static INTVAL
io_pipe_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_flush)
    /* TODO: In read mode, don't do what this does. */
    PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_flush(interp, os_handle);
}

/*

=item C<static INTVAL io_pipe_is_eof(PARROT_INTERP, PMC *handle)>

Determine if the pipe thinks it's at the end of input.

=item C<static void io_pipe_set_eof(PARROT_INTERP, PMC *handle, INTVAL is_set)>

Do nothing.

=cut

*/

static INTVAL
io_pipe_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_is_eof)
    INTVAL flags;
    GETATTR_FileHandle_flags(interp, handle, flags);
    if (flags & PIO_F_EOF)
        return 1;
    return 0;
}

static void
io_pipe_set_eof(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL is_set)
{
    ASSERT_ARGS(io_pipe_set_eof)
    if (is_set)
        PARROT_FILEHANDLE(handle)->flags |= PIO_F_EOF;
    else
        PARROT_FILEHANDLE(handle)->flags &= ~PIO_F_EOF;
}

/*

=item C<static PIOOFF_T io_pipe_tell(PARROT_INTERP, PMC *handle)>

Pipes don't keep track of position. Throw an exception.

=cut

*/

static PIOOFF_T
io_pipe_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_tell)
    const IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "tell");
    return (PIOOFF_T)0;
}

/*

=item C<static PIOOFF_T io_pipe_seek(PARROT_INTERP, PMC *handle, PIOOFF_T
offset, INTVAL whence)>

Pipes don't seek. Throw an exception.

=cut

*/

static PIOOFF_T
io_pipe_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_pipe_seek)
    const IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "seek");
    UNUSED(offset);
    UNUSED(whence);
    return 0;
}

/*

=item C<static void io_pipe_adv_position(PARROT_INTERP, PMC *handle, size_t
offset)>

Pipes don't keep track of position. Ignore.

=cut

*/

static void
io_pipe_adv_position(PARROT_INTERP, ARGMOD(PMC *handle), size_t offset)
{
    ASSERT_ARGS(io_pipe_adv_position)
    UNUSED(handle);
    UNUSED(offset);
    /* Pipes don't keep track of file position internally. Ignore this. */
}

/*

=item C<static void io_pipe_set_position(PARROT_INTERP, PMC *handle, PIOOFF_T
pos)>

Pipes don't keep track of position. Ignore.

=cut

*/

static void
io_pipe_set_position(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T pos)
{
    ASSERT_ARGS(io_pipe_set_position)
    UNUSED(handle);
    UNUSED(pos);
    /* Pipes don't keep track of file position internally. Ignore. */
}

/*

=item C<static PIOOFF_T io_pipe_get_position(PARROT_INTERP, PMC *handle)>

Pipes don't keep track of position. Return 0.

=cut

*/

static PIOOFF_T
io_pipe_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_get_position)
    /* Pipes don't keep track of file position internally. Return 0 */
    return (PIOOFF_T)0;
}

/*

=item C<static INTVAL io_pipe_open(PARROT_INTERP, PMC *handle, STRING *path,
INTVAL flags, STRING *mode)>

Open the pipe with the command in C<path>.

=cut

*/

static INTVAL
io_pipe_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags,
        ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_pipe_open)

    const int f_read  = (flags & PIO_F_READ) != 0;
    const int f_write = (flags & PIO_F_WRITE) != 0;
    INTVAL    pid;
    PIOHANDLE os_handle;

    /* Hack! If we're opening in file mode, turn this FileHandle into a file
       and use that vtable instead. */
    if ((flags & PIO_F_PIPE) == 0) {
        const IO_VTABLE * const vtable = Parrot_io_get_vtable(interp, IO_VTABLE_FILEHANDLE, NULL);
        VTABLE_set_pointer_keyed_int(interp, handle, IO_PTR_IDX_VTABLE, (void *)vtable);
        return vtable->open(interp, handle, path, flags, mode);
    }

    if (f_read == f_write)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Invalid pipe mode: %X", flags);

    os_handle = Parrot_io_internal_open_pipe(interp, path, flags, &pid);

    /* Save the pid of the child, we'll wait for it when closing */
    VTABLE_set_integer_keyed_int(interp, handle, 0, pid);

    if (flags & PIO_F_BINARY)
        SETATTR_FileHandle_encoding(interp, handle, Parrot_str_new(interp, "binary", 0));

    SETATTR_FileHandle_os_handle(interp, handle, os_handle);
    SETATTR_FileHandle_flags(interp, handle, flags);
    SETATTR_FileHandle_filename(interp, handle, path);
    SETATTR_FileHandle_mode(interp, handle, mode);
    SETATTR_FileHandle_file_pos(interp, handle, 0);

    return 1;
}

/*

=item C<static INTVAL io_pipe_is_open(PARROT_INTERP, PMC *handle)>

Determine if the pipe is currently open.

=cut

*/

static INTVAL
io_pipe_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_is_open)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return os_handle != PIO_INVALID_HANDLE;
}

/*

=item C<static INTVAL io_pipe_close(PARROT_INTERP, PMC *handle)>

Close the pipe.

=cut

*/

static INTVAL
io_pipe_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_close)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);

    if (os_handle == PIO_INVALID_HANDLE)
        return -1;

    else {
        INTVAL pid;
        INTVAL status;
        INTVAL result = Parrot_io_internal_close(interp, os_handle);
        io_filehandle_set_os_handle(interp, handle, PIO_INVALID_HANDLE);
        GETATTR_FileHandle_process_id(interp, handle, pid);
        status = Parrot_proc_waitpid(interp, pid);
        SETATTR_FileHandle_exit_status(interp, handle, status);
        io_pipe_set_flags(interp, handle, 0);
        return result;
    }
}

/*

=item C<static const STR_VTABLE * io_pipe_get_encoding(PARROT_INTERP, PMC
*handle)>

Get the encoding used by the pipe.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE *
io_pipe_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_pipe_get_encoding)
    STRING           *encoding_str;
    const STR_VTABLE *encoding;

    GETATTR_FileHandle_encoding(interp, handle, encoding_str);
    if (!STRING_IS_NULL(encoding_str))
        return Parrot_find_encoding_by_string(interp, encoding_str);
    return NULL;
}

/*

=item C<static void io_pipe_set_flags(PARROT_INTERP, PMC *handle, INTVAL flags)>

Set flags on the Pipe.

=cut

*/

static void
io_pipe_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(io_pipe_set_flags)
    PARROT_FILEHANDLE(handle)->flags = flags;
}

/*

=item C<static INTVAL io_pipe_get_flags(PARROT_INTERP, PMC *handle)>

Get the flags from the pipe.

=cut

*/

static INTVAL
io_pipe_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_pipe_get_flags)
    return PARROT_FILEHANDLE(handle)->flags;
}

/*

=item C<static size_t io_pipe_total_size(PARROT_INTERP, PMC *handle)>

Pipes have an unknown total size.

=cut

*/

static size_t
io_pipe_total_size(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_pipe_total_size)
    return PIO_UNKNOWN_SIZE;
}

/*

=item C<static PIOHANDLE io_pipe_get_piohandle(PARROT_INTERP, PMC *handle)>

Get the stream descriptor for the pipe.

=cut

*/

static PIOHANDLE
io_pipe_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_pipe_get_piohandle)
    return io_filehandle_get_os_handle(interp, handle);
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
