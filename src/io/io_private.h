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

/* Minimum size to use when allocating a new empty STRING buffer */
#define PIO_STRING_BUFFER_MINSIZE 32

#define PIO_BUFFER_MIN_SIZE       2048  /* Smallest size for a block buffer */
#define PIO_BUFFER_LINEBUF_SIZE   256   /* Smallest size for a line buffer */

struct _ParrotIOData {
    PMC ** table;           /* Standard IO Streams (STDIN, STDOUT, STDERR) */
    INTVAL num_vtables;     /* Number of vtables */
    IO_VTABLE * vtables;    /* Array of VTABLES */
};

/* redefine PIO_STD* for internal use */
#define _PIO_STDIN(i)   ((i)->piodata->table[PIO_STDIN_FILENO])
#define _PIO_STDOUT(i)  ((i)->piodata->table[PIO_STDOUT_FILENO])
#define _PIO_STDERR(i)  ((i)->piodata->table[PIO_STDERR_FILENO])

#define IO_VTABLE_UNIMPLEMENTED(i, v, s) Parrot_ex_throw_from_c_args((i), NULL, EXCEPTION_PIO_ERROR, "Method '%s' not implemented for type %s", s, v->name)



/* HEADERIZER BEGIN: src/io/utilities.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_io_parse_open_flags(PARROT_INTERP,
    ARGIN(const STRING *mode_str))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STR_VTABLE * io_get_encoding(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_get_new_empty_string(PARROT_INTERP,
    ARGIN_NULLOK(STR_VTABLE *encoding),
    size_t char_length,
    size_t byte_length)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * io_get_new_filehandle(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC * io_get_new_socket(PARROT_INTERP)
        __attribute__nonnull__(1);

void io_read_chars_append_string(PARROT_INTERP,
    ARGMOD(STRING * s),
    ARGMOD(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    ARGMOD(IO_BUFFER *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(* s)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_read_encoded_string(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    ARGMOD(IO_BUFFER *buffer),
    ARGIN_NULLOK(STR_VTABLE *encoding),
    size_t char_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_readline_encoded_string(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    ARGMOD(IO_BUFFER *buffer),
    ARGIN(STR_VTABLE *encoding),
    INTVAL rs)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

IO_BUFFER * io_verify_has_read_buffer(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void io_verify_is_open_for(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_verify_string_encoding(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN(IO_VTABLE *vtable),
    ARGIN(STRING *s),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

#define ASSERT_ARGS_Parrot_io_parse_open_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mode_str))
#define ASSERT_ARGS_io_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_io_get_new_empty_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_io_get_new_filehandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_io_get_new_socket __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_io_read_chars_append_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_read_encoded_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_readline_encoded_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_io_verify_has_read_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_io_verify_is_open_for __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_io_verify_string_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/utilities.c */

/* HEADERIZER BEGIN: src/io/filehandle.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PIOOFF_T io_filehandle_get_file_position(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PIOHANDLE io_filehandle_get_os_handle(PARROT_INTERP,
    ARGIN(const PMC *filehandle))
        __attribute__nonnull__(2);

void io_filehandle_set_file_position(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOOFF_T file_pos)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void io_filehandle_set_os_handle(PARROT_INTERP,
    ARGMOD(PMC *filehandle),
    PIOHANDLE file_descriptor)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*filehandle);

void io_filehandle_setup_vtable(PARROT_INTERP,
    IO_VTABLE *vtable,
    INTVAL idx)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_io_filehandle_get_file_position \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_io_filehandle_get_os_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_io_filehandle_set_file_position \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_io_filehandle_set_os_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(filehandle))
#define ASSERT_ARGS_io_filehandle_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/filehandle.c */

/* HEADERIZER BEGIN: src/io/pipe.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_pipe_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL idx)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_io_pipe_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/pipe.c */

/* HEADERIZER BEGIN: src/io/socket.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_socket_setup_vtable(PARROT_INTERP,
    ARGIN_NULLOK(IO_VTABLE *vtable),
    INTVAL idx)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_io_socket_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/socket.c */

/* HEADERIZER BEGIN: src/io/stringhandle.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_stringhandle_setup_vtable(PARROT_INTERP,
    IO_VTABLE *vtable,
    INTVAL idx)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_io_stringhandle_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/stringhandle.c */

/* HEADERIZER BEGIN: src/io/userhandle.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_userhandle_setup_vtable(PARROT_INTERP,
    IO_VTABLE *vtable,
    INTVAL idx)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_io_userhandle_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/userhandle.c */

#endif /* PARROT_IO_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
