/* io_unix.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *      $Id$
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
                        INTVAL hi, INTVAL lo, INTVAL whence);
PIOOFF_T        PIO_unix_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io);


UINTVAL flags_to_unix(UINTVAL flags) {
        UINTVAL oflags;
        oflags = 0;
        if((flags&(PIO_F_WRITE|PIO_F_READ)) == (PIO_F_WRITE|PIO_F_READ)) {
                oflags |= O_RDWR|O_CREAT;
        }
        else if( flags & PIO_F_WRITE ) {
                oflags |= O_WRONLY|O_CREAT;
        }
        else if( flags & PIO_F_READ ) {
                oflags |= O_RDONLY;
        }

        if( flags & PIO_F_APPEND ) {
                oflags |= O_APPEND;
        }
        else if( flags & PIO_F_TRUNC ) {
                oflags |= O_TRUNC;
        }
        return oflags;
}



/*
 * Setup standard streams, etc.
 */
INTVAL PIO_unix_init(theINTERP, ParrotIOLayer * layer) {
        ParrotIOData * d = GET_INTERP_IOD(interpreter);
        if(d != NULL && d->table != NULL ) {
                if((PIO_STDIN(interpreter) =
                        PIO_unix_fdopen(interpreter, layer, STDIN_FILENO, PIO_F_READ))
                        &&(PIO_STDOUT(interpreter) =
                                PIO_unix_fdopen(interpreter, layer, STDOUT_FILENO, PIO_F_WRITE))
                        &&(PIO_STDERR(interpreter) =
                                PIO_unix_fdopen(interpreter, layer, STDERR_FILENO, PIO_F_WRITE))
                )
                return 0;
        }
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
        type = PIO_TYPE_FILE;
        mode = DEFAULT_OPEN_MODE;

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
        }
        else if(oflags&O_CREAT) {
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
        }
        else {
                /* File doesn't exist and O_CREAT not specified */
        }

        if(fd >= 0) {
                /* Set generic flag here if is a terminal then
                 * higher layers can know how to setup buffering.
                 * STDIN, STDOUT, STDERR would be in this case
                 * so we would setup linebuffering.
                 */
                if(PIO_unix_isatty(fd))
                        flags |= PIO_F_CONSOLE;
                io = PIO_new(interpreter, NULL, type, flags, mode);
                io->fd = fd;
                return io;
        }
        return NULL;
}


ParrotIO * PIO_unix_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, UINTVAL flags) {
        ParrotIO * io;
        UINTVAL oflags, mode;   
#ifdef HAS_HEADER_FCNTL
        UINTVAL rflags;
#endif   
        mode = 0;

        oflags = flags_to_unix(flags);
        UNUSED(oflags)

        /* FIXME - Check file handle flags, validity */
#ifdef HAS_HEADER_FCNTL
        /* Get descriptor flags */
        if((rflags = fcntl(fd, F_GETFL, 0)) >= 0) {
                /*int accmode = rflags & O_ACCMODE;*/
                /* Check other flags (APPEND, ASYNC, etc) */
        }
        else {
                /* Probably invalid descriptor */
                return NULL;
        } 
#endif

        if(PIO_unix_isatty(fd))
                flags |= PIO_F_CONSOLE;
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

/*
 * Various ways of determining block size. If passed a descriptor
 * we can use fstat() and the stat buf if available, or the BLKSIZE
 * constant if available at compile time.
 */
INTVAL PIO_unix_getblksize(PIOHANDLE fd) {
        if(fd >= 0) {
                /* Try to get the block size of a regular file */
#if 0
                /*
                 * Is it even worth adding non-portable code here
                 * or should we just estimate a nice buffer size?
                 * Some systems have st_blksize, some don't.
                 */
                {
                        struct stat sbuf;
                        int err;
                        err = fstat(fd, &sbuf);
                        if(err == 0) {
                               return sbuf.st_blksize; 
                        }
                }
#endif
        }
        /* Try to determine it from general means. */
#ifdef BLKSIZE
        return BLKSIZE;
#else
        return PIO_BLKSIZE;
#endif
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

        UNUSED (interpreter); UNUSED (layer);

        for(;;) {
                bytes = read(io->fd, buffer, len);
                if( bytes > 0 )
                        return bytes;
                else if( bytes < 0 ) {
                        switch(errno) {
                                case EINTR:     continue;
                                default:        return bytes;
                        }
                } 
                else {
                        /* Read returned 0, EOF if len requested > 0 */
                        if( len > 0 )
                                io->flags |= PIO_F_EOF;
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

        UNUSED (interpreter); UNUSED (layer);

        ptr = buffer;
        to_write = len;
        bytes = 0;

        write_through:
        while(to_write > 0) {
                if((err = write(io->fd, ptr, to_write)) >= 0 ) {
                                ptr += err;
                                to_write -= err; 
                                bytes += err;
                }
                else {
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
                }
                else {
                        return len;
                }
        }
       
        return -1;
}


/*
 * Hard seek
 * FIXME: 64bit support, ignoring 'hi' 32bits for now
 */
INTVAL PIO_unix_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        INTVAL hi, INTVAL lo, INTVAL whence) {
        PIOOFF_T pos;
        errno = 0;
        /* Whenever Configure defines a constant we can use here. */
#ifndef _HAVE_LARGEFILESUPPORT_BLAH
        if((pos = lseek(io->fd, (PIOOFF_T)lo, whence)) >= 0) {
                io->lpos = io->fpos;
                io->fpos = pos;
        }
#else
        /* Use llseek, lseek64, etc. from Configure */
#endif
        /* Seek clears EOF */
        io->flags &= ~PIO_F_EOF;
        return (((INTVAL)pos != -1) ? 0 : -1);
}


PIOOFF_T PIO_unix_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io) {
        PIOOFF_T pos;
        pos = lseek(io->fd, (PIOOFF_T)0, SEEK_CUR);
        return pos;
}



ParrotIOLayerAPI        pio_unix_layer_api = {
        PIO_unix_init,
        PIO_base_new_layer,
        PIO_base_delete_layer,
        PIO_null_push_layer,
        PIO_null_pop_layer,
        PIO_unix_open,
        PIO_null_open2,
        PIO_null_open3,
        PIO_null_open_async,
        PIO_unix_fdopen,
        PIO_unix_close,
        PIO_unix_write,
        PIO_null_write_async,
        PIO_unix_read,
        PIO_null_read_async,
        PIO_null_flush,
        PIO_unix_seek,
        PIO_unix_tell,
        PIO_null_setbuf,
        PIO_null_setlinebuf,
        PIO_null_getcount,
        PIO_null_fill,
        PIO_unix_puts,
        PIO_null_gets,
        PIO_null_eof
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

