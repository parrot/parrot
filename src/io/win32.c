/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/io/win32.c - Win32 I/O utility functions

=head1 DESCRIPTION

This file implements OS-specific I/O functions for Win32 platforms.

=head2 References

Win32 System Programming, 2nd Edition.

=head2 Functions

=over 4

=cut

*/

#ifdef WIN32
#  include <windows.h>
#endif

#include "parrot/parrot.h"
#include "pmc/pmc_filehandle.h"
#include "io_private.h"

#ifdef PIO_OS_WIN32

/* HEADERIZER HFILE: include/parrot/io_win32.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL convert_flags_to_win32(
    INTVAL flags,
    ARGOUT(DWORD * fdwAccess),
    ARGOUT(DWORD * fdwShareMode),
    ARGOUT(DWORD * fdwCreate))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* fdwAccess)
        FUNC_MODIFIES(* fdwShareMode)
        FUNC_MODIFIES(* fdwCreate);

PARROT_WARN_UNUSED_RESULT
static INTVAL io_is_tty_win32(PIOHANDLE fd);

#define ASSERT_ARGS_convert_flags_to_win32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(fdwAccess) \
    , PARROT_ASSERT_ARG(fdwShareMode) \
    , PARROT_ASSERT_ARG(fdwCreate))
#define ASSERT_ARGS_io_is_tty_win32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#  include <tchar.h>

#  define PIO_TRACE 0

/*

=item C<static INTVAL convert_flags_to_win32(INTVAL flags, DWORD * fdwAccess,
DWORD * fdwShareMode, DWORD * fdwCreate)>

Convert to platform-specific bit open flags.

=cut

*/

static INTVAL
convert_flags_to_win32(INTVAL flags, ARGOUT(DWORD * fdwAccess),
               ARGOUT(DWORD * fdwShareMode), ARGOUT(DWORD * fdwCreate))
{
    ASSERT_ARGS(convert_flags_to_win32)
    static DWORD dwDefaultShareMode;
    if (!dwDefaultShareMode) {
        OSVERSIONINFO osvi;
        osvi.dwOSVersionInfoSize = sizeof (osvi);
        GetVersionEx(&osvi);
        if (osvi.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS) {
            dwDefaultShareMode = FILE_SHARE_READ | FILE_SHARE_WRITE;
        }
        else {
            dwDefaultShareMode =
                FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE;
        }
    }

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == (PIO_F_WRITE | PIO_F_READ)) {
        *fdwAccess = GENERIC_WRITE | GENERIC_READ;
        if (flags & PIO_F_TRUNC)
            *fdwCreate = CREATE_ALWAYS;
        else
            *fdwCreate = OPEN_ALWAYS;
    }
    else if (flags & PIO_F_WRITE) {
        *fdwAccess = GENERIC_WRITE;
        if (flags & PIO_F_TRUNC)
            *fdwCreate = CREATE_ALWAYS;
        else
            *fdwCreate = OPEN_ALWAYS;
    }
    else if (flags & PIO_F_READ) {
        *fdwAccess = GENERIC_READ;
        *fdwCreate = OPEN_EXISTING;
    }

    *fdwShareMode = dwDefaultShareMode;
    if (flags & PIO_F_APPEND) {
        /* dealt with specially in _write and _puts */
    }
    return 1;
}

/*

=item C<INTVAL Parrot_io_init_win32(PARROT_INTERP)>

Sets up the standard C<std*> IO handles.

=cut

*/

INTVAL
Parrot_io_init_win32(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_init_win32)
    HANDLE h;
    struct WSAData sockinfo;
    int ret;

    if ((h = GetStdHandle(STD_INPUT_HANDLE)) != INVALID_HANDLE_VALUE) {
        _PIO_STDIN(interp) = Parrot_io_fdopen_win32(interp, PMCNULL, h, PIO_F_READ);
    }
    else {
        _PIO_STDIN(interp) = PMCNULL;
    }
    if ((h = GetStdHandle(STD_OUTPUT_HANDLE)) != INVALID_HANDLE_VALUE) {
        _PIO_STDOUT(interp) = Parrot_io_fdopen_win32(interp, PMCNULL, h, PIO_F_WRITE);
    }
    else {
        _PIO_STDOUT(interp) = PMCNULL;
    }
    if ((h = GetStdHandle(STD_ERROR_HANDLE)) != INVALID_HANDLE_VALUE) {
        _PIO_STDERR(interp) = Parrot_io_fdopen_win32(interp, PMCNULL, h, PIO_F_WRITE);
    }
    else {
        _PIO_STDERR(interp) = PMCNULL;
    }
    /* Start Winsock
     * no idea where or whether destroy it
     */
    ret = WSAStartup(2, &sockinfo);
    if (ret != 0) {
        fprintf(stderr, "WSAStartup failed!!\n ErrorCode=%i\n\n",
                  WSAGetLastError());
        return -4;
    }
    return 0;
}

