/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_buf.c - IO buffer layer

=head1 DESCRIPTION

The "buf" layer of Parrot IO. Buffering and all the fun stuff.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include <assert.h>

/* Defined at bottom */
extern const ParrotIOLayerAPI pio_buf_layer_api;

ParrotIOLayer pio_buf_layer = {
    NULL,
    "buf",
    PIO_L_TERMINAL,
    &pio_buf_layer_api,
    0, 0
};

/*
 * Currently keeping layer prototypes local to each layer
 * file.
 */

static INTVAL    PIO_buf_init(theINTERP, ParrotIOLayer *l);
static ParrotIO *PIO_buf_open(theINTERP, ParrotIOLayer *l,
                              const char *path, INTVAL flags);
static INTVAL    PIO_buf_setbuf(theINTERP, ParrotIOLayer *l,
                                ParrotIO *io, size_t bufsize);
static INTVAL    PIO_buf_setlinebuf(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static ParrotIO *PIO_buf_fdopen(theINTERP, ParrotIOLayer *l,
                                PIOHANDLE fd, INTVAL flags);
static INTVAL    PIO_buf_close(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static INTVAL    PIO_buf_flush(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static size_t    PIO_buf_read(theINTERP, ParrotIOLayer *l,
                              ParrotIO *io, STRING **);
static size_t    PIO_buf_write(theINTERP, ParrotIOLayer *l,
                               ParrotIO *io, STRING *s);
static size_t    PIO_buf_peek(theINTERP, ParrotIOLayer *l,
                              ParrotIO *io, STRING **);
static PIOOFF_T  PIO_buf_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                              PIOOFF_T offset, INTVAL whence);
static PIOOFF_T  PIO_buf_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static size_t    PIO_buf_fill_readbuf(theINTERP, ParrotIOLayer *l,
                                      ParrotIO *io, ParrotIOBuf *b);
static size_t    PIO_buf_readline(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                                  STRING **);


/* XXX: This is not portable */
#define DEFAULT_RECSEP '\n'
#define IS_EOL(io,c) (io->recsep == (*c))
/*
#define IS_EOL(io,c) ((*c) == '\n')
*/


/*

=item C<static INTVAL
PIO_buf_init(theINTERP, ParrotIOLayer *layer)>

The buffer layer's C<Init> function. Initializes buffering.

=cut

*/

static INTVAL
PIO_buf_init(theINTERP, ParrotIOLayer *layer)
{
    if (PIO_STDOUT(interpreter))
        PIO_buf_setlinebuf(interpreter, layer,
                           PMC_data(PIO_STDOUT(interpreter)));
    if (PIO_STDIN(interpreter))
        PIO_buf_setbuf(interpreter, layer, PMC_data(PIO_STDIN(interpreter)),
                         PIO_UNBOUND);
    return 0;
}

/*

=item C<static ParrotIO *
PIO_buf_open(theINTERP, ParrotIOLayer *layer,
               const char *path, INTVAL flags)>

The buffer layer's C<Open> function.

=cut

*/

static ParrotIO *
PIO_buf_open(theINTERP, ParrotIOLayer *layer,
               const char *path, INTVAL flags)
{
    ParrotIO *io;
    ParrotIOLayer *l = PIO_DOWNLAYER(layer);

    io = PIO_open_down(interpreter, l, path, flags);
    if (!io) {
        /* error creating IO stream */
        return NULL;
    }
    /*
     * We have an IO stream. Now setup stuff
     * for our layer before returning it.
     * XXX: Make default behaviour linebuffered?
     */
    /*PIO_buf_setlinebuf(interpreter, l, io);*/
    PIO_buf_setbuf(interpreter, l, io, PIO_UNBOUND);
    return io;
}

/*

=item C<static INTVAL
PIO_buf_setbuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io, size_t bufsize)>

The buffer layer's C<SetBuf> function.

Don't pass C<SetBuf> calls down the stack, top layer wins. This doesn't
mean other layers can't buffer, I just need to think about the mechanism
for buffer control or if it even makes sense this way. Most layers will
not implement C<SetBuf>.

=cut

*/

static INTVAL
PIO_buf_setbuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io, size_t bufsize)
{
    ParrotIOLayer *l = layer;
    ParrotIOBuf *b = &io->b;
    if(!l)
        l = io->stack;
    /* If there is a buffer, make sure we flush before
     * dinking around with the buffer.
     */
    if (b->startb)
        PIO_buf_flush(interpreter, l, io);

    /* Choose an appropriate buffer size for caller */
    switch (bufsize) {
        case 0:
            b->size = 0;
            break;
        case PIO_UNBOUND:
            b->size = PIO_getblksize(io->fd);
            break;
        default:
            b->size = (bufsize >= PIO_GRAIN ? bufsize : PIO_GRAIN);
            break;
    }

    if (b->startb && (b->flags & PIO_BF_MALLOC)) {
        mem_sys_free(b->startb);
        b->startb = b->next = NULL;
    }

    if (b->size > 0) {
        b->startb = b->next = mem_sys_allocate(b->size);
        b->flags |= PIO_BF_MALLOC;
    }
    else
        b->flags &= ~PIO_BF_MALLOC;

    if (b->size != 0)
        io->flags |= PIO_F_BLKBUF;
    else
        io->flags &= ~(PIO_F_BLKBUF | PIO_F_LINEBUF);

    return 0;
}

/*

=item C<static INTVAL
PIO_buf_setlinebuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

The buffer layer's C<SetLineBuf> function.

=cut

*/

static INTVAL
PIO_buf_setlinebuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    int err;
    ParrotIOLayer * l;

    l = layer;
    if(!l)
        l = io->stack;

    /* already linebuffering */
    if (io->flags & PIO_F_LINEBUF)
        return 0;

    /* Reuse setbuf call */
    if ((err = PIO_buf_setbuf(interpreter, l, io, PIO_LINEBUFSIZE)) >= 0) {
        /* Then switch to linebuf */
        io->flags &= ~PIO_F_BLKBUF;
        io->flags |= PIO_F_LINEBUF;
        io->recsep = DEFAULT_RECSEP;
        return 0;
    }
    return err;
}

