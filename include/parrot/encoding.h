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
    UINTVAL max_bytes;
    UINTVAL (*characters)(const void *ptr, UINTVAL bytes);
    UINTVAL (*decode)(const void *ptr);
    void *(*encode)(const void *ptr, UINTVAL c);
    void *(*skip_forward)(const void *ptr, UINTVAL n);
    void *(*skip_backward)(const void *ptr, UINTVAL n);
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
