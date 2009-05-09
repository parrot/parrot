/*
Copyright (C) 2001-2009, Parrot Foundation.
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

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "pmc/pmc_key.h"

/* the number of entries above which it's faster to hash the hashval instead of
 * looping over the used HashBuckets directly */
#define SMALL_HASH_SIZE  4
#define INITIAL_BUCKETS 16

/* HEADERIZER HFILE: include/parrot/hash.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int cstring_compare(SHIM_INTERP,
    ARGIN(const char *a),
    ARGIN(const char *b))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void expand_hash(PARROT_INTERP, ARGMOD(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hash);

static void hash_freeze(PARROT_INTERP,
    ARGIN(const Hash * const hash),
    ARGMOD(visit_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*info);

static void hash_thaw(PARROT_INTERP,
    ARGMOD(Hash *hash),
    ARGMOD(visit_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hash)
        FUNC_MODIFIES(*info);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t key_hash_cstring(SHIM_INTERP,
    ARGIN(const void *value),
    size_t seed)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t key_hash_pointer(SHIM_INTERP,
    ARGIN(const void *value),
    size_t seed)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static size_t key_hash_STRING(PARROT_INTERP,
    ARGMOD(STRING *s),
    SHIM(size_t seed))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

static void parrot_mark_hash_both(PARROT_INTERP, ARGIN(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void parrot_mark_hash_keys(PARROT_INTERP, ARGIN(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void parrot_mark_hash_values(PARROT_INTERP, ARGIN(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int pointer_compare(SHIM_INTERP,
    ARGIN_NULLOK(const void *a),
    ARGIN_NULLOK(const void *b));

PARROT_WARN_UNUSED_RESULT
static int STRING_compare(PARROT_INTERP,
    ARGIN(const void *search_key),
    ARGIN_NULLOK(const void *bucket_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_cstring_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(a) \
    || PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_expand_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(hash)
#define ASSERT_ARGS_hash_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(hash) \
    || PARROT_ASSERT_ARG(info)
#define ASSERT_ARGS_hash_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(hash) \
    || PARROT_ASSERT_ARG(info)
#define ASSERT_ARGS_key_hash_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(value)
#define ASSERT_ARGS_key_hash_pointer __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(value)
#define ASSERT_ARGS_key_hash_STRING __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(s)
#define ASSERT_ARGS_parrot_mark_hash_both __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(hash)
#define ASSERT_ARGS_parrot_mark_hash_keys __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(hash)
#define ASSERT_ARGS_parrot_mark_hash_values __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(hash)
#define ASSERT_ARGS_pointer_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_STRING_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(search_key)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */



/*

=item C<static size_t key_hash_STRING(PARROT_INTERP, STRING *s, size_t seed)>

Returns the hashed value of the key C<value>.  See also string.c.

=cut

*/


PARROT_WARN_UNUSED_RESULT
static size_t
key_hash_STRING(PARROT_INTERP, ARGMOD(STRING *s), SHIM(size_t seed))
{
    ASSERT_ARGS(key_hash_STRING)

    if (s->hashval)
        return s->hashval;

   return Parrot_str_to_hashval(interp, s);
}


/*

=item C<static int STRING_compare(PARROT_INTERP, const void *search_key, const
void *bucket_key)>

Compares the two strings, returning 0 if they are identical.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
STRING_compare(PARROT_INTERP, ARGIN(const void *search_key), ARGIN_NULLOK(const void *bucket_key))
{
    ASSERT_ARGS(STRING_compare)
    STRING const *s1 = (STRING const *)search_key;
    STRING const *s2 = (STRING const *)bucket_key;

    if (!s2)
        return 1;

    if (s1->hashval != s2->hashval)
        return 1;

    /* COWed strings */
    if (s1->strstart == s2->strstart && s1->bufused == s2->bufused)
        return 0;

    return CHARSET_COMPARE(interp, s1, s2);
}