/*

=item C<static ParrotIO *
PIO_buf_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fd, INTVAL flags)>

The buffer layer's C<FDOpen> function.

=cut

*/

static ParrotIO *
PIO_buf_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fd, INTVAL flags)
{
    ParrotIO *io;
    ParrotIOLayer *l = PIO_DOWNLAYER(layer);

    io = PIO_fdopen_down(interpreter, l, fd, flags);
    if (!io) {
        /* error creating IO stream */
        return NULL;
    }

    if (io->flags & PIO_F_CONSOLE)
        PIO_buf_setlinebuf(interpreter, l, io);
    else
        PIO_buf_setbuf(interpreter, l, io, PIO_UNBOUND);

    return io;
}

/*

=item C<static INTVAL
PIO_buf_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

The buffer layer's C<Close> function.

=cut

*/

static INTVAL
PIO_buf_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    ParrotIOLayer *l = PIO_DOWNLAYER(layer);
    PIO_buf_flush(interpreter, layer, io);

    return PIO_close_down (interpreter, l, io);
}

/*

=item C<static INTVAL
PIO_buf_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

The buffer layer's C<Flush> function.

=cut

*/

static INTVAL
PIO_buf_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    long wrote;
    size_t to_write;
    STRING fake;
    /*
     * Either buffering is null, disabled, or empty.
     */
    if (!io->b.startb
        || (io->flags & (PIO_F_BLKBUF | PIO_F_LINEBUF)) == 0
        || (io->b.flags & (PIO_BF_WRITEBUF | PIO_BF_READBUF)) == 0)
        return 0;
    /*
     * Write flush
     */
    if (io->b.flags & PIO_BF_WRITEBUF) {
        ParrotIOLayer *l = layer;
        to_write = io->b.next - io->b.startb;

        /* Flush to next layer */
        fake.strstart = io->b.startb;
        fake.bufused = to_write;
        wrote = PIO_write_down(interpreter, PIO_DOWNLAYER(l), io, &fake);
        if (wrote == (long)to_write) {
            io->b.next = io->b.startb;
            /* Release buffer */
            io->b.flags &= ~PIO_BF_WRITEBUF;
            return 0;
        }
        else {
            /* FIXME: I/O Error */
        }
    }
    /*
     * Read flush
     */
    else if (io->b.flags & PIO_BF_READBUF) {
        io->b.flags &= ~PIO_BF_READBUF;
        io->b.next = io->b.startb;
    }
    return -1;
}

