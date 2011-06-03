/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/platform/generic/io.c - UNIX IO utility functions

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
#include "../../io/io_private.h"

#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h> /* for pipe() */

#define DEFAULT_OPEN_MODE S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH

#ifndef STDIN_FILENO
#  define STDIN_FILENO 0
#endif

#ifndef STDOUT_FILENO
#  define STDOUT_FILENO 1
#endif

#ifndef STDERR_FILENO
#  define STDERR_FILENO 2
#endif

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CONST_FUNCTION
static int convert_flags_to_unix(INTVAL flags);

#define ASSERT_ARGS_convert_flags_to_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static int convert_flags_to_unix(INTVAL flags)>

Returns a UNIX-specific interpretation of C<flags> suitable for passing
to C<open()> and C<fopen()> in C<Parrot_io_open_unix()>.

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

=item C<PIOHANDLE Parrot_io_std_os_handle(PARROT_INTERP, INTVAL fileno)>

Returns a standard file handle.

=cut

*/

PIOHANDLE
Parrot_io_std_os_handle(PARROT_INTERP, INTVAL fileno)
{
    PIOHANDLE os_handle;

    switch (fileno) {
      case PIO_STDIN_FILENO:
      default:
        os_handle = STDIN_FILENO;
        break;
      case PIO_STDOUT_FILENO:
        os_handle = STDOUT_FILENO;
        break;
      case PIO_STDERR_FILENO:
        os_handle = STDERR_FILENO;
        break;
    }

    return os_handle;
}

/*

=item C<PIOHANDLE Parrot_io_open(PARROT_INTERP, STRING *path, INTVAL flags)>

Opens a string C<path>. C<flags> is a bitwise C<or> combination of C<PIO_F_*>
flag values.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_open(PARROT_INTERP, ARGIN(STRING *path), INTVAL flags)
{
    struct stat  buf;
    PIOHANDLE    fd;

    const int oflags   = convert_flags_to_unix(flags);
    char * const spath = Parrot_str_to_platform_cstring(interp, path);

    while ((fd = open(spath, oflags, DEFAULT_OPEN_MODE)) < 0
    &&      errno == EINTR)
        errno = 0;

    Parrot_str_free_cstring(spath);

    if (fd < 0)
        return PIO_INVALID_HANDLE;

    /* Don't open directories */
    if (fstat(fd, &buf) == -1
    ||  S_ISDIR(buf.st_mode)) {
        close(fd);
        return PIO_INVALID_HANDLE;
    }

    return fd;
}

/*

=item C<PIOHANDLE Parrot_io_dup(PARROT_INTERP, PIOHANDLE handle)>

Duplicates file handle C<handle>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_dup(SHIM_INTERP, PIOHANDLE handle)
{
    return dup(handle);
}

#if PARROT_ASYNC_DEVEL

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
#  if defined(linux)
    int rflags;
    PIOHANDLE file_descriptor = Parrot_io_get_os_handle(interp, filehandle);

    if ((rflags = fcntl(file_descriptor, F_GETFL, 0)) >= 0) {
        if (b)
            rflags |= O_ASYNC;
        else
            rflags &= ~O_ASYNC;
        return fcntl(file_descriptor, F_SETFL, rflags);
    }
#  else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_NOT_IMPLEMENTED,
        "Async support not available");
#  endif
    return -1;
}

#endif

/*

=item C<INTVAL Parrot_io_close(PARROT_INTERP, PIOHANDLE file_descriptor)>

Closes C<*io>'s file descriptor.

=cut

*/

INTVAL
Parrot_io_close(SHIM_INTERP, PIOHANDLE file_descriptor)
{
    INTVAL result = 0;

    /* BSD and Solaris need explicit fsync() */
    if (file_descriptor >= 0) {
        fsync(file_descriptor);

        if (close(file_descriptor) != 0)
            result = errno;
    }

    return result;
}


/*

=item C<INTVAL Parrot_io_is_tty(PARROT_INTERP, PIOHANDLE fd)>

Returns a boolean value indicating whether C<fd> is a console/tty.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_tty(SHIM_INTERP, PIOHANDLE fd)
{
    return isatty(fd);
}

/*

=item C<INTVAL Parrot_io_getblksize(PIOHANDLE fd)>

Various ways of determining block size.

If passed a file descriptor then C<fstat()> and the C<stat> buffer are
used if available.

If called without an argument then the C<BLKSIZE> constant is returned
if it was available at compile time, otherwise C<PIO_BLKSIZE> is returned.

=cut

*/