/*

=item C<static int pointer_compare(PARROT_INTERP, const void *a, const void *b)>

Compares the two pointers, returning 0 if they are identical

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
pointer_compare(SHIM_INTERP, ARGIN_NULLOK(const void *a), ARGIN_NULLOK(const void *b))
{
    ASSERT_ARGS(pointer_compare)
    return a != b;
}


/*

=item C<static size_t key_hash_pointer(PARROT_INTERP, const void *value, size_t
seed)>

Returns a hashvalue for a pointer.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
key_hash_pointer(SHIM_INTERP, ARGIN(const void *value), size_t seed)
{
    ASSERT_ARGS(key_hash_pointer)
    return ((size_t) value) ^ seed;
}


/*

=item C<static size_t key_hash_cstring(PARROT_INTERP, const void *value, size_t
seed)>

Creates and returns a hash value from a string.

Takes an interpreter, a pointer to a string, and a seed value.
Returns the hash value.

Used by parrot_new_cstring_hash.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
key_hash_cstring(SHIM_INTERP, ARGIN(const void *value), size_t seed)
{
    ASSERT_ARGS(key_hash_cstring)
    const unsigned char * p = (const unsigned char *) value;
    register size_t       h = seed;

    while (*p) {
        h += h << 5;
        h += *p++;
    }

    return h;
}


/*

=item C<static int cstring_compare(PARROT_INTERP, const char *a, const char *b)>

Compares two C strings for equality, returning -1, 0, and 1 if the first string
is less than, equal to, or greater than the second, respectively.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
cstring_compare(SHIM_INTERP, ARGIN(const char *a), ARGIN(const char *b))
{
    ASSERT_ARGS(cstring_compare)
    return strcmp(a, b);
}


/*

=item C<size_t key_hash_int(PARROT_INTERP, const void *value, size_t seed)>

Returns a hashed value for an integer key (passed as a void pointer, sadly).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t
key_hash_int(SHIM_INTERP, ARGIN(const void *value), size_t seed)
{
    ASSERT_ARGS(key_hash_int)
    return (size_t)value ^ seed;
}


/*

=item C<int int_compare(PARROT_INTERP, const void *a, const void *b)>

Compares two integers for equality, returning -1, 0, and 1 if the first is less
than, equal to, or greater than the second, respectively.  Uses void pointers
to store the integers, sadly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int
int_compare(SHIM_INTERP, ARGIN_NULLOK(const void *a), ARGIN_NULLOK(const void *b))
{
    ASSERT_ARGS(int_compare)
    return a != b;
}


/*

=item C<void parrot_dump_hash(PARROT_INTERP, const Hash *hash)>

Prints out the hash in human-readable form, at least once someone implements
this.

=cut

*/

PARROT_EXPORT
void
parrot_dump_hash(SHIM_INTERP, SHIM(const Hash *hash))
{
    ASSERT_ARGS(parrot_dump_hash)
}


/*

=item C<void parrot_mark_hash(PARROT_INTERP, Hash *hash)>

Marks the hash and its contents as live.  Assumes that key and value are non
null in all buckets.

=cut

*/

PARROT_EXPORT
void
parrot_mark_hash(PARROT_INTERP, ARGIN(Hash *hash))
{
    ASSERT_ARGS(parrot_mark_hash)
    int mark_key   = 0;
    int mark_value = 0;

    if (hash->entry_type == (PARROT_DATA_TYPE) enum_hash_string
    ||  hash->entry_type == (PARROT_DATA_TYPE) enum_hash_pmc)
        mark_value = 1;

    if (hash->key_type == Hash_key_type_STRING
    ||  hash->key_type == Hash_key_type_PMC)
        mark_key = 1;

    if (mark_key) {
        if (mark_value)
            parrot_mark_hash_both(interp, hash);
        else
            parrot_mark_hash_keys(interp, hash);
    }
    else {
        if (mark_value)
            parrot_mark_hash_values(interp, hash);
    }
}


/*

=item C<static void parrot_mark_hash_keys(PARROT_INTERP, Hash *hash)>

Marks the hash and only its keys as live.

=cut

*/

static void
parrot_mark_hash_keys(PARROT_INTERP, ARGIN(Hash *hash))
{
    ASSERT_ARGS(parrot_mark_hash_keys)
    UINTVAL entries = hash->entries;
    UINTVAL found   = 0;
    INTVAL  i;

    for (i = hash->mask; i >= 0; --i) {
        HashBucket *bucket = hash->bi[i];

        while (bucket) {
            if (++found > entries)
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "Detected hash corruption at hash %p entries %d",
                    hash, (int)entries);

            PARROT_ASSERT(bucket->key);
            pobject_lives(interp, (PObj *)bucket->key);

            bucket = bucket->next;
        }
    }
}


