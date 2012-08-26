/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/io/buffer.c - I/O buffering

=head1 DESCRIPTION

This file implements buffering logic for the IO subsystem. A buffer is a
chunk of memory that can be used to store data so fewer OS-level transactions
need to be performed.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_handle.h"

/* HEADERIZER HFILE: include/parrot/io.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void io_buffer_add_bytes(PARROT_INTERP,
    ARGMOD(IO_BUFFER *buffer),
    ARGIN(char *s),
    size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*buffer);

static void io_buffer_normalize(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*buffer);

static INTVAL io_buffer_requires_flush(PARROT_INTERP,
    ARGIN(IO_BUFFER *buffer),
    ARGIN(char * s),
    size_t length)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static size_t io_buffer_transfer_to_mem(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    ARGOUT(char * s),
    size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(* s);

#define ASSERT_ARGS_io_buffer_add_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_io_buffer_normalize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_io_buffer_requires_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_io_buffer_transfer_to_mem __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<IO_BUFFER * Parrot_io_buffer_allocate(PARROT_INTERP, PMC *owner, INTVAL
flags, const STR_VTABLE *encoding, size_t init_size)>

Allocate a new buffer for PMC C<owner> with the given flags and settings.

=item C<void Parrot_io_buffer_free(PARROT_INTERP, IO_BUFFER *buffer)>

Free the C<buffer> memory.

=cut

*/


PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
IO_BUFFER *
Parrot_io_buffer_allocate(PARROT_INTERP, ARGMOD(PMC *owner), INTVAL flags,
        ARGIN_NULLOK(const STR_VTABLE *encoding), size_t init_size)
{
    ASSERT_ARGS(Parrot_io_buffer_allocate)
    IO_BUFFER * const buffer =
            (IO_BUFFER *)Parrot_gc_allocate_fixed_size_storage(interp, sizeof (IO_BUFFER));
    buffer->encoding = encoding;
    if (init_size == BUFFER_SIZE_ANY) {
        if (flags & PIO_BF_LINEBUF)
            init_size = PIO_BUFFER_LINEBUF_SIZE;
        else
            init_size = PIO_BUFFER_MIN_SIZE;
    }

    buffer->buffer_size = init_size;
    if (init_size) {
        buffer->buffer_ptr = (char *)mem_sys_allocate(init_size);
        flags |= PIO_BF_MALLOC;
    }
    else
        flags &= ~PIO_BF_MALLOC;

    buffer->buffer_start = buffer->buffer_ptr;
    buffer->buffer_end = buffer->buffer_ptr;
    PARROT_ASSERT(BUFFER_IS_EMPTY(buffer));

    buffer->raw_reads = 0;

    buffer->flags = flags;
    return buffer;
}

void
Parrot_io_buffer_free(PARROT_INTERP, ARGFREE(IO_BUFFER *buffer))
{
    ASSERT_ARGS(Parrot_io_buffer_free)
    if (buffer->buffer_size) {
        if (buffer->flags & PIO_BF_MALLOC)  {
            mem_sys_free(buffer->buffer_start);
        }
        else if (buffer->flags & PIO_BF_MMAP) {
            /* TODO */
        }
    }
    Parrot_gc_free_fixed_size_storage(interp, sizeof (IO_BUFFER), buffer);
}


/*

=item C<void Parrot_io_buffer_add_to_handle(PARROT_INTERP, PMC *handle, INTVAL
idx, size_t length, INTVAL flags)>

Allocate a new C<IO_BUFFER*> and attach it to PMC C<handle> at position
C<idx>. Valid positions are C<IO_PTR_IDX_READ_BUFFER> and
C<IO_PTR_IDX_WRITE_BUFFER>. If the buffer already exists, resize it to match
the specifications.

=item C<void Parrot_io_buffer_remove_from_handle(PARROT_INTERP, PMC *handle,
INTVAL idx)>

Remove the buffer from C<handle> at position C<idx>. Valid positions are
C<IO_PTR_IDX_READ_BUFFER> and  C<IO_PTR_IDX_WRITE_BUFFER>.

=cut

*/

