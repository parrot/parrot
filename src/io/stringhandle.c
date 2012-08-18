/*
Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

src/io/stringhandle.c - StringHandle vtables and helper routines

=head1 DESCRIPTION

The StringHandle IO_VTABLE and helper methods.

=cut

=head2 IO_VTABLE Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_stringhandle.h"

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void io_stringhandle_adv_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    size_t offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_stringhandle_close(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_stringhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE * io_stringhandle_get_encoding(PARROT_INTERP,
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

static PIOOFF_T io_stringhandle_get_position(PARROT_INTERP,
    ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

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

static PIOOFF_T io_stringhandle_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_stringhandle_set_eof(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL is_set)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_stringhandle_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void io_stringhandle_set_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T pos)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

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

#define ASSERT_ARGS_io_stringhandle_adv_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
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
#define ASSERT_ARGS_io_stringhandle_get_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
#define ASSERT_ARGS_io_stringhandle_set_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_stringhandle_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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

/*

=item C<void io_stringhandle_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable,
INTVAL idx)>

Setup the Socket IO_VTABLE

=cut

*/

void
io_stringhandle_setup_vtable(PARROT_INTERP, ARGMOD_NULLOK(IO_VTABLE *vtable), INTVAL idx)
{
    ASSERT_ARGS(io_stringhandle_setup_vtable)
    /* TODO: readline and other operations requiring a buffer should be able to be
       done on the stringhandle memory directly to save cycles. Consider a flag
       PIO_VF_CUSTOM_BUFFER and new vtables to set up a custom buffer to be used
    */
    if (vtable == NULL)
        vtable = IO_EDITABLE_IO_VTABLE(interp, idx);
    vtable->number = idx;
    vtable->flags =
        PIO_VF_PATH_NOT_REQUIRED |  /* StringHandle does not require a path to open */
        PIO_VF_MULTI_READABLE |     /* Multiple reads will not hang */
        PIO_VF_AWAYS_READABLE;      /* StringHandle can be read when closed or not in
                                       read mode */
    vtable->name = "StringHandle";
    vtable->read_b = io_stringhandle_read_b;
    vtable->write_b = io_stringhandle_write_b;
    vtable->flush = io_stringhandle_flush;
    vtable->is_eof = io_stringhandle_is_eof;
    vtable->set_eof = io_stringhandle_set_eof;
    vtable->tell = io_stringhandle_tell;
    vtable->seek = io_stringhandle_seek;
    vtable->adv_position = io_stringhandle_adv_position;
    vtable->set_position = io_stringhandle_set_position;
    vtable->get_position = io_stringhandle_get_position;
    vtable->open = io_stringhandle_open;
    vtable->is_open = io_stringhandle_is_open;
    vtable->close = io_stringhandle_close;
    vtable->get_encoding = io_stringhandle_get_encoding;
    vtable->set_flags = io_stringhandle_set_flags;
    vtable->get_flags = io_stringhandle_get_flags;
    vtable->total_size = io_stringhandle_total_size;
    vtable->get_piohandle = io_stringhandle_get_piohandle;
}

/*

=item C<static INTVAL io_stringhandle_read_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Attempt to read C<byte_length> bytes from the stringhandle.

=cut

*/

static INTVAL
io_stringhandle_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_stringhandle_read_b)
    INTVAL read_offs;
    STRING *stringhandle;
    size_t available_bytes;
    GETATTR_StringHandle_read_offset(interp, handle, read_offs);
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    available_bytes = stringhandle->bufused - read_offs;
    if (byte_length > available_bytes)
        byte_length = available_bytes;

    memcpy(buffer, (char*)stringhandle->_bufstart + read_offs, byte_length);
    SETATTR_StringHandle_read_offset(interp, handle, read_offs + byte_length);
    return byte_length;
}

/*

=item C<static INTVAL io_stringhandle_write_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Write a number of bytes to the StringHandle.

=cut

*/

