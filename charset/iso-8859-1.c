/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

charset/iso-8859-1.c

=head1 DESCRIPTION

This file implements the charset functions for iso-8859-1 data

=cut

*/

#include "parrot/parrot.h"
#include "iso-8859-1.h"
#include "ascii.h"

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
    0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 0xa, 4, 4, 4, 4, 4, 4, /* 48 */
    4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 64-79 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 2, /* 80-95 */
    4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 95-111 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 0, /* 112-127 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 128-143 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 144-159 */
    1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, /* 160-175 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, /* 176-191 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 192-207 */
    2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, /* 208-223 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 224-239 */
    2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, /* 240-255 */
};



static void
set_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL replace_count, STRING *insert_string)
{
    ENCODING_SET_BYTES(interpreter, source_string, offset,
            replace_count, insert_string);
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
        if (c >= 0x100) {
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


/* A noop. can't compose iso-8859-1 */
static void
compose(Interp *interpreter, STRING *source_string)
{
}

/* A noop. can't decompose iso-8859-1 */
static void
decompose(Interp *interpreter, STRING *source_string)
{
}

static void
upcase(Interp *interpreter, STRING *source_string)
{
    unsigned char *buffer;
    UINTVAL offset = 0;

    if (!source_string->strlen) {
        return;
    }

    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    for (offset = 0; offset < source_string->strlen; offset++) {
        unsigned int c = buffer[offset]; /* XXX use encoding ? */
        if (c >= 0xe0 && c != 0xf7)
            c &= ~0x20;
        else
            c = toupper(c);
        buffer[offset] = c;
    }
}

static void
downcase(Interp *interpreter, STRING *source_string)
{
    UINTVAL offset = 0;
    unsigned char *buffer;
    if (!source_string->strlen) {
        return;
    }
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    for (offset = 0; offset < source_string->strlen; offset++) {
        unsigned int c = buffer[offset];
        if (c >= 0xc0 && c != 0xd7 && c <= 0xde)
            c |= 0x20;
        else
            c = tolower(c);
        buffer[offset] = c;
    }
}

static void
titlecase(Interp *interpreter, STRING *source_string)
{
    unsigned char *buffer;
    unsigned int c;
    UINTVAL offset;

    if (!source_string->strlen) {
        return;
    }
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    c = buffer[0];
    if (c >= 0xe0 && c != 0xf7)
        c &= ~0x20;
    else
        c = toupper(c);
    buffer[0] = c;

    for (offset = 1; offset < source_string->strlen; offset++) {
        c = buffer[offset];
        if (c >= 0xc0 && c != 0xd7 && c <= 0xde)
            c |= 0x20;
        else
            c = tolower(c);
        buffer[offset] = c;
    }
}

static void
upcase_first(Interp *interpreter, STRING *source_string)
{
    unsigned char *buffer;
    unsigned int c;

    if (!source_string->strlen) {
        return;
    }
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    c = buffer[0];
    if (c >= 0xe0 && c != 0xf7)
        c &= ~0x20;
    else
        c = toupper(c);
    buffer[0] = c;
}

static void
downcase_first(Interp *interpreter, STRING *source_string)
{
    unsigned char *buffer;
    unsigned int c;

    if (!source_string->strlen) {
        return;
    }
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    c = buffer[0];
    if (c >= 0xc0 && c != 0xd7 && c <= 0xde)
        c &= ~0x20;
    else
        c = tolower(c);
    buffer[0] = c;
    buffer[0] = toupper(buffer[0]);
}

static void
titlecase_first(Interp *interpreter, STRING *source_string)
{
    upcase_first(interpreter, source_string);
}


static UINTVAL
validate(Interp *interpreter, STRING *src)
{
    UINTVAL codepoint, offset;

    for (offset = 0; offset < string_length(interpreter, src); ++offset) {
        codepoint = ENCODING_GET_CODEPOINT(interpreter, src, offset);
        if (codepoint >= 0x100)
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

static INTVAL
find_not_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
  return offset;
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
    return_string = string_make(interpreter, &real_codepoint, 1,
            "iso-8859-1", 0);
    return return_string;
}

CHARSET *
Parrot_charset_iso_8859_1_init(Interp *interpreter)
{
    CHARSET *return_set = Parrot_new_charset(interpreter);
    static const CHARSET base_set = {
        "iso-8859-1",
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
    Parrot_register_charset(interpreter, "iso-8859-1", return_set);
    return return_set;
}

STRING *
charset_cvt_iso_8859_1_to_ascii(Interp *interpreter, STRING *src, STRING *dest)
{
    UINTVAL offs, c;
    if (dest) {
        Parrot_reallocate_string(interpreter, dest, src->strlen);
        dest->bufused = src->bufused;
        dest->strlen  = src->strlen;
    }
    for (offs = 0; offs < src->strlen; ++offs) {
        c = ENCODING_GET_BYTE(interpreter, src, offs);
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

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
