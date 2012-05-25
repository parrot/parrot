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

static INTVAL io_is_end_of_line(ARGIN(const char *c))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_io_is_end_of_line __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(c))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define BUFFER_IS_EMPTY(b) (b->buffer_start == b->buffer_end)
#define BUFFER_IS_FULL(b) (b->buffer_start == b->buffer_end + 1 || b->buffer_start == b->buffer_ptr && (size_t)(b->buffer_end - b->buffer_start) == b->buffer_size);

IO_BUFFER *
Parrot_io_buffer_allocate(PARROT_INTERP, PMC *handle, INTVAL flags, STR_VTABLE encoding, size_t init_size)
{
    IO_BUFFER * const buffer = (IO_BUFFER *)Parrot_gc_allocate_fixed_size_storage(interp, sizeof (IO_BUFFER));
    buffer->flags = flags;
    buffer->owner_handle = handle;
    buffer->encoding = encoding;
    buffer->buffer_size = init_size;
    if (init_size) {
        buffer->buffer_ptr = (char *)mem_sys_allocate(init_size);
        buffer->buffer_start = buffer->buffer_start;
        buffer->buffer_end = buffer->buffer_start;
    }
}

void
Parrot_io_buffer_free(PARROT_INTERP, IO_BUFFER *buffer)
{
    if (buffer->init_size) {
        if (/* mmapped */)  {
        }
        else {
            mem_sys_free(buffer->buffer_start);
        }
    }
    Parrot_gc_free_fixed_size_storage(interp, sizeof (IO_BUFFER), buffer);
}

void
Parrot_io_buffer_clear(PARROT_INTERP, IO_BUFFER *buffer)
{
    buffer->buffer_start = buffer->buffer_start;
    buffer->buffer_end = buffer->buffer_start;
}

size_t
Parrot_io_buffer_read_b(PARROT_INTERP, IO_BUFFER *buffer, PMC *handle, IO_VTABLE *vtable, char *s, size_t length)
{
    if (!buffer)
        return vtable->read_b(interp, handle, s, length);
    size_t size = Parrot_io_buffer_content_size(interp, buffer);
    size_t read;
    if (size >= length) {
        Parrot_io_buffer_transfer_to_mem(interp, buffer, s, length);
        return length;
    }
    Parrot_io_buffer_transfer_to_mem(interp, buffer, s, length);
    read = vtable->read_b(interp, handle, s + size, length - size);
    return read + size;
}

STRING *
Parrot_io_buffer_readline_s(PARROT_INTERP, IO_BUFFER *buffer, PMC *handle, IO_VTABLE *vtable, INTVAL terminator)
{
    ASSERT_ARGS(Parrot_io_buffer_readline_s)
    // TODO: This!
}

// Transfer length bytes from the buffer to the char*s, removing those bytes
// from the buffer. Return the number of bytes actually copied.
size_t
Parrot_io_buffer_transfer_to_mem(PARROT_INTERP, IO_BUFFER *buffer, char * s, size_t length)
{
    if (BUFFER_IS_EMPTY(buffer))
        return 0;

    size_t length_left = length;
    if (buffer->buffer_end < buffer->buffer_start) {
        size_t size = buffer->buffer_size - (buffer->buffer_ptr - buffer->buffer_size);
        if (size > length_left)
            size = length_left;
        memcpy(s, buffer->buffer_start, size);

        buffer->buffer_start += size;
        if (buffer->buffer_start >= buffer->buffer_ptr + buffer->buffer_size)
            buffer->buffer_start = buffer->buffer_ptr;

        length_left -= size;
    }
    if (length_left && buffer->buffer_end > buffer->buffer_start) {
        ptrdiff_t diff = buffer->buffer_end - buffer->buffer_start;
        size_t size = (size_t) diff;
        if (size > length_left)
            size = length_left;

        memcpy(s, buffer->buffer_start, length_left);
        buffer->buffer_start += length;
        if (buffer->buffer_start >= buffer->buffer_ptr + buffer->buffer_size)
            buffer->buffer_start = buffer->buffer_ptr;

        length_left -= size;
    }
    if (BUFFER_IS_EMPTY(buffer))
        Parrot_io_buffer_clear(interp, buffer);

    return length - length_left;
}

