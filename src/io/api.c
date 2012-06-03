/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/io/api.c - Parrot I/O API

=head1 DESCRIPTION

The Parrot I/O subsystem provides the core I/O functionality for all parts of
Parrot. This file implements the public interface to the I/O subsystem.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "io_private.h"
#include "api.str"
#include "pmc/pmc_filehandle.h"
#include "pmc/pmc_stringhandle.h"
#include "pmc/pmc_socket.h"
#include "pmc/pmc_sockaddr.h"
#include "pmc/pmc_bytebuffer.h"

#include <stdarg.h>

PIOOFF_T piooffsetzero;

/* HEADERIZER HFILE: include/parrot/io.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static const STR_VTABLE * get_encoding(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void Parrot_io_init(PARROT_INTERP)>

Sets up the interpreter's I/O storage and creates the C<STD*> handles.

Called when creating an interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_io_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_init)
    /* Has interp been initialized already? */
    if (interp->piodata) {
        /* memsub system is up and running: */
        /* Init IO stacks and handles for interp instance.  */
        PIOHANDLE os_handle;
        PMC *handle;

        io_setup_vtables(interp);

        os_handle = Parrot_io_internal_std_os_handle(interp, PIO_STDIN_FILENO);
        handle    = Parrot_io_fdopen_flags(interp, PMCNULL, os_handle, PIO_F_READ);
        Parrot_io_buffer_add_to_handle(interp, handle, IO_PTR_IDX_READ_BUFFER, BUFFER_SIZE_ANY, PIO_BF_BLKBUF);
        _PIO_STDIN(interp) = handle;

        os_handle = Parrot_io_internal_std_os_handle(interp, PIO_STDOUT_FILENO);
        handle    = Parrot_io_fdopen_flags(interp, PMCNULL, os_handle, PIO_F_WRITE);
        Parrot_io_buffer_add_to_handle(interp, handle, IO_PTR_IDX_WRITE_BUFFER, BUFFER_SIZE_ANY, PIO_BF_LINEBUF);
        _PIO_STDOUT(interp) = handle;

        os_handle           = Parrot_io_internal_std_os_handle(interp, PIO_STDERR_FILENO);
        _PIO_STDERR(interp) = Parrot_io_fdopen_flags(interp, PMCNULL,
                                os_handle, PIO_F_WRITE);

        if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
            Parrot_io_eprintf(NULL, "I/O system initialized.\n");
        }

        return;
    }

    interp->piodata = mem_gc_allocate_zeroed_typed(interp, ParrotIOData);
    if (interp->piodata == NULL)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "PIO alloc piodata failure.");
    interp->piodata->table         =
            mem_gc_allocate_n_zeroed_typed(interp, PIO_NR_OPEN, PMC *);

    if (!interp->piodata->table)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "PIO alloc table failure.");
}

void
io_setup_vtables(PARROT_INTERP)
{
    ASSERT_ARGS(io_setup_vtables);
    const int number_of_vtables = 5;
    interp->piodata->vtables = mem_gc_allocate_n_zeroed_typed(interp, number_of_vtables, IO_VTABLE);
    interp->piodata->num_vtables = number_of_vtables;
    io_filehandle_setup_vtable(interp, NULL, IO_VTABLE_FILEHANDLE);
    io_socket_setup_vtable(interp, NULL, IO_VTABLE_SOCKET);
    io_pipe_setup_vtable(interp, NULL, IO_VTABLE_PIPE);
    io_stringhandle_setup_vtable(interp, NULL, IO_VTABLE_STRINGHANDLE);
    io_userhandle_setup_vtable(interp, NULL, IO_VTABLE_USER);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
IO_VTABLE *
Parrot_io_allocate_new_vtable(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(Parrot_io_allocate_new_vtable)
    const int number_of_vtables = interp->piodata->num_vtables;
    IO_VTABLE *vtable;
    interp->piodata->vtables = mem_gc_realloc_n_typed(interp,
                                interp->piodata->vtables,
                                number_of_vtables + 1, IO_VTABLE);
    vtable = &(interp->piodata->vtables[number_of_vtables]);
    vtable->name = name;
    vtable->number = number_of_vtables;
    interp->piodata->num_vtables++;
    return vtable;
}

PARROT_WARN_UNUSED_RESULT
IO_VTABLE *
Parrot_io_get_vtable(PARROT_INTERP, INTVAL idx, ARGIN_NULLOK(const char * name))
{
    ASSERT_ARGS(Parrot_io_get_vtable)
    INTVAL i;
    if (idx >= interp->piodata->num_vtables)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot get IO VTABLE %d", idx);
    if (idx >= 0)
        return &(interp->piodata->vtables[idx]);
    if (!name)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot get IO VTABLE with no index and no name");

    for (i = 0; i < interp->piodata->num_vtables; i++) {
        if (!strcmp(name, interp->piodata->vtables[i].name))
            return &(interp->piodata->vtables[i]);
    }
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot get IO VTABLE %s", name);
    return NULL;
}

/*

=item C<void Parrot_io_finish(PARROT_INTERP)>

Closes the interpreter's IO resources.  Called during its interpreter
destruction.

=cut

*/

PARROT_EXPORT
void
Parrot_io_finish(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_finish)
    /*
     * TODO free IO of std-handles
     */
    Parrot_io_flush(interp, _PIO_STDOUT(interp));
    mem_gc_free(interp, interp->piodata->table);
    interp->piodata->table = NULL;
    mem_gc_free(interp, interp->piodata);
    interp->piodata = NULL;

}


