/* hash.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *     A hashtable contains an array of bucket indexes. Buckets
 *     are nodes in a linked list, each containing a STRING key and
 *     a value. The value is currently stored as a HASH_ENTRY, which
 *     maybe makes sense for some hashes but probably doesn't for what
 *     they're currently used for, which is PerlHashes (since those
 *     should probably just be hashes of STRINGs mapping to PMCs.)
 *
 *     To minimize memory overhead, buckets are carved out of a pool
 *     that is allocated normally by parrot's memory subsystem. That
 *     means that the pool can get moved around a lot.
 *
 *  History:
 *     Initial version by Jeff G. on 2001.12.05
 *     Substantially rewritten by Steve F.
 *     2003.10.25 leo add function pointer for compare, hash, mark
 *                    hash keys are now (void *)
 *                    add new_cstring_hash() function
 *
 *     2003.11.04 leo bucket->value is now a plain pointer, no more
 *                    an HASH_ENTRY
 *                    With little changes, we can again store
 *                    arbitrary items if needed, s. TODO in code
 *     2003.11.06 boemmels renamed HASH and HASHBUCKET
 *                     to Hash and HashBucket
 *     2003.11.11 leo randomize key_hash seed
 *                    extend new_hash_x() init call by value_type and _size.
 *     2003.11.14 leo USE_STRING_EQUAL define, s. comment below
 *
 *  Notes:
 *     Future optimizations:
 *       - Stop reallocating the bucket pool, and instead add chunks on.
 *         (Saves pointer fixups and copying during realloc.)
 *       - Hash contraction (dunno if it's worth it)
 *
 *  References:
 *     pdd08_keys.pod
 */

#include "parrot/parrot.h"
#include <assert.h>

#define INITIAL_BUCKETS 16
#define MAXFULL_PERCENT 80

/*
 * The following define allows 2 different strategys to deal with non-ASCII
 * hash keys.
 * 1 ... Original code. Keys are stored as is. Each compare (which can happen
 *       more then once per lookup) possibly transcodes keys and then
 *       compares these keys.
 * 0 ... Ascii keys are stored as is. As soon as the first non-ASCII key is
 *       stored in the Hash, all keys are converted to utf8 and the key is
 *       stored in that encoding too.
 *       Keys are transcoded once before insert or lookup.
 *       The only (theoretical?) problem is, that keys are either just stored
 *       or (after transcoding) a copy of a key is stored. This could
 *       probably be solved by transcoding the string in place.
 *
 * Timing of (string, hash -O3, Athlon-800)
 * $ parrot -C examples/benchmarks/hash-utf8.pasm
 * #define USE_STRING_EQUAL 1
 * 0.35
 * 8.2
 * #define USE_STRING_EQUAL 0
 * 0.36
 * 0.54
 */

#define USE_STRING_EQUAL 0


/* Assumes 2's complement? */
const BucketIndex NULLBucketIndex = (BucketIndex)-1;

/* A HashIndex is an index into the hashtable, i.e., the array of
 * buckets indexed by hash(KEY) mod hash_size */
const HashIndex NULLHashIndex = (HashIndex)-1;

STRING * hash_get_idx(Interp *interpreter, Hash *hash, PMC *key);

static PARROT_INLINE HashBucket *
getBucket(Hash *hash, BucketIndex idx)
{
    if (idx == NULLBucketIndex)
        return NULL;
    /* TODO honor hash->value_size */
    return &((HashBucket *)hash->bucket_pool->bufstart)[idx];
}

static PARROT_INLINE BucketIndex
lookupBucketIndex(Hash *hash, HashIndex slot)
{
    return ((BucketIndex *)hash->buffer.bufstart)[slot];
}

static PARROT_INLINE HashBucket *
lookupBucket(Hash *hash, HashIndex slot)
{
    return getBucket(hash, lookupBucketIndex(hash, slot));
}

/*

=for api hash key_hash_STRING

Return the hashed value of the string

=cut

*/

