/* io.h
 *  Copyright (C) 2001-2011, Parrot Foundation.
 *  Overview:
 *      Parrot IO subsystem
 *  References:
 *      Perl6 RFCs (14,30,47,60,186,239,321,345,350)
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 *      Some ideas from AT&T SFIO
 */

#ifndef PARROT_IO_H_GUARD
#define PARROT_IO_H_GUARD

#include <stdio.h>

/* &gen_from_def(stdio.pasm) */

#define PIO_STDIN_FILENO  0
#define PIO_STDOUT_FILENO 1
#define PIO_STDERR_FILENO 2

/* &end_gen */

/* Read whatever is available */
#define PIO_READ_SIZE_ANY   ((size_t)-1)

/* Block Size. Returned from Parrot_io_internal_getblksize */
#ifdef BLKSIZE
#  define PIO_BLKSIZE BLKSIZE
#else
#  define PIO_BLKSIZE  8192
#endif

/* Buffer flags */
#define PIO_BF_MALLOC   0x0001        /* Buffer malloced              */
#define PIO_BF_MMAP     0x0002        /* Buffer mmap()ed              */
#define PIO_BF_LINEBUF  0x0004        /* Flushes on newline           */
#define PIO_BF_BLKBUF   0x0008        /* Raw block-based buffering    */

/* TODO: What is this? Figure it out and properly document it's use. */
#define PIO_NR_OPEN 256                 /* Size of an "IO handle table" */

/* Handle flags */
#define PIO_F_READ      00000001        /* File is opened for reading   */
#define PIO_F_WRITE     00000002        /* File is opened for writing   */
#define PIO_F_APPEND    00000004        /* File is opened for append    */
#define PIO_F_TRUNC     00000010
#define PIO_F_EOF       00000020        /* File is at EOF               */
#define PIO_F_PIPE      00000040        /* FileHandle is in pipe mode   */
#define PIO_F_CONSOLE   00001000        /* A terminal                   */
#define PIO_F_READLINE  00002000        /* user interactive readline    */
#define PIO_F_SOFT_SP   00040000        /* Python softspace             */
#define PIO_F_SHARED    00100000        /* Stream shares a file handle  */
#define PIO_F_ASYNC     01000000        /* Handle is asynchronous       */
#define PIO_F_BINARY    02000000        /* Open in binary mode          */

/* IO VTABLE Flags */
#define PIO_VF_DEFAULT_READ_BUF     0x0001  /* This type uses read buffers by default  */
#define PIO_VF_DEFAULT_WRITE_BUF    0x0002  /* This type uses write buffers by default */
#define PIO_VF_FLUSH_ON_CLOSE       0x0004  /* Flush before closing                    */
#define PIO_VF_PATH_NOT_REQUIRED    0x0008  /* This handle does not require a path
                                               for .open()                             */
#define PIO_VF_AWAYS_READABLE       0x0010  /* Handle can always be read               */
#define PIO_VF_MULTI_READABLE       0x0020  /* Can perform multiple low-level read
                                               operations to satisfy a large request   */

/*
 * pioctl argument constants. These don't have to
 * be unique across io commands.
 */
#define PIOCTL_NONBUF              0
#define PIOCTL_LINEBUF             1
#define PIOCTL_BLKBUF              2

/*
 * Enum definition of constants for Socket.socket.
 * Note that these are the *parrot* values for these defines; the system
 * values vary from one platform to the next.  See the lookup tables in
 * socket_unix.c and socket_win32.c for the mappings.
 */

/* &gen_from_enum(socket.pasm) */
typedef enum {
    PIO_PF_LOCAL    = 0,
    PIO_PF_UNIX     = 1,
    PIO_PF_INET     = 2,
    PIO_PF_INET6    = 3,
    PIO_PF_MAX      = 4     /* last elem */
} Socket_Protocol_Family;