static INTVAL
io_stringhandle_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_stringhandle_write_b)
    STRING *old_string, *new_string;
    const STR_VTABLE * const encoding = io_stringhandle_get_encoding(interp, handle);

    GETATTR_StringHandle_stringhandle(interp, handle, old_string);

    /* TODO: Only allocate more space if we don'thave enough available already */
    new_string = io_get_new_empty_string(interp, encoding, -1, old_string->bufused + byte_length);
    memcpy(new_string->_bufstart, old_string->_bufstart, old_string->bufused);
    memcpy(((char*)new_string->_bufstart) + old_string->bufused, buffer, byte_length);
    new_string->bufused = old_string->bufused + byte_length;
    STRING_scan(interp, new_string);

    SETATTR_StringHandle_stringhandle(interp, handle, new_string);
    return byte_length;
}

/*

=item C<static INTVAL io_stringhandle_flush(PARROT_INTERP, PMC *handle)>

Clear the StringHandle.

=cut

*/

static INTVAL
io_stringhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_flush)
    SETATTR_StringHandle_stringhandle(interp, handle, STRINGNULL);
    return 0;
}

/*

=item C<static INTVAL io_stringhandle_is_eof(PARROT_INTERP, PMC *handle)>

The StringHandle is at eof if the current read cursor is passed the end of the
string contents.

=item C<static void io_stringhandle_set_eof(PARROT_INTERP, PMC *handle, INTVAL
is_set)>

Do nothing.

=cut

*/

static INTVAL
io_stringhandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_is_eof)
    INTVAL read_offs;
    STRING *stringhandle;
    GETATTR_StringHandle_read_offset(interp, handle, read_offs);
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    return (UINTVAL)read_offs >= stringhandle->bufused;
}

static void
io_stringhandle_set_eof(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL is_set)
{
    ASSERT_ARGS(io_stringhandle_set_eof)
    UNUSED(interp);
    UNUSED(handle);
    UNUSED(is_set);
}

/*

=item C<static PIOOFF_T io_stringhandle_tell(PARROT_INTERP, PMC *handle)>

Get the current position of the cursor in the string.

=cut

*/

static PIOOFF_T
io_stringhandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_tell)
    INTVAL read_offset;
    GETATTR_StringHandle_read_offset(interp, handle, read_offset);
    return (PIOOFF_T)read_offset;
}

/*

=item C<static PIOOFF_T io_stringhandle_seek(PARROT_INTERP, PMC *handle,
PIOOFF_T offset, INTVAL whence)>

Seek to the given position in the stringhandle.

=cut

*/

static PIOOFF_T
io_stringhandle_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_stringhandle_seek)
    INTVAL old_offs;
    STRING *stringhandle;
    INTVAL read_offs = 0;
    /* TODO: Need more error checking */
    switch (whence) {
        case SEEK_SET:
            /* Absolute seek, start from the beginning of the string */
            read_offs = (INTVAL)offset;
            break;
        case SEEK_CUR:
            /* Relative seek from the current offset */
            GETATTR_StringHandle_read_offset(interp, handle, old_offs);
            read_offs = (INTVAL)offset + old_offs;
            break;
        case SEEK_END:
            /* Absolute seek backwards from the end of the buffer */
            GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
            read_offs = (INTVAL)(stringhandle->bufused - (size_t)offset);
            break;
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot seek with mode %d", whence);
    }
    SETATTR_StringHandle_read_offset(interp, handle, read_offs);
    return (PIOOFF_T)read_offs;
}

/*

=item C<static void io_stringhandle_adv_position(PARROT_INTERP, PMC *handle,
size_t offset)>

Do nothing. StringHandle keeps track of position directly and doesn't need
to do it separately.

=item C<static void io_stringhandle_set_position(PARROT_INTERP, PMC *handle,
PIOOFF_T pos)>

Do nothing. StringHandle keeps track of position directly and doesn't need to
do it separately.

=item C<static PIOOFF_T io_stringhandle_get_position(PARROT_INTERP, PMC
*handle)>

Fall back to io_stringhandle_tell;

=cut

*/

