/*
Copyright (C) 2004-2008, The Perl Foundation.
$Id$

=head1 NAME

src/string/charset/binary.c

=head1 DESCRIPTION

This file implements the charset functions for binary data

=over 4

=cut

*/

#include "parrot/parrot.h"

/* In local src/charset/ directory */
#include "ascii.h"
#include "binary.h"

/* HEADERIZER HFILE: src/string/charset/binary.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL compare(SHIM_INTERP,
    ARGIN(const STRING *lhs),
    ARGIN(const STRING *rhs))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING* compose(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static INTVAL cs_index(SHIM_INTERP,
    SHIM(STRING *source_string),
    SHIM(STRING *search_string),
    SHIM(UINTVAL offset));

static INTVAL cs_rindex(SHIM_INTERP,
    SHIM(STRING *source_string),
    SHIM(STRING *search_string),
    SHIM(UINTVAL offset));

PARROT_CANNOT_RETURN_NULL
static STRING* decompose(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static void downcase(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static void downcase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static INTVAL find_cclass(SHIM_INTERP,
    SHIM(INTVAL flags),
    SHIM(STRING *source_string),
    UINTVAL offset,
    UINTVAL count);

static INTVAL find_not_cclass(SHIM_INTERP,
    SHIM(INTVAL flags),
    SHIM(STRING *source_string),
    UINTVAL offset,
    UINTVAL count);

static INTVAL is_cclass(SHIM_INTERP,
    SHIM(INTVAL flags),
    SHIM(const STRING *source_string),
    SHIM(UINTVAL offset));

static void set_graphemes(PARROT_INTERP,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL replace_count,
    ARGMOD(STRING *insert_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*insert_string);

PARROT_CANNOT_RETURN_NULL
static STRING * string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
        __attribute__nonnull__(1);

static void titlecase(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static void titlecase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STRING* to_charset(PARROT_INTERP,
    ARGIN(STRING *src),
    ARGIN_NULLOK(STRING *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void upcase(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static void upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static UINTVAL validate(SHIM_INTERP, SHIM(STRING *source_string));
#define ASSERT_ARGS_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(lhs) \
    || PARROT_ASSERT_ARG(rhs)
#define ASSERT_ARGS_compose __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_cs_index __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_cs_rindex __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_decompose __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_downcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_is_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_set_graphemes __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(source_string) \
    || PARROT_ASSERT_ARG(insert_string)
#define ASSERT_ARGS_string_from_codepoint __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_titlecase __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_titlecase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_to_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(src)
#define ASSERT_ARGS_upcase __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_upcase_first __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    Parrot_ex_throw_from_c_args(interp, NULL, (err), (str))

/*

=item C<static void set_graphemes>

Sets the graphemes for STRING C<source_string>, starting at offset
C<offset>. Replaces C<replace_count> graphemes from STRING
C<insert_string>.

=cut

*/

static void
set_graphemes(PARROT_INTERP, ARGIN(STRING *source_string),
        UINTVAL offset, UINTVAL replace_count, ARGMOD(STRING *insert_string))
{
    ASSERT_ARGS(set_graphemes)
    ENCODING_SET_BYTES(interp, source_string, offset,
            replace_count, insert_string);
}

/*

=item C<static STRING* to_charset>

Converts the STRING C<src> to STRING C<dest> in binary mode. Throws
an exception if a suitable conversion function is not found.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
to_charset(PARROT_INTERP, ARGIN(STRING *src), ARGIN_NULLOK(STRING *dest))
{
    ASSERT_ARGS(to_charset)
    charset_converter_t conversion_func =
        Parrot_find_charset_converter(interp, src->charset, Parrot_binary_charset_ptr);

    if (conversion_func)
         return conversion_func(interp, src, dest);

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "to_charset for binary not implemented");
}

/*

=item C<static STRING* compose>

Throws an exception because we cannot compose a binary string.

=cut

*/

/* A err. can't compose binary */
PARROT_CANNOT_RETURN_NULL
static STRING*
compose(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(compose)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't compose binary data");
}

/*

=item C<static STRING* decompose>

Throws an exception because we cannot decompose a binary string.

=cut

*/

/* A err. can't decompose binary */
PARROT_CANNOT_RETURN_NULL
static STRING*
decompose(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(decompose)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't decompose binary data");
}

/*

=item C<static void upcase>

Throws an exception because we cannot convert a binary string to
upper case.

=cut

*/

static void
upcase(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(upcase)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't upcase binary data");
}

