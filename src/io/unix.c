/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/io/unix.c - UNIX IO utility functions

=head1 DESCRIPTION

This file implements unbuffered, low-level, UNIX-specific functionality.
"UNIX" is a generalization, it may be necessary to create separate OS-specific
functions for UNIX flavors.

These functions are not part of Parrot's API. Don't call them directly, call
the C<Parrot_io_*> functions in F<src/io/api.c> instead. Each platform defines
the standard set of macros, which call the correct functions for that platform.

=head2 References:

APitUE - W. Richard Stevens, AT&T SFIO, Perl 5 (Nick Ing-Simmons)

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_filehandle.h"

#ifdef PIO_OS_UNIX

#  include <sys/types.h>
#  include <sys/wait.h>
#  include <unistd.h> /* for pipe() */

/* HEADERIZER HFILE: include/parrot/io_unix.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CONST_FUNCTION
static int convert_flags_to_unix(INTVAL flags);

static INTVAL io_is_tty_unix(PIOHANDLE fd);
#define ASSERT_ARGS_convert_flags_to_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_io_is_tty_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static int convert_flags_to_unix(INTVAL flags)>

Returns a UNIX-specific interpretation of C<flags> suitable for passing
to C<open()> and C<fopen()> in C<Parrot_io_open_unix()> and
C<Parrot_io_fdopen_unix()> respectively.

=cut

*/

PARROT_CONST_FUNCTION
static int
convert_flags_to_unix(INTVAL flags)
{
    ASSERT_ARGS(convert_flags_to_unix)
    int oflags = 0;

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == (PIO_F_WRITE | PIO_F_READ)) {
        oflags |= O_RDWR | O_CREAT;
    }
    else if (flags & PIO_F_WRITE) {
        oflags |= O_WRONLY | O_CREAT;
    }
    else if (flags & PIO_F_READ) {
        oflags |= O_RDONLY;
    }

    if (flags & PIO_F_APPEND) {
        oflags |= O_APPEND;
    }
    else if (flags & PIO_F_TRUNC) {
        oflags |= O_TRUNC;
    }
    return oflags;
}

/*

=item C<INTVAL Parrot_io_init_unix(PARROT_INTERP)>

Sets up the interpreter's standard C<std*> IO handles. Returns C<0> on
success and C<-1> on error.

=cut

*/

INTVAL
Parrot_io_init_unix(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_init_unix)
    ParrotIOData * const d = interp->piodata;
    if (d != NULL && d->table != NULL) {
        PMC *filehandle;

        filehandle = Parrot_io_fdopen_unix(interp, PMCNULL, STDIN_FILENO, PIO_F_READ);
        if (PMC_IS_NULL(filehandle))
            return -1;
        _PIO_STDIN(interp) = filehandle;

        filehandle = Parrot_io_fdopen_unix(interp, PMCNULL, STDOUT_FILENO, PIO_F_WRITE);
        if (PMC_IS_NULL(filehandle))
            return -1;
        _PIO_STDOUT(interp) = filehandle;

        filehandle = Parrot_io_fdopen_unix(interp, PMCNULL, STDERR_FILENO, PIO_F_WRITE);
        if (PMC_IS_NULL(filehandle))
            return -1;
        _PIO_STDERR(interp) = filehandle;

        return 0;
    }
    return -1;
}


