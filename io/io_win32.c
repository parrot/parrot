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
extern const ParrotIOLayerAPI pio_win32_layer_api;

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
                                ParrotIO *io, STRING **);
static size_t    PIO_win32_write(theINTERP, ParrotIOLayer *layer,
                                 ParrotIO *io, STRING *);
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
    static DWORD dwDefaultShareMode;
    if (!dwDefaultShareMode) {
        OSVERSIONINFO osvi;
        osvi.dwOSVersionInfoSize = sizeof(osvi);
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

=item C<static INTVAL
PIO_win32_init(theINTERP, ParrotIOLayer *layer)>

Sets up the standard C<std*> IO handles.

=cut

*/

static INTVAL
PIO_win32_init(theINTERP, ParrotIOLayer *layer)
{
    HANDLE h;
#if PARROT_NET_DEVEL
		struct WSAData sockinfo;
		int ret;
#endif

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
#if PARROT_NET_DEVEL
		/* Start Winsock
 		 * no idea where or whether destroy it
 		 */
    ret = WSAStartup (2, &sockinfo);
    if (ret!=0){
		    fprintf ( stderr, "WSAStartup failed!!\n ErrorCode=%i\n\n", WSAGetLastError());
		    return -4;
    }
#endif
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
    UNUSED(fd);
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

    UNUSED(layer);

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

    UNUSED(fdopen);
    UNUSED(layer);

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
    UNUSED(interpreter);
    UNUSED(layer);

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
    UNUSED(interpreter);
    UNUSED(layer);
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
               STRING ** buf)>

Calls C<ReadFile()> to read up to C<len> bytes from C<*io>'s file
descriptor to the memory starting at C<buffer>.

=cut

*/

static size_t
PIO_win32_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)
{
    DWORD countread;
    void *buffer;
    size_t len;
    STRING *s;

    UNUSED(layer);

    s = PIO_make_io_string(interpreter, buf, 2048);
    len = s->bufused;
    buffer = s->strstart;

    if (ReadFile(io->fd, (LPVOID) buffer, (DWORD) len, &countread, NULL)) {
        if (countread > 0) {
            s->bufused = s->strlen = countread;
            return (size_t)countread;
        }
        else if (len > 0)
            /* EOF if read 0 and bytes were requested */
            io->flags |= PIO_F_EOF;
    }
    else {
        /* FIXME : An error occured */
    }

    s->bufused = s->strlen = 0;
    return 0;
}

/*

=item C<static size_t
PIO_win32_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                STRING *)>

Calls C<WriteFile()> to write C<len> bytes from the memory starting at
C<buffer> to C<*io>'s file descriptor.

=cut

*/

static size_t
PIO_win32_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *s)
{
    DWORD countwrote = 0;
    void *buffer = s->strstart;
    size_t len = s->bufused;

    UNUSED(interpreter);
    UNUSED(layer);

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

    UNUSED(interpreter);
    UNUSED(l);

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

    UNUSED(interpreter);
    UNUSED(l);

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
    struct sockaddr_in sa;
    struct hostent *he;
    /* Hard coded to IPv4 for now */
    int family = AF_INET;

    char * s = string_to_cstring(interpreter, addr);
		sa.sin_addr.s_addr = inet_addr (s);
        /* Maybe it is a hostname, try to lookup */
        /* XXX Check PIO option before doing a name lookup,
         * it may have been toggled off.
         */
        he = gethostbyname(s);
        /* XXX FIXME - Handle error condition better */
        if(!he) {
            string_cstring_free(s);
            fprintf(stderr, "gethostbyname failure [%s]\n", s);
            return NULL;
        }
        memcpy((char*)&sa.sin_addr, he->h_addr, sizeof(sa.sin_addr));

    string_cstring_free(s);

    sa.sin_port = htons(port);

    return string_make(interpreter, &sa, sizeof(struct sockaddr), "binary", 0);
}


/*******************************************************************************************************/

#if PARROT_NET_DEVEL

/*

=item C<static ParrotIO *
PIO_win32_socket(theINTERP, ParrotIOLayer *layer, int fam, int type, int proto)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

static ParrotIO *
PIO_win32_socket(theINTERP, ParrotIOLayer *layer, int fam, int type, int proto)
{
    int sock;
    ParrotIO * io;
    if((sock = socket(fam, type, proto)) >= 0) {
        io = PIO_new(interpreter, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
        io->fd = (PIOHANDLE) sock;
        io->remote.sin_family = fam;
        return io;
    }
    perror("socket:");
    return 0;
}

/*

=item C<static INTVAL
PIO_win32_connect(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *r)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

static INTVAL
PIO_win32_connect(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *r)
{
    if(r) {
        struct sockaddr_in sa;
        memcpy(&sa, PObj_bufstart(r), sizeof(struct sockaddr));
        io->remote.sin_addr.s_addr = sa.sin_addr.s_addr;
        io->remote.sin_port = sa.sin_port;
    }

/*    PIO_eprintf(interpreter, "connect: fd = %d port = %d\n", io->fd, ntohs(io->remote.sin_port));*/
    if((connect((SOCKET)io->fd, (struct sockaddr*)&io->remote,
                   sizeof(struct sockaddr))) != 0) {
        PIO_eprintf(interpreter, "PIO_win32_connect: errno = %d\n", WSAGetLastError());
        return -1;
    }

    return 0;
}

