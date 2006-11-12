/*
Copyright (C) 2004, The Perl Foundation.
$Id$

=head1 NAME

src/charset/ascii.c

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
    real_exception(interp, NULL, err, str)

#include "tables.h"

INTVAL
ascii_find_thing(Interp *interp, STRING *string, UINTVAL start,
        PARROT_CCLASS_FLAGS type, const PARROT_CCLASS_FLAGS *table)
{
    for (; start < string->strlen; start++) {
        if (table[ENCODING_GET_BYTE(interp, string, start)] & type) {
            return start;
        }
    }
    return -1;
}

INTVAL
ascii_find_not_thing(Interp *interp, STRING *string, UINTVAL start,
        PARROT_CCLASS_FLAGS type, const PARROT_CCLASS_FLAGS *table)
{
    for (; start < string->strlen; start++) {
        if (!(table[ENCODING_GET_BYTE(interp, string, start)] & type)) {
            return start;
        }
    }
    return -1;
}

STRING *
ascii_get_graphemes(Interp *interp, STRING *source_string,
        UINTVAL offset, UINTVAL count)
{
    return ENCODING_GET_BYTES(interp, source_string, offset, count);
}

static void
set_graphemes(Interp *interp, STRING *source_string,
        UINTVAL offset, UINTVAL replace_count, STRING *insert_string)
{
    ENCODING_SET_BYTES(interp, source_string, offset,
            replace_count, insert_string);

}

STRING *
ascii_get_graphemes_inplace(Interp *interp, STRING *source_string,
        UINTVAL offset, UINTVAL count, STRING *dest_string)
{
    return ENCODING_GET_BYTES_INPLACE(interp, source_string,
            offset, count, dest_string);
}

static STRING *
to_ascii(Interp *interp, STRING *src, STRING *dest)
{
    String_iter iter;
    UINTVAL c, len, offs;
    unsigned char *p;

    len = src->strlen;
    if (dest) {
        Parrot_reallocate_string(interp, dest, len);
    }
    else {
        /* the string can't grow - replace inplace */
        dest = src;
    }
    p = dest->strstart;
    ENCODING_ITER_INIT(interp, src, &iter);
    for (offs = 0; offs < len; ++offs) {
        c = iter.get_and_advance(interp, &iter);
        if (c >= 128)
            real_exception(interp, NULL, LOSSY_CONVERSION,
                    "can't convert unicode string to ascii");
        *p++ = (unsigned char)c;
    }
    dest->bufused = dest->strlen = len;
    dest->charset = Parrot_ascii_charset_ptr;
    dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, dest);
    return dest;
}

static STRING *
to_unicode(Interp *interp, STRING *src, STRING *dest)
{
    if (dest) {
        dest->charset = Parrot_unicode_charset_ptr;
        dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, dest);
        Parrot_reallocate_string(interp, dest, src->strlen);
        return dest;
    }
    else {
        src->charset = Parrot_unicode_charset_ptr;
        src->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, src);
        return src;
    }
}

static STRING *
to_charset(Interp *interp, STRING *src, STRING *dest)
{
    charset_converter_t conversion_func;

    if ((conversion_func = Parrot_find_charset_converter(interp,
                    src->charset, Parrot_ascii_charset_ptr))) {
         return conversion_func(interp, src, dest);
    }
    else {
        return to_ascii(interp, src, dest);
    }
}

/* A noop. can't compose ascii */
static STRING*
compose(Interp *interp, STRING *src)
{
    return string_copy(interp, src);
}

/* A noop. can't decompose ascii */
static STRING*
decompose(Interp *interp, STRING *src)
{
    return string_copy(interp, src);
}

static void
upcase(Interp *interp, STRING *source_string)
{
    char *buffer;
    UINTVAL offset = 0;

    if (!source_string->strlen) {
        return;
    }

    buffer = source_string->strstart;
    for (offset = 0; offset < source_string->strlen; offset++) {
        buffer[offset] = toupper(buffer[offset]);
    }
}