/*

=item C<INTVAL Parrot_io_getblksize_win32(PIOHANDLE fd)>

Returns C<PIO_BLKSIZE>.

=cut

*/

INTVAL
Parrot_io_getblksize_win32(SHIM(PIOHANDLE fd))
{
    ASSERT_ARGS(Parrot_io_getblksize_win32)
    /* Hard coded for now */
    return PIO_BLKSIZE;
}

/*

=item C<PMC * Parrot_io_open_win32(PARROT_INTERP, PMC *filehandle, STRING *path,
INTVAL flags)>

Calls C<CreateFile()> to open C<*spath> with the Win32 translation of
C<flags>.

=cut

*/

PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_open_win32(PARROT_INTERP, ARGMOD(PMC *filehandle),
               ARGIN(STRING *path), INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_open_win32)
    DWORD fAcc, fShare, fCreat;
    PIOHANDLE fd;

#  if 0
    if ((Interp_flags_TEST(interp, PARROT_DEBUG_FLAG)) != 0) {
        fprintf(stderr, "Parrot_io_open_win32: %s\n", spath);
    }
#  endif
    if (flags & PIO_F_PIPE)
        return Parrot_io_open_pipe_win32(interp, filehandle, path, flags);

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        return NULL;

    /* Set open flags - <, >, >>, +<, +> */
    /* add ? and ! for block/non-block */
    if (convert_flags_to_win32(flags, &fAcc, &fShare, &fCreat) < 0)
        return NULL;

    /* Only files for now */
    flags |= PIO_F_FILE;

    { /* enclosing scope for temporary C string */
        char * const spath = Parrot_str_to_cstring(interp, path);
        fd = CreateFile(spath, fAcc, fShare, NULL, fCreat,
                    FILE_ATTRIBUTE_NORMAL, NULL);
        Parrot_str_free_cstring(spath);
    }
    if (fd != INVALID_HANDLE_VALUE) {
        PMC *io;
        if (PMC_IS_NULL(filehandle))
            io = Parrot_io_new_pmc(interp, flags);
        else {
            io = filehandle;
            Parrot_io_set_flags(interp, io, flags);
        }

        Parrot_io_set_os_handle(interp, io, fd);
        return io;
    }
    else {
        int err = GetLastError();
        if (err) {
            errno = err;
        }
    }

    return PMCNULL;
}

/*

=item C<PMC * Parrot_io_fdopen_win32(PARROT_INTERP, PMC *filehandle, PIOHANDLE
fd, INTVAL flags)>

Returns a new C<PMC> with C<fd> as its file descriptor.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_fdopen_win32(PARROT_INTERP, ARGMOD_NULLOK(PMC *filehandle),
        PIOHANDLE fd, INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_fdopen_win32)
    PMC *io;

    if (io_is_tty_win32(fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    if (PMC_IS_NULL(filehandle))
        io = Parrot_io_new_pmc(interp, flags);
    else {
        io = filehandle;
        Parrot_io_set_flags(interp, io, flags);
    }

    Parrot_io_set_os_handle(interp, io, fd);
    return io;
}

/*

=item C<INTVAL Parrot_io_close_piohandle_win32(PARROT_INTERP, PIOHANDLE handle)>

Calls C<CloseHandle()> to close the given file descriptor.  Returns 0 on
success, -1 on error.

=cut

*/

INTVAL
Parrot_io_close_piohandle_win32(PARROT_INTERP, PIOHANDLE handle)
{
    ASSERT_ARGS(Parrot_io_close_piohandle_win32)

    if (handle == INVALID_HANDLE_VALUE)
        return -1;

    return CloseHandle(handle) ? 0 : -1;
}

/*

=item C<INTVAL Parrot_io_close_win32(PARROT_INTERP, PMC *filehandle)>

Calls C<CloseHandle()> to close C<*io>'s file descriptor.

=cut

*/

