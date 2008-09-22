/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/io/io_unix.c - UNIX IO layer

=head1 DESCRIPTION

This is the Parrot UNIX IO layer. It implements unbuffered, low-level,
UNIX-specific functionality.

As "UNIX" is already a generalization, it may be necessary to create
separate OS-specific layers for UNIX flavors, to avoid
over-complicating this file.

=head2 References:

APitUE - W. Richard Stevens, AT&T SFIO, Perl 5 (Nick Ing-Simmons)

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

#ifdef PIO_OS_UNIX

/* Defined at bottom */
extern const ParrotIOLayerAPI pio_unix_layer_api;

ParrotIOLayer pio_unix_layer = {
    NULL,
    "unix",
    PIO_L_TERMINAL,
    &pio_unix_layer_api,
    0, 0
};

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CONST_FUNCTION
static INTVAL flags_to_unix(INTVAL flags);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO * PIO_unix_accept(PARROT_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

static INTVAL PIO_unix_bind(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGMOD(STRING *l))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*io)
        FUNC_MODIFIES(*l);

static INTVAL PIO_unix_close(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

static INTVAL PIO_unix_connect(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGIN_NULLOK(STRING *r))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static ParrotIO * PIO_unix_fdopen(PARROT_INTERP,
    SHIM(ParrotIOLayer *layer),
    PIOHANDLE fd,
    INTVAL flags)
        __attribute__nonnull__(1);

static INTVAL PIO_unix_flush(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

static INTVAL PIO_unix_init(PARROT_INTERP, ARGIN(ParrotIOLayer *layer))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL PIO_unix_isatty(PIOHANDLE fd);
static INTVAL PIO_unix_listen(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGIN(ParrotIO *io),
    INTVAL sec)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO * PIO_unix_open(PARROT_INTERP,
    ARGIN(ParrotIOLayer *layer),
    ARGIN(const char *spath),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO * PIO_unix_pipe(PARROT_INTERP,
    SHIM(ParrotIOLayer *l),
    ARGIN(const char *cmd),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL PIO_unix_poll(SHIM_INTERP,
    SHIM(ParrotIOLayer *l),
    ARGMOD(ParrotIO *io),
    int which,
    int sec,
    int usec)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

static size_t PIO_unix_read(PARROT_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGIN(STRING **buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*io);

static INTVAL PIO_unix_recv(PARROT_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGOUT(STRING **s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*io)
        FUNC_MODIFIES(*s);

static PIOOFF_T PIO_unix_seek(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

static INTVAL PIO_unix_send(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGMOD(STRING *s))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*io)
        FUNC_MODIFIES(*s);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO * PIO_unix_socket(PARROT_INTERP,
    SHIM(ParrotIOLayer *layer),
    int fam,
    int type,
    int proto)
        __attribute__nonnull__(1);

static PIOOFF_T PIO_unix_tell(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

static size_t PIO_unix_write(SHIM_INTERP,
    SHIM(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGMOD(STRING *s))
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*io)
        FUNC_MODIFIES(*s);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static INTVAL flags_to_unix>

Returns a UNIX-specific interpretation of C<flags> suitable for passing
to C<open()> and C<fopen()> in C<PIO_unix_open()> and
C<PIO_unix_fdopen()> respectively.

=cut

*/

PARROT_CONST_FUNCTION
static INTVAL
flags_to_unix(INTVAL flags)
{
    INTVAL oflags = 0;

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

=item C<static INTVAL PIO_unix_init>

Sets up the interpreter's standard C<std*> IO handles. Returns C<0> on
success and C<-1> on error.

=cut

*/

static INTVAL
PIO_unix_init(PARROT_INTERP, ARGIN(ParrotIOLayer *layer))
{
    ParrotIOData * const d = interp->piodata;
    if (d != NULL && d->table != NULL) {
        ParrotIO *io;

        io = PIO_unix_fdopen(interp, layer, STDIN_FILENO, PIO_F_READ);
        if (!io)
            return -1;
        _PIO_STDIN(interp) = new_io_pmc(interp, io);

        io = PIO_unix_fdopen(interp, layer, STDOUT_FILENO, PIO_F_WRITE);
        if (!io)
            return -1;
        _PIO_STDOUT(interp) = new_io_pmc(interp, io);

        io = PIO_unix_fdopen(interp, layer, STDERR_FILENO, PIO_F_WRITE);
        if (!io)
            return -1;
        _PIO_STDERR(interp) = new_io_pmc(interp, io);

        return 0;
    }
    return -1;
}

/*

=item C<static ParrotIO * PIO_unix_open>

Opens C<*spath>. C<flags> is a bitwise C<or> combination of C<PIO_F_*>
values.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO *
PIO_unix_open(PARROT_INTERP, ARGIN(ParrotIOLayer *layer),
              ARGIN(const char *spath), INTVAL flags)
{
    INTVAL oflags;
    PIOHANDLE fd;

    const INTVAL type = PIO_TYPE_FILE;
    const INTVAL mode = DEFAULT_OPEN_MODE;

    if (flags & PIO_F_PIPE)
        return PIO_unix_pipe(interp, layer, spath, flags);

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        return NULL;

    oflags = flags_to_unix(flags);

    /* Only files for now */
    flags |= PIO_F_FILE;

    /* Try open with no create first */
    while ((fd = open(spath, oflags & (O_WRONLY | O_RDWR | O_APPEND), mode))
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
            return NULL;
        }
        /*
         * Check for truncate?
         */
        if (oflags & O_TRUNC) {
            int tfd;
            while ((tfd = creat(spath, PIO_DEFAULTMODE)) < 0 && errno == EINTR)
                errno = 0;
            close(tfd);
        }
    }
    else if (oflags & O_CREAT) {
        /* O_CREAT and file doesn't exist. */
        while ((fd = creat(spath, PIO_DEFAULTMODE)) < 0 && errno == EINTR)
            errno = 0;
        if (!(oflags & O_WRONLY)) {
            close(fd);
            /*
             * File created, reopen with read+write
             */
            while ((fd = open(spath, oflags & (O_WRONLY | O_RDWR),
                              mode)) < 0 && errno == EINTR)
                errno = 0;
        }
    }
    else {
        /* File doesn't exist and O_CREAT not specified */
    }

    if (fd >= 0) {
        struct stat buf;
        if (fstat(fd, &buf) == -1) {
            close(fd);
            return NULL;
        }
        if ((buf.st_mode & S_IFMT) == S_IFDIR) {
            close(fd);
            errno = EISDIR;
            return NULL;
        }
        /* Set generic flag here if is a terminal then
         * higher layers can know how to setup buffering.
         * STDIN, STDOUT, STDERR would be in this case
         * so we would setup linebuffering.
         */
        if (PIO_unix_isatty(fd))
            flags |= PIO_F_CONSOLE;

        { /* Scope for io */
            ParrotIO *io = PIO_new(interp, type, flags, mode);
            io->fd = fd;
            return io;
        }
    }
    return NULL;
}


#  if PARROT_ASYNC_DEVEL

/*

=item C<INTVAL PIO_unix_async>

Experimental asynchronous IO.

This is available if C<PARROT_ASYNC_DEVEL> is defined.

Only works on Linux at the moment.

Toggles the C<O_ASYNC> flag on the IO file descriptor.

=cut

*/

INTVAL
PIO_unix_async(PARROT_INTERP, ARGMOD(ParrotIOLayer *layer), ARGMOD(ParrotIO *io), INTVAL b)
{
    int rflags;
#    if defined(linux)
    if ((rflags = fcntl(io->fd, F_GETFL, 0)) >= 0) {
        if (b)
            rflags |= O_ASYNC;
        else
            rflags &= ~O_ASYNC;
        return fcntl(io->fd, F_SETFL, rflags);
    }
#    else
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_NOT_IMPLEMENTED,
        "Async support not available");
#    endif
    return -1;
}

#  endif

/*

=item C<static ParrotIO * PIO_unix_fdopen>

Returns a new C<ParrotIO> with file descriptor C<fd>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static ParrotIO *
PIO_unix_fdopen(PARROT_INTERP, SHIM(ParrotIOLayer *layer), PIOHANDLE fd, INTVAL flags)
{
    ParrotIO *io;
    const INTVAL mode = 0;

#  if 0
    /* XXX the fcntl fails (-1, errno=0) with
     * ./parrot -tf - < foo.pir
     */

    /* FIXME - Check file handle flags, validity */
#    ifdef PARROT_HAS_HEADER_FCNTL
    {
        INTVAL rflags;
        /* Get descriptor flags */
        if ((rflags = fcntl(fd, F_GETFL, 0)) >= 0) {
            UNUSED(rflags);
            /*int accmode = rflags & O_ACCMODE; */
            /* Check other flags (APPEND, ASYNC, etc) */
        }
        else {
            /* Probably invalid descriptor */
            return NULL;
        }
    }
#    endif
#  endif

    if (PIO_unix_isatty(fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    io = PIO_new(interp, PIO_F_FILE, flags, mode);
    io->fd = fd;
    return io;
}

/*

=item C<static INTVAL PIO_unix_close>

Closes C<*io>'s file descriptor.

=cut

*/

static INTVAL
PIO_unix_close(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io))
{
    /* BSD and Solaris need explicit fsync() */
    if (io->fd >= 0) {
        fsync(io->fd);
        close(io->fd);
    }
    io->fd = -1;
    return 0;
}

/*

=item C<static INTVAL PIO_unix_isatty>

Returns a boolean value indicating whether C<fd> is a console/tty.

=cut

*/

static INTVAL
PIO_unix_isatty(PIOHANDLE fd)
{
    return isatty(fd);
}

/*

=item C<INTVAL PIO_unix_getblksize>

Various ways of determining block size.

If passed a file descriptor then C<fstat()> and the C<stat> buffer are
used if available.

If called without an argument then the C<BLKSIZE> constant is returned
if it was available at compile time, otherwise C<PIO_BLKSIZE> is returned.

=cut

*/

INTVAL
PIO_unix_getblksize(PIOHANDLE fd)
{
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

=item C<static INTVAL PIO_unix_flush>

At lowest layer all we can do for C<flush> is to ask the kernel to
C<sync()>.

XXX: Is it necessary to C<sync()> here?

=cut

*/

static INTVAL
PIO_unix_flush(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io))
{
    return fsync(io->fd);
}

/*

=item C<static size_t PIO_unix_read>

Calls C<read()> to return up to C<len> bytes in the memory starting at
C<buffer>.

=cut

*/

static size_t
PIO_unix_read(PARROT_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io),
              ARGIN(STRING **buf))
{
    STRING * const s = PIO_make_io_string(interp, buf, 2048);

    const size_t len = s->bufused;
    void * const buffer = s->strstart;

    for (;;) {
        const int bytes = read(io->fd, buffer, len);
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
            if (len > 0)
                io->flags |= PIO_F_EOF;
            s->bufused = s->strlen = 0;
            return bytes;
        }
    }
}

/*

=item C<static size_t PIO_unix_write>

Calls C<write()> to write C<len> bytes from the memory starting at
C<buffer> to the file descriptor in C<*io>.

=cut

*/

static size_t
PIO_unix_write(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io), ARGMOD(STRING *s))
{
    const char * const buffer = s->strstart;
    const char * ptr          = buffer;

    size_t to_write = s->bufused;
    size_t written  = 0;

  write_through:
    while (to_write > 0) {
        const int err = write(io->fd, ptr, to_write);
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

=item C<static PIOOFF_T PIO_unix_seek>

Hard seek.

Calls C<lseek()> to advance the read/write position on C<*io>'s file
descriptor to C<offset> bytes from the location indicated by C<whence>.

=cut

*/

static PIOOFF_T
PIO_unix_seek(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io),
              PIOOFF_T offset, INTVAL whence)
{
    const PIOOFF_T pos = lseek(io->fd, offset, whence);

    if (pos >= 0) {
        switch (whence) {
            case SEEK_SET:
                io->fsize = offset > io->fsize ? offset : io->fsize;
                break;
            case SEEK_CUR:
                {
                const PIOOFF_T avail = io->b.next - io->b.startb + offset;
                io->fsize = (avail > io->fsize) ? avail : io->fsize;
                }
                break;
            case SEEK_END:
            default:
                break;
        }

        io->lpos = io->fpos;
        io->fpos = pos;
    }
    /* Seek clears EOF */
    io->flags &= ~PIO_F_EOF;
    return pos;
}

/*

=item C<static PIOOFF_T PIO_unix_tell>

Returns the current read/write position on C<*io>'s file discriptor.

=cut

*/

static PIOOFF_T
PIO_unix_tell(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io))
{
    const PIOOFF_T pos = lseek(io->fd, (PIOOFF_T)0, SEEK_CUR);

    return pos;
}

/*

=back

=head2 Networking

Define C<PARROT_NET_DEVEL> to enable networking.

These could be native extensions but they probably should be here if we
wish to make them integrated with the async IO system.

Very minimal stubs for now, maybe someone will run with these.

=over 4

=item C<STRING * PIO_sockaddr_in>

C<PIO_sockaddr_in()> is not part of the layer and so must be C<extern>.

XXX: We can probably just write our own routines (C<htons()>,
C<inet_aton()>, etc.) and take this out of platform specific compilation

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
PIO_sockaddr_in(PARROT_INTERP, unsigned short port, ARGIN(STRING *addr))
{
    struct sockaddr_in sa;
    /* Hard coded to IPv4 for now */
    const int family = AF_INET;

    char * const s = string_to_cstring(interp, addr);
    /*
     * due to a bug in OS/X, we've to zero the struct
     * else bind is failing erratically
     */
    memset(&sa, 0, sizeof (sa));
#  ifdef PARROT_DEF_INET_ATON
    if (inet_aton(s, &sa.sin_addr) != 0) {
#  else
    /* positive retval is success */
    if (inet_pton(family, s, &sa.sin_addr) > 0) {
#  endif
        /* Success converting numeric IP */
    }
    else {
        /* Maybe it is a hostname, try to lookup */
        /* XXX Check PIO option before doing a name lookup,
         * it may have been toggled off.
         */
        struct hostent *he = gethostbyname(s);
        /* XXX FIXME - Handle error condition better */
        if (!he) {
            string_cstring_free(s);
            fprintf(stderr, "gethostbyname failure [%s]\n", s);
            return NULL;
        }
        memcpy((char*)&sa.sin_addr, he->h_addr, sizeof (sa.sin_addr));
    }
    string_cstring_free(s);

    sa.sin_family = family;
    sa.sin_port = htons(port);

    return string_make(interp, (char *)&sa, sizeof (struct sockaddr_in),
            "binary", 0);
}


#  if PARROT_NET_DEVEL

/*

=item C<static ParrotIO * PIO_unix_socket>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO *
PIO_unix_socket(PARROT_INTERP, SHIM(ParrotIOLayer *layer), int fam, int type, int proto)
{
    const int sock = socket(fam, type, proto);
    if (sock >= 0) {
        ParrotIO * const io = PIO_new(interp, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
        io->fd = sock;
        memset(&io->local, 0, sizeof (struct sockaddr_in));
        memset(&io->remote, 0, sizeof (struct sockaddr_in));
        io->remote.sin_family = fam;
        return io;
    }
    return NULL;
}

/*

=item C<static INTVAL PIO_unix_connect>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

static INTVAL
PIO_unix_connect(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io),
        ARGIN_NULLOK(STRING *r))
{
    struct sockaddr_in * saddr = &io->remote;

    if (r)
        memcpy(&io->remote, PObj_bufstart(r), sizeof (struct sockaddr_in));

AGAIN:
    if ((connect(io->fd, (struct sockaddr *)saddr,
            sizeof (struct sockaddr_in))) != 0) {
        switch (errno) {
            case EINTR:
                goto AGAIN;
            case EINPROGRESS:
                goto AGAIN;
            case EISCONN:
                return 0;
            default:
                return -1;
        }
    }

    return 0;
}

/*

=item C<static INTVAL PIO_unix_bind>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

static INTVAL
PIO_unix_bind(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io),
        ARGMOD(STRING *l))
{
    struct sockaddr_in * saddr = &io->local;

    if (!l)
        return -1;

    memcpy(&io->local, PObj_bufstart(l), sizeof (struct sockaddr_in));

    if ((bind(io->fd, (struct sockaddr *) saddr,
            sizeof (struct sockaddr_in))) == -1) {
        return -1;
    }

    return 0;
}

/*

=item C<static INTVAL PIO_unix_listen>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

static INTVAL
PIO_unix_listen(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGIN(ParrotIO *io),
        INTVAL sec)
{
    if ((listen(io->fd, sec)) == -1) {
        return -1;
    }
    return 0;
}

/*

=item C<static ParrotIO * PIO_unix_accept>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO *
PIO_unix_accept(PARROT_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io))
{
    ParrotIO * const    newio   = PIO_new(interp, PIO_F_SOCKET, 0,
                                    PIO_F_READ|PIO_F_WRITE);
    Parrot_Socklen_t    addrlen = sizeof (struct sockaddr_in);
    struct sockaddr_in *saddr   = &newio->remote;
    const int           newsock = accept(io->fd, (struct sockaddr *)saddr,
                                    &addrlen);

    if (newsock == -1) {
        mem_sys_free(newio);
        return NULL;
    }

    newio->fd = newsock;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket */

    return newio;
}

/*

=item C<static INTVAL PIO_unix_send>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

static INTVAL
PIO_unix_send(SHIM_INTERP, SHIM(ParrotIOLayer *layer), ARGMOD(ParrotIO *io),
        ARGMOD(STRING *s))
{
    int error, bytes, byteswrote;

    bytes = s->bufused;
    byteswrote = 0;
AGAIN:
    /*
     * Ignore encoding issues for now.
     */
    if ((error = send(io->fd, (char *)s->strstart + byteswrote,
                    bytes, 0)) >= 0) {
        byteswrote += error;
        bytes -= error;
        if (!bytes) {
            return byteswrote;
        }
        goto AGAIN;
    }
    else {
        switch (errno) {
            case EINTR:
                goto AGAIN;
#    ifdef EWOULDBLOCK
            case EWOULDBLOCK:
                goto AGAIN;
#    else
            case EAGAIN:
                goto AGAIN;
#    endif
            case EPIPE:
                /* XXX why close it here and not below */
                close(io->fd);
                return -1;
            default:
                return -1;
        }
    }
}

