/* io_unix.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *  Overview:
 *      This is the Parrot IO UNIX layer. May be changed to
 *      include other platforms if that platform is similar 
 *      enough to keep from smudging, else implement seperate layer.
 *      For UNIX systems this is the low level OS layer (unbuffered).
 *  Data Structure and Algorithms:
 *  History:
 *      Initially written by Melvin Smith (mrjoltcola@mindspring.com)
 *  Notes:
 *  References:
 *      APitUE - W. Richard Stevens, AT&T SFIO, Perl5 (Nick Ing-Simmons)
 */

#include "parrot/parrot.h"

/* Configure doesn't generate a generic UNIX define yet */
#ifndef WIN32

/* Defined at bottom */
extern ParrotIOLayerAPI        pio_unix_layer_api;

ParrotIOLayer           pio_unix_layer = {
        NULL,
        "unix",
        PIO_L_TERMINAL,
        &pio_unix_layer_api,
        0, 0
};


/*
 * Currently keeping layer prototypes local to each layer
 * file.
 */
UINTVAL         flags_to_unix(UINTVAL flags);

INTVAL          PIO_unix_init(theINTERP, ParrotIOLayer * layer);
ParrotIO *      PIO_unix_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, UINTVAL flags);
ParrotIO *      PIO_unix_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, UINTVAL flags);
INTVAL          PIO_unix_close(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
void            PIO_unix_flush(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
size_t          PIO_unix_read(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, void * buffer, size_t len);
size_t          PIO_unix_write(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, const void * buffer, size_t len);
INTVAL          PIO_unix_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        const char * s);
INTVAL          PIO_unix_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        off_t offset, INTVAL whence);
off_t           PIO_unix_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io);


UINTVAL flags_to_unix(UINTVAL flags) {
        UINTVAL oflags;
        oflags = 0;
        if((flags&(PIO_F_WRITE|PIO_F_READ)) == (PIO_F_WRITE|PIO_F_READ)) {
                oflags |= O_RDWR|O_CREAT;
        } else if( flags & PIO_F_WRITE ) {
                oflags |= O_WRONLY|O_CREAT;
        } else if( flags & PIO_F_READ ) {
                oflags |= O_RDONLY;
        }

        if( flags & PIO_F_APPEND ) {
                oflags |= O_APPEND;
        } else if( flags & PIO_F_TRUNC ) {
                oflags |= O_TRUNC;
        }
        return oflags;
}



/*
 * Setup standard streams, etc.
 */
INTVAL PIO_unix_init(theINTERP, ParrotIOLayer * layer) {
        if((pio_stdin=PIO_fdopen(interpreter, STDIN_FILENO, "<"))
                &&(pio_stdout=PIO_fdopen(interpreter, STDOUT_FILENO, ">"))
                &&(pio_stderr=PIO_fdopen(interpreter, STDERR_FILENO, ">"))
                )
                return 0;
        return -1;
}


/*
 * Open modes (read, write, append, etc.) are done in pseudo-Perl
 * style using <, >, etc.
 */
ParrotIO * PIO_unix_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, UINTVAL flags) {
        ParrotIO * io;
        UINTVAL mode;
        INTVAL oflags, type;
        PIOHANDLE fd;
        const char * modeptr;
        type = PIO_TYPE_FILE;
        mode = DEFAULT_OPEN_MODE;
#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "PIO_unix_open: %s, %s\n",
                                spath, modeptr);
        }
#endif
        if( (flags & (PIO_F_WRITE|PIO_F_READ)) == 0 )
                return NULL;

        oflags = flags_to_unix(flags);

        /* Only files for now */
        flags |= PIO_F_FILE;

        /* Try open with no create first */
        while((fd = open(spath, oflags&(O_WRONLY|O_RDWR), mode)) < 0
                        && errno == EINTR )
                errno = 0;

        /* File open */
        if(fd >= 0){
                /*
                 * Now check if we specified O_CREAT|O_EXCL or not.
                 * If so, we must return NULL, else either use the
                 * descriptor or create the file.
                 */
                if((oflags&(O_CREAT|O_EXCL)) == (O_CREAT|O_EXCL)) {
                        close(fd);
                        return NULL;
                }
                /*
                 * Check for truncate?
                 */
                if(oflags&O_TRUNC) {
                        int tfd;
                        while((tfd = creat(spath, PIO_DEFAULTMODE)) < 0
                                        && errno == EINTR)
                                errno = 0;
                        close(tfd);
                }
        } else if(oflags&O_CREAT) {
                /* O_CREAT and file doesn't exist. */
                while((fd = creat(spath, PIO_DEFAULTMODE)) < 0
                                && errno == EINTR)
                        errno = 0;
                if(!(oflags&O_WRONLY)) {
                        close(fd);
                        /*
                         * File created, reopen with read+write
                         */
                        while((fd = open(spath, oflags&(O_WRONLY|O_RDWR),
                                        mode)) < 0 && errno == EINTR )
                                errno = 0;
                }
        } else {
#if 0
                if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                        char * errstr = strerror( errno );
                        fprintf(stderr, "PIO_unix_open: %s",
                                errstr );
                }
