/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

charset/ascii.c

=head1 DESCRIPTION

This file implements the charset functions for ascii data and common
charset functionality for similar charsets like iso-8859-1.

=cut

*/

#include "parrot/parrot.h"
#include "ascii.h"
#include <assert.h>

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

/*
 * TODO check interpreter error and warnings setting
 */

#define EXCEPTION(err, str) \
    real_exception(interpreter, NULL, err, str)

#define WHITESPACE 1
#define WORDCHAR 2
#define PUNCTUATION 4
#define DIGIT 8

static const unsigned char typetable[256] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, /* 0-15 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 16-31 */
    1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, /* 32-47 */
    0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 4, 4, 4, 4, 4, 4, /*48.*/
    4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 64-79 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 2, /* 80-95 */
    4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 95-111 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 0, /* 112-127 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 128-143 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 144-159 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 160-175 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 176-191 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 192-207 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  /* 208-223 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  /* 224-239 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  /* 240-255 */
};

INTVAL
ascii_find_thing(Interp *interpreter, STRING *string, UINTVAL start,
        unsigned char type, const unsigned char *table)
{
    for (; start < string->strlen; start++) {
        if (table[ENCODING_GET_BYTE(interpreter, string, start)] & type) {
            return start;
        }
    }
    return -1;
}

INTVAL
ascii_find_not_thing(Interp *interpreter, STRING *string, UINTVAL start,
        unsigned char type, const unsigned char *table)
{
    for (; start < string->strlen; start++) {
        if (!(table[ENCODING_GET_BYTE(interpreter, string, start)] & type)) {
            return start;
        }
    }
    return -1;
}

STRING *
ascii_get_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL count)
{
    return ENCODING_GET_BYTES(interpreter, source_string, offset, count);
}

static void
set_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL replace_count, STRING *insert_string)
{
    ENCODING_SET_BYTES(interpreter, source_string, offset,
            replace_count, insert_string);

}

STRING *
ascii_get_graphemes_inplace(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL count, STRING *dest_string)
{
    return ENCODING_GET_BYTES_INPLACE(interpreter, source_string,
            offset, count, dest_string);
}


static STRING *
from_charset(Interp *interpreter, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    String_iter iter;

    if (dest) {
        Parrot_reallocate_string(interpreter, dest, src->strlen);
        dest->bufused = src->strlen;
        dest->strlen  = src->strlen;
    }
    ENCODING_ITER_INIT(interpreter, src, &iter);
    for (offs = 0; offs < src->strlen; ++offs) {
        c = iter.get_and_advance(interpreter, &iter);
        if (c >= 0x80) {
            EXCEPTION(LOSSY_CONVERSION, "lossy conversion to ascii");
        }
        if (dest)
            ENCODING_SET_BYTE(interpreter, dest, offs, c);
    }
    if (dest)
        return dest;
    src->charset = Parrot_ascii_charset_ptr;
    return src;
}

static STRING *
from_unicode(Interp *interpreter, STRING *source_string, STRING *dest)
{
    internal_exception(UNIMPLEMENTED, "Can't do this yet");
    return NULL;
}

STRING *
ascii_to_unicode(Interp *interpreter, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    String_iter iter;

    if (dest) {
        dest->charset = Parrot_unicode_charset_ptr;
        dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interpreter, dest);
        Parrot_reallocate_string(interpreter, dest, src->strlen);
        ENCODING_ITER_INIT(interpreter, dest, &iter);
        for (offs = 0; offs < src->strlen; ++offs) {
            c = ENCODING_GET_BYTE(interpreter, src, offs);
            if (iter.bytepos >= PObj_buflen(dest) - 4) {
                UINTVAL need = (src->strlen - offs) * 1.5;
                if (need < 16)
                    need = 16;
                Parrot_reallocate_string(interpreter, dest,
                        PObj_buflen(dest) + need);
            }
            iter.set_and_advance(interpreter, &iter, c);
        }
        dest->bufused = iter.bytepos;
        dest->strlen  = iter.charpos;
        return dest;
    }
    else {
        internal_exception(UNIMPLEMENTED,
                "to_unicode inplace for iso-8859-1 not implemented");
    }
    return NULL;
}

