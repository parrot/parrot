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

#include "parrot/config.h"
#include "parrot/encoding.h"
#include "parrot/chartype.h"
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
} Buffer;

/* Buffer flags */
typedef enum BUFFER_flag {
    /* The contents of the buffer can't be moved by the GC */
    BUFFER_immobile_FLAG	= 2 << 0,
    /* Private flag for the GC system. Set if the buffer's in use as
       far as the GC's concerned */
    BUFFER_GC_FLAG		= 2 << 1,
    /* Marks the contents as shared */
    BUFFER_shared_FLAG		= 2 << 2,
    /* Mark the contents as Copy on write */
    BUFFER_COW_FLAG		= 2 << 3,
    /* Mark the buffer as pointing to system memory */
    BUFFER_sysmem_FLAG		= 2 << 4
} BUFFER_flags;

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
