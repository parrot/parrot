/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/name.c - Win32 IO layer

=head1 DESCRIPTION

This is the Parrot OS-speciic IO layer for Win32 platforms.

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
#include "io_private.h"

#ifdef PIO_OS_WIN32

#  include <tchar.h>

/* Defined at bottom */
extern ParrotIOLayerAPI pio_win32_layer_api;

ParrotIOLayer pio_win32_layer = {
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

static INTVAL    PIO_win32_init(theINTERP, ParrotIOLayer *layer);
static ParrotIO *PIO_win32_open(theINTERP, ParrotIOLayer *layer,
                                const char *spath, INTVAL flags);
static ParrotIO *PIO_win32_fdopen(theINTERP, ParrotIOLayer *layer,
                                  PIOHANDLE fd, INTVAL flags);
static INTVAL PIO_win32_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static INTVAL PIO_win32_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static size_t    PIO_win32_read(theINTERP, ParrotIOLayer *layer,
                                ParrotIO *io, void *buffer, size_t len);
static size_t    PIO_win32_write(theINTERP, ParrotIOLayer *layer,
                                 ParrotIO *io, const void *buffer, size_t len);
static INTVAL    PIO_win32_puts(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                                const char *s);
static PIOOFF_T  PIO_win32_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                                PIOOFF_T off, INTVAL whence);
static PIOOFF_T  PIO_win32_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static INTVAL    PIO_win32_isatty(PIOHANDLE fd);

/*

=item C<static INTVAL
flags_to_win32(INTVAL flags, DWORD * fdwAccess,
               DWORD * fdwShareMode, DWORD * fdwCreate)>

Convert to platform-specific bit open flags.

=cut

*/

static INTVAL
flags_to_win32(INTVAL flags, DWORD * fdwAccess,
               DWORD * fdwShareMode, DWORD * fdwCreate)
{
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

    *fdwShareMode = FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE;
    if (flags & PIO_F_APPEND) {
        /* dealt with specially in _write and _puts */
    }
    return 1;
}

/*

=item C<static INTVAL
PIO_win32_init(theINTERP, ParrotIOLayer *layer)>

Sets up the standard C<std*> IO handles.

=cut

*/

static INTVAL
PIO_win32_init(theINTERP, ParrotIOLayer *layer)
{
    HANDLE h;
    if ((h = GetStdHandle(STD_INPUT_HANDLE)) != INVALID_HANDLE_VALUE) {
        PIO_STDIN(interpreter) = new_io_pmc(interpreter, 
            PIO_win32_fdopen(interpreter, layer, h, PIO_F_READ));
    }
    else {
        return -1;
    }
    if ((h = GetStdHandle(STD_OUTPUT_HANDLE))
        != INVALID_HANDLE_VALUE) {
        PIO_STDOUT(interpreter) = new_io_pmc(interpreter,
            PIO_win32_fdopen(interpreter, layer, h, PIO_F_WRITE));
    }
    else {
        return -2;
    }
    if ((h = GetStdHandle(STD_ERROR_HANDLE)) != INVALID_HANDLE_VALUE) {
        PIO_STDERR(interpreter) = new_io_pmc(interpreter,
            PIO_win32_fdopen(interpreter, layer, h, PIO_F_WRITE));
    }
    else {
        return -3;
    }
    return 0;
}

/*

=item C<INTVAL
PIO_win32_getblksize(PIOHANDLE fd)>

Returns C<PIO_BLKSIZE>.

=cut

*/

INTVAL
PIO_win32_getblksize(PIOHANDLE fd)
{
    /* Hard coded for now */
    return PIO_BLKSIZE;
}

/*

=item C<static ParrotIO *
PIO_win32_open(theINTERP, ParrotIOLayer *layer,
               const char *spath, INTVAL flags)>

Calls C<CreateFile()> to open C<*spath> with the Win32 translation of
C<flags>.

=cut

*/

static ParrotIO *
PIO_win32_open(theINTERP, ParrotIOLayer *layer,
               const char *spath, INTVAL flags)
{
    ParrotIO *io;
    int type;
    DWORD fAcc, fShare, fCreat;
    PIOHANDLE fd;
    type = PIO_TYPE_FILE;
#  if 0
    if ((Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) != 0) {
        fprintf(stderr, "PIO_win32_open: %s\n", spath);
    }
#  endif
    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        return (ParrotIO *)NULL;

    /* Set open flags - <, >, >>, +<, +> */
    /* add ? and ! for block/non-block */
    if (flags_to_win32(flags, &fAcc, &fShare, &fCreat) < 0)
        return (ParrotIO *)NULL;

    /* Only files for now */
    flags |= PIO_F_FILE;

    fd = CreateFile(spath, fAcc, fShare, NULL, fCreat, FILE_ATTRIBUTE_NORMAL, NULL);
    if (fd != INVALID_HANDLE_VALUE) {
        io = PIO_new(interpreter, type, flags, 0);
        io->fd = fd;
        return io;
    }
    else {
        int err = GetLastError();
        if(err) {}
    }

    return (ParrotIO *)NULL;
}