STRING *
ascii_to_charset(Interp *interpreter, STRING *src,
        CHARSET *new_charset, STRING *dest)
{
    charset_converter_t conversion_func;

    if ((conversion_func = Parrot_find_charset_converter(interpreter,
                    src->charset, new_charset))) {
         return conversion_func(interpreter, src, dest);
    }
    else {
        STRING *res = ascii_to_unicode(interpreter, src, dest);
        return new_charset->from_charset(interpreter, res, dest);

    }
}

/* A noop. can't compose ascii */
static void
compose(Interp *interpreter, STRING *source_string)
{
}

/* A noop. can't decompose ascii */
static void
decompose(Interp *interpreter, STRING *source_string)
{
}

static void
upcase(Interp *interpreter, STRING *source_string)
{
    char *buffer;
    UINTVAL offset = 0;

    if (!source_string->strlen) {
        return;
    }

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    for (offset = 0; offset < source_string->strlen; offset++) {
        buffer[offset] = toupper(buffer[offset]);
    }
}

static void
downcase(Interp *interpreter, STRING *source_string)
{
    UINTVAL offset = 0;
    char *buffer;
    if (!source_string->strlen) {
        return;
    }
    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    for (offset = 0; offset < source_string->strlen; offset++) {
        buffer[offset] = tolower(buffer[offset]);
    }
}

static void
titlecase(Interp *interpreter, STRING *source_string)
{
    char *buffer;
    UINTVAL offset = 0;
    if (!source_string->strlen) {
        return;
    }
    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
    for (offset = 1; offset < source_string->strlen; offset++) {
        buffer[offset] = tolower(buffer[offset]);
    }
}

