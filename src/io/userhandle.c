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

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

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

static INTVAL io_userhandle_seek(PARROT_INTERP,
    ARGMOD(PMC *handle),
    PIOOFF_T offset,
    INTVAL whence)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_userhandle_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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
#define ASSERT_ARGS_io_userhandle_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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

static PMC *
execute_accessor_int_pmc(PARROT_INTERP, ARGMOD(PMC * user), ARGIN(string * name),
        INTVAL state)
{
    ASSERT_ARGS(execute_accessor_pmc)
    Hash * const accessors = PARROT_USERHANDLE(user)->accessors;
    PMC * value = PMCNULL;
    PMC * const acc = Parrot_hash_get(interp, accessors, name);
    if (PMC_IS_NULL(acc))
        return PMCNULL;

    Parrot_pcc_invoke_method_obj_from_c_args(interp, user, acc, "I->P", state, &value);
    return value;
}

static STRING *
execute_accessor_int_str(PARROT_INTERP, ARGMOD(PMC * user), ARGIN(string * name),
        INTVAL state)
{
    ASSERT_ARGS(execute_accessor_str)
    Hash * const accessors = PARROT_USERHANDLE(user)->accessors;
    STRING * value = STRINGNULL;
    PMC * const acc = Parrot_hash_get(interp, accessors, name);
    if (PMC_IS_NULL(acc))
        return PMCNULL;

    Parrot_pcc_invoke_method_obj_from_c_args(interp, user, acc, "I->S", state, &value);
    return value;
}

static INTVAL
execute_accessor_str_int(PARROT_INTERP, ARGMOD(PMC * user), ARGIN(string * name),
        ARGIN(STRING * state))
{
    ASSERT_ARGS(execute_accessor_int)
    Hash * const accessors = PARROT_USERHANDLE(user)->accessors;
    INTVAL value = 0;
    PMC * const acc = Parrot_hash_get(interp, accessors, name);
    if (PMC_IS_NULL(acc))
        return PMCNULL;

    Parrot_pcc_invoke_method_obj_from_c_args(interp, user, acc, "S->I", state, &value);
    return value;
}

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
    STRING * const data = execute_accessor_int_str(interp, handle, "read_b", byte_length);
    INTVAL bytes_read = data->bufused < byte_length ? data->bufused : byte_length;
    memcpy(buffer, data->bufstart, bytes_read);
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
    STRING * const temp = Parrot_str_new(interp, buffer, byte_length);
    return execute_accessor_str_int(interp, handle, "write_b", temp);
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
    return execute_accessor_int(interp, handle, "flush");
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
    return execute_accessor_int(interp, handle, "is_eof");
}

static void
io_userhandle_set_eof(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL is_set)
{
    ASSERT_ARGS(io_userhandle_set_eof)
    execute_accessor_int_int(interp, handle, "set_eof", is_set);
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
    return (PIOOFF_T)execute_accessor_int(interp, handle, "tell");
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
    return (PIOOFF_T)execute_accessor_int_int_int(interp, handle, "seek", offset, whence);
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
    execute_accessor_int_void(interp, handle, "adv_position", len);
}

static void
io_userhandle_set_position(PARROT_INTERP, ARGMOD(PMC *handle), PIOOFF_T pos)
{
    ASSERT_ARGS(io_userhandle_set_position)
    execute_accessor_int_void(interp, handle, "set_position", pos);
}

static PIOOFF_T
io_userhandle_get_position(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_get_position)
    execute_accessor_int(interp, handle, "get_position");
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
    return execute_accessor_str_int_str_int(interp, handle, "open", path, flags, mode);
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
    return execute_accessor_int(interp, handle, "is_open");
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
    return execute_accessor_int(interp, handle, "close");
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
    // TODO: This
    return NULL;
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
    execute_accessor_int_void(interp, handle, "set_flags", flags);
}

static INTVAL
io_userhandle_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_userhandle_get_flags)
    return execute_accessor_int(interp, handle, "get_flags");
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
    return execute_accessor_int(interp, handle, "total_size");
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
    return (PIOHANDLE) PIO_INVALID_HANDLE;
}

/*

=item C<void io_userhandle_set_os_handle(PARROT_INTERP, PMC *userhandle,
PIOHANDLE file_descriptor)>

Sets the C<os_handle> attribute of the userhandle object, which stores the
low-level userhandle for the OS.

Currently, this pokes directly into the C struct of the userhandle PMC. This
needs to change to a general interface that can be used by all subclasses and
polymorphic equivalents of userhandle. For now, hiding it behind a function, so
it can be cleanly changed later.

Possibly, this function should reset some characteristics of the object (like
buffer and file positions) to their default values.

=cut

*/

void
io_userhandle_set_os_handle(SHIM_INTERP, ARGMOD(PMC *userhandle), PIOHANDLE file_descriptor)
{
    ASSERT_ARGS(io_userhandle_set_os_handle)
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
