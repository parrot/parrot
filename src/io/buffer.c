/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/io/buffer.c - I/O buffering

=head1 DESCRIPTION

This file implements a collection of utility functions for I/O buffering.

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

=item C<INTVAL Parrot_io_flush_buffer(PARROT_INTERP, PMC *filehandle)>

Flush the I/O buffer for a given filehandle object.

=cut

*/

INTVAL
Parrot_io_flush_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_flush_buffer)
    unsigned char *buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
    unsigned char *buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);

    /*
     * Either buffering is null, disabled, or empty.
     */
    if (!buffer_start
        || (Parrot_io_get_flags(interp, filehandle) & (PIO_F_BLKBUF | PIO_F_LINEBUF)) == 0
        || (buffer_flags & (PIO_BF_WRITEBUF | PIO_BF_READBUF)) == 0)
        return 0;
    /*
     * Write flush
     */
    if (buffer_flags & PIO_BF_WRITEBUF) {
        /* Flush to next layer */
        size_t    to_write = buffer_next - buffer_start;
        size_t    wrote;
        PIOHANDLE os_handle;

        GETATTR_Handle_os_handle(interp, filehandle, os_handle);
        wrote = PIO_WRITE(interp, os_handle, (char *)buffer_start, to_write);

        if (wrote == to_write) {
            Parrot_io_set_buffer_next(interp, filehandle, buffer_start);
            /* Release buffer */
            Parrot_io_set_buffer_flags(interp, filehandle, (buffer_flags & ~PIO_BF_WRITEBUF));
            return 0;
        }
        else {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Attempt to flush invalid write buffer");
        }
    }
    /*
     * Read flush
     */
    else if (buffer_flags & PIO_BF_READBUF) {
        Parrot_io_set_buffer_next(interp, filehandle, buffer_start);
        /* Release buffer */
        Parrot_io_set_buffer_flags(interp, filehandle, (buffer_flags & ~PIO_BF_READBUF));
    }
    return -1;
}

/*

=item C<size_t Parrot_io_fill_readbuf(PARROT_INTERP, PMC *filehandle)>

The buffer layer's C<Fill> function.

=cut

*/

size_t
Parrot_io_fill_readbuf(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_fill_readbuf)
    unsigned char    *buf  = Parrot_io_get_buffer_start(interp, filehandle);
    size_t            size = Parrot_io_get_buffer_size(interp, filehandle);
    size_t            got;
    PIOHANDLE         os_handle;

    GETATTR_Handle_os_handle(interp, filehandle, os_handle);
    got = PIO_READ(interp, os_handle, (char *)buf, size);

    /* nothing to get */
    if (got == 0) {
        const INTVAL file_flags = Parrot_io_get_flags(interp, filehandle);
        Parrot_io_set_flags(interp, filehandle, file_flags | PIO_F_EOF);
        return 0;
    }

    Parrot_io_set_buffer_end(interp, filehandle, buf + got);
    Parrot_io_set_buffer_next(interp, filehandle, buf);

    Parrot_io_set_buffer_flags(interp, filehandle,
            (Parrot_io_get_buffer_flags(interp, filehandle) | PIO_BF_READBUF));

    return got;
}