/*

=item C<static INTVAL PIO_unix_recv>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

static INTVAL
PIO_unix_recv(PARROT_INTERP, SHIM(ParrotIOLayer *layer),
        ARGMOD(ParrotIO *io), ARGOUT(STRING **s))
{
    int error;
    unsigned int bytesread = 0;
    char buf[2048];

AGAIN:
    if ((error = recv(io->fd, buf, 2048, 0)) >= 0) {
        bytesread += error;
        /* The charset should probably be 'binary', but right now httpd.pir
         * only works with 'ascii'
         */
        *s = string_make(interp, buf, bytesread, "ascii", 0);
        return bytesread;
    }
    else {
        switch (errno) {
            case EINTR:
                goto AGAIN;
#    ifdef EWOULDBLOCK
            case EWOULDBLOCK:
                goto AGAIN;
#    else
            case EAGAIN:
                goto AGAIN;
#    endif
            case ECONNRESET:
                /* XXX why close it on err return result is -1 anyway */
                close(io->fd);
                *s = string_make_empty(interp, enum_stringrep_one, 0);
                return -1;
            default:
                close(io->fd);
                *s = string_make_empty(interp, enum_stringrep_one, 0);
                return -1;
        }
    }
}

/*

=item C<static INTVAL PIO_unix_poll>

Utility function for polling a single IO stream with a timeout.

Returns a 1 | 2 | 4 (read, write, error) value.

This is not equivalent to any speficic POSIX or BSD socket call, however
it is a useful, common primitive.

Not at all usefule --leo.

Also, a buffering layer above this may choose to reimpliment by checking
the read buffer.

=cut

*/