static size_t
key_hash_STRING(Interp *interpreter, Hash *hash, void *value)
{
    char *buffptr = ((STRING* )value)->strstart;
    UINTVAL len = ((STRING* )value)->bufused;
    register size_t h = hash->seed;

    UNUSED(interpreter);

    while (len--) {
        h += h << 5;
        h += *buffptr++;
    }

    return h;
}

/*
 * compare 2 strings, return 0 if ident
 *
 * a = search key, b = bucket key
 */
static int
STRING_compare(Parrot_Interp interp, void *a, void *b)
{
#if USE_STRING_EQUAL
    return string_equal(interp, (STRING *)a, (STRING *) b);
#else
    return hash_string_equal(interp, (STRING *)a, (STRING *) b);
#endif
}

#if USE_STRING_EQUAL
#  define promote_hash_key(i,h,k,f) (k)
#else

/*
 * just replace the type and encoding, all keys are ascii
 * til now, so the hash_values of the keys are unchanged
 *
 * if any allocation is done inside the loop, that might trigger GC
 * the HashBucket must be refetched
 */

static void
convert_hash_keys_to_utf8(Parrot_Interp interpreter, Hash *hash)
{
    HashIndex i;
    const ENCODING * enc = encoding_lookup_index(enum_encoding_utf8);
    const CHARTYPE * typ = chartype_lookup_index(enum_chartype_unicode);

    for (i = 0; i <= hash->max_chain; i++) {
        BucketIndex bi = lookupBucketIndex(hash, i);
        while (bi != NULLBucketIndex) {
            HashBucket *b = getBucket(hash, bi);
            STRING *key = (STRING*) b->key;
            assert(key->type->index == enum_chartype_usascii);
            assert(key->encoding->index == enum_encoding_singlebyte);
            key->type = typ;
            key->encoding = enc;
            bi = b->next;
        }
    }
    hash->key_type = Hash_key_type_utf8;
}

/*
 * check and possibly promote a hash key to utf8
 * - if hash->key_type matches key, ok
 * - if hash is ascii and key is for insert convert all hash keys to utf8
 * - and convert key to utf8
 */

static void*
promote_hash_key(Interp *interpreter, Hash *hash, void *key, int for_insert)
{
    STRING *s;
    const ENCODING * enc;
    const CHARTYPE * typ;

    switch (hash->key_type) {
        case Hash_key_type_int:
        case Hash_key_type_cstring:
            return key;
        case Hash_key_type_ascii:
            s = (STRING*) key;
            if (s->type->index == enum_chartype_usascii)
                return key;
            if (for_insert)
                convert_hash_keys_to_utf8(interpreter, hash);
            enc = encoding_lookup_index(enum_encoding_utf8);
            typ = chartype_lookup_index(enum_chartype_unicode);
            return string_transcode(interpreter, s, enc, typ, NULL);
        case Hash_key_type_utf8:
            s = (STRING*) key;
            if (s->encoding->index != enum_encoding_utf8) {
                enc = encoding_lookup_index(enum_encoding_utf8);
                typ = chartype_lookup_index(enum_chartype_unicode);
                return string_transcode(interpreter, s, enc, typ, NULL);
            }
            return key;
        default:
            internal_exception(1, "Illegal key_type");
    }
    return key;
}
#endif

/*
 * cstring compare and hash functions
 */
static size_t
key_hash_cstring(Interp *interpreter, Hash* hash, void *value)
{
    register size_t h = hash->seed;
    unsigned char * p = (unsigned char *) value;
    while (*p) {
        h += h << 5;
        h += *p++;
    }
    return h;
}

static int
cstring_compare(Parrot_Interp interp, void *a, void *b)
{
    UNUSED(interp);
    return strcmp(a, b);
}

