/* io_buf.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *      $Id$
 *  Overview:
 *      The "buf" layer of Parrot IO. Buffering and all the fun stuff.
 *
 *  Data Structure and Algorithms:
 *  History:
 *      Initially written by Melvin Smith
 *  Notes:
 *  References:
 *      Some ideas from AT&T SFIO
 */

#include "parrot/parrot.h"
#include "io_private.h"

/* Defined at bottom */
extern ParrotIOLayerAPI pio_buf_layer_api;

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
                              ParrotIO *io, void *buffer, size_t len);
static size_t    PIO_buf_write(theINTERP, ParrotIOLayer *l,
                               ParrotIO *io, const void *buffer, size_t len);
static INTVAL    PIO_buf_puts(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                              const char *s);
static INTVAL    PIO_buf_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                              INTVAL hi, INTVAL lo, INTVAL whence);
static PIOOFF_T  PIO_buf_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static size_t    PIO_buf_fill_readbuf(theINTERP, ParrotIOLayer *l,
                                      ParrotIO *io, ParrotIOBuf *b);
static size_t    PIO_buf_readline(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                                  void *buffer, size_t len);


/* XXX: This is not portable */
#define DEFAULT_RECSEP '\n'
#define IS_EOL(io,c) (io->recsep == (*c))
/*
#define IS_EOL(io,c) ((*c) == '\n')
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
 * Don't pass setbuf() calls down the stack, top layer wins.
 * This doesn't mean other layers can't buffer, I just need to
 * think about the mechanism for buffer control or if it even
 * makes sense this way. Most layers will not implement setbuf()...
 */
static INTVAL
PIO_buf_setbuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io, size_t bufsize)
{
    ParrotIOLayer *l = layer;
    ParrotIOBuf *b = &io->b;
    /* If there is a buffer, make sure we flush before
     * dinking around with the buffer.
     */
    if (b->startb)
        PIO_buf_flush(interpreter, l, io);

    /* Choose an appropriate buffer size for caller */
    if (bufsize == PIO_UNBOUND) {
        b->size = PIO_getblksize(io->fd);
    }
    else {
        b->size = (bufsize >= PIO_GRAIN ? bufsize : PIO_GRAIN);
    }

    if (b->startb && (b->flags & PIO_BF_MALLOC)) {
        mem_sys_free(b->startb);
        b->startb = b->next = NULL;
    }

    if (b->size > 0) {
        b->startb = b->next = mem_sys_allocate(b->size);
        b->flags |= PIO_BF_MALLOC;
    }

    if (bufsize != 0)
        io->flags |= PIO_F_BLKBUF;
    else
        io->flags &= ~(PIO_F_BLKBUF | PIO_F_LINEBUF);

    return 0;
}


static INTVAL
PIO_buf_setlinebuf(theINTERP, ParrotIOLayer *l, ParrotIO *io)
{
    int err;

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

    if (PIO_isatty(fd))
        PIO_buf_setlinebuf(interpreter, l, io);
    else
        PIO_buf_setbuf(interpreter, l, io, PIO_UNBOUND);

    return io;
}


static INTVAL
PIO_buf_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    ParrotIOLayer *l = PIO_DOWNLAYER(layer);
    PIO_buf_flush(interpreter, layer, io);

    return PIO_close_down (interpreter, l, io);
}


static INTVAL
PIO_buf_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    long wrote;
    size_t to_write;
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
        wrote = PIO_write_down(interpreter, PIO_DOWNLAYER(l), io,
                               io->b.startb, to_write);
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
    else {
        /* Read flush */
        io->b.flags &= ~PIO_BF_READBUF;
        io->b.next = io->b.startb;
    }
    return -1;
}


static size_t
PIO_buf_fill_readbuf(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                     ParrotIOBuf *b)
{
    size_t got;
    got = PIO_read_down(interpreter, PIO_DOWNLAYER(layer), 
                        io, b->startb, b->size);
 
    /* nothing to get */
    if (got == 0)
        return 0;

    b->endb = b->startb + got;
    b->next = b->startb;

    b->flags |= PIO_BF_READBUF;

    return got;
}


