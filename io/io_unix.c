/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_unix.c - UNIX IO layer

=head1 DESCRIPTION

This is the Parrot UNIX IO layer. It implements unbuffered, low-level,
UNIX-specifc functionality.

As "UNIX" is already a generalization, it may be necessary to create a
separate OS-specific layers for UNIX flavours, to avoid
over-complicating this file.

=head2 References:

APitUE - W. Richard Stevens, AT&T SFIO, Perl5 (Nick Ing-Simmons)
 
=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

#ifdef PIO_OS_UNIX

/* Defined at bottom */
extern ParrotIOLayerAPI pio_unix_layer_api;

ParrotIOLayer pio_unix_layer = {
    NULL,
    "unix",
    PIO_L_TERMINAL,
    &pio_unix_layer_api,
    0, 0
};


/*
 * static function declarations
 */
static INTVAL    flags_to_unix(INTVAL flags);

static INTVAL    PIO_unix_init(theINTERP, ParrotIOLayer *layer);
static ParrotIO *PIO_unix_open(theINTERP, ParrotIOLayer *layer,
                               const char *spath, INTVAL flags);
static ParrotIO *PIO_unix_fdopen(theINTERP, ParrotIOLayer *layer,
                                 PIOHANDLE fd, INTVAL flags);
static INTVAL    PIO_unix_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static INTVAL    PIO_unix_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static size_t    PIO_unix_read(theINTERP, ParrotIOLayer *layer,
                               ParrotIO *io, void *buffer, size_t len);
static size_t    PIO_unix_write(theINTERP, ParrotIOLayer *layer,
                                ParrotIO *io, const void *buffer, size_t len);
static PIOOFF_T  PIO_unix_seek(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                               PIOOFF_T offset, INTVAL whence);
static PIOOFF_T  PIO_unix_tell(theINTERP, ParrotIOLayer *l, ParrotIO *io);
static INTVAL    PIO_unix_isatty(PIOHANDLE fd);


/*

=item C<static INTVAL
flags_to_unix(INTVAL flags)>

Returns a UNIX-specific interpretation of C<flags> suitable for passing
to C<open()> and C<fopen()> in C<PIO_unix_open()> and
C<PIO_unix_fdopen()> respectively.

=cut

*/

static INTVAL
flags_to_unix(INTVAL flags)
{
    INTVAL oflags;
    oflags = 0;
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

=item C<static INTVAL
PIO_unix_init(theINTERP, ParrotIOLayer *layer)>

Sets up the interpreter's standard C<std*> IO handles. Returns C<0> on
success and C<-1> on error.

=cut

*/

static INTVAL
PIO_unix_init(theINTERP, ParrotIOLayer *layer)
{
    ParrotIOData *d = interpreter->piodata;
    if (d != NULL && d->table != NULL) {
        ParrotIO *io;

        io = PIO_unix_fdopen(interpreter, layer, STDIN_FILENO, PIO_F_READ);
        if (!io) return -1;
        PIO_STDIN(interpreter) = new_io_pmc(interpreter, io);

        io = PIO_unix_fdopen(interpreter, layer, STDOUT_FILENO, PIO_F_WRITE);
        if (!io) return -1;
        PIO_STDOUT(interpreter) = new_io_pmc(interpreter, io);

        io = PIO_unix_fdopen(interpreter, layer, STDERR_FILENO, PIO_F_WRITE);
        if (!io) return -1;
        PIO_STDERR(interpreter) = new_io_pmc(interpreter, io);

        return 0;
    }
    return -1;
}

/*

=item C<static ParrotIO *
PIO_unix_open(theINTERP, ParrotIOLayer *layer,
              const char *spath, INTVAL flags)>

Opens C<*spath>. C<flags> is a bitwise C<or> combination of C<PIO_F_*>
values.

=cut

*/

static ParrotIO *
PIO_unix_open(theINTERP, ParrotIOLayer *layer,
              const char *spath, INTVAL flags)
{
    ParrotIO *io;
    INTVAL mode;
    INTVAL oflags, type;
    PIOHANDLE fd;

    UNUSED(layer);

    type = PIO_TYPE_FILE;
    mode = DEFAULT_OPEN_MODE;

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
        /* Set generic flag here if is a terminal then
         * higher layers can know how to setup buffering.
         * STDIN, STDOUT, STDERR would be in this case
         * so we would setup linebuffering.
         */
        if (PIO_unix_isatty(fd))
            flags |= PIO_F_CONSOLE;
        io = PIO_new(interpreter, type, flags, mode);
        io->fd = fd;
        return io;
    }
    return NULL;
}


