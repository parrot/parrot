/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/io.c - Common I/O utility functions

=head1 DESCRIPTION

This file defines a set of utility functions for I/O operations used by all
operating systems. For the primary public I/O API, see F<src/io/api.c>.

=cut

*/

#include "parrot/parrot.h"
#include "io/io_private.h"
#include "pmc/pmc_filehandle.h"

/* HEADERIZER HFILE: include/parrot/io.h */

/*

=head2 Functions

=over 4

=item C<INTVAL Parrot_io_parse_open_flags>

Parses a Parrot string for file open mode flags (C<r> for read, C<w> for write,
C<a> for append, and C<p> for pipe) and returns the combined generic bit flags.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_parse_open_flags(PARROT_INTERP, ARGIN_NULLOK(STRING *mode_str))
{
    INTVAL i, mode_len;
    INTVAL flags = 0;

    if (STRING_IS_NULL(mode_str))
        return PIO_F_READ;

    mode_len = string_length(interp, mode_str);

    for (i = 0; i < mode_len; ++i) {
        INTVAL s = string_index(interp, mode_str, i);
        switch (s) {
            case 'r':
                flags |= PIO_F_READ;
                break;
            case 'w':
                flags |= PIO_F_WRITE;
                if (!(flags & PIO_F_APPEND)) /* don't truncate if appending */
                    flags |= PIO_F_TRUNC;
                break;
            case 'a':
                flags |= PIO_F_APPEND;
                if ((flags & PIO_F_TRUNC)) /* don't truncate if appending */
                    flags &= ~PIO_F_TRUNC;
                break;
            case 'p':
                flags |= PIO_F_PIPE;
                break;
            default:
                break;
        }
    }

    /* These comparisons are put in place for backward compatibility, and will
     * be removed after a deprecation cycle. */
    if (flags == 0) {
        INTVAL first = string_index(interp, mode_str, 0);
        INTVAL second = string_index(interp, mode_str, 1);
        switch (first) {
            case '+':
                flags |= (PIO_F_WRITE | PIO_F_READ);
                switch (second) {
                    case '<':
                        break;
                    case '>':
                        flags |= PIO_F_TRUNC;
                        break;
                    default:
                        return 0;
                }
                break;
            case '<':
                flags |= PIO_F_READ;
                break;
            case '>':
                flags |= PIO_F_WRITE;
                if (second == '>') {
                    flags |= PIO_F_APPEND;
                }
                else {
                    flags |= PIO_F_TRUNC;
                }
                break;
            case '-':       /* -| read from pipe */
                if (second == '|') {
                    flags |= PIO_F_PIPE | PIO_F_READ;
                }
                break;
            case '|':       /* |- write to pipe */
                if (second == '-') {
                    flags |= PIO_F_PIPE | PIO_F_WRITE;
                }
                break;
            default:
                return 0;
        }
    }

    return flags;
}

/*

=item C<STRING * Parrot_io_make_string>

Creates a STRING* suitable for returning results from IO read functions.
The passed in C<buf> parameter can:

=over 4

=item 1

Point to a NULL STRING

=item 2

Point to a real STRING

=item 3

Point to a fake STRING with (strstart, bufused) holding the *buffer
information.

=back

In the third case, the buffer or STRING must be able to hold the required
amount of data. For cases 1 and 2, a NULL C<strstart> tells this function to
allocate the STRING memory.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_make_string(PARROT_INTERP, ARGMOD(STRING **buf), size_t len)
{
    /*
     * when we get a NULL string, we read a default len
     */
    if (*buf == NULL) {
        *buf = string_make_empty(interp, enum_stringrep_one, len);
        return *buf;
    }
    else {
        STRING *s = *buf;
        if (s->bufused < len)
            Parrot_allocate_string(interp, s, len);
        return s;
    }
}