/*

=item C<static ParrotIO *
PIO_win32_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fd, INTVAL flags)>

Returns a new C<ParrotIO> with C<fd> as its file descriptor.

=cut

*/

static ParrotIO *
PIO_win32_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fd, INTVAL flags)
{
    ParrotIO *io;
    INTVAL mode;
    mode = 0;

    if (PIO_win32_isatty(fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    io = PIO_new(interpreter, PIO_F_FILE, flags, mode);
    io->fd = fd;
    return io;
}

/*

=item C<static INTVAL
PIO_win32_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Calls C<CloseHandle()> to close C<*io>'s file descriptor.

=cut

*/

static INTVAL
PIO_win32_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    if (io && io->fd != INVALID_HANDLE_VALUE) {
        CloseHandle(io->fd);
        io->fd = INVALID_HANDLE_VALUE;
    }
    return 0;
}

/*

=item C<INTVAL
PIO_win32_isatty(PIOHANDLE fd)>

Returns whether C<fd> is a console/tty.

=cut

*/

INTVAL
PIO_win32_isatty(PIOHANDLE fd)
{
    DWORD ftype = GetFileType(fd);
    if (ftype == FILE_TYPE_CHAR)
        return 1;
    return 0;
}

/*

=item C<static INTVAL
PIO_win32_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Calls C<FlushFileBuffers()> to flush C<*io>'s file descriptor.

=cut

*/

static INTVAL
PIO_win32_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    /*
     * FlushFileBuffers won't work for console handles. From the MS help file:
     *
     * Windows NT: The function fails if hFile is a handle to console output. That is because console output is not buffered.
     * The function returns FALSE, and GetLastError returns ERROR_INVALID_HANDLE.
     * 
     * Windows 9x: The function does nothing if hFile is a handle to console output. That is because console output is not buffered.
     * The function returns TRUE, but it does nothing.
     */
    return FlushFileBuffers(io->fd);
}

/*

=item C<static size_t
PIO_win32_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               void *buffer, size_t len)>

Calls C<ReadFile()> to read up to C<len> bytes from C<*io>'s file
descriptor to the memory starting at C<buffer>.

=cut

*/

static size_t
PIO_win32_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               void *buffer, size_t len)
{
    DWORD countread;
    if (ReadFile(io->fd, (LPVOID) buffer, (DWORD) len, &countread, NULL)) {
        if (countread > 0)
            return (size_t)countread;
        else if (len > 0)
            /* EOF if read 0 and bytes were requested */
            io->flags |= PIO_F_EOF;
    }
    else {
        /* FIXME : An error occured */
    }
    
    return 0;
}

/*

=item C<static size_t
PIO_win32_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                const void *buffer, size_t len)>

Calls C<WriteFile()> to write C<len> bytes from the memory starting at
C<buffer> to C<*io>'s file descriptor.

=cut

*/

static size_t
PIO_win32_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                const void *buffer, size_t len)
{
    DWORD countwrote = 0;
    /* do it by hand, Win32 hasn't any specific flag */
    if (io->flags & PIO_F_APPEND)
    {
        LARGE_INTEGER p;
        p.LowPart = 0;
        p.HighPart = 0;

        p.LowPart = SetFilePointer(io->fd, p.LowPart,
                                   &p.HighPart, FILE_END);
        if (p.LowPart == 0xFFFFFFFF && (GetLastError() != NO_ERROR)) {
            /* Error - exception */
            return -1;
        }
    }

    if (io
        && WriteFile(io->fd, (LPCSTR) buffer, (DWORD) len, &countwrote, NULL))
        return countwrote;
    /* FIXME: Set error flag */
    return (size_t)-1;
}

/*

=item C<static INTVAL
PIO_win32_puts(theINTERP, ParrotIOLayer *l, ParrotIO *io, const char *s)>

C<PIO_win32_puts()> tries C<WriteConsole()> first, then C<WriteFile()>,
whereas C<write()> calls C<WriteFile()> only. I've also read that
C<WriteFile()> will call C<WriteConsole()> if the handle is the right
type (console) so I suppose this is saving a function call since "puts"
is probably used for consoles a lot.

=cut

*/

