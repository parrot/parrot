/*
Copyright (C) 2001-2010, Parrot Foundation.

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
        size_t  to_write = buffer_next - buffer_start;
        STRING *s        = Parrot_str_new_init(interp, (char *)buffer_start,
                to_write, Parrot_binary_encoding_ptr, 0);
        /* Flush to next layer */
        long wrote = PIO_WRITE(interp, filehandle, s);
        if (wrote == (long)to_write) {
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
    PIOOFF_T pos  = Parrot_io_get_file_position(interp, filehandle);
    char    *buf  = (char *) Parrot_io_get_buffer_start(interp, filehandle);
    size_t   size = Parrot_io_get_buffer_size(interp, filehandle);
    STRING  *s    = Parrot_str_new_init(interp, buf, size,
                        Parrot_binary_encoding_ptr,
                        PObj_external_FLAG);
    size_t   got  = PIO_READ(interp, filehandle, &s);

    /* buffer-filling does not change fileposition */
    Parrot_io_set_file_position(interp, filehandle, pos);

    /* nothing to get */
    if (got == 0)
        return 0;

    Parrot_io_set_buffer_end(interp, filehandle,
            (got + Parrot_io_get_buffer_start(interp, filehandle)));
    Parrot_io_set_buffer_next(interp, filehandle,
            Parrot_io_get_buffer_start(interp, filehandle));

    Parrot_io_set_buffer_flags(interp, filehandle,
            (Parrot_io_get_buffer_flags(interp, filehandle) | PIO_BF_READBUF));

    return got;
}


/*

=item C<size_t Parrot_io_read_buffer(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

The buffer layer's C<Read> function.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
Parrot_io_read_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle),
              ARGMOD(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_read_buffer)
    unsigned char *buffer_start, *buffer_next, *buffer_end;
    STRING        *s;
    size_t         len;
    size_t         current      = 0;
    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);

    /* write buffer flush */
    if (buffer_flags & PIO_BF_WRITEBUF) {
        Parrot_io_flush_buffer(interp, filehandle);
        buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    }

    buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
    buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    buffer_end   = Parrot_io_get_buffer_end(interp, filehandle);

    if (*buf == NULL)
        *buf = Parrot_str_new_noinit(interp, 2048);

    s       = *buf;
    len     = s->bufused;

    /* read Data from buffer */
    if (buffer_flags & PIO_BF_READBUF) {
        const size_t avail = buffer_end - buffer_next;
        current            = avail < len ? avail : len;

        memcpy(s->strstart, buffer_next, current);
        buffer_next += current;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        Parrot_io_set_file_position(interp, filehandle, (current +
                Parrot_io_get_file_position(interp, filehandle)));

        /* buffer completed */
        if (current == avail) {
            buffer_flags &= ~PIO_BF_READBUF;
            Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

            /* Reset next and end */
            Parrot_io_set_buffer_end(interp, filehandle, NULL);
            Parrot_io_set_buffer_next(interp, filehandle, buffer_start);
        }

        /* requested length satisfied */
        if (len == current) {
            s->strlen = s->bufused = len;
            return current;
        }
        else {
            /* more data needed */
            len -= current;
        }
    }

    /* (re)fill the readbuffer */
    if (!(buffer_flags & PIO_BF_READBUF)) {
        size_t got;

        if (len >= Parrot_io_get_buffer_size(interp, filehandle)) {
            STRING *sf  = Parrot_str_new_noinit(interp, len);

            sf->bufused = len;
            got         = PIO_READ(interp, filehandle, &sf);
            s->strlen   = s->bufused = current + got;

            memcpy(s->strstart + current, sf->strstart, got);

            Parrot_io_set_file_position(interp, filehandle,
                    (got + Parrot_io_get_file_position(interp, filehandle)));
            return current + got;
        }

        got = Parrot_io_fill_readbuf(interp, filehandle);
        len = (len < got) ? len : got;
    }

    /* read from the read_buffer */
    buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
    buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    buffer_end   = Parrot_io_get_buffer_end(interp, filehandle);

    memcpy(s->strstart + current, buffer_next, len);
    s->strlen    = s->bufused = current + len;
    buffer_next += len;

    Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
    Parrot_io_set_file_position(interp, filehandle,
            (len + Parrot_io_get_file_position(interp, filehandle)));

    /* is the buffer is completely empty ? */
    if (buffer_next == buffer_end) {
        Parrot_io_set_buffer_flags(interp, filehandle,
                (buffer_flags & ~PIO_BF_READBUF));
        /* Reset next and end */
        Parrot_io_set_buffer_end(interp, filehandle, NULL);
        Parrot_io_set_buffer_next(interp, filehandle, buffer_start);
    }

    return current + len;
}

