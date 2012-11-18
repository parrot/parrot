/*
Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

src/io/userhandle.c - IO_VTABLE and helpers for user-defined types

=head1 DESCRIPTION

This file implements the IO_VTABLE for user-defined types. It is not currently
used.

=head2 IO_VTABLE Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "userhandle.str"

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void io_userhandle_adv_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    size_t len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_userhandle_close(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_userhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE * io_userhandle_get_encoding(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_userhandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOHANDLE io_userhandle_get_piohandle(PARROT_INTERP,
    ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOOFF_T io_userhandle_get_position(PARROT_INTERP,
    ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_userhandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_userhandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_userhandle_open(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *path),
    INTVAL flags,
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle);

static INTVAL io_userhandle_read_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGOUT(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

static PIOOFF_T io_userhandle_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_userhandle_set_eof(PARROT_INTERP,
    ARGMOD(PMC *handle),
    INTVAL is_set)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_userhandle_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void io_userhandle_set_position(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T pos)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static PIOOFF_T io_userhandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static size_t io_userhandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_userhandle_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

#define ASSERT_ARGS_io_userhandle_adv_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_get_piohandle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_get_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_is_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_is_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_io_userhandle_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_userhandle_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_set_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_total_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_userhandle_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void io_userhandle_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable, INTVAL
idx)>

Setup the IO_VTABLE for custom user-defined types.

=cut.

*/

void
io_userhandle_setup_vtable(PARROT_INTERP, ARGMOD_NULLOK(IO_VTABLE *vtable), INTVAL idx)
{
    ASSERT_ARGS(io_userhandle_setup_vtable)
    if (vtable == NULL)
        vtable = IO_EDITABLE_IO_VTABLE(interp, idx);
    vtable->number = idx;
    vtable->name = "User Handle Type";
    vtable->read_b = io_userhandle_read_b;
    vtable->write_b = io_userhandle_write_b;
    vtable->flush = io_userhandle_flush;
    vtable->is_eof = io_userhandle_is_eof;
    vtable->tell = io_userhandle_tell;
    vtable->seek = io_userhandle_seek;
    vtable->open = io_userhandle_open;
    vtable->is_open = io_userhandle_is_open;
    vtable->close = io_userhandle_close;
    vtable->get_encoding = io_userhandle_get_encoding;
    vtable->set_flags = io_userhandle_set_flags;
    vtable->get_flags = io_userhandle_get_flags;
    vtable->total_size = io_userhandle_total_size;
    vtable->get_piohandle = io_userhandle_get_piohandle;
    Parrot_hash_put(interp, interp->piodata->vtable_map, enum_class_Object, vtable);
}

/*

=item C<static INTVAL io_userhandle_read_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Read the given number of bytes from the C<handle>. Does some bookkeeping and
redirects to C<Parrot_io_internal_read>. Returns the number of bytes read.

=cut

*/

static INTVAL
io_userhandle_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_userhandle_read_b)
    STRING * result = STRINGNULL;
    INTVAL bytes_read;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "read"),
            "I->S", byte_length, &result);
    bytes_read = byte_length < result->bufused ? byte_length : result->bufused;
    memcpy(buffer, result->strstart, bytes_read);
    return bytes_read;
}

/*

=item C<static INTVAL io_userhandle_write_b(PARROT_INTERP, PMC *handle, char
*buffer, size_t byte_length)>

Write the given bytes to the file descriptor. Redirect to
C<Parrot_io_internal_write>. Return the number of bytes written.

=cut

*/

static INTVAL
io_userhandle_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_userhandle_write_b)
    STRING * const str = Parrot_str_new(interp, buffer, byte_length);
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "write"),
            "S->I", str, &result);
    return result;
}

/*

=item C<static INTVAL io_userhandle_flush(PARROT_INTERP, PMC *handle)>

Flush the handle at the OS level.

=cut

*/

static INTVAL
io_userhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_flush)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "flush"),
            "->I", &result);
    return result;
}

/*

=item C<static INTVAL io_userhandle_is_eof(PARROT_INTERP, PMC *handle)>

Determine if this handle as at end-of-file.

=item C<static void io_userhandle_set_eof(PARROT_INTERP, PMC *handle, INTVAL
is_set)>

Set or clear the EOF flag.

=cut

*/

static INTVAL
io_userhandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_is_eof)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "is_eof"),
            "->I", &result);
    return result;
}

static void
io_userhandle_set_eof(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL is_set)
{
    ASSERT_ARGS(io_userhandle_set_eof)
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "set_eof"),
            "I->", is_set);
}