/*

=item C<static void parrot_mark_hash_values(PARROT_INTERP, Hash *hash)>

Marks the hash and only its values as live.

=cut

*/

static void
parrot_mark_hash_values(PARROT_INTERP, ARGIN(Hash *hash))
{
    ASSERT_ARGS(parrot_mark_hash_values)
    UINTVAL entries = hash->entries;
    UINTVAL found   = 0;
    INTVAL  i;

    for (i = hash->mask; i >= 0; --i) {
        HashBucket *bucket = hash->bi[i];

        while (bucket) {
            if (++found > entries)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "Detected hash corruption at hash %p entries %d",
                        hash, (int)entries);

            PARROT_ASSERT(bucket->value);
            pobject_lives(interp, (PObj *)bucket->value);

            bucket = bucket->next;
        }
    }
}


/*

=item C<static void parrot_mark_hash_both(PARROT_INTERP, Hash *hash)>

Marks the hash and both its keys and values as live.

=cut

*/

static void
parrot_mark_hash_both(PARROT_INTERP, ARGIN(Hash *hash))
{
    ASSERT_ARGS(parrot_mark_hash_both)
    UINTVAL entries = hash->entries;
    UINTVAL found   = 0;
    INTVAL  i;

    for (i = hash->mask; i >= 0; --i) {
        HashBucket *bucket = hash->bi[i];

        while (bucket) {
            if (++found > entries)
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "Detected hash corruption at hash %p entries %d",
                        hash, (int)entries);

            PARROT_ASSERT(bucket->key);
            pobject_lives(interp, (PObj *)bucket->key);

            PARROT_ASSERT(bucket->value);
            pobject_lives(interp, (PObj *)bucket->value);

            bucket = bucket->next;
        }
    }
}


/*

=item C<static void hash_thaw(PARROT_INTERP, Hash *hash, visit_info *info)>

Visits the contents of a hash during freeze/thaw.

C<pinfo> is the visit info, (see include/parrot/pmc_freeze.h>).

=cut

*/

static void
hash_thaw(PARROT_INTERP, ARGMOD(Hash *hash), ARGMOD(visit_info *info))
{
    ASSERT_ARGS(hash_thaw)
    IMAGE_IO * const io         = info->image_io;

    /* during thaw, info->extra is the key/value count */
    const size_t     num_entries = (size_t) hash->entries;
    size_t           entry_index;

    hash->entries = 0;

    for (entry_index = 0; entry_index < num_entries; ++entry_index) {
        HashBucket *b;

        switch (hash->key_type) {
            case Hash_key_type_STRING:
                {
                    STRING * const s_key = VTABLE_shift_string(interp, io);
                    b = parrot_hash_put(interp, hash, s_key, NULL);
                }
                break;
            case Hash_key_type_int:
                {
                    const INTVAL i_key = VTABLE_shift_integer(interp, io);
                    b = parrot_hash_put(interp, hash, (void*)i_key, NULL);
                }
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented key type");
                break;
        }

        switch (hash->entry_type) {
            case enum_hash_pmc:
                {
                    /* this looks awful, but it avoids type-punning warnings */
                    void **ptr     = &b->value;
                    info->thaw_ptr = (PMC **)ptr;
                    (info->visit_pmc_now)(interp, NULL, info);
                    break;
                }
            case enum_hash_int:
                {
                    const INTVAL i = VTABLE_shift_integer(interp, io);
                    b->value       = (void *)i;
                    break;
                }
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented value type");
                break;
        }
    }
}


/*

=item C<static void hash_freeze(PARROT_INTERP, const Hash * const hash,
visit_info *info)>

Freezes hash into a string.

Takes an interpreter, a pointer to the hash, and a pointer to the structure
containing the string start location.

Use by parrot_hash_visit.

=cut

*/

static void
hash_freeze(PARROT_INTERP, ARGIN(const Hash * const hash), ARGMOD(visit_info *info))
{
    ASSERT_ARGS(hash_freeze)
    IMAGE_IO * const io = info->image_io;
    size_t           i;

    for (i = 0; i < hash->entries; i++) {
        HashBucket * const b = hash->bs+i;

        switch (hash->key_type) {
            case Hash_key_type_STRING:
                VTABLE_push_string(interp, io, (STRING *)b->key);
                break;
            case Hash_key_type_int:
                VTABLE_push_integer(interp, io, (INTVAL)b->key);
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented key type");
                break;
        }

        switch (hash->entry_type) {
            case enum_hash_pmc:
                (info->visit_pmc_now)(interp, (PMC *)b->value, info);
                break;
            case enum_hash_int:
                VTABLE_push_integer(interp, io, (INTVAL)b->value);
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented value type");
                break;
        }
    }
}


