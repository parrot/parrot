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



/* OLD FUNCTIONS
    These functions need to be up-converted to the new architecture.
    Everything below this line needs to be evaluated.
*/

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

        os_handle           = PIO_STDHANDLE(interp, PIO_STDIN_FILENO);
        _PIO_STDIN(interp)  = Parrot_io_fdopen_flags(interp, PMCNULL,
                                os_handle, PIO_F_READ);

        os_handle           = PIO_STDHANDLE(interp, PIO_STDOUT_FILENO);
        _PIO_STDOUT(interp) = Parrot_io_fdopen_flags(interp, PMCNULL,
                                os_handle, PIO_F_WRITE);

        os_handle           = PIO_STDHANDLE(interp, PIO_STDERR_FILENO);
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
Parrot_IOData_mark(PARROT_INTERP, ARGIN(ParrotIOData *piodata))
{
    ASSERT_ARGS(Parrot_IOData_mark)
    INTVAL i;
    ParrotIOTable table = piodata->table;

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
        INTVAL status = vtable->open(interp, handle, path, flags);

        if (!status)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Unable to open %s from path '%Ss'", vtable->name, path);
    }

    return handle;
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
    PMC *new_filehandle;
    const INTVAL flags = Parrot_io_parse_open_flags(interp, sflags);

    if (!flags)
        return PMCNULL;

    new_filehandle = Parrot_io_fdopen_flags(interp, pmc, fd, flags);

    return new_filehandle;
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

    if (PIO_IS_TTY(interp, fd))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    if (PMC_IS_NULL(filehandle))
        filehandle = Parrot_pmc_new(interp, enum_class_FileHandle);

    Parrot_io_set_flags(interp, filehandle, flags);
    Parrot_io_set_os_handle(interp, filehandle, fd);

    return filehandle;
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
    return Parrot_io_close(interp, pmc, 1);
}

PARROT_EXPORT
INTVAL
Parrot_io_close(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL autoflush)
{
    ASSERT_ARGS(Parrot_io_close)
    if (PMC_IS_NULL(pmc))
        return 0;
    else {
        IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
        if (autoflush) {
            IO_BUFFER * const write_buffer = IO_GET_WRITE_BUFFER(interp, handle);
            Parrot_io_buffer_flush(interp, write_buffer, vtable, 0);
        }
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
    INTVAL result = 1;

    if (PMC_IS_NULL(pmc))
        return 1;
    if (pmc->vtable->base_type == enum_class_FileHandle)
        result = Parrot_io_is_closed_filehandle(interp, pmc);
    else
        Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "is_closed"), "->I", &result);

    return result;
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
    if (PMC_IS_NULL(pmc))
        return;

    if (pmc->vtable->base_type == enum_class_FileHandle)
        Parrot_io_flush_filehandle(interp, pmc);
    else if (pmc->vtable->base_type == enum_class_StringHandle) {
        SETATTR_StringHandle_stringhandle(interp, pmc, NULL);
    }
    else
        Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "flush"), "->");
}


/*

=item C<static const STR_VTABLE * get_encoding(PARROT_INTERP, PMC *pmc)>

Get the encoding vtable of a filehandle PMC

=cut

*/

