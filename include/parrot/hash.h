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

typedef enum {
    enum_hash_undef,
    enum_hash_int = enum_type_INTVAL,
    enum_hash_num = enum_type_FLOATVAL,
    enum_hash_string = enum_type_STRING,
    enum_hash_pmc = enum_type_PMC
} HASH_ENTRY_TYPE;

typedef struct _hash_entry {
    HASH_ENTRY_TYPE type;
    UnionVal val;
} HASH_ENTRY;

/* A BucketIndex is an index into the pool of available buckets. */
typedef UINTVAL BucketIndex;
typedef UINTVAL HashIndex;
struct _hashbucket {
    STRING *key;
    HASH_ENTRY value;
    BucketIndex next;
};

struct _hash {
    Buffer buffer;              /* This struct is a Buffer subclass! */
    HashIndex max_chain;
    UINTVAL entries;            /* Number of values stored in hashtable */
    Buffer *bucket_pool;        /* Buffer full of buckets, used and unused */
    BucketIndex free_list;
};

void new_hash(Interp * interpreter, HASH **hash_ptr);
void hash_clone(Interp * interpreter, HASH * src, HASH **dest);
INTVAL hash_size(Interp * interpreter, HASH *hash);
void hash_set_size(Interp * interpreter, HASH *hash, UINTVAL size);
void hash_destroy(Interp * interpreter, HASH *hash);
HASH_ENTRY *hash_get(Interp * interpreter, HASH *hash, STRING *key);
void hash_put(Interp * interpreter, HASH *hash, STRING *key, HASH_ENTRY * value);
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