/*

=item C<void parrot_hash_visit(PARROT_INTERP, Hash *hash, void *pinfo)>

Freezes or thaws a hash as specified.  Takes an interpreter, a pointer to the
hash, and a pointer to the structure identifying what to do and the location of
the string.

=cut

*/

PARROT_EXPORT
void
parrot_hash_visit(PARROT_INTERP, ARGMOD(Hash *hash), ARGMOD(void *pinfo))
{
    ASSERT_ARGS(parrot_hash_visit)
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
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "unimplemented visit mode");
    }
}


/*

=item C<static void expand_hash(PARROT_INTERP, Hash *hash)>

Expands a hash when necessary.

For a hashtable of size N, we use C<MAXFULL_PERCENT> % of N as the
number of buckets. This way, as soon as we run out of buckets on the
free list, we know that it's time to resize the hashtable.

Algorithm for expansion: We exactly double the size of the hashtable.
Keys are assigned to buckets with the formula

    bucket_index = hash(key) % parrot_hash_size

When doubling the size of the hashtable, we know that every key is either
already in the correct bucket, or belongs in the current bucket plus
C<parrot_hash_size> (the old C<parrot_hash_size>). In fact, because the
hashtable is always a power of two in size, it depends only on the next bit
in the hash value, after the ones previously used.

We scan through all the buckets in order, moving the buckets that need to be
moved. No bucket will be scanned twice, and the cache should be reasonably
happy because the hashtable accesses will be two parallel sequential scans.
(Of course, this also mucks with the C<< ->next >> pointers, and they'll be
all over memory.)

=cut

*/

static void
expand_hash(PARROT_INTERP, ARGMOD(Hash *hash))
{
    ASSERT_ARGS(expand_hash)
    HashBucket  **old_bi, **new_bi;
    HashBucket   *bs, *b;

    void * const  old_mem  = hash->bs;
    const UINTVAL old_size = hash->mask + 1;
    const UINTVAL new_size = old_size << 1;
    const UINTVAL old_nb   = N_BUCKETS(old_size);
    size_t        offset, i, new_loc;

    /*
       allocate some less buckets
       e.g. 3 buckets, 4 pointers:

         +---+---+---+-+-+-+-+
         | --> bs    | -> bi |
         +---+---+---+-+-+-+-+
         ^           ^
         | old_mem   | hash->bi
    */

    /* resize mem */
    HashBucket * const new_mem =
        (HashBucket *)mem_sys_realloc(old_mem, HASH_ALLOC_SIZE(new_size));

    /*
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
         |  bs       | old_bi    |  new_bi       |
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
           ^                       ^
         | new_mem                 | hash->bi
    */
    bs     = new_mem;
    old_bi = (HashBucket**) (bs + old_nb);
    new_bi = (HashBucket**) (bs + N_BUCKETS(new_size));

    /* things can have moved by this offset */
    offset = (char*)new_mem - (char*)old_mem;

    /* relocate the bucket index */
    mem_sys_memmove(new_bi, old_bi, old_size * sizeof (HashBucket *));

    /* update hash data */
    hash->bi   = new_bi;
    hash->bs   = bs;
    hash->mask = new_size - 1;

    /* clear freshly allocated bucket index */
    memset(new_bi + old_size, 0, sizeof (HashBucket *) * old_size);

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
                b       = *next_p;
                next_p  = &b->next;
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
                *next_p         = b->next;
                b->next         = new_bi[new_loc];
                new_bi[new_loc] = b;
            }
            else
                next_p = &b->next;
        }
    }

    /* add new buckets to free_list in reverse order
     * lowest bucket is top on free list and will be used first */
    for (i = 0, b = (HashBucket*)new_bi - 1; i < old_nb; ++i, --b) {
        b->next         = hash->free_list;
        b->key          = b->value         = NULL;
        hash->free_list = b;
    }

}