typedef enum {
    PIO_SOCK_PACKET     = 0,
    PIO_SOCK_STREAM     = 1,
    PIO_SOCK_DGRAM      = 2,
    PIO_SOCK_RAW        = 3,
    PIO_SOCK_RDM        = 4,
    PIO_SOCK_SEQPACKET  = 5,
    PIO_SOCK_MAX        = 6 /* last element */
} Socket_Socket_Type;

typedef enum {
    PIO_PROTO_TCP   = 6,
    PIO_PROTO_UDP   = 17 /* last element */
} Socket_Protocol;
/* &end_gen */

extern PIOOFF_T piooffsetzero;

typedef struct _ParrotIOData ParrotIOData;

/* BUFFERING */
typedef struct _io_buffer {
    INTVAL flags;                   /* Flags on this buffer            */
    size_t raw_reads;               /* Number of raw reads             */
    size_t buffer_size;             /* Current allocated size          */
    const STR_VTABLE *encoding;     /* Encoding used by this buffer    */
    char *buffer_ptr;               /* ptr to the buffer mem block     */
    char *buffer_start;             /* ptr to the start of the data    */
    char *buffer_end;               /* ptr to the end of the data      */
} IO_BUFFER;

/* For examples of mmap-like behavior on windows, see:
http://msdn.microsoft.com/en-us/library/windows/desktop/aa366551(v=vs.85).aspx
*/

/* IO VTABLEs */
/* Legend:
    _s: This function operates on a Parrot STRING*
    _b: This function operates on a raw char* buffer (Possibly from ByteBuffer)
*/

typedef INTVAL      (*io_vtable_read_b)       (PARROT_INTERP, PMC *handle, ARGOUT(char * buffer), size_t byte_length);
typedef INTVAL      (*io_vtable_write_b)      (PARROT_INTERP, PMC *handle, ARGIN(char * buffer), size_t byte_length);
typedef INTVAL      (*io_vtable_flush)        (PARROT_INTERP, PMC *handle);
typedef INTVAL      (*io_vtable_is_eof)       (PARROT_INTERP, PMC *handle);
typedef void        (*io_vtable_set_eof)      (PARROT_INTERP, PMC *handle, INTVAL is_set);
typedef PIOOFF_T    (*io_vtable_tell)         (PARROT_INTERP, PMC *handle);
typedef PIOOFF_T    (*io_vtable_seek)         (PARROT_INTERP, PMC *handle, PIOOFF_T offset, INTVAL whence);
typedef void        (*io_vtable_adv_position) (PARROT_INTERP, PMC *handle, size_t len);
typedef void        (*io_vtable_set_position) (PARROT_INTERP, PMC *handle, PIOOFF_T pos);
typedef PIOOFF_T    (*io_vtable_get_position) (PARROT_INTERP, PMC *handle);
typedef INTVAL      (*io_vtable_open)         (PARROT_INTERP, PMC *handle, ARGIN(STRING *path), INTVAL flags, ARGIN(STRING *mode));
typedef INTVAL      (*io_vtable_is_open)      (PARROT_INTERP, PMC *handle);
typedef INTVAL      (*io_vtable_close)        (PARROT_INTERP, PMC *handle);
typedef void        (*io_vtable_set_flags)    (PARROT_INTERP, PMC *handle, INTVAL flags);
typedef INTVAL      (*io_vtable_get_flags)    (PARROT_INTERP, PMC *handle);
typedef size_t      (*io_vtable_total_size)   (PARROT_INTERP, PMC *handle);
typedef PIOHANDLE   (*io_vtable_get_piohandle)(PARROT_INTERP, PMC *handle);
typedef const STR_VTABLE *(*io_vtable_get_encoding) (PARROT_INTERP, PMC *handle);