void
dump_hash(Interp *interpreter, Hash *hash)
{
    HashIndex i;
    PIO_eprintf(interpreter, "Hashtable[%vd/%vd]\n", hash->entries,
                hash->max_chain + 1);

    /* Iterate one past the end of the hashtable, so we can use the
     * last value as a special case for dumping out the free bucket
     * list. */
    for (i = 0; i <= hash->max_chain + 1; i++) {
        HashBucket *bucket;
        if (i > hash->max_chain)
            bucket = getBucket(hash, hash->free_list);
        else
            bucket = lookupBucket(hash, i);
        if (bucket == NULL)
            continue;
        PIO_eprintf(interpreter, "  Bucket %vd: ", i);
        while (bucket) {
            Parrot_block_GC(interpreter); /* don't allow bucket to move */
            PIO_eprintf(interpreter, "(%p)", bucket->value);
            Parrot_unblock_GC(interpreter);
            bucket = getBucket(hash, bucket->next);
            if (bucket)
                PIO_eprintf(interpreter, " -> ");
        }
        PIO_eprintf(interpreter, "\n");
    }
}

void
mark_hash(Interp *interpreter, Hash *hash)
{
    HashIndex i;

    pobject_lives(interpreter, (PObj *)hash);

    if (hash->bucket_pool) {
        pobject_lives(interpreter, (PObj *)hash->bucket_pool);
    }

    if (!hash->buffer.bufstart|| !hash->bucket_pool->bufstart) {
        return;
    }
    if (!hash->mark_key && hash->entry_type != enum_hash_string &&
            hash->entry_type != enum_hash_pmc)
        return;

    for (i = 0; i <= hash->max_chain; i++) {
        HashBucket *bucket = lookupBucket(hash, i);
        while (bucket) {
            if (hash->mark_key)
                (hash->mark_key)(interpreter, (PObj *)bucket->key);
            if (hash->entry_type == enum_hash_string)
                pobject_lives(interpreter, (PObj *)bucket->value);
            else if (hash->entry_type == enum_hash_pmc)
                pobject_lives(interpreter, (PObj *)bucket->value);
            bucket = getBucket(hash, bucket->next);
        }
    }
}

void
hash_visit(Interp *interpreter, Hash *hash, void* pinfo)
{
    visit_info* info = (visit_info*) pinfo;
    size_t i, n;
    STRING *key;
    IMAGE_IO *io = info->image_io;
    HashBucket *b;
    int freezing =
        info->what == VISIT_FREEZE_NORMAL ||
        info->what == VISIT_FREEZE_AT_DESTRUCT;
    /*
     * during thaw info->extra is the key/value count
     */
    assert(hash->entry_type == enum_hash_pmc);
    switch (info->what) {
        case VISIT_THAW_NORMAL:
        case VISIT_THAW_CONSTANTS:
            assert(info->extra_flags == EXTRA_IS_COUNT);
            n = (size_t) info->extra;
            for (i = 0; i < n; ++i) {
                key = io->vtable->shift_string(interpreter, io);
                b = hash_put(interpreter, hash, key, NULL);
                info->thaw_ptr = (PMC**)&b->value;
                (info->visit_pmc_now)(interpreter, NULL, info);
            }
            break;
        default:
            for (i = 0; i <= hash->max_chain; i++) {
                b = lookupBucket(hash, i);
                while (b) {
                    if (freezing)
                        io->vtable->push_string(interpreter, io, b->key);
                    (info->visit_pmc_now)(interpreter, b->value, info);
                    b = getBucket(hash, b->next);
                }
            }
    }
}

/* For a hashtable of size N, we use MAXFULL_PERCENT% of N as the number of
 * buckets. This way, as soon as we run out of buckets on the free list,
 * we know that it's time to resize the hashtable.
 *
 * Algorithm for expansion: We exactly double the size of the hashtable.
 * Keys are assigned to buckets with the formula
 *    bucket_index = hash(key) % hash_size
 * so when doubling the size of the hashtable, we know that every key
 * is either already in the correct bucket, or belongs in the current
 * bucket plus hash_size (the old hash_size). In fact, because the
 * hashtable is always a power of two in size, it depends only on the
 * next bit in the hash value, after the ones previously used.
 *
 * So we scan through all the buckets in order, moving the buckets
 * that need to be moved. No bucket will be scanned twice, and the
 * cache should be reasonably happy because the hashtable accesses
 * will be two parallel sequential scans. (Of course, this also mucks
 * with the ->next pointers, and they'll be all over memory.)
 */