static void
upcase_first(Interp *interpreter, STRING *source_string)
{
    char *buffer;
    if (!source_string->strlen) {
        return;
    }
    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

static void
downcase_first(Interp *interpreter, STRING *source_string)
{
    char *buffer;
    if (!source_string->strlen) {
        return;
    }
    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

static void
titlecase_first(Interp *interpreter, STRING *source_string)
{
    char *buffer;
    if (!source_string->strlen) {
        return;
    }

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

INTVAL
ascii_compare(Interp *interpreter, STRING *lhs, STRING *rhs)
{
    INTVAL retval;
    UINTVAL offs, l_len, r_len, min_len;
    String_iter iter;

    l_len = lhs->strlen;
    r_len = rhs->strlen;
    min_len = l_len > r_len ? r_len : l_len;

    if (lhs->encoding == Parrot_fixed_8_encoding_ptr &&
            rhs->encoding == Parrot_fixed_8_encoding_ptr) {
        retval = memcmp(lhs->strstart, rhs->strstart, min_len);
    }
    else {
        UINTVAL cl, cr;
        ENCODING_ITER_INIT(interpreter, rhs, &iter);
        for (offs = 0; offs < min_len; ++offs) {
            cl = ENCODING_GET_BYTE(interpreter, lhs, offs);
            cr = iter.get_and_advance(interpreter, &iter);
            retval = cl - cr;
            if (retval)
                break;
        }
    }
    if (!retval) {
        if (l_len < r_len) {
            return -1;
        }
        if (l_len > r_len) {
            return 1;
        }
        if (l_len == r_len) {
            return 0;
        }
    }
    retval = retval > 0 ? 1 : -1;
    return retval;
}

INTVAL
mixed_cs_index(Interp *interpreter, STRING *src, STRING *search, UINTVAL offs)
{
    String_iter src_iter, search_iter;
    UINTVAL c1, c2, len;
    INTVAL start;

    ENCODING_ITER_INIT(interpreter, src, &src_iter);
    src_iter.set_position(interpreter, &src_iter, offs);
    ENCODING_ITER_INIT(interpreter, search, &search_iter);
    len = search->strlen;

    start = -1;
    for (; len && offs < src->strlen; ++offs) {
        c1 = src_iter.get_and_advance(interpreter, &src_iter);
        c2 = search_iter.get_and_advance(interpreter, &search_iter);
        if (c1 == c2) {
            --len;
            if (start == -1)
                start = offs;
        }
        else {
            len = search->strlen;
            start = -1;
            search_iter.set_position(interpreter, &search_iter, 0);
        }
    }
    if (len == 0)
        return start;
    return -1;
}

INTVAL
ascii_cs_index(Interp *interpreter, STRING *source_string,
        STRING *search_string, UINTVAL offset)
{
    INTVAL retval;
    if (source_string->charset != search_string->charset) {
        return mixed_cs_index(interpreter, source_string, search_string,
                offset);
    }

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    retval = Parrot_byte_index(interpreter, source_string,
            search_string, offset);
    return retval;
}

INTVAL
ascii_cs_rindex(Interp *interpreter, STRING *source_string,
        STRING *search_string, UINTVAL offset) {
    INTVAL retval;
    if (source_string->charset != search_string->charset) {
        internal_exception(UNIMPLEMENTED, "Cross-charset index not supported");
    }

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    retval = Parrot_byte_rindex(interpreter, source_string,
            search_string, offset);
    return retval;
}

static UINTVAL
validate(Interp *interpreter, STRING *src)
{
    UINTVAL codepoint, offset;
    String_iter iter;

    ENCODING_ITER_INIT(interpreter, src, &iter);
    for (offset = 0; offset < string_length(interpreter, src); ++offset) {
        codepoint = iter.get_and_advance(interpreter, &iter);
        if (codepoint >= 0x80)
            return 0;
    }
    return 1;
}


static INTVAL
is_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return (typetable[codepoint] & WORDCHAR) ? 1 : 0;
}

static INTVAL
find_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_thing(interpreter, source_string, offset, WORDCHAR,
            typetable);
}

static INTVAL
find_not_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_not_thing(interpreter, source_string, offset, WORDCHAR,
            typetable);
}

static INTVAL
is_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return (typetable[codepoint] == WHITESPACE);
}

static INTVAL
find_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_thing(interpreter, source_string, offset, WHITESPACE,
            typetable);
}

static INTVAL
find_not_whitespace(Interp *interpreter, STRING *source_string,
        UINTVAL offset)
{
    return ascii_find_not_thing(interpreter, source_string, offset,
            WHITESPACE, typetable);
}

static INTVAL
is_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return (typetable[codepoint] & DIGIT) ? 1 : 0;
}

static INTVAL
find_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_thing(interpreter, source_string, offset, DIGIT,
            typetable);
}

static INTVAL
find_not_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_not_thing(interpreter, source_string, offset, DIGIT,
            typetable);
}

static INTVAL
is_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return (typetable[codepoint] == PUNCTUATION);
}

static INTVAL
find_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_thing(interpreter, source_string, offset, PUNCTUATION,
            typetable);
}

static INTVAL
find_not_punctuation(Interp *interpreter, STRING *source_string,
        UINTVAL offset)
{
    return ascii_find_not_thing(interpreter, source_string, offset,
            PUNCTUATION, typetable);
}

INTVAL
ascii_is_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return codepoint == 10;
}


INTVAL
ascii_find_newline(Interp *interpreter, STRING *string, UINTVAL start)
{
    for (; start < string->strlen; start++) {
        if (ENCODING_GET_CODEPOINT(interpreter, string, start) == 10) {
            return start;
        }
    }
    return -1;
}

INTVAL
ascii_find_not_newline(Interp *interpreter, STRING *string, UINTVAL start)
{
    for (; start < string->strlen; start++) {
        if (ENCODING_GET_CODEPOINT(interpreter, string, start) != 10) {
            return start;
        }
    }
    return -1;
}