#if PARROT_ASYNC_DEVEL

/*

=item C<static INTVAL
PIO_unix_async(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL b)>

Experimental asynchronous IO. 

This is available if C<PARROT_ASYNC_DEVEL> is defined.

Only works on Linux at the moment.

Toggles the C<O_ASYNC> flag on the IO file descriptor.

=cut

*/

static INTVAL
PIO_unix_async(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL b)
{
    int rflags;
#if defined(linux)
    if((rflags = fcntl(io->fd, F_GETFL, 0)) >= 0) {
        if(b)
            rflags |= O_ASYNC;
        else
            rflags &= ~O_ASYNC;
        return fcntl(io->fd, F_SETFL, rflags);
    }
#else
    internal_exception(PIO_NOT_IMPLEMENTED, "Async support not available");
#endif
    return -1;
}

#endif

/*

=item C<static ParrotIO *
PIO_unix_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fd, INTVAL flags)>

Returns a new C<ParrotIO> with file descriptor C<fd>.

=cut

*/

static ParrotIO *
PIO_unix_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fd, INTVAL flags)
{
    ParrotIO *io;
    INTVAL oflags, mode;
#  ifdef PARROT_HAS_HEADER_FCNTL
    INTVAL rflags;
#  endif

    UNUSED(layer);

    mode = 0;

    oflags = flags_to_unix(flags);

        /* FIXME - Check file handle flags, validity */
#  ifdef PARROT_HAS_HEADER_FCNTL
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
#  endif

    if (PIO_unix_isatty(fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    io = PIO_new(interpreter, PIO_F_FILE, flags, mode);
    io->fd = fd;
    return io;
}

/*

=item C<static INTVAL
PIO_unix_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Closes C<*io>'s file descriptor.

=cut

*/

static INTVAL
PIO_unix_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    UNUSED(interpreter);
    UNUSED(layer);

    if (io->fd >= 0)
        close(io->fd);
    io->fd = -1;
    return 0;
}

/*

=item C<INTVAL
PIO_unix_isatty(PIOHANDLE fd)>

Returns a boolean value indicating whether C<fd> is a console/tty.

=cut

*/

INTVAL
PIO_unix_isatty(PIOHANDLE fd)
{
    return isatty(fd);
}

/*

=item C<INTVAL
PIO_unix_getblksize(PIOHANDLE fd)>

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

=item C<static INTVAL
PIO_unix_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

At lowest layer all we can do for C<flush> is to ask the kernel to
C<sync()>.

XXX: Is it necessary to C<sync()> here?

=cut

*/

static INTVAL
PIO_unix_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    UNUSED(interpreter);
    UNUSED(layer);

    return fsync(io->fd);
}

/*

=item C<static size_t
PIO_unix_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              void *buffer, size_t len)>

Calls C<read()> to return up to C<len> bytes in the memory starting at
C<buffer>.

=cut

*/

static size_t
PIO_unix_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              void *buffer, size_t len)
{
    int bytes;

    UNUSED(interpreter);
    UNUSED(layer);

    for (;;) {
        bytes = read(io->fd, buffer, len);
        if (bytes > 0)
            return bytes;
        else if (bytes < 0) {
            switch (errno) {
            case EINTR:
                continue;
            default:
                return bytes;
            }
        }
        else {
            /* Read returned 0, EOF if len requested > 0 */
            if (len > 0)
                io->flags |= PIO_F_EOF;
            return bytes;
        }
    }
    /* return bytes; */ /* XXX never reached -- why was it here? */
}

/*

=item C<static size_t
PIO_unix_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               const void *buffer, size_t len)>

Calls C<write()> to write C<len> bytes from the memory starting at
C<buffer> to the file descriptor in C<*io>.

=cut

*/