INTVAL
Parrot_io_close_win32(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_close_win32)
    UINTVAL result = 0;
    PIOHANDLE os_handle = Parrot_io_get_os_handle(interp, filehandle);
    if (os_handle != INVALID_HANDLE_VALUE) {
        int flags = Parrot_io_get_flags(interp, filehandle);
        if (CloseHandle(os_handle) == 0)
            result = GetLastError();
        Parrot_io_set_os_handle(interp, filehandle, INVALID_HANDLE_VALUE);

        if (flags & PIO_F_PIPE) {
            INTVAL procid  = VTABLE_get_integer_keyed_int(interp, filehandle, 0);
            HANDLE process = (HANDLE) procid;
            DWORD  status  = WaitForSingleObject(process, INFINITE);
            DWORD  exit_code;

            if (status != WAIT_FAILED && GetExitCodeProcess(process, &exit_code))
                SETATTR_FileHandle_exit_status(interp, filehandle, exit_code);
            else
                SETATTR_FileHandle_exit_status(interp, filehandle, 1);
            CloseHandle(process);
        }
    }
    return (result != 0);
}

/*

=item C<INTVAL Parrot_io_is_closed_win32(PARROT_INTERP, PMC *filehandle)>

Test whether the filehandle has been closed.

=cut

*/

INTVAL
Parrot_io_is_closed_win32(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_is_closed_win32)
    if (Parrot_io_get_os_handle(interp, filehandle) == INVALID_HANDLE_VALUE)
        return 1;

    return 0;
}

/*

=item C<static INTVAL io_is_tty_win32(PIOHANDLE fd)>

Returns whether C<fd> is a console/tty.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
io_is_tty_win32(PIOHANDLE fd)
{
    ASSERT_ARGS(io_is_tty_win32)
    const DWORD ftype = GetFileType(fd);
    return (ftype == FILE_TYPE_CHAR);
}

/*

=item C<INTVAL Parrot_io_flush_win32(PARROT_INTERP, PMC *filehandle)>

Calls C<FlushFileBuffers()> to flush C<*io>'s file descriptor.

=cut

*/

INTVAL
Parrot_io_flush_win32(PARROT_INTERP, ARGMOD(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_flush_win32)
    /*
     * FlushFileBuffers won't work for console handles. From the MS help file:
     *
     * Windows NT: The function fails if hFile is a handle to console
     * output. That is because console output is not buffered.  The
     * function returns FALSE, and GetLastError returns
     * ERROR_INVALID_HANDLE.
     *
     * Windows 9x: The function does nothing if hFile is a handle to
     * console output. That is because console output is not buffered.
     * The function returns TRUE, but it does nothing.
     */
    return FlushFileBuffers(Parrot_io_get_os_handle(interp, filehandle));
}

/*

=item C<size_t Parrot_io_read_win32(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Calls C<ReadFile()> to read up to C<len> bytes from C<*io>'s file
descriptor to the memory starting at C<buffer>.

=cut

*/

size_t
Parrot_io_read_win32(PARROT_INTERP,
        ARGMOD(PMC *filehandle),
        ARGOUT(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_read_win32)
    DWORD countread;
    void *buffer;
    size_t len;
    STRING *s;

    s = Parrot_io_make_string(interp, buf, 2048);
    len = s->bufused;
    buffer = Buffer_bufstart(s);

    if (ReadFile(Parrot_io_get_os_handle(interp, filehandle),
                (LPVOID) buffer, (DWORD) len, &countread, NULL)) {
        if (countread > 0) {
            s->bufused = s->strlen = countread;
            return (size_t)countread;
        }
        else if (len > 0)
            /* EOF if read 0 and bytes were requested */
            Parrot_io_set_flags(interp, filehandle,
                    (Parrot_io_get_flags(interp, filehandle) | PIO_F_EOF));
    }
    else {
        /* FIXME : An error occured */
            Parrot_io_set_flags(interp, filehandle,
                    (Parrot_io_get_flags(interp, filehandle) | PIO_F_EOF));
    }

    s->bufused = s->strlen = 0;
    return 0;
}

/*

=item C<size_t Parrot_io_write_win32(PARROT_INTERP, PMC *filehandle, const
STRING *s)>

Calls C<WriteFile()> to write C<len> bytes from the memory starting at
C<buffer> to C<*io>'s file descriptor. Returns C<(size_t)-1> on
failure.

=cut

*/

