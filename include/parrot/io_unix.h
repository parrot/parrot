/* io_unix.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
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
INTVAL Parrot_io_close_unix(PARROT_INTERP, PIOHANDLE file_descriptor)
        __attribute__nonnull__(1);

INTVAL Parrot_io_flush_unix(PARROT_INTERP, PIOHANDLE os_handle)
        __attribute__nonnull__(1);

INTVAL Parrot_io_getblksize_unix(PIOHANDLE fd);
INTVAL Parrot_io_init_unix(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_tty_unix(SHIM_INTERP, PIOHANDLE fd);

PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_open_pipe_unix(PARROT_INTERP,
    ARGIN(STRING *command),
    INTVAL flags,
    ARGOUT(INTVAL *pid_out))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pid_out);

PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_open_unix(PARROT_INTERP,
    ARGIN(STRING *path),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
INTVAL Parrot_io_pipe_unix(SHIM_INTERP,
    ARGMOD(PIOHANDLE *reader),
    ARGMOD(PIOHANDLE *writer))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*reader)
        FUNC_MODIFIES(*writer);

INTVAL Parrot_io_pipe_wait_unix(PARROT_INTERP, INTVAL pid)
        __attribute__nonnull__(1);

size_t Parrot_io_read_unix(PARROT_INTERP,
    PIOHANDLE os_handle,
    ARGMOD(char *buf),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*buf);

PIOOFF_T Parrot_io_seek_unix(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PIOHANDLE Parrot_io_stdhandle_unix(PARROT_INTERP, INTVAL fileno)
        __attribute__nonnull__(1);

PIOOFF_T Parrot_io_tell_unix(PARROT_INTERP, ARGMOD(PMC *filehandle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

size_t Parrot_io_write_unix(PARROT_INTERP,
    PIOHANDLE os_handle,
    ARGIN(const char *buf),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_io_async_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_close_piohandle_unix \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_close_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_flush_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_getblksize_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_init_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_is_tty_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_open_pipe_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command) \
    , PARROT_ASSERT_ARG(pid_out))
#define ASSERT_ARGS_Parrot_io_open_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_io_pipe_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(reader) \
    , PARROT_ASSERT_ARG(writer))
#define ASSERT_ARGS_Parrot_io_pipe_wait_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_read_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf))
#define ASSERT_ARGS_Parrot_io_seek_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_stdhandle_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_tell_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_write_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buf))
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
#define PIO_STDHANDLE(interp, fileno) Parrot_io_stdhandle_unix((interp), (fileno))
#define PIO_OPEN(interp, file, flags) \
    Parrot_io_open_unix((interp), (file), (flags))
#define PIO_OPEN_PIPE(interp, file, flags, pid) \
    Parrot_io_open_pipe_unix((interp), (file), (flags), (pid))
#define PIO_DUP(interp, handle) (PIOHANDLE)dup((int)(handle))
#define PIO_CLOSE(interp, handle) Parrot_io_close_unix((interp), (handle))
#define PIO_CLOSE_PIOHANDLE(interp, handle) Parrot_io_close_piohandle_unix((interp), (handle))
#define PIO_PIPE_WAIT(interp, pid) Parrot_io_pipe_wait_unix((interp), (pid))
#define PIO_READ(interp, handle, buf, len) Parrot_io_read_unix((interp), (handle), (buf), (len))
#define PIO_WRITE(interp, handle, buf, len) Parrot_io_write_unix((interp), (handle), (buf), (len))
#define PIO_SEEK(interp, pmc, offset, start) \
    Parrot_io_seek_unix((interp), (pmc), (offset), (start))
#define PIO_TELL(interp, pmc) Parrot_io_tell_unix((interp), (pmc))
#define PIO_FLUSH(interp, handle) Parrot_io_flush_unix((interp), (handle))
#define PIO_GETBLKSIZE(handle) Parrot_io_getblksize_unix((handle))
#define PIO_IS_TTY(interp, handle) \
    Parrot_io_is_tty_unix((interp), (handle))

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
#define PIO_SOCKADDR_IN(interp, addr, port) \
    Parrot_io_sockaddr_in((interp), (addr), (port))

#endif /* PARROT_IO_UNIX_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