static size_t
PIO_unix_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               const void *buffer, size_t len)
{
    int err;
    size_t bytes;
    size_t to_write;
    const char *ptr;

    UNUSED(interpreter);
    UNUSED(layer);

    ptr = buffer;
    to_write = len;
    bytes = 0;

  write_through:
    while (to_write > 0) {
        if ((err = write(io->fd, ptr, to_write)) >= 0) {
            ptr += err;
            to_write -= err;
            bytes += err;
        }
        else {
            switch (errno) {
            case EINTR:
                goto write_through;
#  ifdef EAGAIN
            case EAGAIN:
                return bytes;
#  endif
            default:
                return (size_t)-1;
            }
        }
    }
    return bytes;
}

/*

=item C<static PIOOFF_T
PIO_unix_seek(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              PIOOFF_T offset, INTVAL whence)>

Hard seek.

Calls C<lseek()> to advance the read/write position on C<*io>'s file
descriptor to C<offset> bytes from the location indicated by C<whence>.

=cut

*/

static PIOOFF_T
PIO_unix_seek(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              PIOOFF_T offset, INTVAL whence)
{
    PIOOFF_T pos;

    UNUSED(interpreter);
    UNUSED(layer);

    if ((pos = lseek(io->fd, offset, whence)) >= 0) {
        io->lpos = io->fpos;
        io->fpos = pos;
    }
    /* Seek clears EOF */
    io->flags &= ~PIO_F_EOF;
    return pos;
}

/*

=item C<static PIOOFF_T
PIO_unix_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Returns the current read/write position on C<*io>'s file discriptor.

=cut

*/

static PIOOFF_T
PIO_unix_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    PIOOFF_T pos;

    UNUSED(interpreter);
    UNUSED(layer);

    pos = lseek(io->fd, (PIOOFF_T)0, SEEK_CUR);
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
    /* Hard coded to IPv4 for now */
    int family = AF_INET;

    /* XXX: Fixme, inet_addr obsolete, replace with inet_aton */
    char * s = string_to_cstring(interpreter, addr);
    /*if(inet_aton(s, &sa.sin_addr) != 0) {*/
    if(inet_pton(family, s, &sa.sin_addr) != 0) {
        /* Success converting numeric IP */
    }
    else {
        /* Maybe it is a hostname, try to lookup */
        /* XXX Check PIO option before doing a name lookup,
         * it may have been toggled off.
         */
        struct hostent *he = gethostbyname(s);
        /* XXX FIXME - Handle error condition better */
        if(!he) {
            string_cstring_free(s);
            fprintf(stderr, "gethostbyname failure [%s]\n", s);
            return NULL;
        }
        memcpy((char*)&sa.sin_addr, he->h_addr, sizeof(sa.sin_addr));
    }
    string_cstring_free(s);

    sa.sin_port = htons(port);

    fprintf(stderr, "sockaddr_in: port %d\n", port);
    return string_make(interpreter, &sa, sizeof(struct sockaddr), NULL, 0,
            NULL);
}


#if PARROT_NET_DEVEL