/*

=item C<static size_t
PIO_buf_fill_readbuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                     ParrotIOBuf *b)>

The buffer layer's C<Fill> function.

=cut

*/

static size_t
PIO_buf_fill_readbuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                     ParrotIOBuf *b)
{
    size_t got;
    PIOOFF_T pos = io->fpos;
    STRING fake, *s;
    fake.strstart = b->startb;
    fake.bufused  = b->size;
    s = &fake;

    got = PIO_read_down(interpreter, PIO_DOWNLAYER(layer),
                        io, &s);
    /* buffer-filling does not change fileposition */
    io->fpos = pos;

    /* nothing to get */
    if (got == 0)
        return 0;

    b->endb = b->startb + got;
    b->next = b->startb;

    b->flags |= PIO_BF_READBUF;

    return got;
}

/*

=item C<static size_t
PIO_buf_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               STRING **buf)>

The buffer layer's C<Read> function.

=cut

*/

static size_t
PIO_buf_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               STRING **buf)
{
    ParrotIOLayer *l = layer;
    ParrotIOBuf *b;
    unsigned char *out_buf;
    STRING *s;
    size_t len;
    size_t current = 0;

    /* write buffer flush */
    if (io->b.flags & PIO_BF_WRITEBUF) {
        PIO_buf_flush(interpreter, layer, io);
    }

    b = &io->b;

    /* line buffered read */
    if (io->flags & PIO_F_LINEBUF) {
        return PIO_buf_readline(interpreter, layer, io, buf);
    }

    if (*buf == NULL) {
	*buf = new_string_header(interpreter, 0);
        (*buf)->bufused = len = 2048;
    }
    s = *buf;
    len = s->bufused;
    if (!s->strstart) {
        PObj_bufstart(s) = s->strstart = mem_sys_allocate(len);
        PObj_sysmem_SET(s);
    }
    out_buf = s->strstart;
    /* read Data from buffer */
    if (b->flags & PIO_BF_READBUF) {
        size_t avail = b->endb - b->next;

        current = avail < len ? avail : len;
        memcpy(out_buf, b->next, current);
        b->next += current;
        io->fpos += current;

        /* buffer completed */
        if (current == avail) {
            io->b.flags &= ~PIO_BF_READBUF;
            /* XXX: Is the reset of next and endb really necessary ? */
            io->b.endb = NULL;
            io->b.next = io->b.startb;
        }

        if (len == current) {
            s->strlen = s->bufused = len;
            return current;
        }
        else {
            /* more data needed from downlayer */
            out_buf += current;
            len -= current;
        }
    }

    /* (re)fill the readbuffer */
    if (!(b->flags & PIO_BF_READBUF)) {
        size_t got;
        if (len >= io->b.size) {
            STRING fake, *sf;
            fake.strstart = out_buf;
            fake.bufused  = len;
            sf = &fake;
            got = PIO_read_down(interpreter, PIO_DOWNLAYER(l), io, &sf);
            s->strlen = s->bufused = current + got;
            io->fpos += got;
            return current + got;
        }

        got = PIO_buf_fill_readbuf(interpreter, l, io, b);

        len = len < got ? len : got;
    }

    /* read from the read_buffer */
    memcpy(out_buf, io->b.next, len);
    s->strlen = s->bufused = current + len;
    io->b.next += len;
    io->fpos += len;

    /* is the buffer is completely empty ? */
    if (io->b.next == io->b.endb) {
        io->b.flags &= ~PIO_BF_READBUF;
        /* XXX: Is the reset of next and encb really necessary ? */
        io->b.endb = NULL;
        io->b.next = io->b.startb;
    }
    return current + len;
}

