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

static STRING *get_graphemes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count) {
  STRING *return_string = NULL;

  return return_string;
}

static void set_graphemes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL replace_count, STRING *insert_string) {
}

static void to_charset(Interp *interpreter, STRING *source_string, CHARSET new_charset) {
}

static STRING *copy_to_charset(Interp *interpreter, STRING *source_string, CHARSET new_charset) {
  STRING *return_string = NULL;

  return return_string;
}

static void to_unicode(Interp *interpreter, STRING *source_string) {
}

static void compose(Interp *interpreter, STRING *source_string) {
}

static void decompose(Interp *interpreter, STRING *source_string) {
}

static void upcase(Interp *interpreter, STRING *source_string) {
}

static void downcase(Interp *interpreter, STRING *source_string) {
}

static void titlecase(Interp *interpreter, STRING *source_string) {
}

static void upcase_first(Interp *interpreter, STRING *source_string) {
}

static void downcase_first(Interp *interpreter, STRING *source_string) {
}

static void titlecase_first(Interp *interpreter, STRING *source_string) {
}

static INTVAL compare(Interp *interpreter, STRING *lhs, STRING *rhs) {
  return 0;
}

static INTVAL index(Interp *interpreter, STRING *source_string, STRING *search_string, UINTVAL offset) {
  return -1;
}

static INTVAL rindex(Interp *interpreter, STRING *source_string, STRING *search_string, UINTVAL offset) {
  return -1;
}

static UINTVAL validate(Interp *interpreter, STRING *source_string) {
}

static INTVAL is_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return 0;
}

static INTVAL find_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return -1;
}

static INTVAL find_not_wordchar(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return offset;
}

static INTVAL is_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return 0;
}

static INTVAL find_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return -1;
}

static INTVAL find_not_whitespace(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return offset;
}

static INTVAL is_digit(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return 0;
}

static INTVAL find_digit(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return -1;
}

static INTVAL find_not_digit(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return offset;
}

static INTVAL is_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return 0;
}

static INTVAL find_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return -1;
}

static INTVAL find_not_punctuation(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return offset;
}

static INTVAL is_newline(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return 0;
}

static INTVAL find_newline(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return -1;
}

static INTVAL find_not_newline(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return offset;
}

static INTVAL find_word_boundary(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return -1;
}

CHARSET *Parrot_charset_binary_init(Interp *interpreter) {
  CHARSET *return_set = Parrot_new_charset(interpreter);
  CHARSET base_set = {
  };

  memcpy(return_set, &base_set, sizeof(CHARSET));
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
