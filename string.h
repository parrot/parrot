/* string.h
 *
 * String data info
 *
 */

#if !defined(PARROT_STRING_H_GUARD)
#define PARROT_STRING_H_GUARD 1

typedef struct parrot_string STRING;
typedef struct string_vtable STRING_VTABLE;

typedef enum {
    enc_native,
    enc_utf8,
    enc_utf16,
    enc_utf32,
    enc_foreign,
    enc_max
} encoding_t;


/* String vtable functions */

typedef IV (*string_to_iv_t)(STRING *);
typedef STRING* (*string_iv_to_string_t)(STRING *, IV);
typedef STRING* (*two_strings_iv_to_string_t)(STRING *, STRING *, IV);
typedef STRING* (*substr_t)(STRING*, IV, IV, STRING*);
typedef IV (*iv_to_iv_t)(IV);

struct string_vtable {
    encoding_t which;                   /* What sort of encoding is this? */
    string_to_iv_t compute_strlen;      /* How long is a piece of string? */
    iv_to_iv_t max_bytes;               /* I have n characters - how many bytes should I allocate? */
    two_strings_iv_to_string_t concat;  /* Append string b to the end of string a */
    string_iv_to_string_t chopn;        /* Remove n characters from the end of a string */
    substr_t substr;                    /* Substring operation */
};

struct parrot_string {
  void *bufstart;
  IV buflen;
  IV bufused;
  IV flags;
  IV strlen;
  STRING_VTABLE* encoding;
  IV type;
  IV unused;
};


/* Declarations of accessors */

IV string_compute_strlen(STRING*);
IV string_max_bytes(STRING*, IV);
STRING* string_concat(STRING*, STRING*, IV);
STRING* string_chopn(STRING*, IV);
STRING* string_substr(STRING*, IV, IV, STRING**);

/* Declarations of other functions */
IV string_length(STRING*);
void string_grow(STRING* s, IV newsize);
void string_destroy(STRING* s);
STRING* string_make(void *buffer, IV buflen, IV encoding, IV flags, IV type);
void string_init(void);

STRING_VTABLE Parrot_string_vtable[enc_max];

#include "strnative.h"
#endif
