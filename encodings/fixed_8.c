/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/fixed_8.c

=head1 DESCRIPTION

This file implements the encoding functions for fixed-width 8-bit codepoints

=cut

*/

#include "parrot/parrot.h"
#include "fixed_8.h"

static void to_encoding(Interp *interpreter, STRING *source_string) {
}

static STRING *copy_to_encoding(Interp *interpreter, STRING *source_string) {
  STRING *return_string = NULL;

  return return_string;
}

/* codepoints are bytes, so delegate */
static UINTVAL get_codepoint(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  return get_byte(interpreter, source_string, offset);
}

/* This is the same as set byte */
static void set_codepoint(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL codepoint) {
  set_byte(interpreter, source_string, offset, codepoint);
}

static UINTVAL get_byte(Interp *interpreter, STRING *source_string, UINTVAL offset) {
  if (offset >= source_string->bufused) {
    INTERNAL_EXCEPTION(0, "get_byte past the end of the buffer");
  }
  char *contents = source_string->strstart;
  return contents[offset];
}

static void set_byte(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL byte) {
}

/* Delegate to get_bytes */
static STRING *get_codepoints(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count) {
 
  return get_bytes(interpreter, source_string, offset, count);
}

static STRING *get_bytes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count) {
  STRING *return_string = NULL;
 
  return return_string;
}

/* Delegate to set_bytes */
static void set_codepoints(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_codepoints) {
  set_bytes(interpreter, source_string, offset, count, new_codepoints);
}

static void set_bytes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes) {
}

static void become_encoding(Interp *interpreter, STRING *source_string) {
}


static UINTVAL codepoints(Interp *interpreter, STRING *source_string) {
  return source_string->bufused;
}

static UINTVAL bytes(Interp *interpreter, STRING *source_string) {
  return source_string->bufused;
}

ENCODING *Parrot_encoding_fixed_8_init(Interp *interpreter) {
  ENCODING *return_encoding = Parrot_new_encoding(interpreter);

  ENCODING base_encoding = {
  };
  memcpy(return_encoding, &base_encoding, sizeof(ENCODING));
  return return_encoding;
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




