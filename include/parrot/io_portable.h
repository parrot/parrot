/* io_portable.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *      Parrot IO subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_IO_PORTABLE_H_GUARD
#define PARROT_IO_PORTABLE_H_GUARD

typedef FILE* PIOHANDLE;
typedef long PIOOFF_T;

#define PIO_INVALID_HANDLE NULL

/* HEADERIZER BEGIN: src/io/portable.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

INTVAL Parrot_io_close_portable(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen_portable(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOHANDLE fptr,
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_flush_portable(SHIM_INTERP, SHIM(PMC *filehandle));
INTVAL Parrot_io_getblksize_portable(PIOHANDLE fptr);
INTVAL Parrot_io_init_portable(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_io_is_closed_portable(PARROT_INTERP, ARGIN(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_open_pipe_portable(PARROT_INTERP,
    SHIM(PMC *filehandle),
    SHIM(STRING *command),
    int flags)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_open_portable(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN(STRING *path),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

size_t Parrot_io_peek_portable(PARROT_INTERP,
    ARGIN(PMC *filehandle),
    ARGIN(STRING **buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

size_t Parrot_io_read_portable(PARROT_INTERP,
    SHIM(PMC *filehandle),
    ARGIN(STRING **buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PIOOFF_T Parrot_io_seek_portable(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PIOOFF_T Parrot_io_tell_portable(PARROT_INTERP, ARGIN(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

size_t Parrot_io_write_portable(PARROT_INTERP,
    ARGIN(PMC *filehandle),
    ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_io_close_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_fdopen_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_flush_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_getblksize_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_init_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_is_closed_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_open_pipe_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_open_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_io_peek_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_Parrot_io_read_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_Parrot_io_seek_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_tell_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_write_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/portable.c */

#define PIO_INIT(interp) Parrot_io_init_portable((interp))
#define PIO_OPEN(interp, pmc, file, flags) \
    Parrot_io_open_portable((interp), (pmc), (file), (flags))
#define PIO_FDOPEN(interp, pmc, handle, flags) \
    Parrot_io_fdopen_portable((interp), (pmc), (handle), (flags))
#define PIO_OPEN_PIPE(interp, pmc, file, flags) \
    Parrot_io_open_pipe_portable((interp), (pmc), (file), (flags))
#define PIO_CLOSE(interp, pmc) Parrot_io_close_portable((interp), (pmc))
#define PIO_IS_CLOSED(interp, pmc) Parrot_io_is_closed_portable((interp), (pmc))
#define PIO_READ(interp, pmc, buf) Parrot_io_read_portable((interp), (pmc), (buf))
#define PIO_WRITE(interp, pmc, str) Parrot_io_write_portable((interp), (pmc), (str))
#define PIO_SEEK(interp, pmc, offset, start) \
    Parrot_io_seek_portable((interp), (pmc), (offset), (start))
#define PIO_TELL(interp, pmc) Parrot_io_tell_portable((interp), (pmc))
#define PIO_PEEK(interp, pmc, buf) Parrot_io_peek_portable((interp), (pmc), (buf))
#define PIO_FLUSH(interp, pmc) Parrot_io_flush_portable((interp), (pmc))
#define PIO_GETBLKSIZE(handle) Parrot_io_getblksize_portable((handle))

#endif /* PARROT_IO_PORTABLE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