/*

=item C<void Parrot_io_set_os_handle>

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

PARROT_EXPORT
void
Parrot_io_set_os_handle(PARROT_INTERP, ARGIN(PMC *filehandle), PIOHANDLE file_descriptor)
{
    PARROT_FILEHANDLE(filehandle)->os_handle = file_descriptor;
}

/*

=item C<PIOHANDLE Parrot_io_get_os_handle>

Retrieve the C<os_handle> attribute of the FileHandle object, which stores the
low-level filehandle for the OS.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PIOHANDLE
Parrot_io_get_os_handle(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->os_handle;
}

/*

=item C<void Parrot_io_set_flags>

Set the C<flags> attribute of the FileHandle object, which stores bitwise flags
marking filehandle characteristics.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
void
Parrot_io_set_flags(PARROT_INTERP, ARGIN(PMC *filehandle), INTVAL flags)
{
    Parrot_FileHandle_attributes *handle_struct = PARROT_FILEHANDLE(filehandle);
    handle_struct->flags = flags;
}

/*

=item C<INTVAL Parrot_io_get_flags>

Set the C<flags> attribute of the FileHandle object, which stores bitwise flags
marking filehandle characteristics.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_get_flags(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    Parrot_FileHandle_attributes *handle_struct = PARROT_FILEHANDLE(filehandle);
    INTVAL flags = handle_struct->flags;
    return flags;
}

/*

=item C<void Parrot_io_set_file_size>

Set the C<file_size> attribute of the FileHandle object, which stores the
current file size.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
void
Parrot_io_set_file_size(PARROT_INTERP, ARGIN(PMC *filehandle), PIOOFF_T file_size)
{
    PARROT_FILEHANDLE(filehandle)->file_size = file_size;
}


/*

=item C<PIOOFF_T Parrot_io_get_file_size>

Get the C<file_size> attribute of the FileHandle object, which stores the
current file size.


Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PIOOFF_T
Parrot_io_get_file_size(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->file_size;
}

/*

=item C<void Parrot_io_set_buffer_start>

Set the C<buffer_start> attribute of the FileHandle object, which stores
the position of the start of the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

void
Parrot_io_set_buffer_start(PARROT_INTERP, ARGIN(PMC *filehandle),
        ARGIN_NULLOK(unsigned char *new_start))
{
    PARROT_FILEHANDLE(filehandle)->buffer_start = new_start;
}

/*

=item C<unsigned char * Parrot_io_get_buffer_start>

Get the C<buffer_start> attribute of the FileHandle object, which stores
the position of the start of the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
unsigned char *
Parrot_io_get_buffer_start(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->buffer_start;
}

/*

=item C<unsigned char * Parrot_io_get_buffer_next>

Get the C<buffer_next> attribute of the FileHandle object, which stores
the current position within the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
unsigned char *
Parrot_io_get_buffer_next(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->buffer_next;
}

/*

=item C<void Parrot_io_set_buffer_next>

Set the C<buffer_next> attribute of the FileHandle object, which stores
the current position within the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

void
Parrot_io_set_buffer_next(PARROT_INTERP, ARGIN(PMC *filehandle),
        ARGIN_NULLOK(unsigned char *new_next))
{
    PARROT_FILEHANDLE(filehandle)->buffer_next = new_next;
}

/*

=item C<unsigned char * Parrot_io_get_buffer_end>

Get the C<buffer_end> attribute of the FileHandle object, which stores
the position of the end of the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
unsigned char *
Parrot_io_get_buffer_end(PARROT_INTERP, ARGIN_NULLOK(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->buffer_end;
}

/*

=item C<void Parrot_io_set_buffer_end>

Set the C<buffer_end> attribute of the FileHandle object, which stores
the position of the end of the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

void
Parrot_io_set_buffer_end(PARROT_INTERP, ARGIN(PMC *filehandle),
        ARGIN_NULLOK(unsigned char *new_end))
{
    PARROT_FILEHANDLE(filehandle)->buffer_end = new_end;
}

/*

=item C<INTVAL Parrot_io_get_buffer_flags>

Get the C<buffer_flags> attribute of the FileHandle object, which stores
a collection of flags specific to the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_get_buffer_flags(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->buffer_flags;
}

/*

=item C<void Parrot_io_set_buffer_flags>

Set the C<buffer_flags> attribute of the FileHandle object, which stores
a collection of flags specific to the buffer.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

void
Parrot_io_set_buffer_flags(PARROT_INTERP, ARGIN(PMC *filehandle), INTVAL new_flags)
{
    PARROT_FILEHANDLE(filehandle)->buffer_flags = new_flags;
}

/*

=item C<size_t Parrot_io_get_buffer_size>

Get the C<buffer_size> attribute of the FileHandle object, which stores
the size of the buffer (in bytes).

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_CAN_RETURN_NULL
size_t
Parrot_io_get_buffer_size(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->buffer_size;
}

/*

=item C<void Parrot_io_set_buffer_size>

Set the C<buffer_size> attribute of the FileHandle object, which stores
the size of the buffer (in bytes).

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

void
Parrot_io_set_buffer_size(PARROT_INTERP, ARGIN(PMC *filehandle), size_t new_size)
{
    PARROT_FILEHANDLE(filehandle)->buffer_size = new_size;
}

/*

=item C<void Parrot_io_clear_buffer>

Clear the filehandle buffer and free the associated memory.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_CAN_RETURN_NULL
void
Parrot_io_clear_buffer(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    Parrot_FileHandle_attributes *io = PARROT_FILEHANDLE(filehandle);
    if (io->buffer_start && (io->flags & PIO_BF_MALLOC)) {
        mem_sys_free(io->buffer_start);
        io->buffer_start = NULL;
    }
}

/*

=item C<PIOOFF_T Parrot_io_get_file_position>

Get the C<file_pos> attribute of the FileHandle object, which stores
the current file position of the filehandle.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PIOOFF_T
Parrot_io_get_file_position(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->file_pos;
}

/*

=item C<PIOOFF_T Parrot_io_get_last_file_position>

Get the C<file_pos> attribute of the FileHandle object, which stores
the current file position of the filehandle.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PIOOFF_T
Parrot_io_get_last_file_position(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    return PARROT_FILEHANDLE(filehandle)->last_pos;
}

/*

=item C<void Parrot_io_set_file_position>

Get the C<file_pos> attribute of the FileHandle object, which stores the
current file position of the filehandle. Also set the C<last_pos> attribute to
the previous value of C<file_pos>.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
void
Parrot_io_set_file_position(PARROT_INTERP, ARGIN(PMC *filehandle), PIOOFF_T file_pos)
{
    Parrot_FileHandle_attributes *handle_struct = PARROT_FILEHANDLE(filehandle);
    handle_struct->last_pos = handle_struct->file_pos;
    handle_struct->file_pos = file_pos;
}

/*

=item C<INTVAL Parrot_io_is_encoding>

Check whether the encoding attribute of the filehandle matches a passed in
string.

Currently, this pokes directly into the C struct of the FileHandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of FileHandle. For now, hiding it behind a function, so
it can be cleanly changed later.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_encoding(PARROT_INTERP, ARGIN(PMC *filehandle), ARGIN(STRING *value))
{
    Parrot_FileHandle_attributes *handle_struct = PARROT_FILEHANDLE(filehandle);
    if (STRING_IS_NULL(handle_struct->encoding))
        return 0;

    if (string_equal(interp, value, handle_struct->encoding) == 0)
        return 1;

    return 0;
}


/*

=back

=head1 SEE ALSO

F<src/io/unix.c>,
F<src/io/win32.c>,
F<src/io/stdio.c>,
F<src/io/io_private.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
