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
C<< hash->buckets >> bucket store points to this region.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* the number of entries above which it's faster to hash the hashval instead of
 * looping over the used HashBuckets directly */
#define INITIAL_SIZE  8

/* HEADERIZER HFILE: include/parrot/hash.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void expand_hash(PARROT_INTERP, ARGMOD(Hash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hash);

PARROT_CANNOT_RETURN_NULL
static PMC* get_integer_pmc(PARROT_INTERP, INTVAL value)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static PMC* get_number_pmc(PARROT_INTERP, FLOATVAL value)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static PMC * get_string_pmc(PARROT_INTERP, ARGIN(STRING *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int hash_compare_cstring(SHIM_INTERP,
    ARGIN(const char *a),
    ARGIN(const char *b))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

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

#define ASSERT_ARGS_expand_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_get_integer_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_number_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_string_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_hash_compare_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
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

=item C<int hash_compare_string(PARROT_INTERP, const void *search_key, const
void *bucket_key)>

Compares the two strings, returning 0 if they are identical.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
hash_compare_string(PARROT_INTERP, ARGIN(const void *search_key),
        ARGIN_NULLOK(const void *bucket_key))
{
    ASSERT_ARGS(hash_compare_string)
    STRING const *s1 = (STRING const *)search_key;
    STRING const *s2 = (STRING const *)bucket_key;

    if (s1->hashval != s2->hashval)
        return 1;

    return STRING_compare(interp, s1, s2);
}


/*

=item C<int hash_compare_string_distinct_enc(PARROT_INTERP, const void
*search_key, const void *bucket_key)>

Compare two strings. Returns 0 if they are identical. Considers differing
charset or encoding to be distinct.

*/

PARROT_WARN_UNUSED_RESULT
int
hash_compare_string_distinct_enc(PARROT_INTERP, ARGIN(const void *search_key),
                                                ARGIN(const void *bucket_key))
{
    ASSERT_ARGS(hash_compare_string_distinct_enc)
    STRING const *s1 = (STRING const *)search_key;
    STRING const *s2 = (STRING const *)bucket_key;

    if (s1 && s2 && s1->encoding != s2->encoding)
        return 1;

    return hash_compare_string(interp, search_key, bucket_key);
}


/*

=item C<int hash_compare_pointer(PARROT_INTERP, const void *a, const void *b)>

Compares the two pointers, returning 0 if they are identical

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
int
hash_compare_pointer(SHIM_INTERP, ARGIN_NULLOK(const void *a), ARGIN_NULLOK(const void *b))
{
    ASSERT_ARGS(hash_compare_pointer)
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

=item C<static int hash_compare_cstring(PARROT_INTERP, const char *a, const char
*b)>

Compares two C strings for equality, returning -1, 0, and 1 if the first string
is less than, equal to, or greater than the second, respectively.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static int
hash_compare_cstring(SHIM_INTERP, ARGIN(const char *a), ARGIN(const char *b))
{
    ASSERT_ARGS(hash_compare_cstring)
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

=item C<int hash_compare_pmc(PARROT_INTERP, PMC *a, PMC *b)>

Compares two PMC for equality, returning 0 if the first is equal to second.
Uses void pointers to store the PMC, sadly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int
hash_compare_pmc(PARROT_INTERP, ARGIN(PMC *a), ARGIN(PMC *b))
{
    ASSERT_ARGS(hash_compare_pmc)

    /* If pointers are same - PMCs are same */
    if (a == b)
        return 0;

    /* PMCs of different types are different */
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

=item C<int hash_compare_int(PARROT_INTERP, const void *a, const void *b)>

Compares two integers for equality, returning -1, 0, and 1 if the first is less
than, equal to, or greater than the second, respectively.  Uses void pointers
to store the integers, sadly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
int
hash_compare_int(SHIM_INTERP, ARGIN_NULLOK(const void *a), ARGIN_NULLOK(const void *b))
{
    ASSERT_ARGS(hash_compare_int)
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

Marks the hash and its contents as live.  Assumes that key and value are
non-null in all buckets.

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
    parrot_hash_iterate(hash,
        PARROT_ASSERT(_bucket->key);
        Parrot_gc_mark_PObj_alive(interp, (PObj *)_bucket->key););
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
    parrot_hash_iterate(hash,
        PARROT_ASSERT(_bucket->value);
        Parrot_gc_mark_PObj_alive(interp, (PObj *)_bucket->value););
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
    parrot_hash_iterate(hash,
        PARROT_ASSERT(_bucket->key);
        Parrot_gc_mark_PObj_alive(interp, (PObj *)_bucket->key);
        PARROT_ASSERT(_bucket->value);
        Parrot_gc_mark_PObj_alive(interp, (PObj *)_bucket->value););
}