static size_t
PIO_buf_peek(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)
{
    ParrotIOLayer *l = layer;
    ParrotIOBuf *b;
    size_t len = 1;
    STRING *s;
    size_t avail;

    s = PIO_make_io_string(interpreter, buf, 1);

    /* write buffer flush */
    if (io->b.flags & PIO_BF_WRITEBUF) {
        PIO_buf_flush(interpreter, layer, io);
    }

    b = &io->b;

    /* read Data from buffer */
    if (b->flags & PIO_BF_READBUF) {
        avail = b->endb - b->next;

        /* if we have data available, copy out the next byte */
        if (avail) {
ret_string:
            memcpy(s->strstart, b->next, len);
            s->bufused = s->strlen = len;
            return len;
        }
    }

    /* (re)fill the buffer */
    if (! (b->flags & PIO_BF_READBUF)) {
        size_t got;
        /* exception if we're unbuffered */
        if (io->b.size == 0)
            internal_exception(PIO_ERROR, "Can't peek at unbuffered PIO");

        got = PIO_buf_fill_readbuf(interpreter, l, io, b);
        len = (len < got) ? len : got;
    }

    /* if we got any data, then copy out the next byte */
    goto ret_string;
}

/*

=item C<static size_t
PIO_buf_readline(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                 void *buffer, size_t len)>

This is called from C<PIO_buf_read()> to do line buffered reading if
that is what is required.

=cut

*/


static size_t
PIO_buf_readline(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                 STRING **buf)
{
    size_t l;
    unsigned char *out_buf;
    unsigned char *buf_start;
    ParrotIOBuf *b = &io->b;
    size_t len;
    STRING *s;
    int may_realloc;

    if (*buf == NULL) {
        *buf = new_string_header(interpreter, 0);
    }
    s = *buf;
    s->strlen = 0;
    may_realloc = s->strstart == NULL;

    /* fill empty buffer */
    if (!(b->flags & PIO_BF_READBUF)) {
        if (PIO_buf_fill_readbuf(interpreter, layer, io, b) == 0)
            return 0;
    }

    buf_start = b->next;
    for (l = 0; ; ) {
        l++;
        if (IS_EOL(io, b->next++)) {
            break;
        }
        /* if there is a buffer, readline is called by the read opcode
         * - return just that part
         */
        if (s->bufused && l == s->bufused)
            break;
        /* buffer completed; copy out and refill */
        if (b->next == b->endb) {
            len = b->endb - buf_start;
            if (s->bufused < l) {
                if (may_realloc) {
                    s->representation = enum_stringrep_one;
                    if (s->strstart) {
                        Parrot_reallocate_string(interpreter, s, l);
                    } else {
                        Parrot_allocate_string(interpreter, s, l);
                    }
                }
                else
                    internal_exception(1, "readline: buffer too short");
            }
            out_buf = (unsigned char*)s->strstart + s->strlen;
            memcpy(out_buf, buf_start, len);
            s->strlen = s->bufused = l;
            if (PIO_buf_fill_readbuf(interpreter, layer, io, b) == 0)
                return l;
            buf_start = b->startb;
        }
    }
    if (s->bufused < l) {
        if (may_realloc) {
            s->representation = enum_stringrep_one;
            if (s->strstart) {
                Parrot_reallocate_string(interpreter, s, l);
            } else {
                Parrot_allocate_string(interpreter, s, l);
            }
        }
        else
            internal_exception(1, "readline: buffer too short");
    }
    out_buf = (unsigned char*)s->strstart + s->strlen;
    len = b->next - buf_start;
    memcpy(out_buf, buf_start, len);
    s->strlen = s->bufused = l;

    /* check if buffer is finished */
    if (b->next == b->endb) {
        b->next = b->startb;
        b->endb = NULL;
        b->flags &= ~PIO_BF_READBUF;
    }

    return l;
}

/*

=item C<static size_t
PIO_buf_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *s)>

The buffer layer's C<Write> function.

=cut

*/

