/* io_win32.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *      Parrot IO subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_IO_WIN32_H_GUARD
#define PARROT_IO_WIN32_H_GUARD

typedef Parrot_WIN32_HANDLE PIOHANDLE;
typedef Parrot_OFF_T PIOOFF_T;

/* HEADERIZER BEGIN: src/io/win32.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

INTVAL Parrot_io_close_win32(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen_win32(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *filehandle),
    PIOHANDLE fd,
    INTVAL flags)
        __attribute__nonnull__(1);

INTVAL Parrot_io_flush_win32(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_getblksize_win32(NULLOK(PIOHANDLE fd));
INTVAL Parrot_io_init_win32(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_io_is_closed_win32(PARROT_INTERP, ARGIN(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_open_pipe_win32(PARROT_INTERP,
    SHIM(PMC *filehandle),
    SHIM(STRING *command),
    int flags)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
PMC * Parrot_io_open_win32(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN(STRING *path),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

size_t Parrot_io_peek_win32(PARROT_INTERP,
    SHIM(PMC *filehandle),
    SHIM(STRING **buf))
        __attribute__nonnull__(1);

size_t Parrot_io_read_win32(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGOUT(STRING **buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle)
        FUNC_MODIFIES(*buf);

PIOOFF_T Parrot_io_seek_win32(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T off,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PIOOFF_T Parrot_io_tell_win32(PARROT_INTERP, ARGIN(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

size_t Parrot_io_write_win32(PARROT_INTERP,
    ARGIN(PMC *filehandle),
    ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/win32.c */

#define PIO_INIT(interp) Parrot_io_init_win32((interp))
#define PIO_OPEN(interp, pmc, file, flags) \
    Parrot_io_open_win32((interp), (pmc), (file), (flags))
#define PIO_FDOPEN(interp, pmc, handle, flags) \
    Parrot_io_fdopen_win32((interp), (pmc), (handle), (flags))
#define PIO_OPEN_PIPE(interp, pmc, file, flags) \
    Parrot_io_open_pipe_win32((interp), (pmc), (file), (flags))
#define PIO_CLOSE(interp, pmc) Parrot_io_close_win32((interp), (pmc))
#define PIO_IS_CLOSED(interp, pmc) Parrot_io_is_closed_win32((interp), (pmc))
#define PIO_READ(interp, pmc, buf) Parrot_io_read_win32((interp), (pmc), (buf))
#define PIO_WRITE(interp, pmc, str) Parrot_io_write_win32((interp), (pmc), (str))
#define PIO_SEEK(interp, pmc, offset, start) \
    Parrot_io_seek_win32((interp), (pmc), (offset), (start))
#define PIO_TELL(interp, pmc) Parrot_io_tell_win32((interp), (pmc))
#define PIO_PEEK(interp, pmc, buf) Parrot_io_peek_win32((interp), (pmc), (buf))
#define PIO_FLUSH(interp, pmc) Parrot_io_flush_win32((interp), (pmc))
#define PIO_GETBLKSIZE(handle) Parrot_io_getblksize_win32((handle))

#endif /* PARROT_IO_WIN32_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
