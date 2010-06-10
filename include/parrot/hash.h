/* hash.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Hashtable implementation
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

typedef struct _hash_entry {
    HashEntryType type;
    UnionVal val;
} HashEntry;
*/

/* A BucketIndex is an index into the pool of available buckets. */
typedef UINTVAL BucketIndex;
#define INITBucketIndex ((BucketIndex)-2)

#define N_BUCKETS(n) ((n) - (n)/4)
#define HASH_ALLOC_SIZE(n) (N_BUCKETS(n) * sizeof (HashBucket) + \
                                     (n) * sizeof (HashBucket *))

typedef int (*hash_comp_fn)(PARROT_INTERP, ARGIN(const void *), ARGIN(const void *));
typedef size_t (*hash_hash_key_fn)(PARROT_INTERP, ARGIN(const void *), size_t seed);

/* &gen_from_enum(hash_key_type.pasm) */
typedef enum {
    Hash_key_type_int,
    Hash_key_type_cstring,
    Hash_key_type_STRING,
    Hash_key_type_PMC,
    Hash_key_type_ptr
} Hash_key_type;
/* &end_gen */

typedef struct _hashbucket {
    struct _hashbucket *next;
    void *key;
    void *value;
} HashBucket;

struct _hash {
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
};

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
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * parrot_hash_get_idx(PARROT_INTERP,
    ARGIN(const Hash *hash),
    ARGMOD(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*key);

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
void parrot_hash_visit(PARROT_INTERP,
    ARGMOD(Hash *hash),
    ARGMOD(void *pinfo))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hash)
        FUNC_MODIFIES(*pinfo);

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

PARROT_CANNOT_RETURN_NULL
PMC* get_integer_pmc(PARROT_INTERP, INTVAL value)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC* get_number_pmc(PARROT_INTERP, FLOATVAL value)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC * get_string_pmc(PARROT_INTERP, ARGIN(STRING *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
int int_compare(SHIM_INTERP,
    ARGIN_NULLOK(const void *a),
    ARGIN_NULLOK(const void *b));

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
size_t key_hash_int(SHIM_INTERP,
    ARGIN_NULLOK(const void *value),
    size_t seed);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t key_hash_PMC(PARROT_INTERP, ARGIN(PMC *value), NULLOK(size_t seed))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
size_t key_hash_STRING(PARROT_INTERP,
    ARGMOD(STRING *s),
    NULLOK(size_t seed))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

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
PARROT_MALLOC
Hash * parrot_create_hash(PARROT_INTERP,
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type,
    NOTNULL(hash_comp_fn compare),
    NOTNULL(hash_hash_key_fn keyhash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int PMC_compare(PARROT_INTERP, ARGIN(PMC *a), ARGIN(PMC *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
int STRING_compare(PARROT_INTERP,
    ARGIN(const void *search_key),
    ARGIN_NULLOK(const void *bucket_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
int STRING_compare_distinct_cs_enc(PARROT_INTERP,
    ARGIN(const void *search_key),
    ARGIN(const void *bucket_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

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
#define ASSERT_ARGS_parrot_hash_get_idx __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_parrot_hash_put __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_hash_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_hash_visit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(pinfo))
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
#define ASSERT_ARGS_get_integer_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_number_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_string_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(value))
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
#define ASSERT_ARGS_int_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_key_hash_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_key_hash_PMC __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_key_hash_STRING __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_parrot_chash_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_chash_destroy_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(func))
#define ASSERT_ARGS_parrot_create_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(compare) \
    , PARROT_ASSERT_ARG(keyhash))
#define ASSERT_ARGS_PMC_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_STRING_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(search_key))
#define ASSERT_ARGS_STRING_compare_distinct_cs_enc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(search_key) \
    , PARROT_ASSERT_ARG(bucket_key))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/hash.c */

#endif /* PARROT_HASH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
