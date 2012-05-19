/*
Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

src/io/io_private.h - IO internals

=head1 DESCRIPTION

Internal Details of the Parrot IO subsystem.

=head2 References

Perl6 RFCs (14,30,47,60,186,239,321,345,350).

Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work.

Some ideas from AT&T SFIO.

=cut

*/

/* BASIC IO SYSTEM DESIGN

The IO Subsystem will be broken up into several components, by file. Here is
a basic roadmap of files, their responsibilities and their locations in the
repo:

PUBLIC API

src/io/api.c:
    The public API. These are the functions used by most of core Parrot and
    exported for use by extenders. These are the interfaces to be used when
    writing IO-related code at the C level.

src/pmc/*handle.pmc
src/pmc/socket.pmc
    These are the specific IO object implementations and are the preferred
    interface for performing IO-related operations from the bytecode level.

IO VTABLES - These things are private to the IO subsystem and operate on
             PIOHANDLEs, not PMCs

src/io/filehandle.c:
    IO VTABLE definitions for filehandle-related operations. FileHandle PMC
    methods and file-related IO API calls will invoke these functions.

src/io/socket.c:
    IO VTABLE definitions for socket-related operations. Socket PMC methods
    and socket-related IO API calls will invoke these functions.

src/io/stringhandle.c:
    IO VTABLE definitions for stringhandle-related operations. StringHandle
    PMC methods and related IO API calls will invoke these functions.

src/io/userobject.c:
    IO VTABLE definitions for user-defined and PBC-level IO objects. These
    are the IO operations that will be used for a user-defined IO object that
    does not directly inherit from FileHandle, Socket, or Handle.

src/io/pipe.c:
    IO VTABLE definitions for pipe-related operations. FileHandle PMC in Pipe
    mode ("p") and future Pipe PMC types, and pipe-related API calls will
    invoke these functions.

LOW-LEVEL DETAILS - These things implement the lowest-level logic and are
                    operating on PIOHANDLEs and raw data buffers.

src/io/buffer.c:
    Buffering logic, for handles that have buffering set up. The various IO
    VTABLE calls in the files above will redirect their calls through the
    buffering system, before being sent to the low-level system interfaces.

src/platform/X/io.c:
src/platform/X/file.c:
src/platform/X/socket.c:
    Platform-specific operation abstractions for performing the lowest-level
    IO operations on the operating system.

DIAGRAM

    IO API (api.c)
         |
         |
         |      [                     PRIVATE                      ]
         +----> IO VTABLEs -----> Buffers -----> Low-Level Interface
         |
         |
         |
    IO PMCs

*/

#ifndef PARROT_IO_PRIVATE_H_GUARD
#define PARROT_IO_PRIVATE_H_GUARD

#define PARROT_IN_IO 1

#include <parrot/io.h>

/* Buffer flags */
#define PIO_BF_MALLOC   00000001        /* Buffer malloced              */
#define PIO_BF_READBUF  00000002        /* Buffer is read-buffer        */
#define PIO_BF_WRITEBUF 00000004        /* Buffer is write-buffer       */
#define PIO_BF_MMAP     00000010        /* Buffer mmap()ed              */


#define PIO_UNBOUND     (size_t)-1

typedef PMC **ParrotIOTable;

struct _ParrotIOData {
    ParrotIOTable table;
};

/* redefine PIO_STD* for internal use */
#define _PIO_STDIN(i)   ((i)->piodata->table[PIO_STDIN_FILENO])
#define _PIO_STDOUT(i)  ((i)->piodata->table[PIO_STDOUT_FILENO])
#define _PIO_STDERR(i)  ((i)->piodata->table[PIO_STDERR_FILENO])

/* IO VTABLEs */
/* Legend:
    _s: This function operates on a Parrot STRING*
    _b: This function operates on a raw char* buffer (Possibly from ByteBuffer)
*/

typedef union _io_vtable_extra_data {
    INTVAL i;
    void * v;
} io_vtable_extra_data;

typedef STRING * (*io_vtable_read_s)    (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, size_t length);
typedef INTVAL   (*io_vtable_read_b)    (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, ARGOUT(char * buffer), size_t length);
typedef INTVAL   (*io_vtable_write_s)   (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, ARGIN(STRING * s));
typedef INTVAL   (*io_vtable_write_b    (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, ARGIN(char * buffer), size_t length);
typedef STRING * (*io_vtable_readline_s)(PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer);
typedef STRING * (*io_vtable_readall_s) (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer);
typedef INTVAL   (*io_vtable_flush)     (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer);
typedef INTVAL   (*io_vtable_is_eof)    (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, io_vtable_extra_data data);
typedef PIOOFF_T (*io_vtable_tell)      (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, io_vtable_extra_data data);
typedef INTVAL   (*io_vtable_seek)      (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, PIOOFF_T loc);
typedef STRING * (*io_vtable_peek_s)    (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer);
typedef INTVAL   (*io_vtable_open)      (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, ARGIN(STRING *path), ARGIN(STRING *mode), io_vtable_extra_data data);
typedef INTVAL   (*io_vtable_is_open)   (PARROT_INTERP, PIOHANDLE h, io_vtable_extra_data data);
typedef INTVAL   (*io_vtable_close)     (PARROT_INTERP, PIOHANDLE h, Parrot_io_buffer buffer, INTVAL autoflush);

typedef struct _io_vtable {
    io_vtable_read_s read_s;
    io_vtable_read_b read_b;
    io_vtable_write_s write_s;
    io_vtable_write_b write_b;
    io_vtable_readline_s readline_s;
    io_vtable_readall_s readall_s;
    io_vtable_flush flush;
    io_vtable_is_eof is_eof;
    io_vtable_open open;
    io_vtable_is_open is_open;
    io_vtable_close close;
} Parrot_io_vtable;

#define NUMBER_IO_VTABLES 5
#define IO_VTABLE_FILEHANDLE        0
#define IO_VTABLE_PIPE              1
#define IO_VTABLE_SOCKET            2
#define IO_VTABLE_STRINGHANDLE      3
#define IO_VTABLE_USER              4
extern Parrot_io_vtable io_vtables[NUMBER_IO_VTABLES];

#endif /* PARROT_IO_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
