/* io.h
 *  Copyright (C) 2001-2011, Parrot Foundation.
 *  Overview:
 *      Parrot IO subsystem
 *  History:
 *      Originally written by Melvin Smith
 *      Refactored by Juergen Boemmels
 *      2003-08-18: Internal structures moved to io/io_private.h
 *  Notes:
 *  References:
 *      Perl6 RFCs (14,30,47,60,186,239,321,345,350)
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 *      Some ideas from AT&T SFIO
 */

#ifndef PARROT_IO_H_GUARD
#define PARROT_IO_H_GUARD

#include <stdio.h>

/* &gen_from_def(stdio.pasm) */

#define PIO_STDIN_FILENO 0
#define PIO_STDOUT_FILENO 1
#define PIO_STDERR_FILENO 2

/* &end_gen */

#ifdef BLKSIZE
#  define PIO_BLKSIZE BLKSIZE
#else
#  define PIO_BLKSIZE  8192
#endif
#define PIO_LINEBUFSIZE 256     /* Default linebuffer size */
#define PIO_GRAIN 2048          /* Smallest size for a block buffer */
#define PIO_BUFSIZE (PIO_GRAIN * 2)

#define PIO_NR_OPEN 256         /* Size of an "IO handle table" */

/* IO object flags */
#define PIO_F_READ      00000001
#define PIO_F_WRITE     00000002
#define PIO_F_APPEND    00000004
#define PIO_F_TRUNC     00000010
#define PIO_F_EOF       00000020
#define PIO_F_FILE      00000100
#define PIO_F_PIPE      00000200
#define PIO_F_SOCKET    00000400
#define PIO_F_CONSOLE   00001000        /* A terminal                   */
#define PIO_F_READLINE  00002000        /* user interactive readline    */
#define PIO_F_LINEBUF   00010000        /* Flushes on newline           */
#define PIO_F_BLKBUF    00020000
#define PIO_F_SOFT_SP   00040000        /* Python softspace */
#define PIO_F_SHARED    00100000        /* Stream shares a file handle  */
#define PIO_F_ASYNC     01000000        /* In Parrot async is default   */

/* These macros will be removed */
#define PIO_STDHANDLE(interp, fileno) Parrot_io_std_os_handle((interp), (fileno))
#define PIO_OPEN(interp, file, flags) \
    Parrot_io_open((interp), (file), (flags))
#define PIO_OPEN_PIPE(interp, file, flags, pid) \
    Parrot_io_open_pipe((interp), (file), (flags), (pid))
#define PIO_DUP(interp, handle) Parrot_io_dup((interp), (handle))
#define PIO_CLOSE(interp, handle) Parrot_io_close((interp), (handle))
#define PIO_CLOSE_PIOHANDLE(interp, handle) Parrot_io_close_piohandle((interp), (handle))
#define PIO_READ(interp, handle, buf, len) Parrot_io_read((interp), (handle), (buf), (len))
#define PIO_WRITE(interp, handle, buf, len) Parrot_io_write((interp), (handle), (buf), (len))
#define PIO_SEEK(interp, pmc, offset, start) \
    Parrot_io_seek((interp), (pmc), (offset), (start))
#define PIO_TELL(interp, pmc) Parrot_io_tell((interp), (pmc))
#define PIO_FLUSH(interp, handle) Parrot_io_flush((interp), (handle))
#define PIO_GETBLKSIZE(handle) Parrot_io_getblksize((handle))
#define PIO_IS_TTY(interp, handle) \
    Parrot_io_is_tty((interp), (handle))

extern PIOOFF_T piooffsetzero;

typedef struct _ParrotIOData ParrotIOData;

/* io/core.c - interpreter initialization/destruction functions */
/* HEADERIZER BEGIN: src/io/core.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_io_finish(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_io_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_IOData_mark(PARROT_INTERP, ARGIN(ParrotIOData *piodata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_io_finish __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_IOData_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(piodata))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/core.c */

