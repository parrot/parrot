/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/hash.c - Hash table

=head1 DESCRIPTION

A hashtable contains an array of bucket indexes. Buckets are nodes in a
linked list, each containing a C<void *> key and value. During hash
creation, the types of key and value as well as appropriate compare and
hashing functions can be set.

This hash implementation uses just one piece of malloced memory. The
C<< hash->bs >> bucket store points to this region.

This hash doesn't move during GC, therefore a lot of the old caveats
don't apply.

=head2 Functions

*/

#include "parrot/parrot.h"
#include <assert.h>

#define INITIAL_BUCKETS 16

#define N_BUCKETS(n) ((n) - (n)/4)
#define HASH_ALLOC_SIZE(n) (N_BUCKETS(n) * sizeof (HashBucket) + \
                             (n) * sizeof (HashBucket *))

/* HEADERIZER HFILE: include/parrot/hash.h */

/* HEADERIZER BEGIN: static */

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int cstring_compare( SHIM_INTERP,
    NOTNULL(const char *a),
    NOTNULL(const char *b) )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void expand_hash( PARROT_INTERP, NOTNULL(Hash *hash) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void hash_freeze( PARROT_INTERP,
    NOTNULL(const Hash * const hash),
    NOTNULL(visit_info* info) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void hash_thaw( PARROT_INTERP,
    NOTNULL(Hash *hash),
    NOTNULL(visit_info* info) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void init_hash(
    NOTNULL(Hash *hash),
    PARROT_DATA_TYPE val_type,
    Hash_key_type hkey_type,
    hash_comp_fn compare,
    hash_hash_key_fn keyhash )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int int_compare( SHIM_INTERP,
    NULLOK(const void *a),
    NULLOK(const void *b) );

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t key_hash_cstring( SHIM_INTERP,
    NOTNULL(const void *value),
    size_t seed )
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t key_hash_int( SHIM_INTERP, NULLOK(void *value), size_t seed );

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t key_hash_pointer( SHIM_INTERP,
    NULLOK(void *value),
    size_t seed );

PARROT_WARN_UNUSED_RESULT
static size_t key_hash_STRING( PARROT_INTERP,
    NOTNULL(STRING *value),
    size_t seed )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int pointer_compare( SHIM_INTERP,
    NULLOK(const void *a),
    NULLOK(const void *b) );

PARROT_WARN_UNUSED_RESULT
static int STRING_compare( PARROT_INTERP,
    NOTNULL(const void *search_key),
    NOTNULL(const void *bucket_key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: static */



/*

FUNCDOC: key_hash_STRING
Return the hashed value of the key C<value>.  See also string.c.

*/


PARROT_WARN_UNUSED_RESULT
static size_t
key_hash_STRING(PARROT_INTERP, NOTNULL(STRING *value), size_t seed)
{
    STRING * const s = value;

    if (s->hashval) {
        return s->hashval;
    }

    return string_hash(interp, s, seed);
}

/*

FUNCDOC: STRING_compare
Compares the two strings, returning 0 if they are identical.

*/

PARROT_WARN_UNUSED_RESULT
static int
STRING_compare(PARROT_INTERP, NOTNULL(const void *search_key), NOTNULL(const void *bucket_key))
{
    return string_equal(interp, (const STRING *)search_key, (const STRING *)bucket_key);
}

/*

FUNCDOC:
Compares the two pointers, returning 0 if they are identical

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
pointer_compare(SHIM_INTERP, NULLOK(const void *a), NULLOK(const void *b))
{
    return a != b;
}

/*

FUNCDOC: key_hash_pointer
Returns a hashvalue for a pointer.

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
key_hash_pointer(SHIM_INTERP, NULLOK(void *value), size_t seed)
{
    return ((size_t) value) ^ seed;
}

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
key_hash_cstring(SHIM_INTERP, NOTNULL(const void *value), size_t seed)
{
    register size_t h = seed;
    const unsigned char * p = (const unsigned char *) value;

    while (*p) {
        h += h << 5;
        h += *p++;
    }
    return h;
}

/*

FUNCDOC: cstring_compare
C string versions of the C<key_hash> and C<compare> functions.

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
cstring_compare(SHIM_INTERP, NOTNULL(const char *a), NOTNULL(const char *b))
{
    return strcmp(a, b);
}

/*

FUNCDOC: key_hash_int
Custom C<key_hash> function.

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
key_hash_int(SHIM_INTERP, NULLOK(void *value), size_t seed)
{
    return (size_t)value ^ seed;
}

/*

FUNCDOC: int_compare
Custom C<compare> function.

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
int_compare(SHIM_INTERP, NULLOK(const void *a), NULLOK(const void *b))
{
    return a != b;
}

/*

FUNCDOC: parrot_dump_hash

Print out the hash in human-readable form.  Except it's empty.

=cut

*/

PARROT_API
void
parrot_dump_hash(SHIM_INTERP, NOTNULL(const Hash *hash))
{
    UNUSED(hash);
}

/*

FUNCDOC: parrot_mark_hash

Marks the hash and its contents as live.

*/

PARROT_API
void
parrot_mark_hash(PARROT_INTERP, NOTNULL(Hash *hash))
{
    UINTVAL found = 0;
    int mark_key = 0;
    int mark_value = 0;
    size_t i;

    if (hash->entry_type == enum_hash_string ||
            hash->entry_type == enum_hash_pmc)
        mark_value = 1;
    if (hash->key_type == Hash_key_type_STRING ||
            hash->key_type == Hash_key_type_PMC)
        mark_key = 1;
    if (!mark_key && !mark_value)
        return;

    for (i = 0; i <= hash->mask; i++) {
        HashBucket *bucket = hash->bi[i];

        while (bucket) {
            if (++found > hash->entries)
                real_exception(interp, NULL, 1,
                        "Detected hash corruption at hash %p entries %d",
                        hash, (int)hash->entries);
            if (mark_key)
                pobject_lives(interp, (PObj *)bucket->key);
            if (mark_value)
                pobject_lives(interp, (PObj *)bucket->value);
            bucket = bucket->next;
        }
    }
}

/*

FUNCDOC: hash_thaw

This is used by freeze/thaw to visit the contents of the hash.

C<pinfo> is the visit info, (see include/parrot/pmc_freeze.h>).

*/

static void
hash_thaw(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(visit_info* info))
{
    size_t i;
    IMAGE_IO * const io = info->image_io;
    HashBucket *b;

    /*
     * during thaw info->extra is the key/value count
     */
    const size_t n = (size_t) hash->entries;

    hash->entries = 0;
    for (i = 0; i < n; ++i) {
        switch (hash->key_type) {
            case Hash_key_type_STRING:
                {
                STRING * const s_key = io->vtable->shift_string(interp, io);
                b = parrot_hash_put(interp, hash, s_key, NULL);
                }
                break;
            case Hash_key_type_int:
                {
                const INTVAL i_key = io->vtable->shift_integer(interp, io);
                b = parrot_hash_put(interp, hash, (void*)i_key, NULL);
                }
                break;
            default:
                real_exception(interp, NULL, 1, "unimplemented key type");
                break;
        }
        switch (hash->entry_type) {
            case enum_hash_pmc:
                info->thaw_ptr = (PMC**)&b->value;
                (info->visit_pmc_now)(interp, NULL, info);
                break;
            case enum_hash_int:
                b->value = (void*)io->vtable->shift_integer(interp, io);
                break;
            default:
                real_exception(interp, NULL, 1, "unimplemented value type");
                break;
        }
    }
}

static void
hash_freeze(PARROT_INTERP, NOTNULL(const Hash * const hash), NOTNULL(visit_info* info))
{
    size_t i;
    IMAGE_IO * const io = info->image_io;

    for (i = 0; i <= hash->mask; i++) {
        HashBucket *b = hash->bi[i];

        while (b) {
            switch (hash->key_type) {
                case Hash_key_type_STRING:
                    io->vtable->push_string(interp, io, (STRING *)b->key);
                    break;
                case Hash_key_type_int:
                    io->vtable->push_integer(interp, io, (INTVAL)b->key);
                    break;
                default:
                    real_exception(interp, NULL, 1, "unimplemented key type");
                    break;
            }
            switch (hash->entry_type) {
                case enum_hash_pmc:
                    (info->visit_pmc_now)(interp, (PMC *)b->value, info);
                    break;
                case enum_hash_int:
                    io->vtable->push_integer(interp, io, (INTVAL)b->value);
                    break;
                default:
                    real_exception(interp, NULL, 1, "unimplemented value type");
                    break;
            }
            b = b->next;
        }
    }
}

PARROT_API
void
parrot_hash_visit(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(void *pinfo))
{
    visit_info* const info = (visit_info*) pinfo;

    switch (info->what) {
        case VISIT_THAW_NORMAL:
        case VISIT_THAW_CONSTANTS:
            hash_thaw(interp, hash, info);
            break;
        case VISIT_FREEZE_NORMAL:
        case VISIT_FREEZE_AT_DESTRUCT:
            hash_freeze(interp, hash, info);
            break;
        default:
            real_exception(interp, NULL, 1, "unimplemented visit mode");
            break;
    }
}

/*

FUNCDOC: expand_hash

For a hashtable of size N, we use C<MAXFULL_PERCENT> % of N as the
number of buckets. This way, as soon as we run out of buckets on the
free list, we know that it's time to resize the hashtable.

Algorithm for expansion: We exactly double the size of the hashtable.
Keys are assigned to buckets with the formula

        bucket_index = hash(key) % parrot_hash_size

so when doubling the size of the hashtable, we know that every key is
either already in the correct bucket, or belongs in the current bucket
plus C<parrot_hash_size> (the old C<parrot_hash_size>). In fact,
because the hashtable is always a power of two in size, it depends
only on the next bit in the hash value, after the ones previously
used.

So we scan through all the buckets in order, moving the buckets that
need to be moved. No bucket will be scanned twice, and the cache should
be reasonably happy because the hashtable accesses will be two parallel
sequential scans. (Of course, this also mucks with the C<< ->next >>
pointers, and they'll be all over memory.)

*/

static void
expand_hash(PARROT_INTERP, NOTNULL(Hash *hash))
{
    const UINTVAL old_size = hash->mask + 1;
    const UINTVAL new_size = old_size << 1;
    HashBucket **old_bi, **new_bi;
    HashBucket  *bs, *b;
    size_t offset, i, new_loc;

    /*
       allocate some less buckets
       e.g. 3 buckets, 4 pointers:

         +---+---+---+-+-+-+-+
         | --> bs    | -> bi |
         +---+---+---+-+-+-+-+
         ^           ^
         | old_mem   | hash->bi
    */
    const UINTVAL old_nb = N_BUCKETS(old_size);
    void * const old_mem = hash->bs;
    /*
     * resize mem
     */
    HashBucket * const new_mem =
        (HashBucket *)mem_sys_realloc(old_mem, HASH_ALLOC_SIZE(new_size));
    /*
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
         |  bs       | old_bi    |  new_bi       |
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
           ^                       ^
         | new_mem                 | hash->bi
    */
    bs = new_mem;
    old_bi = (HashBucket**) (bs + old_nb);
    new_bi = (HashBucket**) (bs + N_BUCKETS(new_size));
    /* things can have moved by this offset */
    offset = (char*)new_mem - (char*)old_mem;
    /* relocate the bucket index */
    mem_sys_memmove(new_bi, old_bi, old_size * sizeof (HashBucket*));

    /* update hash data */
    hash->bi = new_bi;
    hash->bs = bs;
    hash->mask = new_size - 1;

    /* clear freshly allocated bucket index */
    memset(new_bi + old_size, 0, sizeof (HashBucket*) * old_size);
    /*
     * reloc pointers - this part would be also needed, if we
     * allocate hash memory from GC movable memory, and then
     * also the free_list needs updating (this is empty now,
     * as expand_hash is only called for that case).
     */
    if (offset) {
        for (i = 0; i < old_size; ++i) {
            HashBucket **next_p = new_bi + i;
            while (*next_p) {
                *next_p = (HashBucket *)((char *)*next_p + offset);
                b = *next_p;
                next_p = &b->next;
            }
        }
    }
    /* recalc bucket index */
    for (i = 0; i < old_size; ++i) {
        HashBucket **next_p = new_bi + i;
        while (*next_p) {
            b = *next_p;
            /* rehash the bucket */
            new_loc = (hash->hash_val)(interp, b->key, hash->seed) &
                (new_size - 1);
            if (i != new_loc) {
                *next_p = b->next;
                b->next = new_bi[new_loc];
                new_bi[new_loc] = b;
            }
            else
                next_p = &b->next;
        }
    }
    /* add new buckets to free_list in reverse order
     * lowest bucket is top on free list and will be used first
     */
    for (i = 0, b = (HashBucket*)new_bi - 1; i < old_nb; ++i, --b) {
        b->next = hash->free_list;
        b->key = b->value = NULL;
        hash->free_list = b;
    }

}


/*

FUNCDOC: parrot_new_hash
Returns a new Parrot STRING hash in C<hptr>.

*/

PARROT_API
void
parrot_new_hash(SHIM_INTERP, NOTNULL(Hash **hptr))
{
    parrot_new_hash_x(hptr,
            enum_type_PMC,
            Hash_key_type_STRING,
            STRING_compare,     /* STRING compare */
            (hash_hash_key_fn)key_hash_STRING);    /*        hash */
}

/*

FUNCDOC: parrot_new_pmc_hash
Create a new Parrot STRING hash in PMC_struct_val(container)

*/

PARROT_API
void
parrot_new_pmc_hash(PARROT_INTERP, NOTNULL(PMC *container))
{
    parrot_new_pmc_hash_x(interp, container,
            enum_type_PMC,
            Hash_key_type_STRING,
            STRING_compare,     /* STRING compare */
            (hash_hash_key_fn)key_hash_STRING);    /*        hash */
}
/*

FUNCDOC: parrot_new_cstring_hash
Returns a new C string hash in C<hptr>.

*/

PARROT_API
void
parrot_new_cstring_hash(SHIM_INTERP, NOTNULL(Hash **hptr))
{
    parrot_new_hash_x(hptr,
            enum_type_PMC,
            Hash_key_type_cstring,
            (hash_comp_fn)cstring_compare,     /* cstring compare */
            (hash_hash_key_fn)key_hash_cstring);    /*        hash */
}

static void
init_hash(NOTNULL(Hash *hash),
        PARROT_DATA_TYPE val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)
{
    size_t i;
    HashBucket *bp;

    hash->compare = compare;
    hash->hash_val = keyhash;
    hash->entry_type = val_type;
    hash->key_type = hkey_type;
    /*
     * TODO randomize
     */
    hash->seed = 3793;
    assert(INITIAL_BUCKETS % 4 == 0);
    hash->mask = INITIAL_BUCKETS-1;
    hash->entries = 0;

    /*
     * TODO if we have a significant amount of small hashes:
     * - allocate a bigger hash structure e.g. 128 byte
     * - use the bucket store and bi inside this structure
     * - when reallocate copy this part
     */
    bp = (HashBucket *)mem_sys_allocate(HASH_ALLOC_SIZE(INITIAL_BUCKETS));
    hash->free_list = NULL;
    /* fill free_list from hi addresses so that we can use
     * buckets[i] directly in an OrderedHash, *if* nothing
     * was deleted
     */
    hash->bs = bp;
    bp += N_BUCKETS(INITIAL_BUCKETS);
    hash->bi = (HashBucket**) bp;
    for (i = 0, --bp; i < N_BUCKETS(INITIAL_BUCKETS); ++i, --bp) {
        bp->next = hash->free_list;
        bp->key = bp->value = NULL;
        hash->free_list = bp;
    }
    for (i = 0; i < INITIAL_BUCKETS; ++i) {
        hash->bi[i] = NULL;
    }
}

PARROT_API
void
parrot_hash_destroy(SHIM_INTERP, NOTNULL(Hash *hash))
{
    mem_sys_free(hash->bs);
    mem_sys_free(hash);
}

void
parrot_chash_destroy(PARROT_INTERP, NOTNULL(Hash *hash))
{
    UINTVAL i;

    for (i = 0; i <= hash->mask; i++) {
        HashBucket *bucket = hash->bi[i];
        while (bucket) {
            mem_sys_free(bucket->key);
            mem_sys_free(bucket->value);
            bucket = bucket->next;
        }
    }

    parrot_hash_destroy(interp, hash);
}

/*

FUNCDOC: parrot_new_hash_x

Returns a new hash in C<hptr>.

FIXME: This function can go back to just returning the hash struct
pointer once Buffers can define their own custom mark routines.

The problem is: During DODs stack walking the item on the stack must be
a PMC. When an auto C<Hash*> is seen, it doesn't get properly marked
(only the C<Hash*> buffer is marked, not its contents). By passing the
C<**hptr> up to the Hash's init function, the newly constructed PMC is
on the stack I<including> this newly constructed Hash, so that it gets
marked properly.

*/

void
parrot_new_hash_x(NOTNULL(Hash **hptr),
        PARROT_DATA_TYPE val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)
{
    Hash * const hash = mem_allocate_typed(Hash);
    hash->container = NULL;
    *hptr = hash;
    init_hash(hash, val_type, hkey_type, compare, keyhash);
}

/*

FUNCDOC: parrot_new_pmc_hash_x
Like parrot_new_hash_x but w/o the described problems. The passed in
C<container> PMC gets stored in the Hash end the newly created Hash is
in PMC_struct_val(container).

*/

void
parrot_new_pmc_hash_x(SHIM_INTERP, NOTNULL(PMC *container),
        PARROT_DATA_TYPE val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)
{
    Hash * const hash = mem_allocate_typed(Hash);

    PMC_struct_val(container) = hash;
    hash->container = container;
    init_hash(hash, val_type, hkey_type, compare, keyhash);
}

/*

FUNCDOC: parrot_new_pointer_hash
Create a new HASH with void * keys and values.

*/

PARROT_API
void
parrot_new_pointer_hash(SHIM_INTERP, NOTNULL(Hash **hptr))
{
    parrot_new_hash_x(hptr, enum_type_ptr, Hash_key_type_ptr,
                        pointer_compare, key_hash_pointer);
}

/*

FUNCDOC: parrot_new_INTVAL_hash
Create a new Hash PMC with INTVAL keys and values. C<flags> can be
C<PObj_constant_FLAG> or 0.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_new_INTVAL_hash(PARROT_INTERP, UINTVAL flags)
{
    PMC *h;

    if (flags & PObj_constant_FLAG)
        h = constant_pmc_new_noinit(interp, enum_class_Hash);
    else
        h = pmc_new_noinit(interp, enum_class_Hash);
    parrot_new_pmc_hash_x(interp, h, enum_type_INTVAL, Hash_key_type_int,
            int_compare, key_hash_int);
    PObj_active_destroy_SET(h);
    return h;
}

/*

FUNCDOC: parrot_hash_size
Return the number of used entries in the hash.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL
parrot_hash_size(PARROT_INTERP, NOTNULL(const Hash *hash))
{
    if (hash)
        return hash->entries;
    real_exception(interp, NULL, 1, "parrot_hash_size asked to check a NULL hash\n");
}

/*

FUNCDOC: parrot_hash_get_idx
Called by iterator.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
parrot_hash_get_idx(SHIM_INTERP, NOTNULL(const Hash *hash), NOTNULL(PMC *key))
{
    INTVAL i = PMC_int_val(key);
    const BucketIndex bi = (BucketIndex)PMC_data(key);
    HashBucket *b;
    void *res;

    /* idx directly in the bucket store, which is at negative
     * address from the data pointer
     */
    /* locate initial */
    const INTVAL size = (INTVAL)N_BUCKETS(hash->mask + 1);

    if (bi == INITBucketIndex) {
        i = 0;
        PMC_data(key) = NULL;
    }
    else if (i >= size || i < 0) {
        PMC_int_val(key) = -1;
        return NULL;
    }
    res = NULL;
    for (b = hash->bs + i; i < size ; ++i, ++b) {
        /* XXX int keys may be zero - use different iterator
         */
        if (b->key) {
            if (!res) {
                res = b->key;
            }
            else {    /* found next key - FIXME hash iter does auto next */
                break;
            }
        }
    }
    if (i >= size)
        i = -1;
    PMC_int_val(key) = i;
    return res;
}

/*

FUNCDOC: parrot_hash_get_bucket
Returns the bucket for C<key>.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
HashBucket *
parrot_hash_get_bucket(PARROT_INTERP, NOTNULL(const Hash *hash), NOTNULL(void *key))
{
    const UINTVAL  hashval = (hash->hash_val)(interp, key, hash->seed);
    HashBucket    *bucket  = hash->bi[hashval & hash->mask];

    while (bucket) {
        /* store hash_val or not */
        if ((hash->compare)(interp, key, bucket->key) == 0)
            return bucket;
        bucket = bucket->next;
    }
    return NULL;
}

/*

FUNCDOC: parrot_hash_get
Returns the bucket for C<key> or C<NULL> if no bucket is found.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
parrot_hash_get(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(void *key))
{
    const HashBucket * const bucket = parrot_hash_get_bucket(interp, hash, key);
    return bucket ? bucket->value : NULL;
}

/*

FUNCDOC:
Returns whether the key exists in the hash.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL
parrot_hash_exists(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(void *key))
{
    const HashBucket * const bucket = parrot_hash_get_bucket(interp, hash, key);
    return bucket ? 1 : 0;
}

/*

FUNCDOC: parrot_hash_put
Puts the key and value into the hash. Note that C<key> is B<not>
copied.

*/

PARROT_API
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
HashBucket*
parrot_hash_put(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(void *key), NULLOK(void *value))
{
    const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed);
    HashBucket   *bucket = hash->bi[hashval & hash->mask];

    while (bucket) {
        /* store hash_val or not */
        if ((hash->compare)(interp, key, bucket->key) == 0)
            break;
        bucket = bucket->next;
    }

    if (bucket) {
        if (hash->entry_type == enum_type_PMC && hash->container) {
            DOD_WRITE_BARRIER_KEY(interp, hash->container,
                    (PMC*)bucket->value, bucket->key, (PMC*)value, key);
        }
        bucket->value = value;        /* replace value */
    }
    else {
        if (hash->entry_type == enum_type_PMC && hash->container) {
            DOD_WRITE_BARRIER_KEY(interp, hash->container,
                    NULL, NULL, (PMC*)value, key);
        }

        bucket = hash->free_list;

        if (!bucket) {
            expand_hash(interp, hash);
            bucket = hash->free_list;
        }

        hash->entries++;
        hash->free_list                = bucket->next;
        bucket->key                    = key;
        bucket->value                  = value;
        bucket->next                   = hash->bi[hashval & hash->mask];
        hash->bi[hashval & hash->mask] = bucket;
    }

    return bucket;
}

/*

FUNCDOC: parrot_hash_delete
Deletes the key from the hash.

*/

PARROT_API
void
parrot_hash_delete(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(void *key))
{
    HashBucket *bucket;
    HashBucket *prev = NULL;

    const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed) & hash->mask;

    for (bucket = hash->bi[hashval]; bucket; bucket = bucket->next) {
        if ((hash->compare)(interp, key, bucket->key) == 0) {
            if (prev)
                prev->next = bucket->next;
            else {
                hash->bi[hashval] = bucket->next;
            }
            hash->entries--;
            bucket->next = hash->free_list;
            bucket->key = NULL;
            hash->free_list = bucket;
            return;
        }
        prev = bucket;
    }
}