/*

=item C<static ParrotIO *
PIO_unix_socket(theINTERP, ParrotIOLayer *layer, int fam, int type, int proto)>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

static ParrotIO *
PIO_unix_socket(theINTERP, ParrotIOLayer *layer, int fam, int type, int proto)
{
    int sock;
    ParrotIO * io;
    if((sock = socket(fam, type, proto)) >= 0) {
        io = PIO_new(interpreter, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
        io->fd = sock;
        io->remote.sin_family = fam;
        fprintf(stderr, "socket: fd = %d\n", sock);
        return io;
    }
    perror("socket:");
    return 0;
}

/*

=item C<static INTVAL
PIO_unix_connect(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *r)>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

static INTVAL
PIO_unix_connect(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *r)
{
    if(r) {
        struct sockaddr_in sa;
        memcpy(&sa, r->bufstart, sizeof(struct sockaddr));
        io->remote.sin_addr.s_addr = sa.sin_addr.s_addr;
        io->remote.sin_port = sa.sin_port;
    }
AGAIN:
    PIO_eprintf(interpreter, "connect: fd = %d port = %d\n", io->fd, ntohs(io->remote.sin_port));
    if((connect(io->fd, (struct sockaddr*)&io->remote,
                   sizeof(struct sockaddr))) != 0) {
        switch(errno) {
            case EINTR:        goto AGAIN;
            case EINPROGRESS:  goto AGAIN;
            case EISCONN:      return 0;
            case ECONNREFUSED:
#if PIO_TRACE
                               PIO_eprintf(interpreter, "PIO_unix_connect: connect refused\n");
#endif
            case EINVAL:
            default:          
#if PIO_TRACE
                               PIO_eprintf(interpreter, "PIO_unix_connect: errno = %d\n", errno);
#endif
                               return -1;
        }
    }

    return 0;
}

/*

=item C<static INTVAL
PIO_unix_bind(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *l)>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

static INTVAL
PIO_unix_bind(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *l)
{
    struct sockaddr_in sa;
    if(!l) return -1;

    memcpy(&sa, l->bufstart, sizeof(struct sockaddr));
    io->local.sin_addr.s_addr = sa.sin_addr.s_addr;
    io->local.sin_port = sa.sin_port;

    if((bind(io->fd, (struct sockaddr *)&io->local, sizeof(struct sockaddr))) == -1)
    {
        fprintf(stderr, "bind: errno= ret=%d fd = %d port = %d\n",
             errno, io->fd, ntohs(io->local.sin_port));
        return -1;
    }

    return 0;
}

/*

=item C<static INTVAL
PIO_unix_listen(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL sec)>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

static INTVAL
PIO_unix_listen(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL sec)
{
    if((listen(io->fd, sec)) == -1) {
        fprintf(stderr, "listen: errno= ret=%d fd = %d port = %d\n",
             errno, io->fd, ntohs(io->local.sin_port));
        return -1;
    }
    return 0;
}

/*

=item C<static ParrotIO *
PIO_unix_accept(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

static ParrotIO *
PIO_unix_accept(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    int newsock;
    int newsize;
    ParrotIO *newio;
    newio = PIO_new(interpreter, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);

    if((newsock = accept(io->fd, (struct sockaddr *)&newio->remote,
                                  (socklen_t *)&newsize)) == -1)
    {
        fprintf(stderr, "accept: errno=%d", errno);
        /* Didn't get far enough, free the io */
        mem_sys_free(newio);
        return NULL;
    }

    newio->fd = newsock;

    /* XXX FIXME: Need to do a getsockname and getpeername here to
     * fill in the sockaddr_in structs for local and peer */

    /* Optionally do a gethostyaddr() to resolve remote IP address.
     * This should be based on an option set in the master socket
     */

    return newio;
}

/*

=item C<static INTVAL
PIO_unix_send(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING *s)>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

static INTVAL
PIO_unix_send(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING *s)
{
    int error, bytes, byteswrote, maxwrite;
    bytes = string_length(s);
    byteswrote = 0;
    maxwrite = 2048;
AGAIN:
    /*
     * Ignore encoding issues for now.
     */
    if((error = send(io->fd, (char *)s->bufstart + byteswrote,
                            s->buflen, 0)) >= 0) {
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
            case EPIPE:        close(io->fd);
                               return -1;
            default:           return -1;
        }
    }
}

/*

=item C<static INTVAL
PIO_unix_recv(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING **s)>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

static INTVAL
PIO_unix_recv(theINTERP, ParrotIOLayer *layer, ParrotIO * io, STRING **s)
{
    int error;
    unsigned int bytesread = 0;
    char buf[2048+1];
AGAIN:
    if((error = recv(io->fd, buf, 2048, 0)) >= 0) {
        if(error > 0)
            bytesread += error;
        else {
            close(io->fd);
        }
        *s = string_make(interpreter, buf, bytesread + 1, NULL, 0, NULL);
        if(!*s) {
            PANIC("PIO_recv: Failed to allocate string");
        }
#if PIO_TRACE
        PIO_eprintf(interpreter, "PIO_unix_revc: %d bytes\n", bytesread);
#endif
        return bytesread;
    } else {
        switch(errno) {
            case EINTR:        goto AGAIN;
#ifdef EWOULDBLOCK
            case EWOULDBLOCK:  goto AGAIN;
#else
            case EGAIN:        goto AGAIN;
#endif
            case ECONNRESET:   close(io->fd);
#if PIO_TRACE
            PIO_eprintf(interpreter, "recv: Connection reset by peer\n"); 
#endif
                               return -1;
            default:           close(io->fd);
#if PIO_TRACE
            PIO_eprintf(interpreter, "recv: errno = %d\n", errno); 
#endif
                               return -1;
        }
    }
}

/*

=item C<static INTVAL
PIO_unix_poll(theINTERP, ParrotIOLayer *l, ParrotIO *io, int which,
               int sec, int usec)>

Utility function for polling a single IO stream with a timeout.

Returns a 1 | 2 | 4 (read, write, error) value.

This is not equivalent to any speficic POSIX or BSD socket call, however
it is a useful, common primitive.

Also, a buffering layer above this may choose to reimpliment by checking
the read buffer.

=cut

*/