typedef struct _io_vtable {
    const char            * name;           /* Name of this vtable type */
    INTVAL                  number;         /* Index number of this vtable */
    INTVAL                  flags;          /* Flags for this type */
    io_vtable_read_b        read_b;         /* Read bytes from the handle */
    io_vtable_write_b       write_b;        /* Write bytes to the handle */
    io_vtable_flush         flush;          /* Flush the handle */
    io_vtable_is_eof        is_eof;         /* Determine if at end-of-file */
    io_vtable_set_eof       set_eof;        /* Set or clear the passed-EOF flag */
    io_vtable_open          open;           /* Open the handle */
    io_vtable_is_open       is_open;        /* Determine if the handle is open */
    io_vtable_close         close;          /* Close the handle */
    io_vtable_tell          tell;           /* Get on-disk file position */
    io_vtable_seek          seek;           /* Seek to new position */
    io_vtable_adv_position  adv_position;   /* Advance handle (in-mem) position */
    io_vtable_set_position  set_position;   /* Set handle (in-mem) position */
    io_vtable_get_position  get_position;   /* Get handle (in-mem) position */
    io_vtable_get_flags     get_flags;      /* Get the flags */
    io_vtable_set_flags     set_flags;      /* Set the flags */
    io_vtable_get_encoding  get_encoding;   /* Get the handle encoding */
    io_vtable_total_size    total_size;     /* Get the total size, if possible */
    io_vtable_get_piohandle get_piohandle;  /* Get the raw file PIOHANDLE */
} IO_VTABLE;

/* Indices to common IO vtables */
#define IO_VTABLE_FILEHANDLE        0
#define IO_VTABLE_PIPE              1
#define IO_VTABLE_SOCKET            2
#define IO_VTABLE_STRINGHANDLE      3
#define IO_VTABLE_USER              4

/* get_pointer values for common io-related pointer values.
   ALL IO handle types MUST implement get_pointer and MUST respond to these
   values. */
#define IO_PTR_IDX_VTABLE           0
#define IO_PTR_IDX_READ_BUFFER      1
#define IO_PTR_IDX_WRITE_BUFFER     2

/* Specify that the buffer may be any size */
#define BUFFER_SIZE_ANY     (size_t)-1
#define BUFFER_FLAGS_ANY    (INTVAL)0

/* Helpful wrappers to get common pointers from IO handle PMCs */
#define IO_GET_VTABLE(i, p) ((const IO_VTABLE *)VTABLE_get_pointer_keyed_int((i), (p), IO_PTR_IDX_VTABLE))
#define IO_GET_READ_BUFFER(i, p) ((IO_BUFFER *)VTABLE_get_pointer_keyed_int((i), (p), IO_PTR_IDX_READ_BUFFER))
#define IO_GET_WRITE_BUFFER(i, p) ((IO_BUFFER *)VTABLE_get_pointer_keyed_int((i), (p), IO_PTR_IDX_WRITE_BUFFER))

