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

/* The encoding we prefer, given a choice */
static ENCODING *preferred_encoding;

#define WHITESPACE 1
#define WORDCHAR 2
#define PUNCTUATION 3
#define DIGIT 4

static const unsigned char typetable[256] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, /* 0-15 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 16-31 */
    1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, /* 32-47 */
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, /* 48-63 */
    3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 64-79 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, /* 80-95 */
    3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 95-111 */
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 0, /* 112-127 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 128-143 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 144-159 */
    1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, /* 160-175 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, /* 176-191 */
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

static void
from_charset(Interp *interpreter, STRING *source_string)
{
    internal_exception(UNIMPLEMENTED, "Can't do this yet");
}

static void
from_unicode(Interp *interpreter, STRING *source_string)
{
    internal_exception(UNIMPLEMENTED, "Can't do this yet");
}


static void
to_charset(Interp *interpreter, STRING *source_string, CHARSET *new_charset)
{
    charset_converter_t conversion_func;
    if ((conversion_func = Parrot_find_charset_converter(interpreter,
                    source_string->charset, new_charset))) {
        /*
         * XXX conversion_func has wrong signature ?
         *
         * conversion_func(interpreter, new_charset, source_string);
         */
    }
    else {
        to_unicode(interpreter, source_string);
        new_charset->from_charset(interpreter, source_string);
    }
}

static STRING *
copy_to_charset(Interp *interpreter, STRING *source_string,
        CHARSET *new_charset)
{
  STRING *return_string = NULL;

  return return_string;
}

static void
to_unicode(Interp *interpreter, STRING *source_string)
{
    internal_exception(UNIMPLEMENTED,
            "to_unicode for iso-8859-1 not implemented");
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

static INTVAL
compare(Interp *interpreter, STRING *lhs, STRING *rhs)
{
    INTVAL retval = memcmp(lhs->strstart, rhs->strstart, lhs->strlen);
    if (!retval && lhs->strlen < rhs->strlen) {
        retval = -1;
    }
    if (retval) {
        retval = retval > 0 ? 1 : -1;
    }
    return retval;
}

static INTVAL
cs_index(Interp *interpreter, const STRING *source_string,
        const STRING *search_string, UINTVAL offset)
{
    UINTVAL base_size, search_size;
    char *base, *search;
    INTVAL retval;
    if (source_string->charset != search_string->charset) {
        internal_exception(UNIMPLEMENTED, "Cross-charset index not supported");
    }

    retval = Parrot_byte_index(interpreter, source_string,
            search_string, offset);
    return retval;
}

static INTVAL
cs_rindex(Interp *interpreter, const STRING *source_string,
        const STRING *search_string, UINTVAL offset) {
    UINTVAL base_size, search_size;
    char *base, *search;
    INTVAL retval;
    if (source_string->charset != search_string->charset) {
        internal_exception(UNIMPLEMENTED, "Cross-charset index not supported");
    }

    retval = Parrot_byte_rindex(interpreter, source_string,
            search_string, offset);
    return retval;
}

/* Binary's always valid */
static UINTVAL
validate(Interp *interpreter, STRING *source_string)
{
    return 1;
}

/* No word chars in binary data */
static INTVAL
is_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return (typetable[codepoint] == WORDCHAR);
}

static INTVAL
find_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return ascii_find_thing(interpreter, source_string, offset, WORDCHAR, typetable);
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
    return (typetable[codepoint] == DIGIT);
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
is_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    UINTVAL codepoint;
    codepoint = ENCODING_GET_CODEPOINT(interpreter, source_string, offset);
    return codepoint == 13;
}

static INTVAL
find_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
  return -1;
}

static INTVAL
find_not_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
  return offset;
}

static INTVAL
find_word_boundary(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
  return -1;
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

static size_t
compute_hash(Interp *interpreter, STRING *source_string)
{
    size_t hashval = 0;

    char *buffptr = (char *)source_string->strstart;
    UINTVAL len = source_string->strlen;

    while (len--) {
        hashval += hashval << 5;
        hashval += *buffptr++;
    }
    return hashval;
}

CHARSET *
Parrot_charset_iso_8859_1_init(Interp *interpreter)
{
    CHARSET *return_set = Parrot_new_charset(interpreter);
    CHARSET base_set = {
        "iso-8859-1",
        ascii_get_graphemes,
        ascii_get_graphemes_inplace,
        set_graphemes,
        to_charset,
        copy_to_charset,
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
        {NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL}

    };

    /* Snag the global. This is... bad. Should be properly fixed at some
       point */
    preferred_encoding = Parrot_fixed_8_encoding_ptr;

    /*  preferred_encoding = Parrot_load_encoding(interpreter, "fixed_8"); */

    memcpy(return_set, &base_set, sizeof(CHARSET));
    Parrot_register_charset(interpreter, "iso-8859-1", return_set);
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