static void
expand_hash(Interp *interpreter, Hash *hash)
{
    BucketIndex *table;
    HashBucket *bucket;
    UINTVAL old_size = hash->max_chain + 1;
    UINTVAL new_size = (old_size ? (old_size << 1) : INITIAL_BUCKETS);
    UINTVAL new_max_chain = new_size - 1;
    HashIndex new_loc;

    HashIndex hi;
    BucketIndex bi;

    UINTVAL old_pool_size = hash->bucket_pool->buflen / sizeof(HashBucket);
    UINTVAL new_pool_size = new_size * MAXFULL_PERCENT / 100;

    Parrot_reallocate(interpreter, hash, new_size * sizeof(BucketIndex));
    /* TODO honor hash->value_size */
    Parrot_reallocate(interpreter, hash->bucket_pool,
                      new_pool_size * sizeof(HashBucket));

    /* Add the newly allocated buckets onto the free list */
    for (bi = old_pool_size; bi < new_pool_size; bi++) {
        bucket = getBucket(hash, bi);
        bucket->next = hash->free_list;
        hash->free_list = bi;
    }

    /* NULL out new space in table */
    memset((HashIndex *)hash->buffer.bufstart + old_size,
           NULLBucketIndex, (new_size - old_size) * sizeof(BucketIndex));

    /* Warning: for efficiency, we cache the table in a local
     * variable. If any possibly gc-triggering code is added to the
     * following loop, this could become invalid. (Why would this
     * happen? Well, at the moment, two equivalent key strings with
     * different encodings will not map to the same hash value. This
     * is most probably a bug. But if you fix it by making key_hash
     * transcode to a canonical encoding, then you'll trigger GC.)
     * (And I'll probably forget to change this comment, but I think
     * I'm going to canonicalize key encodings on insertion.) */
    table = (BucketIndex *)hash->buffer.bufstart;

    /* Move buckets to new homes */
    for (hi = 0; hi < old_size; hi++) {
        BucketIndex *bucketIdxP = &table[hi];
        while (*bucketIdxP != NULLBucketIndex) {
            BucketIndex bucketIdx = *bucketIdxP;
            bucket = getBucket(hash, bucketIdx);
            new_loc =
                (hash->hash_val)(interpreter, hash, bucket->key) &
                    new_max_chain;
            if (new_loc != hi) {
                /* Remove from table */
                *bucketIdxP = bucket->next;

                /* Add to new spot in table */
                bucket->next = table[new_loc];
                table[new_loc] = bucketIdx;
            }
            else {
                bucketIdxP = &bucket->next;
            }
        }
    }

    hash->max_chain = new_max_chain;
}

static BucketIndex
new_bucket(Interp *interpreter, Hash *hash, void *key, void *value)
{
    BucketIndex bucket_index;

    bucket_index = hash->free_list;
    if (bucket_index != NULLBucketIndex) {
        HashBucket *bucket = getBucket(hash, bucket_index);

        hash->free_list = bucket->next;
        bucket->key = key;
        bucket->value = value;  /* TODO copy value_size if(value_size) */
        return bucket_index;
    }

    /* Free list is empty. Need to expand the hashtable. */
    expand_hash(interpreter, hash);
    return new_bucket(interpreter, hash, key, value);
}

static HashBucket *
find_bucket(Interp *interpreter, Hash *hash, BucketIndex head, void *key)
{
    BucketIndex next;

    assert(head == NULLBucketIndex || key);

    while (head != NULLBucketIndex) {
        HashBucket *bucket = getBucket(hash, head);
        next = bucket->next;
        if ((hash->compare)(interpreter, key, bucket->key) == 0) {
            return getBucket(hash, head);
        }
        head = next;
    }

    return NULL;
}

void
new_hash(Interp *interpreter, Hash **hptr)
{
    new_hash_x(interpreter, hptr,
            enum_type_PMC,
            0,
            Hash_key_type_ascii,
            STRING_compare,     /* STRING compare */
            key_hash_STRING,    /*        hash */
            pobject_lives);     /*        mark */
}