static void
io_stringhandle_adv_position(PARROT_INTERP, ARGMOD(PMC *handle), size_t offset)
{
    ASSERT_ARGS(io_stringhandle_adv_position)
    UNUSED(handle)
    UNUSED(offset)
    /* StringHandle keeps track of position directly. Ignore this. */
}

static void
io_stringhandle_set_position(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T pos)
{
    ASSERT_ARGS(io_stringhandle_set_position)
    UNUSED(handle)
    UNUSED(pos)
    /* StringHandle keeps track of position directly. Ignore this. */
}

static PIOOFF_T
io_stringhandle_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_get_position)
    return io_stringhandle_tell(interp, handle);
}

/*

=item C<static INTVAL io_stringhandle_open(PARROT_INTERP, PMC *handle, STRING
*path, INTVAL flags, STRING *mode)>

Open the StringHandle with the given mode and settings.

=cut

*/

static INTVAL
io_stringhandle_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags,
        ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_stringhandle_open)
    STRING *old_handle;
    GETATTR_StringHandle_stringhandle(interp, handle, old_handle);
    if (STRING_IS_NULL(old_handle)) {
        const STR_VTABLE * const encoding = io_stringhandle_get_encoding(interp, handle);
        STRING * const new_str = io_get_new_empty_string(interp, encoding, -1, 0);
        SETATTR_StringHandle_stringhandle(interp, handle, new_str);
    }
    SETATTR_StringHandle_flags(interp, handle, flags);
    SETATTR_StringHandle_mode(interp, handle, mode);
    SETATTR_StringHandle_filename(interp, handle, path);
    SETATTR_StringHandle_read_offset(interp, handle, 0);
    return 1;
}

/*

=item C<static INTVAL io_stringhandle_is_open(PARROT_INTERP, PMC *handle)>

Determine if the StringHandle currently thinks it is open.

=cut

*/

static INTVAL
io_stringhandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_is_open)
    STRING *stringhandle;
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    return !STRING_IS_NULL(stringhandle);
}

/*

=item C<static INTVAL io_stringhandle_close(PARROT_INTERP, PMC *handle)>

StringHandle doesn't really close. Reset the read offset.

=cut

*/

static INTVAL
io_stringhandle_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_close)
    SETATTR_StringHandle_read_offset(interp, handle, 0);
    return 1;
}

/*

=item C<static size_t io_stringhandle_total_size(PARROT_INTERP, PMC *handle)>

Get the total size of the contents of the StringHandle.

=cut

*/

static size_t
io_stringhandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_total_size)
    STRING *stringhandle;
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    if (STRING_IS_NULL(stringhandle))
        return 0;
    return stringhandle->bufused;
}

/*

=item C<static PIOHANDLE io_stringhandle_get_piohandle(PARROT_INTERP, PMC
*handle)>

Throw an exception. StringHandle does not hold a valid PIOHANDLE.

=cut

*/

static PIOHANDLE
io_stringhandle_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_get_piohandle)
    const IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "get_piohandle");
    return PIO_INVALID_HANDLE;
}

/*

=item C<static void io_stringhandle_set_flags(PARROT_INTERP, PMC *handle, INTVAL
flags)>

Set the flags on the StringHandle.

=item C<static INTVAL io_stringhandle_get_flags(PARROT_INTERP, PMC *handle)>

Get the flags from the StringHandle.

=cut

*/

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

/*

=item C<static const STR_VTABLE * io_stringhandle_get_encoding(PARROT_INTERP,
PMC *handle)>

Get the encoding from the StringHandle.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE *
io_stringhandle_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_get_encoding)
    /*
    STRING * stringhandle;
    GETATTR_StringHandle_stringhandle(interp, handle, stringhandle);
    if (STRING_IS_NULL(stringhandle))
        return NULL;
    return stringhandle->encoding;
    */
    STRING           *encoding_str;

    GETATTR_StringHandle_encoding(interp, handle, encoding_str);
    if (!STRING_IS_NULL(encoding_str))
        return Parrot_find_encoding_by_string(interp, encoding_str);
    return Parrot_ascii_encoding_ptr;
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

