/* io_stdio.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *      $Id$
 *  Overview:
 *      The "STDIO" layer of Parrot IO. Buffering and all the fun stuff.
 *
 *  Data Structure and Algorithms:
 *  History:
 *      Initially written by Melvin Smith
 *  Notes:
 *  References:
 *      Some ideas from AT&T SFIO
 */

#include "parrot/parrot.h"

/* Defined at bottom */
extern ParrotIOLayerAPI        pio_stdio_layer_api;

ParrotIOLayer           pio_stdio_layer = {
        NULL,
        "stdio",
        PIO_L_TERMINAL,
        &pio_stdio_layer_api,
        0, 0
};


/*
 * Currently keeping layer prototypes local to each layer
 * file.
 */

INTVAL          PIO_stdio_init(theINTERP, ParrotIOLayer * l);
ParrotIO *      PIO_stdio_open(theINTERP, ParrotIOLayer * l,
			const char * path, UINTVAL flags);
INTVAL          PIO_stdio_setbuf(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io, size_t bufsize);
INTVAL          PIO_stdio_setlinebuf(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io);
ParrotIO *      PIO_stdio_fdopen(theINTERP, ParrotIOLayer * l,
		        PIOHANDLE fd, UINTVAL flags);
INTVAL          PIO_stdio_close(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io);
void            PIO_stdio_flush(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io);
size_t          PIO_stdio_read(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io, void * buffer, size_t len);
size_t          PIO_stdio_write(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io, const void * buffer, size_t len);
INTVAL          PIO_stdio_puts(theINTERP, ParrotIOLayer *l, ParrotIO * io,
                        const char * s);
INTVAL          PIO_stdio_seek(theINTERP, ParrotIOLayer *l, ParrotIO * io,
                        INTVAL hi, INTVAL lo, INTVAL whence);
PIOOFF_T        PIO_stdio_tell(theINTERP, ParrotIOLayer * l,
                        ParrotIO * io);

/* Local util functions */
size_t          PIO_stdio_writethru(theINTERP, ParrotIOLayer * layer,
                ParrotIO * io, const void * buffer, size_t len);




INTVAL PIO_stdio_init(theINTERP, ParrotIOLayer * layer) {
        if(PIO_STDOUT(interpreter))
                PIO_stdio_setlinebuf(interpreter, layer, PIO_STDOUT(interpreter));
        if(PIO_STDIN(interpreter))
                PIO_stdio_setbuf(interpreter, layer, PIO_STDIN(interpreter), PIO_UNBOUND);
        return 0;
}


ParrotIO * PIO_stdio_open(theINTERP, ParrotIOLayer * layer,
			const char * path, UINTVAL flags) {
        ParrotIO * io;
        ParrotIOLayer * l = layer;
        while(l) {
                if(l->api->Open) {
                        io = (*l->api->Open)(interpreter, l, path, flags);
                        /*
                         * We have an IO stream now setup stuff
                         * for our layer before returning it.
                         */
                        PIO_stdio_setbuf(interpreter, l, io, PIO_UNBOUND);
                        return io;
                }
                l = PIO_DOWNLAYER(l);
        }
        return NULL;
}


/*
 * Don't pass setbuf() calls down the stack, top layer wins.
 * This doesn't mean other layers can't buffer, I just to
 * think about the mechanism for buffer control or if it even
 * makes sense this way. Most layers will not implement setbuf()...
 */
INTVAL PIO_stdio_setbuf(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                                        size_t bufsize) {
        ParrotIOLayer * l = layer;
        ParrotIOBuf * b = &io->b;
        /* If there is a buffer, make sure we flush before
         * dinking around with the buffer.
         */
        if(b->startb)
                PIO_stdio_flush(interpreter, l, io);

        /* Choose an appropriate buffer size for caller */
        if( bufsize == PIO_UNBOUND ) {
                b->size = PIO_getblksize(io->fd);
        }
        else {
                b->size = (bufsize >= PIO_GRAIN ? bufsize : PIO_GRAIN);
        }

        if(b->startb && (b->flags & PIO_BF_MALLOC)) {
                free(b->startb);
                b->startb = b->next = NULL;
        }

        if(b->size > 0) {
                b->startb = b->next = malloc(b->size);
                b->flags |= PIO_BF_MALLOC;
        }

        if(bufsize != 0)
                io->flags |= PIO_F_BLKBUF;
        else
                io->flags &= ~(PIO_F_BLKBUF|PIO_F_LINEBUF);

        return 0;
}


INTVAL PIO_stdio_setlinebuf(theINTERP, ParrotIOLayer * l, ParrotIO * io) {
        /* Reuse setbuf call */
        int err;
        if((err = PIO_stdio_setbuf(interpreter, l, io,
                        PIO_LINEBUFSIZE)) >= 0) {
                /* Then switch to linebuf */
                io->flags &= ~PIO_F_BLKBUF;
                io->flags |= PIO_F_LINEBUF;
                return 0;
        }
        return err;
}


ParrotIO * PIO_stdio_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, UINTVAL flags) {
        ParrotIO * io;
        ParrotIOLayer * l = PIO_DOWNLAYER(layer);
        while(l) {
                if(l->api->FDOpen) {
                        io = (*l->api->FDOpen)(interpreter, l, fd, flags);
                        if(PIO_isatty(fd))
                                PIO_stdio_setlinebuf(interpreter, l, io);
                        else
                                PIO_stdio_setbuf(interpreter, l, io,
                                                        PIO_UNBOUND);
                        return io;
                }
                l = PIO_DOWNLAYER(l);
        }
        return NULL;
}


