/* io_win32.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *  Overview:
 *      This is the Parrot IO OS layer for Win32 platforms.
 *  Data Structure and Algorithms:
 *  History:
 *      Initially written by Melvin Smith
 *  Notes:
 *  References:
 *      Win32 System Programming, 2nd Edition
 */

#include "parrot/parrot.h"

#ifdef WIN32

/* Defined at bottom */
extern ParrotIOLayerAPI        pio_win32_layer_api;

ParrotIOLayer           pio_win32_layer = {
        NULL,
        "win32",
        PIO_L_TERMINAL,
        &pio_win32_layer_api,
        0, 0
};


/*
 * Currently keeping layer prototypes local to each layer
 * file.
 */

INTVAL          PIO_win32_init(theINTERP, ParrotIOLayer * layer);
ParrotIO *      PIO_win32_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, UINTVAL flags);
ParrotIO *      PIO_win32_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, const char * smode);
INTVAL          PIO_win32_close(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
void            PIO_win32_flush(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
size_t          PIO_win32_read(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, void * buffer, size_t len);
size_t          PIO_win32_write(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, const void * buffer, size_t len);
INTVAL          PIO_win32_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        const char * s);
INTVAL          PIO_win32_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        off_t offset, INTVAL whence);
off_t           PIO_win32_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io);


/* Convert to platform specific bit open flags */
UINTVAL flags_to_win32(UINTVAL flags, DWORD * fdwAccess,
                        DWORD * fdwShareMode, DWORD * fdwCreate) {
        if((flags&(PIO_F_WRITE|PIO_F_READ)) == (PIO_F_WRITE|PIO_F_READ)) {
                *fdwAccess = GENERIC_WRITE|GENERIC_READ;
                *fdwCreate = OPEN_ALWAYS|CREATE_ALWAYS; 
        } else if( flags & PIO_F_WRITE ) {
                *fdwAccess = GENERIC_WRITE;
                *fdwCreate = OPEN_ALWAYS|CREATE_ALWAYS; 
        } else if( flags & PIO_F_READ ) {
                *fdwAccess = GENERIC_READ;
                *fdwCreate = OPEN_ALWAYS|CREATE_ALWAYS; 
        }

        /* Temporary */
        *fdwShareMode = 0;

        if( (flags & PIO_F_TRUNC) && (flags & PIO_F_WRITE) )
                *fdwCreate |= TRUNCATE_EXISTING;
        else if( flags & PIO_F_APPEND ) {
                /* FIXME - I don't think Win32 has an O_APPEND
                 * so just open then seek to end.
                 */
        }

        return 1;
}


/*
 * Setup standard streams.
 */
INTVAL PIO_win32_init(theINTERP, ParrotIOLayer * layer) {
        HANDLE h;
        if((h = GetStdHandle(STD_INPUT_HANDLE)) != INVALID_HANDLE_VALUE) {
                pio_stdin = PIO_win32_fdopen(interpreter, layer, h, "<");
        }
        if((h = GetStdHandle(STD_OUTPUT_HANDLE))
                                        != INVALID_HANDLE_VALUE){
                pio_stdout = PIO_win32_fdopen(interpreter, layer, h, ">");
        }
        if((h = GetStdHandle(STD_ERROR_HANDLE)) != INVALID_HANDLE_VALUE) {
                pio_stderr = PIO_win32_fdopen(interpreter, layer, h, ">");
        }

        if(pio_stdin && pio_stdout && pio_stderr)
                return 0;
        return -1;
}


ParrotIO * PIO_win32_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, UINTVAL flags) {
        ParrotIO * io;
        int type;
        PIOHANDLE fd;
        DWORD fAcc, fShare, fCreat;
        type = PIO_TYPE_FILE;
#if 0
        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                fprintf(stderr, "PIO_win32_open: %s, %s\n",
                                spath, modeptr);
        }
#endif
        if( (flags & (PIO_F_WRITE|PIO_F_READ)) == 0 )
                return (ParrotIO *)NULL;

        /* Set open flags - <, >, >>, +<, +> */
        /* add ? and ! for block/non-block */
        if( flags_to_win32(flags, &fAcc, fShare, fCreat) < 0 )
                return (ParrotIO *)NULL;

        /* Only files for now */
        flags |= PIO_F_FILE;

        /* Try open with no create first */
       
        /* FIXME: Unfinished */ 
        return (ParrotIO *)NULL;
}


ParrotIO * PIO_win32_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, const char * smode) {
        ParrotIO * io;
        INTVAL flags, mode;
        flags = 0;
        mode = 0;

        /* FIXME - Check file handle specifics, validity */

        io = PIO_new(interpreter, NULL, PIO_F_FILE, flags, mode);
        io->fd = fd;
        return io;
}


INTVAL PIO_win32_close(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
        if( io && io->fd != INVALID_HANDLE_VALUE ) {
                CloseHandle( io->fd );
                io->fd = INVALID_HANDLE_VALUE;
        }
	return 0;
}


INTVAL PIO_win32_isatty(PIOHANDLE fd) {
        /* This is the only way I know to do this on Windows */
        HANDLE h;
        if((h = GetStdHandle(STD_INPUT_HANDLE)) != INVALID_HANDLE_VALUE
                && (h == fd))
                return 1;
        if((h = GetStdHandle(STD_OUTPUT_HANDLE)) != INVALID_HANDLE_VALUE
                && (h == fd))
                return 1;
        if((h = GetStdHandle(STD_ERROR_HANDLE)) != INVALID_HANDLE_VALUE
                && (h == fd))
                return 1;
        return 0;
}

void PIO_win32_flush(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
}


size_t PIO_win32_read(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
		                void * buffer, size_t len) {
        return 0;
}


size_t PIO_win32_write(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
			const void * buffer, size_t len) {
        return 0;
}


/*
 * puts tries WriteConsole first, then WriteFile, whereas
 * write calls WriteFile only.
 */
INTVAL PIO_win32_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                                const char * s) {
        LPCTSTR msg;
        DWORD len, wrote;
        if((msg = (LPCTSTR)s) != NULL) {
                len = _tcslen(msg);
                if(!WriteConsole(io->fd, msg, len, &wrote, NULL)
                        && !WriteFile(io->fd, msg, len * sizeof(TCHAR),
                                &wrote, NULL))
                        return -1;
                return wrote;

        } 
        return -1;
}


/*
 * Hard seek
 */
INTVAL PIO_win32_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        off_t offset, INTVAL whence) {
        io->fpos = lseek(io->fd, offset, whence);
        return io->fpos;
}


off_t PIO_win32_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io) {
        off_t p;
        p = lseek(io->fd, (off_t)0, SEEK_CUR);
        return p;
}



ParrotIOLayerAPI        pio_win32_layer_api = {
        PIO_win32_init,
        PIO_base_new_layer,
        PIO_base_delete_layer,
        NULL,
        NULL,
        PIO_win32_open,
        NULL,
        NULL,
        NULL,
        PIO_win32_fdopen,
        PIO_win32_close,
        PIO_win32_write,
        NULL,
        PIO_win32_read,
        NULL,
        NULL,
        PIO_win32_seek,
        PIO_win32_tell,
        NULL,
        NULL,
        NULL,
        NULL,
        PIO_win32_puts,
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