/*

=item C<void Parrot_IOData_mark(PARROT_INTERP, ParrotIOData *piodata)>

Called from C<Parrot_gc_trace_root()> to mark the IO data live.

=cut

*/

PARROT_EXPORT
void
Parrot_io_mark(PARROT_INTERP, ARGIN(ParrotIOData *piodata))
{
    ASSERT_ARGS(Parrot_io_mark)
    INTVAL i;
    PMC ** const table = piodata->table;

    /* this was i < PIO_NR_OPEN, but only standard handles 0..2 need
     * to be kept alive AFAIK -leo
     */
    for (i = 0; i < 3; ++i) {
        Parrot_gc_mark_PMC_alive(interp, table[i]);
    }
}


/*

=head2 Generic I/O interface

=over 4

*/

/*

=item C<PMC * Parrot_io_stdhandle(PARROT_INTERP, INTVAL fileno, PMC *newhandle)>

Get the current standard IO object with the specified filenumber. If the
C<newhandle> parameter is non-null, set that to be the new standard IO object
of that number. Returns the old IO object before the new one is set, so it
can be cached for later.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_io_stdhandle(PARROT_INTERP, INTVAL fileno, ARGIN_NULLOK(PMC *newhandle))
{
    ASSERT_ARGS(Parrot_io_stdhandle)
    PMC * result = PMCNULL;
    if (fileno == PIO_STDIN_FILENO || fileno == PIO_STDOUT_FILENO ||
            fileno == PIO_STDERR_FILENO) {
        result = interp->piodata->table[fileno];
        if (! PMC_IS_NULL(newhandle))
            interp->piodata->table[fileno] = newhandle;
    }
    return result;
}


/*

=item C<PMC * Parrot_io_open_handle(PARROT_INTERP, PMC *pmc, STRING *path,
STRING *mode)>

Return an open filehandle for a given string path and flags. Defaults to
creating a new FileHandle PMC. If a PMC object is passed in, it uses that
object instead of creating a new FileHandle.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_open_handle(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(STRING *path),
        ARGIN(STRING *mode))
{
    ASSERT_ARGS(Parrot_io_open_handle)
    return Parrot_io_open(interp, pmc, path, mode);
}


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_open(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(STRING *path),
        ARGIN(STRING *mode))
{
    ASSERT_ARGS(Parrot_io_open)
    PMC *handle;

    if (STRING_IS_NULL(path))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                        "Cannot open filehandle, no path");

    if (PMC_IS_NULL(pmc))
        handle = io_get_new_filehandle(interp);
    else
        handle = pmc;

    if (STRING_IS_NULL(mode))
        mode = CONST_STRING(interp, "r");

    {
        const INTVAL flags = Parrot_io_parse_open_flags(interp, mode);
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const read_buffer = IO_GET_READ_BUFFER(interp, handle);
        INTVAL status = vtable->open(interp, handle, path, flags, mode);

        if (!status)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Unable to open %s from path '%Ss'", vtable->name, path);

        /* If this type uses buffers by default, set them up. */
        if (vtable->flags & PIO_VF_DEFAULT_BUFFERS && flags & PIO_F_READ)
            Parrot_io_buffer_add_to_handle(interp, handle, IO_PTR_IDX_READ_BUFFER, BUFFER_SIZE_ANY, PIO_BF_BLKBUF);
        if (vtable->flags & PIO_VF_DEFAULT_BUFFERS && flags & PIO_F_WRITE)
            Parrot_io_buffer_add_to_handle(interp, handle, IO_PTR_IDX_WRITE_BUFFER, BUFFER_SIZE_ANY, PIO_BF_BLKBUF);
    }

    return handle;
}

