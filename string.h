/* string.h
 *
 * String data info
 *
 */

#if !defined(PARROT_STRING_H_GUARD)
#define PARROT_STRING_H_GUARD 1

struct parrot_string {
  void *bufstart;
  IV buflen;
  IV bufused;
  IV flags;
  IV strlen;
  IV encoding;
  IV type;
  IV unused;
};

enum {
    enc_native,
    enc_utf8,
    enc_utf16,
    enc_utf32,
    enc_foreign,
    enc_max
};

typedef struct parrot_string STRING;

/* String vtable functions */

typedef IV (*string_to_iv_t)(STRING *);
typedef IV (*iv_to_iv_t)(IV);

struct string_vtable {
    string_to_iv_t compute_strlen; /* How long is a piece of string? */
    iv_to_iv_t max_strlen;         /* I have n characters - how many bytes should I allocate? */
};

typedef struct string_vtable STRING_VTABLE;

/* Declarations of accessors */

IV string_compute_strlen(STRING*);

#include "strnative.h"
#endif
