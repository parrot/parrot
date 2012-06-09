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

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
IO_BUFFER *
Parrot_io_buffer_allocate(PARROT_INTERP, ARGMOD(PMC *owner), INTVAL flags,
        ARGIN_NULLOK(const STR_VTABLE *encoding), size_t init_size)
{
    ASSERT_ARGS(Parrot_io_buffer_allocate)
    IO_BUFFER * const buffer =
            (IO_BUFFER *)Parrot_gc_allocate_fixed_size_storage(interp,
                                                        sizeof (IO_BUFFER));
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

    buffer->flags = flags;
    return buffer;
}

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
        if (buffer)
            Parrot_io_buffer_resize(interp, buffer, length);
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
Parrot_io_buffer_free(PARROT_INTERP, ARGFREE(IO_BUFFER *buffer))
{
    ASSERT_ARGS(Parrot_io_buffer_free)
    if (buffer->buffer_size) {
        if (buffer->flags & PIO_BF_MALLOC)  {
            mem_sys_free(buffer->buffer_start);
        }
        else if(buffer->flags & PIO_BF_MMAP) {
            /* TODO */
        }
    }
    Parrot_gc_free_fixed_size_storage(interp, sizeof (IO_BUFFER), buffer);
}

size_t
Parrot_io_buffer_resize(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer), size_t new_size)
{
    ASSERT_ARGS(Parrot_io_buffer_resize)
    if (new_size < PIO_BUFFER_MIN_SIZE)
        new_size = PIO_BUFFER_MIN_SIZE;

    if (buffer->buffer_size == new_size)
        return new_size;

    /* Cannot shrink a buffer with data in it, because we do not ever want to
       lose data */
    if (!BUFFER_IS_EMPTY(buffer) && new_size < buffer->buffer_size)
        return buffer->buffer_size;

    buffer->buffer_ptr = mem_sys_realloc(buffer->buffer_ptr, new_size);
    buffer->buffer_size = new_size;
    return new_size;
}

