/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/charset/binary.c

=head1 DESCRIPTION

This file implements the charset functions for binary data

=over 4

=cut

*/

#include "parrot/parrot.h"

/* In local src/charset/ directory */
#include "ascii.h"
#include "binary.h"

/* HEADERIZER HFILE: src/charset/binary.h */

/* HEADERIZER BEGIN: static */

static INTVAL compare(SHIM_INTERP,
    SHIM(const STRING *lhs),
    SHIM(const STRING *rhs));

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
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void upcase(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static void upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static UINTVAL validate(SHIM_INTERP, SHIM(STRING *source_string));
/* HEADERIZER END: static */

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    real_exception(interp, NULL, err, str)

/*

=item C<static void set_graphemes>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_graphemes(PARROT_INTERP, ARGIN(STRING *source_string),
        UINTVAL offset, UINTVAL replace_count, ARGMOD(STRING *insert_string))
{
    ENCODING_SET_BYTES(interp, source_string, offset,
            replace_count, insert_string);
}

/*

=item C<static STRING* to_charset>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
to_charset(PARROT_INTERP, ARGIN(STRING *src), ARGIN_NULLOK(STRING *dest))
{
    charset_converter_t conversion_func =
        Parrot_find_charset_converter(interp, src->charset, Parrot_binary_charset_ptr);

    if (conversion_func)
         return conversion_func(interp, src, dest);
    real_exception(interp, NULL, UNIMPLEMENTED, "to_charset for binary not implemented");
}

/*

=item C<static STRING* compose>

RT#48260: Not yet documented!!!

=cut

*/

/* A err. can't compose binary */
PARROT_CANNOT_RETURN_NULL
static STRING*
compose(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't compose binary data");
}

/*

=item C<static STRING* decompose>

RT#48260: Not yet documented!!!

=cut

*/

/* A err. can't decompose binary */
PARROT_CANNOT_RETURN_NULL
static STRING*
decompose(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't decompose binary data");
}

/*

=item C<static void upcase>

RT#48260: Not yet documented!!!

=cut

*/

static void
upcase(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

/*

=item C<static void downcase>

RT#48260: Not yet documented!!!

=cut

*/

static void
downcase(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

/*

=item C<static void titlecase>

RT#48260: Not yet documented!!!

=cut

*/

static void
titlecase(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

/*

=item C<static void upcase_first>

RT#48260: Not yet documented!!!

=cut

*/

static void
upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

/*

=item C<static void downcase_first>

RT#48260: Not yet documented!!!

=cut

*/

static void
downcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

/*

=item C<static void titlecase_first>

RT#48260: Not yet documented!!!

=cut

*/

static void
titlecase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

/*

=item C<static INTVAL compare>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
compare(SHIM_INTERP, SHIM(const STRING *lhs), SHIM(const STRING *rhs))
{
    return 0;
}

/*

=item C<static INTVAL cs_index>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
cs_index(SHIM_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), SHIM(UINTVAL offset))
{
    return -1;
}

/*

=item C<static INTVAL cs_rindex>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
cs_rindex(SHIM_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), SHIM(UINTVAL offset))
{
    return -1;
}

/*

=item C<static UINTVAL validate>

RT#48260: Not yet documented!!!

=cut

*/

/* Binary's always valid */
static UINTVAL
validate(SHIM_INTERP, SHIM(STRING *source_string))
{
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
    STRING *return_string;
    char real_codepoint = (char)codepoint;
    return_string = string_make(interp, &real_codepoint, 1, "binary", 0);
    return return_string;
}


/*

=item C<const CHARSET * Parrot_charset_binary_init>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
const CHARSET *
Parrot_charset_binary_init(PARROT_INTERP)
{
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

    STRUCT_COPY(return_set, &base_set);
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
