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

/* HEADERIZER HFILE: include/parrot/io.h */

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
STRING *
io_get_new_empty_string(PARROT_INTERP, STR_VTABLE *encoding, size_t char_length)
{
    ASSERT_ARGS(io_get_new_empty_string)
    STRING * result;

    /* Round up length to unit size of encoding */
    size_t byte_length;
    if (encoding->bytes_per_unit > 1)
        byte_length = (length + encoding->bytes_per_unit - 1) &
                      ~(encoding->bytes_per_unit - 1);
    else
        byte_length = char_length;

    /* Allocate 3 bytes more for partial multi-byte characters */
    result           = Parrot_str_new_noinit(interp, byte_length + 3);
    result->encoding = encoding;
    return result;
}

void
io_verify_is_open_for(PARROT_INTERP, ARGIN(PMC *handle), ARGIN(IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_is_open_for)
    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not open", vtable->name);
    if ((vtable->get_flags(interp, handle) & flags) != flags)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not in mode %d", vtable->name, flags);
}

void
io_verify_is_open_for(PARROT_INTERP, ARGIN(PMC *handle), ARGIN(IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_is_open_for)
    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not open", vtable->name);
    if (vtable->get_flags(interp, handle) & flags)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not in mode %d", vtable->name, flags);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_verify_string_encoding(PARROT_INTERP, ARGIN(PMC *handle), ARGIN(IO_VTABLE *vtable), ARGIN(STRING *s))
{
    ASSERT_ARGS(io_verify_string_encoding)
    STR_VTABLE * const encoding = vtable->get_encoding(interp, handle);
    if (encoding == NULL || encoding == s->encoding || encoding == Parrot_binary_encoding_ptr)
        return s;
    return encoding->to_encoding(interp, s);
}

// Read a STRING from the handle with the given number of bytes, assuming the
// handle is open and flagged PIO_F_READ. Perform the necessary shenanigans to
// make sure the STRING contains complete codepoints for multibyte strings.
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_read_encoded_string(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STR_VTABLE *encoding), size_t length)
{
    ASSERT_ARGS(io_read_encoded_string)
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_BUFFER * const read_buffer = IO_GET_READ_BUFFER(interp, handle);
    STRING * result;
    size_t bytes_read;

    io_verify_is_open_for(interp, handle, vtable, PIO_F_READ);
    encoding = io_get_handle_encoding(interp, handle);

    result = io_get_new_empty_string(interp, encoding, char_length);
    bytes_read = Parrot_io_buffer_read_bytes(interp, read_buffer, handle, result-strstart, length);

    if (bytes_read & (encoding->bytes_per_unit - 1))
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_CHARACTER,
            "Unaligned end in %s string\n", encoding->name);

    if (encoding->bytes_per_unit == encoding->max_bytes_per_codepoint) {
        result->bufused = bytes_read;
        STRING_scan(interp, result);
    }
    else {
        Parrot_String_Bounds bounds;
        INTVAL needed;

        bounds.bytes = bytes_read;
        bounds.chars = -1;
        bounds.delim = -1;

        needed = encoding->partial_scan(interp, result->strstart, &bounds);

        result->bufused = bounds.bytes;
        result->strlen  = bounds.chars;

        /* Read and append remaining bytes in case of a partial result */
        if (needed > 0) {
            const INTVAL rest_read = Parrot_io_read_buffer(interp, pmc,
                                    result->strstart + bytes_read, needed);

            if (rest_read < needed)
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_CHARACTER,
                    "Unaligned end in %s string\n", encoding->name);

            /* Check if character is valid */

            bounds.bytes = bytes_read + needed - result->bufused;
            bounds.chars = 1;
            bounds.delim = -1;

            encoding->partial_scan(interp,
                    result->strstart + result->bufused, &bounds);

            PARROT_ASSERT(result->bufused + bounds.bytes ==
                          bytes_read + needed);
            PARROT_ASSERT(bounds.chars == 1);

            result->bufused += bounds.bytes;
            result->strlen  += 1;
        }
    }
    return result;
}

