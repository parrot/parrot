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

src/pmc/handle.pmc
src/pmc/filehandle.pmc
src/pmc/stringhandle.pmc
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

src/io/userhandle.c:
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

    IO PMCs         (src/pmc/XXXhandle.pmc)
        |
        v
    IO API          (src/io/api.c)
        |
        v
    Utilities       (src/io/utilities.c)
        |
        v
    Buffers         (src/io/buffer.c)
        |
        v
    IO VTABLES      (src/io/filehandle.c, pipe.c, stringhandle.c, socket.c)
        |
        v
    Low-Level Platform
    Interface       (src/platform/XXX/file.c, io.c, socket.c)

*/

#ifndef PARROT_IO_PRIVATE_H_GUARD
#define PARROT_IO_PRIVATE_H_GUARD

#define PARROT_IN_IO 1

#include <parrot/io.h>

/* Minimum size to use when allocating a new empty STRING buffer */
#define PIO_STRING_BUFFER_MINSIZE 32

#define PIO_BUFFER_MIN_SIZE       2048  /* Smallest size for a block buffer */
#define PIO_BUFFER_LINEBUF_SIZE   256   /* Smallest size for a line buffer  */

/* Interp-level IO system data */
struct _ParrotIOData {
    PMC ** table;               /* Standard IO Streams (STDIN, STDOUT, STDERR) */
    INTVAL num_vtables;         /* Number of vtables */
    const IO_VTABLE * vtables;  /* Array of VTABLES */
};

/* redefine PIO_STD* for internal use */
#define _PIO_STDIN(i)   ((i)->piodata->table[PIO_STDIN_FILENO])
#define _PIO_STDOUT(i)  ((i)->piodata->table[PIO_STDOUT_FILENO])
#define _PIO_STDERR(i)  ((i)->piodata->table[PIO_STDERR_FILENO])

/* Throw an exception if this vtable is not implemented. */
#define IO_VTABLE_UNIMPLEMENTED(i, v, s) do { \
        Parrot_ex_throw_from_c_args((i), NULL, EXCEPTION_PIO_ERROR, \
            "Method '%s' not implemented for type %s", (s), (v)->name); \
    } while (0)

/* Return value from IO_VTABLE->total_size if the total size of the stream
   cannot be determined ahead of time */
#define PIO_UNKNOWN_SIZE (size_t)-1

/* Buffer Macros */
#define BUFFER_IS_EMPTY(b) ((b)->buffer_start >= (b)->buffer_end)
#define BUFFER_IS_FULL(b)  ((size_t)((b)->buffer_end - (b)->buffer_start) == (b)->buffer_size)
#define BUFFER_USED_SIZE(b) ((size_t)((b)->buffer_end - (b)->buffer_start))
#define BUFFER_FREE_HEAD_SPACE(b) ((b)->buffer_start - (b)->buffer_ptr)
#define BUFFER_FREE_END_SPACE(b) ((b)->buffer_size - ((b)->buffer_end - (b)->buffer_ptr))
#define BUFFER_CAN_BE_NORMALIZED(b) (((size_t)BUFFER_FREE_HEAD_SPACE(b)) > ((size_t)BUFFER_USED_SIZE(b)))

#define BUFFER_ASSERT_SANITY(b) do { \
        PARROT_ASSERT((b)->buffer_ptr <= (b)->buffer_start); \
        PARROT_ASSERT((b)->buffer_start <= (b)->buffer_end); \
        PARROT_ASSERT((b)->buffer_end <= (b)->buffer_ptr + (b)->buffer_size); \
        PARROT_ASSERT(BUFFER_FREE_HEAD_SPACE(b) + BUFFER_USED_SIZE(b) + BUFFER_FREE_END_SPACE(b) == (b)->buffer_size); \
    } while (0);