size_t
Parrot_io_buffer_write_b(PARROT_INTERP, IO_BUFFER *buffer, PMC * handle, IO_VTABLE *vtable, char *s, size_t length)
{
    if (!buffer)
        return vtable->write_b(interp, handle, buffer, length);

    else {
        size_t written = 0;
        size_t total_size = buffer->buffer_size;
        size_t used_size = Parrot_io_buffer_content_size(interp, buffer);
        if (length > total_size || length + used_size > total_size) {
            written = Parrot_io_buffer_flush(interp, buffer, handle, vtable, 0);
            written += vtable->write_b(interp, handle, s, length);
            return written;
        }
        Parrot_io_buffer_add_bytes(interp, buffer, s, length);
        return 0;
    }
}

Parrot_io_buffer_add_bytes(PARROT_INTERP, IO_BUFFER *buffer, char *s, size_t length)
{
    /* ... */
}

size_t
Parrot_io_buffer_flush(PARROT_INTERP, IO_BUFFER *buffer, PMC * handle, IO_VTABLE *vtable, INTVAL autoclose)
{
    if (!buffer || BUFFER_IS_EMPTY(buffer))
        return vtable->flush(interp, handle, autoclose);
    size_t bytes_written = 0;
    if (buffer->buffer_start < buffer->buffer_end) {
        ptrdiff_t size = buffer->buffer_end - buffer->buffer_start;
        vtable->write_b(interp, handle, (char *)buffer->start, (size_t)size);
    }
    else {
        size_t size = buffer->buffer_size - (size_t)(buffer->buffer_start - buffer->buffer_ptr);
        vtable->write_b(interp, handle, (char *)buffer->start, (size_t)size);
        size = (size_t)(buffer->buffer_end - buffer->buffer_ptr);
        vtable->write_b(interp, handle, (char *)buffer->ptr, (size_t)size);
    }
    buffer->buffer_start = buffer->buffer_start;
    buffer->buffer_end = buffer->buffer_start;
    return bytes_written;
}

UINTVAL
Parrot_io_buffer_peek(PARROT_INTERP, IO_BUFFER *buffer, PMC * handle, IO_VTABLE *vtable)
{
    if (!buffer)
        return vtable->peek_b(interp, handle);
    /* Current behavior only returns the first byte, not the first codepoint.
       Returning codepoint would make a lot more sense, but is going to be a
       lot more work */

    if (BUFFER_IS_EMPTY(buffer)) {
        size_t size = Parrot_io_buffer_fill(interp, buffer, handle, vtable);
        if (size == 0)
            return -1;
    }
    return (UINTVAL)buffer->buffer_start[0];

    /*
    const UINTVAL bytes_per_codepoint = buffer->encoding->max_bytes_per_codepoint;
    size_t size = Parrot_io_buffer_content_size(interp, buffer);
    if (size < (size_t)bytes_per_codepoint) {
        size = Parrot_io_buffer_fill(interp, buffer, handle, vtable);
        if (size == 0)
            return -1;
    }
    Parrot_String_Bounds bounds = { bytes_per_codepoint, -1, -1 };
    // TODO: Need to normalize. end-of-buffer - buffer_start may be less than bytes_per_codepoint
    buffer->encoding->partial_scan(interp, buffer->buffer_start, &bounds);
    */
}

// Reads data into the buffer, trying to fill if possible. Returns the total
// number of bytes in the buffer.
size_t
Parrot_io_buffer_fill(PARROT_INTERP, IO_BUFFER *buffer, PMC * handle, IO_VTABLE *vtable)
{
    if (BUFFER_IS_FULL(buffer)) {
    }
    else if (buffer->buffer_end < buffer->buffer_start) {
        ptrdiff_t size = buffer->buffer_start - buffer->buffer_end - 1;
        size_t read = vtable->read_b(interp, handle, buffer->buffer_start, (size_t)size);
        buffer->buffer_end += read;
        return Parrot_io_buffer_content_size(interp, buffer);
    }
    else {
        ptrdiff_t size = buffer->buffer_size - (buffer->buffer_end);
        size_t read = 0;
        if (size)
            read += vtable->read_b(interp, handle, buffer->buffer_start, (size_t)size);
    }
    return Parrot_io_buffer_content_size(interp, buffer);
}

