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

/* The encoding we prefer, given a choice */
static ENCODING *preferred_encoding;

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
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 160-175 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 176-191 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, /* 192-207 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  /* 207-223 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  /* 224-239 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  /* 240-255 */
};

INTVAL
ascii_find_thing(Interp *interpreter, STRING *string, UINTVAL start,
        unsigned char type, const unsigned char *table)
{
    INTVAL retval = -1;
    INTVAL found = 0;

    for (; start < string->strlen; start++) {
        if (table[ENCODING_GET_CODEPOINT(interpreter, string, start)] == type) {
            found = 1;
            break;
        }
    }
    if (found) {
        retval = start;
    }
    return retval;
}

INTVAL
ascii_find_not_thing(Interp *interpreter, STRING *string, UINTVAL start,
        unsigned char type, const unsigned char *table)
{
    INTVAL retval = -1;
    INTVAL found = 0;

    for (; start < string->strlen; start++) {
        if (table[ENCODING_GET_CODEPOINT(interpreter, string, start)] != type) {
            found = 1;
            break;
        }
    }
    if (found) {
        retval = start;
    }
    return retval;
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
        STRING *dest_string, UINTVAL offset, UINTVAL count)
{
    return ENCODING_GET_BYTES_INPLACE(interpreter, source_string,
            offset, count, dest_string);
}

static void
to_charset(Interp *interpreter, STRING *source_string, CHARSET *new_charset)
{
    internal_exception(UNIMPLEMENTED, "to_charset for ascii not implemented");
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
    internal_exception(UNIMPLEMENTED, "to_unicode for ascii not implemented");
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
    Parrot_unmake_COW(interpreter, source_string);
    buffer = source_string->strstart;
    buffer[0] = toupper(buffer[0]);
}

static INTVAL
compare(Interp *interpreter, STRING *lhs, STRING *rhs)
{
    return 0;
}

static INTVAL
cs_index(Interp *interpreter, const STRING *source_string,
        const STRING *search_string, UINTVAL offset)
{
    return -1;
}

static INTVAL
cs_rindex(Interp *interpreter, const STRING *source_string,
        const STRING *search_string, UINTVAL offset)
{
    return -1;
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
    return offset;
}

static INTVAL
is_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return 0;
}

static INTVAL
find_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return -1;
}

static INTVAL
find_not_whitespace(Interp *interpreter, STRING *source_string,
        UINTVAL offset)
{
    return offset;
}

static INTVAL
is_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return 0;
}

static INTVAL
find_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return -1;
}

static INTVAL
find_not_digit(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return offset;
}

static INTVAL
is_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return 0;
}

static INTVAL
find_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return -1;
}

static INTVAL
find_not_punctuation(Interp *interpreter, STRING *source_string,
        UINTVAL offset)
{
    return offset;
}

static INTVAL
is_newline(Interp *interpreter, STRING *source_string, UINTVAL offset)
{
    return 0;
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
    return_string = string_make(interpreter, &real_codepoint, 1, "ascii", 0);
    return return_string;
}

static size_t
compute_hash(Interp *interpreter, STRING *source_string)
{
    size_t hashval;

    char *buffptr = (char *)source_string->strstart;
    UINTVAL len = source_string->strlen;

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
  CHARSET base_set = {
      "ascii",
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
  Parrot_register_charset(interpreter, "ascii", return_set);
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