void
Parrot_io_buffer_add_to_handle(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL idx,
        size_t length, INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_buffer_add_to_handle)
    if (idx != IO_PTR_IDX_READ_BUFFER && idx != IO_PTR_IDX_WRITE_BUFFER)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Unknown buffer number %d", idx);
    {
        IO_BUFFER * buffer = (IO_BUFFER *)VTABLE_get_pointer_keyed_int(interp, handle, idx);
        if (buffer) {
            Parrot_io_buffer_resize(interp, buffer, length);
            PARROT_ASSERT(length == BUFFER_SIZE_ANY || buffer->buffer_size >= length);
        }
        else {
            buffer = Parrot_io_buffer_allocate(interp, handle, flags, NULL, length);
            PARROT_ASSERT(buffer);
            VTABLE_set_pointer_keyed_int(interp, handle, idx, buffer);
        }
        if (flags != BUFFER_FLAGS_ANY)
            buffer->flags = flags;
    }
}

void
Parrot_io_buffer_remove_from_handle(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL idx)
{
    ASSERT_ARGS(Parrot_io_buffer_remove_from_handle)
    if (idx != IO_PTR_IDX_READ_BUFFER && idx != IO_PTR_IDX_WRITE_BUFFER)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Unknown buffer number %d", idx);
    {
        IO_BUFFER * const buffer = (IO_BUFFER *)VTABLE_get_pointer_keyed_int(interp, handle, idx);
        if (!buffer)
            return;
        /* TODO: Decrease reference count, only free it if the refcount is
           zero */
        Parrot_io_buffer_free(interp, buffer);
        VTABLE_set_pointer_keyed_int(interp, handle, idx, NULL);
    }
}

/*

=item C<size_t Parrot_io_buffer_resize(PARROT_INTERP, IO_BUFFER *buffer, size_t
new_size)>

Resize the C<buffer> to be able to accomodate the C<new_size>. The buffer may
grow but probably will not shrink to avoid data loss. Return the new size of
the buffer.

=cut

*/

size_t
Parrot_io_buffer_resize(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer), size_t new_size)
{
    ASSERT_ARGS(Parrot_io_buffer_resize)
    if (new_size == BUFFER_SIZE_ANY)
        return buffer->buffer_size;

    if (new_size < PIO_BUFFER_MIN_SIZE)
        new_size = PIO_BUFFER_MIN_SIZE;

    if (buffer->buffer_size >= new_size)
        return new_size;

    buffer->buffer_ptr = (char *)mem_sys_realloc(buffer->buffer_ptr, new_size);
    buffer->buffer_size = new_size;
    return new_size;
}

/*

=item C<void Parrot_io_buffer_mark(PARROT_INTERP, IO_BUFFER *buffer)>

Mark any GCable data attached to the buffer, if any.

=cut

*/