/* io/api.c - Public API functions */
/* HEADERIZER BEGIN: src/io/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
INTVAL Parrot_io_close(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL autoflush)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
INTVAL Parrot_io_close_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_eprintf(
    NULLOK(PARROT_INTERP),
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen(PARROT_INTERP,
    ARGIN(PMC *pmc),
    PIOHANDLE fd,
    ARGIN(STRING *sflags))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_fdopen_flags(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOHANDLE fd,
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

PARROT_EXPORT
void Parrot_io_finish(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
size_t Parrot_io_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
void Parrot_io_flush_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_fprintf(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_getfd(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_io_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_async(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_closed(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_is_tty_handle(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_make_offset(INTVAL offset);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_make_offset32(INTVAL hi, INTVAL lo);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_open(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(STRING *path),
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_open_handle(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(STRING *path),
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_peek(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
INTVAL Parrot_io_poll(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    INTVAL which,
    INTVAL sec,
    INTVAL usec)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_pprintf(PARROT_INTERP,
    PIOHANDLE os_handle,
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_io_printf(PARROT_INTERP,
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_io_putps(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
INTVAL Parrot_io_puts(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_read_byte_buffer_pmc(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGMOD_NULLOK(PMC *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_read_s(PARROT_INTERP, ARGMOD(PMC *handle), size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_readall_s(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_readline(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_readline_s(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING * terminator))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_reads(PARROT_INTERP, ARGMOD(PMC *pmc), size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_io_recv_handle(PARROT_INTERP, ARGMOD(PMC *pmc), size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL w)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_seek_handle(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL w)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_socket(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *socket),
    INTVAL fam,
    INTVAL type,
    INTVAL proto)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*socket);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_socket_accept(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
void Parrot_io_socket_bind(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGMOD(PMC *address))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*address);

PARROT_EXPORT
void Parrot_io_socket_connect(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    ARGMOD(PMC *address))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pmc)
        FUNC_MODIFIES(*address);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL Parrot_io_socket_handle(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *socket),
    INTVAL fam,
    INTVAL type,
    INTVAL proto)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*socket);

PARROT_EXPORT
void Parrot_io_socket_initialize(PARROT_INTERP, ARGMOD(PMC *socket))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*socket);

PARROT_EXPORT
void Parrot_io_socket_listen(PARROT_INTERP,
    ARGMOD(PMC *pmc),
    INTVAL backlog)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_socket_new(PARROT_INTERP, INTVAL flags)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_STDERR(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_io_stdhandle(PARROT_INTERP,
    INTVAL fileno,
    ARGIN_NULLOK(PMC *newhandle))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_STDIN(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_io_STDOUT(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_tell_handle(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t Parrot_io_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(const void *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

PARROT_EXPORT
INTVAL Parrot_io_write_s(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

void io_setup_vtables(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
const IO_VTABLE * Parrot_io_allocate_new_vtable(PARROT_INTERP,
    ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_buffer_size(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL size,
    INTVAL has_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_io_get_buffer_mode(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_get_os_handle(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PIOHANDLE Parrot_io_get_standard_piohandle(PARROT_INTERP, INTVAL idx)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const IO_VTABLE * Parrot_io_get_vtable(PARROT_INTERP,
    INTVAL idx,
    ARGIN_NULLOK(const char * name))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_make_offset_pmc(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void Parrot_io_mark(PARROT_INTERP, ARGIN(ParrotIOData *piodata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_io_reencode_string_for_handle(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN_NULLOK(STRING *str))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_io_set_buffer_mode(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

void Parrot_io_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL Parrot_io_write_byte_buffer_pmc(PARROT_INTERP,
    ARGMOD(PMC * handle),
    ARGMOD(PMC *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* handle)
        FUNC_MODIFIES(*buffer);

#define ASSERT_ARGS_Parrot_io_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_close_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_eprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_fdopen __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(sflags))
#define ASSERT_ARGS_Parrot_io_fdopen_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_Parrot_io_finish __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_flush_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_fprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_getfd __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_is_async __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_is_closed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_is_tty_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_make_offset __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_make_offset32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_Parrot_io_open_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_Parrot_io_peek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_poll __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_pprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_printf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_putps __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_puts __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_read_byte_buffer_pmc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_read_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_readall_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_readline __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_readline_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(terminator))
#define ASSERT_ARGS_Parrot_io_reads __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_recv_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_seek_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_socket __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_socket_accept __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_socket_bind __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(address))
#define ASSERT_ARGS_Parrot_io_socket_connect __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(address))
#define ASSERT_ARGS_Parrot_io_socket_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_socket_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(socket))
#define ASSERT_ARGS_Parrot_io_socket_listen __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_socket_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_STDERR __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_stdhandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_STDIN __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_STDOUT __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_tell_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_io_write_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_io_setup_vtables __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_allocate_new_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_io_buffer_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_get_buffer_mode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_get_os_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_get_standard_piohandle \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_get_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_make_offset_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_io_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(piodata))
#define ASSERT_ARGS_Parrot_io_reencode_string_for_handle \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_set_buffer_mode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_Parrot_io_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_write_byte_buffer_pmc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/api.c */