size_t
Parrot_io_write_win32(PARROT_INTERP, ARGIN(PMC *filehandle), ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_io_write_win32)
    DWORD countwrote = 0;
    DWORD err;
    void * const buffer = s->strstart;
    DWORD len = (DWORD) s->bufused;
    PIOHANDLE os_handle = Parrot_io_get_os_handle(interp, filehandle);

    /* do it by hand, Win32 hasn't any specific flag */
    if (Parrot_io_get_flags(interp, filehandle) & PIO_F_APPEND) {
        LARGE_INTEGER p;
        p.LowPart = 0;
        p.HighPart = 0;
        p.LowPart = SetFilePointer(os_handle, p.LowPart,
                                   &p.HighPart, FILE_END);
        if (p.LowPart == 0xFFFFFFFF && (GetLastError() != NO_ERROR)) {
            /* Error - exception */
            return (size_t)-1;
        }
    }

    if (WriteFile(os_handle, (LPCSTR) buffer, len, &countwrote, NULL))
        return countwrote;

    /* Write may have failed because of small buffers,
     * see TT #710 for example.
     * Let's try writing in small chunks */
    if ((err = GetLastError()) == ERROR_NOT_ENOUGH_MEMORY || err == ERROR_INVALID_USER_BUFFER) {
        DWORD chunk = 4096; /* Arbitrarily choosen value */
        if (len < chunk)
            goto fail;
        while (len > 0) {
            if (chunk > len)
                chunk = len;
            if (WriteFile(os_handle, (LPCSTR) buffer, chunk, &countwrote, NULL) == 0 ||
                    countwrote != chunk)
                goto fail;
            len -= chunk;
        }
        return len;
    }
fail:
    /* FIXME: Set error flag */
    return (size_t)-1;
}

/*

=item C<PIOOFF_T Parrot_io_seek_win32(PARROT_INTERP, PMC *filehandle, PIOOFF_T
off, INTVAL whence)>

Hard seek.

Calls C<SetFilePointer()> to move the read/write position of C<*io>'s
file descriptor to C<off> bytes relative to the location specified by
C<whence>.

=cut

*/

PIOOFF_T
Parrot_io_seek_win32(PARROT_INTERP, ARGMOD(PMC *filehandle),
               PIOOFF_T off, INTVAL whence)
{
    ASSERT_ARGS(Parrot_io_seek_win32)
    LARGE_INTEGER offset;

    offset.QuadPart = off;
    /* offset.HighPart gets overwritten */
    offset.LowPart = SetFilePointer(Parrot_io_get_os_handle(interp, filehandle),
                                    offset.LowPart, &offset.HighPart, whence);
    if (offset.LowPart == 0xFFFFFFFF && (GetLastError() != NO_ERROR)) {
        /* Error - exception */
        return -1;
    }
    Parrot_io_set_file_position(interp, filehandle, offset.QuadPart);
    return offset.QuadPart;
}

/*

=item C<PIOOFF_T Parrot_io_tell_win32(PARROT_INTERP, PMC *filehandle)>

Returns the current read/write position of C<*io>'s file descriptor.

=cut

*/

PIOOFF_T
Parrot_io_tell_win32(PARROT_INTERP, ARGIN(PMC *filehandle))
{
    ASSERT_ARGS(Parrot_io_tell_win32)
    LARGE_INTEGER p;

    p.QuadPart = piooffsetzero;
    p.LowPart = SetFilePointer(Parrot_io_get_os_handle(interp, filehandle),
                               0, &p.HighPart, FILE_CURRENT);
    if (p.LowPart == 0xFFFFFFFF && GetLastError() != NO_ERROR) {
        /* FIXME: Error - exception */
    }
    return p.QuadPart;
}

/*

=item C<size_t Parrot_io_peek_win32(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Retrieve the next character in the stream without modifying the stream. Not
implemented for this platform.

=cut

*/

size_t
Parrot_io_peek_win32(PARROT_INTERP,
        SHIM(PMC *filehandle),
        SHIM(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_peek_win32)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "peek() not implemented");
}