static size_t
PIO_buf_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *s)
{
    size_t avail;
    long wrote;
    void *buffer = s->strstart;
    size_t len = s->bufused;
    int need_flush;

    if (len <= 0)
        return 0;
    if (io->b.flags & PIO_BF_WRITEBUF) {
        avail = io->b.size - (io->b.next - io->b.startb);
    }
    else if (io->b.flags & PIO_BF_READBUF) {
        io->b.flags &= ~PIO_BF_READBUF;
        io->b.next = io->b.startb;
        avail = io->b.size;
    }
    else {
        avail = io->b.size;
    }
    /* If we are line buffered, check for newlines.
     * If any, we should flush
     */
    need_flush = 0;
    if (io->flags & PIO_F_LINEBUF) {
        /* scan from end, it's likely that EOL is at end of string */
        char *p = (char*)buffer + len - 1;
        size_t i;
        for (i = 0; i < len; ++i, --p)
        if (IS_EOL(io, p)) {
            need_flush = 1;
            break;
        }
    }

    /*
     * Large writes (multiples of blocksize) should write
     * through generally for best performance, else you are
     * just doing extra memcpys.
     * FIXME: This is badly optimized, will fixup later.
     */
    if (need_flush || len >= io->b.size) {
        /* Write through, skip buffer. */
        PIO_buf_flush(interpreter, layer, io);
        wrote = PIO_write_down(interpreter, PIO_DOWNLAYER(layer), io, s);
        if (wrote == (long)len) {
            io->fpos += wrote;
            return wrote;
        }
        else {
            return (size_t)-1; /* Write error */
        }
    }
    else if (avail > len) {
        io->b.flags |= PIO_BF_WRITEBUF;
        memcpy(io->b.next, buffer, len);
        io->b.next += len;
        io->fpos += len;
        return len;
    }
    else {
        unsigned int diff = (int)(len - avail);

        io->b.flags |= PIO_BF_WRITEBUF;
        /* Fill remainder, flush, then try to buffer more */
        memcpy(io->b.next, buffer, avail);
        io->b.next += avail;
        io->fpos += avail;
        PIO_buf_flush(interpreter, layer, io);
        memcpy(io->b.startb, ((const char *)buffer + avail), diff);
        io->b.next += diff;
        io->fpos += diff;
        return len;
    }
    return (size_t)-1;
}

/*

=item C<static PIOOFF_T
PIO_buf_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
               PIOOFF_T offset, INTVAL whence)>

The buffer layer's C<Seek> function.

=cut

*/

static PIOOFF_T
PIO_buf_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
               PIOOFF_T offset, INTVAL whence)
{
    PIOOFF_T newpos;

    switch (whence) {
    case SEEK_SET:
        newpos = offset;
        break;
    case SEEK_CUR:
        newpos = io->fpos + offset;
        break;
    case SEEK_END:
        newpos = PIO_seek_down(interpreter, PIO_DOWNLAYER(l), io, offset,
                               whence);
        if (newpos == -1)
            return -1;

        break;
    default:
        /* XXX: somehow report the illegal whence value */
        return -1;
    }

    if ((newpos < io->fpos - (io->b.next - io->b.startb))
        || (newpos >= io->fpos + (io->b.endb - io->b.next))) {
        PIO_buf_flush(interpreter, l, io);
        PIO_seek_down(interpreter, PIO_DOWNLAYER(l), io, newpos, SEEK_SET);
    }
    else {
        io->b.next += newpos - io->fpos;
    }

    io->lpos = io->fpos;
    io->fpos = newpos;

    return io->fpos;
}

/*

=item C<static PIOOFF_T
PIO_buf_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

The buffer layer's C<Tell> function.

=cut

*/

static PIOOFF_T
PIO_buf_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    UNUSED(interpreter);
    UNUSED(layer)

    return io->fpos;
}

const ParrotIOLayerAPI pio_buf_layer_api = {
    PIO_buf_init,
    PIO_base_new_layer,
    PIO_base_delete_layer,
    PIO_null_push_layer,
    PIO_null_pop_layer,
    PIO_buf_open,
    PIO_null_open2,
    PIO_null_open3,
    PIO_null_open_async,
    PIO_buf_fdopen,
    PIO_buf_close,
    PIO_buf_write,
    PIO_null_write_async,
    PIO_buf_read,
    PIO_null_read_async,
    PIO_buf_flush,
    PIO_buf_peek,
    PIO_buf_seek,
    PIO_buf_tell,
    PIO_buf_setbuf,
    PIO_buf_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
    0, /* no poll */
    0, /* no socket */
    0, /* no connect */
    0, /* no send */
    0, /* no recv */
    0, /* no bind */
    0, /* no listen */
    0  /* no accept */
};

/*

=back

=head1 SEE ALSO

F<io/io_passdown.c>,
F<io/io_stdio.c>,
F<io/io_unix.c>,
F<io/io_win32.c>,
F<io/io.c>,
F<io/io_private.h>.

=head1 HISTORY

Initially written by Melvin Smith.

Some ideas from AT&T SFIO.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
