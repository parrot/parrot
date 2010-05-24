/*
Copyright (C) 2001-2010, Parrot Foundation.
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
#define INITIAL_BUCKETS  4

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
    ARGIN(const Hash *hash),
    ARGMOD(PMC *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*info);

static void hash_thaw(PARROT_INTERP, ARGMOD(Hash *hash), ARGMOD(PMC *info))
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
PARROT_CONST_FUNCTION
static size_t key_hash_pointer(SHIM_INTERP,
    ARGIN(const void *value),
    size_t seed)
        __attribute__nonnull__(2);

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
PARROT_CONST_FUNCTION
static int pointer_compare(SHIM_INTERP,
    ARGIN_NULLOK(const void *a),
    ARGIN_NULLOK(const void *b));

#define ASSERT_ARGS_cstring_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_expand_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_hash_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_hash_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_key_hash_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_key_hash_pointer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_parrot_mark_hash_both __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_mark_hash_keys __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_parrot_mark_hash_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_pointer_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */



/*

=item C<size_t key_hash_STRING(PARROT_INTERP, STRING *s, size_t seed)>

Returns the hashed value of the key C<value>.  See also string.c.

=cut

*/


PARROT_WARN_UNUSED_RESULT
size_t
key_hash_STRING(PARROT_INTERP, ARGMOD(STRING *s), SHIM(size_t seed))
{
    ASSERT_ARGS(key_hash_STRING)

    if (s->hashval)
        return s->hashval;

    return Parrot_str_to_hashval(interp, s);
}


/*

=item C<int STRING_compare(PARROT_INTERP, const void *search_key, const void
*bucket_key)>

Compares the two strings, returning 0 if they are identical.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
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
    if (Buffer_bufstart(s1) == Buffer_bufstart(s2)
    &&  s1->bufused == s2->bufused)
        return 0;

    return CHARSET_COMPARE(interp, s1, s2);
}


/*

=item C<int STRING_compare_distinct_cs_enc(PARROT_INTERP, const void
*search_key, const void *bucket_key)>

Compare two strings. Returns 0 if they are identical. Considers differing
charset or encoding to be distinct.

*/

PARROT_WARN_UNUSED_RESULT
int
STRING_compare_distinct_cs_enc(PARROT_INTERP, ARGIN(const void *search_key),
                                                ARGIN(const void *bucket_key))
{
    ASSERT_ARGS(STRING_compare_distinct_cs_enc)
    STRING const *s1 = (STRING const *)search_key;
    STRING const *s2 = (STRING const *)bucket_key;

    if (s1 && s2 && (
            s1->charset != s2->charset ||
            s1->encoding != s2->encoding)) {
        return 1;
    }

    return STRING_compare(interp, search_key, bucket_key);
}


/*

=item C<static int pointer_compare(PARROT_INTERP, const void *a, const void *b)>

Compares the two pointers, returning 0 if they are identical

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
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
PARROT_CONST_FUNCTION
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

=item C<size_t key_hash_PMC(PARROT_INTERP, PMC *value, size_t seed)>

Returns a hashed value for an PMC key (passed as a void pointer, sadly).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t
key_hash_PMC(PARROT_INTERP, ARGIN(PMC *value), SHIM(size_t seed))
{
    ASSERT_ARGS(key_hash_PMC)
    return VTABLE_hashvalue(interp, value);
}

/*

=item C<int PMC_compare(PARROT_INTERP, PMC *a, PMC *b)>

Compares two PMC for equality, returning 0 if the first is equal to second.
Uses void pointers to store the PMC, sadly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int
PMC_compare(PARROT_INTERP, ARGIN(PMC *a), ARGIN(PMC *b))
{
    ASSERT_ARGS(PMC_compare)

    /* If pointers are same - PMCs are same */
    if (a == b)
        return 0;

    /* PMCs of different types are differ */
    if (a->vtable->base_type != b->vtable->base_type)
        return 1;

    return !VTABLE_is_equal(interp, a, b);
}

