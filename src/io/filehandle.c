/*
Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

src/io/filehandle.c - FileHandle IO_VTABLE and helper routines.

=head1 DESCRIPTION

This file implements the standard VTABLE for FileHandles and file IO
operations. It relies on several low-level routines in
src/platform/xxx/io.c.

=cut

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

static void io_filehandle_adv_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_filehandle_close(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_filehandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE * io_filehandle_get_encoding(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_filehandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOHANDLE io_filehandle_get_piohandle(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOOFF_T io_filehandle_get_position(PARROT_INTERP,
    ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_filehandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_filehandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_filehandle_open(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *path),
    INTVAL flags,
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle);

static INTVAL io_filehandle_read_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGOUT(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

static PIOOFF_T io_filehandle_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_filehandle_set_eof(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL is_set)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_filehandle_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void io_filehandle_set_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T pos)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static PIOOFF_T io_filehandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static size_t io_filehandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_filehandle_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

#define ASSERT_ARGS_io_filehandle_adv_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_get_piohandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_get_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_is_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_is_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_io_filehandle_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_filehandle_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_set_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_total_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_filehandle_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void io_filehandle_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL
idx)>

Setup the VTABLE for FileHandles.

=cut

*/

void
io_filehandle_setup_vtable(PARROT_INTERP, ARGMOD_NULLOK(IO_VTABLE *vtable), INTVAL idx)
{
    ASSERT_ARGS(io_filehandle_setup_vtable)
    if (vtable == NULL)
        vtable = IO_EDITABLE_IO_VTABLE(interp, idx);
    vtable->number = idx;
    vtable->flags = PIO_VF_DEFAULT_READ_BUF
                  | PIO_VF_DEFAULT_WRITE_BUF
                  | PIO_VF_MULTI_READABLE
                  | PIO_VF_FLUSH_ON_CLOSE;
    vtable->name = "FileHandle";
    vtable->read_b = io_filehandle_read_b;
    vtable->write_b = io_filehandle_write_b;
    vtable->flush = io_filehandle_flush;
    vtable->is_eof = io_filehandle_is_eof;
    vtable->set_eof = io_filehandle_set_eof;
    vtable->tell = io_filehandle_tell;
    vtable->seek = io_filehandle_seek;
    vtable->adv_position = io_filehandle_adv_position;
    vtable->set_position = io_filehandle_set_position;
    vtable->get_position = io_filehandle_get_position;
    vtable->open = io_filehandle_open;
    vtable->is_open = io_filehandle_is_open;
    vtable->close = io_filehandle_close;
    vtable->get_encoding = io_filehandle_get_encoding;
    vtable->set_flags = io_filehandle_set_flags;
    vtable->get_flags = io_filehandle_get_flags;
    vtable->total_size = io_filehandle_total_size;
    vtable->get_piohandle = io_filehandle_get_piohandle;
}

/*

=item C<static INTVAL io_filehandle_read_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Read the given number of bytes from the C<handle>. Does some bookkeeping and
redirects to C<Parrot_io_internal_read>. Returns the number of bytes read.

=cut

*/

static INTVAL
io_filehandle_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_filehandle_read_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    const size_t bytes_read = Parrot_io_internal_read(interp, os_handle, buffer, byte_length);
    return bytes_read;
}

/*

=item C<static INTVAL io_filehandle_write_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Write the given bytes to the file descriptor. Redirect to
C<Parrot_io_internal_write>. Return the number of bytes written.

=cut

*/

static INTVAL
io_filehandle_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_filehandle_write_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_write(interp, os_handle, buffer, byte_length);
}

/*

=item C<static INTVAL io_filehandle_flush(PARROT_INTERP, PMC *handle)>

Flush the handle at the OS level.

=cut

*/

static INTVAL
io_filehandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_flush)
    /* TODO: In read mode, don't do what this does. */
    PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_flush(interp, os_handle);
}

/*

=item C<static INTVAL io_filehandle_is_eof(PARROT_INTERP, PMC *handle)>

Determine if this handle as at end-of-file.

=item C<static void io_filehandle_set_eof(PARROT_INTERP, PMC *handle, INTVAL
is_set)>

Set or clear the EOF flag.

=cut

*/

static INTVAL
io_filehandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_is_eof)
    INTVAL flags;
    GETATTR_FileHandle_flags(interp, handle, flags);
    if (flags & PIO_F_EOF)
        return 1;
    return 0;
}

static void
io_filehandle_set_eof(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL is_set)
{
    ASSERT_ARGS(io_filehandle_set_eof)
    if (is_set)
        PARROT_FILEHANDLE(handle)->flags |= PIO_F_EOF;
    else
        PARROT_FILEHANDLE(handle)->flags &= ~PIO_F_EOF;
}

/*

=item C<static PIOOFF_T io_filehandle_tell(PARROT_INTERP, PMC *handle)>

Get the current offset of the file descriptor.

=cut

*/

static PIOOFF_T
io_filehandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_tell)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_tell(interp, os_handle);
}