/*

=item C<Hash * Parrot_hash_thaw(PARROT_INTERP, PMC *info)>

Visits the contents of a hash during freeze/thaw.

C<pinfo> is the visit info, (see include/parrot/pmc_freeze.h>).

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
Hash *
Parrot_hash_thaw(PARROT_INTERP, ARGMOD(PMC *info))
{
    ASSERT_ARGS(Parrot_hash_thaw)

    const size_t            num_entries = VTABLE_shift_integer(interp, info);
    const Hash_key_type     key_type    = (Hash_key_type)VTABLE_shift_integer(interp, info);
    const PARROT_DATA_TYPE  entry_type  = (PARROT_DATA_TYPE)VTABLE_shift_integer(interp, info);
    size_t                  entry_index;
    Hash                   *hash;

    {
        hash_comp_fn     cmp_fn;
        hash_hash_key_fn key_fn;

        switch (key_type) {
            case Hash_key_type_int:
                key_fn = (hash_hash_key_fn)key_hash_int;
                cmp_fn = (hash_comp_fn)hash_compare_int;
                break;
            case Hash_key_type_STRING:
                key_fn = (hash_hash_key_fn)key_hash_STRING;
                cmp_fn = (hash_comp_fn)hash_compare_string;
                break;
            case Hash_key_type_PMC:
                key_fn = (hash_hash_key_fn)key_hash_PMC;
                cmp_fn = (hash_comp_fn)hash_compare_pmc;
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "unimplemented key type");
                break;
        }

        hash = parrot_create_hash_sized(interp, entry_type, key_type, cmp_fn, key_fn, num_entries);

    }

    /* special case for great speed */
    if (key_type   == Hash_key_type_STRING
    &&  entry_type == enum_hash_int) {
        for (entry_index = 0; entry_index < num_entries; ++entry_index) {
            STRING * const key = VTABLE_shift_string(interp, info);
            const INTVAL   i   = VTABLE_shift_integer(interp, info);
            parrot_hash_put(interp, hash, (void *)key, (void *)i);
        }

        return hash;
    }

    for (entry_index = 0; entry_index < num_entries; ++entry_index) {
        void       *key;

        switch (key_type) {
          case Hash_key_type_int:
            {
                const INTVAL i_key = VTABLE_shift_integer(interp, info);
                key                = (void *)i_key;
            }
            break;
          case Hash_key_type_STRING:
            {
                STRING * const s_key = VTABLE_shift_string(interp, info);
                key                  = (void *)s_key;
            }
            break;
          case Hash_key_type_PMC:
            {
                PMC * const p_key = VTABLE_shift_pmc(interp, info);
                key               = (void *)p_key;
                break;
            }
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented key type");
            break;
        }

        switch (entry_type) {
          case enum_hash_int:
            {
                const INTVAL i = VTABLE_shift_integer(interp, info);
                parrot_hash_put(interp, hash, key, (void *)i);
                break;
            }
          case enum_hash_string:
            {
                STRING * const s = VTABLE_shift_string(interp, info);
                parrot_hash_put(interp, hash, key, (void *)s);
                break;
            }
          case enum_hash_pmc:
            {
                PMC * const p = VTABLE_shift_pmc(interp, info);
                parrot_hash_put(interp, hash, key, (void *)p);
                break;
            }
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented value type");
            break;
        }
    }

    return hash;
}


/*

=item C<void Parrot_hash_freeze(PARROT_INTERP, const Hash *hash, PMC *info)>

Freezes hash into a string.

Takes an interpreter, a pointer to the hash, and a pointer to the structure
containing the string start location.

=cut

*/