size_t
Parrot_io_buffer_content_size(PARROT_INTERP, IO_BUFFER *buffer)
{
    if (BUFFER_IS_EMPTY(buffer))
        return 0;
    if (BUFFER_IS_FULL(buffer))
        return buffer->buffer_size;
    if (buffer->buffer_start < buffer->buffer_end)
        return (size_t)(buffer->buffer_end - buffer->buffer_start);
    return buffer->buffer_size - (buffer->buffer_start - buffer->buffer_end);
}

/* ROUTINES TO EITHER BE CONVERTED, SALVAGED OR CANNIBALIZED
    These routines are the parts of the old system that are worth keeping,
    for now. We need to up-convert these to the new architecture.
*/

/*

=item C<INTVAL Parrot_io_init_buffer(PARROT_INTERP)>

Initialize buffering on STDOUT and STDIN.

=cut

*/

INTVAL
Parrot_io_init_buffer(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_init_buffer)
    if (Parrot_io_STDOUT(interp))
        Parrot_io_setlinebuf(interp, Parrot_io_STDOUT(interp));

    if (Parrot_io_STDIN(interp))
        Parrot_io_setbuf(interp, Parrot_io_STDIN(interp), PIO_UNBOUND);

    return 0;
}

/*

=item C<void Parrot_io_setbuf(PARROT_INTERP, PMC *filehandle, size_t bufsize)>

Set the buffering mode for the filehandle.

=cut

*/

void
Parrot_io_setbuf(PARROT_INTERP, ARGMOD(PMC *filehandle), size_t bufsize)
{
    ASSERT_ARGS(Parrot_io_setbuf)
    INTVAL filehandle_flags = Parrot_io_get_flags(interp, filehandle);
    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    unsigned char *buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
    unsigned char *buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    size_t         buffer_size;

    /* If there is already a buffer, make sure we flush before modifying it. */
    if (buffer_start)
        Parrot_io_flush_buffer(interp, filehandle);

    /* Choose an appropriate buffer size for caller */
    switch (bufsize) {
      case 0:
        Parrot_io_set_buffer_size(interp, filehandle, 0);
        break;
      case PIO_UNBOUND:
        Parrot_io_set_buffer_size(interp, filehandle,
                    PIO_GETBLKSIZE(Parrot_io_get_os_handle(interp, filehandle)));
        break;
      default:
        Parrot_io_set_buffer_size(interp, filehandle,
                    (bufsize >= PIO_GRAIN ? bufsize : PIO_GRAIN));
        break;
    }

    buffer_size = Parrot_io_get_buffer_size(interp, filehandle);

    if (buffer_start && (buffer_flags & PIO_BF_MALLOC)) {
        mem_gc_free(interp, buffer_start);
        Parrot_io_set_buffer_start(interp, filehandle, NULL);
        Parrot_io_set_buffer_next(interp, filehandle, NULL);
        buffer_start = buffer_next = NULL;
    }

    if (buffer_size > 0) {
        buffer_start = buffer_next = mem_gc_allocate_n_typed(interp, buffer_size, unsigned char);
        Parrot_io_set_buffer_start(interp, filehandle, buffer_start);
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        buffer_flags |= PIO_BF_MALLOC;
    }
    else
        buffer_flags &= ~PIO_BF_MALLOC;

    Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

    if (buffer_size != 0) {
        filehandle_flags &= ~PIO_F_LINEBUF;
        filehandle_flags |= PIO_F_BLKBUF;
    }
    else
        filehandle_flags &= ~(PIO_F_BLKBUF | PIO_F_LINEBUF);

    Parrot_io_set_flags(interp, filehandle, filehandle_flags);

}

/*

=item C<INTVAL Parrot_io_setlinebuf(PARROT_INTERP, PMC *filehandle)>

Set the file handle to line buffering mode.

=cut

*/

INTVAL
Parrot_io_setlinebuf(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_setlinebuf)
    INTVAL filehandle_flags = Parrot_io_get_flags(interp, filehandle);

    /* already linebuffering */
    if (filehandle_flags & PIO_F_LINEBUF)
        return 0;

    /* Reuse setbuf call */
    Parrot_io_setbuf(interp, filehandle, PIO_LINEBUFSIZE);

    /* Then switch to linebuf */
    filehandle_flags &= ~PIO_F_BLKBUF;
    filehandle_flags |= PIO_F_LINEBUF;
    Parrot_io_set_flags(interp, filehandle, filehandle_flags);
    return 0;

}