void
Parrot_io_buffer_mark(SHIM_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
{
    if (!buffer)
        return;
    /*if (!PMC_IS_NULL(buffer->owner_pmc))
        Parrot_gc_mark_PMC_alive(interp, buffer->owner_pmc);*/
}

void
Parrot_io_buffer_clear(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
{
    ASSERT_ARGS(Parrot_io_buffer_clear)
    if (!buffer)
        return;
    buffer->buffer_start = buffer->buffer_ptr;
    buffer->buffer_end = buffer->buffer_ptr;
}

size_t
Parrot_io_buffer_read_b(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGIN(PMC *handle), ARGIN(IO_VTABLE *vtable), ARGOUT(char *s),
        size_t length)
{
    ASSERT_ARGS(Parrot_io_buffer_read_b)
    if (!buffer)
        return vtable->read_b(interp, handle, s, length);
    {
        size_t bytes_read = io_buffer_transfer_to_mem(interp, buffer,
                                                      s, length);
        length = length - bytes_read;

        /* If we still need more data than the buffer can hold, just read it
           directly. */
        if (length > buffer->buffer_size)
            bytes_read += vtable->read_b(interp, handle, s + bytes_read, length);

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

Transfer length bytes from the buffer to the char*s, removing those bytes
from the buffer. Return the number of bytes actually copied.

*/

static size_t
io_buffer_transfer_to_mem(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGOUT(char * s), size_t length)
{
    ASSERT_ARGS(io_buffer_transfer_to_mem)
    if (!buffer || BUFFER_IS_EMPTY(buffer))
        return 0;

    {
        size_t length_left = length;
        size_t used_length = BUFFER_USED_SIZE(buffer);
        size_t copy_length = used_length <= length ? used_length : length;

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
    if (!buffer)
        return;

    if (BUFFER_IS_EMPTY(buffer)) {
        Parrot_io_buffer_clear(interp, buffer);
        return;
    }

    if (!BUFFER_CAN_BE_NORMALIZED(buffer))
        return;

    {
        const size_t used_size = BUFFER_USED_SIZE(buffer);
        memmove(buffer->buffer_ptr, buffer->buffer_start, used_size);
        buffer->buffer_start = buffer->buffer_ptr;
        buffer->buffer_end = buffer->buffer_start + used_size;
    }
}

static INTVAL
io_buffer_requires_flush(SHIM_INTERP, ARGIN(IO_BUFFER *buffer),
        ARGIN(char * s), size_t length)
{
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

size_t
Parrot_io_buffer_write_b(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(IO_VTABLE *vtable), ARGIN(char *s),
        size_t length)
{
    ASSERT_ARGS(Parrot_io_buffer_write_b)
    if (!buffer)
        return vtable->write_b(interp, handle, s, length);

    else {
        size_t written = 0;
        size_t total_size = buffer->buffer_size;
        size_t used_size = BUFFER_USED_SIZE(buffer);
        size_t avail_size = BUFFER_AVAILABLE_SIZE(buffer);
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
            return vtable->write_b(interp, handle, s, length);
        }

        /* Else, we have more data than available space, but the buffer should
           be able to cover any overflow */
        Parrot_io_buffer_flush(interp, buffer, handle, vtable);
        io_buffer_add_bytes(interp, buffer, s, length);
        if (needs_flush)
            Parrot_io_buffer_flush(interp, buffer, handle, vtable);
        return length;
    }
}

/*

=item C<static void io_buffer_add_bytes(PARROT_INTERP, IO_BUFFER *buffer, char
*s, size_t length)>

Add the bytes to the buffer. Assume that the number of bytes to add is
less than or equal to the amount of available space for writing.

=cut

*/

static void
io_buffer_add_bytes(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer), ARGIN(char *s),
        size_t length)
{
    ASSERT_ARGS(io_buffer_add_bytes)
    memcpy(buffer->buffer_end, s, length);
    buffer->buffer_end += length;
}

size_t
Parrot_io_buffer_flush(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(IO_VTABLE *vtable))
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

UINTVAL
Parrot_io_buffer_peek(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(IO_VTABLE *vtable))
{
    ASSERT_ARGS(Parrot_io_buffer_peek)

    /* Current behavior only returns the first byte, not the first codepoint.
       Returning codepoint would make a lot more sense, but is going to be a
       lot more work */
    if (BUFFER_IS_EMPTY(buffer)) {
        const size_t size = Parrot_io_buffer_fill(interp, buffer, handle,
                                                  vtable);
        if (size == 0)
            return -1;
    }
    return (UINTVAL)buffer->buffer_start[0];
}

/*

=item C<size_t Parrot_io_buffer_fill(PARROT_INTERP, IO_BUFFER *buffer, PMC *
handle, IO_VTABLE *vtable)>

Reads data into the buffer, trying to fill if possible. Returns the total
number of bytes in the buffer.

=cut

*/


size_t
Parrot_io_buffer_fill(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer),
        ARGMOD(PMC * handle), ARGIN(IO_VTABLE *vtable))
{
    ASSERT_ARGS(Parrot_io_buffer_fill)
    if (!buffer)
        return 0;

    /* Normalize to make sure we have a maximum amount of free space */
    io_buffer_normalize(interp, buffer);
    {
        size_t available_size = BUFFER_AVAILABLE_SIZE(buffer);
        size_t read_bytes;
        if (available_size == 0)
            return BUFFER_USED_SIZE(buffer);
        read_bytes = vtable->read_b(interp, handle, buffer->buffer_end,
                                    available_size);
        buffer->buffer_end += read_bytes;
        return BUFFER_USED_SIZE(buffer);
    }
}

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
PMC *handle, IO_VTABLE *vtable, const STR_VTABLE *encoding, Parrot_String_Bounds
*bounds, INTVAL delim)>

Search the buffer for the given delimiter character or end-of-buffer,
whichever comes first. Return a count of the number of bytes to be
read, in addition to scan information in *bounds. Does not return an
amount of bytes to read which would create an incomplete codepoint

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
io_buffer_find_string_marker(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(IO_VTABLE *vtable),
        ARGIN(const STR_VTABLE *encoding), ARGMOD(Parrot_String_Bounds *bounds),
        INTVAL delim)
{
    ASSERT_ARGS(io_buffer_find_string_marker)
    INTVAL bytes_needed = 0;

    if (BUFFER_IS_EMPTY(buffer)) {
        size_t bytes_available = Parrot_io_buffer_fill(interp, buffer, handle,
                                                       vtable);
        if (bytes_available == 0)
            return 0;
    }

    bounds->bytes = BUFFER_USED_SIZE(buffer);
    bounds->chars = -1;
    bounds->delim = delim;

    /* Search the buffer. Return either when we find the delimiter or reach
       the end of the available buffer. partial_scan returns the number of
       bytes needed to complete the final codepoint (0 if we have read a
       complete codepoint and do not need any more to complete it). Lop those
       last few bytes off the end of the found sequence, so we only read
       complete codepoints out into the STRING. */
    bytes_needed = encoding->partial_scan(interp, buffer->buffer_start, bounds);
    return bounds->bytes - bytes_needed;
}

/*

=item C<size_t io_buffer_find_num_characters(PARROT_INTERP, IO_BUFFER *buffer,
PMC *handle, IO_VTABLE *vtable, const STR_VTABLE *encoding, Parrot_String_Bounds
*bounds, size_t num_chars)>

Attempt to read from the buffer the given number of characters in the
given encoding. Returns the number of bytes to be read from the buffer to
either get this number from the buffer or else get the entire contents of
the buffer and continue on a later read.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
io_buffer_find_num_characters(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(IO_VTABLE *vtable),
        ARGIN(const STR_VTABLE *encoding), ARGMOD(Parrot_String_Bounds *bounds),
        size_t num_chars)
{
    ASSERT_ARGS(io_buffer_find_num_characters)
    INTVAL bytes_needed = 0;

    if (BUFFER_IS_EMPTY(buffer)) {
        size_t bytes_available = Parrot_io_buffer_fill(interp, buffer, handle,
                                                       vtable);
        if (bytes_available == 0)
            return 0;
    }

    bounds->bytes = BUFFER_USED_SIZE(buffer);
    bounds->chars = num_chars;
    bounds->delim = -1;

    bytes_needed = encoding->partial_scan(interp, buffer->buffer_start, bounds);
    return bounds->bytes - bytes_needed;
}

PIOOFF_T
Parrot_io_buffer_seek(PARROT_INTERP, ARGMOD(IO_BUFFER *buffer),
        ARGMOD(PMC *handle), ARGIN(IO_VTABLE *vtable), PIOOFF_T offset,
        INTVAL w)
{
    ASSERT_ARGS(Parrot_io_buffer_seek)
    PIOOFF_T cur_pos = vtable->get_position(interp, handle);
    PIOOFF_T pos_diff;

    PARROT_ASSERT(w == SEEK_SET);

    if (cur_pos == offset)
        return;
    if (offset < cur_pos) {
        /* write buffers are flushed before seeking, so this is a read buffer.
           if we're not seeking to a position inside the buffer just clear it.
        */
        Parrot_io_buffer_clear(interp, buffer);
        return vtable->seek(interp, handle, offset, w);
    }
    pos_diff = offset - cur_pos;
    PARROT_ASSERT(pos_diff > 0);

    if (pos_diff > BUFFER_USED_SIZE(buffer)) {
        Parrot_io_buffer_clear(interp, buffer);
        return vtable->seek(interp, handle, offset, w);
    }

    /* If we're here, we can seek inside this buffer */
    buffer->buffer_start += (size_t)pos_diff;
    io_buffer_normalize(interp, buffer);
    return offset;
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
