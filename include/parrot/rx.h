/* rx.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Supporting file for the regular expression engine
 *  Data Structure and Algorithms:
 *     rxinfo is the main structure involved in regular expressions; it's
 *     stuffed into a Handle PMC and passed to all regular expression 
 *     opcodes.
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_RX_H_GUARD)
#define PARROT_RX_H_GUARD

#include "parrot/parrot.h"
#include "parrot/rxstacks.h"

typedef struct bitmap_t {
    char *bmp;
    STRING *bigchars;
} *Bitmap;

extern const INTVAL RX_MARK;
extern const char *RX_WORDCHARS;
extern const char *RX_NUMCHARS;
extern const char *RX_SPACECHARS;
extern const char *RX_NEWLINES;

#define cstr2pstr(cstr) string_make(interpreter, cstr, strlen(cstr), "iso-8859-1", 0)

INTVAL rx_is_word_character(struct Parrot_Interp *, INTVAL ch);
INTVAL rx_is_number_character(struct Parrot_Interp *, INTVAL ch);
INTVAL rx_is_whitespace_character(struct Parrot_Interp *, INTVAL ch);
INTVAL rx_is_newline(struct Parrot_Interp *, INTVAL ch);

Bitmap bitmap_make(struct Parrot_Interp *, STRING *);
Bitmap bitmap_make_cstr(struct Parrot_Interp *, const char *);
void bitmap_add(struct Parrot_Interp *, Bitmap, INTVAL);
INTVAL bitmap_match(struct Parrot_Interp*, Bitmap, INTVAL);
void bitmap_destroy(struct Parrot_Interp*, Bitmap);

#endif /* PARROT_RX_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