static INTVAL
PIO_unix_poll(SHIM_INTERP, SHIM(ParrotIOLayer *l), ARGMOD(ParrotIO *io), int which,
               int sec, int usec)
{
    int n;
    fd_set r, w, e;
    struct timeval t;

    t.tv_sec = sec;
    t.tv_usec = usec;
    FD_ZERO(&r); FD_ZERO(&w); FD_ZERO(&e);
    /* These should be defined in header */
    if (which & 1) FD_SET(io->fd, &r);
    if (which & 2) FD_SET(io->fd, &w);
    if (which & 4) FD_SET(io->fd, &e);
AGAIN:
    if ((select(io->fd+1, &r, &w, &e, &t)) >= 0) {
        n = (FD_ISSET(io->fd, &r) ? 1 : 0);
        n |= (FD_ISSET(io->fd, &w) ? 2 : 0);
        n |= (FD_ISSET(io->fd, &e) ? 4 : 0);
        return n;
    }
    else {
        switch (errno) {
            case EINTR:        goto AGAIN;
            default:           return -1;
        }
    }
}

#  endif
/*

=item C<static ParrotIO * PIO_unix_pipe>

Very limited C<exec> for now.

XXX: Where does this fit, should it belong in the ParrotIOLayerAPI?

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO *
PIO_unix_pipe(PARROT_INTERP, SHIM(ParrotIOLayer *l), ARGIN(const char *cmd), int flags)
{
    /*
     * pipe(), fork() should be defined, if this header is present
     *        if that's not true, we need a test
     */
