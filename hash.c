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
 *  Todo:
 *     FIXME: hash_delete is currently incorrect if string_compare can
 *     trigger a collection.
 *  Notes:
 *     Future optimizations:
 *       - Stop reallocating the bucket pool, and instead add chunks on.
 *         (Saves pointer fixups and copying during realloc.)
 *       - Hash contraction (dunno if it's worth it)
 *  References:
 *     pdd08_keys.pod */

#include "parrot/parrot.h"

#define INITIAL_BUCKETS 16
#define MAXFULL_PERCENT 80

/* Assumes 2's complement? */
const BucketIndex NULLBucketIndex = (BucketIndex)-1;

/* A HashIndex is an index into the hashtable, i.e., the array of
 * buckets indexed by hash(KEY) mod hash_size */
const HashIndex NULLHashIndex = (HashIndex)-1;

STRING * hash_get_idx(Interp *interpreter, HASH *hash, PMC *key);

/* Is there a way to portably add inlining hints anymore? */
#define FIXME_INLINE

static FIXME_INLINE HASHBUCKET *
getBucket(HASH *hash, BucketIndex idx)
{
    if (idx == NULLBucketIndex)
        return NULL;
    return &((HASHBUCKET *)hash->bucket_pool->bufstart)[idx];
}

static FIXME_INLINE BucketIndex
lookupBucketIndex(HASH *hash, HashIndex slot)
{
    return ((BucketIndex *)hash->buffer.bufstart)[slot];
}

static FIXME_INLINE HASHBUCKET *
lookupBucket(HASH *hash, HashIndex slot)
{
    return getBucket(hash, lookupBucketIndex(hash, slot));
}

/*=for api key key_hash

Return the hashed value of the string

=cut */

static INTVAL
key_hash(Interp *interpreter, STRING *value)
{
    char *buffptr = value->strstart;
    INTVAL len = value->strlen;
    register INTVAL hash = 5381;

    UNUSED(interpreter);

    while (len--) {
        hash += hash << 5;
        hash += *buffptr++;
    }

    return hash;
}

void
dump_hash(Interp *interpreter, HASH *hash)
{
    HashIndex i;
    PIO_eprintf(interpreter, "Hashtable[%vd/%vd]\n", hash->entries,
                hash->max_chain + 1);

    /* Iterate one past the end of the hashtable, so we can use the
     * last value as a special case for dumping out the free bucket
     * list. */
    for (i = 0; i <= hash->max_chain + 1; i++) {
        HASHBUCKET *bucket;
        if (i > hash->max_chain)
            bucket = getBucket(hash, hash->free_list);
        else
            bucket = lookupBucket(hash, i);
        if (bucket == NULL)
            continue;
        PIO_eprintf(interpreter, "  Bucket %vd: ", i);
        while (bucket) {
            PIO_eprintf(interpreter, "type(%d)", bucket->value.type);
            bucket = getBucket(hash, bucket->next);
            if (bucket)
                PIO_eprintf(interpreter, " -> ");
        }
        PIO_eprintf(interpreter, "\n");
    }
}

void
mark_hash(Interp *interpreter, HASH *hash)
{
    HashIndex i;

    pobject_lives(interpreter, (PObj *)hash);

    if (hash->bucket_pool) {
        pobject_lives(interpreter, (PObj *)hash->bucket_pool);
    }

    if (hash->buffer.bufstart == NULL || hash->bucket_pool->bufstart == NULL) {
        return;
    }

    for (i = 0; i <= hash->max_chain; i++) {
        HASHBUCKET *bucket = lookupBucket(hash, i);
        while (bucket) {
            pobject_lives(interpreter, (PObj *)bucket->key);
            if (bucket->value.type == enum_hash_string)
                pobject_lives(interpreter,
                             (PObj *)bucket->value.val.string_val);
            else if (bucket->value.type == enum_hash_pmc)
                pobject_lives(interpreter, (PObj *)bucket->value.val.pmc_val);
            bucket = getBucket(hash, bucket->next);
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
expand_hash(Interp *interpreter, HASH *hash)
{
    BucketIndex *table;
    HASHBUCKET *bucket;
    UINTVAL old_size = hash->max_chain + 1;
    UINTVAL new_size = (old_size ? (old_size << 1) : INITIAL_BUCKETS);
    UINTVAL new_max_chain = new_size - 1;
    HashIndex new_loc;

    HashIndex hi;
    BucketIndex bi;

    UINTVAL old_pool_size = hash->bucket_pool->buflen / sizeof(HASHBUCKET);
    UINTVAL new_pool_size = new_size * MAXFULL_PERCENT / 100;

    Parrot_reallocate(interpreter, hash, new_size * sizeof(BucketIndex));
    Parrot_reallocate(interpreter, hash->bucket_pool,
                      new_pool_size * sizeof(HASHBUCKET));

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
            new_loc = key_hash(interpreter, bucket->key) & new_max_chain;
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
new_bucket(Interp *interpreter, HASH *hash, STRING *key, HASH_ENTRY *value)
{
    BucketIndex bucket_index;

    if (key == NULL) {
        internal_exception(INTERNAL_PANIC, "NULL key\n");
        return NULLBucketIndex;
    }

    if (value == NULL) {
        internal_exception(INTERNAL_PANIC, "NULL value\n");
        return NULLBucketIndex;
    }

    bucket_index = hash->free_list;
    if (bucket_index != NULLBucketIndex) {
        HASHBUCKET *bucket = getBucket(hash, bucket_index);

        hash->free_list = bucket->next;
        bucket->key = key;
        bucket->value = *value;
        return bucket_index;
    }

    /* Free list is empty. Need to expand the hashtable. */
    expand_hash(interpreter, hash);
    return new_bucket(interpreter, hash, key, value);
}

static HASHBUCKET *
find_bucket(Interp *interpreter, HASH *hash, BucketIndex head, STRING *key)
{
    BucketIndex next;

    if (head != NULLBucketIndex && key == NULL)
        PANIC("find_bucket given a null key");

    while (head != NULLBucketIndex) {
        HASHBUCKET *bucket = getBucket(hash, head);
        next = bucket->next;
        if (string_compare(interpreter, key, bucket->key) == 0) {
            return getBucket(hash, head);
        }
        head = next;
    }

    return NULL;
}

/* FIXME: This function can go back to just returning the hash struct
 * pointer once Buffers can define their own custom mark routines. */
void
new_hash(Interp *interpreter, HASH **hash_ptr)
{
    HASH *hash = (HASH *)new_bufferlike_header(interpreter, sizeof(*hash));
    *hash_ptr = hash;

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

/*=for api key hash_size

return the number of used entries in hashtable

=cut
*/

INTVAL
hash_size(Interp *interpreter, HASH *hash)
{
    UNUSED(interpreter);

    if (hash != NULL) {
        return hash->entries;
    }
    else {
        PIO_eprintf(interpreter, "*** hash_size asked to check a NULL hash\n");
        return 0;
    }
}

static HASHBUCKET *
hash_lookup(Interp *interpreter, HASH *hash, STRING *key)
{
    UINTVAL hashval = key_hash(interpreter, key);
    HashIndex *table = (HashIndex *)hash->buffer.bufstart;
    BucketIndex chain = table[hashval & hash->max_chain];
    return find_bucket(interpreter, hash, chain, key);
}

/*
 * called by interator
 */
STRING *
hash_get_idx(Interp *interpreter, HASH *hash, PMC * key)
{
    HashIndex i = key->cache.int_val;
    BucketIndex bi = (BucketIndex)PMC_data(key);
    HASHBUCKET *b;
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

HASH_ENTRY *
hash_get(Interp *interpreter, HASH *hash, STRING *key)
{
    HASHBUCKET *bucket = hash_lookup(interpreter, hash, key);
    if (bucket == NULL)
        return NULL;            /* Not found */
    return &bucket->value;
}

/* The key is *not* copied. */
void
hash_put(Interp *interpreter, HASH *hash, STRING *key, HASH_ENTRY *value)
{
    BucketIndex *table;
    UINTVAL hashval;
    BucketIndex bucket_index;
    BucketIndex chain;
    HASHBUCKET *bucket;

    /*      dump_hash(interpreter, hash); */

    hashval = key_hash(interpreter, key);
    table = (BucketIndex *)hash->buffer.bufstart;
    chain = table ? table[hashval & hash->max_chain] : NULLBucketIndex;
    bucket = find_bucket(interpreter, hash, chain, key);

    /*      fprintf(stderr, "HASH=%p buckets=%p chain=%p bucket=%p KEY=%s\n", */
    /*              hash, hash->buffer.bufstart, chain, bucket, string_to_cstring(interpreter, key)); */

    if (bucket) {
        /* Replacing old value */
        memcpy(&bucket->value, value, sizeof(HASH_ENTRY));
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
}

void
hash_delete(Interp *interpreter, HASH *hash, STRING *key)
{
    UINTVAL hashval;
    HashIndex slot;
    HASHBUCKET *bucket;
    HASHBUCKET *prev = NULL;

    hashval = key_hash(interpreter, key);
    slot = hashval & hash->max_chain;

    for (bucket = lookupBucket(hash, slot);
         bucket != NULL; bucket = getBucket(hash, bucket->next)) {
        if (string_compare(interpreter, key, bucket->key) == 0) {
            BucketIndex bi;
            /* FIXME: If string_compare triggers a collection, both
             * bucket and prev will end up pointing to junk memory.
             * They need to be BucketIndexes or refetched. */
            if (prev)
                prev->next = bucket->next;
            else {
                BucketIndex *table = (BucketIndex *)hash->buffer.bufstart;
                table[slot] = bucket->next;
            }
            hash->entries--;
            /* put bucket on free list */
            bi = bucket - ((HASHBUCKET *)hash->bucket_pool->bufstart);
            bucket->next = hash->free_list;
            hash->free_list = bi;
            return;
        }
        prev = bucket;
    }

    PANIC("hash_delete given nonexistent key");
}

void
hash_clone(struct Parrot_Interp *interp, HASH *hash, HASH **dest)
{
    HashIndex i;

    Parrot_block_DOD(interp);
    new_hash(interp, dest);
    for (i = 0; i <= hash->max_chain; i++) {
        BucketIndex bi = lookupBucketIndex(hash, i);
        while (bi != NULLBucketIndex) {
            HASHBUCKET *b = getBucket(hash, bi);
            HASH_ENTRY valtmp;
            switch (b->value.type) {
            case enum_hash_undef:
            case enum_hash_int:
            case enum_hash_num:
                valtmp = b->value;
                break;

            case enum_hash_string:
                valtmp.type = enum_hash_string;
                valtmp.val.string_val
                    = string_copy(interp, b->value.val.string_val);
                /* b is no longer valid (due to GC) */
                b = getBucket(hash, bi);
                break;

            case enum_hash_pmc:
                valtmp.type = enum_hash_pmc;
                valtmp.val.pmc_val = pmc_new_noinit(interp,
                    b->value.val.pmc_val->vtable->base_type);
                VTABLE_clone(interp,
                    b->value.val.pmc_val, valtmp.val.pmc_val );
                /* b is no longer valid (due to GC) */
                b = getBucket(hash, bi);
                break;

            default:
                internal_exception(-1, "hash corruption: type = %d\n",
                                   b->value.type);
            };
            hash_put(interp, *dest, b->key, &valtmp);
            bi = b->next;
        }
    }
    Parrot_unblock_DOD(interp);
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
