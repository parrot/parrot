/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/io/stringhandle.c - StringHandle vtables and helper routines

=head1 DESCRIPTION


=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_stringhandle.h"

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL io_stringhandle_close(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL autoflush)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_stringhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static STR_VTABLE * io_stringhandle_get_encoding(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_stringhandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOHANDLE io_stringhandle_get_piohandle(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_stringhandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_stringhandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_stringhandle_open(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *path),
    INTVAL flags,
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle);

static INTVAL io_stringhandle_read_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGOUT(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

static INTVAL io_stringhandle_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_stringhandle_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOOFF_T io_stringhandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static size_t io_stringhandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_stringhandle_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

#define ASSERT_ARGS_io_stringhandle_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_get_piohandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_is_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_is_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_io_stringhandle_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_stringhandle_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_total_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

void
io_stringhandle_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL idx)
{
    ASSERT_ARGS(io_stringhandle_setup_vtable)
    if (vtable == NULL)
        vtable = &(interp->piodata->vtables[idx]);
    vtable->number = idx;
    vtable->name = "StringHandle";
    vtable->read_b = io_stringhandle_read_b;
    vtable->write_b = io_stringhandle_write_b;
    vtable->flush = io_stringhandle_flush;
    vtable->is_eof = io_stringhandle_is_eof;
    vtable->tell = io_stringhandle_tell;
    vtable->seek = io_stringhandle_seek;
    vtable->open = io_stringhandle_open;
    vtable->is_open = io_stringhandle_is_open;
    vtable->close = io_stringhandle_close;
    vtable->get_encoding = io_stringhandle_get_encoding;
    vtable->set_flags = io_stringhandle_set_flags;
    vtable->get_flags = io_stringhandle_get_flags;
    vtable->total_size = io_stringhandle_total_size;
    vtable->get_piohandle = io_stringhandle_get_piohandle;
}

static INTVAL
io_stringhandle_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_stringhandle_read_b)
    INTVAL read_offs;
    STRING *stringhandle;
    GETATTR_StringHandle_read_offset(interp, handle, read_offs);
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);

    memcpy(buffer, stringhandle->_bufstart, byte_length);
    SETATTR_StringHandle_read_offset(interp, handle, read_offs + byte_length);
    return byte_length;
}

static INTVAL
io_stringhandle_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_stringhandle_write_b)
    STRING *old_string, *new_string;
    STR_VTABLE * encoding;

    GETATTR_StringHandle_stringhandle(interp, handle, old_string);
    GETATTR_StringHandle_encoding(interp, handle, encoding);

    new_string = io_get_new_empty_string(interp, encoding, -1, old_string->bufused + byte_length);
    memcpy(new_string->_bufstart, old_string->_bufstart, old_string->bufused);
    memcpy(new_string->_bufstart + old_string->bufused, buffer, byte_length);
    new_string->bufused = old_string->bufused + byte_length;

    SETATTR_StringHandle_stringhandle(interp, handle, new_string);
    return byte_length;
}

static INTVAL
io_stringhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_flush)
    SETATTR_StringHandle_stringhandle(interp, handle, STRINGNULL);
}

static INTVAL
io_stringhandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_is_eof)
    INTVAL read_offs;
    STRING *stringhandle;
    GETATTR_StringHandle_read_offset(interp, handle, read_offs);
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    return read_offs >= stringhandle->bufused;
}

static PIOOFF_T
io_stringhandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_tell)
    INTVAL read_offset;
    GETATTR_StringHandle_read_offset(interp, handle, read_offset);
    return (PIOOFF_T)read_offset;
}

static INTVAL
io_stringhandle_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_stringhandle_seek)
    INTVAL old_offs;
    STRING *stringhandle;
    INTVAL read_offs = 0;
    switch (whence) {
        case 0:
            /* Absolute seek, start from the beginning of the string */
            read_offs = (INTVAL)offset;
            break;
        case 1:
            /* Relative seek from the current offset */
            GETATTR_StringHandle_read_offset(interp, handle, old_offs);
            read_offs = (INTVAL)offset + old_offs;
            break;
        case 2:
            /* Absolute seek backwards from the end of the buffer */
            GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
            read_offs = (INTVAL)(stringhandle->bufused - (size_t)offset);
            break;
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot seek with mode %d", whence);
    }
    SETATTR_StringHandle_read_offset(interp, handle, read_offs);
}

static INTVAL
io_stringhandle_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags, ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_stringhandle_open)
    STR_VTABLE * encoding;
    STRING *new_str;
    GETATTR_StringHandle_encoding(interp, handle, encoding);

    new_str = io_get_new_empty_string(interp, encoding, -1, 0);

    SETATTR_StringHandle_stringhandle(interp, handle, new_str);
    SETATTR_StringHandle_flags(interp, handle, flags);
    SETATTR_StringHandle_mode(interp, handle, mode);
    SETATTR_StringHandle_filename(interp, handle, path);
    SETATTR_StringHandle_read_offset(interp, handle, 0);
}

static INTVAL
io_stringhandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_is_open)
    STRING *stringhandle;
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    return !STRING_IS_NULL(stringhandle);
}

static INTVAL
io_stringhandle_close(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL autoflush)
{
    ASSERT_ARGS(io_stringhandle_close)
    SETATTR_StringHandle_stringhandle(interp, handle, STRINGNULL);
    SETATTR_StringHandle_read_offset(interp, handle, 0);
    return 1;
}

static size_t
io_stringhandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_total_size)
    STRING *stringhandle;
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    return stringhandle->_buflen;
}

static PIOHANDLE
io_stringhandle_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_get_piohandle)
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "get_piohandle");
}

static void
io_stringhandle_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(io_stringhandle_set_flags)
    PARROT_STRINGHANDLE(handle)->flags = flags;
}

static INTVAL
io_stringhandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_get_flags)
    return PARROT_STRINGHANDLE(handle)->flags;
}

static STR_VTABLE *
io_stringhandle_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_get_encoding)
    STRING * stringhandle;
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    if (STRING_IS_NULL(stringhandle))
        return NULL;
    return stringhandle->encoding;
}