/*

=item C<size_t key_hash_int(PARROT_INTERP, const void *value, size_t seed)>

Returns a hashed value for an integer key (passed as a void pointer, sadly).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
size_t
key_hash_int(SHIM_INTERP, ARGIN_NULLOK(const void *value), size_t seed)
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
PARROT_CONST_FUNCTION
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
parrot_mark_hash(PARROT_INTERP, ARGMOD(Hash *hash))
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
            Parrot_gc_mark_PObj_alive(interp, (PObj *)bucket->key);

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
    const UINTVAL entries = hash->entries;
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
            Parrot_gc_mark_PObj_alive(interp, (PObj *)bucket->value);

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
    const UINTVAL entries = hash->entries;
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
            Parrot_gc_mark_PObj_alive(interp, (PObj *)bucket->key);

            PARROT_ASSERT(bucket->value);
            Parrot_gc_mark_PObj_alive(interp, (PObj *)bucket->value);

            bucket = bucket->next;
        }
    }
}


/*

=item C<static void hash_thaw(PARROT_INTERP, Hash *hash, PMC *info)>

Visits the contents of a hash during freeze/thaw.

C<pinfo> is the visit info, (see include/parrot/pmc_freeze.h>).

=cut

*/

static void
hash_thaw(PARROT_INTERP, ARGMOD(Hash *hash), ARGMOD(PMC *info))
{
    ASSERT_ARGS(hash_thaw)

    /* during thaw, info->extra is the key/value count */
    const size_t     num_entries = (size_t) hash->entries;
    size_t           entry_index;

    hash->entries = 0;

    for (entry_index = 0; entry_index < num_entries; ++entry_index) {
        HashBucket *b;

        switch (hash->key_type) {
          case Hash_key_type_int:
            {
                const INTVAL i_key = VTABLE_shift_integer(interp, info);
                b = parrot_hash_put(interp, hash, (void*)i_key, NULL);
            }
            break;
          case Hash_key_type_STRING:
            {
                STRING * const s_key = VTABLE_shift_string(interp, info);
                b = parrot_hash_put(interp, hash, s_key, NULL);
            }
            break;
          case Hash_key_type_PMC:
            {
                PMC * const p_key = VTABLE_shift_pmc(interp, info);
                b = parrot_hash_put(interp, hash, p_key, NULL);
                break;
            }
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented key type");
            break;
        }

        switch (hash->entry_type) {
          case enum_hash_int:
            {
                const INTVAL i = VTABLE_shift_integer(interp, info);
                b->value       = (void *)i;
                break;
            }
          case enum_hash_string:
            {
                STRING * const s = VTABLE_shift_string(interp, info);
                b->value = (void *)s;
                break;
            }
          case enum_hash_pmc:
            {
                PMC * const p = VTABLE_shift_pmc(interp, info);
                b->value = (void *)p;
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

=item C<static void hash_freeze(PARROT_INTERP, const Hash *hash, PMC *info)>

Freezes hash into a string.

Takes an interpreter, a pointer to the hash, and a pointer to the structure
containing the string start location.

Use by parrot_hash_visit.

=cut

*/

static void
hash_freeze(PARROT_INTERP, ARGIN(const Hash *hash), ARGMOD(PMC *info))
{
    ASSERT_ARGS(hash_freeze)
    size_t           i;

    for (i = 0; i < hash->entries; ++i) {
        HashBucket * const b = hash->bs+i;

        switch (hash->key_type) {
          case Hash_key_type_int:
            VTABLE_push_integer(interp, info, (INTVAL)b->key);
            break;
          case Hash_key_type_STRING:
            VTABLE_push_string(interp, info, (STRING *)b->key);
            break;
          case Hash_key_type_PMC:
            VTABLE_push_pmc(interp, info, (PMC *)b->key);
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented key type");
            break;
        }

        switch (hash->entry_type) {
          case enum_hash_int:
            VTABLE_push_integer(interp, info, (INTVAL)b->value);
            break;
          case enum_hash_string:
            VTABLE_push_string(interp, info, (STRING *)b->value);
            break;
          case enum_hash_pmc:
            VTABLE_push_pmc(interp, info, (PMC *)b->value);
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
    PMC* const info = (PMC*) pinfo;

    switch (VTABLE_get_integer(interp, info)) {
      case VISIT_THAW_NORMAL:
        hash_thaw(interp, hash, info);
        break;
      case VISIT_FREEZE_NORMAL:
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
    HashBucket   *bs, *b, *new_mem;
    HashBucket * const old_offset = (HashBucket *)((char *)hash + sizeof (Hash));

    void * const  old_mem    = hash->bs;
    const UINTVAL old_size   = hash->mask + 1;
    const UINTVAL new_size   = old_size << 1;
    const UINTVAL old_nb     = N_BUCKETS(old_size);
    size_t        offset, i;

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
    if (old_offset != old_mem) {
        /* This buffer has been reallocated at least once before. */
        new_mem = (HashBucket *)Parrot_gc_reallocate_memory_chunk_with_interior_pointers(
                interp, old_mem, HASH_ALLOC_SIZE(new_size), HASH_ALLOC_SIZE(old_size));
    }
    else {
        /* Allocate a new buffer. */
        new_mem = (HashBucket *)Parrot_gc_allocate_memory_chunk_with_interior_pointers(
                interp, HASH_ALLOC_SIZE(new_size));
        memcpy(new_mem, old_mem, HASH_ALLOC_SIZE(old_size));
    }

    /*
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
         |  bs       | old_bi    |  new_bi       |
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
           ^                       ^
         | new_mem                 | hash->bi
    */
    bs     = new_mem;
    old_bi = (HashBucket **)(bs + old_nb);
    new_bi = (HashBucket **)(bs + N_BUCKETS(new_size));

    /* things can have moved by this offset */
    offset = (char *)new_mem - (char *)old_mem;

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
        size_t j;
        for (j = 0; j < old_size; ++j) {
            HashBucket **next_p = new_bi + j;
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

        while ((b = *next_p) != NULL) {
            /* rehash the bucket */
            const size_t new_loc =
                (hash->hash_val)(interp, b->key, hash->seed) & (new_size - 1);

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
    for (i = 0, b = (HashBucket *)new_bi - 1; i < old_nb; ++i, --b) {
        b->next         = hash->free_list;
        b->key          = b->value         = NULL;
        hash->free_list = b;
    }
}


/*

=item C<Hash* parrot_new_hash(PARROT_INTERP)>

Creates a new Parrot STRING hash.

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
        NOTNULL(hash_comp_fn compare), NOTNULL(hash_hash_key_fn keyhash))
{
    ASSERT_ARGS(parrot_create_hash)
    HashBucket  *bp;
    void        *alloc = Parrot_gc_allocate_memory_chunk_with_interior_pointers(
                            interp, sizeof (Hash) + HASH_ALLOC_SIZE(INITIAL_BUCKETS));
    Hash * const hash  = (Hash*)alloc;
    size_t       i;

    PARROT_ASSERT(INITIAL_BUCKETS % 4 == 0);

    hash->compare    = compare;
    hash->hash_val   = keyhash;
    hash->entry_type = val_type;
    hash->key_type   = hkey_type;
    hash->seed       = interp->hash_seed;
    hash->mask       = INITIAL_BUCKETS - 1;
    hash->entries    = 0;
    hash->container  = PMCNULL;

    /*
     * TODO if we have a significant amount of small hashes:
     * - allocate a bigger hash structure e.g. 128 byte
     * - use the bucket store and bi inside this structure
     * - when reallocate copy this part
     */
    bp = (HashBucket *)((char *)alloc + sizeof (Hash));
    hash->free_list = NULL;

    /* fill free_list from hi addresses so that we can use
     * buckets[i] directly in an OrderedHash, *if* nothing
     * was deleted */

    hash->bs  = bp;
    bp       += N_BUCKETS(INITIAL_BUCKETS);
    hash->bi  = (HashBucket **)bp;

    for (i = 0, --bp; i < N_BUCKETS(INITIAL_BUCKETS); ++i, --bp) {
        bp->next        = hash->free_list;
        hash->free_list = bp;
    }

    return hash;
}


/*

=item C<void parrot_hash_destroy(PARROT_INTERP, Hash *hash)>

Frees the memory allocated to the specified hash and its bucket store.  Used by
parrot_chash_destroy.

Unlike the C library function free(), the hash function must not be NULL.

=cut

*/

PARROT_EXPORT
void
parrot_hash_destroy(PARROT_INTERP, ARGFREE_NOTNULL(Hash *hash))
{
    ASSERT_ARGS(parrot_hash_destroy)
    HashBucket * const bp = (HashBucket*)((char*)hash + sizeof (Hash));
    if (bp != hash->bs)
        mem_gc_free(interp, hash->bs);
    mem_gc_free(interp, hash);
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

    for (i = 0; i <= hash->mask; ++i) {
        HashBucket *bucket = hash->bi[i];
        while (bucket) {
            mem_gc_free(interp, bucket->key);
            mem_gc_free(interp, bucket->value);
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
parrot_chash_destroy_values(PARROT_INTERP, ARGMOD(Hash *hash), NOTNULL(value_free func))
{
    ASSERT_ARGS(parrot_chash_destroy_values)
    UINTVAL i;

    for (i = 0; i <= hash->mask; ++i) {
        HashBucket *bucket = hash->bi[i];
        while (bucket) {
            mem_gc_free(interp, bucket->key);
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
parrot_hash_get_bucket(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(const void *key))
{
    ASSERT_ARGS(parrot_hash_get_bucket)

    if (hash->entries <= 0)
        return NULL;

    /* a very fast search for very small hashes */
    if (hash->entries <= SMALL_HASH_SIZE) {
        const UINTVAL  entries = hash->entries;
        UINTVAL        i;

        for (i = 0; i < entries; ++i) {
            HashBucket * const bucket = hash->bs + i;

            /* the hash->compare cost is too high for this fast path */
            if (bucket->key == key)
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

=item C<void * parrot_hash_get(PARROT_INTERP, const Hash *hash, const void
*key)>

Returns the value keyed by C<key>, or C<NULL> if no bucket is found.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
parrot_hash_get(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN(const void *key))
{
    ASSERT_ARGS(parrot_hash_get)
    const HashBucket * const bucket = parrot_hash_get_bucket(interp, hash, key);
    return bucket ? bucket->value : NULL;
}


/*

=item C<INTVAL parrot_hash_exists(PARROT_INTERP, const Hash *hash, void *key)>

Returns whether the key exists in the hash.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
parrot_hash_exists(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN(void *key))
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
parrot_hash_put(PARROT_INTERP, ARGMOD(Hash *hash),
        ARGIN_NULLOK(void *key), ARGIN_NULLOK(void *value))
{
    ASSERT_ARGS(parrot_hash_put)
    const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed);
    HashBucket   *bucket  = hash->bi[hashval & hash->mask];

    /* When the hash is constant, check that the key and value are also
     * constant. */
    if (!PMC_IS_NULL(hash->container)
    &&   PObj_constant_TEST(hash->container)) {
        if (hash->key_type == Hash_key_type_STRING
        && !PObj_constant_TEST((PObj *)key))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Used non-constant key in constant hash.");
            if (((hash->entry_type == enum_type_PMC)
            ||   (hash->entry_type == enum_type_STRING))
            &&   !PObj_constant_TEST((PObj *)value))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Used non-constant value in constant hash.");
    }

    while (bucket) {
        /* store hash_val or not */
        if ((hash->compare)(interp, key, bucket->key) == 0)
            break;
        bucket = bucket->next;
    }

    if (bucket)
        bucket->value = value;
    else {
        bucket = hash->free_list;

        if (!bucket) {
            expand_hash(interp, hash);
            bucket = hash->free_list;
        }

        ++hash->entries;
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

            --hash->entries;
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

    for (i = 0; i < entries; ++i) {
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
            valtmp = b->value;
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

=item C<PMC* get_integer_pmc(PARROT_INTERP, INTVAL value)>

Lookup the PMC type which is used for storing native integers.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
get_integer_pmc(PARROT_INTERP, INTVAL value)
{
    ASSERT_ARGS(get_integer_pmc)
    PMC * const ret = Parrot_pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Integer));
    VTABLE_set_integer_native(interp, ret, value);
    return ret;
}


/*

=item C<PMC* get_number_pmc(PARROT_INTERP, FLOATVAL value)>

Lookup the PMC type which is used for floating point numbers.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
get_number_pmc(PARROT_INTERP, FLOATVAL value)
{
    ASSERT_ARGS(get_number_pmc)
    PMC * const ret = Parrot_pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Float));
    VTABLE_set_number_native(interp, ret, value);
    return ret;
}

/*

=item C<PMC * get_string_pmc(PARROT_INTERP, STRING *value)>

Lookup the PMC type which is used for storing strings.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
get_string_pmc(PARROT_INTERP, ARGIN(STRING *value))
{
    ASSERT_ARGS(get_string_pmc)
    PMC * const ret = Parrot_pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_String));
    VTABLE_set_string_native(interp, ret, value);
    return ret;
}


/*

Poor-man polymorphic functions to convert something to something.

There is bunch of functions to convert from passed value to stored keys type and to/from
stored values type.

void *hash_key_from_TYPE convert to keys type.
TYPE hash_key_to_TYPE convert from keys type.
void *hash_value_from_TYPE convert to values type.
TYPE hash_value_to_TYPE convert from values type.

*/

/*

=item C<void* hash_key_from_int(PARROT_INTERP, const Hash *hash, INTVAL key)>

Cast INTVAL to hash key.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_key_from_int(PARROT_INTERP, ARGIN(const Hash *hash), INTVAL key)
{
    ASSERT_ARGS(hash_key_from_int)
    void *ret;
    switch (hash->key_type) {
      case Hash_key_type_int:
        ret = (void *)key;
        break;
        /* Currently PMCs are stringified */
      case Hash_key_type_PMC:
        ret = (void *)get_integer_pmc(interp, key);
        break;
      case Hash_key_type_STRING:
        ret = (void *)Parrot_str_from_int(interp, key);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported key_type");
    }
    return ret;
}

/*

=item C<void* hash_key_from_string(PARROT_INTERP, const Hash *hash, STRING
*key)>

Cast STRING to hash key.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_key_from_string(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN(STRING *key))
{
    ASSERT_ARGS(hash_key_from_string)
    void *ret;
    switch (hash->key_type) {
      case Hash_key_type_int:
      {
        /* Pacify compiler about casting INVTAL to void */
        const INTVAL int_key = Parrot_str_to_int(interp, key);
        ret                  = INTVAL2PTR(void *, int_key);
        break;
      }

      case Hash_key_type_PMC:
        ret = get_string_pmc(interp, key);
        break;

      case Hash_key_type_STRING:
        ret = key;
        break;

      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported key_type");
    }
    return ret;
}

/*

=item C<void* hash_key_from_pmc(PARROT_INTERP, const Hash *hash, PMC *key)>

Cast PMC* to hash key.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_key_from_pmc(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN(PMC *key))
{
    ASSERT_ARGS(hash_key_from_pmc)
    void *ret;
    switch (hash->key_type) {
      case Hash_key_type_int:
        {
            const INTVAL int_key = VTABLE_get_integer(interp, key);
            ret                  = INTVAL2PTR(void *, int_key);
            break;
        }
      case Hash_key_type_PMC:
        {
            /* Extract real value from Key (and box it if nessary) */
            if (key->vtable->base_type == enum_class_Key)
                switch (key_type(interp, key)) {
                  case KEY_integer_FLAG:
                    key = get_integer_pmc(interp, key_integer(interp, key));
                    break;
                  case KEY_string_FLAG:
                    key = get_string_pmc(interp, key_string(interp, key));
                    break;
                  case KEY_number_FLAG:
                    key = get_number_pmc(interp, key_number(interp, key));
                    break;
                  case KEY_pmc_FLAG:
                    key = key_pmc(interp, key);
                    break;
                  default:
                    /* It's impossible if Keys are same (and they are not) */
                    /* So throw exception */
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                "hash: unexpected type of Key");
                    break;
                }

            ret = key;
            break;
        }
      case Hash_key_type_STRING:
        {
            STRING * const tmp = VTABLE_get_string(interp, key);
            if (STRING_IS_NULL(tmp))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
                            "hash: can't use null as key");
            ret = (void *)tmp;
        }
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported key_type");
    }
    return ret;
}

/*

=item C<INTVAL hash_key_to_int(PARROT_INTERP, const Hash *hash, void *key)>

Cast hash key to INTVAL.

=cut

*/

INTVAL
hash_key_to_int(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(void *key))
{
    ASSERT_ARGS(hash_key_to_int)
    INTVAL ret;
    switch (hash->key_type) {
      case Hash_key_type_int:
        ret = (INTVAL)key;
        break;
      case Hash_key_type_PMC:
        ret = VTABLE_get_integer(interp, (PMC *)key);
        break;
      case Hash_key_type_STRING:
        ret = Parrot_str_to_int(interp, (STRING *)key);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported key_type");
    }
    return ret;
}

/*

=item C<STRING* hash_key_to_string(PARROT_INTERP, const Hash *hash, void *key)>

Cast hash key to STRING.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
hash_key_to_string(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(void *key))
{
    ASSERT_ARGS(hash_key_to_string)
    STRING *ret;
    switch (hash->key_type) {
      case Hash_key_type_int:
        ret = Parrot_str_from_int(interp, (INTVAL)key);
        break;

      case Hash_key_type_PMC:
        ret = VTABLE_get_string(interp, (PMC *)key);
        break;

      case Hash_key_type_STRING:
        ret = (STRING *)key;
        break;

      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported key_type");
    }
    return ret;
}

/*

=item C<PMC* hash_key_to_pmc(PARROT_INTERP, const Hash * const hash, void *key)>

Cast hash key to PMC*.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
hash_key_to_pmc(PARROT_INTERP, ARGIN(const Hash * const hash), ARGIN(void *key))
{
    ASSERT_ARGS(hash_key_to_pmc)
    PMC *ret;
    switch (hash->key_type) {
      case Hash_key_type_int:
        ret = get_integer_pmc(interp, (INTVAL)key);
        break;
      case Hash_key_type_PMC:
        ret = (PMC*)key;
        break;
      case Hash_key_type_STRING:
        ret = get_string_pmc(interp, (STRING*)key);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported key_type");
    }
    return ret;
}

/* Second part - convert from stored void* to real type */
/* TODO: FLOATVALs converted into Float PMC for now */

/*

=item C<void* hash_value_from_int(PARROT_INTERP, const Hash *hash, INTVAL
value)>

Cast INTVAL to hash value.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_value_from_int(PARROT_INTERP, ARGIN(const Hash *hash), INTVAL value)
{
    ASSERT_ARGS(hash_value_from_int)
    void *ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        ret = INTVAL2PTR(void *, value);
        break;
      case enum_type_PMC:
        {
            PMC * const tmp = get_integer_pmc(interp, value);
            ret = (void *)tmp;
        }
        break;
      case enum_type_STRING:
        ret = (void *)Parrot_str_from_int(interp, value);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<void* hash_value_from_string(PARROT_INTERP, const Hash *hash, STRING
*value)>

Cast STRING to hash value.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_value_from_string(PARROT_INTERP, ARGIN(const Hash *hash),
        ARGIN_NULLOK(STRING *value))
{
    ASSERT_ARGS(hash_value_from_string)
    void *ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        {
            const INTVAL int_val = STRING_IS_NULL(value) ?
                    (INTVAL) 0 : Parrot_str_to_int(interp, value);
            ret = INTVAL2PTR(void *, int_val);
        }
        break;
      case enum_type_STRING:
        ret = (void *)value;
        break;
      case enum_type_PMC:
        {
            PMC * const s = STRING_IS_NULL(value) ?
                   PMCNULL : get_string_pmc(interp, value);
            ret = (void *)s;
        }
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<void* hash_value_from_pmc(PARROT_INTERP, const Hash *hash, PMC *value)>

Cast PMC to hash value.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_value_from_pmc(PARROT_INTERP, ARGIN(const Hash *hash),
    ARGIN_NULLOK(PMC *value))
{
    ASSERT_ARGS(hash_value_from_pmc)
    void *ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        {
            const INTVAL int_val = PMC_IS_NULL(value) ?
                    (INTVAL) 0 : VTABLE_get_integer(interp, value);
            ret                  = INTVAL2PTR(void *, int_val);
        }
        break;
      case enum_type_STRING:
        ret = PMC_IS_NULL(value) ?
                PMCNULL : (void *)VTABLE_get_string(interp, value);
        break;
      case enum_type_PMC:
        ret = (void *)value;
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<void* hash_value_from_number(PARROT_INTERP, const Hash *hash, FLOATVAL
value)>

Cast FLOATVAL to hash value.

=cut

*/

PARROT_CAN_RETURN_NULL
void*
hash_value_from_number(PARROT_INTERP, ARGIN(const Hash *hash), FLOATVAL value)
{
    ASSERT_ARGS(hash_value_from_number)
    void *ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        {
            const INTVAL tmp = value;
            ret = (void*)tmp;
        }
        break;
      case enum_type_STRING:
        ret = (void *)Parrot_str_from_num(interp, value);
        break;
      case enum_type_PMC:
        {
            PMC * const tmp = get_number_pmc(interp, value);
            ret = (void *)tmp;
        }
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<INTVAL hash_value_to_int(PARROT_INTERP, const Hash *hash, void *value)>

Cast hash value to INTVAL.

=cut

*/

INTVAL
hash_value_to_int(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(void *value))
{
    ASSERT_ARGS(hash_value_to_int)
    INTVAL ret;
    switch (hash->entry_type) {
      case enum_type_ptr:
      case enum_type_INTVAL:
        ret = (INTVAL)value;
        break;
      case enum_type_STRING:
        ret = Parrot_str_to_int(interp, (STRING*)value);
        break;
      case enum_type_PMC:
        ret = VTABLE_get_integer(interp, (PMC*)value);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<STRING* hash_value_to_string(PARROT_INTERP, const Hash *hash, void
*value)>

Cast hash value to STRING.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING*
hash_value_to_string(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(void *value))
{
    ASSERT_ARGS(hash_value_to_string)
    STRING *ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        ret = Parrot_str_from_int(interp, (INTVAL)value);
        break;
      case enum_type_STRING:
        ret = (STRING *)value;
        break;
      case enum_type_PMC:
        ret = VTABLE_get_string(interp, (PMC *)value);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<PMC* hash_value_to_pmc(PARROT_INTERP, const Hash *hash, void *value)>

Cast hash value to PMC.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
hash_value_to_pmc(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(void *value))
{
    ASSERT_ARGS(hash_value_to_pmc)
    PMC *ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        ret = get_integer_pmc(interp, (INTVAL)value);
        break;
      case enum_type_STRING:
        ret = get_string_pmc(interp, (STRING*)value);
        break;
      case enum_type_PMC:
        ret = (PMC *)value;
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
}

/*

=item C<FLOATVAL hash_value_to_number(PARROT_INTERP, const Hash *hash, void
*value)>

Cast hash value to FLOATVAL.

=cut

*/

FLOATVAL
hash_value_to_number(PARROT_INTERP, ARGIN(const Hash *hash), ARGIN_NULLOK(void *value))
{
    ASSERT_ARGS(hash_value_to_number)
    FLOATVAL ret;
    switch (hash->entry_type) {
      case enum_type_INTVAL:
        {
            /* Pacify compiler about casting */
            const INTVAL tmp = (INTVAL)value;
            ret = tmp;
        }
        break;
      case enum_type_STRING:
        ret = Parrot_str_to_num(interp, (STRING*)value);
        break;
      case enum_type_PMC:
        ret = VTABLE_get_number(interp, (PMC*)value);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Hash: unsupported entry_type");
    }
    return ret;
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