/* io/buffer.c - Buffering functions */
/* HEADERIZER BEGIN: src/io/buffer.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
size_t io_buffer_find_num_characters(PARROT_INTERP,
    ARGMOD(IO_BUFFER *buffer),
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGIN(const STR_VTABLE *encoding),
    ARGMOD(Parrot_String_Bounds *bounds),
    size_t num_chars)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*bounds);

PARROT_WARN_UNUSED_RESULT
size_t io_buffer_find_string_marker(PARROT_INTERP,
    ARGMOD(IO_BUFFER *buffer),
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGIN(const STR_VTABLE *encoding),
    ARGMOD(Parrot_String_Bounds *bounds),
    ARGIN(STRING * delim),
    ARGOUT(INTVAL *have_delim))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6)
        __attribute__nonnull__(7)
        __attribute__nonnull__(8)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*bounds)
        FUNC_MODIFIES(*have_delim);

void Parrot_io_buffer_add_to_handle(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL idx,
    size_t length,
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

void Parrot_io_buffer_advance_position(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    size_t len)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*buffer);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
IO_BUFFER * Parrot_io_buffer_allocate(PARROT_INTERP,
    ARGMOD(PMC *owner),
    INTVAL flags,
    ARGIN_NULLOK(const STR_VTABLE *encoding),
    size_t init_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*owner);

void Parrot_io_buffer_clear(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*buffer);

PARROT_WARN_UNUSED_RESULT
size_t Parrot_io_buffer_content_size(PARROT_INTERP,
    ARGIN(IO_BUFFER *buffer))
        __attribute__nonnull__(2);

size_t Parrot_io_buffer_fill(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    ARGMOD(PMC * handle),
    ARGIN(const IO_VTABLE *vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(* handle);

size_t Parrot_io_buffer_flush(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    ARGMOD(PMC * handle),
    ARGIN(const IO_VTABLE *vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(* handle);

void Parrot_io_buffer_free(PARROT_INTERP, ARGFREE(IO_BUFFER *buffer))
        __attribute__nonnull__(1);

void Parrot_io_buffer_mark(PARROT_INTERP, ARGMOD_NULLOK(IO_BUFFER *buffer))
        FUNC_MODIFIES(*buffer);

UINTVAL Parrot_io_buffer_peek(PARROT_INTERP,
    ARGMOD(IO_BUFFER *buffer),
    ARGMOD(PMC * handle),
    ARGIN(const IO_VTABLE *vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(* handle);

size_t Parrot_io_buffer_read_b(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    ARGIN(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGOUT(char *s),
    size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(*s);

void Parrot_io_buffer_remove_from_handle(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

size_t Parrot_io_buffer_resize(PARROT_INTERP,
    ARGMOD(IO_BUFFER *buffer),
    size_t new_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

PIOOFF_T Parrot_io_buffer_seek(PARROT_INTERP,
    ARGMOD(IO_BUFFER *buffer),
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    PIOOFF_T offset,
    INTVAL w)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(*handle);

PARROT_WARN_UNUSED_RESULT
PIOOFF_T Parrot_io_buffer_tell(PARROT_INTERP,
    ARGIN_NULLOK(IO_BUFFER *buffer),
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE * vtable))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*handle);

size_t Parrot_io_buffer_write_b(PARROT_INTERP,
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    ARGMOD(PMC * handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGIN(char *s),
    size_t length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*buffer)
        FUNC_MODIFIES(* handle);

#define ASSERT_ARGS_io_buffer_find_num_characters __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(encoding) \
    , PARROT_ASSERT_ARG(bounds))
#define ASSERT_ARGS_io_buffer_find_string_marker __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(encoding) \
    , PARROT_ASSERT_ARG(bounds) \
    , PARROT_ASSERT_ARG(delim) \
    , PARROT_ASSERT_ARG(have_delim))
#define ASSERT_ARGS_Parrot_io_buffer_add_to_handle \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_buffer_advance_position \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_buffer_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(owner))
#define ASSERT_ARGS_Parrot_io_buffer_clear __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_buffer_content_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_io_buffer_fill __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_io_buffer_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_io_buffer_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_io_buffer_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_io_buffer_peek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_io_buffer_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_io_buffer_remove_from_handle \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_Parrot_io_buffer_resize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_io_buffer_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_io_buffer_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_Parrot_io_buffer_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/buffer.c */

#endif /* PARROT_IO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