/*

=item C<INTVAL Parrot_io_socket(PARROT_INTERP, PMC *socket, INTVAL fam, INTVAL
type, INTVAL proto)>

Creates and returns a socket using the specified address family, socket type,
and protocol number. Check the returned PMC with a boolean test to see whether
the socket was successfully created.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
INTVAL
Parrot_io_socket(PARROT_INTERP, ARGMOD_NULLOK(PMC *socket), INTVAL fam,
            INTVAL type, INTVAL proto)
{
    ASSERT_ARGS(Parrot_io_socket)
    PMC       *new_socket;
    PIOHANDLE  os_handle;

    if (PMC_IS_NULL(socket))
        new_socket = io_get_new_socket(interp);
    else
        new_socket = socket;

    os_handle = Parrot_io_internal_socket(interp, fam, type, proto);

    SETATTR_Socket_os_handle(interp, new_socket, os_handle);
    SETATTR_Socket_family(interp, new_socket, fam);
    SETATTR_Socket_type(interp, new_socket, type);
    SETATTR_Socket_protocol(interp, new_socket, proto);

    return 0;
}

/*

=item C<PMC * Parrot_io_fdopen(PARROT_INTERP, PMC *pmc, PIOHANDLE fd, STRING
*sflags)>

Creates and returns a C<FileHandle> PMC for a given set of flags on an
existing, open file descriptor.

This is used particularly to initialize the C<STD*> IO handles onto the
OS IO handles (0, 1, 2).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_fdopen(PARROT_INTERP, ARGIN(PMC *pmc), PIOHANDLE fd, ARGIN(STRING *sflags))
{
    ASSERT_ARGS(Parrot_io_fdopen)
    const INTVAL flags = Parrot_io_parse_open_flags(interp, sflags);
    return Parrot_io_fdopen_flags(interp, pmc, fd, flags);
}


/*

=item C<PMC * Parrot_io_fdopen_flags(PARROT_INTERP, PMC *filehandle, PIOHANDLE
fd, INTVAL flags)>

Creates and returns a C<FileHandle> PMC for a given set of flags on an
existing, open file descriptor.

This is used particularly to initialize the C<STD*> IO handles onto the
OS IO handles (0, 1, 2).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_fdopen_flags(PARROT_INTERP, ARGMOD(PMC *filehandle), PIOHANDLE fd,
        INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_fdopen_flags)

    if (!flags)
        return PMCNULL;

    if (Parrot_io_internal_is_tty(interp, fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    if (PMC_IS_NULL(filehandle))
        filehandle = io_get_new_filehandle(interp);

    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, filehandle);
        if (vtable->number != IO_VTABLE_FILEHANDLE)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Cannot set an OS file descriptor to a %s PMC", vtable->name);
        vtable->set_flags(interp, filehandle, flags);
        io_filehandle_set_os_handle(interp, filehandle, fd);
    }

    return filehandle;
}

/*

=item C<void Parrot_io_socket_initialize(PARROT_INTERP, PMC *socket)>

Initialize a Socket PMC

=cut

*/

PARROT_EXPORT
void
Parrot_io_socket_initialize(SHIM_INTERP, ARGMOD(PMC *socket))
{
    ASSERT_ARGS(Parrot_io_socket_initialize)
    PARROT_SOCKET(socket)->os_handle = (PIOHANDLE)PIO_INVALID_HANDLE;
}