/*

=item C<static INTVAL
PIO_win32_send(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING *s)>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

static INTVAL
PIO_win32_send(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING *s)
{
    int error, bytes, byteswrote, maxwrite;
    bytes = sizeof(s);
    byteswrote = 0;
    maxwrite = 2048;
AGAIN:
    /*
     * Ignore encoding issues for now.
     */
    if((error = send((SOCKET)io->fd, (char *)PObj_bufstart(s) + byteswrote,
                            PObj_buflen(s), 0)) >= 0) {
        byteswrote += error;
        if(byteswrote >= bytes) {
            return byteswrote;
        }
        else if(bytes - byteswrote < maxwrite) {
            maxwrite = bytes - byteswrote;
        }
        goto AGAIN;
    }
    else {
        switch(errno) {
            case EINTR:        goto AGAIN;
#ifdef EWOULDBLOCK
            case EWOULDBLOCK:  goto AGAIN;
#else
            case EAGAIN:       goto AGAIN;
#endif
            case EPIPE:        close((SOCKET)io->fd);
                               return -1;
            default:           return -1;
        }
    }
}

/*

=item C<static INTVAL
PIO_win32_recv(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING **s)>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

static INTVAL
PIO_win32_recv(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING **s)
{
    int error;
    int err;
    unsigned int bytesread = 0;
    char buf[2048+1];

AGAIN:
	error = recv((SOCKET)io->fd, buf, 2048, 0);
		err = WSAGetLastError();
    if(error > 0) {
        if(error > 0)
            bytesread += error;
        else {
            close((SOCKET)io->fd);
        }
        *s = string_make(interpreter, buf, bytesread, "binary", 0);
        if(!*s) {
            PANIC("PIO_recv: Failed to allocate string");
        }
#if PIO_TRACE
        PIO_eprintf(interpreter, "PIO_win32_recv: %d bytes\n", bytesread);
#endif
        return bytesread;
    } else {
        switch(err) {
            case WSAEINTR:        goto AGAIN;
            case WSAEWOULDBLOCK:  goto AGAIN;
            case WSAECONNRESET:   close((SOCKET)io->fd);
#if PIO_TRACE
            PIO_eprintf(interpreter, "recv: Connection reset by peer\n");
#endif
                               return -1;
            default:           close((SOCKET)io->fd);
#if PIO_TRACE
		        PIO_eprintf(interpreter, "recv: errno = %d\n", err);
#endif
                               return -1;
        }
    }
}

/*

=item C<static INTVAL
PIO_win32_bind(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *l)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

static INTVAL
PIO_win32_bind(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *l)
{
    struct sockaddr_in sa;
    if(!l) return -1;

    memcpy(&sa, PObj_bufstart(l), sizeof(struct sockaddr));
    io->local.sin_addr.s_addr = sa.sin_addr.s_addr;
    io->local.sin_port = sa.sin_port;
    io->local.sin_family = AF_INET;

    if((bind((SOCKET)io->fd, (struct sockaddr *)&io->local, sizeof(struct sockaddr))) == -1)
    {
        PIO_eprintf(interpreter, "PIO_win32_bind: errno = %d\n", WSAGetLastError());
        return -1;
    }

    return 0;
}

/*

=item C<static INTVAL
PIO_win32_listen(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL sec)>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

static INTVAL
PIO_win32_listen(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL backlog)
{
    if((listen((SOCKET)io->fd, backlog)) == -1) {
        fprintf(stderr, "listen: errno= ret=%d fd = %d port = %d\n",
             errno, io->fd, ntohs(io->local.sin_port));
        return -1;
    }
    return 0;
}

/*

=item C<static ParrotIO *
PIO_win32_accept(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

static ParrotIO *
PIO_win32_accept(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    int newsock;
    int newsize;
    int err_code;
    ParrotIO *newio;
    newio = PIO_new(interpreter, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
    newsize = sizeof (struct sockaddr);

    newsock = accept((SOCKET)io->fd, (struct sockaddr *)&(newio->remote), &newsize);
    err_code = WSAGetLastError();

    if(err_code != 0)
    {
        fprintf(stderr, "accept: errno=%d", err_code);
        /* Didn't get far enough, free the io */
        mem_sys_free(newio);
        return NULL;
    }

    newio->fd = (PIOHANDLE) newsock;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer
     */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket
     */

    return newio;
}

#endif


/************************************************************************************************************/


const ParrotIOLayerAPI pio_win32_layer_api = {
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
    PIO_win32_flush,
    0, /* no peek */
    PIO_win32_seek,
    PIO_win32_tell,
    PIO_null_setbuf,
    PIO_null_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
#if PARROT_NET_DEVEL
    0,
    PIO_win32_socket,
    PIO_win32_connect,
    PIO_win32_send,
    PIO_win32_recv,
    PIO_win32_bind,
    PIO_win32_listen,
    PIO_win32_accept
#else
    0, /* no poll */
    0, /* no socket */
    0, /* no connect */
    0, /* no send */
    0, /* no recv */
    0, /* no bind */
    0, /* no listen */
    0, /* no accept */
#endif
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