/*

=item C<PMC * Parrot_io_open_unix(PARROT_INTERP, PMC *filehandle, STRING *path,
INTVAL flags)>

Opens a string C<path>. C<flags> is a bitwise C<or> combination of C<PIO_F_*>
flag values.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_open_unix(PARROT_INTERP, ARGMOD_NULLOK(PMC *filehandle),
              ARGIN(STRING *path), INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_open_unix)
    int oflags;
    PIOHANDLE fd;
    char *spath;

    if (flags & PIO_F_PIPE)
        return Parrot_io_open_pipe_unix(interp, filehandle, path, flags);

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                "Invalid mode for file open");

    oflags = convert_flags_to_unix(flags);
    spath = Parrot_str_to_cstring(interp, path);

    /* Only files for now */
    flags |= PIO_F_FILE;

    /* Try open with no create first */
    while ((fd = open(spath, oflags & (O_WRONLY | O_RDWR | O_APPEND), DEFAULT_OPEN_MODE))
           < 0 && errno == EINTR)
        errno = 0;

    /* File open */
    if (fd >= 0) {
        /*
         * Now check if we specified O_CREAT|O_EXCL or not.
         * If so, we must return NULL, else either use the
         * descriptor or create the file.
         */
        if ((oflags & (O_CREAT | O_EXCL)) == (O_CREAT | O_EXCL)) {
            close(fd);

            /* returning before C string freed */
            Parrot_str_free_cstring(spath);
            return PMCNULL;
        }

        /* Check for truncate?  */
        if (oflags & O_TRUNC) {
            int tfd;
            while ((tfd = creat(spath, PIO_DEFAULTMODE)) < 0 && errno == EINTR)
                errno = 0;
            if (tfd > 0)
                close(tfd);
        }
    }
    else if (oflags & O_CREAT) {
        /* O_CREAT and file doesn't exist. */
        while ((fd = creat(spath, PIO_DEFAULTMODE)) < 0 && errno == EINTR)
            errno = 0;
        if (!(oflags & O_WRONLY)) {
            if (fd > 0)
                close(fd);

            /* File created, reopen with read+write */
            while ((fd = open(spath, oflags & (O_WRONLY | O_RDWR),
                              DEFAULT_OPEN_MODE)) < 0 && errno == EINTR)
                errno = 0;
        }
    }
    else {
        /* File doesn't exist and O_CREAT not specified */
    }

    Parrot_str_free_cstring(spath); /* done with C string */

    if (fd >= 0) {
        struct stat buf;
        if (fstat(fd, &buf) == -1) {
            close(fd);
            return PMCNULL;
        }
        if ((buf.st_mode & S_IFMT) == S_IFDIR) {
            close(fd);
            errno = EISDIR;
            return PMCNULL;
        }
        /* Set generic flag here if is a terminal then
         * FileHandle can know how to setup buffering.
         * STDIN, STDOUT, STDERR would be in this case
         * so we would setup linebuffering.
         */
        if (io_is_tty_unix(fd))
            flags |= PIO_F_CONSOLE;

        if (PMC_IS_NULL(filehandle)) {
            PMC * const io = Parrot_io_new_pmc(interp, flags);
            Parrot_io_set_os_handle(interp, io, fd);
            return io;
        }
        else {
            Parrot_io_set_flags(interp, filehandle, flags);
            Parrot_io_set_os_handle(interp, filehandle, fd);
            return filehandle;
        }
    }
    return PMCNULL;
}

#  if PARROT_ASYNC_DEVEL

/*

=item C<INTVAL Parrot_io_async_unix(PARROT_INTERP, PMC *filehandle, INTVAL b)>

Experimental asynchronous IO.

This is available if C<PARROT_ASYNC_DEVEL> is defined.

Only works on Linux at the moment.

Toggles the C<O_ASYNC> flag on the IO file descriptor.

=cut

*/

INTVAL
Parrot_io_async_unix(PARROT_INTERP, ARGMOD(PMC *filehandle), INTVAL b)
{
    ASSERT_ARGS(Parrot_io_async_unix)
#    if defined(linux)
    int rflags;
    PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);

    if ((rflags = fcntl(file_descriptor, F_GETFL, 0)) >= 0) {
        if (b)
            rflags |= O_ASYNC;
        else
            rflags &= ~O_ASYNC;
        return fcntl(file_descriptor, F_SETFL, rflags);
    }
#    else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_NOT_IMPLEMENTED,
        "Async support not available");
#    endif
    return -1;
}

#  endif

/*

=item C<PMC * Parrot_io_fdopen_unix(PARROT_INTERP, PMC *filehandle, PIOHANDLE
fd, INTVAL flags)>

Returns a new C<FileHandle> PMC with the file descriptor passed in.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_fdopen_unix(PARROT_INTERP, ARGMOD_NULLOK(PMC *filehandle), PIOHANDLE fd, INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_fdopen_unix)
    if (io_is_tty_unix(fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    if (PMC_IS_NULL(filehandle)) {
        PMC * const io = Parrot_io_new_pmc(interp, flags);
        Parrot_io_set_os_handle(interp, io, fd);
        return io;
    }
    else {
        Parrot_io_set_flags(interp, filehandle, flags);
        Parrot_io_set_os_handle(interp, filehandle, fd);
        return filehandle;
    }
}

/*

=item C<INTVAL Parrot_io_close_unix(PARROT_INTERP, PMC *filehandle)>

Closes C<*io>'s file descriptor.

=cut

*/

