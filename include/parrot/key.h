/* key.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_KEY_H_GUARD)
#define PARROT_KEY_H_GUARD

typedef enum {
    enum_key_undef,
    enum_key_int,
    enum_key_num,
    enum_key_string,
    enum_key_pmc,
    enum_key_max
} KEY_TYPE;

typedef struct _key_atom KEY_ATOM;

struct _key_atom {
    KEY_TYPE type;
    UnionVal val;
};

typedef struct _key KEY;

struct _key {
    KEY_ATOM atom;
    KEY* next;
};

KEY * key_new(Interp *interpreter);
KEY * key_clone(Interp *interpreter, KEY *key);

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
