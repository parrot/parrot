/* encoding.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string encoding subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ENCODING_H_GUARD)
#define PARROT_ENCODING_H_GUARD

typedef struct {
    const char *name;
    INTVAL max_bytes;
    INTVAL (*characters)(const void *ptr, INTVAL bytes);
    INTVAL (*decode)(const void *ptr);
    void *(*encode)(void *ptr, INTVAL c);
    void *(*skip_forward)(const void *ptr, INTVAL n);
    void *(*skip_backward)(const void *ptr, INTVAL n);
} ENCODING;

const ENCODING *
encoding_lookup(const char *name);

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