#  ifdef PARROT_HAS_HEADER_UNISTD
    int pid, err, fds[2];

    err = pipe(fds);
    if (err < 0) {
        return NULL;
    }

    /* Parent - return IO stream */
    if ((pid = fork()) > 0) {
        ParrotIO * const io =
            PIO_new(interp, PIO_F_PIPE, 0, flags & (PIO_F_READ|PIO_F_WRITE));
        if (flags & PIO_F_READ) {
            /* close this writer's end of pipe */
            close(fds[1]);
            io->fd = fds[0];
            io->fd2 = 0;
        }
        else {  /* assume write only for now */
            /* close this reader's end */
            close(fds[0]);
            io->fd = fds[1];
            io->fd2 = 0;
        }
        return io;
    }

    /* Child - exec process */
    if (pid == 0) {
        char *argv[10], *p, *c;
        int n;

        if (flags & PIO_F_WRITE) {
            /* the other end is writing - we read from the pipe */
            close(STDIN_FILENO);
            close(fds[1]);
            if (Parrot_dup(fds[0]) != STDIN_FILENO) {
                exit(EXIT_SUCCESS);
            }
        }
        else {
            /* XXX redirect stdout, stderr to pipe */
            close(STDIN_FILENO);
            close(STDOUT_FILENO);
            close(STDERR_FILENO);
            if (Parrot_dup(fds[0]) != STDIN_FILENO
             || Parrot_dup(fds[1]) != STDOUT_FILENO
             || Parrot_dup(fds[1]) != STDERR_FILENO)
            {
                exit(EXIT_SUCCESS);
            }
        }
        /*
         * XXX ugly hack to be able to pass some arguments
         *     split cmd at blanks
         */
        c = strdup(cmd);
        for (n = 0, p = strtok(c, " "); n < 9 && p; p = strtok(NULL, " ")) {
            if (n == 0)
                cmd = p;
            argv[n++] = p;
        }
        argv[n] = NULL;
        execv(cmd, argv);       /* XXX use execvp ? */
        /* Will never reach this unless exec fails. */
        perror("execvp");
        exit(EXIT_FAILURE);
    }

    perror("fork");