PARROT_CANNOT_RETURN_NULL
static const STR_VTABLE *
get_encoding(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(get_encoding)
    STRING           *encoding_str;
    const STR_VTABLE *encoding;

    GETATTR_FileHandle_encoding(interp, pmc, encoding_str);

    if (STRING_IS_NULL(encoding_str))
        encoding = Parrot_default_encoding_ptr;
    else
        encoding = Parrot_find_encoding_by_string(interp, encoding_str);

    return encoding;
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
    STRING *result = NULL;
    if (PMC_IS_NULL(pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read from null or invalid PMC");
    if (pmc->vtable->base_type == enum_class_FileHandle) {
        UINTVAL           bytes_read;
        INTVAL            flags;
        const STR_VTABLE *encoding;

        GETATTR_FileHandle_flags(interp, pmc, flags);

        if (Parrot_io_is_closed_filehandle(interp, pmc)
        || !(flags & PIO_F_READ))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot read from a closed or non-readable filehandle");

        encoding = get_encoding(interp, pmc);

        /* Round up length to unit size of encoding */
        if (encoding->bytes_per_unit > 1)
            length = (length + encoding->bytes_per_unit - 1)
                   & ~(encoding->bytes_per_unit - 1);

        /* Allocate 3 bytes more for partial multi-byte characters */
        result           = Parrot_str_new_noinit(interp, length + 3);
        result->bufused  = length;
        result->encoding = encoding;
        bytes_read       = Parrot_io_read_buffer(interp, pmc,
                                result->strstart, length);

        if (bytes_read & (encoding->bytes_per_unit - 1))
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_CHARACTER,
                "Unaligned end in %s string\n", encoding->name);

        if (encoding->bytes_per_unit == encoding->max_bytes_per_codepoint) {
            result->bufused = bytes_read;
            STRING_scan(interp, result);
        }
        else {
            Parrot_String_Bounds bounds;
            INTVAL               needed;

            bounds.bytes = bytes_read;
            bounds.chars = -1;
            bounds.delim = -1;

            needed = encoding->partial_scan(interp, result->strstart, &bounds);

            result->bufused = bounds.bytes;
            result->strlen  = bounds.chars;

            /* Read and append remaining bytes in case of a partial result */
            if (needed > 0) {
                const INTVAL rest_read = Parrot_io_read_buffer(interp, pmc,
                                        result->strstart + bytes_read, needed);

                if (rest_read < needed)
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_CHARACTER,
                        "Unaligned end in %s string\n", encoding->name);

                /* Check if character is valid */

                bounds.bytes = bytes_read + needed - result->bufused;
                bounds.chars = 1;
                bounds.delim = -1;

                encoding->partial_scan(interp,
                        result->strstart + result->bufused, &bounds);

                PARROT_ASSERT(result->bufused + bounds.bytes ==
                              bytes_read + needed);
                PARROT_ASSERT(bounds.chars == 1);

                result->bufused += bounds.bytes;
                result->strlen  += 1;
            }
        }
    }
    else if (pmc->vtable->base_type == enum_class_StringHandle) {
        STRING *string_orig;
        INTVAL offset;
        /* TODO: Check that we are open for reading */
        GETATTR_StringHandle_stringhandle(interp, pmc, string_orig);
        if (STRING_IS_NULL(string_orig))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot read from a closed filehandle");

        if (length == 0)
            result = string_orig;
        else {
            INTVAL read_length = length;
            const INTVAL orig_length = Parrot_str_byte_length(interp, string_orig);

            GETATTR_StringHandle_read_offset(interp, pmc, offset);

            /* Only read to the end of the string data. */
            if (offset + read_length > orig_length)
                read_length = orig_length - offset;

            result = STRING_substr(interp, string_orig, offset, read_length);
            SETATTR_StringHandle_read_offset(interp, pmc, offset + read_length);
        }
    }
    else if (pmc->vtable->base_type == enum_class_Socket) {
        result = Parrot_io_recv_handle(interp, pmc, length);
    }
    else
        Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "read"), "I->S", length, &result);
    return result;
}

/*

=item C<PMC * Parrot_io_read_byte_buffer_pmc(PARROT_INTERP, PMC *handle, PMC
*buffer, INTVAL length)>

Read C<length> bytes from the C<handle> into the C<buffer> (ByteBuffer) PMC.

=item C<INTVAL Parrot_io_write_byte_buffer_pmc(PARROT_INTERP, PMC * handle, PMC
*buffer, INTVAL length)>

Write C<length> bytes (or the total length of C<buffer>, whichever is smaller)
from C<buffer> to the C<handle>

=cut

*/


PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_read_byte_buffer_pmc(PARROT_INTERP, ARGMOD(PMC *handle),
        ARGMOD_NULLOK(PMC *buffer), INTVAL length)
{
    ASSERT_ARGS(Parrot_io_read_byte_buffer_pmc)
    unsigned char *content;

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read bytes from a null or invalid PMC");

    if (PMC_IS_NULL(buffer))
        buffer = Parrot_pmc_new_init_int(interp, enum_class_ByteBuffer, length);
    else
        VTABLE_set_integer_native(interp, buffer, length);
    GETATTR_ByteBuffer_content(interp, buffer, content);

    if (handle->vtable->base_type == enum_class_FileHandle) {
        INTVAL bytes_read = 0;
        INTVAL flags;
        GETATTR_FileHandle_flags(interp, handle, flags);

        if (Parrot_io_is_closed_filehandle(interp, handle) ||
                !(flags & PIO_F_READ))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot read from a closed or non-readable filehandle");

        bytes_read = Parrot_io_read_buffer(interp, handle, (char *)content, length);

        if (bytes_read != length)
            VTABLE_set_integer_native(interp, buffer, bytes_read);
    }
    else if (handle->vtable->base_type == enum_class_StringHandle) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Reading from a StringHandle to a ByteBuffer not implemented yet");
    }
    else if (handle->vtable->base_type == enum_class_Socket) {
        INTVAL received = Parrot_io_socket_recv_to_buffer(interp, handle,
            (char *)content, length);
        if (received != length)
            VTABLE_set_integer_native(interp, buffer, received);
    }
    else
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Unknown type in read to ByteBuffer");

    return buffer;
}