void
new_cstring_hash(Interp *interpreter, Hash **hptr)
{
    new_hash_x(interpreter, hptr,
            enum_type_PMC,
            0,
            Hash_key_type_cstring,
            cstring_compare,     /* cstring compare */
            key_hash_cstring,    /*        hash */
            (hash_mark_key_fn)0);/* no     mark */
}

/* FIXME: This function can go back to just returning the hash struct
 * pointer once Buffers can define their own custom mark routines.
 *
 * The problem is: During DODs stack walking the item on the stack
 * must be a PMC. When an auto Hash* is seen, it doesn't get properly
 * marked (only the Hash* buffer is marked, not its contents). By
 * passing the **hptr up to PerlHash's init function, the newly
 * constructed PMC is on the stack *including* this newly constructed
 * Hash, so that it gets marked properly.
 *
 */
void
new_hash_x(Interp *interpreter, Hash **hptr,
        PARROT_DATA_TYPES val_type, size_t val_size,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash,
        hash_mark_key_fn mark)
{
    Hash *hash = (Hash *)new_bufferlike_header(interpreter, sizeof(*hash));
    *hptr = hash;
    hash->compare = compare;
    hash->hash_val = keyhash;
    hash->mark_key = mark;
    hash->entry_type = val_type;
    hash->key_type = hkey_type;
    hash->value_size = val_size;       /* extra size */
    hash->seed = (size_t) Parrot_uint_rand(0);

    /*      PObj_report_SET(&hash->buffer); */

    /* We rely on the fact that expand_hash() will be called before
     * this function returns, so that max_chain will always contain a
     * valid value except when the hash is being initially created.
     * This does, however, prevent the future space optimization of
     * not allocating any buckets for empty hashes. */
    hash->max_chain = (HashIndex)-1;

    hash->entries = 0;

    /* Ensure mark_hash doesn't try to mark the buffer live */
    hash->bucket_pool = NULL;
    hash->bucket_pool = new_buffer_header(interpreter);
    /*      PObj_report_SET(hash->bucket_pool); */
    hash->free_list = NULLBucketIndex;
    expand_hash(interpreter, hash);
}

/*

=for api hash hash_size

return the number of used entries in hashtable

=cut

*/

INTVAL
hash_size(Interp *interpreter, Hash *hash)
{
    UNUSED(interpreter);

    if (hash)
        return hash->entries;
    internal_exception(1, "hash_size asked to check a NULL hash\n");
    return 0;
}

/*
 * called by interator
 */
STRING *
hash_get_idx(Interp *interpreter, Hash *hash, PMC * key)
{
    HashIndex i = key->cache.int_val;
    BucketIndex bi = (BucketIndex)PMC_data(key);
    HashBucket *b;
    /* locate initial */
    if (bi == INITBucketIndex) {
        bi = lookupBucketIndex(hash, i);
        while (bi == NULLBucketIndex) {
            ++i;
            if (i > hash->max_chain)
                return NULL;
            bi = lookupBucketIndex(hash, i);
        }
    }
    b = getBucket(hash, bi);
    /* locate next */
    bi = b->next;
    while (bi == NULLBucketIndex) {
        ++i;
        if (i > hash->max_chain) {
            i = -1;     /* set EOF flag */
            break;
        }
        bi = lookupBucketIndex(hash, i);
    }
    key->cache.int_val = i;
    PMC_data(key) = (void *)bi;
    return b->key;
}


HashBucket *
hash_get_bucket(Interp *interpreter, Hash *hash, void *okey)
{
    void *key = promote_hash_key(interpreter, hash, okey, 0);
    UINTVAL hashval = (hash->hash_val)(interpreter, hash, key);
    HashIndex *table = (HashIndex *)hash->buffer.bufstart;
    BucketIndex chain = table[hashval & hash->max_chain];
    return find_bucket(interpreter, hash, chain, key);
}

void *
hash_get(Interp *interpreter, Hash *hash, void *key)
{
    HashBucket *bucket = hash_get_bucket(interpreter, hash, key);
    return bucket ? bucket->value : NULL;
}

INTVAL
hash_exists(Interp *interpreter, Hash *hash, void *key)
{
    HashBucket *bucket = hash_get_bucket(interpreter, hash, key);
    return bucket ? 1 : 0;
}

