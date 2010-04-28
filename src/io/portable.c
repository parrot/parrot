/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/io/portable.c - Portable I/O utility functions

=head1 DESCRIPTION

This file implements generic, portable I/O functionality using C's STDIO. This
function set is the default fallback for all platforms. It must compile on any
system with the ANSI C standard library. Also note that unlike the other
low-level I/O utility function sets (UNIX, Win32), this is I<buffered> I/O, out
of necessity.

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>
#include "parrot/parrot.h"
#include "io_private.h"

#ifdef PIO_OS_STDIO

/* HEADERIZER HFILE: include/parrot/io_portable.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CONST_FUNCTION
PARROT_CANNOT_RETURN_NULL
static const char * convert_flags_to_stdio(INTVAL flags);

static INTVAL io_is_tty_portable(PIOHANDLE fptr);
#define ASSERT_ARGS_convert_flags_to_stdio __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_io_is_tty_portable __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static const char * convert_flags_to_stdio(INTVAL flags)>

Returns a C string representation of C<flags> suitable for passing to
C<fopen()> in C<Parrot_io_open_portable()>.

=cut

*/

PARROT_CONST_FUNCTION
PARROT_CANNOT_RETURN_NULL
static const char *
convert_flags_to_stdio(INTVAL flags)
{
    ASSERT_ARGS(convert_flags_to_stdio)
    if ((flags & (PIO_F_WRITE | PIO_F_READ | PIO_F_APPEND)) ==
        (PIO_F_WRITE | PIO_F_READ | PIO_F_APPEND)) {
        return "a+b";
    }
    else if ((flags & (PIO_F_WRITE | PIO_F_READ | PIO_F_TRUNC)) ==
             (PIO_F_WRITE | PIO_F_READ | PIO_F_TRUNC)) {
        return "w+b";
    }
    else if ((flags & (PIO_F_WRITE | PIO_F_READ)) ==
             (PIO_F_WRITE | PIO_F_READ)) {
        return "r+b";
    }
    else if (flags & PIO_F_APPEND) {
        return "ab";
    }
    else if (flags & PIO_F_WRITE) {
        return "wb";
    }
    else {
        /* PIO_F_READ, hopefully */
        return "rb";
    }
}


/*

=item C<INTVAL Parrot_io_init_portable(PARROT_INTERP)>

Sets up standard streams, etc.

=cut

*/

INTVAL
Parrot_io_init_portable(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_init_portable)
#  ifdef PIO_OS_STDIO
    /* Only set standard handles if stdio is the OS IO */
    PIO_STDIN(interp)
        = Parrot_io_fdopen_portable(interp, PMCNULL, stdin, PIO_F_READ);

    PIO_STDOUT(interp)
        = Parrot_io_fdopen_portable(interp, PMCNULL, stdout, PIO_F_WRITE);

    PIO_STDERR(interp)
        = Parrot_io_fdopen_portable(interp, PMCNULL, stderr, PIO_F_WRITE);
#  else  /* PIO_OS_STDIO */
    UNUSED(interp);
#  endif /* PIO_OS_STDIO */
    return 0;
}


/*

=item C<PMC * Parrot_io_open_portable(PARROT_INTERP, PMC *filehandle, STRING
*path, INTVAL flags)>

Opens a new FileHandle PMC from a given STRING path with the provided modes.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_open_portable(PARROT_INTERP, ARGMOD(PMC *filehandle),
              ARGIN(STRING *path), INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_open_portable)
    const char *oflags;
    FILE       *fptr;

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        return NULL;

    oflags = convert_flags_to_stdio(flags);

    /* Only files for now */
    flags |= PIO_F_FILE;

    { /* scope for temporary C string */
        char * const spath = Parrot_str_to_cstring(interp, path);
        /* Try opening the file
         * note that this can't really handle O_EXCL, etc. */
        fptr = fopen(spath, oflags);

        if (fptr == NULL && errno == ENOENT && (flags & PIO_F_WRITE))
            fptr = fopen(spath, "w+b");

        Parrot_str_free_cstring(spath);
    }

    /* File open */
    if (fptr) {
        PMC *io;
        if (io_is_tty_portable((PIOHANDLE)fptr))
            flags |= PIO_F_CONSOLE;

        if (PMC_IS_NULL(filehandle))
            io = Parrot_io_new_pmc(interp, flags, 0);
        else
            io = filehandle;

        Parrot_io_set_os_handle(interp, filehandle, (PIOHANDLE)fptr);
        return io;
    }

    return NULL;
}


/*

=item C<PMC * Parrot_io_fdopen_portable(PARROT_INTERP, PMC *filehandle,
PIOHANDLE fptr, INTVAL flags)>

Associates an IO PMC with a file descriptor.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_fdopen_portable(PARROT_INTERP, ARGMOD(PMC *filehandle),
        PIOHANDLE fptr, INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_fdopen_portable)
    PMC *io;

    if (io_is_tty_portable(fptr))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    if (PMC_IS_NULL(filehandle))
        io = Parrot_io_new_pmc(interp, flags);
    else
        io = filehandle;

    Parrot_io_set_os_handle(interp, filehandle, (PIOHANDLE)fptr);

    return io;
}


/*

=item C<INTVAL Parrot_io_close_portable(PARROT_INTERP, PMC *filehandle)>

Closes the underlying filehandle of a given IO PMC.

=cut

*/

INTVAL
Parrot_io_close_portable(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_close_portable)
    INTVAL result = 0;
    FILE * const fptr = (FILE *)Parrot_io_get_os_handle(interp, filehandle);

    if (fptr) {
        if (fclose(fptr) != 0)
            result = errno;
    }

    Parrot_io_set_os_handle(interp, filehandle, (PIOHANDLE)NULL);

    return result;
}


