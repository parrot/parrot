/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/platform/win32/io.c - Win32 I/O utility functions

=head1 DESCRIPTION

This file implements OS-specific I/O functions for Win32 platforms.

=head2 References

Win32 System Programming, 2nd Edition.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "../../io/io_private.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void convert_flags_to_win32(
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

#define ASSERT_ARGS_convert_flags_to_win32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(fdwAccess) \
    , PARROT_ASSERT_ARG(fdwShareMode) \
    , PARROT_ASSERT_ARG(fdwCreate))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#include <tchar.h>

#define PIO_TRACE 0

/*

=item C<static void convert_flags_to_win32(INTVAL flags, DWORD * fdwAccess,
DWORD * fdwShareMode, DWORD * fdwCreate)>

Convert to platform-specific bit open flags.

=cut

*/

static void
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
}

/*

=item C<PIOHANDLE Parrot_io_std_os_handle(PARROT_INTERP, INTVAL fileno)>

Returns a standard file handle.

=cut

*/

PIOHANDLE
Parrot_io_std_os_handle(PARROT_INTERP, INTVAL fileno)
{
    DWORD nStdHandle;

    switch (fileno) {
      case PIO_STDIN_FILENO:
      default:
        nStdHandle = STD_INPUT_HANDLE;
        break;
      case PIO_STDOUT_FILENO:
        nStdHandle = STD_OUTPUT_HANDLE;
        break;
      case PIO_STDERR_FILENO:
        nStdHandle = STD_ERROR_HANDLE;
        break;
    }

    return GetStdHandle(nStdHandle);
}

/*

=item C<INTVAL Parrot_io_getblksize(PIOHANDLE fd)>

Returns C<PIO_BLKSIZE>.

=cut

*/

INTVAL
Parrot_io_getblksize(SHIM(PIOHANDLE fd))
{
    /* Hard coded for now */
    return PIO_BLKSIZE;
}

/*

=item C<PIOHANDLE Parrot_io_open(PARROT_INTERP, STRING *path, INTVAL flags)>

Calls C<CreateFile()> to open C<*spath> with the Win32 translation of
C<flags>.

=cut

*/

PARROT_CAN_RETURN_NULL
PIOHANDLE
Parrot_io_open(PARROT_INTERP, ARGIN(STRING *path), INTVAL flags)
{
    DWORD      fAcc, fShare, fCreat;
    PIOHANDLE  fd;
    char      *spath;

#if 0
    if ((Interp_flags_TEST(interp, PARROT_DEBUG_FLAG)) != 0) {
        fprintf(stderr, "Parrot_io_open: %s\n", spath);
    }
#endif

    /* Set open flags - <, >, >>, +<, +> */
    /* add ? and ! for block/non-block */
    convert_flags_to_win32(flags, &fAcc, &fShare, &fCreat);

    if (path->encoding == Parrot_ascii_encoding_ptr) {
        spath = Parrot_str_to_encoded_cstring(interp, path,
                    Parrot_ascii_encoding_ptr);
        fd = CreateFile(spath, fAcc, fShare, NULL, fCreat,
                    FILE_ATTRIBUTE_NORMAL, NULL);
    }
    else {
        spath = Parrot_str_to_encoded_cstring(interp, path,
                    Parrot_utf16_encoding_ptr);
        fd = CreateFileW((LPCWSTR)spath, fAcc, fShare, NULL, fCreat,
                    FILE_ATTRIBUTE_NORMAL, NULL);
    }

    Parrot_str_free_cstring(spath);

    return fd;
}

/*

=item C<PIOHANDLE Parrot_io_dup(PARROT_INTERP, PIOHANDLE handle)>

Duplicates file handle C<handle>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_dup(PARROT_INTERP, PIOHANDLE handle)
{
    HANDLE current_process = GetCurrentProcess();
    HANDLE new_handle      = INVALID_HANDLE_VALUE;

    DuplicateHandle(current_process,
        (HANDLE)handle,
        current_process,
        &new_handle,
        0,
        FALSE,
        DUPLICATE_SAME_ACCESS);

    return new_handle;
}

/*

=item C<INTVAL Parrot_io_close(PARROT_INTERP, PIOHANDLE os_handle)>

Calls C<CloseHandle()> to close C<*io>'s file descriptor.

=cut

*/

INTVAL
Parrot_io_close(PARROT_INTERP, PIOHANDLE os_handle)
{
    UINTVAL result = 0;

    if (os_handle != INVALID_HANDLE_VALUE) {
        if (CloseHandle(os_handle) == 0)
            result = GetLastError();
    }

    return (result != 0);
}


/*

=item C<INTVAL Parrot_io_is_tty(PARROT_INTERP, PIOHANDLE fd)>

Returns whether C<fd> is a console/tty.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_tty(SHIM_INTERP, PIOHANDLE fd)
{
    const DWORD ftype = GetFileType(fd);
    return (ftype == FILE_TYPE_CHAR);
}

/*

=item C<INTVAL Parrot_io_flush(PARROT_INTERP, PIOHANDLE os_handle)>

Calls C<FlushFileBuffers()> to flush C<*io>'s file descriptor.

=cut

*/

INTVAL
Parrot_io_flush(PARROT_INTERP, PIOHANDLE os_handle)
{
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
    return FlushFileBuffers(os_handle);
}

/*

=item C<size_t Parrot_io_read(PARROT_INTERP, PIOHANDLE os_handle, char *buf,
size_t len)>

Calls C<ReadFile()> to read up to C<len> bytes from C<*io>'s file
descriptor to the memory starting at C<buffer>.

=cut

*/

