/*
Copyright: 2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

charset/unicode.c

=head1 DESCRIPTION

This file implements the charset functions for unicode data

=cut

*/

#include "parrot/parrot.h"
#include "unicode.h"

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    real_exception(interpreter, NULL, err, str)

#define UNIMPL EXCEPTION(UNIMPLEMENTED, "unimplemented unicode")

static void
set_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL replace_count, STRING *insert_string)
{
    ENCODING_SET_CODEPOINTS(interpreter, source_string, offset,
            replace_count, insert_string);
}

static STRING *
get_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL count)
{
    return ENCODING_GET_CODEPOINTS(interpreter, source_string, offset, count);
}

static STRING *
get_graphemes_inplace(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL count, STRING *dest_string)
{
    return ENCODING_GET_CODEPOINTS_INPLACE(interpreter, source_string,
            offset, count, dest_string);
}

static STRING*
to_charset(Interp *interpreter, STRING *src, CHARSET *new_charset, STRING *dest)
{
    UNIMPL;
    return NULL;
}

static STRING*
to_unicode(Interp *interpreter, STRING *source_string, STRING *dest)
{
    UNIMPL;
    return NULL;
}

static STRING*
from_charset(Interp *interpreter, STRING *source_string, STRING *dest)
{
    UNIMPL;
    return NULL;
}

static STRING *
from_unicode(Interp *interpreter, STRING *source_string, STRING *dest)
{
    UNIMPL;
    return NULL;
}

static void
compose(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
decompose(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
upcase(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
downcase(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
titlecase(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
upcase_first(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
downcase_first(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static void
titlecase_first(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
}

static INTVAL
compare(Interp *interpreter, STRING *lhs, STRING *rhs)
{
    UNIMPL;
    return 0;
}

static INTVAL
cs_index(Interp *interpreter, const STRING *source_string,
        const STRING *search_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
cs_rindex(Interp *interpreter, const STRING *source_string,
        const STRING *search_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

/* Binary's always valid */
static UINTVAL
validate(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
    return 0;
}

static INTVAL
is_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return -1;
}

static INTVAL
find_not_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
is_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_not_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset) {
    UNIMPL;
    return 0;
}

static INTVAL
is_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_not_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
is_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_not_punctuation(Interp *interpreter, STRING *source_string,
        UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
is_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_not_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_word_boundary(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static STRING *
string_from_codepoint(Interp *interpreter, UINTVAL codepoint)
{
    STRING *return_string = NULL;

    UNIMPL;
    return return_string;
}

static size_t
compute_hash(Interp *interpreter, STRING *source_string)
{
    UNIMPL;
    return 0;
}

CHARSET *
Parrot_charset_unicode_init(Interp *interpreter)
{
    CHARSET *return_set = Parrot_new_charset(interpreter);
    static const CHARSET base_set = {
        "unicode",
        get_graphemes,
        get_graphemes_inplace,
        set_graphemes,
        to_charset,
        to_unicode,
        from_charset,
        from_unicode,
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
        is_wordchar,
        find_wordchar,
        find_not_wordchar,
        is_whitespace,
        find_whitespace,
        find_not_whitespace,
        is_digit,
        find_digit,
        find_not_digit,
        is_punctuation,
        find_punctuation,
        find_not_punctuation,
        is_newline,
        find_newline,
        find_not_newline,
        find_word_boundary,
        string_from_codepoint,
        compute_hash,
        NULL
    };

    memcpy(return_set, &base_set, sizeof(CHARSET));
    /*
     * for now use utf8
     * TODO replace it with a fixed uint_16 or uint_32 encoding
     */
    return_set->preferred_encoding = Parrot_utf8_encoding_ptr;
    Parrot_register_charset(interpreter, "unicode", return_set);
    return return_set;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