/* io/api.c - Public API functions */
/* HEADERIZER BEGIN: src/io/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
INTVAL Parrot_io_close_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_eof(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_eprintf(
    NULLOK(PARROT_INTERP),
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen(PARROT_INTERP,
    ARGIN(PMC *pmc),
    PIOHANDLE fd,
    ARGIN(STRING *sflags))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen_flags(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOHANDLE fd,
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_EXPORT
void Parrot_io_flush_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_fprintf(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_getfd(PARROT_INTERP, ARGIN(const PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_closed(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_tty_handle(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_make_offset(INTVAL offset);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_make_offset32(INTVAL hi, INTVAL lo);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_open_handle(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(STRING *path),
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_parse_open_flags(PARROT_INTERP,
    ARGIN(const STRING *mode_str))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_peek(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_pprintf(PARROT_INTERP,
    PIOHANDLE os_handle,
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_printf(PARROT_INTERP,
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_io_putps(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
INTVAL Parrot_io_puts(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_readline(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_reads(PARROT_INTERP, ARGMOD(PMC *pmc), size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_seek_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    PIOOFF_T offset,
    INTVAL w)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_STDERR(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_stdhandle(PARROT_INTERP,
    INTVAL fileno,
    ARGIN_NULLOK(PMC *newhandle))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_STDIN(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_STDOUT(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_tell_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_write_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGIN(const void *buffer),
    size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc);

PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_make_offset_pmc(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

#define ASSERT_ARGS_Parrot_io_close_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_eprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_fdopen __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(sflags))
#define ASSERT_ARGS_Parrot_io_fdopen_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_flush_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_fprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_getfd __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_is_closed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_is_tty_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_make_offset __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_make_offset32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_open_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_Parrot_io_parse_open_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mode_str))
#define ASSERT_ARGS_Parrot_io_peek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_pprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_printf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_putps __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_puts __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_readline __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_reads __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_seek_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_STDERR __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_stdhandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_STDIN __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_STDOUT __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_tell_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_write_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_io_make_offset_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/api.c */

/* io/buffer.c - Buffering functions */
/* HEADERIZER BEGIN: src/io/buffer.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

size_t Parrot_io_fill_readbuf(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_flush_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_init_buffer(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_io_peek_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_WARN_UNUSED_RESULT
size_t Parrot_io_read_buffer(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGMOD(char *dest),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle)
        FUNC_MODIFIES(*dest);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_readline_buffer(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN(const STR_VTABLE *encoding))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

PIOOFF_T Parrot_io_seek_buffer(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void Parrot_io_setbuf(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    size_t bufsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_setlinebuf(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

size_t Parrot_io_write_buffer(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

#define ASSERT_ARGS_Parrot_io_fill_readbuf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_flush_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_init_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_peek_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_read_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(dest))
#define ASSERT_ARGS_Parrot_io_readline_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_io_seek_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_setbuf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_setlinebuf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_write_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/buffer.c */

