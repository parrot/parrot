/*
Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

src/io/core.c - I/O subsystem core functions

=head1 DESCRIPTION

Core functions for initializing and destroying the I/O subsystem within an
interpreter.

=head2 Resource Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

/*

=item C<INTVAL Parrot_io_parse_open_flags(PARROT_INTERP, const STRING
*mode_str)>

Parses a Parrot string for file open mode flags (C<r> for read, C<w> for write,
C<a> for append, and C<p> for pipe) and returns the combined generic bit flags.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_parse_open_flags(PARROT_INTERP, ARGIN(const STRING *mode_str))
{
    ASSERT_ARGS(Parrot_io_parse_open_flags)
    INTVAL i, mode_len;
    INTVAL flags = 0;

    if (STRING_IS_NULL(mode_str))
        return PIO_F_READ;

    mode_len = Parrot_str_byte_length(interp, mode_str);

    for (i = 0; i < mode_len; ++i) {
        const INTVAL s = STRING_ord(interp, mode_str, i);
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
            flags |= PIO_F_WRITE;
            if ((flags & PIO_F_TRUNC)) /* don't truncate if appending */
                flags &= ~PIO_F_TRUNC;
            break;
          case 'p':
            flags |= PIO_F_PIPE;
            break;
          case 'b':
            flags |= PIO_F_BINARY;
            break;
          default:
            break;
        }
    }

    return flags;
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
io_get_new_filehandle(PARROT_INTERP)
{
    ASSERT_ARGS(io_get_new_filehandle)
    const INTVAL typenum = Parrot_hll_get_ctx_HLL_type(interp,
                                                        enum_class_FileHandle);
    return Parrot_pmc_new(interp, typenum);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
io_get_new_socket(PARROT_INTERP)
{
    ASSERT_ARGS(io_get_new_socket)
    const INTVAL typenum = Parrot_hll_get_ctx_HLL_type(interp,
                                                        enum_class_Socket);
    return Parrot_pmc_new(interp, typenum);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_get_new_empty_string(PARROT_INTERP, STR_VTABLE *encoding,
        size_t char_length, size_t byte_length)
{
    ASSERT_ARGS(io_get_new_empty_string)
    STRING * result;

    /* Round up length to unit size of encoding */
    if (char_length != -1 && encoding->bytes_per_unit > 1)
        byte_length = (byte_length + encoding->bytes_per_unit - 1) &
                      ~(encoding->bytes_per_unit - 1);

    if (byte_length == 0)
        result = Parrot_str_new_noinit(interp, 0);
    else {
        /* Allocate 3 bytes more for partial multi-byte characters */
        result = Parrot_str_new_noinit(interp, byte_length + 3);
    }

    result->encoding = encoding;
    return result;
}

void
io_verify_is_open_for(PARROT_INTERP, ARGIN(PMC *handle),
        ARGIN(IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_verify_is_open_for)
    if (Parrot_io_is_closed(interp, handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not open", vtable->name);
    if (vtable->get_flags(interp, handle) & flags == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not in mode %d", vtable->name, flags);
}

void
io_verify_has_read_buffer(PARROT_INTERP, ARGIN(PMC *handle),
        ARGIN(IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_verify_has_read_buffer)
    IO_BUFFER * buffer = IO_GET_READ_BUFFER(interp, handle);
    if (buffer)
        Parrot_io_buffer_resize(interp, buffer, BUFFER_SIZE_ANY);
    else {
        buffer = Parrot_io_buffer_allocate(interp, handle, flags, NULL, BUFFER_SIZE_ANY);
        VTABLE_set_pointer_keyed_int(interp, handle, IO_PTR_IDX_READ_BUFFER, buffer);
    }
    if (flags != BUFFER_FLAGS_ANY)
        buffer->flags = flags;
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_verify_string_encoding(PARROT_INTERP, ARGIN(PMC *handle),
        ARGIN(IO_VTABLE *vtable), ARGIN(STRING *s))
{
    ASSERT_ARGS(io_verify_string_encoding)
    STR_VTABLE * const encoding = vtable->get_encoding(interp, handle);
    if (encoding == NULL || encoding == s->encoding || encoding == Parrot_binary_encoding_ptr)
        return s;
    return encoding->to_encoding(interp, s);
}

/*

=item C<STRING * io_read_encoded_string(PARROT_INTERP, PMC *handle, IO_VTABLE
*vtable, IO_BUFFER *buffer, STR_VTABLE *encoding, size_t char_length)>

Read a STRING from the handle with the given number of bytes, assuming the
handle is open and flagged PIO_F_READ. Perform the necessary shenanigans to
make sure the STRING contains complete codepoints for multibyte strings.
This requires a non-null, non-zero read buffer.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_read_encoded_string(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGIN(IO_VTABLE *vtable), ARGMOD(IO_BUFFER *buffer),
        ARGIN(STR_VTABLE *encoding), size_t char_length)
{
    ASSERT_ARGS(io_read_encoded_string)
    STRING * const s = Parrot_gc_new_string_header(interp, 0);
    s->bufused  = 0;
    s->strlen   = 0;

    if (encoding == NULL)
        encoding = vtable->get_encoding(interp, handle);

    s->encoding = encoding;

    while (1) {
        Parrot_String_Bounds bounds;
        size_t bytes_to_read = io_buffer_find_num_characters(interp, buffer,
                                        handle, vtable, encoding, &bounds,
                                        char_length);

        /* Buffer is empty, so we're probably at EOF. Check that the last
           codepoint we've read in is a complete one. If so, return the whole
           bunch. Otherwise, throw an exception (really?) saying that we've
           got an unaligned string end. */
        // TODO: Determine if we want to throw the exception or lop off the
        // final half-codepoint instead.
        if (bytes_to_read == 0)  {
            if (bounds.bytes == buffer->buffer_size)
                break;
            else {
                // TODO: set file position
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_CHARACTER,
                    "Unaligned end in %s string\n", encoding->name);
            }
            break;
        }

        /* Append buffer to result */
        io_read_chars_append_string(interp, s, handle, vtable, buffer, bytes_to_read);

        if (bounds.chars == char_length)
            break;
    }
    return s;
}

/*

=item C<void io_read_chars_append_string(PARROT_INTERP, STRING * s, PMC *handle,
IO_VTABLE *vtable, IO_BUFFER *buffer, size_t byte_length)>

Read characters out of the buffer and append them to the end of the existing
STRING. The STRING should be in "edit" mode and should not be referenced
by anything outside the IO subsystem. The byte_length should be accurate,
The buffer should be prepared and scanned ahead of time to ensure the
number of bytes to be read is the number of bytes actually available for
reading.

=cut

*/

void
io_read_chars_append_string(PARROT_INTERP, ARGMOD(STRING * s),
        ARGMOD(PMC *handle), ARGIN(IO_VTABLE *vtable),
        ARGMOD(IO_BUFFER *buffer), size_t byte_length)
{
    // TODO: This
    const size_t alloc_size = s->bufused + byte_length;

    if (s->strstart)
        Parrot_gc_reallocate_string_storage(interp, s, alloc_size);
    else
        Parrot_gc_allocate_string_storage(interp, s, alloc_size);

    Parrot_io_buffer_read_b(interp, buffer, handle, vtable,
                            s->strstart + s->bufused, byte_length);

    s->bufused += byte_length;
    STRING_scan(interp, s);
}

/*

=item C<STRING * io_readline_encoded_string(PARROT_INTERP, PMC *handle,
IO_VTABLE *vtable, IO_BUFFER *buffer, STR_VTABLE *encoding, INTVAL rs)>

Read a line, up to and including the terminator character rs, from the
input handle

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_readline_encoded_string(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGIN(IO_VTABLE *vtable), ARGMOD(IO_BUFFER *buffer),
        ARGIN(STR_VTABLE *encoding), INTVAL rs)
{
    ASSERT_ARGS(io_readline_encoded_string)
    STRING * const s = Parrot_gc_new_string_header(interp, 0);
    s->bufused  = 0;
    s->strlen   = 0;

    if (encoding == NULL)
        encoding = vtable->get_encoding(interp, handle);

    s->encoding = encoding;

    while (1) {
        Parrot_String_Bounds bounds;
        const size_t bytes_to_read = io_buffer_find_string_marker(interp,
                               buffer, handle, vtable, encoding, &bounds, rs);

        /* Buffer is empty, so we're probably at EOF. Check that the last
           codepoint we've read in is a complete one. If so, return the whole
           bunch. Otherwise, throw an exception (really?) saying that we've
           got an unaligned string end. */
        // TODO: Determine if we want to throw the exception or lop off the
        // final half-codepoint instead.
        if (bytes_to_read == 0)  {
            if (bounds.bytes == buffer->buffer_size)
                break;
            else {
                // TODO: set file position
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_CHARACTER,
                    "Unaligned end in %s string\n", encoding->name);
            }
            break;
        }

        /* Append buffer to result */
        io_read_chars_append_string(interp, s, handle, vtable, buffer, bytes_to_read);

        /* If we've found the delimiter, we're at the end of line. Return
           it */
        if (bounds.delim == rs)
            break;
    }

    return s;
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
