/* hash.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

/*
 * hash_entry is currently unused
 */
typedef struct _hash_entry {
    HASH_ENTRY_TYPE type;
    UnionVal val;
} HASH_ENTRY;

/* A BucketIndex is an index into the pool of available buckets. */
typedef UINTVAL BucketIndex;
#define INITBucketIndex ((BucketIndex)-2)
typedef UINTVAL HashIndex;
struct _hashbucket {
    void *key;
    BucketIndex next;
    void *value;
};

typedef int    (*hash_comp_fn)(Parrot_Interp, void*, void*);
typedef void   (*hash_mark_key_fn)(Parrot_Interp, PObj *);
typedef size_t (*hash_hash_key_fn)(Parrot_Interp, void*);

struct _hash {
    Buffer buffer;              /* This struct is a Buffer subclass! */
    HashIndex max_chain;
    UINTVAL entries;            /* Number of values stored in hashtable */
    Buffer *bucket_pool;        /* Buffer full of buckets, used and unused */
    BucketIndex free_list;
    PARROT_DATA_TYPES entry_type;   /* type of value */
    size_t value_size;          /* currently unused, if set this size
                                   at value is copied as a hash_entry */
    hash_comp_fn   compare;
    hash_hash_key_fn hash_val;
    hash_mark_key_fn mark_key;
};

HASH * new_hash(Interp * interpreter);
HASH * new_hash_x(Interp * interpreter,
        hash_comp_fn, hash_hash_key_fn, hash_mark_key_fn);
HASH * new_cstring_hash(Interp *interpreter);
HASH * hash_clone(Interp * interpreter, HASH * src);
INTVAL hash_size(Interp * interpreter, HASH *hash);
void hash_set_size(Interp * interpreter, HASH *hash, UINTVAL size);
void hash_destroy(Interp * interpreter, HASH *hash);
HASHBUCKET *hash_get(Interp * interpreter, HASH *hash, void *key);
void hash_put(Interp * interpreter, HASH *hash, void *key, void *value);
void hash_delete(Interp * interpreter, HASH *hash, void *key);
void mark_hash(Interp * interpreter, HASH *hash);
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