static void
downcase(Interp *interp, STRING *source_string)
{
    UINTVAL offset = 0;
    char *buffer;
    if (!source_string->strlen) {
        return;
    }
    buffer = source_string->strstart;
    for (offset = 0; offset < source_string->strlen; offset++) {
        buffer[offset] = tolower(buffer[offset]);
    }
}

static void
titlecase(Interp *interp, STRING *source_string)
{
    char *buffer;
    UINTVAL offset = 0;
    if (!source_string->strlen) {
        return;
    }
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
    for (offset = 1; offset < source_string->strlen; offset++) {
        buffer[offset] = tolower(buffer[offset]);
    }
}

static void
upcase_first(Interp *interp, STRING *source_string)
{
    char *buffer;
    if (!source_string->strlen) {
        return;
    }
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

static void
downcase_first(Interp *interp, STRING *source_string)
{
    char *buffer;
    if (!source_string->strlen) {
        return;
    }
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

static void
titlecase_first(Interp *interp, STRING *source_string)
{
    char *buffer;
    if (!source_string->strlen) {
        return;
    }

    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

INTVAL
ascii_compare(Interp *interp, STRING *lhs, STRING *rhs)
{
    UINTVAL offs, l_len, r_len, min_len;
    String_iter iter;

    l_len = lhs->strlen;
    r_len = rhs->strlen;
    min_len = l_len > r_len ? r_len : l_len;

    if (lhs->encoding == Parrot_fixed_8_encoding_ptr &&
            rhs->encoding == Parrot_fixed_8_encoding_ptr) {
        int ret_val = memcmp(lhs->strstart, rhs->strstart, min_len);
        if (ret_val)
            return ret_val < 0 ? -1 : 1;
    }
    else {
        UINTVAL cl, cr;
        ENCODING_ITER_INIT(interp, rhs, &iter);
        for (offs = 0; offs < min_len; ++offs) {
            cl = ENCODING_GET_BYTE(interp, lhs, offs);
            cr = iter.get_and_advance(interp, &iter);
            if (cl != cr)
                return cl < cr ? -1 : 1;
        }
    }
    if (l_len < r_len) {
        return -1;
    }
    if (l_len > r_len) {
        return 1;
    }
    return 0;
}

INTVAL
mixed_cs_index(Interp *interp, STRING *src, STRING *search, UINTVAL offs)
{
    String_iter src_iter, search_iter;
    UINTVAL c1, c2, len;
    INTVAL start;

    ENCODING_ITER_INIT(interp, src, &src_iter);
    src_iter.set_position(interp, &src_iter, offs);
    ENCODING_ITER_INIT(interp, search, &search_iter);
    len = search->strlen;

    start = -1;
    for (; len && offs < src->strlen; ++offs) {
        c1 = src_iter.get_and_advance(interp, &src_iter);
        c2 = search_iter.get_and_advance(interp, &search_iter);
        if (c1 == c2) {
            --len;
            if (start == -1)
                start = offs;
        }
        else {
            len = search->strlen;
            start = -1;
            search_iter.set_position(interp, &search_iter, 0);
        }
    }
    if (len == 0)
        return start;
    return -1;
}

INTVAL
ascii_cs_index(Interp *interp, STRING *source_string,
        STRING *search_string, UINTVAL offset)
{
    INTVAL retval;
    if (source_string->charset != search_string->charset) {
        return mixed_cs_index(interp, source_string, search_string,
                offset);
    }

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    retval = Parrot_byte_index(interp, source_string,
            search_string, offset);
    return retval;
}

INTVAL
ascii_cs_rindex(Interp *interp, STRING *source_string,
        STRING *search_string, UINTVAL offset) {
    INTVAL retval;
    if (source_string->charset != search_string->charset) {
        internal_exception(UNIMPLEMENTED, "Cross-charset index not supported");
    }

    assert(source_string->encoding == Parrot_fixed_8_encoding_ptr);
    retval = Parrot_byte_rindex(interp, source_string,
            search_string, offset);
    return retval;
}

static UINTVAL
validate(Interp *interp, STRING *src)
{
    UINTVAL codepoint, offset;
    String_iter iter;

    ENCODING_ITER_INIT(interp, src, &iter);
    for (offset = 0; offset < string_length(interp, src); ++offset) {
        codepoint = iter.get_and_advance(interp, &iter);
        if (codepoint >= 0x80)
            return 0;
    }
    return 1;
}

static STRING *
string_from_codepoint(Interp *interp, UINTVAL codepoint)
{
    STRING *return_string = NULL;
    char real_codepoint = (char)codepoint;
    return_string = string_make(interp, &real_codepoint, 1, "ascii", 0);
    return return_string;
}

static INTVAL
is_cclass(Interp *interp, PARROT_CCLASS_FLAGS flags,
        STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;

    if (offset >= source_string->strlen)
        return 0;
    codepoint = ENCODING_GET_CODEPOINT(interp, source_string, offset);

    if (codepoint >= sizeof(Parrot_ascii_typetable) /
            sizeof(Parrot_ascii_typetable[0])) {
        return 0;
    }
    return (Parrot_ascii_typetable[codepoint] & flags) ? 1 : 0;
}

static INTVAL
find_cclass(Interp *interp, PARROT_CCLASS_FLAGS flags,
            STRING *source_string, UINTVAL offset, UINTVAL count)
{
    UINTVAL pos = offset;
    UINTVAL end = offset + count;
    UINTVAL codepoint;

    assert(source_string != 0);
    end = source_string->strlen < end ? source_string->strlen : end;
    for (; pos < end; ++pos) {
        codepoint = ENCODING_GET_CODEPOINT(interp, source_string, pos);
        if ((Parrot_ascii_typetable[codepoint] & flags) != 0) {
            return pos;
        }
    }
    return end;
}

static INTVAL
find_not_cclass(Interp *interp, PARROT_CCLASS_FLAGS flags,
                STRING *source_string, UINTVAL offset, UINTVAL count)
{
    UINTVAL pos = offset;
    UINTVAL end = offset + count;
    UINTVAL codepoint;

    assert(source_string != 0);
    end = source_string->strlen < end ? source_string->strlen : end;
    for (; pos < end; ++pos) {
        codepoint = ENCODING_GET_CODEPOINT(interp, source_string, pos);
        if ((Parrot_ascii_typetable[codepoint] & flags) == 0) {
            return pos;
        }
    }
    return end;
}

/*
 * TODO pass in the Hash's seed value as initial hashval
 */
size_t
ascii_compute_hash(Interp *interp, STRING *source_string, size_t seed)
{
    size_t hashval = seed;

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
Parrot_charset_ascii_init(Interp *interp)
{
    CHARSET *return_set = Parrot_new_charset(interp);
    static const CHARSET base_set = {
        "ascii",
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
        ascii_compare,
        ascii_cs_index,
        ascii_cs_rindex,
        validate,
        is_cclass,
        find_cclass,
        find_not_cclass,
        string_from_codepoint,
        ascii_compute_hash,
        NULL
    };

    memcpy(return_set, &base_set, sizeof(CHARSET));
    return_set->preferred_encoding = Parrot_fixed_8_encoding_ptr;
    Parrot_register_charset(interp, "ascii", return_set);
    return return_set;
}

STRING *
charset_cvt_ascii_to_binary(Interp *interp, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    if (dest) {
        Parrot_reallocate_string(interp, dest, src->strlen);
        dest->bufused = src->bufused;
        dest->strlen  = src->strlen;
        for (offs = 0; offs < src->strlen; ++offs) {
            c = ENCODING_GET_BYTE(interp, src, offs);
            ENCODING_SET_BYTE(interp, dest, offs, c);
        }
        return dest;
    }
    src->charset = Parrot_binary_charset_ptr;
    return src;
}

STRING *
charset_cvt_ascii_to_iso_8859_1(Interp *interp, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    if (dest) {
        Parrot_reallocate_string(interp, dest, src->strlen);
        dest->bufused = src->bufused;
        dest->strlen  = src->strlen;
        for (offs = 0; offs < src->strlen; ++offs) {
            c = ENCODING_GET_BYTE(interp, src, offs);
            ENCODING_SET_BYTE(interp, dest, offs, c);
        }
        return dest;
    }
    src->charset = Parrot_iso_8859_1_charset_ptr;
    return src;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