INTVAL
Parrot_io_write_byte_buffer_pmc(PARROT_INTERP, ARGMOD(PMC * handle),
        ARGMOD(PMC *buffer), INTVAL length)
{
    ASSERT_ARGS(Parrot_io_write_byte_buffer_pmc)
    unsigned char *content;
    INTVAL real_length;

    if (PMC_IS_NULL(handle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to write bytes to a null or invalid PMC");

    if (PMC_IS_NULL(buffer))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Attempt to read bytes from a null or invalid ByteBuffer");

    content = (unsigned char *)VTABLE_get_pointer(interp, buffer);
    real_length = VTABLE_elements(interp, buffer);
    if (real_length < length)
        length = real_length;

    if (handle->vtable->base_type == enum_class_FileHandle) {
        return Parrot_io_write_handle(interp, handle, content, length);
    }
    else if (handle->vtable->base_type == enum_class_StringHandle) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Writing to a ByteBuffer from a StringHandle not implemented yet");
    }
    else if (handle->vtable->base_type == enum_class_Socket) {
        return Parrot_io_socket_send_from_buffer(interp, handle,
                (const char *)content, length);
    }
    else
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Unknown type in read to ByteBuffer");
}

/*

=item C<STRING * Parrot_io_readline(PARROT_INTERP, PMC *pmc)>

Return a new C<STRING*> holding the next line read from the file. Calls
the C<readline> method of the filehandle PMC.

=cut

*/


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_readline(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_readline)
    STRING *result;
    if (pmc->vtable->base_type == enum_class_FileHandle) {
        INTVAL            flags;

        GETATTR_FileHandle_flags(interp, pmc, flags);

        if (Parrot_io_is_closed_filehandle(interp, pmc)
        || !(flags & PIO_F_READ))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot read from a closed or non-readable filehandle");

        result = Parrot_io_readline_buffer(interp, pmc,
                    get_encoding(interp, pmc));
    }
    else if (pmc->vtable->base_type == enum_class_StringHandle) {
        INTVAL offset, newline_pos, read_length, orig_length;

        GETATTR_StringHandle_stringhandle(interp, pmc, result);
        if (STRING_IS_NULL(result))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot read from a closed stringhandle");

        orig_length = Parrot_str_byte_length(interp, result);
        GETATTR_StringHandle_read_offset(interp, pmc, offset);
        newline_pos = STRING_index(interp, result, CONST_STRING(interp, "\n"), offset);

        /* No newline found, read the rest of the string. */
        if (newline_pos == -1)
            read_length = orig_length - offset;
        else
            read_length = newline_pos - offset + 1; /* +1 to include the newline */

        result = STRING_substr(interp, result, offset, read_length);
        SETATTR_StringHandle_read_offset(interp, pmc, newline_pos + 1);
    }
    else if (pmc->vtable->base_type == enum_class_Socket) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Parrot_io_readline on Socket not implemented");
    }
    else
        Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "readline"), "->S", &result);
    return result;
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
Parrot_io_write_handle(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const void *buffer), size_t length)
{
    ASSERT_ARGS(Parrot_io_write_handle)
    INTVAL result;
    STRING *s;

    if (PMC_IS_NULL(pmc))
        return -1;

    s = Parrot_str_new(interp, (const char *)buffer, length);

    result = Parrot_io_putps(interp, pmc, s);
    return result;
}

/*

=item C<PIOOFF_T Parrot_io_seek_handle(PARROT_INTERP, PMC *pmc, PIOOFF_T offset,
INTVAL w)>

Moves the read/write position of C<*pmc> to offset C<bytes> from the
position indicated by C<w>. Typically C<w> will be C<0> for the start of
the file, C<1> for the current position, and C<2> for the end.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_seek_handle(PARROT_INTERP, ARGMOD(PMC *pmc), PIOOFF_T offset, INTVAL w)
{
    ASSERT_ARGS(Parrot_io_seek_handle)
    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    return Parrot_io_seek_buffer(interp, pmc, offset, w);
}

/*

=item C<PIOOFF_T Parrot_io_tell_handle(PARROT_INTERP, PMC *pmc)>

Returns the current read/write position of C<*pmc>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_tell_handle(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_tell_handle)
    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    return Parrot_io_get_file_position(interp, pmc);
    /* return PIO_TELL(interp, os_handle); */
}

