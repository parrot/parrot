/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/io/filehandle.c - FileHandle utility functions

=head1 DESCRIPTION

This file defines a set of utility functions for the FileHandle PMC used by all
operating systems. For the primary public I/O API, see F<src/io/api.c>.

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_filehandle.h"

/* HEADERIZER HFILE: src/io/io_private.h */

io_filehandle_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL idx)
{
    ASSERT_ARGS(io_filehandle_setup_vtable)
    if (vtable == NULL)
        vtable = &(interp->piodata->vtables[idx]);
    vtable->number = idx;
    vtable->name = "FileHandle";
    vtable->read_s = io_filehandle_read_s;
    vtable->read_b = io_filehandle_read_b;
    vtable->write_s = io_filehandle_write_s;
    vtable->readline_s = io_filehandle_readline_s;
    vtable->readall_s = io_filehandle_readall_s;
    vtable->flush = io_filehandle_flush;
    vtable->is_eof = io_filehandle_is_eof;
    vtable->tell = io_filehandle_tell;
    vtable->peek_b = io_filehandle_peek_b;
    vtable->seek = io_filehandle_seek;
    vtable->open = io_filehandle_open;
    vtable->is_open = io_filehandle_is_open;
    vtable->close = io_filehandle_close;
    vtable->get_encoding = io_filehandle_get_encoding;
    vtable->set_flags = io_filehandle_set_flags;
    vtable->get_flags = io_filehandle_get_flags;
}

static STRING *
io_filehandle_read_s(PARROT_INTERP, ARGMOD(PMC *handle), size_t char_length)
{
    ASSERT_ARGS(io_filehandle_read_s)
}

static INTVAL
io_filehandle_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_filehandle_read_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    const size_t bytes_read = Parrot_io_internal_read(interp, os_handle, buffer, byte_length);
    if (bytes_read == 0) {
        INTVAL flags;
        GETATTR_FileHandle_flags(interp, handle, flags);
        flags |= PIO_F_EOF;
        SETATTR_FileHandle_flags(interp, handle, flags);
    }
}

static INTVAL
io_filehandle_write_s(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *s), size_t char_length)
{
    ASSERT_ARGS(io_filehandle_write_s)
}

static INTVAL
io_filehandle_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_filehandle_write_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_write(interp, handle, buffer, byte_length);
}

static INTVAL
io_filehandle_readline_s(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL terminator)
{
    ASSERT_ARGS(io_filehandle_readline_s)
}

static STRING *
io_filehandle_readall_s(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_readall_s)
}

static INTVAL
io_filehandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_flush_s)
    PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    Parrot_io_internal_flush(interp, os_handle);
}

static INTVAL
io_filehandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_readall_s)
    INTVAL flags;
    GETATTR_FileHandle_flags(interp, pmc, flags);
    if (flags & PIO_F_EOF)
        return 1;
    return 0;
}

static PIOOFF_T
io_filehandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_tell)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_tell(interp, os_handle);
}

static INTVAL
io_filehandle_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_filehandle_seek)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_seek(interp, os_handle, offset, whence);
}

static INTVAL
io_filehandle_peek_b(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_peek_b)
    // TODO: This
}

static INTVAL
io_filehandle_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags, ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_filehandle_open)
    PIOHANDLE os_handle;

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Invalid mode for file open");

    os_handle = Parrot_io_internal_open(interp, path, flags);

    if (os_handle == PIO_INVALID_HANDLE)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Unable to open filehandle from path '%Ss'", path);

    flags |= PIO_F_FILE;

    /* Set generic flag here if is a terminal then
     * FileHandle can know how to setup buffering.
     * STDIN, STDOUT, STDERR would be in this case
     * so we would setup linebuffering.
     */
    if (PIO_IS_TTY(interp, os_handle))
        flags |= PIO_F_CONSOLE;

    SETATTR_FileHandle_os_handle(interp, filehandle, os_handle);
    SETATTR_FileHandle_flags(interp, filehandle, flags);
    SETATTR_FileHandle_filename(interp, filehandle, path);
    SETATTR_FileHandle_mode(interp, filehandle, mode);

    return 1;
}

static INTVAL
io_filehandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_is_open)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, pmc);
    return os_handle != PIO_INVALID_HANDLE;
}

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
        INTVAL result;

        IO_BUFFER * const write_buffer = PIO_GET_WRITE_BUFFER(interp, handle);
        IO_VTABLE * const vtable = PIO_GET_VTABLE(interp, handle);
        Parrot_io_buffer_flush(interp, buffer, handle, vtable);

        result = Parrot_io_internal_close(interp, os_handle);
        io_filehandle_set_os_handle(interp, handle, PIO_INVALID_HANDLE);
        Parrot_io_buffer_clear(interp, write_buffer);
        io_filehandle_set_flags(interp, handle, 0);
        return result;
    }
}

static STR_VTABLE *
io_filehandle_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_filehandle_get_encoding)
    STRING           *encoding_str;
    const STR_VTABLE *encoding;

    GETATTR_FileHandle_encoding(interp, pmc, encoding_str);
    if (!STRING_IS_NULL(encoding_str)) {
        return Parrot_find_encoding_by_string(interp, encoding_str);
    return NULL;
}

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


static void
io_filehandle_ensure_buffer(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL buffer_no, size_t length, INTVAL flags)
{
    ASSERT_ARGS(io_filehandle_ensure_buffer)
    // TODO: This
    switch (buffer_no) {
        case IO_PTR_IDX_READ_BUFFER:
        case IO_PTR_IDX_WRITE_BUFFER:
        default:
    }
}


/* OLD FUNCTIONS
    Below this line are the old functions that need to be cleaned up and
    upgraded to the new architecture
*/


/*

=item C<void Parrot_io_set_os_handle(PARROT_INTERP, PMC *filehandle, PIOHANDLE
file_descriptor)>

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

=item C<PIOHANDLE Parrot_io_get_os_handle(PARROT_INTERP, const PMC *filehandle)>

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

=item C<PIOOFF_T Parrot_io_get_file_position(PARROT_INTERP, const PMC
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

=item C<void Parrot_io_set_file_position(PARROT_INTERP, PMC *filehandle,
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

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