// Read characters out of the buffer and append them to the end of the STRING
void
io_read_chars_append_string(PARROT_INTERP, ARGMOD(STRING * s), ARGMOD(PMC *handle), ARGIN(IO_VTABLE *vtable), ARGMOD(IO_BUFFER *buffer), size_t byte_length)
{
    // TODO: This
    alloc_size = s->bufused + bounds.bytes;

    if (s->strstart)
        Parrot_gc_reallocate_string_storage(interp, s, alloc_size);
    else
        Parrot_gc_allocate_string_storage(interp, s, alloc_size);

    memcpy(s->strstart + s->bufused, buffer_next, bounds.bytes);

    s->bufused += bounds.bytes;
    s->strlen  += bounds.chars;
}

// Read a line, up to and including the terminator character rs, from the
// input handle
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_readline_encoded_string(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STR_VTABLE *encoding), INTVAL rs)
{
    ASSERT_ARGS(io_readline_encoded_string)
    static const size_t max_split_bytes = 3;
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_BUFFER * const read_buffer = IO_GET_READ_BUFFER(interp, handle);

    STRING * const s = Parrot_gc_new_string_header(interp, 0);
    s->bufused  = 0;
    s->strlen   = 0;
    s->encoding = encoding;

    while (1) {
        Parrot_String_Bounds bounds;
        INTVAL got;
        const size_t bytes_to_read = io_buffer_find_string_marker(interp, read_buffer, handle, vtable, encoding, &bounds, rs);

        /* Append buffer to result */
        io_read_chars_append_string(interp, s, handle, vtable, read_buffer, bytes_to_read);
        if (bounds.delim == rs)
            break;

        /* Refill buffer */
        got = Parrot_io_buffer_fill(interp, read_buffer, handle, vtable);
        if (got == 0) {
            /* End of file */

            if (bounds.bytes == buffer_size) {
                buffer_next = buffer_end;
                break;
            }
            else {
                /* TODO: set file position */
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_CHARACTER,
                    "Unaligned end in %s string\n", encoding->name);
            }
        }

        buffer_next = Parrot_io_get_buffer_next(interp, filehandle);
        buffer_end  = Parrot_io_get_buffer_end(interp, filehandle);

        if (bounds.bytes < buffer_size) {
            /* Handle character split across buffers */

            size_t bytes_l = buffer_size - bounds.bytes;
            size_t bytes_r = (size_t)got < max_split_bytes
                           ? (size_t)got : max_split_bytes;

            size_t decoded_size = s->bufused;

            /* First, copy enough bytes to complete character */
            memcpy(s->strstart + decoded_size + bytes_l, buffer_next, bytes_r);

            /* Partial scan of single character */

            bounds.bytes = bytes_l + bytes_r;
            bounds.chars = 1;
            bounds.delim = rs;

            encoding->partial_scan(interp, s->strstart + decoded_size,
                                   &bounds);

            if (bounds.bytes == 0) {
                INTVAL flags = Parrot_io_get_flags(interp, filehandle);

                PARROT_ASSERT((size_t)got == bytes_r);

                if (flags & PIO_F_FILE) {
                    /* TODO: set file position */
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_CHARACTER,
                        "Unaligned end in %s string\n", encoding->name);
                }

                /* Tricky case: We didn't receive enough bytes to complete
                 * the character. So we have to prepend the rest of the old
                 * buffer.
                 */

                memmove(buffer_next + bytes_l, buffer_next, got);
                memcpy(buffer_next, s->strstart + decoded_size, bytes_l);

                buffer_end += bytes_l;
                Parrot_io_set_buffer_end(interp, filehandle, buffer_end);
                break;
            }

            PARROT_ASSERT(bounds.chars == 1);

            s->bufused  += bounds.bytes;
            s->strlen   += 1;

            bytes_r      = bounds.bytes - bytes_l;
            buffer_next += bytes_r;

            if (bounds.delim == rs || (size_t)got == bytes_r) {
                Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
                break;
            }
        }
    }

    /* check if buffer is finished */
    if (buffer_next == buffer_end) {
        Parrot_io_set_buffer_flags(interp, filehandle,
                (Parrot_io_get_buffer_flags(interp, filehandle) & ~PIO_BF_READBUF));
        Parrot_io_set_buffer_next(interp, filehandle,
                Parrot_io_get_buffer_start(interp, filehandle));
        Parrot_io_set_buffer_end(interp, filehandle, NULL);
    }

    Parrot_io_set_file_position(interp, filehandle,
            s->bufused + Parrot_io_get_file_position(interp, filehandle));

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
