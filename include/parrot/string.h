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
    INTVAL language;
} STRING;


/* Declarations of accessors */

INTVAL
string_compute_strlen(STRING*);
STRING*
string_concat(struct Parrot_Interp *interpreter, const STRING*, const STRING*,
              INTVAL);
STRING*
string_repeat(struct Parrot_Interp *interpreter, const STRING* , INTVAL,
              STRING**);
STRING*
string_chopn(STRING*, INTVAL);
STRING*
string_substr(struct Parrot_Interp *interpreter, const STRING*, INTVAL,
              INTVAL, STRING**);
INTVAL
string_compare(struct Parrot_Interp *interpreter, const STRING*, const STRING*);
BOOLVAL
string_bool(const STRING*);

/* Declarations of other functions */
INTVAL
string_length(const STRING*);
INTVAL
string_ord(const STRING* s, INTVAL index);
FLOATVAL
string_to_num (const STRING *s);
INTVAL
string_to_int (const STRING *s);
void
string_destroy(STRING* s);
STRING*
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            INTVAL buflen, const ENCODING *encoding, INTVAL flags,
            const CHARTYPE *type);
STRING*
string_copy(struct Parrot_Interp *interpreter, const STRING *i);
STRING*
string_transcode(struct Parrot_Interp *interpreter, const STRING *src,
                 const ENCODING *encoding, const CHARTYPE *type, STRING **d);
void
string_init(void);
static INTVAL
string_index(const STRING* s, INTVAL index);

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