#endif
        }

        if(fd >= 0) {
                /*
                 * Finally we have a descriptor, create an IO stream
                 */
                io = PIO_new(interpreter, NULL, type, flags, mode);
#if 0
                /* Set generic flag here if is a terminal then
                 * higher layers can know how to setup buffering.
                 * STDIN, STDOUT, STDERR would be in this case
                 * so we would setup linebuffering.
                 */
                if( isatty(fd) )
                        flags |= PIO_F_CONSOLE;
#endif
                io->fd = fd;
                io->flags = flags;
                return io;
        }
        return NULL;
}


ParrotIO * PIO_unix_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, UINTVAL flags) {
        ParrotIO * io;
        UINTVAL oflags, rflags, mode;
        mode = 0;

        oflags = flags_to_unix(flags);

        /* FIXME - Check file handle flags, validity */
#ifdef HAD_HEADER_FCNTL
        /* Get descriptor flags */
        if((rflags = fcntl(fd, F_GETFL, 0)) >= 0) {
                /*int accmode = rflags & O_ACCMODE;*/
                /* Check other flags (APPEND, ASYNC, etc) */
        } else {
                /* Probably invalid descriptor */
                return NULL;
        } 
#endif

#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "PIO_unix_fdopen: %d\n", (int)fd );
        }
#endif
        /* FIXME: Add mode string parser from PIO_unix_open() here,
         * possibly need a seperate function for it.
         */
        io = PIO_new(interpreter, NULL, PIO_F_FILE, flags, mode);
        io->fd = fd;
        return io;
}


INTVAL PIO_unix_close(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
        if( io->fd >= 0 )
                close( io->fd );
        io->fd = -1;
	return 0;
}


INTVAL PIO_unix_isatty(PIOHANDLE fd) {
        return isatty(fd);
}

/* At lowest layer all we can do for flush is ask kernel to sync().
 */
void PIO_unix_flush(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
#if 0
        fsync(io->fd);
#endif
}


size_t PIO_unix_read(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
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


size_t PIO_unix_write(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
			const void * buffer, size_t len) {
        int err;
        size_t bytes;
        size_t to_write;
        const char * ptr;
#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "PIO_unix_write(fd=%d): %d bytes\n",
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
                                fprintf(stderr, "PIO_unix_write: wrote %d bytes\n", err );
#endif
                } else {
                        switch(errno) {
                                case EINTR:     goto write_through;
#ifdef EAGAIN
                                case EAGAIN:    return bytes;
#endif
                                default:        return (size_t)-1;
                        }
                }
        }
	return bytes;
}


INTVAL PIO_unix_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                                const char * s) {
        size_t len;
        len = strlen(s);
        if( len > 0 ) {
                size_t sz;
                sz = PIO_unix_write(interpreter, l, io, s, len);
                if( sz < len ) {
                        return -1;
                } else {
                        return len;
                }
        }
       
        return -1;
}


/*
 * Hard seek
 */
INTVAL PIO_unix_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        off_t offset, INTVAL whence) {
        io->fpos = lseek(io->fd, offset, whence);
        return io->fpos;
}


off_t PIO_unix_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io) {
        off_t p;
        p = lseek(io->fd, (off_t)0, SEEK_CUR);
        return p;
}



ParrotIOLayerAPI        pio_unix_layer_api = {
        PIO_unix_init,
        PIO_base_new_layer,
        PIO_base_delete_layer,
        NULL,
        NULL,
        PIO_unix_open,
        NULL,
        NULL,
        NULL,
        PIO_unix_fdopen,
        PIO_unix_close,
        PIO_unix_write,
        NULL,
        PIO_unix_read,
        NULL,
        NULL,
        PIO_unix_seek,
        PIO_unix_tell,
        NULL,
        NULL,
        NULL,
        NULL,
        PIO_unix_puts,
        NULL 
};


#endif /* WIN32 */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