static INTVAL
PIO_win32_puts(theINTERP, ParrotIOLayer *l, ParrotIO *io, const char *s)
{
    DWORD len, countwrote;
    len = _tcslen((LPCSTR) s);
    /* do it by hand, Win32 hasn't any specific flag */
    if (io->flags & PIO_F_APPEND)
    {
        LARGE_INTEGER p;
        p.LowPart = 0;
        p.HighPart = 0;

        p.LowPart = SetFilePointer(io->fd, p.LowPart,
                                   &p.HighPart, FILE_END);
        if (p.LowPart == 0xFFFFFFFF && (GetLastError() != NO_ERROR)) {
            /* Error - exception */
            return -1;
        }
    }

    if (WriteFile(io->fd, (LPCSTR) s, len, &countwrote, NULL))
        return countwrote;
    return -1;
}

/*

=item C<static PIOOFF_T
PIO_win32_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
               PIOOFF_T off, INTVAL whence)>

Hard seek.

Calls C<SetFilePointer()> to move the read/write position of C<*io>'s
file descriptor to C<off> bytes relative to the location specified by
C<whence>.

=cut

*/

static PIOOFF_T
PIO_win32_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
               PIOOFF_T off, INTVAL whence)
{
    LARGE_INTEGER offset;
    offset.QuadPart = off;
    /* offset.HighPart gets overwritten */
    offset.LowPart = SetFilePointer(io->fd, offset.LowPart,
                               &offset.HighPart, whence);
    if (offset.LowPart == 0xFFFFFFFF && (GetLastError() != NO_ERROR)) {
        /* Error - exception */
        return -1;
    }
    io->fpos = offset.QuadPart;
    return io->fpos;
}

/*

=item C<static PIOOFF_T
PIO_win32_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io)>

Returns the current read/write position of C<*io>'s file descriptor.

=cut

*/

static PIOOFF_T
PIO_win32_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io)
{
    LARGE_INTEGER p;
    p.QuadPart = piooffsetzero;
    p.LowPart = SetFilePointer(io->fd, 0, &p.HighPart, FILE_CURRENT);
    if (p.LowPart == 0xFFFFFFFF && GetLastError() != NO_ERROR) {
        /* FIXME: Error - exception */
    }
    return p.QuadPart;
}

/*

=item C<STRING *
PIO_sockaddr_in(theINTERP, unsigned short port, STRING * addr)>

C<PIO_sockaddr_in()> is not part of the layer and so must be C<extern>.

XXX: We can probably just write our own routines (C<htons()>,
C<inet_aton()>, etc.) and take this out of platform specific compilation

=cut

*/

STRING *
PIO_sockaddr_in(theINTERP, unsigned short port, STRING * addr)
{       
#if 0
    /* Not sure if this compiles on Win32 yet, rather not break things */

    STRING * packed;
    struct sockaddr_in sa;
    /* XXX: Fixme, inet_addr obsolete, replace with inet_aton */
    sa.sin_addr.s_addr =
                inet_addr(string_to_cstring(interpreter, addr));
    sa.sin_port = htons(port);
    packed = string_make(interpreter, &sa, sizeof(struct sockaddr), NULL, 0,
                                NULL);
    if(!packed)
        PANIC("unix_sockaddr: failed to create string");
    return packed;
#endif
    return NULL;
}   


ParrotIOLayerAPI pio_win32_layer_api = {
    PIO_win32_init,
    PIO_base_new_layer,
    PIO_base_delete_layer,
    PIO_null_push_layer,
    PIO_null_pop_layer,
    PIO_win32_open,
    PIO_null_open2,
    PIO_null_open3,
    PIO_null_open_async,
    PIO_win32_fdopen,
    PIO_win32_close,
    PIO_win32_write,
    PIO_null_write_async,
    PIO_win32_read,
    PIO_null_read_async,
    PIO_null_flush,
    PIO_win32_seek,
    PIO_win32_tell,
    PIO_null_setbuf,
    PIO_null_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
    0, /* no poll */
    0, /* no socket */
    0, /* no connect */
    0, /* no send */
    0 /* no recv */
};

#endif /* PIO_OS_WIN32 */

/*

=back

=head1 SEE ALSO

F<io/io_buf.c>,
F<io/io_passdown.c>,
F<io/io_stdio.c>,
F<io/io_unix.c>,
F<io/io.c>,
F<io/io_private.h>.

=head1 HISTORY

Initially written by Melvin Smith.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