/*

=item C<INTVAL Parrot_io_close_handle(PARROT_INTERP, PMC *pmc)>

Closes the Handle object.

If it is a C<StringHandle> reset some core data, but don't delete the
string data, as it may be wanted later (for capturing the results).

If it is a C<FileHandle> call the C<close> method on the
filehandle-PMC object.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_close_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_close_handle)
    return Parrot_io_close(interp, pmc, -1);
}

PARROT_EXPORT
INTVAL
Parrot_io_close(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL autoflush)
{
    ASSERT_ARGS(Parrot_io_close)
    if (PMC_IS_NULL(handle))
        return 0;
    else {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const write_buffer = IO_GET_WRITE_BUFFER(interp, handle);
        if (write_buffer)
            Parrot_io_buffer_flush(interp, write_buffer, handle, vtable);

        if (autoflush == -1)
            autoflush == (vtable->flags && PIO_VF_FLUSH_ON_CLOSE) ? 1 : 0;
        if (autoflush == 1)
            vtable->flush(interp, handle);
        return vtable->close(interp, handle);
    }
}

/*

=item C<INTVAL Parrot_io_is_closed(PARROT_INTERP, PMC *pmc)>

Test whether a filehandle is closed. Calls the C<is_closed> method of the
filehandle PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_closed(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_is_closed)

    if (PMC_IS_NULL(pmc))
        return 1;

    else {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, pmc);
        return !vtable->is_open(interp, pmc);
    }
}

/*

=item C<void Parrot_io_flush_handle(PARROT_INTERP, PMC *pmc)>

Flushes the C<ParrotIO> PMC C<*pmc>. Calls the C<flush> method on the
filehandle PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_io_flush_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_flush_handle)
    Parrot_io_flush(interp, pmc);
}

PARROT_EXPORT
size_t
Parrot_io_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_flush)

    if (PMC_IS_NULL(handle))
        return 0;

    else {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const write_buffer = IO_GET_WRITE_BUFFER(interp, handle);
        if (write_buffer)
            Parrot_io_buffer_flush(interp, write_buffer, handle, vtable);
        return vtable->flush(interp, handle);
    }
}

/*

=item C<STRING * Parrot_io_reads(PARROT_INTERP, PMC *pmc, size_t length)>

Return a new C<STRING*> holding up to C<len> bytes read from the handle
PMC. Calls the C<read> method on the filehandle PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_reads(PARROT_INTERP, ARGMOD(PMC *pmc), size_t length)
{
    ASSERT_ARGS(Parrot_io_reads)
    return Parrot_io_read_s(interp, pmc, length);
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_read_s(PARROT_INTERP, ARGMOD(PMC *handle), size_t length)
{
    ASSERT_ARGS(Parrot_io_read_s)

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read from null or invalid PMC");

    if (!length)
        return STRINGNULL;

    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * read_buffer = IO_GET_READ_BUFFER(interp, handle);
        const STR_VTABLE * encoding = vtable->get_encoding(interp, handle);

        if (read_buffer == NULL)
            read_buffer = io_verify_has_read_buffer(interp, handle, vtable, BUFFER_SIZE_ANY);
        io_verify_is_open_for(interp, handle, vtable, PIO_F_READ);

        return io_read_encoded_string(interp, handle, vtable, read_buffer, encoding, length);
    }
}

/*

=item C<STRING * Parrot_io_recv_handle(PARROT_INTERP, PMC *pmc, size_t len)>

Receives a message from the connected socket C<*pmc> in C<*buf>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_recv_handle(PARROT_INTERP, ARGMOD(PMC *pmc), size_t len)
{
    ASSERT_ARGS(Parrot_io_recv_handle)
    return Parrot_io_read_s(interp, pmc, len);
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_readall_s(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_readall_s)
    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read from null or invalid PMC");
    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);

        const STR_VTABLE * const encoding = io_get_encoding(interp, handle, vtable, PIO_F_READ);
        size_t total_size = vtable->total_size(interp, handle);
        if (total_size == 0)
            return Parrot_str_new_init(interp, "", 0, encoding, 0);
        if (total_size == PIO_UNKNOWN_SIZE) {
            IO_BUFFER * const read_buffer = io_verify_has_read_buffer(interp, handle, vtable, BUFFER_FLAGS_ANY);
            size_t available_bytes = Parrot_io_buffer_fill(interp, read_buffer, handle, vtable);
            STRING * const s = io_get_new_empty_string(interp, encoding, -1, PIO_STRING_BUFFER_MINSIZE);
            while (available_bytes > 0) {
                io_read_chars_append_string(interp, s, handle, vtable, read_buffer, available_bytes);
                available_bytes = Parrot_io_buffer_fill(interp, read_buffer, handle, vtable);
            }
            return s;
        } else {
            IO_BUFFER * const read_buffer = IO_GET_READ_BUFFER(interp, handle);
            STRING * const s = io_get_new_empty_string(interp, encoding, -1, total_size);
            io_read_chars_append_string(interp, s, handle, vtable, read_buffer, total_size);
            return s;
        }
    }
}

/*

=item C<PMC * Parrot_io_read_byte_buffer_pmc(PARROT_INTERP, PMC *handle, PMC
*buffer, size_t byte_length)>

Read C<length> bytes from the C<handle> into the C<buffer> (ByteBuffer) PMC.

=item C<INTVAL Parrot_io_write_byte_buffer_pmc(PARROT_INTERP, PMC * handle, PMC
*buffer, size_t byte_length)>

Write C<length> bytes (or the total length of C<buffer>, whichever is smaller)
from C<buffer> to the C<handle>

=cut

*/


PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_read_byte_buffer_pmc(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGMOD_NULLOK(PMC *buffer), size_t byte_length)
{
    ASSERT_ARGS(Parrot_io_read_byte_buffer_pmc)

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read bytes from a null or invalid PMC");

    if (PMC_IS_NULL(buffer))
        buffer = Parrot_pmc_new_init_int(interp, enum_class_ByteBuffer, byte_length);
    else
        VTABLE_set_integer_native(interp, buffer, byte_length);

    if (!byte_length)
        return buffer;

    {
        char * content = VTABLE_get_pointer(interp, buffer);
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const read_buffer = IO_GET_READ_BUFFER(interp, handle);
        size_t bytes_read;

        io_verify_is_open_for(interp, handle, vtable, PIO_F_READ);

        bytes_read = Parrot_io_buffer_read_b(interp, read_buffer, handle, vtable, content, byte_length);
        if (bytes_read != byte_length)
            VTABLE_set_integer_native(interp, buffer, byte_length);
        return buffer;
    }
}

INTVAL
Parrot_io_write_byte_buffer_pmc(PARROT_INTERP, ARGMOD(PMC * handle),
        ARGMOD(PMC *buffer), size_t byte_length)
{
    ASSERT_ARGS(Parrot_io_write_byte_buffer_pmc)

    if (PMC_IS_NULL(buffer))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read bytes from a null or invalid ByteBuffer");

    if (!byte_length)
        return 0;

    {
        char *content = (char *)VTABLE_get_pointer(interp, buffer);
        size_t real_length = (size_t)VTABLE_elements(interp, buffer);
        if (real_length < byte_length)
            byte_length = real_length;

        return Parrot_io_write_b(interp, handle, content, byte_length);
    }
}

/*

=item C<STRING * Parrot_io_readline(PARROT_INTERP, PMC *handle)>

Return a new C<STRING*> holding the next line read from the file. Calls
the C<readline> method of the filehandle PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_readline(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_readline)
    return Parrot_io_readline_s(interp, handle, '\n');
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_readline_s(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL terminator)
{
    ASSERT_ARGS(Parrot_io_readline_s)

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read bytes from a null or invalid PMC");

    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const read_buffer = IO_GET_READ_BUFFER(interp, handle);
        size_t bytes_read;
        STRING *result;

        io_verify_is_open_for(interp, handle, vtable, PIO_F_READ);
        if (read_buffer == NULL)
            io_verify_has_read_buffer(interp, handle, vtable, BUFFER_SIZE_ANY);
        return io_readline_encoded_string(interp, handle, vtable, read_buffer, NULL, terminator);
    }
}

/*

=item C<INTVAL Parrot_io_write_handle(PARROT_INTERP, PMC *pmc, const void
*buffer, size_t length)>

Writes C<len> bytes from C<*buffer> to C<*pmc>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(const void *buffer),
        size_t byte_length)
{
    ASSERT_ARGS(Parrot_io_write_b)

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read bytes from a null or invalid PMC");

    if (!byte_length)
        return 0;

    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const write_buffer = IO_GET_WRITE_BUFFER(interp, handle);

        io_verify_is_open_for(interp, handle, vtable, PIO_F_WRITE);
        return Parrot_io_buffer_write_b(interp, write_buffer, handle, vtable,
                                        (char *)buffer, byte_length);
    }
}


PARROT_EXPORT
INTVAL
Parrot_io_write_s(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *s))
{
    ASSERT_ARGS(Parrot_io_write_s)

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to write a string to a null or invalid PMC");

    if (STRING_IS_NULL(s) || STRING_length(s) == 0)
        return 0;

    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * const write_buffer = IO_GET_WRITE_BUFFER(interp, handle);
        STRING *out_s;

        io_verify_is_open_for(interp, handle, vtable, PIO_F_WRITE);
        out_s = io_verify_string_encoding(interp, handle, vtable, s, PIO_F_WRITE);

        return Parrot_io_buffer_write_b(interp, write_buffer, handle, vtable, out_s->strstart, s->bufused);
    }
}

/*

=item C<PIOOFF_T Parrot_io_seek(PARROT_INTERP, PMC *handle, PIOOFF_T offset,
INTVAL w)>

Moves the read/write position of C<*pmc> to offset C<bytes> from the
position indicated by C<w>. Typically C<w> will be C<0> for the start of
the file, C<1> for the current position, and C<2> for the end.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_seek_handle(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL w)
{
    ASSERT_ARGS(Parrot_io_seek_handle)
    return Parrot_io_seek(interp, handle, offset, w);
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL w)
{
    ASSERT_ARGS(Parrot_io_seek)
    if (Parrot_io_is_closed(interp, handle))
        return -1;

    // TODO: This
    return Parrot_io_seek_buffer(interp, handle, offset, w);
}

/*

=item C<PIOOFF_T Parrot_io_tell(PARROT_INTERP, PMC *handle)>

Returns the current read/write position of C<*pmc>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_tell_handle(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_tell_handle)
    return Parrot_io_tell(interp, handle);
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_tell)
    if (Parrot_io_is_closed(interp, handle))
        return -1;

    // TODO: This
    //return Parrot_io_get_file_position(interp, handle);
    return 0;
    /* return PIO_TELL(interp, os_handle); */
}

