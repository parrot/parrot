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

#ifndef PARROT_HASH_H_GUARD
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

typedef int    (*hash_comp_fn)(Parrot_Interp, const void*const, const void*const);
typedef void   (*hash_mark_key_fn)(Parrot_Interp, PObj *);
typedef size_t (*hash_hash_key_fn)(Parrot_Interp, NOTNULL(void*), size_t seed);

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
    PARROT_DATA_TYPE entry_type;/* type of value */
    size_t seed;                /* randomizes the hash_key generation
                                   updated for each new hash */
    hash_comp_fn   compare;     /* compare two keys, 0 = equal */
    hash_hash_key_fn hash_val;  /* generate a hash value for key */
} Hash;

/* HEADERIZER BEGIN: src/hash.c */

PARROT_API
void parrot_dump_hash( SHIM_INTERP, NOTNULL(const Hash *hash) )
        __attribute__nonnull__(2);

PARROT_API
void parrot_hash_clone( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(Hash **dest) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void parrot_hash_delete( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(void *key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void parrot_hash_destroy( SHIM_INTERP, NOTNULL(Hash *hash) )
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL parrot_hash_exists( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(void *key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * parrot_hash_get( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(void *key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
HashBucket * parrot_hash_get_bucket( PARROT_INTERP,
    NOTNULL(const Hash *hash),
    NOTNULL(void *key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * parrot_hash_get_idx( SHIM_INTERP,
    NOTNULL(const Hash *hash),
    NOTNULL(PMC *key) )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
HashBucket* parrot_hash_put( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(void *key),
    NULLOK(void *value) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL parrot_hash_size( PARROT_INTERP, NOTNULL(const Hash *hash) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void parrot_hash_visit( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(void *pinfo) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void parrot_mark_hash( PARROT_INTERP, NOTNULL(Hash *hash) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void parrot_new_cstring_hash( SHIM_INTERP, NOTNULL(Hash **hptr) )
        __attribute__nonnull__(2);

PARROT_API
void parrot_new_hash( SHIM_INTERP, NOTNULL(Hash **hptr) )
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_new_INTVAL_hash( PARROT_INTERP, UINTVAL flags )
        __attribute__nonnull__(1);

PARROT_API
void parrot_new_pmc_hash( PARROT_INTERP, NOTNULL(PMC *container) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void parrot_new_pointer_hash( SHIM_INTERP, NOTNULL(Hash **hptr) )
        __attribute__nonnull__(2);

void parrot_chash_destroy( PARROT_INTERP, NOTNULL(Hash *hash) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void parrot_new_hash_x(
    NOTNULL(Hash **hptr),
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type,
    hash_comp_fn compare,
    hash_hash_key_fn keyhash )
        __attribute__nonnull__(1);

void parrot_new_pmc_hash_x( SHIM_INTERP,
    NOTNULL(PMC *container),
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type,
    hash_comp_fn compare,
    hash_hash_key_fn keyhash )
        __attribute__nonnull__(2);

/* HEADERIZER END: src/hash.c */

#endif /* PARROT_HASH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