INTVAL
Parrot_io_getblksize(PIOHANDLE fd)
{
    if (fd >= 0) {
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
            if (err == 0) {
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

/*

=item C<INTVAL Parrot_io_flush(PARROT_INTERP, PIOHANDLE os_handle)>

At lowest layer all we can do for C<flush> is to ask the kernel to
C<sync()>.

XXX: Is it necessary to C<sync()> here?

=cut

*/

INTVAL
Parrot_io_flush(SHIM_INTERP, PIOHANDLE os_handle)
{
    return fsync(os_handle);
}

/*

=item C<size_t Parrot_io_read(PARROT_INTERP, PIOHANDLE os_handle, char *buf,
size_t len)>

Calls C<read()> to return up to C<len> bytes in the memory starting at
C<buffer>.

=cut

*/

size_t
Parrot_io_read(PARROT_INTERP, PIOHANDLE os_handle, ARGOUT(char *buf), size_t len)
{

    for (;;) {
        const int bytes = read(os_handle, buf, len);

        if (bytes >= 0)
            return bytes;

        if (errno != EINTR)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Read error: %s", strerror(errno));
    }
}

/*

=item C<size_t Parrot_io_write(PARROT_INTERP, PIOHANDLE os_handle, const char
*buf, size_t len)>

Calls C<write()> to write C<len> bytes from the memory starting at
C<buffer> to the file descriptor in C<*io>.

=cut

*/

size_t
Parrot_io_write(PARROT_INTERP, PIOHANDLE os_handle,
        ARGIN(const char *buf), size_t len)
{
    const char *ptr      = buf;
    size_t      to_write = len;
    size_t      written  = 0;

    while (to_write > 0) {
        const int count = write(os_handle, ptr, to_write);

        if (count >= 0) {
            ptr      += count;
            to_write -= count;
            written  += count;
        }
        else {
            switch (errno) {
            case EINTR:
                continue;
#ifdef EAGAIN
            case EAGAIN:
                break;
#endif
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                        "Write error: %s", strerror(errno));
            }
        }
    }

    return written;
}

/*

=item C<PIOOFF_T Parrot_io_seek(PARROT_INTERP, PIOHANDLE os_handle, PIOOFF_T
offset, INTVAL whence)>

Hard seek.

Calls C<lseek()> to advance the read/write position on C<*io>'s file
descriptor to C<offset> bytes from the location indicated by C<whence>.

=cut

*/

PIOOFF_T
Parrot_io_seek(SHIM_INTERP, PIOHANDLE os_handle, PIOOFF_T offset, INTVAL whence)
{
    const PIOOFF_T pos = lseek(os_handle, offset, whence);

    return pos;
}

/*

=item C<PIOOFF_T Parrot_io_tell(PARROT_INTERP, PIOHANDLE os_handle)>

Returns the current read/write position on C<*io>'s file descriptor.

=cut

*/

PIOOFF_T
Parrot_io_tell(SHIM_INTERP, PIOHANDLE os_handle)
{
    const PIOOFF_T pos = lseek(os_handle, (PIOOFF_T)0, SEEK_CUR);

    return pos;
}

/*

=item C<PIOHANDLE Parrot_io_open_pipe(PARROT_INTERP, STRING *command, INTVAL
flags, INTVAL *pid_out)>

Very limited C<exec> for now.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_open_pipe(PARROT_INTERP, ARGIN(STRING *command), INTVAL flags,
        ARGOUT(INTVAL *pid_out))
{
    PIOHANDLE handles[3];

    if (flags & PIO_F_READ) {
        *pid_out = Parrot_proc_exec(interp, command, PARROT_EXEC_STDOUT,
                        handles);
        return handles[1];
    }
    else {
        *pid_out = Parrot_proc_exec(interp, command, PARROT_EXEC_STDIN,
                        handles);
        return handles[0];
    }
}

/*

=item C<INTVAL Parrot_io_pipe(PARROT_INTERP, PIOHANDLE *reader, PIOHANDLE
*writer)>

Uses C<pipe()> to create a matched pair of pipe fds.  Returns 0 on success, -1
on failure.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_pipe(SHIM_INTERP, ARGMOD(PIOHANDLE *reader), ARGMOD(PIOHANDLE *writer))
{
    int fds[2];
    const int rv = pipe(fds);

    if (rv >= 0) {
        *reader = fds[0];
        *writer = fds[1];
    }
    return rv;
}

/*

=back

=head1 SEE ALSO

F<src/io/api.c>,
F<src/io/io_private.h>,
F<include/parrot/io.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