/*

=item C<static PIOOFF_T io_filehandle_seek(PARROT_INTERP, PMC *handle, PIOOFF_T
offset, INTVAL whence)>

Perform a seek on the file descriptor. C<whence> is one of C<SEEK_SET>,
C<SEEK_CUR> or C<SEEK_END>.

=cut

*/

static PIOOFF_T
io_filehandle_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_filehandle_seek)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    Parrot_FileHandle_attributes * const attrs = PARROT_FILEHANDLE(handle);
    PIOOFF_T new_pos = Parrot_io_internal_seek(interp, os_handle, offset, whence);
    attrs->flags &= ~PIO_F_EOF;
    attrs->last_pos = attrs->file_pos;
    attrs->file_pos = new_pos;
    return new_pos;
}

/*

=item C<static void io_filehandle_adv_position(PARROT_INTERP, PMC *handle,
size_t len)>

Advance the in-memory file position of the FileHandle PMC by a given number of
bytes.

=item C<static void io_filehandle_set_position(PARROT_INTERP, PMC *handle,
PIOOFF_T pos)>

Set the in-memory file position of the FileHandle PMC.

=item C<static PIOOFF_T io_filehandle_get_position(PARROT_INTERP, PMC *handle)>

Get the current in-memory offset from the FileHandle.

=cut

*/

static void
io_filehandle_adv_position(PARROT_INTERP, ARGMOD(PMC *handle), size_t len)
{
    ASSERT_ARGS(io_filehandle_adv_position)
    Parrot_FileHandle_attributes * const attrs = PARROT_FILEHANDLE(handle);
    attrs->last_pos = attrs->file_pos;
    attrs->file_pos += len;
}

static void
io_filehandle_set_position(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T pos)
{
    ASSERT_ARGS(io_filehandle_set_position)
    Parrot_FileHandle_attributes * const attrs = PARROT_FILEHANDLE(handle);
    attrs->file_pos = pos;
}

static PIOOFF_T
io_filehandle_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_get_position)
    Parrot_FileHandle_attributes * const attrs = PARROT_FILEHANDLE(handle);
    return attrs->file_pos;
}

/*

=item C<static INTVAL io_filehandle_open(PARROT_INTERP, PMC *handle, STRING
*path, INTVAL flags, STRING *mode)>

Open the filehandle for the operation specified by C<flags> and the C<path>.

=cut

*/

static INTVAL
io_filehandle_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags,
        ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_filehandle_open)
    PIOHANDLE os_handle;

    /* Hack! If we're opening in pipe mode, turn this FileHandle into a pipe
       and use that vtable instead. */
    if (flags & PIO_F_PIPE) {
        const IO_VTABLE * const vtable = io_filehandle_convert_to_pipe(interp, handle);
        return vtable->open(interp, handle, path, flags, mode);
    }

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Invalid mode for file open");

    if (flags & PIO_F_BINARY)
        SETATTR_FileHandle_encoding(interp, handle, Parrot_str_new(interp, "binary", 0));

    os_handle = Parrot_io_internal_open(interp, path, flags);

    if (os_handle == PIO_INVALID_HANDLE)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Unable to open filehandle from path '%Ss'", path);

    /* Set generic flag here if is a terminal then
     * FileHandle can know how to setup buffering.
     * STDIN, STDOUT, STDERR would be in this case
     * so we would setup linebuffering.
     */
    if (Parrot_io_internal_is_tty(interp, os_handle))
        flags |= PIO_F_CONSOLE;

    SETATTR_FileHandle_os_handle(interp, handle, os_handle);
    SETATTR_FileHandle_flags(interp, handle, flags);
    SETATTR_FileHandle_filename(interp, handle, path);
    SETATTR_FileHandle_mode(interp, handle, mode);
    SETATTR_FileHandle_file_pos(interp, handle, 0);

    return 1;
}

/*

=item C<static INTVAL io_filehandle_is_open(PARROT_INTERP, PMC *handle)>

Determine if the FileHandle is currently open.

=cut

*/

static INTVAL
io_filehandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_is_open)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return os_handle != PIO_INVALID_HANDLE;
}

/*

=item C<static INTVAL io_filehandle_close(PARROT_INTERP, PMC *handle)>

Close the FileHandle, if it's open.

=cut

*/

static INTVAL
io_filehandle_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_close)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    const INTVAL flags = PARROT_FILEHANDLE(handle)->flags;

    if (os_handle == PIO_INVALID_HANDLE)
        return -1;      /* Can't close an invalid handle */
    if (flags & PIO_F_SHARED)
        return -1;      /* Don't try to close a shared handle, somebody else
                           is managing it */

    else {
        INTVAL result = Parrot_io_internal_close(interp, os_handle);
        io_filehandle_set_os_handle(interp, handle, PIO_INVALID_HANDLE);
        io_filehandle_set_flags(interp, handle, 0);
        return result;
    }
}