static INTVAL
PIO_unix_poll(theINTERP, ParrotIOLayer *l, ParrotIO *io, int which,
               int sec, int usec)
{
    int n;
    fd_set r, w, e;
    struct timeval t;
    t.tv_sec = sec;
    t.tv_usec = usec;
    FD_ZERO(&r); FD_ZERO(&w); FD_ZERO(&e);
    /* These should be defined in header */
    if(which & 1) FD_SET(io->fd, &r);
    if(which & 2) FD_SET(io->fd, &w);
    if(which & 4) FD_SET(io->fd, &e);
AGAIN:
    if((select(io->fd+1, &r, &w, &e, &t)) >= 0) {
        n = (FD_ISSET(io->fd, &r) ? 1 : 0);
        n |= (FD_ISSET(io->fd, &w) ? 2 : 0);
        n |= (FD_ISSET(io->fd, &e) ? 4 : 0);
        return n;
    }
    else {
        switch(errno) {
            case EINTR:        goto AGAIN;
            default:           return -1;
        }
    }
}

/*

=item C<static ParrotIO *
PIO_unix_pipe(theINTERP, ParrotIOLayer *l, STRING *cmd, int flags)>

Very limited C<exec> for now.

XXX: Where does this fit, should it belong in the ParrotIOLayerAPI?

=cut

*/

static ParrotIO *
PIO_unix_pipe(theINTERP, ParrotIOLayer *l, STRING *cmd, int flags)
{
#if defined (linux) || defined (solaris)
    ParrotIO *io;
    int pid, err, fds[2];
    char *ccmd = string_to_cstring(interpreter, cmd);
    /* FIXME mem leak here */

    if((err = pipe(fds)) < 0) {
        perror("pipe:");
        return NULL;
    }

    /* Parent - return IO stream */
    if((pid = fork()) > 0) {
        io = PIO_new(interpreter, PIO_F_PIPE, 0, PIO_F_READ|PIO_F_WRITE);
        io->fd = fds[0];
        io->fd2 = fds[1];
        return io;
    }

    /* Child - exec process */
    if(pid == 0) {
        close(STDIN_FILENO);
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        if( dup(fds[0]) != STDIN_FILENO || dup(fds[1]) != STDOUT_FILENO
               || dup(fds[1]) != STDERR_FILENO )
        {
            exit(0);
        }

        execl(ccmd, ccmd, (char*)0);
        /* Will never reach this unless exec fails. */
        perror("execvp:");
        return NULL;
    }

    perror("fork:");
#endif
    return NULL;
}

#endif





ParrotIOLayerAPI pio_unix_layer_api = {
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
    PIO_unix_seek,
    PIO_unix_tell,
    PIO_null_setbuf,
    PIO_null_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
#if PARROT_NET_DEVEL
    PIO_unix_poll,
    PIO_unix_socket,
    PIO_unix_connect,
    PIO_unix_send,
    PIO_unix_recv
#else
    0, /* no poll */
    0, /* no socket */
    0, /* no connect */
    0, /* no send */
    0 /* no recv */
#endif
};


#endif /* PIO_OS_UNIX */

/*

=back

=head1 SEE ALSO

F<io/io_buf.c>,
F<io/io_passdown.c>,
F<io/io_stdio.c>,
F<io/io_unix.c>,
F<io/io_win32.c>,
F<io/io.c>,
F<io/io_private.h>.

=head1 HISTORY

Initially written by Melvin Smith (mrjoltcola@mindspring.com).

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
