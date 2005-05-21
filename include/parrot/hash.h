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

typedef struct _hashbucket HashBucket;

/* Hash is really a hashtable, but 'hash' is standard perl nomenclature. */
typedef struct _hash Hash;

typedef enum {
    enum_hash_undef,
    enum_hash_int = enum_type_INTVAL,
    enum_hash_num = enum_type_FLOATVAL,
    enum_hash_string = enum_type_STRING,
    enum_hash_pmc = enum_type_PMC
} HashEntryType;

/*
 * hash_entry is currently unused
 */
typedef struct _hash_entry {
    HashEntryType type;
    UnionVal val;
} HashEntry;

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
typedef size_t (*hash_hash_key_fn)(Parrot_Interp, void*, size_t seed);

/* XXX */
typedef enum {
    Hash_key_type_none,
    Hash_key_type_int,
    Hash_key_type_cstring,
    Hash_key_type_ascii,
    Hash_key_type_utf8
} Hash_key_type;

struct _hash {
    Buffer buffer;              /* This struct is a Buffer subclass! */
    HashIndex max_chain;
    UINTVAL entries;            /* Number of values stored in hashtable */
    Buffer *bucket_pool;        /* Buffer full of buckets, used and unused */
    BucketIndex free_list;
    PMC *container;             /* e.g. the PerlHash PMC */
    PARROT_DATA_TYPES entry_type;   /* type of value */
    size_t value_size;          /* currently unused, if set this size
                                   at value is copied as a hash_entry */
    size_t seed;                /* randomizes the hash_key generation
                                   updated for each new hash */
    Hash_key_type key_type;     /* cstring, ascii-string, utf8-string */
    hash_comp_fn   compare;     /* compare two keys, 0 = equal */
    hash_hash_key_fn hash_val;  /* generate a hash value for key */
    hash_mark_key_fn mark_key;  /* mark a key being alive */
};

void new_hash(Interp * interpreter, Hash **hptr);
void new_pmc_hash(Interp * interpreter, PMC *container);
void new_hash_x(Interp *, Hash**, PARROT_DATA_TYPES, size_t val_size,
        Hash_key_type, hash_comp_fn, hash_hash_key_fn, hash_mark_key_fn);
void new_pmc_hash_x(Interp *, PMC*, PARROT_DATA_TYPES, size_t val_size,
        Hash_key_type, hash_comp_fn, hash_hash_key_fn, hash_mark_key_fn);
void new_cstring_hash(Interp *interpreter, Hash **);
void hash_clone(Interp * interpreter, Hash * src, Hash **dest);
INTVAL hash_size(Interp * interpreter, Hash *hash);
void hash_set_size(Interp * interpreter, Hash *hash, UINTVAL size);
void hash_destroy(Interp * interpreter, Hash *hash);
HashBucket *hash_get_bucket(Interp * interpreter, Hash *hash, void *key);
void *hash_get(Interp * interpreter, Hash *hash, void *key);
INTVAL hash_exists(Interp * interpreter, Hash *hash, void *key);
HashBucket *hash_put(Interp * interpreter, Hash *hash, void *key, void *value);
void hash_delete(Interp * interpreter, Hash *hash, void *key);
void mark_hash(Interp * interpreter, Hash *hash);
void hash_visit(Interp * interpreter, Hash *hash, void*);
void dump_hash(Interp * interpreter, Hash *hash);

#endif /* PARROT_HASH_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
