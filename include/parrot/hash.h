/* hash.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Hashtable implementation
 */

#ifndef PARROT_HASH_H_GUARD
#define PARROT_HASH_H_GUARD

typedef enum {
    enum_hash_undef,
    enum_hash_int    = enum_type_INTVAL,
    enum_hash_num    = enum_type_FLOATVAL,
    enum_hash_string = enum_type_STRING,
    enum_hash_pmc    = enum_type_PMC,
    enum_hash_ptr    = enum_type_ptr
} HashEntryType;


/* A BucketIndex is an index into the pool of available buckets. */
typedef UINTVAL BucketIndex;

#define N_BUCKETS(n) ((n))
#define HASH_ALLOC_SIZE(n) (N_BUCKETS(n) * sizeof (HashBucket) + \
                                     (n) * sizeof (HashBucket *))

/* &gen_from_enum(hash_key_type.pasm) */
typedef enum {
    Hash_key_type_int,
    Hash_key_type_cstring,
    Hash_key_type_STRING,
    Hash_key_type_PMC,
    Hash_key_type_ptr,
    Hash_key_type_PMC_ptr,
    Hash_key_type_STRING_enc
} Hash_key_type;
/* &end_gen */

typedef struct _hashbucket {
    struct _hashbucket *next;
    void *key;
    void *value;
} HashBucket;

struct _hash {
    /* Large slab store of buckets */
    HashBucket *buckets;

    /* List of Bucket pointers */
    HashBucket **index;

    /* Store for empty buckets */
    HashBucket *free_list;

    /* Number of values stored in hashtable */
    UINTVAL entries;

    /* alloced - 1 */
    UINTVAL mask;

    /* The type of key object this hash uses */
    Hash_key_type key_type;

    /* Type of value */
    PARROT_DATA_TYPE entry_type;

    /* Random seed value for seeding hash algorithms */
    size_t seed;

};

/* Utility macros - use them, do not reinvent the wheel */

#define parrot_hash_iterate_linear(_hash, _code)                            \
{                                                                           \
    HashBucket *_bucket = (_hash)->buckets;                                 \
    UINTVAL     _found  = 0;                                                \
    while (_found < (_hash)->entries){                                      \
        if (_bucket->key){                                                  \
            _code                                                           \
            _found++;                                                       \
        }                                                                   \
       _bucket++;                                                           \
    }                                                                       \
}

#define parrot_hash_iterate_indexed(_hash, _code)                           \
{                                                                           \
    UINTVAL _loc;                                                           \
    if ((_hash)->entries){                                                  \
        for (_loc = 0; _loc <= (_hash)->mask; ++_loc) {                     \
            HashBucket *_bucket = (_hash)->index[_loc];                     \
            while (_bucket) {                                               \
                _code                                                       \
                _bucket = _bucket->next;                                    \
            }                                                               \
        }                                                                   \
    }                                                                       \
}

#define parrot_hash_iterate(_hash, _code)                                   \
{                                                                           \
    if ((_hash)->key_type == Hash_key_type_int                              \
    ||  (_hash)->key_type == Hash_key_type_cstring                          \
    ||  (_hash)->key_type == Hash_key_type_ptr)                             \
        parrot_hash_iterate_indexed((_hash), _code)                         \
    else                                                                    \
        parrot_hash_iterate_linear((_hash), _code)                          \
}

typedef void (*value_free)(ARGFREE(void *));

/* To avoid creating OrderedHashItem PMC we reuse FixedPMCArray PMC */
/* So, there is indexes to avoid using of "magick constants" */
enum ORDERED_HASH_ITEM_PART {
    ORDERED_HASH_ITEM_KEY   = 0,
    ORDERED_HASH_ITEM_VALUE = 1,
    ORDERED_HASH_ITEM_PREV  = 2,
    ORDERED_HASH_ITEM_NEXT  = 3,
    ORDERED_HASH_ITEM_MAX   = 4
};

/* HEADERIZER BEGIN: src/hash.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void parrot_dump_hash(SHIM_INTERP, SHIM(const Hash *hash));

PARROT_EXPORT
void parrot_hash_clone(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGOUT(Hash *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
void parrot_hash_delete(PARROT_INTERP, ARGMOD(Hash *hash), ARGIN(void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hash);

PARROT_EXPORT
void parrot_hash_destroy(PARROT_INTERP, ARGFREE_NOTNULL(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL parrot_hash_exists(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN(void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * parrot_hash_get(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN(const void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
HashBucket * parrot_hash_get_bucket(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(const void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
HashBucket* parrot_hash_put(PARROT_INTERP,
    ARGMOD(Hash *hash),
    ARGIN_NULLOK(void *key),
    ARGIN_NULLOK(void *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hash);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL parrot_hash_size(SHIM_INTERP, ARGIN(const Hash *hash))
        __attribute__nonnull__(2);

PARROT_EXPORT
void parrot_mark_hash(PARROT_INTERP, ARGMOD(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hash);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Hash* parrot_new_cstring_hash(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Hash* parrot_new_hash(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Hash* parrot_new_intval_hash(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Hash * parrot_new_pointer_hash(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
void* hash_key_from_int(PARROT_INTERP, ARGIN(const Hash *hash), INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void* hash_key_from_pmc(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
void* hash_key_from_string(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN(STRING *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

INTVAL hash_key_to_int(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PMC* hash_key_to_pmc(PARROT_INTERP,
    ARGIN(const Hash * const hash),
    ARGIN(void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
STRING* hash_key_to_string(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(void *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void* hash_value_from_int(PARROT_INTERP,
    ARGIN(const Hash *hash),
    INTVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void* hash_value_from_number(PARROT_INTERP,
    ARGIN(const Hash *hash),
    FLOATVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void* hash_value_from_pmc(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(PMC *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
void* hash_value_from_string(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(STRING *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL hash_value_to_int(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(void *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

FLOATVAL hash_value_to_number(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(void *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PMC* hash_value_to_pmc(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(void *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
STRING* hash_value_to_string(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGIN_NULLOK(void *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void parrot_chash_destroy(PARROT_INTERP, ARGMOD(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hash);

void parrot_chash_destroy_values(PARROT_INTERP,
    ARGMOD(Hash *hash),
    NOTNULL(value_free func))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hash);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Hash * parrot_create_hash(PARROT_INTERP,
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Hash * parrot_create_hash_sized(PARROT_INTERP,
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type,
    UINTVAL size)
        __attribute__nonnull__(1);

void parrot_hash_clone_prunable(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGOUT(Hash *dest),
    int deep)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dest);

void Parrot_hash_freeze(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGMOD(PMC *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*info);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Hash * Parrot_hash_thaw(PARROT_INTERP, ARGMOD(PMC *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*info);

#define ASSERT_ARGS_parrot_dump_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_parrot_hash_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(dest))
#define ASSERT_ARGS_parrot_hash_delete __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_parrot_hash_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_hash_exists __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_parrot_hash_get __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_parrot_hash_get_bucket __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_hash_put __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_hash_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_mark_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_new_cstring_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_new_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_new_intval_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_new_pointer_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_hash_key_from_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_key_from_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_hash_key_from_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_hash_key_to_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_key_to_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_hash_key_to_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_from_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_from_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_from_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_from_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_to_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_to_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_to_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_value_to_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_chash_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_chash_destroy_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(func))
#define ASSERT_ARGS_parrot_create_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_create_hash_sized __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_hash_clone_prunable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(dest))
#define ASSERT_ARGS_Parrot_hash_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_Parrot_hash_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(info))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/hash.c */

#endif /* PARROT_HASH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
