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

struct parrot_string_t {
    void *bufstart;
    UINTVAL buflen;
    UINTVAL flags;
    UINTVAL bufused;
    UINTVAL strlen;
    const ENCODING *encoding;
    const CHARTYPE *type;
    INTVAL language;
};

#define Parrot_String struct parrot_string_t *

#ifdef PARROT_IN_CORE

#include "parrot/parrot.h"

/* Generic buffer header. Enough to GC */
typedef struct {
    void *bufstart;
    UINTVAL buflen;
    UINTVAL flags;
} Buffer;

/* Buffer flags */
typedef enum BUFFER_flag {
    /* bits the GC can keep its dirty mitts off of */
    BUFFER_private0_FLAG = 1<< 0,
    BUFFER_private1_FLAG = 1<< 1,
    BUFFER_private2_FLAG = 1<< 2,
    BUFFER_private3_FLAG = 1<< 3,
    BUFFER_private4_FLAG = 1<< 4,
    BUFFER_private5_FLAG = 1<< 5,
    BUFFER_private6_FLAG = 1<< 6,
    BUFFER_private7_FLAG = 1<< 7,
    /* The contents of the buffer can't be moved by the GC */
    BUFFER_immobile_FLAG = 1 << 8,
    /* Marks the contents as coming from a non-Parrot source */
    BUFFER_external_FLAG = 1 << 9,
    /* Mark the buffer as pointing to system memory */
    BUFFER_sysmem_FLAG = 1 << 10,
    /* Mark the contents as Copy on write */
    BUFFER_COW_FLAG = 1 << 11,
    /* Private flag for the GC system. Set if the buffer's in use as
     * far as the GC's concerned */
    BUFFER_live_FLAG = 1 << 12,
    /* Mark the bufffer as needing GC */
    BUFFER_needs_GC_FLAG = 1 << 13,
    /* Mark the buffer as on the free list */
    BUFFER_on_free_list_FLAG = 1 << 14,
    /* This is a constant--don't kill it! */
    BUFFER_constant_FLAG = 1 << 15
} BUFFER_flags;

#define STRING struct parrot_string_t

#endif

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