/*

=item C<static const STR_VTABLE * io_filehandle_get_encoding(PARROT_INTERP, PMC
*handle)>

Get the current encoding of the FileHandle.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE *
io_filehandle_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_get_encoding)
    STRING           *encoding_str;
    const STR_VTABLE *encoding;

    GETATTR_FileHandle_encoding(interp, handle, encoding_str);
    if (!STRING_IS_NULL(encoding_str))
        return Parrot_find_encoding_by_string(interp, encoding_str);
    return NULL;
}

/*

=item C<static void io_filehandle_set_flags(PARROT_INTERP, PMC *handle, INTVAL
flags)>

Set the mode flags on the FileHandle.

=item C<static INTVAL io_filehandle_get_flags(PARROT_INTERP, PMC *handle)>

Get the mode flags from the FileHandle.

=cut

*/

static void
io_filehandle_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(io_filehandle_set_flags)
    PARROT_FILEHANDLE(handle)->flags = flags;
}

static INTVAL
io_filehandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_get_flags)
    return PARROT_FILEHANDLE(handle)->flags;
}

/*

=item C<static size_t io_filehandle_total_size(PARROT_INTERP, PMC *handle)>

Determine the total on-disk size of the file.

=cut

*/

static size_t
io_filehandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_total_size)
    INTVAL flags;
    GETATTR_FileHandle_flags(interp, handle, flags);
    if ((flags & PIO_F_CONSOLE) == 0) {
        STRING *name;
        GETATTR_FileHandle_filename(interp, handle, name);
        if (!STRING_IS_NULL(name))
            return (size_t)(Parrot_file_stat_intval(interp, name, STAT_FILESIZE));
    }
    return PIO_UNKNOWN_SIZE;
}

/*

=item C<static PIOHANDLE io_filehandle_get_piohandle(PARROT_INTERP, PMC
*handle)>

Get the file descriptor.

=cut

*/

static PIOHANDLE
io_filehandle_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_get_piohandle)
    return io_filehandle_get_os_handle(interp, handle);
}



/*

=item C<void io_filehandle_set_os_handle(PARROT_INTERP, PMC *filehandle,
PIOHANDLE file_descriptor)>

Sets the C<os_handle> attribute of the FileHandle object, which stores the
low-level filehandle for the OS.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

Possibly, this function should reset some characteristics of the object (like
buffer and file positions) to their default values.

=cut

*/

void
io_filehandle_set_os_handle(SHIM_INTERP, ARGMOD(PMC *filehandle), PIOHANDLE file_descriptor)
{
    ASSERT_ARGS(io_filehandle_set_os_handle)
    PARROT_FILEHANDLE(filehandle)->os_handle = file_descriptor;
}

/*

=item C<PIOHANDLE io_filehandle_get_os_handle(PARROT_INTERP, const PMC
*filehandle)>

Retrieve the C<os_handle> attribute of the FileHandle object, which stores the
low-level filehandle for the OS.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
io_filehandle_get_os_handle(SHIM_INTERP, ARGIN(const PMC *filehandle))
{
    ASSERT_ARGS(io_filehandle_get_os_handle)
    return PARROT_FILEHANDLE(filehandle)->os_handle;
}

/*

=back

=head2 Helper Functions

=over 4

=cut

*/

/*

=item C<PIOOFF_T io_filehandle_get_file_position(PARROT_INTERP, const PMC
*filehandle)>

Get the C<file_pos> attribute of the FileHandle object, which stores
the current file position of the filehandle.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOOFF_T
io_filehandle_get_file_position(SHIM_INTERP, ARGIN(const PMC *filehandle))
{
    ASSERT_ARGS(io_filehandle_get_file_position)
    return PARROT_FILEHANDLE(filehandle)->file_pos;
}

/*

=item C<void io_filehandle_set_file_position(PARROT_INTERP, PMC *filehandle,
PIOOFF_T file_pos)>

Get the C<file_pos> attribute of the FileHandle object, which stores the
current file position of the filehandle. Also set the C<last_pos> attribute to
the previous value of C<file_pos>.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

void
io_filehandle_set_file_position(SHIM_INTERP, ARGMOD(PMC *filehandle), PIOOFF_T file_pos)
{
    ASSERT_ARGS(io_filehandle_set_file_position)
    Parrot_FileHandle_attributes * const handle_struct = PARROT_FILEHANDLE(filehandle);
    handle_struct->last_pos = handle_struct->file_pos;
    handle_struct->file_pos = file_pos;
}

/*

=item C<const IO_VTABLE * io_filehandle_convert_to_pipe(PARROT_INTERP, PMC
*handle)>

Convert FileHandle C<handle> from file mode to pipe mode by swapping vtables.
Return the Pipe vtable.

Notice that this function may go away when FileHandle and Pipe are separate
PMC types.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const IO_VTABLE *
io_filehandle_convert_to_pipe(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_convert_to_pipe)
    const IO_VTABLE * const vtable = Parrot_io_get_vtable(interp, IO_VTABLE_PIPE, NULL);
    VTABLE_set_pointer_keyed_int(interp, handle, IO_PTR_IDX_VTABLE, (void *)vtable);
    return vtable;
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