/* The key is *not* copied. */
HashBucket*
hash_put(Interp *interpreter, Hash *hash, void *okey, void *value)
{
    BucketIndex *table;
    UINTVAL hashval;
    BucketIndex bucket_index;
    BucketIndex chain;
    HashBucket *bucket;

    void *key = promote_hash_key(interpreter, hash, okey, 1);

    /*      dump_hash(interpreter, hash); */

    hashval = (hash->hash_val)(interpreter, hash, key);
    table = (BucketIndex *)hash->buffer.bufstart;
    assert(table);
    chain = table[hashval & hash->max_chain];
    bucket = find_bucket(interpreter, hash, chain, key);

    /*      fprintf(stderr, "Hash=%p buckets=%p chain=%p bucket=%p KEY=%s\n", */
    /*              hash, hash->buffer.bufstart, chain, bucket, string_to_cstring(interpreter, key)); */

    if (bucket) {
        /* Replacing old value */
        bucket->value = value;  /* TODO copy value_size */
    }
    else {
        /* Create new bucket */
        hash->entries++;
        bucket_index = new_bucket(interpreter, hash, key, value);
        bucket = getBucket(hash, bucket_index);
        table = (BucketIndex *)hash->buffer.bufstart;
        bucket->next = table[hashval & hash->max_chain];
        table[hashval & hash->max_chain] = bucket_index;
    }
    /*      dump_hash(interpreter, hash); */
    return bucket;
}

void
hash_delete(Interp *interpreter, Hash *hash, void *okey)
{
    UINTVAL hashval;
    HashIndex slot;
    HashBucket *bucket;
    HashBucket *prev = NULL;
    void *key = promote_hash_key(interpreter, hash, okey, 0);

    hashval = (hash->hash_val)(interpreter, hash, key);
    slot = hashval & hash->max_chain;

    /*
     * string_compare can trigger GC but we can't allow bucket to move
     */
    Parrot_block_GC(interpreter);
    for (bucket = lookupBucket(hash, slot);
            bucket != NULL; bucket = getBucket(hash, bucket->next)) {
        if ((hash->compare)(interpreter, key, bucket->key) == 0) {
            BucketIndex bi;
            if (prev)
                prev->next = bucket->next;
            else {
                BucketIndex *table = (BucketIndex *)hash->buffer.bufstart;
                table[slot] = bucket->next;
            }
            hash->entries--;
            /* put bucket on free list */
            bi = bucket - ((HashBucket *)hash->bucket_pool->bufstart);
            bucket->next = hash->free_list;
            hash->free_list = bi;
            Parrot_unblock_GC(interpreter);
            return;
        }
        prev = bucket;
    }
    Parrot_unblock_GC(interpreter);
}

void
hash_clone(struct Parrot_Interp *interp, Hash *hash, Hash **dest)
{
    HashIndex i;

    new_hash_x(interp, dest, hash->entry_type, hash->value_size,
            hash->key_type, hash->compare, hash->hash_val, hash->mark_key);
    for (i = 0; i <= hash->max_chain; i++) {
        BucketIndex bi = lookupBucketIndex(hash, i);
        while (bi != NULLBucketIndex) {
            HashBucket *b = getBucket(hash, bi);
            void *key = b->key;
            void *valtmp;
            switch (hash->entry_type) {
            case enum_type_undef:
            case enum_type_ptr:
            case enum_type_INTVAL:
            /* case enum_type_FLOATVAL:  TODO use value_size */
                valtmp = b->value;
                break;

            case enum_type_STRING:
                valtmp = string_copy(interp, b->value);
                break;

            case enum_type_PMC:
                valtmp = VTABLE_clone(interp, (PMC*)b->value);
                break;

            default:
                internal_exception(-1, "hash corruption: type = %d\n",
                                   hash->entry_type);
                valtmp = NULL; /* avoid warning */
            };
            hash_put(interp, *dest, key, valtmp);
            /*
             * hash_put may extend the hash, which can trigger GC
             * we could also check the GC count and refetch b only when needed
             */
            b = getBucket(hash, bi);
            bi = b->next;
        }
    }
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
