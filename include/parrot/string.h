/* string.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_STRING_H_GUARD)
#define PARROT_STRING_H_GUARD

#include "parrot/parrot.h"

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

typedef INTVAL (*string_to_iv_t)(STRING *);
typedef STRING* (*string_iv_to_string_t)(STRING *, INTVAL);
typedef STRING* (*two_strings_iv_to_string_t)(struct Parrot_Interp *, STRING *, STRING *, INTVAL);
typedef STRING* (*substr_t)(STRING*, INTVAL, INTVAL, STRING*);
typedef INTVAL (*iv_to_iv_t)(INTVAL);
typedef INTVAL (*two_strings_to_iv_t)(STRING*, STRING*);

struct string_vtable {
    encoding_t which;                   /* What sort of encoding is this? */
    string_to_iv_t compute_strlen;      /* How long is a piece of string? */
    iv_to_iv_t max_bytes;               /* I have n characters - how many bytes should I allocate? */
    two_strings_iv_to_string_t concat;  /* Append string b to the end of string a */
    string_iv_to_string_t chopn;        /* Remove n characters from the end of a string */
    substr_t substr;                    /* Substring operation */
    two_strings_to_iv_t compare;        /* Compare operation */
};

struct parrot_string {
    void *bufstart;
    INTVAL buflen;
    INTVAL bufused;
    INTVAL flags;
    INTVAL strlen;
    STRING_VTABLE* encoding;
    INTVAL type;
    INTVAL lanugage;
};


/* Declarations of accessors */

INTVAL
string_compute_strlen(STRING*);
INTVAL
string_max_bytes(STRING*, INTVAL);
STRING*
string_concat(struct Parrot_Interp *, STRING*, STRING*, INTVAL);
STRING*
string_chopn(STRING*, INTVAL);
STRING*
string_substr(struct Parrot_Interp *interpreter, STRING*, INTVAL, INTVAL, STRING**);
INTVAL
string_compare(struct Parrot_Interp *, STRING*, STRING*);

/* Declarations of other functions */
INTVAL
string_length(STRING*);
void
string_grow(STRING* s, INTVAL newsize);
void
string_destroy(STRING* s);
STRING*
string_make(struct Parrot_Interp *interpreter, void *buffer, INTVAL buflen, INTVAL encoding, INTVAL flags, INTVAL type);
STRING*
string_copy(struct Parrot_Interp *interpreter, STRING *i);
void
string_init(void);

VAR_SCOPE STRING_VTABLE Parrot_string_vtable[enc_max];

#include "parrot/strnative.h"
#include "parrot/strutf8.h"
#include "parrot/strutf16.h"
#include "parrot/strutf32.h"
#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
