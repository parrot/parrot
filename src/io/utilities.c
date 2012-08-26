/*
Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

src/io/utilities.c - Utility and helper functions for the IO subsystem.

=head1 DESCRIPTION

Various helper and utility functions for the IO subsystem. Routines in this
file specifically help with common or shared operations and help add a layer
of intelligence between the IO API and the buffering API.

=head2 Functions

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

/*

=item C<PMC * io_get_new_filehandle(PARROT_INTERP)>

Get a new FileHandle PMC, or whatever is the HLL-mapped alternative.

=item C<PMC * io_get_new_socket(PARROT_INTERP)>

Get a new Socket PMC, or whatever is the HLL-mapped alternative.

=item C<STRING * io_get_new_empty_string(PARROT_INTERP, const STR_VTABLE
*encoding, INTVAL char_length, INTVAL byte_length)>

Allocate a new, empty STRING header with some space pre-allocated to hold
incoming data.

=cut

*/

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
io_get_new_empty_string(PARROT_INTERP, ARGIN_NULLOK(const STR_VTABLE *encoding),
        INTVAL char_length, INTVAL byte_length)
{
    ASSERT_ARGS(io_get_new_empty_string)
    STRING * result;

    /* Round up length to unit size of encoding */
    if (char_length != -1 && encoding->bytes_per_unit > 1)
        byte_length = (byte_length + encoding->bytes_per_unit - 1) &
                      ~(encoding->bytes_per_unit - 1);

    if (byte_length < PIO_STRING_BUFFER_MINSIZE)
        byte_length = PIO_STRING_BUFFER_MINSIZE;

    result = Parrot_str_new_noinit(interp, byte_length);
    result->encoding = encoding;
    result->hashval = 0;
    return result;
}

/*

=item C<void io_verify_is_open_for(PARROT_INTERP, PMC *handle, const IO_VTABLE
*vtable, INTVAL flags)>

Verify that the given C<handle> is open for the operation(s) specified in
C<flags>. C<flags> can be one of C<PIO_F_READ> or C<PIO_F_WRITE>. This
function throws an exception if this handle is closed or if it is not open
for the specified mode.

There is an exception that certain types are flagged C<PIO_VF_ALWAYS_READABLE>
on the vtable. Those types are always readable, so take that into account.

=cut

*/

void
io_verify_is_open_for(PARROT_INTERP, ARGIN(PMC *handle),
        ARGIN(const IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_verify_is_open_for)

    /* Some types like StringHandle are always readable, even if only opened
       in 'w' mode or when closed. Several parts of the build, test suite and
       libraries depend on this. */
    if (vtable->flags & PIO_VF_AWAYS_READABLE) {
        if (flags == PIO_F_READ)
            return;
        else
            flags &= ~PIO_F_READ;
    }

    if (Parrot_io_is_closed(interp, handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not open", vtable->name);
    if ((vtable->get_flags(interp, handle) & flags) == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "IO PMC %s is not in mode %d", vtable->name, flags);
}

/*

=item C<IO_BUFFER * io_verify_has_read_buffer(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, INTVAL flags)>

Verify that the given C<handle> has a read buffer attached. If not, allocate
one.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
IO_BUFFER *
io_verify_has_read_buffer(PARROT_INTERP, ARGIN(PMC *handle),
        ARGIN(const IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_verify_has_read_buffer)
    IO_BUFFER * buffer = IO_GET_READ_BUFFER(interp, handle);
    if (!buffer) {
        const STR_VTABLE * encoding = vtable->get_encoding(interp, handle);
        if (encoding == NULL)
            encoding = Parrot_platform_encoding_ptr;
        buffer = Parrot_io_buffer_allocate(interp, handle, flags, encoding, BUFFER_SIZE_ANY);
        VTABLE_set_pointer_keyed_int(interp, handle, IO_PTR_IDX_READ_BUFFER, buffer);
    }
    PARROT_ASSERT(buffer);
    if (flags != BUFFER_FLAGS_ANY)
        buffer->flags = flags;
    return buffer;
}

/*

=item C<STRING * io_verify_string_encoding(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, STRING *s, INTVAL flags)>

Verify that the given string C<s> has a suitable encoding for use with
C<handle>. If not, re-encode the string to be compatible. Return a string that
is compatible with C<handle>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_verify_string_encoding(PARROT_INTERP, ARGIN(PMC *handle),
        ARGIN(const IO_VTABLE *vtable), ARGIN(STRING *s), INTVAL flags)
{
    ASSERT_ARGS(io_verify_string_encoding)
    const STR_VTABLE * const encoding = io_get_encoding(interp, handle, vtable, flags);

    /* If we still don't have an encoding or if we don't need to do any
       converting, we're good. Return. */
    if (encoding == NULL || encoding == s->encoding || encoding == Parrot_binary_encoding_ptr)
        return s;

    /* Else, convert to the necessary encoding */
    return encoding->to_encoding(interp, s);
}

/*

=item C<STRING * io_read_encoded_string(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, IO_BUFFER *buffer, const STR_VTABLE *encoding, size_t
char_length)>

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
        ARGIN(const IO_VTABLE *vtable), ARGMOD(IO_BUFFER *buffer),
        ARGIN_NULLOK(const STR_VTABLE *encoding), size_t char_length)
{
    ASSERT_ARGS(io_read_encoded_string)
    STRING * const s = Parrot_gc_new_string_header(interp, 0);
    const size_t raw_reads = buffer->raw_reads;
    size_t total_bytes_read = 0;
    Parrot_String_Bounds bounds;
    size_t bytes_to_read = 0;

    s->bufused  = 0;
    s->strlen   = 0;

    if (encoding == NULL)
        encoding = io_get_encoding(interp, handle, vtable, PIO_F_READ);
    s->encoding = encoding;

    PARROT_ASSERT(s->encoding);

    /* When we have a request with PIO_READ_SIZE_ANY, we just want a big chunk
       of data. Fill the buffer up as full as it gets and read it out. */
    if (char_length == PIO_READ_SIZE_ANY) {
        if (BUFFER_USED_SIZE(buffer) < encoding->max_bytes_per_codepoint)
            Parrot_io_buffer_fill(interp, buffer, handle, vtable);
        bytes_to_read = io_buffer_find_num_characters(interp, buffer,
                                handle, vtable, encoding, &bounds,
                                BUFFER_USED_SIZE(buffer));
        if (bytes_to_read != 0)
            io_read_chars_append_string(interp, s, handle, vtable, buffer, bytes_to_read);
        return s;
    }

    /* Otherwise, we have a specific number of characters we're trying to get.
       Loop until we read them all. */
    while (1) {
        bytes_to_read = io_buffer_find_num_characters(interp, buffer, handle,
                                        vtable, encoding, &bounds, char_length);

        /* Buffer is empty, so we're at EOF */
        if (bytes_to_read == 0)
            break;

        /* Append buffer to result */
        io_read_chars_append_string(interp, s, handle, vtable, buffer, bytes_to_read);
        total_bytes_read += bytes_to_read;

        if (((size_t)bounds.chars) == char_length)
            break;

        /* We weren't able to read so many characters at once. Count the ones
           we've already gotten and continue */
        char_length -= bounds.chars;
        PARROT_ASSERT(char_length > 0);

        /* Some types, like Socket, don't want to be read more than once in a
           single request because recv can hang waiting for data. In those
           cases, break out of the loop early. */
        if ((vtable->flags & PIO_VF_MULTI_READABLE) == 0 && buffer->raw_reads > raw_reads)
            break;
    }

    if (total_bytes_read == 0)
        vtable->set_eof(interp, handle, 1);

    return s;
}