/*

=item C<size_t Parrot_io_peek_buffer(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Retrieve the next character in the buffer without modifying the stream.

=cut

*/

size_t
Parrot_io_peek_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle),
        ARGOUT(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_peek_buffer)
    unsigned char *buffer_next;
    STRING * const s            = Parrot_io_make_string(interp, buf, 1);
    UINTVAL        len          = 1;
    INTVAL         buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);

    /* write buffer flush */
    if (buffer_flags & PIO_BF_WRITEBUF) {
        Parrot_io_flush_buffer(interp, filehandle);
        buffer_flags = Parrot_io_get_buffer_flags(interp, filehandle);
    }

    buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);

    /* (re)fill the buffer */
    if (! (buffer_flags & PIO_BF_READBUF)) {
        size_t got;

        /* promote to buffered if unbuffered */
        if (Parrot_io_get_buffer_size(interp, filehandle) == 0) {
            Parrot_io_setbuf(interp, filehandle, 1);
            return Parrot_io_peek_buffer(interp, filehandle, buf);
        }

        /* Parrot_io_fill_readbuf() can return -1, but len should be positive */
        got = Parrot_io_fill_readbuf(interp, filehandle);

        /* avoid signedness problems between size_t got and UINTVAL len */
        if (len > got) {
            if (got > 0)
                len = (UINTVAL)got;
            else
                len = 0;
        }
    }

    /* if we got any data, then copy out the next byte */
    memmove(s->strstart, buffer_next, len);
    s->bufused = s->strlen = len;

    return len;
}


/*

=item C<size_t Parrot_io_readline_buffer(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

This is called from C<Parrot_io_read_buffer()> to do line buffered reading if
that is what is required.

=cut

*/