void
Parrot_hash_freeze(PARROT_INTERP, ARGIN(const Hash *hash), ARGMOD(PMC *info))
{
    ASSERT_ARGS(Parrot_hash_freeze)
    const Hash_key_type    key_type   = hash->key_type;
    const PARROT_DATA_TYPE entry_type = hash->entry_type;
    const size_t           entries    = hash->entries;
    size_t                 i;

    VTABLE_push_integer(interp, info, entries);
    VTABLE_push_integer(interp, info, key_type);
    VTABLE_push_integer(interp, info, entry_type);

    parrot_hash_iterate(hash,
        switch (key_type) {
          case Hash_key_type_int:
            VTABLE_push_integer(interp, info, (INTVAL)_bucket->key);
            break;
          case Hash_key_type_STRING:
            VTABLE_push_string(interp, info, (STRING *)_bucket->key);
            break;
          case Hash_key_type_PMC:
            VTABLE_push_pmc(interp, info, (PMC *)_bucket->key);
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented key type");
            break;
        }
        switch (entry_type) {
          case enum_hash_int:
            VTABLE_push_integer(interp, info, (INTVAL)_bucket->value);
            break;
          case enum_hash_string:
            VTABLE_push_string(interp, info, (STRING *)_bucket->value);
            break;
          case enum_hash_pmc:
            VTABLE_push_pmc(interp, info, (PMC *)_bucket->value);
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "unimplemented value type");
            break;
        });
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

    void * const  old_mem    = hash->buckets;
    const UINTVAL old_size   = hash->mask + 1;
    const UINTVAL new_size   = old_size << 1; /* Double. Right-shift is 2x */
    const UINTVAL old_nb     = N_BUCKETS(old_size);
    const UINTVAL new_nb     = N_BUCKETS(new_size);
    size_t        offset, i;

    const hash_hash_key_fn hash_val_func = hash->hash_val;
    const int              is_string_key = (hash_val_func == (hash_hash_key_fn)key_hash_STRING);

    /*
       allocate some less buckets
       e.g. 3 buckets, 4 pointers:

         +---+---+---+-+-+-+-+
         | --> buckets |     |
         +---+---+---+-+-+-+-+
         ^             ^
         | old_mem     | hash->index
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
         |  buckets  | old_bi    |  new_bi       |
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
         ^                       ^
         | new_mem               | hash->index
    */

    bs     = new_mem;
    old_bi = (HashBucket **)(bs + old_nb);
    new_bi = (HashBucket **)(bs + new_nb);

    /* things can have moved by this offset */
    offset = (char *)new_mem - (char *)old_mem;

    /* relocate the bucket index */
    mem_sys_memmove(new_bi, old_bi, old_size * sizeof (HashBucket *));

    /* update hash data */
    hash->index = new_bi;
    hash->buckets        = bs;
    hash->mask = new_size - 1;

    /* clear freshly allocated bucket index */
    memset(new_bi + old_size, 0, sizeof (HashBucket *) * (new_size - old_size));

    /* reloc pointers and recalc bucket indices */
    for (i = 0; i < old_size; ++i) {
        HashBucket **next_p = new_bi + i;

        while (*next_p != NULL) {
            size_t new_loc;
            size_t hashval;

            b = (HashBucket *)((char *)*next_p + offset);

            /* rehash the bucket */
            if (is_string_key) {
                STRING *s = (STRING *)b->key;
                hashval   = s->hashval;
            }
            else {
                hashval = hash_val_func(interp, b->key, hash->seed);
            }

            new_loc = hashval & (new_size - 1);

            if (i != new_loc) {
                *next_p         = b->next;
                b->next         = new_bi[new_loc];
                new_bi[new_loc] = b;
            }
            else {
                *next_p = b;
                next_p  = &b->next;
            }
        }
    }

    /* add new buckets to free_list
     * lowest bucket is top on free list and will be used first */
    for (b = bs + old_nb; b < bs + new_nb - 1; ++b) {
        b->next = b + 1;
        b->key  = b->value = NULL;
    }

    b->next = hash->free_list;
    hash->free_list = bs + old_nb;
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
            hash_compare_string,
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
            (hash_comp_fn)hash_compare_cstring,
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
            hash_compare_pointer,
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
            hash_compare_int,
            key_hash_int);
}

/*

=item C<Hash * parrot_create_hash(PARROT_INTERP, PARROT_DATA_TYPE val_type,
Hash_key_type hkey_type, hash_comp_fn compare, hash_hash_key_fn keyhash)>

Creates and initializes a hash.  Function pointers determine its behaviors.

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
    return parrot_create_hash_sized(interp, val_type, hkey_type, compare, keyhash,
                                    INITIAL_SIZE);
}


/*

=item C<static UINTVAL round_up_pow2(UINTVAL x)>

Round a value up to the nearest power of 2.

=cut

*/