/* io/filehandle.c - utility functions for FileHandle PMC */
/* HEADERIZER BEGIN: src/io/filehandle.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
INTVAL Parrot_io_close_filehandle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
void Parrot_io_flush_filehandle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
unsigned char * Parrot_io_get_buffer_end(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
unsigned char * Parrot_io_get_buffer_next(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
unsigned char * Parrot_io_get_buffer_start(PARROT_INTERP,
    ARGIN(PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_get_file_position(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_io_get_flags(PARROT_INTERP, ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_get_os_handle(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_closed_filehandle(PARROT_INTERP, ARGIN(const PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_io_set_file_position(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T file_pos)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_EXPORT
void Parrot_io_set_flags(PARROT_INTERP,
    ARGIN(PMC *filehandle),
    INTVAL flags)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_io_set_os_handle(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOHANDLE file_descriptor)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_CAN_RETURN_NULL
void Parrot_io_clear_buffer(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_CAN_RETURN_NULL
INTVAL Parrot_io_get_buffer_flags(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
size_t Parrot_io_get_buffer_size(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_make_string(PARROT_INTERP,
    ARGMOD(STRING **buf),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buf);

void Parrot_io_set_buffer_end(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN_NULLOK(unsigned char *new_end))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void Parrot_io_set_buffer_flags(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    INTVAL new_flags)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void Parrot_io_set_buffer_next(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN_NULLOK(unsigned char *new_next))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void Parrot_io_set_buffer_size(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    size_t new_size)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void Parrot_io_set_buffer_start(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN_NULLOK(unsigned char *new_start))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

#define ASSERT_ARGS_Parrot_io_close_filehandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_flush_filehandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_get_buffer_end __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_buffer_next __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_buffer_start __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_file_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_os_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_is_closed_filehandle \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_set_file_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_set_os_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_clear_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_buffer_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_get_buffer_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_make_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_Parrot_io_set_buffer_end __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_set_buffer_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_set_buffer_next __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_set_buffer_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_set_buffer_start __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/filehandle.c */

/* HEADERIZER BEGIN: src/io/socket_api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_accept_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
void Parrot_io_bind_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGMOD(PMC *address))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*address);

PARROT_EXPORT
void Parrot_io_connect_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGMOD(PMC *address))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*address);

PARROT_EXPORT
void Parrot_io_listen_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    INTVAL backlog)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_new_socket_pmc(PARROT_INTERP, INTVAL flags)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_io_poll_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    INTVAL which,
    INTVAL sec,
    INTVAL usec)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_recv_handle(PARROT_INTERP, ARGMOD(PMC *pmc), size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_send_handle(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGMOD(STRING *buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*buf);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL Parrot_io_socket_handle(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *socket),
    INTVAL fam,
    INTVAL type,
    INTVAL proto)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*socket);

PARROT_EXPORT
void Parrot_io_socket_initialize_handle(PARROT_INTERP, ARGMOD(PMC *socket))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*socket);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_socket_is_closed(PARROT_INTERP, ARGMOD(PMC *socket))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*socket);

#define ASSERT_ARGS_Parrot_io_accept_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_bind_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(address))
#define ASSERT_ARGS_Parrot_io_connect_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(address))
#define ASSERT_ARGS_Parrot_io_listen_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_new_socket_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_poll_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_recv_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_send_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_Parrot_io_socket_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_socket_initialize_handle \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(socket))
#define ASSERT_ARGS_Parrot_io_socket_is_closed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(socket))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/socket_api.c */

/*
 * pioctl argument constants. These don't have to
 * be unique across io commands.
 */
#define PIOCTL_NONBUF              0
#define PIOCTL_LINEBUF             1
#define PIOCTL_BLKBUF              2

/*
 * Enum definition of constants for Socket.socket.
 * Note that these are the *parrot* values for these defines; the system
 * values vary from one platform to the next.  See the lookup tables in
 * socket_unix.c and socket_win32.c for the mappings.
 */

/* &gen_from_enum(socket.pasm) */
typedef enum {
    PIO_PF_LOCAL    = 0,
    PIO_PF_UNIX     = 1,
    PIO_PF_INET     = 2,
    PIO_PF_INET6    = 3,
    PIO_PF_MAX      = 4     /* last elem */
} Socket_Protocol_Family;

typedef enum {
    PIO_SOCK_PACKET     = 0,
    PIO_SOCK_STREAM     = 1,
    PIO_SOCK_DGRAM      = 2,
    PIO_SOCK_RAW        = 3,
    PIO_SOCK_RDM        = 4,
    PIO_SOCK_SEQPACKET  = 5,
    PIO_SOCK_MAX        = 6 /* last element */
} Socket_Socket_Type;

typedef enum {
    PIO_PROTO_TCP   = 6,
    PIO_PROTO_UDP   = 17 /* last element */
} Socket_Protocol;
/* &end_gen */

#endif /* PARROT_IO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