INTVAL
Parrot_io_close_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_close_unix)
    INTVAL result = 0;
    const PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);
    const int flags = Parrot_io_get_flags(interp, filehandle);

    /* BSD and Solaris need explicit fsync() */
    if (file_descriptor >= 0) {
        fsync(file_descriptor);
        if (close(file_descriptor) != 0)
            result = errno;

        /* Wait for the child after closing the
         * handle, to let it notice the closing and finish */
        if (flags & PIO_F_PIPE) {
            int status;
            waitpid(VTABLE_get_integer_keyed_int(interp, filehandle, 0), &status, 0);
            if (WIFEXITED(status)) {
                SETATTR_FileHandle_exit_status(interp, filehandle, WEXITSTATUS(status));
            }
            else {
                /* abnormal termination means non-zero exit status */
                SETATTR_FileHandle_exit_status(interp, filehandle, 1);
            }
        }
    }
    Parrot_io_set_os_handle(interp, filehandle, -1);
    return result;
}


/*

=item C<INTVAL Parrot_io_close_piohandle_unix(PARROT_INTERP, PIOHANDLE handle)>

Closes the given file descriptor.  Returns 0 on success, -1 on error.

=cut

*/

INTVAL
Parrot_io_close_piohandle_unix(SHIM_INTERP, PIOHANDLE handle)
{
    ASSERT_ARGS(Parrot_io_close_piohandle_unix)
    return close(handle);
}

/*

=item C<INTVAL Parrot_io_is_closed_unix(PARROT_INTERP, PMC *filehandle)>

Test whether the filehandle has been closed.

=cut

*/

INTVAL
Parrot_io_is_closed_unix(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_is_closed_unix)
    if (Parrot_io_get_os_handle(interp, filehandle) == -1)
        return 1;

    return 0;
}

/*

=item C<static INTVAL io_is_tty_unix(PIOHANDLE fd)>

Returns a boolean value indicating whether C<fd> is a console/tty.

=cut

*/

static INTVAL
io_is_tty_unix(PIOHANDLE fd)
{
    ASSERT_ARGS(io_is_tty_unix)
    return isatty(fd);
}

/*

=item C<INTVAL Parrot_io_getblksize_unix(PIOHANDLE fd)>

Various ways of determining block size.

If passed a file descriptor then C<fstat()> and the C<stat> buffer are
used if available.

If called without an argument then the C<BLKSIZE> constant is returned
if it was available at compile time, otherwise C<PIO_BLKSIZE> is returned.

=cut

*/

INTVAL
Parrot_io_getblksize_unix(PIOHANDLE fd)
{
    ASSERT_ARGS(Parrot_io_getblksize_unix)
    if (fd >= 0) {
        /* Try to get the block size of a regular file */
#  if 0
        /*
         * Is it even worth adding non-portable code here
         * or should we just estimate a nice buffer size?
         * Some systems have st_blksize, some don't.
         */
        {
            struct stat sbuf;
            int err;
            err = fstat(fd, &sbuf);
            if (err == 0) {
                return sbuf.st_blksize;
            }
        }
#  endif
    }
    /* Try to determine it from general means. */
#  ifdef BLKSIZE
    return BLKSIZE;
#  else
    return PIO_BLKSIZE;
#  endif
}

/*

=item C<INTVAL Parrot_io_flush_unix(PARROT_INTERP, PMC *filehandle)>

At lowest layer all we can do for C<flush> is to ask the kernel to
C<sync()>.

XXX: Is it necessary to C<sync()> here?

=cut

*/

INTVAL
Parrot_io_flush_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_flush_unix)
    const PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);
    return fsync(file_descriptor);
}

/*

=item C<size_t Parrot_io_read_unix(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Calls C<read()> to return up to C<len> bytes in the memory starting at
C<buffer>.

=cut

*/