/*

=item C<size_t Parrot_io_read_buffer(PARROT_INTERP, PMC *filehandle, char *dest,
size_t len)>

The buffer layer's C<Read> function.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
Parrot_io_read_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle),
        ARGMOD(char *dest), size_t len)
{
    ASSERT_ARGS(Parrot_io_read_buffer)
    unsigned char *buffer_next, *buffer_end;
    size_t         got;
    size_t         current      = 0;
    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    PIOOFF_T       file_pos     = Parrot_io_get_file_position(interp, filehandle);

    /* write buffer flush */
    if (buffer_flags & PIO_BF_WRITEBUF) {
        Parrot_io_flush_buffer(interp, filehandle);
        buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    }

    buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    buffer_end   = Parrot_io_get_buffer_end(interp, filehandle);

    /* read Data from buffer */
    if (buffer_flags & PIO_BF_READBUF) {
        const size_t avail = buffer_end - buffer_next;
        current            = avail < len ? avail : len;

        memcpy(dest, buffer_next, current);

        /* buffer completed */
        if (current == avail) {
            buffer_flags &= ~PIO_BF_READBUF;
            Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

            /* Reset next and end */
            Parrot_io_set_buffer_end(interp, filehandle, NULL);
            buffer_next = Parrot_io_get_buffer_start(interp, filehandle);
        }
        else {
            buffer_next += current;
        }

        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);

        file_pos += current;

        /* requested length satisfied */
        if (len == current) {
            Parrot_io_set_file_position(interp, filehandle, file_pos);
            return len;
        }

        /* more data needed */
        len -= current;
    }

    /* buffer is now empty */

    if (len >= Parrot_io_get_buffer_size(interp, filehandle)) {
        PIOHANDLE os_handle;

        GETATTR_Handle_os_handle(interp, filehandle, os_handle);
        got = PIO_READ(interp, os_handle, dest + current, len);

        if (got == 0) {
            const INTVAL file_flags = Parrot_io_get_flags(interp, filehandle);
            Parrot_io_set_flags(interp, filehandle, file_flags | PIO_F_EOF);
        }

        Parrot_io_set_file_position(interp, filehandle, file_pos + got);

        return current + got;
    }

    /* (re)fill the readbuffer */
    got = Parrot_io_fill_readbuf(interp, filehandle);
    if (got < len)
        len = got;

    /* read from the read_buffer */
    buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);

    memcpy(dest + current, buffer_next, len);

    /* is the buffer is completely empty ? */
    if (buffer_next == buffer_end) {
        Parrot_io_set_buffer_flags(interp, filehandle,
                (buffer_flags & ~PIO_BF_READBUF));
        /* Reset next and end */
        Parrot_io_set_buffer_end(interp, filehandle, NULL);
        buffer_next = Parrot_io_get_buffer_start(interp, filehandle);
    }
    else {
        buffer_next += len;
    }

    Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
    Parrot_io_set_file_position(interp, filehandle, file_pos + len);

    return current + len;
}

/*

=item C<INTVAL Parrot_io_peek_buffer(PARROT_INTERP, PMC *filehandle)>

Retrieve the next character in the buffer without modifying the stream.
Return -1 or EOF.

=cut

*/

INTVAL
Parrot_io_peek_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_peek_buffer)
    unsigned char *buffer_next;
    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);

    /* write buffer flush */
    if (buffer_flags & PIO_BF_WRITEBUF) {
        Parrot_io_flush_buffer(interp, filehandle);
        buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    }

    /* (re)fill the buffer */
    if (! (buffer_flags & PIO_BF_READBUF)) {
        size_t got;

        /* promote to buffered if unbuffered */
        if (Parrot_io_get_buffer_size(interp, filehandle) == 0)
            Parrot_io_setbuf(interp, filehandle, 1);

        /* Parrot_io_fill_readbuf() can return -1, but len should be positive */
        got = Parrot_io_fill_readbuf(interp, filehandle);

        if (got <= 0)
            return -1;
    }

    buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);

    return *buffer_next;
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
    INTVAL    buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    PIOOFF_T  file_pos     = Parrot_io_get_file_position(interp, filehandle);
    PIOHANDLE os_handle;

    if (whence == SEEK_CUR) {
        /* Don't use SEEK_CUR, filehandle may be ahead of file_pos */
        offset += file_pos;
        whence  = SEEK_SET;
    }

    if (buffer_flags & PIO_BF_READBUF
    &&  whence != SEEK_END) {
        /* Try to seek inside the read buffer */
        unsigned char *buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
        unsigned char *buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
        unsigned char *buffer_end   = Parrot_io_get_buffer_end(interp, filehandle);

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

=item C<static INTVAL io_is_end_of_line(const char *c)>

Determine if the current character is the end of the line.

Note that this is not a portable solution, but it is what the old architecture
was doing, once you boil away the useless macros. This will need to change to
support the Strings PDD, but is left as-is for now, for a smooth transition to
the new architecture.

=cut

*/

static INTVAL
io_is_end_of_line(ARGIN(const char *c))
{
    ASSERT_ARGS(io_is_end_of_line)
    if ((*(c)) == '\n')
        return 1;

    return 0;
}

/*

=back

=head1 SEE ALSO

F<src/io/api.c>,
F<src/io/unix.c>,
F<src/io/win32.c>,
F<src/io/portable.c>,
F<src/io.c>,
F<src/io/io_private.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
