/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/io/api.c - Parrot I/O API

=head1 DESCRIPTION

The Parrot I/O subsystem provides the core I/O functionality for all parts of
Parrot. This file implements the public interface to the I/O subsystem. Common
utility functions that aren't part of the public interface are defined in
F<src/io/core.c> and utility functions for a specific platform are in
F<src/io/unix.c>, F<src/io/win32.c>, or F<src/io/portable.c>. The platform is
selected in F<include/parrot/io.h>, based on #defines from the configuration
process.

The C<FileHandle> PMC provides the class-based interface for filehandles that
is used in Parrot ops.

TODO: Where possible, extract some of the filehandle-related details into
F<src/io/filehandle.c>, and extract the stringhandle details into
a new F<src/io/io_string.c>.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "io_private.h"
#include "api.str"
#include "pmc/pmc_filehandle.h"
#include "pmc/pmc_stringhandle.h"
#include "pmc/pmc_socket.h"

#include <stdarg.h>

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

=head2 Generic I/O interface

=over 4

=item C<INTVAL Parrot_io_parse_open_flags(PARROT_INTERP, const STRING
*mode_str)>

Parses a Parrot string for file open mode flags (C<r> for read, C<w> for write,
C<a> for append, and C<p> for pipe) and returns the combined generic bit flags.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_parse_open_flags(PARROT_INTERP, ARGIN(const STRING *mode_str))
{
    ASSERT_ARGS(Parrot_io_parse_open_flags)
    INTVAL i, mode_len;
    INTVAL flags = 0;

    if (STRING_IS_NULL(mode_str))
        return PIO_F_READ;

    mode_len = Parrot_str_byte_length(interp, mode_str);

    for (i = 0; i < mode_len; ++i) {
        const INTVAL s = STRING_ord(interp, mode_str, i);
        switch (s) {
          case 'r':
            flags |= PIO_F_READ;
            break;
          case 'w':
            flags |= PIO_F_WRITE;
            if (!(flags & PIO_F_APPEND)) /* don't truncate if appending */
                flags |= PIO_F_TRUNC;
            break;
          case 'a':
            flags |= PIO_F_APPEND;
            flags |= PIO_F_WRITE;
            if ((flags & PIO_F_TRUNC)) /* don't truncate if appending */
                flags &= ~PIO_F_TRUNC;
            break;
          case 'p':
            flags |= PIO_F_PIPE;
            break;
          default:
            break;
        }
    }

    return flags;
}

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
Parrot_io_open_handle(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(STRING *path), ARGIN(STRING *mode))
{
    ASSERT_ARGS(Parrot_io_open_handle)
    PMC *filehandle;
    const INTVAL typenum = Parrot_hll_get_ctx_HLL_type(interp,
                                                   Parrot_PMC_typenum(interp, "FileHandle"));
    if (PMC_IS_NULL(pmc)) {
        filehandle = Parrot_pmc_new(interp, typenum);
    }
    else
        filehandle = pmc;

    if (STRING_IS_NULL(path))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                        "Cannot open filehandle, no path");

    if (filehandle->vtable->base_type == typenum) {
        INTVAL    flags     = Parrot_io_parse_open_flags(interp, mode);
        PIOHANDLE os_handle;

        /* TODO: a filehandle shouldn't allow a NULL path. */

        PARROT_ASSERT(filehandle->vtable->base_type == typenum);

        if (flags & PIO_F_PIPE) {
            const int f_read  = (flags & PIO_F_READ) != 0;
            const int f_write = (flags & PIO_F_WRITE) != 0;
            INTVAL    pid;

            if (f_read == f_write)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Invalid pipe mode: %X", flags);

            os_handle = PIO_OPEN_PIPE(interp, path, flags, &pid);

            /* Save the pid of the child, we'll wait for it when closing */
            VTABLE_set_integer_keyed_int(interp, filehandle, 0, pid);
        }
        else {
            if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "Invalid mode for file open");

            os_handle = PIO_OPEN(interp, path, flags);

            if (os_handle == PIO_INVALID_HANDLE)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                    "Unable to open filehandle from path '%Ss'", path);

            flags |= PIO_F_FILE;

            /* Set generic flag here if is a terminal then
             * FileHandle can know how to setup buffering.
             * STDIN, STDOUT, STDERR would be in this case
             * so we would setup linebuffering.
             */
            if (PIO_IS_TTY(interp, os_handle))
                flags |= PIO_F_CONSOLE;
        }

        if (STRING_IS_NULL(mode))
            mode = CONST_STRING(interp, "r");
        else if (STRING_index(interp, mode, CONST_STRING(interp, "b"), 0) >= 0)
            SETATTR_FileHandle_encoding(interp, filehandle, CONST_STRING(interp, "binary"));

        SETATTR_FileHandle_os_handle(interp, filehandle, os_handle);
        SETATTR_FileHandle_flags(interp, filehandle, flags);
        SETATTR_FileHandle_filename(interp, filehandle, path);
        SETATTR_FileHandle_mode(interp, filehandle, mode);

        Parrot_io_setbuf(interp, filehandle, PIO_UNBOUND);
    }
    else
        Parrot_pcc_invoke_method_from_c_args(interp, filehandle, CONST_STRING(interp, "open"), "SS->P", path, mode, &filehandle);
    return filehandle;
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

    if (Parrot_io_get_flags(interp, new_filehandle) & PIO_F_CONSOLE)
        Parrot_io_setlinebuf(interp, new_filehandle);
    else
        Parrot_io_setbuf(interp, new_filehandle, PIO_UNBOUND);

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
Parrot_io_fdopen_flags(PARROT_INTERP, ARGMOD(PMC *filehandle), PIOHANDLE fd, INTVAL flags)
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
    INTVAL result = 1;

    if (PMC_IS_NULL(pmc))
        return -1;

    if (pmc->vtable->base_type == enum_class_FileHandle) {
        result = Parrot_io_close_filehandle(interp, pmc);
        SETATTR_FileHandle_flags(interp, pmc, 0);
    }
    else if (pmc->vtable->base_type == enum_class_Socket) {
        result = -1;
        if (PARROT_SOCKET(pmc)) {
            Parrot_Socket_attributes *data_struct = PARROT_SOCKET(pmc);

            if (data_struct->os_handle != PIO_INVALID_HANDLE)
                result = Parrot_io_close_socket(interp, data_struct->os_handle);
            data_struct->os_handle = PIO_INVALID_HANDLE;
        }
    }
    else if (pmc->vtable->base_type == enum_class_StringHandle) {
        SETATTR_StringHandle_read_offset(interp, pmc, 0);
        result = 0;
    }
    else
        Parrot_pcc_invoke_method_from_c_args(interp, pmc, CONST_STRING(interp, "close"), "->I", &result);

    return result;
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