size_t
Parrot_io_read_unix(PARROT_INTERP, ARGMOD(PMC *filehandle),
              ARGIN(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_read_unix)
    const PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);
    const INTVAL file_flags = Parrot_io_get_flags(interp, filehandle);
    STRING * const s = Parrot_io_make_string(interp, buf, 2048);

    const size_t len = s->bufused;
    void * const buffer = Buffer_bufstart(s);

    for (;;) {
        const int bytes = read(file_descriptor, buffer, len);
        if (bytes > 0) {
            s->bufused = s->strlen = bytes;
            return bytes;
        }
        else if (bytes < 0) {
            switch (errno) {
              case EINTR:
                continue;
              default:
                s->bufused = s->strlen = 0;
                return bytes;
            }
        }
        else {
            /* Read returned 0, EOF if len requested > 0 */
            if (len > 0 || (file_flags & PIO_F_LINEBUF))
                Parrot_io_set_flags(interp, filehandle, (file_flags | PIO_F_EOF));
            s->bufused = s->strlen = 0;
            return bytes;
        }
    }
}

/*

=item C<size_t Parrot_io_write_unix(PARROT_INTERP, PMC *filehandle, STRING *s)>

Calls C<write()> to write C<len> bytes from the memory starting at
C<buffer> to the file descriptor in C<*io>.

=cut

*/

size_t
Parrot_io_write_unix(PARROT_INTERP, ARGIN(PMC *filehandle), ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_io_write_unix)
    const PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);
    const char * const buffer = s->strstart;
    const char * ptr          = buffer;

    size_t to_write = s->bufused;
    size_t written  = 0;

  write_through:
    while (to_write > 0) {
        const int err = write(file_descriptor, ptr, to_write);
        if (err >= 0) {
            ptr += err;
            to_write -= err;
            written += err;
        }
        else {
            switch (errno) {
            case EINTR:
                goto write_through;
#  ifdef EAGAIN
            case EAGAIN:
                return written;
#  endif
            default:
                return (size_t)-1;
            }
        }
    }
    return written;
}

/*

=item C<PIOOFF_T Parrot_io_seek_unix(PARROT_INTERP, PMC *filehandle, PIOOFF_T
offset, INTVAL whence)>

Hard seek.

Calls C<lseek()> to advance the read/write position on C<*io>'s file
descriptor to C<offset> bytes from the location indicated by C<whence>.

=cut

*/

PIOOFF_T
Parrot_io_seek_unix(PARROT_INTERP, ARGMOD(PMC *filehandle),
              PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(Parrot_io_seek_unix)
    PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);
    const PIOOFF_T pos        = lseek(file_descriptor, offset, whence);

    if (pos >= 0) {
        switch (whence) {
          case SEEK_SET:
            if (offset > Parrot_io_get_file_size(interp, filehandle)) {
                Parrot_io_set_file_size(interp, filehandle, offset);
            }
            break;
          case SEEK_CUR:
            {
                const PIOOFF_T avail = offset
                        + Parrot_io_get_buffer_next(interp, filehandle)
                        - Parrot_io_get_buffer_start(interp, filehandle);
                if (avail > Parrot_io_get_file_size(interp, filehandle)) {
                    Parrot_io_set_file_size(interp, filehandle, avail);
                }
             }
            break;
          case SEEK_END:
          default:
            break;
        }

        Parrot_io_set_file_position(interp, filehandle, pos);
    }
    /* Seek clears EOF */
    Parrot_io_set_flags(interp, filehandle,
            (Parrot_io_get_flags(interp, filehandle) & ~PIO_F_EOF));
    return pos;
}

/*

=item C<PIOOFF_T Parrot_io_tell_unix(PARROT_INTERP, PMC *filehandle)>

Returns the current read/write position on C<*io>'s file discriptor.

=cut

*/

PIOOFF_T
Parrot_io_tell_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_tell_unix)
    PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);
    const PIOOFF_T pos = lseek(file_descriptor, (PIOOFF_T)0, SEEK_CUR);

    return pos;
}

/*

=item C<PMC * Parrot_io_open_pipe_unix(PARROT_INTERP, PMC *filehandle, STRING
*command, int flags)>

Very limited C<exec> for now.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_open_pipe_unix(PARROT_INTERP, ARGMOD(PMC *filehandle),
        ARGIN(STRING *command), int flags)
{
    ASSERT_ARGS(Parrot_io_open_pipe_unix)
    /*
     * pipe(), fork() should be defined, if this header is present
     *        if that's not true, we need a test
     */
