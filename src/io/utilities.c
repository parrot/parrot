/*
Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

src/io/core.c - I/O subsystem core functions

=head1 DESCRIPTION

Core functions for initializing and destroying the I/O subsystem within an
interpreter.

=head2 Resource Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* HEADERIZER HFILE: include/parrot/io.h */

/*
        The standard streams are:

                interp->piodata->table[PIO_STD*_FILENO].
*/

/*

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
          case 'b':
            flags |= PIO_F_BINARY;
            break;
          default:
            break;
        }
    }

    return flags;
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
io_get_new_filehandle(PARROT_INTERP)
{
    ASSERT_ARGS(io_get_new_filehandle)
    const INTVAL typenum = Parrot_hll_get_ctx_HLL_type(interp,
                                                        enum_class_FileHandle);
    return Parrot_pmc_new(interp, typenum);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_get_new_empty_string(PARROT_INTERP, STR_VTABLE *encoding, size_t char_length)
{
    ASSERT_ARGS(io_get_new_empty_string)
    STRING * result;

    /* Round up length to unit size of encoding */
    size_t byte_length;
    if (encoding->bytes_per_unit > 1)
        byte_length = (length + encoding->bytes_per_unit - 1) &
                      ~(encoding->bytes_per_unit - 1);
    else
        byte_length = char_length;

    /* Allocate 3 bytes more for partial multi-byte characters */
    result           = Parrot_str_new_noinit(interp, byte_length + 3);
    result->encoding = encoding;
    return result;
}

void
io_verify_is_open_for(PARROT_INTERP, ARGIN(PMC *handle), ARGIN(IO_VTABLE *vtable), INTVAL flags)
{
    ASSERT_ARGS(io_is_open_for)
    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot read from a closed %s", vtable->name);
    if ((vtable->get_flags(interp, handle) & flags) != flags)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot read from a non-readable %s", vtable->name);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
io_verify_string_encoding(PARROT_INTERP, ARGIN(PMC *handle), ARGIN(IO_VTABLE *vtable), ARGIN(STRING *s))
{
    ASSERT_ARGS(io_verify_string_encoding)
    STR_VTABLE * const encoding = vtable->get_encoding(interp, handle);
    if (encoding == NULL || encoding == s->encoding || encoding == Parrot_binary_encoding_ptr)
        return s;
    return encoding->to_encoding(interp, s);
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