INTVAL PIO_stdio_close(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
        ParrotIOLayer * l = PIO_DOWNLAYER(layer);
        PIO_stdio_flush(interpreter, layer, io);
        while(l) {
                if(l->api->Close) {
                        return (*l->api->Close)(interpreter,l,io);
                }
                l = PIO_DOWNLAYER(l);
        }
        return 0;
}


void PIO_stdio_flush(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
        long    wrote;
        size_t  to_write;
        /*
         * Either buffering is null, disabled, or empty.
         */
        if(!io->b.startb
                || (io->flags&(PIO_F_BLKBUF|PIO_F_LINEBUF)) == 0
                || (io->b.flags&(PIO_BF_WRITEBUF|PIO_BF_READBUF)) == 0)
                return;
        /*
         * Write flush
         */
        if(io->b.flags & PIO_BF_WRITEBUF) {
                ParrotIOLayer * l = layer;
                to_write = io->b.next - io->b.startb;

                /* Flush to next layer */
                wrote = PIO_stdio_writethru(interpreter, l, io,
                                                io->b.startb, to_write);
                if(wrote == (long)to_write) {
                        io->b.next = io->b.startb;
                        /* Release buffer */
                        io->b.flags &= ~PIO_BF_WRITEBUF;
                        return;
                }
                else {
                        /* FIXME: I/O Error */
                }
        } else  {
                /* Read flush */
                io->b.flags &= ~PIO_BF_READBUF;
                io->b.next = io->b.startb;
        }
}


size_t PIO_stdio_read(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
		                void * buffer, size_t len) {
        UNUSED (interpreter); UNUSED (layer); UNUSED (io);
        UNUSED (buffer); UNUSED (len);
        return 0;
}


size_t PIO_stdio_write(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
			const void * buffer, size_t len) {
        size_t  avail;
        long    wrote;
        ParrotIOLayer * l;

        if(len <= 0)
                return 0;
        if(io->b.flags & PIO_BF_WRITEBUF) {
                avail = io->b.size - (io->b.next - io->b.startb);
        } else if(io->b.flags & PIO_BF_READBUF) {
                io->b.flags |= ~PIO_BF_READBUF;
                io->b.next = io->b.startb;
                avail = io->b.size;
        } else {
                avail = io->b.size;
        }

        /*
         * Large writes (multiples of blocksize) should write
         * through generally for best performance, else you are
         * just doing extra memcpys.
         * FIXME: This is badly optimized, will fixup later.
         */
        if(len >= io->b.size) {
                /* Write through, skip buffer. */
                PIO_stdio_flush(interpreter, layer, io);
                wrote = PIO_stdio_writethru(interpreter, layer, io,
                                                buffer, len);
                if(wrote == (long)len)
                        return wrote; 
                else {
                        /* FIXME: Write error */
                }
        } else if(avail > len) {
                memcpy(io->b.next, buffer, len);
                io->b.next += len;
                return len;
        } else {
                /* Fill remainder, flush, then try to buffer more */
                unsigned int diff = (int)(len - avail);
                memcpy(io->b.next, buffer, diff);
                /* We don't call flush here because it clears flag */
                wrote = PIO_stdio_writethru(interpreter, layer, io,
                                                io->b.startb, io->b.size);
                memcpy(io->b.startb, ((const char *)buffer + diff),
                                        len - diff);
                io->b.next = io->b.startb + (len - diff);
                return len;
        } 
        return (size_t)-1;
}


/*
 * Skip buffers, write through.
 * PIO_stdio_flush() should directly precede a call to this func.
 */
size_t PIO_stdio_writethru(theINTERP, ParrotIOLayer * layer,
                ParrotIO * io, const void * buffer, size_t len) {
        ParrotIOLayer * l;
        l = layer;
        while((l = PIO_DOWNLAYER(l)) != NULL) {
                if(l->api->Write)
                        return (*l->api->Write)(interpreter, l, io,
                                buffer, len);
        }
        return (size_t)-1;
}


INTVAL PIO_stdio_puts(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                                const char * s) {
        ParrotIOLayer * l = layer;
        while((l = PIO_DOWNLAYER(l)) != NULL) {
                if( l->api->PutS ) {
                        return (*l->api->PutS)(interpreter, l, io, s);
                }
        }
        return 0;
}


INTVAL PIO_stdio_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        INTVAL hi, INTVAL lo, INTVAL whence) {
        int hardseek = 0;

        if( io->flags&PIO_F_SHARED ||
                !(io->flags&(PIO_F_BLKBUF|PIO_F_LINEBUF))) {
                hardseek = 1;
        }

        if(io->b.flags & (PIO_BF_READBUF|PIO_BF_WRITEBUF)) {
                /* FIXME: Flush on seek for now */
                PIO_stdio_flush(interpreter, l, io);
        }

        /*
         * TODO : Try to satisfy seek request in buffer if possible,
         * else make IO request.
         */
        internal_exception(PIO_NOT_IMPLEMENTED, "Seek not implemented");
        return -1;
}


PIOOFF_T PIO_stdio_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io) {
        return io->fpos;
}



ParrotIOLayerAPI        pio_stdio_layer_api = {
        PIO_stdio_init,
        PIO_base_new_layer,
        PIO_base_delete_layer,
        NULL,
        NULL,
        PIO_stdio_open,
        NULL,
        NULL,
        NULL,
        PIO_stdio_fdopen,
        PIO_stdio_close,
        PIO_stdio_write,
        NULL,
        PIO_stdio_read,
        NULL,
        NULL,
        NULL,
        NULL,
        PIO_stdio_setbuf,
        PIO_stdio_setlinebuf,
        NULL,
        NULL,
        PIO_stdio_puts,
        NULL,
        NULL
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