/*

=item C<Hash* parrot_new_hash(PARROT_INTERP)>

Creates a new Parrot STRING hash in C<hptr>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Hash*
parrot_new_hash(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_new_hash)
    return parrot_create_hash(interp,
            enum_type_PMC,
            Hash_key_type_STRING,
            STRING_compare,
            (hash_hash_key_fn)key_hash_STRING);
}


/*

=item C<void parrot_new_pmc_hash(PARROT_INTERP, PMC *container)>

Creates a new Parrot STRING hash in C<container>.

=cut

*/

PARROT_EXPORT
void
parrot_new_pmc_hash(PARROT_INTERP, ARGOUT(PMC *container))
{
    ASSERT_ARGS(parrot_new_pmc_hash)
    Hash * const hash = parrot_new_hash(interp);
    VTABLE_set_pointer(interp, container, hash);
}


/*

=item C<Hash* parrot_new_cstring_hash(PARROT_INTERP)>

Creates a new C string hash in C<hptr>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Hash*
parrot_new_cstring_hash(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_new_cstring_hash)
    return parrot_create_hash(interp,
            enum_type_PMC,
            Hash_key_type_cstring,
            (hash_comp_fn)cstring_compare,
            (hash_hash_key_fn)key_hash_cstring);
}


/*

=item C<Hash * parrot_new_pointer_hash(PARROT_INTERP)>

Create and return a new hash with void * keys and values.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Hash *
parrot_new_pointer_hash(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_new_pointer_hash)
    return parrot_create_hash(interp,
            enum_type_ptr,
            Hash_key_type_ptr,
            pointer_compare,
            key_hash_pointer);
}


/*

=item C<Hash* parrot_new_intval_hash(PARROT_INTERP)>

Creates and returns new Hash PMC with INTVAL keys and values. C<flags> can be
C<PObj_constant_FLAG> or 0.

=cut

*/


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Hash*
parrot_new_intval_hash(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_new_intval_hash)
    return parrot_create_hash(interp,
            enum_type_INTVAL,
            Hash_key_type_int,
            int_compare,
            key_hash_int);
}

/*

=item C<Hash * parrot_create_hash(PARROT_INTERP, PARROT_DATA_TYPE val_type,
Hash_key_type hkey_type, hash_comp_fn compare, hash_hash_key_fn keyhash)>

Creates and initializes a hash.  Function pointers determine its behaviors.
The container passed in is the address of the hash PMC that is using it.  The
hash and the PMC point to each other.

Memory from this function must be freed.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
Hash *
parrot_create_hash(PARROT_INTERP, PARROT_DATA_TYPE val_type, Hash_key_type hkey_type,
        ARGIN(hash_comp_fn compare), ARGIN(hash_hash_key_fn keyhash))
{
    ASSERT_ARGS(parrot_create_hash)
    HashBucket  *bp;
    Hash * const hash = mem_allocate_zeroed_typed(Hash);
    size_t       i;

    PARROT_ASSERT(INITIAL_BUCKETS % 4 == 0);

    hash->compare    = compare;
    hash->hash_val   = keyhash;
    hash->entry_type = val_type;
    hash->key_type   = hkey_type;
    hash->seed       = interp->hash_seed;
    hash->mask       = INITIAL_BUCKETS - 1;
    hash->entries    = 0;

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
     * was deleted */

    hash->bs  = bp;
    bp       += N_BUCKETS(INITIAL_BUCKETS);
    hash->bi  = (HashBucket **)bp;

    for (i = 0, --bp; i < N_BUCKETS(INITIAL_BUCKETS); ++i, --bp) {
        bp->next        = hash->free_list;
        bp->key         = NULL;
        bp->value       = NULL;
        hash->free_list = bp;
    }

    for (i = 0; i < INITIAL_BUCKETS; ++i)
        hash->bi[i] = NULL;

    return hash;
}


/*

=item C<void parrot_hash_destroy(PARROT_INTERP, Hash *hash)>

Frees the memory allocated to the specified hash and its bucket store.  Used by
Parrot_chash_destroy.

=cut

*/

PARROT_EXPORT
void
parrot_hash_destroy(SHIM_INTERP, ARGMOD(Hash *hash))
{
    ASSERT_ARGS(parrot_hash_destroy)
    mem_sys_free(hash->bs);
    mem_sys_free(hash);
}


/*

=item C<void parrot_chash_destroy(PARROT_INTERP, Hash *hash)>

Deletes the specified hash by freeing the memory allocated to all the key-value
pairs, and finally the hash itself.

=cut

*/