/*

=item C<STRING * Parrot_io_readline_buffer(PARROT_INTERP, PMC *filehandle, const
STR_VTABLE *encoding)>

This is called from C<Parrot_io_read_buffer()> to do line buffered reading if
that is what is required.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_readline_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle),
        ARGIN(const STR_VTABLE *encoding))
{
    ASSERT_ARGS(Parrot_io_readline_buffer)
    static const size_t max_split_bytes = 3;

    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    unsigned char *buffer_next;
    unsigned char *buffer_end;
    STRING        *s;
    INTVAL         rs;

    /* write buffer flush */
    if (buffer_flags & PIO_BF_WRITEBUF) {
        Parrot_io_flush_buffer(interp, filehandle);
        buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    }

    s           = Parrot_gc_new_string_header(interp, 0);
    s->bufused  = 0;
    s->strlen   = 0;
    s->encoding = encoding;

    /* fill empty buffer */
    if (!(buffer_flags & PIO_BF_READBUF)) {
        /* promote to buffered if unbuffered */
        if (Parrot_io_get_buffer_size(interp, filehandle) == 0)
            Parrot_io_setbuf(interp, filehandle, 1);

        if (Parrot_io_fill_readbuf(interp, filehandle) == 0)
            return s;
    }

    /* Retrieve filled buffer */
    buffer_next = Parrot_io_get_buffer_next(interp, filehandle);
    buffer_end  = Parrot_io_get_buffer_end(interp, filehandle);

    GETATTR_Handle_record_separator(interp, filehandle, rs);

    while (1) {
        Parrot_String_Bounds bounds;

        const size_t buffer_size = buffer_end - buffer_next;
        size_t       alloc_size;
        INTVAL       got;

        /* Partial scan of buffer */

        bounds.bytes = buffer_end - buffer_next;
        bounds.chars = -1;
        bounds.delim = rs;

        encoding->partial_scan(interp, (char *)buffer_next, &bounds);

        /* Append buffer to result */

        if (bounds.delim == rs) {
            /* End of line, use only part of buffer */
            alloc_size = s->bufused + bounds.bytes;

            if (s->strstart)
                Parrot_gc_reallocate_string_storage(interp, s, alloc_size);
            else
                Parrot_gc_allocate_string_storage(interp, s, alloc_size);

            memcpy(s->strstart + s->bufused, buffer_next, bounds.bytes);

            s->bufused += bounds.bytes;
            s->strlen  += bounds.chars;

            buffer_next += bounds.bytes;
            Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
            break;
        }

        /* Use additional space for multi-byte char split across buffers */
        alloc_size = s->bufused + buffer_size + max_split_bytes;

        if (s->strstart)
            Parrot_gc_reallocate_string_storage(interp, s, alloc_size);
        else
            Parrot_gc_allocate_string_storage(interp, s, alloc_size);

        /* Copy whole buffer, might copy partial characters */
        memcpy(s->strstart + s->bufused, buffer_next, buffer_size);

        s->bufused += bounds.bytes;
        s->strlen  += bounds.chars;

        /* Refill buffer */

        got = Parrot_io_fill_readbuf(interp, filehandle);

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

=item C<size_t Parrot_io_write_buffer(PARROT_INTERP, PMC *filehandle, const
STRING *s)>

The buffer layer's C<Write> function.

=cut

*/

size_t
Parrot_io_write_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle), ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_io_write_buffer)
    unsigned char * const buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
    unsigned char *       buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    const size_t          buffer_size  = Parrot_io_get_buffer_size(interp, filehandle);
    INTVAL                buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    INTVAL                flags        = Parrot_io_get_flags(interp, filehandle);
    const size_t          len          = s->bufused;
    int                   need_flush;
    size_t                avail;
    PIOHANDLE             os_handle;
    PIOOFF_T              file_pos;

    if (len <= 0)
        return 0;

    GETATTR_Handle_os_handle(interp, filehandle, os_handle);

    if (buffer_flags & PIO_BF_WRITEBUF)
        avail = buffer_size - (buffer_next - buffer_start);

    else if (buffer_flags & PIO_BF_READBUF) {
        if (!(flags & PIO_F_APPEND)) {
            /* Seek back to file position */
            file_pos = Parrot_io_get_file_position(interp, filehandle);
            PIO_SEEK(interp, os_handle, file_pos, SEEK_SET);
        }

        buffer_flags &= ~PIO_BF_READBUF;
        Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);
        buffer_next = buffer_start;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        avail = buffer_size;
    }
    else
        avail = buffer_size;

    /* If we are line buffered, check for newlines.
     * If any, we should flush */
    need_flush = 0;

    if (flags & PIO_F_APPEND) {
        /* Buffering would break append semantics */
        need_flush = 1;

#ifdef _WIN32
        /* Win32 doesn't support append */
        PIO_SEEK(interp, os_handle, 0, SEEK_END);
#endif
    }
    else if (Parrot_io_get_flags(interp, filehandle) & PIO_F_LINEBUF) {
        /* scan from end, it's likely that EOL is at end of string */
        const char *p = (char*)(s->strstart) + len - 1;
        size_t      i;

        for (i = 0; i < len; ++i, --p) {
            if (io_is_end_of_line(p)) {
                need_flush = 1;
                break;
            }
        }
    }

    /*
     * Large writes (multiples of blocksize) should write
     * through generally for best performance, else you are
     * just doing extra memcpys.
     */
    if (need_flush || len >= buffer_size) {
        size_t    wrote;

        /* Write through, skip buffer. */
        Parrot_io_flush_buffer(interp, filehandle);

        wrote = PIO_WRITE(interp, os_handle, s->strstart, len);

        if (wrote != len)
            return (size_t)-1;
    }
    else if (len < avail) {
        buffer_flags |= PIO_BF_WRITEBUF;
        Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

        memcpy(buffer_next, s->strstart, len);
        buffer_next += len;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
    }
    else {
        /* Now we have avail <= len < buffer_size, so there is a non-empty
         * write buffer */
        const unsigned int diff = (int)(len - avail);

        /* Fill remainder, flush, then try to buffer more */
        memcpy(buffer_next, s->strstart, avail);
        buffer_next += avail;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        Parrot_io_flush_buffer(interp, filehandle);

        if (diff > 0) {
            buffer_flags |= PIO_BF_WRITEBUF;
            Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

            memcpy(buffer_start, s->strstart + avail, diff);

            buffer_next = buffer_start + diff;
            Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        }
    }

    if (flags & PIO_F_APPEND)
        file_pos = PIO_TELL(interp, os_handle);
    else
        file_pos = Parrot_io_get_file_position(interp, filehandle) + len;

    Parrot_io_set_file_position(interp, filehandle, file_pos);

    return len;
}