#  else
    UNUSED(l);
    UNUSED(cmd);
    UNUSED(flags);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "pipe() unimplemented");
#  endif
    return NULL;
}


const ParrotIOLayerAPI pio_unix_layer_api = {
    PIO_unix_init,
    PIO_base_new_layer,
    PIO_base_delete_layer,
    PIO_null_push_layer,
    PIO_null_pop_layer,
    PIO_unix_open,
    PIO_null_open2,
    PIO_null_open3,
    PIO_null_open_async,
    PIO_unix_fdopen,
    PIO_unix_close,
    PIO_unix_write,
    PIO_null_write_async,
    PIO_unix_read,
    PIO_null_read_async,
    PIO_unix_flush,
    NULL, /* no peek */
    PIO_unix_seek,
    PIO_unix_tell,
    PIO_null_setbuf,
    PIO_null_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
#  if PARROT_NET_DEVEL
    PIO_unix_poll,
    PIO_unix_socket,
    PIO_unix_connect,
    PIO_unix_send,
    PIO_unix_recv,
    PIO_unix_bind,
    PIO_unix_listen,
    PIO_unix_accept
#  else
    NULL, /* no poll */
    NULL, /* no socket */
    NULL, /* no connect */
    NULL, /* no send */
    NULL, /* no recv */
    NULL, /* no bind */
    NULL, /* no listen */
    NULL  /* no accept */
#  endif
};


#endif /* PIO_OS_UNIX */

/*

=back

=head1 SEE ALSO

F<src/io/io_buf.c>,
F<src/io/io_passdown.c>,
F<src/io/io_stdio.c>,
F<src/io/io_unix.c>,
F<src/io/io_win32.c>,
F<src/io/io.c>,
F<src/io/io_private.h>.

=head1 HISTORY

Initially written by Melvin Smith (mrjoltcola@mindspring.com).

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