void
parrot_chash_destroy(PARROT_INTERP, ARGMOD(Hash *hash))
{
    ASSERT_ARGS(parrot_chash_destroy)
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

=item C<void parrot_chash_destroy_values(PARROT_INTERP, Hash *hash, value_free
func)>

Deletes the specified hash by freeing the memory allocated to all the key-value
pairs, calling the provided callback to free the values, and finally the hash
itself.

The callback returns C<void> and takes a C<void *>.

=cut

*/

void
parrot_chash_destroy_values(PARROT_INTERP, ARGMOD(Hash *hash),
    ARGIN(value_free func))
{
    ASSERT_ARGS(parrot_chash_destroy_values)
    UINTVAL i;

    for (i = 0; i <= hash->mask; i++) {
        HashBucket *bucket = hash->bi[i];
        while (bucket) {
            mem_sys_free(bucket->key);
            func(bucket->value);
            bucket = bucket->next;
        }
    }

    parrot_hash_destroy(interp, hash);
}


/*

=item C<INTVAL parrot_hash_size(PARROT_INTERP, const Hash *hash)>

Returns the number of used entries in the hash.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL
parrot_hash_size(SHIM_INTERP, ARGIN(const Hash *hash))
{
    ASSERT_ARGS(parrot_hash_size)

    return hash->entries;
}


/*

=item C<void * parrot_hash_get_idx(PARROT_INTERP, const Hash *hash, PMC *key)>

Finds the next index into the hash's internal storage for the given Key.  Used
by iterators.  Ugly.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
parrot_hash_get_idx(PARROT_INTERP, ARGIN(const Hash *hash), ARGMOD(PMC *key))
{
    ASSERT_ARGS(parrot_hash_get_idx)
    HashBucket       *b;
    void             *res;
    INTVAL            i  = VTABLE_get_integer(interp, key);
    PMC              *fake_bi;
    BucketIndex       bi;

    /* idx directly in the bucket store, which is at negative
     * address from the data pointer */
    /* locate initial */
    const INTVAL size = (INTVAL)N_BUCKETS(hash->mask + 1);

    GETATTR_Key_next_key(interp, key, fake_bi);
    bi = (BucketIndex)fake_bi;

    if (bi == INITBucketIndex) {
        i             = 0;
        SETATTR_Key_next_key(interp, key, NULL);
    }
    else if (i >= size || i < 0) {
        /* NOTE: These instances of SETATTR_Key_int_key can't be VTABLE
         * functions because of the "special" way hash iterators work. */
        SETATTR_Key_int_key(interp, key, -1);
        return NULL;
    }

    res = NULL;

    for (b = hash->bs + i; i < size ; ++i, ++b) {
        /* XXX int keys may be zero - use different iterator */
        if (b->key) {
            if (!res)
                res = b->key;

            /* found next key - FIXME hash iter does auto next */
            else
                break;
        }
    }

    if (i >= size)
        i = -1;

    SETATTR_Key_int_key(interp, key, i);

    return res;
}


/*

=item C<HashBucket * parrot_hash_get_bucket(PARROT_INTERP, const Hash *hash,
const void *key)>

Returns the bucket for C<key>, if found, and NULL otherwise.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
HashBucket *
parrot_hash_get_bucket(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN(const void *key))
{
    ASSERT_ARGS(parrot_hash_get_bucket)

    if (hash->entries <= 0)
        return NULL;

    /* a very fast search for very small hashes */
    if (hash->entries <= SMALL_HASH_SIZE) {
        const UINTVAL  entries = hash->entries;
        UINTVAL        i;

        for (i = 0; i < entries; i++) {
            HashBucket *bucket = hash->bs + i;

            /* the hash->compare cost is too high for this fast path */
            if (bucket->key && bucket->key == key)
                return bucket;
        }
    }

    /* if the fast search didn't work, try the normal hashing search */
    {
        const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed);
        HashBucket   *bucket  = hash->bi[hashval & hash->mask];

        while (bucket) {
            /* key equality is always a match, so it's worth checking */
            if (bucket->key == key

            /* ... but the slower comparison is more accurate */
            || ((hash->compare)(interp, key, bucket->key) == 0))
                return bucket;
            bucket = bucket->next;
        }
    }

    return NULL;
}


