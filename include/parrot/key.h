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
    KEY *next;
};

KEY *key_new(Interp *);
KEY *key_clone(Interp *, KEY *);

/* This (now even more) convoluted mess avoids costly runtime creation
 * of KEY structures
 *
 * Usage: MAKE_KEY(KEY k, (INTVAL|FLOATVAL|DPOINTER*|STRING*|PMC*) v,
 *                 KEY_TYPE c, (int_val|num_val|struct_val|string_val|pmc_val)); 
 * or:
 * MAKE_KEY_INT(KEY k, INTVAL v);
 * MAKE_KEY_STRING(KEY k, STRING *v);
 * MAKE_KEY_UNDEF(KEY k);
 * etc
 */

#define MAKE_KEY(k,v,c,t) {k.atom.type = c; k.atom.val.t = v; k.next = NULL;}
#define MAKE_KEY_UNDEF(k) {k.atom.type = enum_key_undef; k.atom.val.struct_val = NULL; k.next = NULL;}
#define MAKE_KEY_INT(k,v) {k.atom.type = enum_key_int; k.atom.val.int_val = v; k.next = NULL;}
#define MAKE_KEY_NUM(k,v) {k.atom.type = enum_key_num; k.atom.val.num_val = v; k.next = NULL;}
#define MAKE_KEY_STRING(k,v) {k.atom.type = enum_key_string; k.atom.val.struct_val = v; k.next = NULL;}
#define MAKE_KEY_PMC(k,v) {k.atom.type = enum_key_pmc; k.atom.val.pmc_val = v; k.next = NULL;}

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
