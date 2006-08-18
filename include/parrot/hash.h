/* hash.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
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

/* Hash is really a hashtable, but 'hash' is standard perl nomenclature. */

typedef enum {
    enum_hash_undef,
    enum_hash_int = enum_type_INTVAL,
    enum_hash_num = enum_type_FLOATVAL,
    enum_hash_string = enum_type_STRING,
    enum_hash_pmc = enum_type_PMC,
    enum_hash_ptr = enum_type_ptr
} HashEntryType;

/*
 * hash_entry is currently unused in the hash structure
 */
typedef struct _hash_entry {
    HashEntryType type;
    UnionVal val;
} HashEntry;

/* A BucketIndex is an index into the pool of available buckets. */
typedef UINTVAL BucketIndex;
#define INITBucketIndex ((BucketIndex)-2)

typedef int    (*hash_comp_fn)(Parrot_Interp, void*, void*);
typedef void   (*hash_mark_key_fn)(Parrot_Interp, PObj *);
typedef size_t (*hash_hash_key_fn)(Parrot_Interp, void*, size_t seed);

typedef enum {
    Hash_key_type_int,
    Hash_key_type_cstring,
    Hash_key_type_STRING,
    Hash_key_type_PMC,
    Hash_key_type_ptr
} Hash_key_type;

typedef struct _hashbucket {
    struct _hashbucket *next;
    void *key;
    void *value;
} HashBucket;

typedef struct _hash {
    HashBucket *bs;             /* store of buckets */
    HashBucket **bi;            /* list of Bucket pointers */
    HashBucket *free_list;      /* empty buckets */
    UINTVAL entries;            /* Number of values stored in hashtable */
    UINTVAL mask;               /* alloced - 1 */
    PMC *container;             /* e.g. the PerlHash PMC */
    Hash_key_type key_type;     /* cstring, ascii-string, utf8-string */
    PARROT_DATA_TYPES entry_type;   /* type of value */
    size_t seed;                /* randomizes the hash_key generation
                                   updated for each new hash */
    hash_comp_fn   compare;     /* compare two keys, 0 = equal */
    hash_hash_key_fn hash_val;  /* generate a hash value for key */
} Hash;

PARROT_API void parrot_new_hash(Interp * interpreter, Hash **hptr);
PARROT_API void parrot_hash_destroy(Interp * interpreter, Hash *h);
PARROT_API void parrot_new_pmc_hash(Interp * interpreter, PMC *container);
void parrot_new_hash_x(Interp *, Hash**, PARROT_DATA_TYPES,
        Hash_key_type, hash_comp_fn, hash_hash_key_fn);
void parrot_new_pmc_hash_x(Interp *, PMC*, PARROT_DATA_TYPES,
        Hash_key_type, hash_comp_fn, hash_hash_key_fn);
PARROT_API void parrot_new_cstring_hash(Interp *interpreter, Hash **);
PARROT_API void parrot_new_pointer_hash(Interp *interpreter, Hash **);

PARROT_API PMC* Parrot_new_INTVAL_hash(Interp *interpreter, UINTVAL flags);

PARROT_API void parrot_hash_clone(Interp * interpreter, Hash * src, Hash **dest);
PARROT_API INTVAL parrot_hash_size(Interp * interpreter, Hash *hash);
PARROT_API void parrot_hash_set_size(Interp * interpreter, Hash *hash, UINTVAL size);
PARROT_API void parrot_hash_destroy(Interp * interpreter, Hash *hash);
PARROT_API HashBucket *parrot_hash_get_bucket(Interp * interpreter, Hash *hash, void *key);
PARROT_API void *parrot_hash_get(Interp * interpreter, Hash *hash, void *key);
PARROT_API INTVAL parrot_hash_exists(Interp * interpreter, Hash *hash, void *key);
PARROT_API HashBucket *parrot_hash_put(Interp * interpreter, Hash *hash, void *key, void *value);
PARROT_API void parrot_hash_delete(Interp * interpreter, Hash *hash, void *key);
PARROT_API void parrot_mark_hash(Interp * interpreter, Hash *hash);
PARROT_API void parrot_hash_visit(Interp * interpreter, Hash *hash, void*);
PARROT_API void parrot_dump_hash(Interp * interpreter, Hash *hash);
PARROT_API void* parrot_hash_get_idx(Interp *interpreter, Hash *hash, PMC *key);

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
