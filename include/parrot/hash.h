/* hash.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Hashtable implementation
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_HASH_H_GUARD)
#define PARROT_HASH_H_GUARD

/* Prototypes */

typedef struct _hashbucket HASHBUCKET;

/* HASH is really a hashtable, but 'hash' is standard perl nomenclature. */
typedef struct _hash HASH;

HASH *new_hash(Interp * interpreter);
INTVAL hash_size(Interp * interpreter, HASH *hash);
void hash_set_size(Interp * interpreter, HASH *hash, UINTVAL size);
void hash_destroy(Interp * interpreter, HASH *hash);
KEY_ATOM *hash_get(Interp * interpreter, HASH *hash, STRING *key);
void hash_put(Interp * interpreter, HASH *hash, STRING *key, KEY_ATOM * value);
void hash_delete(Interp * interpreter, HASH *hash, STRING *key);
PMC *mark_hash(Interp * interpreter, HASH *hash, PMC * end_of_used_list);
void dump_hash(Interp * interpreter, HASH *hash);

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
