/* io_os.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *  Overview:
 *      This is the Parrot IO UNIX layer. May be changed to be
 *      the "generic OS" layer when we see how much we can share
 *      between platforms without smudging... 
 *      For UNIX systems (and some others) this is the low level
 *      OS layer (unbuffered).
 *  Data Structure and Algorithms:
 *  History:
 *      Initially written by Melvin Smith
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* Defined at bottom */
extern ParrotIOLayerAPI        pio_os_layer_api;

ParrotIOLayer           pio_os_layer = {
        NULL,
        "os",
        PIO_L_TERMINAL,
        &pio_os_layer_api,
        0, 0
};


/*
 * Currently keeping layer prototypes local to each layer
 * file.
 */

ParrotIO *      PIO_os_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, const char * smode);
ParrotIO *      PIO_os_fdopen(theINTERP, ParrotIOLayer * layer,
		        INTVAL fd, const char * smode);
INTVAL          PIO_os_close(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
void            PIO_os_flush(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
size_t          PIO_os_read(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, void * buffer, size_t len);
size_t          PIO_os_write(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, const void * buffer, size_t len);
INTVAL          PIO_os_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        const char * s);




/*
 * Open modes (read, write, append, etc.) are done in pseudo-Perl
 * style using <, >, etc.
 */
ParrotIO * PIO_os_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, const char * smode) {
        ParrotIO * io;
        int flags, type, mode, fd;
        const char * modeptr;
        type = PIO_TYPE_FILE;
        flags = 0;
        mode = DEFAULT_OPEN_MODE;
        modeptr = smode;
#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "PIO_os_open: %s, %s\n",
                                spath, modeptr);
        }
#endif
        /* Set mode flags - <, >, >>, +<, +> */
        /* add ? and ! for block/non-block */
        switch(*modeptr) {
                case '+':
                        flags = O_RDWR;
                        break;
                case '<':
                        flags = O_RDONLY;
                        break;
                case '>':       
                        flags = O_WRONLY | O_CREAT;
                        if( *(++modeptr) == '>')
                                flags |= O_APPEND;
                        else if(*modeptr != 0)
                                return 0;
                        else flags |= O_TRUNC;
                        break;
                default:
                        return 0;
        }

        if((fd = open((const char *)spath, flags, mode)) != -1 ){
                io = new_io_header(interpreter, type, flags, mode);
                io->fd = fd;
                return io;
        } else {
                /* Error.. */
                if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                        char * errstr = strerror( errno );
#if 0
                        fprintf(stderr, "PIO_os_open: %s",
                                errstr );
#endif
                }
                /* Not Reached */ 
        }

        return 0;
}


ParrotIO * PIO_os_fdopen(theINTERP, ParrotIOLayer * layer,
		        INTVAL fd, const char * smode) {
        ParrotIO * io;
        INTVAL flags, mode;
        flags = 0;
        mode = 0;

        /* FIXME - Check file handle specifics, validity */
        /* Need to make this portable, I haven't checked this
         * on non-UNIX.
         */
#if 0
        /* Get descriptor flags */
        if((flags = fcntl(fd, F_GETFL, 0)) >= 0) {
                /*int accmode = flags & O_ACCMODE;*/
                /* Check other flags (APPEND, ASYNC, etc) */
        } else {
                /* Probably invalid descriptor */
                return NULL;
        } 
#endif
        io = new_io_header(interpreter, PIO_TYPE_FILE, flags, mode);
        io->fd = fd;
        io->buftype = PIO_BUFTYPE_NONE;
        return io;
}


INTVAL PIO_os_close(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "PIO_os_close: %d\n", (int)io->fd );
        }
#endif
        close( io->fd );
        io->fd = -1;
	return 0;
}


/* At lowest layer all we can do for flush is ask kernel to sync().
 * How portable is fsync() ? It is POSIX at least.
 * Can also be accomplished by O_SYNC on file handle.
 */
void PIO_os_flush(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
#if 0
        /* UNIX and VMS have fsync, does win32? */
        fsync(io->fd);
#endif
}


size_t PIO_os_read(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
		                void * buffer, size_t len) {
        int bytes;
        for(;;) {
                bytes = read(io->fd, buffer, len);
                if( bytes > 0 )
                        return bytes;
                else if( bytes < 0 ) {
                        switch(errno) {
                                case EINTR:     continue;
                                default:        return bytes;
                        }
                } else {
                        /* Set EOF flag */
                        return bytes;
                }
        }
	return bytes;
}


size_t PIO_os_write(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
			const void * buffer, size_t len) {
        int err;
        size_t bytes;
        size_t to_write;
        const char * ptr;
#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "ParrotIO_os_write(fd=%d): %d bytes\n",
                        io->fd, len );
        }
#endif
        ptr = buffer;
        to_write = len;
        bytes = 0;

        write_through:
        while(to_write > 0) {
                if((err = write(io->fd, ptr, to_write)) >= 0 ) {
                                ptr += err;
                                to_write -= err; 
                                bytes += err;
#if 0
                                fprintf(stderr, "ParrotIO_os_write: wrote %d bytes\n", err );
#endif
                } else {
                        switch(errno) {
                                case EINTR:     goto write_through;
#ifdef EAGAIN
                                case EAGAIN:    return bytes;
#endif
                                default:        return -1;
                        }
                }
        }
	return bytes;
}


INTVAL PIO_os_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                                const char * s) {
        size_t len;
        len = strlen(s);
        if( len > 0 ) {
                size_t sz;
                sz = PIO_os_write(interpreter, l, io, s, len);
                if( sz < len ) {
                        return -1;
                } else {
                        return len;
                }
        }
       
        return -1;
}



ParrotIOLayerAPI        pio_os_layer_api = {
        PIO_base_init,
        PIO_base_new_layer,
        PIO_base_delete_layer,
        NULL,
        NULL,
        PIO_os_open,
        NULL,
        NULL,
        NULL,
        PIO_os_fdopen,
        PIO_os_close,
        PIO_os_write,
        NULL,
        PIO_os_read,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        PIO_os_puts,
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