PARROT_INLINE
static UINTVAL
round_up_pow2(UINTVAL x) {
    UINTVAL y = 1;
    while (y < x)
        y <<= 1;
    return y;
}


/*

=item C<Hash * parrot_create_hash_sized(PARROT_INTERP, PARROT_DATA_TYPE
val_type, Hash_key_type hkey_type, hash_comp_fn compare, hash_hash_key_fn
keyhash, UINTVAL size)>

Creates and initializes a hash, similar to C<parrot_create_hash>.

Preallocates at least C<size> buckets.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
Hash *
parrot_create_hash_sized(PARROT_INTERP, PARROT_DATA_TYPE val_type, Hash_key_type hkey_type,
        NOTNULL(hash_comp_fn compare), NOTNULL(hash_hash_key_fn keyhash), UINTVAL size)
{
    ASSERT_ARGS(parrot_create_hash_sized)
    UINTVAL      initial_buckets = size > INITIAL_SIZE ? round_up_pow2(size) : INITIAL_SIZE;
    HashBucket  *bp;
    void        *alloc = Parrot_gc_allocate_memory_chunk_with_interior_pointers(
                            interp, sizeof (Hash) + HASH_ALLOC_SIZE(initial_buckets));
    Hash * const hash  = (Hash*)alloc;
    size_t       i;

    PARROT_ASSERT(initial_buckets % 4 == 0);

    hash->compare    = compare;
    hash->hash_val   = keyhash;
    hash->entry_type = val_type;
    hash->key_type   = hkey_type;
    hash->seed       = interp->hash_seed;
    hash->mask       = initial_buckets - 1;
    hash->entries    = 0;

    bp = (HashBucket *)((char *)alloc + sizeof (Hash));
    hash->free_list = NULL;

    /* fill free_list from hi addresses so that we can use
     * buckets[i] directly in an OrderedHash, *if* nothing
     * was deleted */

    hash->buckets = bp;
    bp += N_BUCKETS(initial_buckets);
    hash->index = (HashBucket **)bp;

    for (i = 0, --bp; i < N_BUCKETS(initial_buckets); ++i, --bp) {
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
    if (bp != hash->buckets)
        mem_gc_free(interp, hash->buckets);
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
    parrot_hash_iterate(hash,
        mem_gc_free(interp, _bucket->key);
        mem_gc_free(interp, _bucket->value););
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

    parrot_hash_iterate(hash,
        mem_gc_free(interp, _bucket->key);
        func(_bucket->value););

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
    UINTVAL     hashval;
    HashBucket *bucket;
    const hash_hash_key_fn hash_val = hash->hash_val;
    const hash_comp_fn     compare  = hash->compare;

    if (hash->entries <= 0)
        return NULL;

    if (hash_val == (hash_hash_key_fn)key_hash_STRING
    &&  compare == hash_compare_string) {
        /* fast path for string keys */
        DECL_CONST_CAST;
        STRING * const s = (STRING *)PARROT_const_cast(void *, key);

        if (s->hashval)
            hashval = s->hashval;
        else
            hashval = Parrot_str_to_hashval(interp, s);

        bucket = hash->index[hashval & hash->mask];

        while (bucket) {
            const STRING *s2 = (const STRING *)bucket->key;

            if (s == s2
            || (hashval == s2->hashval
            &&  STRING_compare(interp, s, s2) == 0))
                return bucket;

            bucket = bucket->next;
        }
    }
    else {
        hashval = hash_val(interp, key, hash->seed);
        bucket  = hash->index[hashval & hash->mask];

        while (bucket) {
            /* key equality is always a match, so it's worth checking */
            if (bucket->key == key

            /* ... but the slower comparison is more accurate */
            || ((compare)(interp, key, bucket->key) == 0))
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
    UINTVAL     hashval;
    HashBucket *bucket;
    const hash_hash_key_fn hash_val = hash->hash_val;
    const hash_comp_fn     compare  = hash->compare;

    if (hash_val == (hash_hash_key_fn)key_hash_STRING
    &&  compare == hash_compare_string) {
        /* fast path for string keys */
        STRING *s = (STRING *)key;

        if (s->hashval)
            hashval = s->hashval;
        else
            hashval = Parrot_str_to_hashval(interp, s);

        bucket = hash->index[hashval & hash->mask];

        while (bucket) {
            const STRING *s2 = (const STRING *)bucket->key;

            if (s == s2
            || (hashval == s2->hashval
            &&  STRING_compare(interp, s, s2) == 0))
                break;

            bucket = bucket->next;
        }
    }
    else {
        hashval = hash_val(interp, key, hash->seed);
        bucket  = hash->index[hashval & hash->mask];

        /* See if we have an existing value for this key */
        while (bucket) {
            /* store hash_val or not */
            if (compare(interp, key, bucket->key) == 0)
                break;
            bucket = bucket->next;
        }
    }

    /* If we have a bucket already, put the value in it. Otherwise, we need
       to get a new bucket */
    if (bucket)
        bucket->value = value;
    else {
        /* Get a new bucket off the free list. If the free list is empty, we
           expand the hash so we get more items on the free list */
        bucket = hash->free_list;
        if (!bucket) {
            expand_hash(interp, hash);
            bucket = hash->free_list;
        }

        /* Add the value to the new bucket, increasing the count of elements */
        ++hash->entries;
        hash->free_list                = bucket->next;
        bucket->key                    = key;
        bucket->value                  = value;
        bucket->next = hash->index[hashval & hash->mask];
        hash->index[hashval & hash->mask] = bucket;
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
    const UINTVAL hashval = (hash->hash_val)(interp, key, hash->seed) & hash->mask;
    HashBucket   **prev   = &hash->index[hashval];
    if (*prev) {
        const hash_comp_fn compare = hash->compare;
        for (; *prev; prev = &(*prev)->next) {
            HashBucket *current = *prev;
            if ((compare)(interp, key, current->key) == 0) {
                *prev = current->next;
                --hash->entries;
                current->next    = hash->free_list;
                current->key     = NULL;
                hash->free_list = current;
                return;
            }
        }
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
    parrot_hash_clone_prunable(interp, hash, dest, 1);
}

/*

=item C<void parrot_hash_clone_prunable(PARROT_INTERP, const Hash *hash, Hash
*dest, int deep)>

helper function to Clone C<hash> to C<dest>

allows deep cloning of PMC types if deep set

=cut

*/

void
parrot_hash_clone_prunable(PARROT_INTERP, ARGIN(const Hash *hash),
    ARGOUT(Hash *dest), int deep)
{
    ASSERT_ARGS(parrot_hash_clone_prunable)

    parrot_hash_iterate(hash,
        void         *valtmp;
        void * const  key = _bucket->key;

        switch (hash->entry_type) {
          case enum_type_undef:
          case enum_type_ptr:
          case enum_type_INTVAL:
            valtmp = (void *)_bucket->value;
            break;

          case enum_type_STRING:
            valtmp = _bucket->value;
            break;

          case enum_type_PMC:
            if (PMC_IS_NULL((PMC *)_bucket->value))
                valtmp = (void *)PMCNULL;
            else
                if (deep)
                    valtmp = (void *)VTABLE_clone(interp, (PMC*)_bucket->value);
                else
                    valtmp = _bucket->value;
            break;

          default:
            valtmp = NULL; /* avoid warning */
            Parrot_ex_throw_from_c_args(interp, NULL, -1,
                    "hash corruption: type = %d\n", hash->entry_type);
        };
        if (key)
            parrot_hash_put(interp, dest, key, valtmp););
}

/*

=item C<static PMC* get_integer_pmc(PARROT_INTERP, INTVAL value)>

Lookup the PMC type which is used for storing native integers.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC*
get_integer_pmc(PARROT_INTERP, INTVAL value)
{
    ASSERT_ARGS(get_integer_pmc)
    PMC * const ret = Parrot_pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Integer));
    VTABLE_set_integer_native(interp, ret, value);
    return ret;
}


/*

=item C<static PMC* get_number_pmc(PARROT_INTERP, FLOATVAL value)>

Lookup the PMC type which is used for floating point numbers.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC*
get_number_pmc(PARROT_INTERP, FLOATVAL value)
{
    ASSERT_ARGS(get_number_pmc)
    PMC * const ret = Parrot_pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_Float));
    VTABLE_set_number_native(interp, ret, value);
    return ret;
}

/*

=item C<static PMC * get_string_pmc(PARROT_INTERP, STRING *value)>

Lookup the PMC type which is used for storing strings.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC *
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