size_t
Parrot_io_read(PARROT_INTERP, PIOHANDLE os_handle, ARGOUT(char *buf), size_t len)
{
    DWORD countread;
    BOOL  success = ReadFile(os_handle, (LPVOID)buf, (DWORD)len,
                        &countread, NULL);

    if (!success) {
        DWORD err = GetLastError();

        if (err != ERROR_BROKEN_PIPE)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Read error: %Ss",
                    Parrot_platform_strerror(interp, err));
    }

    return countread;
}

/*

=item C<size_t Parrot_io_write(PARROT_INTERP, PIOHANDLE os_handle, const char
*buf, size_t len)>

Calls C<WriteFile()> to write C<len> bytes from the memory starting at
C<buffer> to C<*io>'s file descriptor. Returns C<(size_t)-1> on
failure.

=cut

*/

size_t
Parrot_io_write(PARROT_INTERP, PIOHANDLE os_handle,
        ARGIN(const char *buf), size_t len)
{
    DWORD countwrote = 0;
    DWORD err;

    if (WriteFile(os_handle, (LPCSTR)buf, len, &countwrote, NULL))
        return countwrote;

    err = GetLastError();

    /* Write may have failed because of small buffers,
     * see TT #710 for example.
     * Let's try writing in small chunks */
    if (err == ERROR_NOT_ENOUGH_MEMORY
    ||  err == ERROR_INVALID_USER_BUFFER) {
        DWORD chunk   = 4096; /* Arbitrarily choosen value */
        DWORD written = 0;

        if (len < chunk)
            goto fail;

        while (len > 0) {
            if (chunk > len)
                chunk = len;
            if (WriteFile(os_handle, (LPCSTR) buf, chunk, &countwrote, NULL) == 0)
                goto fail;

            buf     += countwrote;
            len     -= countwrote;
            written += countwrote;

            if (countwrote < chunk)
                break;
        }

        return written;
    }
fail:
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Write error: %Ss", Parrot_platform_strerror(interp, err));
}

/*

=item C<PIOOFF_T Parrot_io_seek(PARROT_INTERP, PIOHANDLE os_handle, PIOOFF_T
off, INTVAL whence)>

Hard seek.

Calls C<SetFilePointer()> to move the read/write position of C<*io>'s
file descriptor to C<off> bytes relative to the location specified by
C<whence>.

=cut

*/

PIOOFF_T
Parrot_io_seek(PARROT_INTERP, PIOHANDLE os_handle,
        PIOOFF_T off, INTVAL whence)
{
    LARGE_INTEGER offset;

    offset.QuadPart = off;
    /* offset.HighPart gets overwritten */
    offset.LowPart = SetFilePointer(os_handle, offset.LowPart,
                        &offset.HighPart, whence);

    if (offset.LowPart == INVALID_SET_FILE_POINTER) {
        DWORD err = GetLastError();

        if (err != NO_ERROR)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "seek failed: %Ss",
                    Parrot_platform_strerror(interp, err));
    }

    return offset.QuadPart;
}

/*

=item C<PIOOFF_T Parrot_io_tell(PARROT_INTERP, PIOHANDLE os_handle)>

Returns the current read/write position of C<*io>'s file descriptor.

=cut

*/

PIOOFF_T
Parrot_io_tell(PARROT_INTERP, PIOHANDLE os_handle)
{
    LARGE_INTEGER p;

    p.QuadPart = piooffsetzero;
    p.LowPart = SetFilePointer(os_handle, 0, &p.HighPart, FILE_CURRENT);

    if (p.LowPart == 0xFFFFFFFF) {
        DWORD err = GetLastError();

        if (err != NO_ERROR)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "tell failed: %Ss",
                    Parrot_platform_strerror(interp, err));
    }

    return p.QuadPart;
}

/*

=item C<PIOHANDLE Parrot_io_open_pipe(PARROT_INTERP, STRING *command, INTVAL
flags, INTVAL *pid)>

Open a pipe. Not implemented for this platform.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_open_pipe(PARROT_INTERP, ARGIN(STRING *command), INTVAL flags,
        ARGOUT(INTVAL *pid))
{

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
    STRING *auxcomm;
    PIOHANDLE os_handle;

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
    if (DuplicateHandle(current, flags & PIO_F_READ ? hwrite : hread,
            current, &hchild,
            0, TRUE,
            DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS)
            == 0)
        goto fail;
    if (hchild == INVALID_HANDLE_VALUE)
        goto fail;

    if (flags & PIO_F_READ) {
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

    if (flags & PIO_F_READ) {
        os_handle = hread;
        CloseHandle(hwrite);
    }
    else {
        os_handle = hwrite;
        CloseHandle(hread);
    }

    Parrot_str_free_cstring(cmd);
    CloseHandle(procinfo.hThread);

    *pid = (INTVAL)procinfo.hProcess;

    return os_handle;

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

=item C<INTVAL Parrot_io_pipe(PARROT_INTERP, PIOHANDLE *reader, PIOHANDLE
*writer)>

Uses CreatePipe() to create a matched pair of pipe handles.  Returns 0 on
success, -1 on failure.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_io_pipe(SHIM_INTERP, ARGMOD(PIOHANDLE *reader), ARGMOD(PIOHANDLE *writer))
{
    return CreatePipe(reader, writer, NULL, 0) ? 0 : -1;
}

/*

=back

=head1 SEE ALSO

F<src/platform/generic/io.c>,
F<src/io/api.c>,
F<src/io/io_private.h>.
F<include/parrot/io.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
