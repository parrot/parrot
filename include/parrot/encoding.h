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

struct parrot_encoding_t {
    const char *name;
    Parrot_UInt max_bytes;
    Parrot_UInt (*characters)(const void *ptr, Parrot_UInt bytes);
    Parrot_UInt (*decode)(const void *ptr);
    void *(*encode)(void *ptr, Parrot_UInt c);
    void *(*skip_forward)(const void *ptr, Parrot_UInt n);
    void *(*skip_backward)(const void *ptr, Parrot_UInt n);
};

#define Parrot_Encoding struct parrot_encoding_t *

const Parrot_Encoding
Parrot_encoding_lookup(const char *name);

#ifdef PARROT_IN_CORE

#define ENCODING struct parrot_encoding_t

#define encoding_lookup Parrot_encoding_lookup

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