/*

=item C<STRING * Parrot_io_peek(PARROT_INTERP, PMC *handle)>

Retrieve the next character in the stream without modifying the stream. Calls
the platform-specific implementation of 'peek'.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_peek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_peek)

    if (PMC_IS_NULL(handle) || Parrot_io_is_closed(interp, handle))
        return STRINGNULL;
    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        IO_BUFFER * read_buffer = IO_GET_READ_BUFFER(interp, handle);
        INTVAL c;

        io_verify_has_read_buffer(interp, handle, vtable, BUFFER_SIZE_ANY);

        c = Parrot_io_buffer_peek(interp, read_buffer, handle, vtable);

        if (c == -1)
            return STRINGNULL;
        else
            return Parrot_str_chr(interp, c);
    }
}

/*

=item C<INTVAL Parrot_io_eof(PARROT_INTERP, PMC *handle)>

Returns a boolean value indication whether C<*pmc>'s C<EOF> flag is set,
indicating that an attempt was made to read past the end of the underlying
filehandle.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_eof)
    INTVAL flags, result;

    /* io could be null here, but rather than return a negative error
     * we just fake EOF since eof test is usually in a boolean context.
     */
    if (PMC_IS_NULL(handle))
        return 1;
    if (Parrot_io_is_closed(interp, handle))
        return 1;
    return IO_GET_VTABLE(interp, handle)->is_eof(interp, handle);
}

/*

=item C<INTVAL Parrot_io_puts(PARROT_INTERP, PMC *pmc, const char *s)>

Writes C<*s> to C<*pmc>. C string version.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_puts(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const char *s))
{
    ASSERT_ARGS(Parrot_io_puts)
    return Parrot_io_write_b(interp, pmc, s, strlen(s));
}

/*

=item C<INTVAL Parrot_io_putps(PARROT_INTERP, PMC *pmc, STRING *s)>

Writes C<*s> to C<*pmc>. Parrot string version. Calls the C<puts> method
on the filehandle PMC.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_putps(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_io_putps)
    return Parrot_io_write_s(interp, pmc, s);
}

/*

=item C<INTVAL Parrot_io_fprintf(PARROT_INTERP, PMC *pmc, const char *s, ...)>

Writes a C string format with varargs to C<*pmc>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_io_fprintf(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_io_fprintf)
    va_list args;
    INTVAL ret;

    va_start(args, s);

    {
        STRING * const str = Parrot_vsprintf_c(interp, s, args);
        ret = Parrot_io_write_s(interp, pmc, str);
    }

    va_end(args);

    return ret;
}

/*

=item C<INTVAL Parrot_io_pprintf(PARROT_INTERP, PIOHANDLE os_handle, const char
*s, ...)>

Writes a C string format with varargs to PIOHANDLE C<os_handle>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_io_pprintf(PARROT_INTERP, PIOHANDLE os_handle, ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_io_pprintf)
    va_list  args;
    STRING  *str;
    INTVAL   ret;

    va_start(args, s);
    str = Parrot_vsprintf_c(interp, s, args);
    va_end(args);

    return Parrot_io_internal_write(interp, os_handle, str->strstart, str->bufused);
}

/*

=item C<INTVAL Parrot_io_printf(PARROT_INTERP, const char *s, ...)>

Writes a C string format with varargs to C<stdout>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_io_printf(PARROT_INTERP, ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_io_printf)
    va_list args;
    INTVAL ret;

    va_start(args, s);

    if (interp) {
        STRING * const str = Parrot_vsprintf_c(interp, s, args);
        ret = Parrot_io_write_s(interp, _PIO_STDOUT(interp), str);
    }
    else
        ret = vfprintf(stdout, s, args);

    va_end(args);

    return ret;
}

/*

=item C<INTVAL Parrot_io_eprintf(PARROT_INTERP, const char *s, ...)>

Writes a C string format with varargs to C<stderr>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_io_eprintf(NULLOK(PARROT_INTERP), ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_io_eprintf)
    va_list args;
    INTVAL ret;

    va_start(args, s);

    if (interp) {
        STRING * const str = Parrot_vsprintf_c(interp, s, args);
        ret = Parrot_io_write_s(interp, _PIO_STDERR(interp), str);
    }
    else
        ret = vfprintf(stderr, s, args);

    va_end(args);

    return ret;
}

/*

=item C<PIOHANDLE Parrot_io_getfd(PARROT_INTERP, PMC *pmc)>

Returns C<*pmc>'s file descriptor, or C<0> if it is not defined.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_getfd(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_getfd)
    return Parrot_io_get_os_handle(interp, pmc);
}

/*

=item C<INTVAL Parrot_io_is_tty_handle(PARROT_INTERP, PMC *pmc)>

Returns a boolean value indicating whether C<*pmc> is a console/tty.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_tty_handle(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_is_tty_handle)
    if (Parrot_io_is_closed(interp, pmc))
        return 0;

    return (Parrot_io_get_flags(interp, pmc) & PIO_F_CONSOLE) ? 1 : 0;
}

/*

=item C<INTVAL Parrot_io_is_async(PARROT_INTERP, PMC *pmc)>

Returns a boolean value indicating whether C<*pmc> is a non-blocking

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_async(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_is_async)
    if (Parrot_io_is_closed(interp, pmc))
        return 0;

    /* return (Parrot_io_get_flags(interp, pmc) & PIO_F_ASYNC) ? 1 : 0; */
    return 0;
}