/*

=item C<void io_read_chars_append_string(PARROT_INTERP, STRING * s, PMC *handle,
const IO_VTABLE *vtable, IO_BUFFER *buffer, size_t byte_length)>

Read characters out of the buffer and append them to the end of the existing
STRING. The STRING should be in "edit" mode and should not be referenced
by anything outside the IO subsystem. The byte_length should be accurate,
The buffer should be prepared and scanned ahead of time to ensure the
number of bytes to be read is the number of bytes actually available for
reading. The value in C<adv_length>, if larger than C<byte_length> is the
actual number of bytes to advance the buffer by (the difference adv_length -
byte_length are characters which are discarded).

=cut

*/

void
io_read_chars_append_string(PARROT_INTERP, ARGMOD(STRING * s),
        ARGMOD(PMC *handle), ARGIN(const IO_VTABLE *vtable),
        ARGMOD_NULLOK(IO_BUFFER *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_read_chars_append_string)
    const size_t alloc_size = s->bufused + byte_length;
    size_t bytes_read = 0;
    PARROT_ASSERT(s->encoding);
    PARROT_ASSERT(byte_length > 0);

    if (alloc_size > s->_buflen) {
        if (s->strstart)
            Parrot_gc_reallocate_string_storage(interp, s, alloc_size);
        else
            Parrot_gc_allocate_string_storage(interp, s, alloc_size);
    }

    if (buffer)
        bytes_read = Parrot_io_buffer_read_b(interp, buffer, handle, vtable,
                                       s->strstart + s->bufused, byte_length);
    else
        bytes_read = vtable->read_b(interp, handle, s->strstart + s->bufused,
                                    byte_length);

    PARROT_ASSERT(bytes_read <= byte_length);
    s->bufused += byte_length;
    vtable->adv_position(interp, handle, byte_length);
    STRING_scan(interp, s);
}