#  ifdef PARROT_HAS_HEADER_UNISTD
    int pid;
    int fds[2];
    const int f_read  = (flags & PIO_F_READ) != 0;
    const int f_write = (flags & PIO_F_WRITE) != 0;
    if (f_read == f_write)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Invalid pipe mode: %X", flags);

    if (pipe(fds) < 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Error opening pipe: %s", strerror(errno));

    pid = fork();
    if (pid < 0) {
        /* fork failed, cleaning up */
        close(fds[0]);
        close(fds[1]);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "fork failed: %s", strerror(errno));
    }
    else if (pid > 0) {
        /* Parent - return IO stream */
        PMC *io;
        if (PMC_IS_NULL(filehandle))
            io = Parrot_io_new_pmc(interp, flags & (PIO_F_READ|PIO_F_WRITE));
        else
            io = filehandle;

        /* Save the pid of the child, we'll wait for it when closing */
        VTABLE_set_integer_keyed_int(interp, io, 0, pid);

        if (f_read) {
            /* close this writer's end of pipe */
            close(fds[1]);
            Parrot_io_set_os_handle(interp, io, fds[0]);
        }
        else {  /* assume write only for now */
            /* close this reader's end */
            close(fds[0]);
            Parrot_io_set_os_handle(interp, io, fds[1]);
        }
        return io;
    }
    else /* (pid == 0) */ {
        /* Child - exec process */
        char * argv[4];
        /* C strings for the execv call defined without const to avoid
         * const problems without copying them.
         * Please don't change this without testing with a c++ compiler.
         */
        static char auxarg0[] = "/bin/sh";
        static char auxarg1[] = "-c";

        if (f_write) {
            /* the other end is writing - we read from the pipe */
            close(STDIN_FILENO);
            close(fds[1]);

            if (Parrot_dup(fds[0]) != STDIN_FILENO)
                exit(EXIT_FAILURE);
        }
        else {
            /* XXX redirect stdout, stderr to pipe */
            close(STDOUT_FILENO);
            close(STDERR_FILENO);
            close(fds[0]);

            if (Parrot_dup(fds[1]) != STDOUT_FILENO)
                exit(EXIT_FAILURE);
            if (Parrot_dup(fds[1]) != STDERR_FILENO)
                exit(EXIT_FAILURE);
        }

        argv [0] = auxarg0;
        argv [1] = auxarg1;
        argv [2] = Parrot_str_to_cstring(interp, command);
        argv [3] = NULL;
        execv(argv [0], argv);

        /* Will never reach this unless exec fails.
         * No need to clean up, we're just going to exit */
        perror("execvp");
        exit(EXIT_FAILURE);
    }

#  else
    UNUSED(filehandle);
    UNUSED(command);
    UNUSED(flags);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "pipe() unimplemented");
#  endif
}

/*

=item C<size_t Parrot_io_peek_unix(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Retrieve the next character in the stream without modifying the stream. Not
implemented on this platform.

=cut

*/

size_t
Parrot_io_peek_unix(PARROT_INTERP,
        SHIM(PMC *filehandle),
        SHIM(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_peek_unix)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "peek() not implemented");
}


/*

=item C<INTVAL Parrot_io_pipe_unix(PARROT_INTERP, PIOHANDLE *reader, PIOHANDLE
*writer)>

Uses C<pipe()> to create a matched pair of pipe fds.  Returns 0 on success, -1
on failure.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_pipe_unix(SHIM_INTERP, ARGMOD(PIOHANDLE *reader), ARGMOD(PIOHANDLE *writer))
{
    ASSERT_ARGS(Parrot_io_pipe_unix)
    int fds[2];
    const int rv = pipe(fds);

    if (rv >= 0) {
        *reader = fds[0];
        *writer = fds[1];
    }
    return rv;
}

#endif /* PIO_OS_UNIX */

/*

=back

=head1 SEE ALSO

F<src/io/common.c>,
F<src/io/win32.c>,
F<src/io/stdio.c>,
F<src/io/io_private.h>,
F<include/parrot/io_unix.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