/*

=item C<INTVAL Parrot_io_is_closed_portable(PARROT_INTERP, PMC *filehandle)>

Tests whether the filehandle has been closed.

=cut

*/

INTVAL
Parrot_io_is_closed_portable(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_is_closed_portable)
    if (Parrot_io_get_os_handle(interp, filehandle) == (PIOHANDLE)NULL)
        return 1;

    return 0;
}


/*

=item C<static INTVAL io_is_tty_portable(PIOHANDLE fptr)>

Tests whether the given file descriptor is attached to a tty.

=cut

*/

static INTVAL
io_is_tty_portable(PIOHANDLE fptr)
{
    ASSERT_ARGS(io_is_tty_portable)
    UNUSED(fptr);

    /* no obvious way to check for this with STDIO */
    return 0;
}


/*

=item C<size_t Parrot_io_peek_portable(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Retrieves the next character in the stream without modifying the stream.

=cut

*/

size_t
Parrot_io_peek_portable(PARROT_INTERP,
        ARGIN(PMC *filehandle),
        ARGIN(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_peek_portable)
    FILE   * const fptr  = (FILE *)Parrot_io_get_os_handle(interp, filehandle);
    STRING * const s     = Parrot_io_make_string(interp, buf, 1);

    /* read the next byte into the buffer */
    const size_t   bytes = fread(s->strstart, 1, 1, fptr);

    /* if we got anything from the stream, push it back on */
    if (bytes) {
        s->bufused = s->strlen = 1;
        ungetc(*(char *)s->strstart, fptr);
    }
    else
        s->bufused = s->strlen = 1;

    return bytes;
}


/*

=item C<INTVAL Parrot_io_getblksize_portable(PIOHANDLE fptr)>

Returns the block size of the given file descriptor.

=cut

*/

INTVAL
Parrot_io_getblksize_portable(PIOHANDLE fptr)
{
    ASSERT_ARGS(Parrot_io_getblksize_portable)
    UNUSED(fptr);

    /* Hard coded for now */
    return PIO_BLKSIZE;
}


/*

=item C<INTVAL Parrot_io_flush_portable(PARROT_INTERP, PMC *filehandle)>

Flushes the underlying file descriptor of the given IO PMC.

=cut

*/

INTVAL
Parrot_io_flush_portable(SHIM_INTERP, SHIM(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_flush_portable)
    return fflush((FILE *)Parrot_io_get_os_handle(interp, filehandle));
}


/*

=item C<size_t Parrot_io_read_portable(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Reads from the given filehandle into the provided STRING, returning the number
of bytes read.

=cut

*/

size_t
Parrot_io_read_portable(PARROT_INTERP, SHIM(PMC *filehandle),
              ARGIN(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_read_portable)
    FILE   * const fptr   = (FILE *)Parrot_io_get_os_handle(interp, filehandle);
    STRING * const s      = Parrot_io_make_string(interp, buf, 2048);
    void   * const buffer = Buffer_bufstart(s);
    const   size_t len    = s->bufused;
    const   size_t bytes  = fread(buffer, 1, len, fptr);

    s->bufused = s->strlen = bytes;

    if (bytes != len) {
        if (feof(fptr))
            Parrot_io_set_flags(interp, filehandle,
                (Parrot_io_get_flags(interp, filehandle) | PIO_F_EOF));
    }

    return bytes;
}


/*

=item C<size_t Parrot_io_write_portable(PARROT_INTERP, PMC *filehandle, const
STRING *s)>

Writes the given STRING to the provided IO PMC.

=cut

*/

size_t
Parrot_io_write_portable(PARROT_INTERP, ARGIN(PMC *filehandle), ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_io_write_portable)
    const void * const buffer = s->strstart;
    return fwrite(buffer, 1, s->bufused,
                  (FILE *)Parrot_io_get_os_handle(interp, filehandle));
}


/*

=item C<PIOOFF_T Parrot_io_seek_portable(PARROT_INTERP, PMC *filehandle,
PIOOFF_T offset, INTVAL whence)>

Seeks to the given offset and position within the provided IO PMC.

=cut

*/

PIOOFF_T
Parrot_io_seek_portable(PARROT_INTERP, ARGMOD(PMC *filehandle),
              PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(Parrot_io_seek_portable)
    PIOOFF_T pos;
    errno = 0;

    if ((pos = fseek((FILE *)Parrot_io_get_os_handle(interp, filehandle),
                    (long)offset, whence)) >= 0)
        Parrot_io_set_file_position(interp, filehandle, pos);

    /* Seek clears EOF */
    Parrot_io_set_flags(interp, filehandle,
            (Parrot_io_get_flags(interp, filehandle) & ~PIO_F_EOF));

    return pos;
}


/*

=item C<PIOOFF_T Parrot_io_tell_portable(PARROT_INTERP, PMC *filehandle)>

Returns the current position of the given IO PMC.

=cut

*/

PIOOFF_T
Parrot_io_tell_portable(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_tell_portable)
    return (ftell((FILE *)Parrot_io_get_os_handle(interp, filehandle)));
}


/*

=item C<PMC * Parrot_io_open_pipe_portable(PARROT_INTERP, PMC *filehandle,
STRING *command, int flags)>

Opens a pipe. Not implemented for this platform.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_open_pipe_portable(PARROT_INTERP, SHIM(PMC *filehandle),
        SHIM(STRING *command), int flags)
{
    ASSERT_ARGS(Parrot_io_open_pipe_portable)
    UNUSED(flags);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "pipe() not implemented");
}

#endif /* PIO_OS_STDIO */

/*

=back

=head1 SEE ALSO

F<src/io/unix.c>,
F<src/io/win32.c>,
F<src/io/io.c>,
F<src/io/io_private.h>,
F<include/parrot/io_portable.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
