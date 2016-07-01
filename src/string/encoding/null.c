/*
Copyright (C) 2010, Parrot Foundation.

=head1 NAME

src/string/encoding/null.c

=head1 DESCRIPTION

This file implements encoding functions for the null string.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "shared.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static INTVAL null_compare(PARROT_INTERP,
    const STRING *lhs,
    ARGIN(const STRING *rhs))
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static INTVAL null_equal(PARROT_INTERP,
    const STRING *lhs,
    ARGIN(const STRING *rhs))
        __attribute__nonnull__(3);

static void null_error(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static size_t null_hash(PARROT_INTERP, const STRING *s, size_t hashval);

#define ASSERT_ARGS_null_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rhs))
#define ASSERT_ARGS_null_equal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rhs))
#define ASSERT_ARGS_null_error __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_null_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static void null_error(PARROT_INTERP)>

Generic encoding function for null strings that throws an exception.

=cut

*/

static void
null_error(PARROT_INTERP)
{
    ASSERT_ARGS(null_error)

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
        "Invalid operation on null string");
}


/*

=item C<static INTVAL null_equal(PARROT_INTERP, const STRING *lhs, const STRING
*rhs)>

Compares two STRINGs, C<lhs> and C<rhs>. If STRING C<lhs> == C<rhs>,
returns 1. If C<lhs> != C<rhs> returns 0.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
null_equal(SHIM_INTERP, SHIM(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(null_equal)

    return STRING_length(rhs) == 0;
}


/*

=item C<static INTVAL null_compare(PARROT_INTERP, const STRING *lhs, const
STRING *rhs)>

Compares two STRINGs, C<lhs> and C<rhs>. Returns -1 if C<lhs> < C<rhs>. Returns
0 if C<lhs> = C<rhs>. Returns 1 if C<lhs> > C<rhs>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static INTVAL
null_compare(SHIM_INTERP, SHIM(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(null_compare)

    return STRING_length(rhs) ? -1 : 0;
}


/*

=item C<static size_t null_hash(PARROT_INTERP, const STRING *s, size_t hashval)>

Returns the hashed value of the string, given a seed in hashval.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
null_hash(SHIM_INTERP, SHIM(const STRING *s), size_t hashval)
{
    ASSERT_ARGS(null_hash)

    return hashval;
}


static STR_VTABLE Parrot_null_encoding = {
    -1,
    "null",
    NULL,
    1, /* Bytes per unit */
    1, /* Max bytes per codepoint */

    (str_vtable_to_encoding_t)null_error,
    (str_vtable_chr_t)null_error,

    null_equal,
    null_compare,
    (str_vtable_index_t)null_error,
    (str_vtable_rindex_t)null_error,
    null_hash,

    (str_vtable_scan_t)null_error,
    (str_vtable_partial_scan_t)null_error,
    (str_vtable_ord_t)null_error,
    (str_vtable_substr_t)null_error,

    (str_vtable_is_cclass_t)null_error,
    (str_vtable_find_cclass_t)null_error,
    (str_vtable_find_not_cclass_t)null_error,

    (str_vtable_get_graphemes_t)null_error,
    (str_vtable_compose_t)null_error,
    (str_vtable_decompose_t)null_error,

    (str_vtable_upcase_t)null_error,
    (str_vtable_downcase_t)null_error,
    (str_vtable_titlecase_t)null_error,
    (str_vtable_upcase_first_t)null_error,
    (str_vtable_downcase_first_t)null_error,
    (str_vtable_titlecase_first_t)null_error,

    (str_vtable_iter_get_t)null_error,
    (str_vtable_iter_skip_t)null_error,
    (str_vtable_iter_get_and_advance_t)null_error,
    (str_vtable_iter_set_and_advance_t)null_error
};

STR_VTABLE *Parrot_null_encoding_ptr = &Parrot_null_encoding;


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