/*

=item C<static void downcase>

Throws an exception because we cannot convert a binary string to
lower-case.

=cut

*/

static void
downcase(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(downcase)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't downcase binary data");
}

/*

=item C<static void titlecase>

Throws an exception because we cannot convert a binary string to
title case.

=cut

*/

static void
titlecase(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(titlecase)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't titlecase binary data");
}

/*

=item C<static void upcase_first>

Throws an exception because we cannot set the first "character" of the
binary string to uppercase.

=cut

*/

static void
upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(upcase_first)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't upcase binary data");
}

/*

=item C<static void downcase_first>

Throws an exception because we cannot set the first "character"
of the binary string to lowercase.

=cut

*/

static void
downcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(downcase_first)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't downcase binary data");
}

/*

=item C<static void titlecase_first>

Throws an exception because we can't convert the first "character"
of binary data to title case.

=cut

*/

static void
titlecase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(titlecase_first)
    EXCEPTION(EXCEPTION_INVALID_CHARTYPE, "Can't titlecase binary data");
}

/*

=item C<static INTVAL compare>

Compare the two buffers, first by size, then with memcmp.

=cut

*/

static INTVAL
compare(SHIM_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs))
{
    ASSERT_ARGS(compare)
    const UINTVAL l_len = lhs->strlen;
    const UINTVAL r_len = rhs->strlen;
    if (l_len != r_len)
        return l_len - r_len;

    return memcmp(lhs->strstart, rhs->strstart, l_len);
}

/*

=item C<static INTVAL cs_index>

Returns -1. It makes no sense to try and search for a substring in
raw binary data.

=cut

*/

static INTVAL
cs_index(SHIM_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), SHIM(UINTVAL offset))
{
    ASSERT_ARGS(cs_index)
    return -1;
}

/*

=item C<static INTVAL cs_rindex>

Returns -1. It makes no sense to search for the last substring match
in raw binary data.

=cut

*/

static INTVAL
cs_rindex(SHIM_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), SHIM(UINTVAL offset))
{
    ASSERT_ARGS(cs_rindex)
    return -1;
}

/*

=item C<static UINTVAL validate>

Returns 1. All sequential data is valid binary data.

=cut

*/

/* Binary's always valid */
static UINTVAL
validate(SHIM_INTERP, SHIM(STRING *source_string))
{
    ASSERT_ARGS(validate)
    return 1;
}

/*

=item C<static INTVAL is_cclass>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
is_cclass(SHIM_INTERP, SHIM(INTVAL flags), SHIM(const STRING *source_string),
        SHIM(UINTVAL offset))
{
    ASSERT_ARGS(is_cclass)
    return 0;
}

/*

=item C<static INTVAL find_cclass>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
find_cclass(SHIM_INTERP, SHIM(INTVAL flags),
            SHIM(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_cclass)
    return offset + count;
}

/*

=item C<static INTVAL find_not_cclass>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
find_not_cclass(SHIM_INTERP, SHIM(INTVAL flags),
               SHIM(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(find_not_cclass)
    return offset + count;
}

/*

=item C<static STRING * string_from_codepoint>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
{
    ASSERT_ARGS(string_from_codepoint)
    STRING *return_string;
    char real_codepoint = (char)codepoint;
    return_string = string_make(interp, &real_codepoint, 1, "binary", 0);
    return return_string;
}


/*

=item C<const CHARSET * Parrot_charset_binary_init>

Initialize the binary charset, including function pointers and
settings.

=cut

*/

PARROT_CANNOT_RETURN_NULL
const CHARSET *
Parrot_charset_binary_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_charset_binary_init)
    CHARSET * const return_set = Parrot_new_charset(interp);
    static const CHARSET base_set = {
        "binary",
        ascii_get_graphemes,
        ascii_get_graphemes_inplace,
        set_graphemes,
        to_charset,
        compose,
        decompose,
        upcase,
        downcase,
        titlecase,
        upcase_first,
        downcase_first,
        titlecase_first,
        compare,
        cs_index,
        cs_rindex,
        validate,
        is_cclass,
        find_cclass,
        find_not_cclass,
        string_from_codepoint,
        ascii_compute_hash,
        NULL
    };

    STRUCT_COPY_FROM_STRUCT(return_set, base_set);
    return_set->preferred_encoding = Parrot_fixed_8_encoding_ptr;
    Parrot_register_charset(interp, "binary", return_set);
    return return_set;

}

/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
