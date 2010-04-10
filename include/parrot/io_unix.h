/* io_unix.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *      Parrot IO subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_IO_UNIX_H_GUARD
#define PARROT_IO_UNIX_H_GUARD

/* Hopefully INTVAL_SIZE is enough for PTR_SIZE so that
 * the FILE* of pio_stdio_layers fit into a PIOHANDLE. */
typedef INTVAL PIOHANDLE;
typedef off_t PIOOFF_T;

#define PIO_INVALID_HANDLE -1

/* HEADERIZER BEGIN: src/io/unix.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

INTVAL Parrot_io_async_unix(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    INTVAL b)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_close_piohandle_unix(SHIM_INTERP, PIOHANDLE handle);
INTVAL Parrot_io_close_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen_unix(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOHANDLE fd,
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_flush_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

INTVAL Parrot_io_getblksize_unix(PIOHANDLE fd);
INTVAL Parrot_io_init_unix(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL Parrot_io_is_closed_unix(PARROT_INTERP, ARGIN(const PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_open_pipe_unix(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN(STRING *command),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_open_unix(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *filehandle),
    ARGIN(STRING *path),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

size_t Parrot_io_peek_unix(PARROT_INTERP,
    SHIM(PMC *filehandle),
    SHIM(STRING **buf))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL Parrot_io_pipe_unix(SHIM_INTERP,
    ARGMOD(PIOHANDLE *reader),
    ARGMOD(PIOHANDLE *writer))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*reader)
        FUNC_MODIFIES(*writer);

size_t Parrot_io_read_unix(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    ARGIN(STRING **buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*filehandle);

PIOOFF_T Parrot_io_seek_unix(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PIOOFF_T Parrot_io_tell_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

size_t Parrot_io_write_unix(PARROT_INTERP,
    ARGIN(PMC *filehandle),
    ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*s);

#define ASSERT_ARGS_Parrot_io_async_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_close_piohandle_unix \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_close_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_fdopen_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_flush_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_getblksize_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_init_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_is_closed_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_open_pipe_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_Parrot_io_open_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_io_peek_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_pipe_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(reader) \
    , PARROT_ASSERT_ARG(writer))
#define ASSERT_ARGS_Parrot_io_read_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_Parrot_io_seek_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_tell_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_write_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/unix.c */


/* HEADERIZER BEGIN: src/io/socket_unix.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_accept_unix(PARROT_INTERP, ARGMOD(PMC *socket))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*socket);

INTVAL Parrot_io_bind_unix(PARROT_INTERP,
    ARGMOD(PMC *socket),
    ARGMOD(PMC *sockaddr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*socket)
        FUNC_MODIFIES(*sockaddr);

INTVAL Parrot_io_connect_unix(PARROT_INTERP,
    ARGMOD(PMC *socket),
    ARGIN(PMC *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*socket);

INTVAL Parrot_io_listen_unix(SHIM_INTERP, ARGMOD(PMC *socket), INTVAL sec)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*socket);

INTVAL Parrot_io_poll_unix(SHIM_INTERP,
    ARGMOD(PMC *socket),
    int which,
    int sec,
    int usec)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*socket);

INTVAL Parrot_io_recv_unix(PARROT_INTERP,
    ARGMOD(PMC *socket),
    ARGOUT(STRING **s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*socket)
        FUNC_MODIFIES(*s);

INTVAL Parrot_io_send_unix(SHIM_INTERP,
    ARGMOD(PMC *socket),
    ARGMOD(STRING *s))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*socket)
        FUNC_MODIFIES(*s);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_sockaddr_in(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL Parrot_io_socket_unix(PARROT_INTERP,
    ARGIN(PMC *s),
    int fam,
    int type,
    int proto)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_io_accept_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(socket))
#define ASSERT_ARGS_Parrot_io_bind_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(socket) \
    , PARROT_ASSERT_ARG(sockaddr))
#define ASSERT_ARGS_Parrot_io_connect_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(socket) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_Parrot_io_listen_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(socket))
#define ASSERT_ARGS_Parrot_io_poll_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(socket))
#define ASSERT_ARGS_Parrot_io_recv_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(socket) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_send_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(socket) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_sockaddr_in __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(addr))
#define ASSERT_ARGS_Parrot_io_socket_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/socket_unix.c */



#define PIO_INIT(interp) Parrot_io_init_unix((interp))
#define PIO_OPEN(interp, pmc, file, flags) \
    Parrot_io_open_unix((interp), (pmc), (file), (flags))
#define PIO_FDOPEN(interp, pmc, handle, flags) \
    Parrot_io_fdopen_unix((interp), (pmc), (handle), (flags))
#define PIO_OPEN_PIPE(interp, pmc, file, flags) \
    Parrot_io_open_pipe_unix((interp), (pmc), (file), (flags))
#define PIO_CLOSE(interp, pmc) Parrot_io_close_unix((interp), (pmc))
#define PIO_CLOSE_PIOHANDLE(interp, handle) Parrot_io_close_piohandle_unix((interp), (handle))
#define PIO_IS_CLOSED(interp, pmc) Parrot_io_is_closed_unix((interp), (pmc))
#define PIO_READ(interp, pmc, buf) Parrot_io_read_unix((interp), (pmc), (buf))
#define PIO_WRITE(interp, pmc, str) Parrot_io_write_unix((interp), (pmc), (str))
#define PIO_SEEK(interp, pmc, offset, start) \
    Parrot_io_seek_unix((interp), (pmc), (offset), (start))
#define PIO_TELL(interp, pmc) Parrot_io_tell_unix((interp), (pmc))
#define PIO_PEEK(interp, pmc, buf) Parrot_io_peek_unix((interp), (pmc), (buf))
#define PIO_FLUSH(interp, pmc) Parrot_io_flush_unix((interp), (pmc))
#define PIO_GETBLKSIZE(handle) Parrot_io_getblksize_unix((handle))

#define PIO_POLL(interp, pmc, which, sec, usec) \
    Parrot_io_poll_unix((interp), (pmc), (which), (sec), (usec))
#define PIO_PIPE(interp, reader, writer) \
    Parrot_io_pipe_unix((interp), (reader), (writer))
#define PIO_SOCKET(interp, socket, fam, type, proto) \
    Parrot_io_socket_unix((interp), (socket), (fam), (type), (proto))
#define PIO_RECV(interp, pmc, buf) \
    Parrot_io_recv_unix((interp), (pmc), (buf))
#define PIO_SEND(interp, pmc, buf) \
    Parrot_io_send_unix((interp), (pmc), (buf))
#define PIO_CONNECT(interp, pmc, address) \
    Parrot_io_connect_unix((interp), (pmc), (address))
#define PIO_BIND(interp, pmc, address) \
    Parrot_io_bind_unix((interp), (pmc), (address))
#define PIO_LISTEN(interp, pmc, backlog) \
    Parrot_io_listen_unix((interp), (pmc), (backlog))
#define PIO_ACCEPT(interp, pmc) \
    Parrot_io_accept_unix((interp), (pmc))

#endif /* PARROT_IO_UNIX_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
