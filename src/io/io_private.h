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

/* BASIC IO SYSTEM LAYOUT

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

src/io/utilities.c:
    Internal, core utility routines. These routines are general shared helper
    routines for the IO subsystem and are not necessarily specific to
    buffering or any single PMC type.

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
#define PIO_BF_MMAP     00000010        /* Buffer mmap()ed              */


#define PIO_UNBOUND     (size_t)-1

struct _ParrotIOData {
    PMC ** table;
};

/* redefine PIO_STD* for internal use */
#define _PIO_STDIN(i)   ((i)->piodata->table[PIO_STDIN_FILENO])
#define _PIO_STDOUT(i)  ((i)->piodata->table[PIO_STDOUT_FILENO])
#define _PIO_STDERR(i)  ((i)->piodata->table[PIO_STDERR_FILENO])

#define IO_VTABLE_UNIMPLEMENTED(i, v, s) Parrot_ex_throw_from_c_args((i), NULL, EXCEPTION_PIO_ERROR, "Method '%s' not implemented for type %s", s, v->name)

#endif /* PARROT_IO_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
