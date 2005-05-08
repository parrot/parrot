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
#include "ascii.h"

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
to_charset(Interp *interpreter, STRING *src,
        CHARSET *new_charset, STRING *dest)
{
    charset_converter_t conversion_func;

    if ((conversion_func = Parrot_find_charset_converter(interpreter,
                    src->charset, new_charset))) {
         return conversion_func(interpreter, src, dest);
    }
    else {
        return new_charset->from_charset(interpreter, src, dest);

    }
}

static STRING*
to_unicode(Interp *interpreter, STRING *source_string, STRING *dest)
{
    UNIMPL;
    return NULL;
}

static STRING*
from_charset(Interp *interpreter, STRING *src, STRING *dest)
{
    if (src->charset == Parrot_unicode_charset_ptr) {
        if (!dest) {
            /* inplace ok */
            return src;
        }
        Parrot_reuse_COW_reference(interpreter, src, dest);
        return dest;
    }
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
cs_rindex(Interp *interpreter, STRING *source_string,
        STRING *search_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

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

static INTVAL
is_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *source_string, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static INTVAL
find_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *source_string, UINTVAL offset, UINTVAL count)
{
    UNIMPL;
    return -1;
}

static INTVAL
find_not_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *source_string, UINTVAL offset, UINTVAL count)
{
    UNIMPL;
    return -1;
}

static STRING *
string_from_codepoint(Interp *interpreter, UINTVAL codepoint)
{
    STRING *dest;
    String_iter iter;

    dest = string_make(interpreter, "", 1, "unicode", 0);
    dest->strlen = 1;
    ENCODING_ITER_INIT(interpreter, dest, &iter);
    iter.set_and_advance(interpreter, &iter, codepoint);
    dest->bufused = iter.bytepos;

    return dest;
}

static size_t
compute_hash(Interp *interpreter, STRING *src)
{
    String_iter iter;
    size_t hashval = 0;
    UINTVAL offs, c;

    ENCODING_ITER_INIT(interpreter, src, &iter);
    for (offs = 0; offs < src->strlen; ++offs) {
        c = iter.get_and_advance(interpreter, &iter);
        hashval += hashval << 5;
        hashval += c;
    }
    return hashval;
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
        mixed_cs_index,
        cs_rindex,
        validate,
        is_cclass,
        find_cclass,
        find_not_cclass,
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
