/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

charset/binary.c

=head1 DESCRIPTION

This file implements the charset functions for binary data

=cut

*/

#include "parrot/parrot.h"
#include "binary.h"
#include "ascii.h"

/* The encoding we prefer, given a choice */
static ENCODING *preferred_encoding;

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    real_exception(interpreter, NULL, err, str)

static void
set_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL replace_count, STRING *insert_string)
{
    ENCODING_SET_BYTES(interpreter, source_string, offset,
            replace_count, insert_string);
}

static void
to_charset(Interp *interpreter, STRING *source_string, CHARSET *new_charset)
{
    internal_exception(UNIMPLEMENTED, "to_charset for binary not implemented");
}

static STRING *
copy_to_charset(Interp *interpreter, STRING *source_string,
        CHARSET *new_charset)
{
    STRING *return_string = NULL;
    internal_exception(UNIMPLEMENTED,
            "copy_to_charset for binary not implemented");
    return return_string;
}

static void
to_unicode(Interp *interpreter, STRING *source_string)
{
    internal_exception(UNIMPLEMENTED, "to_unicode for binary not implemented");
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

/* A noop. can't compose binary */
static void
compose(Interp *interpreter, STRING *source_string)
{
}

/* A noop. can't decompose binary */
static void
decompose(Interp *interpreter, STRING *source_string)
{
}

static void
upcase(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

static void
downcase(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

static void
titlecase(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

static void
upcase_first(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

static void
downcase_first(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

static void
titlecase_first(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
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
    return -1;
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
find_not_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset) {
    return -1;
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
    return -1;
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
    return -1;
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
    return -1;
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
    return_string = string_make(interpreter, &real_codepoint, 1, "binary", 0);
    return return_string;
}


CHARSET *
Parrot_charset_binary_init(Interp *interpreter)
{
  CHARSET *return_set = Parrot_new_charset(interpreter);
  CHARSET base_set = {
      "binary",
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
      ascii_compute_hash,
      {NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL,
          NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL}
  };

  /* Snag the global. This is... bad. Should be properly fixed at some
     point */
  preferred_encoding = Parrot_fixed_8_encoding_ptr;

/*  preferred_encoding = Parrot_load_encoding(interpreter, "fixed_8"); */


  memcpy(return_set, &base_set, sizeof(CHARSET));
  Parrot_register_charset(interpreter, "binary", return_set);
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