INTVAL
ascii_find_word_boundary(Interp *interpreter, STRING *string,
        UINTVAL offset, const unsigned char *table)
{
    UINTVAL c, len;
    int is_wc1, is_wc2;

    len = string->strlen;
    if (!len || offset >= len)
        return -1;
    c = ENCODING_GET_CODEPOINT(interpreter, string, offset);
    is_wc1 = (table[c] & WORDCHAR) ? 1 : 0;
    /* begin of string */
    if (!offset && is_wc1)
        return 0;
    for (++offset; offset < len; offset++) {
        c = ENCODING_GET_CODEPOINT(interpreter, string, offset);
        is_wc2 = (table[c] & WORDCHAR) ? 1 : 0;
        if (is_wc1 ^ is_wc2)
            return offset - 1;
        is_wc1 = is_wc2;
    }
    /* end of string */
    if (is_wc1 && offset == len)
        return offset - 1;
    return -1;
}

static INTVAL
find_word_boundary(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
  return ascii_find_word_boundary(interpreter, source_string,
          offset, typetable);
}

static STRING *
string_from_codepoint(Interp *interpreter, UINTVAL codepoint)
{
    STRING *return_string = NULL;
    char real_codepoint = codepoint;
    return_string = string_make(interpreter, &real_codepoint, 1, "ascii", 0);
    return return_string;
}

/*
 * TODO pass in the Hash's seed value as initial hashval
 */
size_t
ascii_compute_hash(Interp *interpreter, STRING *source_string)
{
    size_t hashval = 0;

    char *buffptr = (char *)source_string->strstart;
    UINTVAL len = source_string->strlen;

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    while (len--) {
        hashval += hashval << 5;
        hashval += *buffptr++;
    }
    return hashval;
}

CHARSET *
Parrot_charset_ascii_init(Interp *interpreter)
{
    CHARSET *return_set = Parrot_new_charset(interpreter);
    static const CHARSET base_set = {
        "ascii",
        ascii_get_graphemes,
        ascii_get_graphemes_inplace,
        set_graphemes,
        ascii_to_charset,
        ascii_to_unicode,
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
        ascii_compare,
        ascii_cs_index,
        ascii_cs_rindex,
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
        ascii_is_newline,
        ascii_find_newline,
        ascii_find_not_newline,
        find_word_boundary,
        string_from_codepoint,
        ascii_compute_hash,
        NULL
    };

    memcpy(return_set, &base_set, sizeof(CHARSET));
    return_set->preferred_encoding = Parrot_fixed_8_encoding_ptr;
    Parrot_register_charset(interpreter, "ascii", return_set);
    return return_set;
}

STRING *
charset_cvt_ascii_to_binary(Interp *interpreter, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    if (dest) {
        Parrot_reallocate_string(interpreter, dest, src->strlen);
        dest->bufused = src->bufused;
        dest->strlen  = src->strlen;
        for (offs = 0; offs < src->strlen; ++offs) {
            c = ENCODING_GET_BYTE(interpreter, src, offs);
            ENCODING_SET_BYTE(interpreter, dest, offs, c);
        }
        return dest;
    }
    src->charset = Parrot_binary_charset_ptr;
    return src;
}

STRING *
charset_cvt_ascii_to_iso_8859_1(Interp *interpreter, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    if (dest) {
        Parrot_reallocate_string(interpreter, dest, src->strlen);
        dest->bufused = src->bufused;
        dest->strlen  = src->strlen;
        for (offs = 0; offs < src->strlen; ++offs) {
            c = ENCODING_GET_BYTE(interpreter, src, offs);
            ENCODING_SET_BYTE(interpreter, dest, offs, c);
        }
        return dest;
    }
    src->charset = Parrot_iso_8859_1_charset_ptr;
    return src;
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