/*

=item C<void * parrot_hash_get(PARROT_INTERP, Hash *hash, const void *key)>

Returns the value keyed by C<key>, or C<NULL> if no bucket is found.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
parrot_hash_get(PARROT_INTERP, ARGIN(Hash *hash), ARGIN(const void *key))
{
    ASSERT_ARGS(parrot_hash_get)
    const HashBucket * const bucket = parrot_hash_get_bucket(interp, hash, key);
    return bucket ? bucket->value : NULL;
}


/*

=item C<INTVAL parrot_hash_exists(PARROT_INTERP, Hash *hash, void *key)>

Returns whether the key exists in the hash.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
parrot_hash_exists(PARROT_INTERP, ARGIN(Hash *hash), ARGIN(void *key))
{
    ASSERT_ARGS(parrot_hash_exists)
    const HashBucket * const bucket = parrot_hash_get_bucket(interp, hash, key);
    return bucket ? 1 : 0;
}


/*

=item C<HashBucket* parrot_hash_put(PARROT_INTERP, Hash *hash, void *key, void
*value)>

Puts the key and value into the hash. Note that C<key> is B<not> copied.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
HashBucket*
parrot_hash_put(PARROT_INTERP, ARGMOD(Hash *hash), ARGIN(void *key), ARGIN_NULLOK(void *value))
{
    ASSERT_ARGS(parrot_hash_put)
    const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed);
    HashBucket   *bucket  = hash->bi[hashval & hash->mask];

    while (bucket) {
        /* store hash_val or not */
        if ((hash->compare)(interp, key, bucket->key) == 0)
            break;
        bucket = bucket->next;
    }

    if (bucket) {
        if (hash->entry_type == enum_type_PMC && hash->container) {
            GC_WRITE_BARRIER_KEY(interp, hash->container,
                    (PMC *)bucket->value, bucket->key, (PMC *)value, key);
        }

        bucket->value = value;
    }
    else {
        if (hash->entry_type == enum_type_PMC && hash->container) {
            GC_WRITE_BARRIER_KEY(interp, hash->container,
                    NULL, NULL, (PMC *)value, key);
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

=item C<void parrot_hash_delete(PARROT_INTERP, Hash *hash, void *key)>

Deletes the key from the hash.

=cut

*/

PARROT_EXPORT
void
parrot_hash_delete(PARROT_INTERP, ARGMOD(Hash *hash), ARGIN(void *key))
{
    ASSERT_ARGS(parrot_hash_delete)
    HashBucket   *bucket;
    HashBucket   *prev    = NULL;
    const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed) & hash->mask;

    for (bucket = hash->bi[hashval]; bucket; bucket = bucket->next) {
        if ((hash->compare)(interp, key, bucket->key) == 0) {

            if (prev)
                prev->next = bucket->next;
            else
                hash->bi[hashval] = bucket->next;

            hash->entries--;
            bucket->next    = hash->free_list;
            bucket->key     = NULL;
            hash->free_list = bucket;

            return;
        }

        prev = bucket;
    }
}


/*

=item C<void parrot_hash_clone(PARROT_INTERP, const Hash *hash, Hash *dest)>

Clones C<hash> to C<dest>.

=cut

*/

PARROT_EXPORT
void
parrot_hash_clone(PARROT_INTERP, ARGIN(const Hash *hash), ARGOUT(Hash *dest))
{
    ASSERT_ARGS(parrot_hash_clone)
    UINTVAL entries = hash->entries;
    UINTVAL i;

    for (i = 0; i < entries; i++) {
        void         *valtmp;
        HashBucket   *b   = hash->bs+i;
        void * const  key = b->key;

        switch (hash->entry_type) {
            case enum_type_undef:
            case enum_type_ptr:
            case enum_type_INTVAL:
                valtmp = (void *)b->value;
                break;

            case enum_type_STRING:
                valtmp = (void *)Parrot_str_copy(interp, (STRING *)b->value);
                break;

            case enum_type_PMC:
                if (PMC_IS_NULL((PMC *)b->value))
                    valtmp = (void *)PMCNULL;
                else
                    valtmp = (void *)VTABLE_clone(interp, (PMC*)b->value);
                break;

            default:
                valtmp = NULL; /* avoid warning */
                Parrot_ex_throw_from_c_args(interp, NULL, -1,
                    "hash corruption: type = %d\n", hash->entry_type);
        };

        if (key)
            parrot_hash_put(interp, dest, key, valtmp);
    }
}

/*

=back

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
