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

typedef struct {
    void *bufstart;
    INTVAL buflen;
    INTVAL flags;
    INTVAL bufused;
    INTVAL strlen;
    const ENCODING *encoding;
    const CHARTYPE *type;
    INTVAL lanugage;
} STRING;


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
INTVAL
string_ord(STRING* s, INTVAL index);
void
string_grow(STRING* s, INTVAL newsize);
void
string_destroy(STRING* s);
STRING*
string_make(struct Parrot_Interp *interpreter, void *buffer, INTVAL buflen, const ENCODING *encoding, INTVAL flags, const CHARTYPE *type);
STRING*
string_copy(struct Parrot_Interp *interpreter, STRING *i);
STRING*
string_transcode(struct Parrot_Interp *interpreter, STRING *src, const ENCODING *encoding, const CHARTYPE *type, STRING *dest);
void
string_init(void);

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