/*

FUNCDOC: parrot_hash_clone
Clones C<hash> to C<dest>.

*/

PARROT_API
void
parrot_hash_clone(PARROT_INTERP, NOTNULL(Hash *hash), NOTNULL(Hash **dest))
{
    UINTVAL i;

    parrot_new_hash_x(dest, hash->entry_type,
            hash->key_type, hash->compare, hash->hash_val);

    for (i = 0; i <= hash->mask; i++) {
        HashBucket *b = hash->bi[i];
        while (b) {
            void * const  key = b->key;
            void         *valtmp;

            switch (hash->entry_type) {
            case enum_type_undef:
            case enum_type_ptr:
            case enum_type_INTVAL:
                valtmp = (void *)b->value;
                break;

            case enum_type_STRING:
                valtmp = (void *)string_copy(interp, (STRING *)b->value);
                break;

            case enum_type_PMC:
                valtmp = (void *)VTABLE_clone(interp, (PMC*)b->value);
                break;

            default:
                valtmp = NULL; /* avoid warning */
                real_exception(interp, NULL, -1, "hash corruption: type = %d\n",
                                   hash->entry_type);
            };
            parrot_hash_put(interp, *dest, key, valtmp);
            b = b->next;
        }
    }
}

/*

=head1 SEE ALSO

F<docs/pdds/pdd08_keys.pod>.

=head1 TODO

Future optimizations:

=over 4

=item * Stop reallocating the bucket pool, and instead add chunks on.
(Saves pointer fixups and copying during C<realloc>.)

=item * Hash contraction (don't if it's worth it)

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
