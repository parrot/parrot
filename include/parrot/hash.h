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

/* Hash is really a hashtable, but 'hash' is standard perl nomenclature. */

typedef enum {
    enum_hash_undef,
    enum_hash_int = enum_type_INTVAL,
    enum_hash_num = enum_type_FLOATVAL,
    enum_hash_string = enum_type_STRING,
    enum_hash_pmc = enum_type_PMC
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
    Hash_key_type_PMC
} Hash_key_type;

typedef struct _hashbucket {
    struct _hashbucket *next;
    void *key;
    void *value;
} HashBucket;

typedef struct _hash {
    union {
	HashBucket **bi;        /* list of Bucket pointers */
	HashBucket *bs;         /* store of buckets */
    } bu;
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

void new_hash(Interp * interpreter, Hash **hptr);
void hash_destroy(Interp * interpreter, Hash *h);
void new_pmc_hash(Interp * interpreter, PMC *container);
void new_hash_x(Interp *, Hash**, PARROT_DATA_TYPES,
        Hash_key_type, hash_comp_fn, hash_hash_key_fn);
void new_pmc_hash_x(Interp *, PMC*, PARROT_DATA_TYPES,
        Hash_key_type, hash_comp_fn, hash_hash_key_fn);
void new_cstring_hash(Interp *interpreter, Hash **);

PMC* Parrot_new_INTVAL_hash(Interp *interpreter, UINTVAL flags);

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
void* hash_get_idx(Interp *interpreter, Hash *hash, PMC *key);

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