/*

=item C<PIOOFF_T Parrot_io_seek_buffer(PARROT_INTERP, PMC *filehandle, PIOOFF_T
offset, INTVAL whence)>

The buffer layer's C<Seek> function.

=cut

*/

PIOOFF_T
Parrot_io_seek_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle),
        PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(Parrot_io_seek_buffer)
    const INTVAL   buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    const PIOOFF_T file_pos     = Parrot_io_get_file_position(interp, filehandle);
    PIOHANDLE os_handle;

    if (whence == SEEK_CUR) {
        /* Don't use SEEK_CUR, filehandle may be ahead of file_pos */
        offset += file_pos;
        whence  = SEEK_SET;
    }

    if (buffer_flags & PIO_BF_READBUF
    &&  whence != SEEK_END) {
        /* Try to seek inside the read buffer */
        unsigned char * const buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
        unsigned char *       buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
        unsigned char * const buffer_end   = Parrot_io_get_buffer_end(interp, filehandle);

        if (offset >= file_pos - (buffer_next - buffer_start)
        &&  offset <  file_pos + (buffer_end  - buffer_next)) {
            buffer_next += offset - file_pos;
            Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
            Parrot_io_set_file_position(interp, filehandle, offset);

            return offset;
        }
    }

    Parrot_io_flush_buffer(interp, filehandle);

    GETATTR_Handle_os_handle(interp, filehandle, os_handle);
    offset = PIO_SEEK(interp, os_handle, offset, whence);

    /* Seek clears EOF */
    Parrot_io_set_flags(interp, filehandle,
            (Parrot_io_get_flags(interp, filehandle) & ~PIO_F_EOF));

    Parrot_io_set_file_position(interp, filehandle, offset);

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