void
Parrot_io_buffer_mark(SHIM_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
{
    ASSERT_ARGS(Parrot_io_buffer_mark)
    if (!buffer)
        return;
    /*if (!PMC_IS_NULL(buffer->owner_pmc))
        Parrot_gc_mark_PMC_alive(interp, buffer->owner_pmc);*/
}

/*

=item C<void Parrot_io_buffer_clear(PARROT_INTERP, IO_BUFFER *buffer)>

Clear the buffer, erasing all data and normalizing all pointers.

=cut

*/

void
Parrot_io_buffer_clear(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
{
    ASSERT_ARGS(Parrot_io_buffer_clear)
    if (!buffer)
        return;
    buffer->buffer_start = buffer->buffer_ptr;
    buffer->buffer_end = buffer->buffer_ptr;
    BUFFER_ASSERT_SANITY(buffer);
}

/*

=item C<size_t Parrot_io_buffer_read_b(PARROT_INTERP, IO_BUFFER *buffer, PMC
*handle, const IO_VTABLE *vtable, char *s, size_t length)>

Attempt to read C<length> bytes from C<handle>, possibly using C<buffer>. If
C<buffer> is null, read from C<handle> directly. Otherwise, attempt to read
data out of the buffer and fill it up again. Data is read into the chunk of
memory pointed to by C<s>. The number of bytes actually read is returned.

=cut

*/

size_t
Parrot_io_buffer_read_b(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGIN(PMC *handle), ARGIN(const IO_VTABLE *vtable), ARGOUT(char *s),
        size_t length)
{
    ASSERT_ARGS(Parrot_io_buffer_read_b)
    if (!buffer)
        return vtable->read_b(interp, handle, s, length);
    {
        size_t bytes_read = io_buffer_transfer_to_mem(interp, buffer, s, length);
        PARROT_ASSERT(bytes_read <= length);

        PARROT_ASSERT(length >= bytes_read);
        length = length - bytes_read;

        /* If we still need more data than the buffer can hold, just read it
           directly. */
        if (length > buffer->buffer_size) {
            bytes_read += vtable->read_b(interp, handle, s + bytes_read, length);
            buffer->raw_reads++;
        }

        /* Else, if we need to read an amount that the buffer can handle, fill
           the buffer. */
        else if (length) {
            Parrot_io_buffer_fill(interp, buffer, handle, vtable);
            bytes_read += io_buffer_transfer_to_mem(interp, buffer,
                                                    s + bytes_read, length);
        }

        return bytes_read;
    }
}

/*

=item C<static size_t io_buffer_transfer_to_mem(PARROT_INTERP, IO_BUFFER
*buffer, char * s, size_t length)>

Transfer C<length> bytes from the C<buffer> to the memory chunk pointed to by
C<s>, removing those bytes from the buffer. Return the number of bytes
actually copied.

=cut

*/

static size_t
io_buffer_transfer_to_mem(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGOUT(char * s), size_t length)
{
    ASSERT_ARGS(io_buffer_transfer_to_mem)
    if (!buffer || BUFFER_IS_EMPTY(buffer))
        return 0;

    PARROT_ASSERT(length > 0);

    {
        const size_t length_left = length == PIO_READ_SIZE_ANY ?
                                             BUFFER_USED_SIZE(buffer) : length;
        const size_t used_length = BUFFER_USED_SIZE(buffer);
        const size_t copy_length = used_length <= length ? used_length : length;

        PARROT_ASSERT(copy_length <= length);

        memcpy(s, buffer->buffer_start, copy_length);
        buffer->buffer_start += copy_length;
        io_buffer_normalize(interp, buffer);
        return copy_length;
    }
}

/*

=item C<static void io_buffer_normalize(PARROT_INTERP, IO_BUFFER *buffer)>

Attempt to normalize the buffer. If we can, move data to the front of the
buffer so we have the maximum amount of contiguous free space

=cut

*/

static void
io_buffer_normalize(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
{
    ASSERT_ARGS(io_buffer_normalize)
    /* BUFFER_DBG_PRINT(buffer); */
    BUFFER_ASSERT_SANITY(buffer);

    if (!buffer)
        return;

    if (BUFFER_IS_EMPTY(buffer)) {
        Parrot_io_buffer_clear(interp, buffer);
        return;
    }

    if (BUFFER_CAN_BE_NORMALIZED(buffer))
    {
        const size_t used_size = BUFFER_USED_SIZE(buffer);

        /* Make sure that we need to normalize, and that the memory regions
           are non-overlapping. */
        PARROT_ASSERT(used_size > 0);
        PARROT_ASSERT(buffer->buffer_start >= (buffer->buffer_ptr + used_size));

        /* Copy the data */
        memmove(buffer->buffer_ptr, buffer->buffer_start, used_size);
        buffer->buffer_start = buffer->buffer_ptr;
        buffer->buffer_end = buffer->buffer_start + used_size;
        BUFFER_ASSERT_SANITY(buffer);

        /* Assert that we have the same amount of data in the buffer */
        PARROT_ASSERT(used_size == BUFFER_USED_SIZE(buffer));
    }
}

/*

=item C<static INTVAL io_buffer_requires_flush(PARROT_INTERP, IO_BUFFER *buffer,
char * s, size_t length)>

HACK. Determine if the buffer needs a special flush. This is only required if
the buffer is marked as C<PIO_BF_LINEBUF> and if the input sequence contains
a literal newline '\n'. This is for backwards compatibility with the old
system and will probably be deleted soon. Return C<1> if the buffer needs to
be flushed, C<0> otherwise.

=cut

*/

static INTVAL
io_buffer_requires_flush(SHIM_INTERP, ARGIN(IO_BUFFER *buffer),
        ARGIN(char * s), size_t length)
{
    ASSERT_ARGS(io_buffer_requires_flush)
    /* Something of an ugly hack borrowed from the old system. If we're in
       line buffered mode we need to flush more often. Flush when we see a
       newline character. */
    if (buffer->flags & PIO_BF_LINEBUF) {
        size_t i;
        for (i = 0; i < length; i++) {
            if (s[i] == '\n')
                return 1;
        }
    }
    return 0;
}

/*

=item C<size_t Parrot_io_buffer_write_b(PARROT_INTERP, IO_BUFFER *buffer, PMC *
handle, const IO_VTABLE *vtable, char *s, size_t length)>

Write C<length> bytes from C<s> into the C<buffer>. If the buffer fills or
needs to be flushed, the data will be written through to C<handle>. If
C<buffer> is null, data is written directly to C<handle>. Return the number of
bytes added, probably C<length>.

=cut

*/

size_t
Parrot_io_buffer_write_b(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(const IO_VTABLE *vtable), ARGIN(char *s),
        size_t length)
{
    ASSERT_ARGS(Parrot_io_buffer_write_b)
    if (!buffer)
        return vtable->write_b(interp, handle, s, length);

    if (!length)
        return 0;

    else {
        size_t written = 0;
        const size_t total_size  = buffer->buffer_size;
        const size_t used_size   = BUFFER_USED_SIZE(buffer);
        const size_t avail_size  = BUFFER_FREE_END_SPACE(buffer);
        const INTVAL needs_flush = io_buffer_requires_flush(interp, buffer, s, length);

        /* If the data fits in the buffer, copy it there and move on. */
        if (length <= avail_size) {
            io_buffer_add_bytes(interp, buffer, s, length);
            if (needs_flush)
                Parrot_io_buffer_flush(interp, buffer, handle, vtable);
            return length;
        }

        /* If the total data to write is larger than the buffer, flush and
           write directly through to the handle */
        if (length > total_size) {
            Parrot_io_buffer_flush(interp, buffer, handle, vtable);
            PARROT_ASSERT(BUFFER_IS_EMPTY(buffer));
            return vtable->write_b(interp, handle, s, length);
        }

        /* Else, we have more data than available space, but the buffer should
           be able to cover any overflow. Flush then add the data to the
           newly empty buffer. */
        Parrot_io_buffer_flush(interp, buffer, handle, vtable);
        io_buffer_add_bytes(interp, buffer, s, length);
        PARROT_ASSERT(BUFFER_USED_SIZE(buffer) == length);
        if (needs_flush)
            Parrot_io_buffer_flush(interp, buffer, handle, vtable);
        return length;
    }
}

/*

=item C<static void io_buffer_add_bytes(PARROT_INTERP, IO_BUFFER *buffer, char
*s, size_t length)>

Add C<length> bytes from C<s> to the C<buffer>. Assume that the number of
bytes to add is less than or equal to the amount of available space for
writing.

=cut

*/

static void
io_buffer_add_bytes(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer), ARGIN(char *s),
        size_t length)
{
    ASSERT_ARGS(io_buffer_add_bytes)

    BUFFER_ASSERT_SANITY(buffer);

    /* Assert that we aren't going to over-fill the buffer, and then fill it. */
    PARROT_ASSERT(BUFFER_USED_SIZE(buffer) + length <= buffer->buffer_size);
    memcpy(buffer->buffer_end, s, length);
    buffer->buffer_end += length;
    PARROT_ASSERT(BUFFER_USED_SIZE(buffer) <= buffer->buffer_size);
    BUFFER_ASSERT_SANITY(buffer);
}

/*

=item C<size_t Parrot_io_buffer_flush(PARROT_INTERP, IO_BUFFER *buffer, PMC *
handle, const IO_VTABLE *vtable)>

Flush the buffer, writing all data out to C<handle>. If the buffer is null
or empty, do nothing. Return the number of bytes written through to the
handle.

=cut

*/

size_t
Parrot_io_buffer_flush(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(const IO_VTABLE *vtable))
{
    ASSERT_ARGS(Parrot_io_buffer_flush)
    size_t bytes_written = 0;
    if (buffer && !BUFFER_IS_EMPTY(buffer)) {
        size_t used_length = BUFFER_USED_SIZE(buffer);
        bytes_written += vtable->write_b(interp, handle, (char *)buffer->buffer_start,
                                         BUFFER_USED_SIZE(buffer));
        Parrot_io_buffer_clear(interp, buffer);
    }
    return bytes_written;
}

/*

=item C<UINTVAL Parrot_io_buffer_peek(PARROT_INTERP, IO_BUFFER *buffer, PMC *
handle, const IO_VTABLE *vtable)>

Peek the next byte from the buffer. Notice that this is the next byte, not
the next codepoint. This is to preserve backwards compatibility with the old
system. An updated peek operation will try to read the first codepoint
instead.

=cut

*/

UINTVAL
Parrot_io_buffer_peek(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(const IO_VTABLE *vtable))
{
    ASSERT_ARGS(Parrot_io_buffer_peek)

    /* Current behavior only returns the first byte, not the first codepoint.
       Returning codepoint would make a lot more sense, but that's a change
       for later. */
    if (BUFFER_IS_EMPTY(buffer)) {
        const size_t size = Parrot_io_buffer_fill(interp, buffer, handle, vtable);
        if (size == 0)
            return -1;
    }
    PARROT_ASSERT(!BUFFER_IS_EMPTY(buffer));
    return (UINTVAL)buffer->buffer_start[0];
}

/*

=item C<size_t Parrot_io_buffer_fill(PARROT_INTERP, IO_BUFFER *buffer, PMC *
handle, const IO_VTABLE *vtable)>

Reads data into the buffer, trying to fill if possible. Returns the total
number of bytes in the buffer.

=cut

*/

size_t
Parrot_io_buffer_fill(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(const IO_VTABLE *vtable))
{
    ASSERT_ARGS(Parrot_io_buffer_fill)
    if (!buffer)
        return 0;

    /* Normalize to make sure we have a maximum amount of free space */
    io_buffer_normalize(interp, buffer);
    {
        const size_t available_size = BUFFER_FREE_END_SPACE(buffer);
        size_t read_bytes;
        if (available_size == 0)
            return BUFFER_USED_SIZE(buffer);
        read_bytes = vtable->read_b(interp, handle, buffer->buffer_end,
                                    available_size);
        buffer->raw_reads++;
        buffer->buffer_end += read_bytes;
        BUFFER_ASSERT_SANITY(buffer);
        return BUFFER_USED_SIZE(buffer);
    }
}

/*

=item C<size_t Parrot_io_buffer_content_size(PARROT_INTERP, IO_BUFFER *buffer)>

Return the number of bytes contained in C<buffer>.

=item C<void Parrot_io_buffer_advance_position(PARROT_INTERP, IO_BUFFER *buffer,
size_t len)>

Advance the buffer content pointer by C<len> bytes. This is required in
certain cases, such as a "rw" handle. When we write bytes to the handle, we
need to advance the read buffer pointer by the same number of bytes. If the
Buffer is null or empty, do nothing. If the buffer has less data than the
number of bytes to advance, clear and reset the buffer.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
Parrot_io_buffer_content_size(SHIM_INTERP, ARGIN(IO_BUFFER *buffer))
{
    ASSERT_ARGS(Parrot_io_buffer_content_size)
    return BUFFER_USED_SIZE(buffer);
}

void
Parrot_io_buffer_advance_position(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer), size_t len)
{
    ASSERT_ARGS(Parrot_io_buffer_advance_position)
    if (!buffer || BUFFER_IS_EMPTY(buffer))
        return;
    if (BUFFER_USED_SIZE(buffer) <= len) {
        Parrot_io_buffer_clear(interp, buffer);
        return;
    }
    buffer->buffer_start += len;
    io_buffer_normalize(interp, buffer);
}

/*

=item C<size_t io_buffer_find_string_marker(PARROT_INTERP, IO_BUFFER *buffer,
PMC *handle, const IO_VTABLE *vtable, const STR_VTABLE *encoding,
Parrot_String_Bounds *bounds, STRING * delim, INTVAL *have_delim)>

Search the buffer for the given delimiter substr or end-of-buffer,
whichever comes first. Return a count of the number of bytes to be
read, in addition to scan information in *bounds. Does not return an
amount of bytes to read which would create an incomplete codepoint.

The return value is the number of bytes to read for the string contents. The
pointer C<*chars_total> returns the total number of bytes to remove from the
buffer

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
io_buffer_find_string_marker(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(const IO_VTABLE *vtable),
        ARGIN(const STR_VTABLE *encoding), ARGMOD(Parrot_String_Bounds *bounds),
        ARGIN(STRING * delim), ARGOUT(INTVAL *have_delim))
{
    ASSERT_ARGS(io_buffer_find_string_marker)
    INTVAL bytes_needed = 0;

    const size_t delim_bytelen = STRING_byte_length(delim);
    const size_t bytes_available = BUFFER_USED_SIZE(buffer);

    *have_delim = 0;

    if (bytes_available == 0)
        return 0;

    bounds->bytes = bytes_available;
    bounds->chars = -1;
    bounds->delim = -1;

    /* Partial scan the buffer to get information about bounds. */
    bytes_needed = encoding->partial_scan(interp, buffer->buffer_start, bounds);
    if (bounds->bytes > 0) {
        /* Wrap the buffer up into a temporary STRING header. Use this to do
           string search to try and find the delimiter. If we do not find it,
           we might have part of the delimiter at the end of the buffer, so we
           can only safely read out part of it. */
        INTVAL delim_idx;
        STRING str;

        str._bufstart = buffer->buffer_start;
        str.strstart = buffer->buffer_start;
        str._buflen = bounds->bytes;
        str.bufused = bounds->bytes;
        str.strlen = bounds->chars;
        str.hashval = 0;
        str.encoding = encoding;

        /* If we've found the delimiter, return the number of bytes up to and
           including it. */
        delim_idx = STRING_index(interp, &str, delim, 0);
        if (delim_idx >= 0) {
            bounds->chars = delim_idx;
            bounds->delim = -1;
            encoding->partial_scan(interp, buffer->buffer_start, bounds);

            *have_delim = 1;

            return bounds->bytes + delim_bytelen;
        }

        /* If we haven't found the delimiter, we MIGHT have part of it. First,
           check a few simplifying cases before we do anything else.

           If the delimiter is exactly one byte, we know we don't have it so
           we can just return everything. This is a small optimization for the
           common case where the delimiter is "\n" */
        if (delim_bytelen == 1)
            return bounds->bytes;

        /* If the buffer did not fill completely, we can assume there's nothing
           left for us to read because we tried to fill before we started this
           loop. If so, just return all the bytes in the buffer. If we've hit
           EOF and don't have the terminator, we'll never have it, so just
           return everything also. */
        if (BUFFER_FREE_END_SPACE(buffer) > 0 || vtable->is_eof(interp, handle))
            return bounds->bytes;

        /* If the delimiter is multiple bytes, we might have part of it. We need
           to leave that many bytes in the buffer at the end so that a
           subsequent fill+search will get the whole delimiter. Because we've
           required that the delimiter can be, at most, less than half the size
           of the buffer (which is obnoxiously large considering most delimiters
           will be either "\n" or "\r\n") we know that the buffer will be
           normalized and the remainder of the terminator will be found with the
           next fill.

           If the delimiter is multiple bytes, and we don't have enough bytes
           in the buffer to guarantee we can return bytes without eating into
           a partial delimiter, we return 0. */
        if (bytes_available > delim_bytelen) {
            const size_t max_readable_bytes = (bytes_available / 2) - delim_bytelen;
            bounds->bytes = max_readable_bytes;
            bounds->chars = -1;
            bounds->delim = -1;
            encoding->partial_scan(interp, buffer->buffer_start, bounds);

            return bounds->bytes;
        }
    }
    /* For whatever reason, we have nothing to return. This may be because there
       is no text in the buffer, or because we have a multi-byte delimiter but
       we don't have enough bytes in the buffer to match it. */
    return 0;
}

/*

=item C<size_t io_buffer_find_num_characters(PARROT_INTERP, IO_BUFFER *buffer,
PMC *handle, const IO_VTABLE *vtable, const STR_VTABLE *encoding,
Parrot_String_Bounds *bounds, size_t num_chars)>

Attempt to read from the buffer the given number of characters in the
given encoding. Returns the number of bytes to be read from the buffer to
either get this number from the buffer or else get the entire contents of
the buffer and continue on a later read.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
io_buffer_find_num_characters(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(const IO_VTABLE *vtable),
        ARGIN(const STR_VTABLE *encoding), ARGMOD(Parrot_String_Bounds *bounds),
        size_t num_chars)
{
    ASSERT_ARGS(io_buffer_find_num_characters)
    INTVAL bytes_needed = 0;

    if (BUFFER_IS_EMPTY(buffer)) {
        const size_t bytes_available = Parrot_io_buffer_fill(interp, buffer,
                                                             handle, vtable);
        if (bytes_available == 0)
            return 0;
    }

    bounds->bytes = BUFFER_USED_SIZE(buffer);
    bounds->chars = num_chars;
    bounds->delim = -1;

    bytes_needed = encoding->partial_scan(interp, buffer->buffer_start, bounds);
    return bounds->bytes;
}

/*

=item C<PIOOFF_T Parrot_io_buffer_seek(PARROT_INTERP, IO_BUFFER *buffer, PMC
*handle, const IO_VTABLE *vtable, PIOOFF_T offset, INTVAL w)>

Perform a seek in the buffer. C<w> must be C<SEEK_SET>, currently. This must
be a read buffer. If the buffer contains enough data to satisfy the seek,
adjust the pointer accordingly and continue. Otherwise, clear the buffer and
perform a seek on the underlying handle.

=cut

*/

PIOOFF_T
Parrot_io_buffer_seek(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(const IO_VTABLE *vtable), PIOOFF_T offset,
        INTVAL w)
{
    ASSERT_ARGS(Parrot_io_buffer_seek)
    PIOOFF_T cur_pos = vtable->get_position(interp, handle);
    PIOOFF_T pos_diff;

    PARROT_ASSERT(w == SEEK_SET);

    if (cur_pos == offset)
        return offset;
    if (offset < cur_pos) {
        /* write buffers are flushed before seeking, so this is a read buffer.
           if we're not seeking to a position inside the buffer just clear it.
        */
        Parrot_io_buffer_clear(interp, buffer);
        return vtable->seek(interp, handle, offset, w);
    }
    pos_diff = offset - cur_pos;
    PARROT_ASSERT(pos_diff > 0);

    if ((size_t)pos_diff > BUFFER_USED_SIZE(buffer)) {
        Parrot_io_buffer_clear(interp, buffer);
        return vtable->seek(interp, handle, offset, w);
    }

    /* If we're here, we can seek inside this buffer */
    buffer->buffer_start += (size_t)pos_diff;
    io_buffer_normalize(interp, buffer);
    return offset;
}

/*

=item C<PIOOFF_T Parrot_io_buffer_tell(PARROT_INTERP, IO_BUFFER *buffer, PMC
*handle, const IO_VTABLE * vtable)>

Find the current position of the file, taking into account the read-ahead
data in the read buffer. If the handle has a write buffer, it is assumed
that the write buffer has been flushed prior to calling this routine.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_buffer_tell(PARROT_INTERP, ARGIN_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(const IO_VTABLE * vtable))
{
    ASSERT_ARGS(Parrot_io_buffer_tell)
    if (!buffer || BUFFER_IS_EMPTY(buffer))
        return vtable->tell(interp, handle);
    {
        const size_t used_size = BUFFER_USED_SIZE(buffer);
        return vtable->tell(interp, handle) - used_size;
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