PARROT_WARN_UNUSED_RESULT
size_t
Parrot_io_readline_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle), ARGOUT(STRING **buf))
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

    if (*buf == NULL) {
        *buf = Parrot_gc_new_string_header(interp, 0);
    }
    s = *buf;
    s->bufused = 0;
    s->strlen  = 0;

    /* fill empty buffer */
    if (!(buffer_flags & PIO_BF_READBUF)) {
        /* promote to buffered if unbuffered */
        if (Parrot_io_get_buffer_size(interp, filehandle) == 0)
            Parrot_io_setbuf(interp, filehandle, 1);

        if (Parrot_io_fill_readbuf(interp, filehandle) == 0)
            return 0;
    }

    /* Retrieve filled buffer */
    buffer_next = Parrot_io_get_buffer_next(interp, filehandle);
    buffer_end  = Parrot_io_get_buffer_end(interp, filehandle);

    GETATTR_Handle_record_separator(interp, filehandle, rs);

    while (1) {
        Parrot_String_Bounds bounds;

        const size_t buffer_size = buffer_end - buffer_next;
        size_t       chunk_size, new_size, alloc_size, decoded_bytes;
        INTVAL       got;

        /* Partial scan of buffer */

        bounds.bytes = buffer_end - buffer_next;
        bounds.chars = -1;
        bounds.delim = rs;

        s->encoding->partial_scan(interp, (char *)buffer_next, &bounds);

        /* Append buffer to result */

        if (bounds.delim == rs)
            /* End of line, use only part of buffer */
            chunk_size = bounds.bytes;
        else
            /* Copy whole buffer, might copy partial characters */
            chunk_size = buffer_size;

        decoded_bytes = s->bufused + bounds.bytes;
        new_size      = s->bufused + chunk_size;
        /* Additional space for multi-byte char split across buffers */
        alloc_size    = new_size + max_split_bytes;

        if (s->strstart)
            Parrot_gc_reallocate_string_storage(interp, s, alloc_size);
        else
            Parrot_gc_allocate_string_storage(interp, s, alloc_size);

        memcpy(s->strstart + s->bufused, buffer_next, chunk_size);

        s->bufused  = new_size;
        s->strlen  += bounds.chars;

        if (bounds.delim == rs) {
            /* End of line */
            buffer_next += chunk_size;
            Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
            break;
        }

        /* Refill buffer */

        got = Parrot_io_fill_readbuf(interp, filehandle);

        if (got == 0) {
            /* End of file */

            if (bounds.bytes == buffer_size) {
                buffer_next = buffer_end;
                break;
            }
            else {
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_CHARACTER,
                    "Unaligned end in %s string\n", s->encoding->name);
            }
        }

        buffer_next = Parrot_io_get_buffer_next(interp, filehandle);
        buffer_end  = Parrot_io_get_buffer_end(interp, filehandle);

        if (bounds.bytes < buffer_size) {
            /* Handle character split across buffers */

            size_t bytes_l = s->bufused - decoded_bytes;
            size_t bytes_r = (size_t)got < max_split_bytes
                           ? got : max_split_bytes;

            /* First, copy enough bytes to complete character */
            memcpy(s->strstart + s->bufused, buffer_next, bytes_r);

            /* Partial scan of single character */

            bounds.bytes = bytes_l + bytes_r;
            bounds.chars = 1;
            bounds.delim = rs;

            s->encoding->partial_scan(interp, s->strstart + decoded_bytes,
                                      &bounds);

            if (bounds.bytes == 0)
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_CHARACTER,
                    "Unaligned end in %s string\n", s->encoding->name);

            PARROT_ASSERT(bounds.chars == 1);

            bytes_r = bounds.bytes - bytes_l;

            s->bufused  += bytes_r;
            s->strlen   += 1;

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

    return s->bufused;
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
    const size_t          len          = s->bufused;
    int                   need_flush;
    size_t                avail;

    if (len <= 0)
        return 0;

    if (buffer_flags & PIO_BF_WRITEBUF)
        avail = buffer_size - (buffer_next - buffer_start);

    else if (buffer_flags & PIO_BF_READBUF) {
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

    if (Parrot_io_get_flags(interp, filehandle) & PIO_F_LINEBUF) {
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
     * FIXME: This is badly optimized, will fixup later.
     */
    if (need_flush || len >= buffer_size) {
        long wrote;

        /* Write through, skip buffer. */
        Parrot_io_flush_buffer(interp, filehandle);
        wrote = PIO_WRITE(interp, filehandle, s);

        if (wrote == (long)len) {
            Parrot_io_set_file_position(interp, filehandle, (wrote +
                        Parrot_io_get_file_position(interp, filehandle)));
            return wrote;
        }
        /* Write error */
        else
            return (size_t)-1;
    }
    else if (avail > len) {
        buffer_flags |= PIO_BF_WRITEBUF;
        Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

        memmove(buffer_next, s->strstart, len);
        buffer_next += len;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        Parrot_io_set_file_position(interp, filehandle, (len +
                    Parrot_io_get_file_position(interp, filehandle)));
        return len;
    }
    else {
        const unsigned int diff = (int)(len - avail);

        buffer_flags |= PIO_BF_WRITEBUF;
        Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

        /* Fill remainder, flush, then try to buffer more */
        memmove(buffer_next, s->strstart, avail);
        buffer_next += avail;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        Parrot_io_set_file_position(interp, filehandle, (avail +
                    Parrot_io_get_file_position(interp, filehandle)));
        Parrot_io_flush_buffer(interp, filehandle);

        buffer_flags |= PIO_BF_WRITEBUF;
        Parrot_io_set_buffer_flags(interp, filehandle, buffer_flags);

        buffer_next = Parrot_io_get_buffer_next(interp, filehandle);
        memmove(buffer_start, (s->strstart + avail), diff);

        buffer_next += diff;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
        Parrot_io_set_file_position(interp, filehandle, (diff +
                    Parrot_io_get_file_position(interp, filehandle)));
        return len;
    }
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
    PIOOFF_T newpos;
    PIOOFF_T file_pos = Parrot_io_get_file_position(interp, filehandle);
    unsigned char *buffer_start = Parrot_io_get_buffer_start(interp, filehandle);
    unsigned char *buffer_next  = Parrot_io_get_buffer_next(interp, filehandle);
    unsigned char *buffer_end   = Parrot_io_get_buffer_end(interp, filehandle);

    switch (whence) {
      case SEEK_SET:
        newpos = offset;
        break;
      case SEEK_CUR:
        newpos = file_pos + offset;
        break;
      case SEEK_END:
        newpos = PIO_SEEK(interp, filehandle, offset,
                               whence);
        if (newpos == -1)
            return -1;

        break;
      default:
        /* XXX: somehow report the illegal whence value */
        return -1;
    }

    if ((newpos < file_pos - (buffer_next - buffer_start))
        || (newpos >= file_pos + (buffer_end - buffer_next))) {
        Parrot_io_flush_buffer(interp, filehandle);
        newpos = PIO_SEEK(interp, filehandle, newpos, SEEK_SET);
    }
    else {
        buffer_next += newpos - file_pos;
        Parrot_io_set_buffer_next(interp, filehandle, buffer_next);
    }

    Parrot_io_set_file_position(interp, filehandle, newpos);

    return newpos;
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
