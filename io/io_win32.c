/* io_win32.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *      $Id$
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

#include <tchar.h>

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
		        PIOHANDLE fd, UINTVAL flags);
INTVAL          PIO_win32_close(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
void            PIO_win32_flush(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io);
size_t          PIO_win32_read(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, void * buffer, size_t len);
size_t          PIO_win32_write(theINTERP, ParrotIOLayer * layer,
                        ParrotIO * io, const void * buffer, size_t len);
INTVAL          PIO_win32_puts(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                        const char * s);
INTVAL          PIO_win32_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                        INTVAL hi, INTVAL lo, INTVAL whence);
PIOOFF_T        PIO_win32_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io);


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
                pio_stdin = PIO_fdopen(interpreter, h, "<");
        }
        if((h = GetStdHandle(STD_OUTPUT_HANDLE))
                                        != INVALID_HANDLE_VALUE){
                pio_stdout = PIO_fdopen(interpreter, h, ">");
        }
        if((h = GetStdHandle(STD_ERROR_HANDLE)) != INVALID_HANDLE_VALUE) {
                pio_stderr = PIO_fdopen(interpreter, h, ">");
        }
 
        if(pio_stdin && pio_stdout && pio_stderr)
                 return 0;
        return -1;
}


INTVAL PIO_win32_getblksize(PIOHANDLE fd) {
        /* Hard coded for now */
        return PIO_BLKSIZE;
}


ParrotIO * PIO_win32_open(theINTERP, ParrotIOLayer * layer,
			const char * spath, UINTVAL flags) {
        int type;
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
        if( flags_to_win32(flags, &fAcc, &fShare, &fCreat) < 0 )
                return (ParrotIO *)NULL;

        /* Only files for now */
        flags |= PIO_F_FILE;

        /* Try open with no create first */
       
        /* FIXME: Unfinished */ 
        return (ParrotIO *)NULL;
}


ParrotIO * PIO_win32_fdopen(theINTERP, ParrotIOLayer * layer,
		        PIOHANDLE fd, UINTVAL flags) {
        ParrotIO * io;
        UINTVAL mode;
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
        /* No op */
}


size_t PIO_win32_read(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
		                void * buffer, size_t len) {
        DWORD countread;
        if(ReadFile(io->fd, (LPVOID)buffer, (DWORD)len, &countread, NULL))
                return countread;
        else {
                if(GetLastError() != NO_ERROR) {
                        /* FIXME : An error occured */
                } else if(len > 0) {
                        /* EOF if read 0 and bytes were requested */
                        io->flags |= PIO_F_EOF;
                }
                return 0;
        }
        return -1;
}


size_t PIO_win32_write(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
			const void * buffer, size_t len) {
        LPCTSTR msg;
        DWORD countwrote = 0;
        if(WriteFile(io->fd, (LPCSTR)buffer, (DWORD)len, &countwrote, NULL))
                return countwrote;
        /* FIXME: Set error flag */
        return -1;
}


/*
 * puts() tries WriteConsole() first, then WriteFile(), whereas
 * write() calls WriteFile() only. I've also read that WriteFile
 * will call WriteConsole if the handle is the right type (console) so
 * I suppose this is saving a function call since puts is probably
 * used for consoles a lot.
 */
INTVAL PIO_win32_puts(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                                const char * s) {
        DWORD len, countwrote;
        len = _tcslen((LPCSTR)s);
        if(WriteConsole(io->fd, (LPCSTR)s, len, &countwrote, NULL)
                || WriteFile(io->fd, (LPCSTR)s, len, &countwrote, NULL))
                return countwrote;
        return -1;
}


/*
 * Hard seek
 */
INTVAL PIO_win32_seek(theINTERP, ParrotIOLayer * l, ParrotIO * io,
                        INTVAL hi, INTVAL lo, INTVAL whence) {
        PIOOFF_T p, offset;
        offset.LowPart = lo;
        offset.HighPart = hi;
        p.LowPart = SetFilePointer(io->fd, offset.LowPart,
                                        &offset.HighPart, FILE_CURRENT);
        if(p.LowPart == 0xFFFFFFFF && (GetLastError() != NO_ERROR)) {
                /* Error - exception */
                return -1;
        }
        io->fpos = p;
        return 0;
}


PIOOFF_T PIO_win32_tell(theINTERP, ParrotIOLayer * l, ParrotIO * io) {
        PIOOFF_T p = piooffsetzero;
        p.LowPart = SetFilePointer(io->fd, 0, &p.HighPart, FILE_CURRENT);
        if(p.LowPart == 0xFFFFFFFF && GetLastError() != NO_ERROR) {
                /* FIXME: Error - exception */
        }
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
        NULL,
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