/*

=item C<static PIOOFF_T io_userhandle_tell(PARROT_INTERP, PMC *handle)>

Get the current offset of the file descriptor.

=cut

*/

static PIOOFF_T
io_userhandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_tell)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "tell"),
            "->I", &result);
    return (PIOOFF_T)result;
}

/*

=item C<static PIOOFF_T io_userhandle_seek(PARROT_INTERP, PMC *handle, PIOOFF_T
offset, INTVAL whence)>

Perform a seek on the file descriptor. C<whence> is one of C<SEEK_SET>,
C<SEEK_CUR> or C<SEEK_END>.

=cut

*/

static PIOOFF_T
io_userhandle_seek(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T offset, INTVAL whence)
{
    ASSERT_ARGS(io_userhandle_seek)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "seek"),
            "II->I", offset, whence, &result);
    return (PIOOFF_T)result;
}

/*

=item C<static void io_userhandle_adv_position(PARROT_INTERP, PMC *handle,
size_t len)>

Advance the in-memory file position of the userhandle PMC by a given number of
bytes.

=item C<static void io_userhandle_set_position(PARROT_INTERP, PMC *handle,
PIOOFF_T pos)>

Set the in-memory file position of the userhandle PMC.

=item C<static PIOOFF_T io_userhandle_get_position(PARROT_INTERP, PMC *handle)>

Get the current in-memory offset from the userhandle.

=cut

*/

static void
io_userhandle_adv_position(PARROT_INTERP, ARGMOD(PMC *handle), size_t len)
{
    ASSERT_ARGS(io_userhandle_adv_position)
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "adv_position"),
            "I->", len);
}

static void
io_userhandle_set_position(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T pos)
{
    ASSERT_ARGS(io_userhandle_set_position)
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "set_position"),
            "I->", pos);
}

static PIOOFF_T
io_userhandle_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_get_position)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "get_position"),
            "->I", &result);
    return (PIOOFF_T) result;
}

/*

=item C<static INTVAL io_userhandle_open(PARROT_INTERP, PMC *handle, STRING
*path, INTVAL flags, STRING *mode)>

Open the userhandle for the operation specified by C<flags> and the C<path>.

=cut

*/

static INTVAL
io_userhandle_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags,
        ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_userhandle_open)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "open"),
            "SIS->I", path, flags, mode, &result);
    return result;
}

/*

=item C<static INTVAL io_userhandle_is_open(PARROT_INTERP, PMC *handle)>

Determine if the userhandle is currently open.

=cut

*/

static INTVAL
io_userhandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_is_open)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "is_open"),
            "->I", &result);
    return result;
}

/*

=item C<static INTVAL io_userhandle_close(PARROT_INTERP, PMC *handle)>

Close the userhandle, if it's open.

=cut

*/

static INTVAL
io_userhandle_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_close)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "close"),
            "->I", &result);
    return result;
}

/*

=item C<static const STR_VTABLE * io_userhandle_get_encoding(PARROT_INTERP, PMC
*handle)>

Get the current encoding of the userhandle.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const STR_VTABLE *
io_userhandle_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_get_encoding)
    STRING * result = STRINGNULL;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "get_encoding"),
            "->S", &result);
    return Parrot_find_encoding_by_string(interp, result);
}

/*

=item C<static void io_userhandle_set_flags(PARROT_INTERP, PMC *handle, INTVAL
flags)>

Set the mode flags on the userhandle.

=item C<static INTVAL io_userhandle_get_flags(PARROT_INTERP, PMC *handle)>

Get the mode flags from the userhandle.

=cut

*/

static void
io_userhandle_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(io_userhandle_set_flags)
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "set_flags"),
            "->I", flags);
}

static INTVAL
io_userhandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_get_flags)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "get_flags"),
            "->I", &result);
    return result;
}

/*

=item C<static size_t io_userhandle_total_size(PARROT_INTERP, PMC *handle)>

Determine the total on-disk size of the file.

=cut

*/

static size_t
io_userhandle_total_size(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_total_size)
    INTVAL result;
    Parrot_pcc_invoke_method_from_c_args(interp, handle, CONST_STRING(interp, "total_size"),
            "->I", &result);
    return (size_t) result;
}

/*

=item C<static PIOHANDLE io_userhandle_get_piohandle(PARROT_INTERP, PMC
*handle)>

Get the file descriptor.

=cut

*/

static PIOHANDLE
io_userhandle_get_piohandle(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_get_piohandle)
    return PIO_INVALID_HANDLE;
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