/*

=item C<PMC * Parrot_io_open_pipe_win32(PARROT_INTERP, PMC *filehandle, STRING
*command, int flags)>

Open a pipe. Not implemented for this platform.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_open_pipe_win32(PARROT_INTERP, ARGMOD(PMC *filehandle),
        ARGIN(STRING *command), int flags)
{
    ASSERT_ARGS(Parrot_io_open_pipe_win32)

    HANDLE current = GetCurrentProcess();
    HANDLE hnull = INVALID_HANDLE_VALUE;
    HANDLE hread = INVALID_HANDLE_VALUE;
    HANDLE hwrite = INVALID_HANDLE_VALUE;
    HANDLE hchild = INVALID_HANDLE_VALUE;
    STARTUPINFO start;
    SECURITY_ATTRIBUTES sec;
    PROCESS_INFORMATION procinfo;
    char *cmd = NULL;
    const char *comspec;
    PMC *io = PMC_IS_NULL(filehandle) ? Parrot_io_new_pmc(interp, flags) : filehandle;
    STRING *auxcomm;
    int f_read = (flags & PIO_F_READ) != 0;
    int f_write = (flags & PIO_F_WRITE) != 0;
    if (f_read == f_write)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Invalid pipe mode: %X", flags);

    procinfo.hThread = INVALID_HANDLE_VALUE;
    procinfo.hProcess = INVALID_HANDLE_VALUE;
    sec.nLength = sizeof sec;
    sec.lpSecurityDescriptor = NULL;
    sec.bInheritHandle = TRUE;

    comspec = getenv("COMSPEC");
    if (comspec == NULL)
        comspec = "cmd";
    auxcomm = Parrot_str_new(interp, comspec, 0);
    auxcomm = Parrot_str_concat(interp, auxcomm, Parrot_str_new(interp, " /c ", 0));
    auxcomm = Parrot_str_concat(interp, auxcomm, command);
    cmd = Parrot_str_to_cstring(interp, auxcomm);
    start.cb = sizeof start;
    GetStartupInfo(&start);
    start.dwFlags = STARTF_USESTDHANDLES;
    if (CreatePipe(&hread, &hwrite, NULL, 0) == 0)
        goto fail;
    if (DuplicateHandle(current, f_read ? hwrite : hread,
            current, &hchild,
            0, TRUE,
            DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS)
            == 0)
        goto fail;
    if (hchild == INVALID_HANDLE_VALUE)
        goto fail;

    if (f_read) {
        /* Redirect input to NULL. This is to avoid
         * interferences in case both the child and
         * the parent tries to read from stdin.
         * May be unneccessary or even interfere
         * with valid usages, need more feedback. */
        hnull = CreateFile("NUL", GENERIC_READ|GENERIC_WRITE,
                0, &sec, OPEN_EXISTING,
                FILE_ATTRIBUTE_NORMAL, NULL);
        if (hnull == INVALID_HANDLE_VALUE)
            goto fail;
        start.hStdInput  = hnull;
        start.hStdOutput = hchild;
        start.hStdError  = hchild;
    }
    else {
        start.hStdInput = hchild;
    }

    if (CreateProcess(NULL,
            cmd,
            NULL, NULL, TRUE, 0,
            NULL, NULL, &start, &procinfo) == 0)
        goto fail;
    if (f_read) {
        Parrot_io_set_os_handle(interp, io, hread);
        CloseHandle(hwrite);
    }
    else {
        Parrot_io_set_os_handle(interp, io, hwrite);
        CloseHandle(hread);
    }

    Parrot_str_free_cstring(cmd);
    CloseHandle(procinfo.hThread);
    VTABLE_set_integer_keyed_int(interp, io, 0, (INTVAL)procinfo.hProcess);
    return io;

fail:
    if (cmd != NULL)
        Parrot_str_free_cstring(cmd);
    if (hnull != INVALID_HANDLE_VALUE)
        CloseHandle(hnull);
    if (hread != INVALID_HANDLE_VALUE)
        CloseHandle(hread);
    if (hwrite != INVALID_HANDLE_VALUE)
        CloseHandle(hwrite);
    if (hchild != INVALID_HANDLE_VALUE)
        CloseHandle(hchild);
    if (procinfo.hThread != INVALID_HANDLE_VALUE)
        CloseHandle(procinfo.hThread);
    if (procinfo.hProcess != INVALID_HANDLE_VALUE)
        CloseHandle(procinfo.hProcess);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "pipe open error");
}

/*

=item C<INTVAL Parrot_io_pipe_win32(PARROT_INTERP, PIOHANDLE *reader, PIOHANDLE
*writer)>

Uses CreatePipe() to create a matched pair of pipe handles.  Returns 0 on
success, -1 on failure.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_pipe_win32(SHIM_INTERP, ARGMOD(PIOHANDLE *reader), ARGMOD(PIOHANDLE *writer))
{
    ASSERT_ARGS(Parrot_io_pipe_win32)
    return CreatePipe(reader, writer, NULL, 0) ? 0 : -1;
}

#endif /* PIO_OS_WIN32 */

/*

=back

=head1 SEE ALSO

F<src/io/unix.c>,
F<src/io/stdio.c>,
F<src/io/io.c>,
F<src/io/io_private.h>.
F<include/parrot/io_win32.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