/*

=back

=head2 C<Parrot_io_STD*> Functions

=over 4

=item C<PMC * Parrot_io_STDIN(PARROT_INTERP)>

Returns the C<FileHandle> PMC for C<stdin>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_STDIN(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_STDIN)
    return _PIO_STDIN(interp);
}

/*

=item C<PMC * Parrot_io_STDOUT(PARROT_INTERP)>

Returns the C<FileHandle> PMC for C<stdout>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_STDOUT(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_STDOUT)
    return _PIO_STDOUT(interp);
}

/*

=item C<PMC * Parrot_io_STDERR(PARROT_INTERP)>

Returns the C<FileHandle> PMC for C<stderr>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_STDERR(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_io_STDERR)
    return _PIO_STDERR(interp);
}

/*

=back

=head2 Offset Functions

These are used to create offsets for the C<seek> op.

=over 4

=item C<PIOOFF_T Parrot_io_make_offset(INTVAL offset)>

Returns C<offset>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_make_offset(INTVAL offset)
{
    ASSERT_ARGS(Parrot_io_make_offset)
    return offset;
}

/*

=item C<PIOOFF_T Parrot_io_make_offset32(INTVAL hi, INTVAL lo)>

C<hi> is shifted 32 bytes to the left and C<or>ed together with C<lo>.
This allows 64-bit seeks with only 32-bit C<INTVALS>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_make_offset32(INTVAL hi, INTVAL lo)
{
    ASSERT_ARGS(Parrot_io_make_offset32)
    return ((PIOOFF_T)hi << 31) | lo;
}

/*

=item C<PIOOFF_T Parrot_io_make_offset_pmc(PARROT_INTERP, PMC *pmc)>

Returns the return value of the C<get_integer> vtable on C<*pmc>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_make_offset_pmc(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_make_offset_pmc)
    return VTABLE_get_integer(interp, pmc);
}

/*

=item C<INTVAL Parrot_io_poll(PARROT_INTERP, PMC *pmc, INTVAL which, INTVAL sec,
INTVAL usec)>

Polls C<*pmc> for the events in C<which> every C<sec> seconds + C<usec>
microseconds.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_poll(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL which, INTVAL sec, INTVAL usec)
{
    ASSERT_ARGS(Parrot_io_poll)
    /* TODO: Can we move this to the IO_VTABLE and make it usable for all
       types? */
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);

    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't poll closed socket");

    return Parrot_io_internal_poll(interp, io->os_handle, which, sec, usec);
}

