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
    UINTVAL buflen;
    UINTVAL flags;
    UINTVAL bufused;
    UINTVAL strlen;
    const ENCODING *encoding;
    const CHARTYPE *type;
    INTVAL language;
} STRING;


/* Generic buffer header. Enough to GC */
typedef struct {
    void *bufstart;
    UINTVAL buflen;
    UINTVAL flags;
}

/* Buffer flags */
typedef enum {
    /* The contents of the buffer can't be moved by the GC */
    BUFFER_immobile_FLAG	= 2 << 0;
    /* Private flag for the GC system. Set if the buffer's in use as
       far as the GC's concerned */
    BUFFER_GC_FLAG		= 2 << 1;
} BUFFER_flags;

/* Declarations of accessors */

INTVAL
string_compute_strlen(STRING*);
STRING*
string_concat(struct Parrot_Interp *interpreter, const STRING*, const STRING*,
              UINTVAL);
STRING*
string_repeat(struct Parrot_Interp *interpreter, const STRING* , UINTVAL,
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
UINTVAL
string_length(const STRING*);
INTVAL
string_ord(const STRING* s, INTVAL idx);
FLOATVAL
string_to_num (const STRING *s);
INTVAL
string_to_int (const STRING *s);
void
string_destroy(STRING* s);
STRING*
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            UINTVAL buflen, const ENCODING *encoding, UINTVAL flags,
            const CHARTYPE *type);
STRING*
string_copy(struct Parrot_Interp *interpreter, const STRING *i);
STRING*
string_transcode(struct Parrot_Interp *interpreter, const STRING *src,
                 const ENCODING *encoding, const CHARTYPE *type, STRING **d);
void
string_init(void);
INTVAL
string_index(const STRING* s, UINTVAL idx);

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