#define BUFFER_DBG_PRINT(b) do { \
        fprintf(stderr, "\t%x [%x - %x]\n", (b)->buffer_ptr, (b)->buffer_start, (b)->buffer_end); \
        fprintf(stderr, "\t\t(%d + %d + %d)\n", BUFFER_FREE_HEAD_SPACE(b), BUFFER_USED_SIZE(b), BUFFER_FREE_END_SPACE(b)); \
        fprintf(stderr, "\t\t\t = %d\n", BUFFER_FREE_HEAD_SPACE(b) + BUFFER_USED_SIZE(b) + BUFFER_FREE_END_SPACE(b)); \
    } while (0);

/* Get an editable version of the IO_VTABLE structure, typically used during
   vtable initialization. */
#define IO_EDITABLE_IO_VTABLE(i, idx) ((IO_VTABLE *)(void *)(&((i)->piodata->vtables[(idx)])))


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
const STR_VTABLE * io_get_encoding(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_get_new_empty_string(PARROT_INTERP,
    ARGIN_NULLOK(const STR_VTABLE *encoding),
    INTVAL char_length,
    INTVAL byte_length)
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
    ARGIN(const IO_VTABLE *vtable),
    ARGMOD_NULLOK(IO_BUFFER *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* s)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_read_encoded_string(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGMOD(IO_BUFFER *buffer),
    ARGIN_NULLOK(const STR_VTABLE *encoding),
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
    ARGIN(const IO_VTABLE *vtable),
    ARGMOD(IO_BUFFER *buffer),
    ARGIN_NULLOK(const STR_VTABLE *encoding),
    ARGIN(STRING * rs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(6)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

void io_sync_buffers_for_read(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGMOD_NULLOK(IO_BUFFER *read_buffer),
    ARGMOD_NULLOK(IO_BUFFER * write_buffer))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*read_buffer)
        FUNC_MODIFIES(* write_buffer);

void io_sync_buffers_for_write(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    ARGMOD_NULLOK(IO_BUFFER *read_buffer),
    ARGMOD_NULLOK(IO_BUFFER * write_buffer))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*read_buffer)
        FUNC_MODIFIES(* write_buffer);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
IO_BUFFER * io_verify_has_read_buffer(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void io_verify_is_open_for(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * io_verify_string_encoding(PARROT_INTERP,
    ARGIN(PMC *handle),
    ARGIN(const IO_VTABLE *vtable),
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
    , PARROT_ASSERT_ARG(vtable))
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
    , PARROT_ASSERT_ARG(rs))
#define ASSERT_ARGS_io_sync_buffers_for_read __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
#define ASSERT_ARGS_io_sync_buffers_for_write __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(vtable))
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

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const IO_VTABLE * io_filehandle_convert_to_pipe(PARROT_INTERP,
    ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

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
    ARGMOD_NULLOK(IO_VTABLE *vtable),
    INTVAL idx)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*vtable);

#define ASSERT_ARGS_io_filehandle_convert_to_pipe __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
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

void io_pipe_setup_vtable(PARROT_INTERP,
    ARGMOD_NULLOK(IO_VTABLE *vtable),
    INTVAL idx)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*vtable);

#define ASSERT_ARGS_io_pipe_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/pipe.c */

/* HEADERIZER BEGIN: src/io/socket.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_socket_setup_vtable(PARROT_INTERP,
    ARGMOD_NULLOK(IO_VTABLE *vtable),
    INTVAL idx)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*vtable);

#define ASSERT_ARGS_io_socket_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/socket.c */

/* HEADERIZER BEGIN: src/io/stringhandle.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_stringhandle_setup_vtable(PARROT_INTERP,
    ARGMOD_NULLOK(IO_VTABLE *vtable),
    INTVAL idx)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*vtable);

#define ASSERT_ARGS_io_stringhandle_setup_vtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/io/stringhandle.c */

/* HEADERIZER BEGIN: src/io/userhandle.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void io_userhandle_setup_vtable(PARROT_INTERP,
    ARGMOD_NULLOK(IO_VTABLE *vtable),
    INTVAL idx)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*vtable);

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
