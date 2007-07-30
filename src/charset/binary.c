/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/charset/binary.c

=head1 DESCRIPTION

This file implements the charset functions for binary data

=cut

*/

#include "parrot/parrot.h"

/* In local src/charset/ directory */
#include "ascii.h"
#include "binary.h"

/* HEADERIZER HFILE: src/charset/binary.h */

/* HEADERIZER BEGIN: static */

static INTVAL compare( PARROT_INTERP,
    SHIM(const STRING *lhs),
    SHIM(const STRING *rhs) )
        __attribute__nonnull__(1);

static STRING* compose( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static INTVAL cs_index( PARROT_INTERP,
    SHIM(STRING *source_string),
    SHIM(STRING *search_string),
    UINTVAL offset )
        __attribute__nonnull__(1);

static INTVAL cs_rindex( PARROT_INTERP,
    SHIM(STRING *source_string),
    SHIM(STRING *search_string),
    UINTVAL offset )
        __attribute__nonnull__(1);

static STRING* decompose( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static void downcase( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static void downcase_first( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static INTVAL find_cclass( PARROT_INTERP,
    INTVAL flags,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL find_not_cclass( PARROT_INTERP,
    INTVAL flags,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static INTVAL is_cclass( PARROT_INTERP,
    INTVAL flags,
    SHIM(STRING *source_string),
    UINTVAL offset )
        __attribute__nonnull__(1);

static void set_graphemes( PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL replace_count,
    NOTNULL(STRING *insert_string) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

static STRING * string_from_codepoint( PARROT_INTERP, UINTVAL codepoint )
        __attribute__nonnull__(1);

static void titlecase( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static void titlecase_first( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static STRING* to_charset( PARROT_INTERP,
    NOTNULL(STRING *src),
    NOTNULL(STRING *dest) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void upcase( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static void upcase_first( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

static UINTVAL validate( PARROT_INTERP, SHIM(STRING *source_string) )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    real_exception(interp, NULL, err, str)

static void
set_graphemes(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL replace_count, NOTNULL(STRING *insert_string))
{
    ENCODING_SET_BYTES(interp, source_string, offset,
            replace_count, insert_string);
}

static STRING*
to_charset(PARROT_INTERP, NOTNULL(STRING *src), NOTNULL(STRING *dest))
{
    charset_converter_t conversion_func =
        Parrot_find_charset_converter(interp, src->charset, Parrot_binary_charset_ptr);

    if (conversion_func)
         return conversion_func(interp, src, dest);
    real_exception(interp, NULL, UNIMPLEMENTED, "to_charset for binary not implemented");
}

/* A err. can't compose binary */
static STRING*
compose(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't compose binary data");
}

/* A err. can't decompose binary */
static STRING*
decompose(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't decompose binary data");
}

static void
upcase(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

static void
downcase(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

static void
titlecase(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

static void
upcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

static void
downcase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

static void
titlecase_first(PARROT_INTERP, SHIM(STRING *source_string))
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

static INTVAL
compare(PARROT_INTERP, SHIM(const STRING *lhs), SHIM(const STRING *rhs))
{
    return 0;
}

static INTVAL
cs_index(PARROT_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), UINTVAL offset)
{
    return -1;
}

static INTVAL
cs_rindex(PARROT_INTERP, SHIM(STRING *source_string),
        SHIM(STRING *search_string), UINTVAL offset)
{
    return -1;
}

/* Binary's always valid */
static UINTVAL
validate(PARROT_INTERP, SHIM(STRING *source_string))
{
    return 1;
}

static INTVAL
is_cclass(PARROT_INTERP, INTVAL flags, SHIM(STRING *source_string), UINTVAL offset)
{
    return 0;
}

static INTVAL
find_cclass(PARROT_INTERP, INTVAL flags,
            NOTNULL(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    return offset + count;
}

static INTVAL
find_not_cclass(PARROT_INTERP, INTVAL flags,
                NOTNULL(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    return offset + count;
}

static STRING *
string_from_codepoint(PARROT_INTERP, UINTVAL codepoint)
{
    STRING *return_string;
    char real_codepoint = (char)codepoint;
    return_string = string_make(interp, &real_codepoint, 1, "binary", 0);
    return return_string;
}


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
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