static size_t
PIO_buf_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               void *buffer, size_t len)
{
    ParrotIOLayer *l = layer;
    ParrotIOBuf *b;
    unsigned char *out_buf = buffer;
    size_t current = 0;

    /* write buffer flush */
    if (io->b.flags & PIO_BF_WRITEBUF) {
        PIO_buf_flush(interpreter, layer, io);
    }

    b = &io->b;

    /* line buffered read */
    if (io->flags & PIO_F_LINEBUF) {
        return PIO_buf_readline(interpreter, layer, io, buffer, len);
    }

    /* read Data from buffer */
    if (b->flags & PIO_BF_READBUF) {
        size_t avail = b->endb - b->next;

        current = avail < len ? avail : len;
        memcpy(out_buf, b->next, current);
        b->next += current;

        /* buffer completed */
        if (current == avail) {
            io->b.flags &= ~PIO_BF_READBUF;
            /* XXX: Is the reset of next and endb really necessary ? */
            io->b.endb = NULL;
            io->b.next = io->b.startb;
        }

        if (len == current) {
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
            return current + PIO_read_down(interpreter, PIO_DOWNLAYER(l), 
                                           io, buffer, len);
        }

        got = PIO_buf_fill_readbuf(interpreter, l, io, b);

        len = len < got ? len : got;
    }

    /* read from the read_buffer */
    memcpy(out_buf, io->b.next, len);
    io->b.next += len;

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
PIO_buf_readline(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                 void *buffer, size_t len)
{
    size_t l = 0;
    unsigned char *out_buf = buffer;
    unsigned char *buf_start;
    ParrotIOBuf *b = &io->b;    

    /* fill empty buffer */
    if (!(b->flags & PIO_BF_READBUF)) {
        if (PIO_buf_fill_readbuf(interpreter, layer, io, b) == 0) 
            return 0;
    }

    buf_start = b->next;
    while (l++ < len) {
        if (IS_EOL(io, b->next++)) {
            break;
        } 
        /* buffer completed; copy out and refill */
        if (b->next == b->endb) {
            memcpy(out_buf, buf_start, b->endb - buf_start);
            out_buf += b->endb - buf_start;
            if (PIO_buf_fill_readbuf(interpreter, layer, io, b) == 0)
                return l;
            buf_start = b->startb;
        }
    }
    memcpy(out_buf, buf_start, b->endb - buf_start);

    /* check if buffer is finished */
    if (b->next == b->endb) {
        b->next = b->startb;
        b->endb = NULL;
        b->flags &= ~PIO_BF_READBUF;
    }

    return l;
}


static size_t
PIO_buf_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                const void *buffer, size_t len)
{
    size_t avail;
    long wrote;

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

    /*
     * Large writes (multiples of blocksize) should write
     * through generally for best performance, else you are
     * just doing extra memcpys.
     * FIXME: This is badly optimized, will fixup later.
     */
    if (len >= io->b.size) {
        /* Write through, skip buffer. */
        PIO_buf_flush(interpreter, layer, io);
        wrote = PIO_write_down(interpreter, PIO_DOWNLAYER(layer), io, buffer, 
                               len);
        if (wrote == (long)len)
            return wrote;
        else {
            /* FIXME: Write error */
        }
    }
    else if (avail > len) {
        io->b.flags |= PIO_BF_WRITEBUF;
        memcpy(io->b.next, buffer, len);
        io->b.next += len;
        return len;
    }
    else {
        unsigned int diff = (int)(len - avail);

        io->b.flags |= PIO_BF_WRITEBUF;
        /* Fill remainder, flush, then try to buffer more */
        memcpy(io->b.next, buffer, diff);
        PIO_buf_flush(interpreter, layer, io);
        memcpy(io->b.startb, ((const char *)buffer + diff), len - diff);
        io->b.next = io->b.startb + (len - diff);
        return len;
    }
    return (size_t)-1;
}


static INTVAL
PIO_buf_puts(theINTERP, ParrotIOLayer *layer, ParrotIO *io, const char *s)
{
    ParrotIOLayer *l = layer;
    while ((l = PIO_DOWNLAYER(l)) != NULL) {
        if (l->api->PutS) {
            return (*l->api->PutS) (interpreter, l, io, s);
        }
    }
    return 0;
}


static INTVAL
PIO_buf_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
               INTVAL hi, INTVAL lo, INTVAL whence)
{
    int hardseek = 0;
    UNUSED(hardseek)

        if (io->flags & PIO_F_SHARED ||
            !(io->flags & (PIO_F_BLKBUF | PIO_F_LINEBUF))) {
        hardseek = 1;
    }

    if (io->b.flags & (PIO_BF_READBUF | PIO_BF_WRITEBUF)) {
        /* FIXME: Flush on seek for now */
        PIO_buf_flush(interpreter, l, io);
    }

    /*
     * TODO : Try to satisfy seek request in buffer if possible,
     * else make IO request.
     */
    internal_exception(PIO_NOT_IMPLEMENTED, "Seek not implemented");
    return -1;
}


static PIOOFF_T
PIO_buf_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io)
{
    return io->fpos;
}



ParrotIOLayerAPI pio_buf_layer_api = {
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
    PIO_null_seek,
    PIO_null_tell,
    PIO_buf_setbuf,
    PIO_buf_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_buf_puts,
    PIO_null_gets,
    PIO_null_eof
};



/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