/*

=item C<STRING * Parrot_io_peek(PARROT_INTERP, PMC *pmc)>

Retrieve the next character in the stream without modifying the stream. Calls
the platform-specific implementation of 'peek'.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_peek(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_peek)
    STRING *res;
    INTVAL  c;

    if (Parrot_io_is_closed(interp, pmc))
        c = -1;
    else
        c = Parrot_io_peek_buffer(interp, pmc);

    if (c == -1)
        res = STRINGNULL;
    else
        res = Parrot_str_chr(interp, c);

    return res;
}

/*

=item C<INTVAL Parrot_io_eof(PARROT_INTERP, PMC *pmc)>

Returns a boolean value indication whether C<*pmc>'s C<EOF> flag is set,
indicating that an attempt was made to read past the end of the underlying
filehandle.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_eof(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(Parrot_io_eof)
    INTVAL flags, result;

    /* io could be null here, but rather than return a negative error
     * we just fake EOF since eof test is usually in a boolean context.
     */
    if (PMC_IS_NULL(pmc))
        return 1;
    if (pmc->vtable->base_type == enum_class_FileHandle) {
        if (Parrot_io_is_closed_filehandle(interp, pmc))
            return 1;

        GETATTR_FileHandle_flags(interp, pmc, flags);
        if (flags & PIO_F_EOF)
            return 1;
        return 0;
    }
    Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "eof"), "->I", &result);
    return result;
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
    return Parrot_io_write_handle(interp, pmc, s, strlen(s));
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
    INTVAL result;

    if (PMC_IS_NULL(pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot write to null PMC");
    if (pmc->vtable->base_type == enum_class_FileHandle) {
        INTVAL            flags;
        STRING           *encoding_str;
        const STR_VTABLE *encoding;

        GETATTR_FileHandle_flags(interp, pmc, flags);

        if (!(flags & PIO_F_WRITE))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "FileHandle is not opened for writing");
        if (STRING_IS_NULL(s))
            return 0;

        GETATTR_FileHandle_encoding(interp, pmc, encoding_str);

        /*
         * If no encoding is set, the binary representation of the string
         * is written as is. It might be better to use a default encoding
         * in that case.
         */

        if (!STRING_IS_NULL(encoding_str)) {
            encoding = Parrot_find_encoding_by_string(interp, encoding_str);

            if (encoding != s->encoding
            &&  encoding != Parrot_binary_encoding_ptr)
                s = encoding->to_encoding(interp, s);
        }

        result = Parrot_io_write_buffer(interp, pmc, s);
    }
    else
        Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "puts"), "S->I", s, &result);

    return result;

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

    ret = Parrot_io_putps(interp, pmc, Parrot_vsprintf_c(interp, s, args));

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

    ret = Parrot_io_write(interp, os_handle, str->strstart, str->bufused);

    return ret;
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
        ret = Parrot_io_putps(interp, _PIO_STDOUT(interp), str);
    }
    else {
        /* Be nice about this...
         **   XXX BD Should this use the default PIO_STDOUT or something?
         */
        ret = vfprintf(stdout, s, args);
    }

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

        ret = Parrot_io_putps(interp, _PIO_STDERR(interp), str);
    }
    else {
        /* Be nice about this...
        **   XXX BD Should this use the default PIO_STDERR or something?
        */
        ret = vfprintf(stderr, s, args);
    }

    va_end(args);

    return ret;
}

/*

=item C<PIOHANDLE Parrot_io_getfd(PARROT_INTERP, const PMC *pmc)>

Returns C<*pmc>'s file descriptor, or C<0> if it is not defined.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_getfd(PARROT_INTERP, ARGIN(const PMC *pmc))
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

    return (Parrot_io_get_flags(interp, pmc) & PIO_F_ASYNC) ? 1 : 0;
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

=back

=head1 SEE ALSO

F<io/unix.c>,
F<io/win32.c>,
F<io/portable.c>,
F<io/io_private.h>.

=cut

*/



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