/*

=item C<STRING * io_readline_encoded_string(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, IO_BUFFER *buffer, const STR_VTABLE *encoding, STRING * rs)>

Read a line, up to and including the terminator character rs, from the
input handle

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_readline_encoded_string(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGIN(const IO_VTABLE *vtable), ARGMOD(IO_BUFFER *buffer),
        ARGIN_NULLOK(const STR_VTABLE *encoding), ARGIN(STRING * rs))
{
    ASSERT_ARGS(io_readline_encoded_string)
    STRING * const s = Parrot_gc_new_string_header(interp, 0);
    size_t total_bytes_read = 0;
    const size_t raw_reads = buffer->raw_reads;
    size_t available_bytes = BUFFER_USED_SIZE(buffer);
    const size_t delim_size = STRING_byte_length(rs);

    s->bufused  = 0;
    s->strlen   = 0;

    if (encoding == NULL)
        encoding = io_get_encoding(interp, handle, vtable, PIO_F_READ);

    if (available_bytes < delim_size || available_bytes < encoding->max_bytes_per_codepoint)
        available_bytes = Parrot_io_buffer_fill(interp, buffer, handle, vtable);

    s->encoding = encoding;

    while (1) {
        Parrot_String_Bounds bounds;
        INTVAL have_delim = 0;
        const size_t bytes_to_read = io_buffer_find_string_marker(interp,
                               buffer, handle, vtable, encoding, &bounds, rs, &have_delim);

        /* Buffer is empty, so we're probably at EOF. */
        if (bytes_to_read == 0)
            break;

        /* Append buffer to result */
        io_read_chars_append_string(interp, s, handle, vtable, buffer, bytes_to_read);
        total_bytes_read += bytes_to_read;

        if (have_delim)
            break;

        /* Some types, like Socket, don't want to be read more than once in a
           single request because recv can hang waiting for data. In those
           cases, break out of the loop early. */
        if ((vtable->flags & PIO_VF_MULTI_READABLE) == 0 && buffer->raw_reads > raw_reads)
            break;
        available_bytes -= bytes_to_read;
        if (available_bytes < delim_size || available_bytes < encoding->max_bytes_per_codepoint)
            available_bytes = Parrot_io_buffer_fill(interp, buffer, handle, vtable);
    }

    if (total_bytes_read == 0)
        vtable->set_eof(interp, handle, 1);

    return s;
}

/*

=item C<const STR_VTABLE * io_get_encoding(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, INTVAL flags)>

Get the encoding of C<handle>. If C<handle> doesn't have an encoding specified
pick one that this suitable for the operation described in C<flags>. If
C<flags> is PIO_F_WRITE, return a binary encoding for general-purpose writes.
If C<flags> is PIO_F_READ, return the platform default encoding.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const STR_VTABLE *
io_get_encoding(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(const IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_get_encoding)
    const STR_VTABLE * const encoding = vtable->get_encoding(interp, handle);
    if (encoding != NULL)
        return encoding;
    if (flags & PIO_F_WRITE)
        return Parrot_binary_encoding_ptr;
    if (flags & PIO_F_READ)
        return Parrot_default_encoding_ptr;
    return Parrot_default_encoding_ptr;
}

/*

=item C<void io_sync_buffers_for_read(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, IO_BUFFER *read_buffer, IO_BUFFER * write_buffer)>

Synchronize buffers for a read operation on a "rw" handle.  In order to read
data from the handle, we must first flush the data in the write buffer (if
any) and update the read pointer to the correct location.

=cut

*/

void
io_sync_buffers_for_read(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGIN(const IO_VTABLE *vtable), ARGMOD_NULLOK(IO_BUFFER *read_buffer),
        ARGMOD_NULLOK(IO_BUFFER * write_buffer))
{
    ASSERT_ARGS(io_sync_buffers_for_read)

    /* If we have a non-empty write buffer, we have to flush it first
       and advance the cursor before we attempt to read. Otherwise we'll be
       reading data from the buffer that has already been overwritten, from a
       position several bytes before where we're supposed to be. */
    if (write_buffer && !BUFFER_IS_EMPTY(write_buffer)) {
        const size_t bytes_written = Parrot_io_buffer_flush(interp, write_buffer,
                                        handle, vtable);
        PARROT_ASSERT(BUFFER_IS_EMPTY(write_buffer));
        Parrot_io_buffer_advance_position(interp, read_buffer, bytes_written);
    }
}

/*

=item C<void io_sync_buffers_for_write(PARROT_INTERP, PMC *handle, const
IO_VTABLE *vtable, IO_BUFFER *read_buffer, IO_BUFFER * write_buffer)>

Synchronize buffers for a write operation on a "rw" handle. In order to write
data to the handle we need to reset the on-disk pointer by calculating how
far ahead the read_buffer has moved and resetting the pointer to the correct
location using C<seek>.

=cut

*/

void
io_sync_buffers_for_write(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGIN(const IO_VTABLE *vtable), ARGMOD_NULLOK(IO_BUFFER *read_buffer),
        ARGMOD_NULLOK(IO_BUFFER * write_buffer))
{
    ASSERT_ARGS(io_sync_buffers_for_write)

    UNUSED(write_buffer);

    /* If we have a read buffer, the on-disk file position is ahead of the
       current cursor. We need to clear the read buffer and reset the on-disk
       position to match what we expect it to be, so the written data goes
       to the correct place */
    if (read_buffer && !BUFFER_IS_EMPTY(read_buffer)) {
        const size_t buffer_size = BUFFER_USED_SIZE(read_buffer);
        Parrot_io_buffer_clear(interp, read_buffer);
        vtable->seek(interp, handle, -buffer_size, SEEK_CUR);
    }
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