/*

=item C<void Parrot_io_connect_handle(PARROT_INTERP, PMC *pmc, PMC *address)>

Connects C<*pmc> to C<*address>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_socket_connect(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_socket_connect)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);
    int i;

    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't connect closed socket");
    if (PMC_IS_NULL(address))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Address is null");

    /* Iterate over all addresses if an array is passed */
    if (address->vtable->base_type != enum_class_Sockaddr) {
        INTVAL len = VTABLE_elements(interp, address);

        for (i = 0; i < len; ++i) {
            PMC *sa = VTABLE_get_pmc_keyed_int(interp, address, i);
            Parrot_Sockaddr_attributes * const sa_data = PARROT_SOCKADDR(sa);

            if (!Parrot_io_internal_addr_match(interp, sa, io->family, io->type,
                    io->protocol))
                continue;

            io->remote = sa;

            Parrot_io_internal_connect(interp, io->os_handle, sa_data->pointer,
                    sa_data->len);

            return;
        }

        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "No address found for family %d, type %d, proto %d",
                io->family, io->type, io->protocol);
    }

    io->remote = address;

    Parrot_io_internal_connect(interp, io->os_handle,
            VTABLE_get_pointer(interp, address),
            VTABLE_get_integer(interp, address));
}

/*

=item C<void Parrot_io_socket_bind(PARROT_INTERP, PMC *pmc, PMC *address)>

Binds C<*pmc>'s socket to the local address and port specified by
C<*address>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_socket_bind(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD(PMC *address))
{
    ASSERT_ARGS(Parrot_io_socket_bind)
    Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);
    int i;

    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't bind closed socket");
    if (PMC_IS_NULL(address))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Address is null");

    /* Iterate over all addresses if an array is passed */
    if (address->vtable->base_type != enum_class_Sockaddr) {
        INTVAL len = VTABLE_elements(interp, address);

        for (i = 0; i < len; ++i) {
            PMC *sa = VTABLE_get_pmc_keyed_int(interp, address, i);
            Parrot_Sockaddr_attributes * const sa_data = PARROT_SOCKADDR(sa);

            if (!Parrot_io_internal_addr_match(interp, sa, io->family, io->type,
                    io->protocol))
                continue;

            io->local = sa;

            Parrot_io_internal_bind(interp, io->os_handle, sa_data->pointer,
                    sa_data->len);

            return;
        }

        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "No address found for family %d, type %d, proto %d",
                io->family, io->type, io->protocol);
    }

    io->local = address;

    Parrot_io_internal_bind(interp, io->os_handle,
            VTABLE_get_pointer(interp, address),
            VTABLE_get_integer(interp, address));
}

/*

=item C<void Parrot_io_listen_handle(PARROT_INTERP, PMC *pmc, INTVAL backlog)>

Listens for new connections on socket C<*pmc>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_socket_listen(PARROT_INTERP, ARGMOD(PMC *pmc), INTVAL backlog)
{
    ASSERT_ARGS(Parrot_io_socket_listen)
    const Parrot_Socket_attributes * const io = PARROT_SOCKET(pmc);

    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Can't listen on closed socket");

    Parrot_io_internal_listen(interp, io->os_handle, backlog);
}

/*

=item C<PMC * Parrot_io_accept_handle(PARROT_INTERP, PMC *pmc)>

Accepts a new connection and returns a newly created C<ParrotIO> socket.
Returns C<NULL> on failure.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_socket_accept(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_socket_accept)
    Parrot_Socket_attributes *io = PARROT_SOCKET(pmc);
    Parrot_Socket_attributes *new_io;
    PMC       *new_pmc;

    if (Parrot_io_is_closed(interp, pmc))
        return PMCNULL;

    new_pmc = io_get_new_socket(interp);
    new_io  = PARROT_SOCKET(new_pmc);

    new_io->local  = io->local;
    new_io->remote = Parrot_pmc_new(interp, enum_class_Sockaddr);

    new_io->os_handle = Parrot_io_internal_accept(interp, io->os_handle, new_io->remote);

    return new_pmc;
}

/*

=item C<PMC * Parrot_io_new_socket_pmc(PARROT_INTERP, INTVAL flags)>

Creates a new I/O socket object. The value of C<flags> is set
in the returned PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_socket_new(PARROT_INTERP, INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_socket_new)
    PMC * const sock = io_get_new_socket(interp);
    Parrot_io_set_flags(interp, sock, flags);
    return sock;
}

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_get_flags)
    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot get flags for null or invalid PMC");
    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        return vtable->get_flags(interp, handle);
    }
}

void
Parrot_io_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(Parrot_io_set_flags)
    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot set flags for null or invalid PMC");
    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        return vtable->set_flags(interp, handle, flags);
    }
}

PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_get_os_handle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(Parrot_io_get_os_handle)
    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot get a PIOHANDLE from a NULL or invalid PMC");
    {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        return vtable->get_piohandle(interp, handle);
    }
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
