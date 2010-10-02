/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/binary.c

=head1 DESCRIPTION

This file implements encoding functions for binary strings.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "shared.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static STRING* binary_change_case(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING * binary_chr(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

static INTVAL binary_find_cclass(SHIM_INTERP,
    SHIM(INTVAL flags),
    SHIM(const STRING *src),
    UINTVAL offset,
    UINTVAL count);

static INTVAL binary_find_not_cclass(SHIM_INTERP,
    SHIM(INTVAL flags),
    SHIM(const STRING *src),
    UINTVAL offset,
    UINTVAL count);

static INTVAL binary_is_cclass(SHIM_INTERP,
    SHIM(INTVAL flags),
    SHIM(const STRING *src),
    SHIM(UINTVAL offset));

PARROT_CANNOT_RETURN_NULL
static STRING* binary_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL binary_validate(SHIM_INTERP, SHIM(const STRING *src));
#define ASSERT_ARGS_binary_change_case __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_binary_chr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_binary_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_binary_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_binary_is_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_binary_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_binary_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    Parrot_ex_throw_from_c_args(interp, NULL, (err), (str))


/*

=item C<static STRING* binary_to_encoding(PARROT_INTERP, const STRING *src)>

Converts the STRING C<src> to STRING C<dest> in binary mode.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
binary_to_encoding(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(binary_to_encoding)
    STRING      *dest;

    dest           = Parrot_str_clone(interp, src);
    dest->encoding = Parrot_binary_encoding_ptr;
    dest->strlen   = dest->bufused;
    dest->hashval  = 0;

    return dest;
}


/*

=item C<static STRING * binary_chr(PARROT_INTERP, UINTVAL codepoint)>

Creates a new STRING object from a single codepoint C<codepoint>. Returns
the new STRING.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
binary_chr(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(binary_chr)
    char real_codepoint = (char)codepoint;
    return Parrot_str_new_init(interp, &real_codepoint, 1,
            Parrot_binary_encoding_ptr, 0);
}


/*

=item C<static UINTVAL binary_validate(PARROT_INTERP, const STRING *src)>

Returns 1. All sequential data is valid binary data.

=cut

*/

/* Binary's always valid */
static UINTVAL
binary_validate(SHIM_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(binary_validate)
    return 1;
}


/*

=item C<static INTVAL binary_is_cclass(PARROT_INTERP, INTVAL flags, const STRING
*src, UINTVAL offset)>

Returns Boolean.

=cut

*/

static INTVAL
binary_is_cclass(SHIM_INTERP, SHIM(INTVAL flags), SHIM(const STRING *src), SHIM(UINTVAL offset))
{
    ASSERT_ARGS(binary_is_cclass)
    return 0;
}


/*

=item C<static INTVAL binary_find_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Find a character in the given character class.

=cut

*/

static INTVAL
binary_find_cclass(SHIM_INTERP, SHIM(INTVAL flags),
            SHIM(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(binary_find_cclass)
    return offset + count;
}


/*

=item C<static INTVAL binary_find_not_cclass(PARROT_INTERP, INTVAL flags, const
STRING *src, UINTVAL offset, UINTVAL count)>

Returns C<INTVAL>.

=cut

*/

static INTVAL
binary_find_not_cclass(SHIM_INTERP, SHIM(INTVAL flags),
               SHIM(const STRING *src), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(binary_find_not_cclass)
    return offset;
}


/*

=item C<static STRING* binary_change_case(PARROT_INTERP, const STRING *src)>

Throws an exception because we cannot change case of a binary string.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
binary_change_case(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(binary_change_case)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't change case of binary data");
}


static STR_VTABLE Parrot_binary_encoding = {
    0,
    "binary",
    NULL,
    1, /* Max bytes per codepoint */

    binary_to_encoding,
    binary_chr,

    fixed8_equal,
    fixed8_compare,
    fixed8_index,
    fixed8_rindex,
    fixed8_hash,
    binary_validate,

    fixed8_scan,
    fixed8_ord,
    fixed_substr,

    binary_is_cclass,
    binary_find_cclass,
    binary_find_not_cclass,

    encoding_get_graphemes,
    fixed8_compose,
    encoding_decompose,

    binary_change_case,
    binary_change_case,
    binary_change_case,
    binary_change_case,
    binary_change_case,
    binary_change_case,

    fixed8_iter_get,
    fixed8_iter_skip,
    fixed8_iter_get_and_advance,
    fixed8_iter_set_and_advance,
    fixed8_iter_set_position
};

STR_VTABLE *Parrot_binary_encoding_ptr = &Parrot_binary_encoding;


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
