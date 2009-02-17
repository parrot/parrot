/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/io/unix.c - UNIX IO utility functions

=head1 DESCRIPTION

This file implements unbuffered, low-level, UNIX-specific functionality.
"UNIX" is a generalization, it may be necessary to create separate OS-specific
functions for UNIX flavors.

These functions are not part of Parrot's API. Don't call them directly, call
the C<PIO_*> macros instead. Each platform defines the standard set of macros,
which call the correct functions for that platform.

=head2 References:

APitUE - W. Richard Stevens, AT&T SFIO, Perl 5 (Nick Ing-Simmons)

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

#ifdef PIO_OS_UNIX

/* HEADERIZER HFILE: include/parrot/io_unix.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=back

=head2 Networking

Define C<PARROT_NET_DEVEL> to enable networking.

These could be native extensions but they probably should be here if we
wish to make them integrated with the async IO system.

Very minimal stubs for now, maybe someone will run with these.

=over 4

=item C<STRING * Parrot_io_sockaddr_in>

C<Parrot_io_sockaddr_in()> is not part of the layer and so must be C<extern>.

XXX: We can probably just write our own routines (C<htons()>,
C<inet_aton()>, etc.) and take this out of platform specific compilation

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_sockaddr_in(PARROT_INTERP, unsigned short port, ARGIN(STRING *addr))
{
    struct sockaddr_in sa;
    /* Hard coded to IPv4 for now */
    const int family = AF_INET;

    char * const s = Parrot_str_to_cstring(interp, addr);
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
            fprintf(stderr, "gethostbyname failure [%s]\n", s);
            Parrot_str_free_cstring(s);
            return NULL;
        }
        memcpy((char*)&sa.sin_addr, he->h_addr, sizeof (sa.sin_addr));
    }
    Parrot_str_free_cstring(s);

    sa.sin_family = family;
    sa.sin_port = htons(port);

    return string_make(interp, (char *)&sa, sizeof (struct sockaddr_in),
            "binary", 0);
}


#  if PARROT_NET_DEVEL

/*

=item C<PMC * Parrot_io_socket_unix>

Uses C<socket()> to create a socket with the specified address family,
socket type and protocol number.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_socket_unix(PARROT_INTERP, ARGMOD(PMC *socket), int fam, int type, int proto)
{
    const int sock = socket(fam, type, proto);
    if (sock >= 0) {
        ParrotIO * const io = Parrot_io_new(interp, PIO_F_SOCKET, 0, PIO_F_READ|PIO_F_WRITE);
        Parrot_io_set_os_handle(interp, socket, sock);
        memset(&io->local, 0, sizeof (struct sockaddr_in));
        memset(&io->remote, 0, sizeof (struct sockaddr_in));
        io->remote.sin_family = fam;
        return io;
    }
    return NULL;
}

/*

=item C<INTVAL Parrot_io_connect_unix>

Connects C<*io>'s socket to address C<*r>.

=cut

*/

INTVAL
Parrot_io_connect_unix(SHIM_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io),
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

=item C<INTVAL Parrot_io_bind_unix>

Binds C<*io>'s socket to the local address and port specified by C<*l>.

=cut

*/

INTVAL
Parrot_io_bind_unix(SHIM_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io),
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

=item C<INTVAL Parrot_io_listen_unix>

Listen for new connections. This is only applicable to C<STREAM> or
C<SEQ> sockets.

=cut

*/

INTVAL
Parrot_io_listen_unix(SHIM_INTERP, SHIM(PMC *socket), ARGIN(ParrotIO *io),
        INTVAL sec)
{
    if ((listen(io->fd, sec)) == -1) {
        return -1;
    }
    return 0;
}

/*

=item C<ParrotIO * Parrot_io_accept_unix>

Accept a new connection and return a newly created C<ParrotIO> socket.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_accept_unix(PARROT_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io))
{
    ParrotIO * const    newio   = Parrot_io_new(interp, PIO_F_SOCKET, 0,
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

=item C<INTVAL Parrot_io_send_unix>

Send the message C<*s> to C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_send_unix(SHIM_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io),
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

=item C<INTVAL Parrot_io_recv_unix>

Receives a message in C<**s> from C<*io>'s connected socket.

=cut

*/

INTVAL
Parrot_io_recv_unix(PARROT_INTERP, SHIM(PMC *socket),
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
                *s = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);
                return -1;
            default:
                close(io->fd);
                *s = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);
                return -1;
        }
    }
}

/*

=item C<INTVAL Parrot_io_poll_unix>

Utility function for polling a single IO stream with a timeout.

Returns a 1 | 2 | 4 (read, write, error) value.

This is not equivalent to any speficic POSIX or BSD socket call, however
it is a useful, common primitive.

Not at all usefule --leo.

Also, a buffering layer above this may choose to reimpliment by checking
the read buffer.

=cut

*/

INTVAL
Parrot_io_poll_unix(SHIM_INTERP, SHIM(PMC *socket), ARGMOD(ParrotIO *io), int which,
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

=item C<PMC * Parrot_io_pipe_unix>

Very limited C<exec> for now.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_pipe_unix(PARROT_INTERP, SHIM(PMC *filehandle), ARGIN(const char *cmd), int flags)
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
            Parrot_io_new(interp, PIO_F_PIPE, 0, flags & (PIO_F_READ|PIO_F_WRITE));
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
