/* hash.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *     A hashtable contains an array of bucket indexes. Buckets
 *     are nodes in a linked list, each containing a STRING key and
 *     a value. The value is currently stored as a KEY_ATOM, which
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
 *  Notes:
 *     Future optimizations:
 *       - compute modulus by ANDing with hash_size-1 (The compiler
 *         cannot know that hash_size is always a power of 2.)
 *       - Stop reallocating the bucket pool, and instead add chunks on.
 *         (Saves pointer fixups and copying during realloc.)
 *       - Hash contraction (dunno if it's worth it)
 *  References:
 *     pdd08_keys.pod */

#include "parrot/parrot.h"

#define INITIAL_BUCKETS 16
#define MAXFULL_PERCENT 80

/* A BucketIndex is an index into the pool of available buckets. */
typedef UINTVAL BucketIndex;
/* Assumes 2's complement? */
const BucketIndex NULLBucketIndex = (BucketIndex) -1;

/* A HashIndex is an index into the hashtable, i.e., the array of
 * buckets indexed by hash(KEY) mod hash_size */
typedef UINTVAL HashIndex;
const HashIndex NULLHashIndex = (HashIndex) -1;

struct _hashbucket {
    STRING *key;
    KEY_ATOM value;
    BucketIndex next;
};

struct _hash {
    Buffer buffer;              /* This struct is a Buffer subclass! */
    UINTVAL hash_size;
    UINTVAL entries;            /* Number of values stored in hashtable */
    Buffer* bucket_pool; /* Buffer full of buckets, used and unused */
    BucketIndex free_list;
};

/* Is there a way to portably add inlining hints anymore? */
#define FIXME_INLINE

static FIXME_INLINE HASHBUCKET* getBucket(HASH* hash, BucketIndex idx)
{
    if (idx == NULLBucketIndex) return NULL;
    return &((HASHBUCKET*) hash->bucket_pool->bufstart)[idx];
}

static FIXME_INLINE HASHBUCKET* lookupBucket(HASH* hash, HashIndex slot)
{
    return getBucket(hash, ((BucketIndex*) hash->buffer.bufstart)[slot]);
}

/*=for api key key_hash

Return the hashed value of the string

=cut */

static INTVAL
key_hash(Interp *interpreter, STRING *value)
{
    char *buffptr = value->bufstart;
    INTVAL len = value->bufused;
    INTVAL hash = 5893;

    UNUSED(interpreter);

    while (len--) {
        hash = hash * 33 + *buffptr++;
    }
    if (hash < 0) {
        hash = -hash;
    }
    return hash;
}

void
dump_hash(Interp *interpreter, HASH *hash)
{
    HashIndex i;
    fprintf(stderr, "Hashtable[" INTVAL_FMT "/" INTVAL_FMT "]\n",
            hash->entries, hash->hash_size);
    for (i = 0; i <= hash->hash_size; i++) {
        HASHBUCKET* bucket;
        if (i == hash->hash_size) bucket = getBucket(hash, hash->free_list);
        else bucket = lookupBucket(hash, i);
        if (bucket == NULL) continue;
        fprintf(stderr, "  Bucket " INTVAL_FMT ": ", i);
        while (bucket) {
            fprintf(stderr, "type(%d)", bucket->value.type);
            bucket = getBucket(hash, bucket->next);
            if (bucket) fprintf(stderr, " -> ");
        }
        fprintf(stderr, "\n");
    }
}

PMC *
mark_hash(Interp *interpreter, HASH *hash, PMC *end_of_used_list)
{
    HashIndex i;

    buffer_lives((Buffer *)hash);
    buffer_lives(hash->bucket_pool);
    for (i = 0; i < hash->hash_size; i++) {
        HASHBUCKET* bucket = lookupBucket(hash, i);
        while (bucket) {
            buffer_lives((Buffer *)bucket->key);
            if (bucket->value.type == enum_key_string)
                buffer_lives((Buffer *)bucket->value.val.string_val);
            else if (bucket->value.type == enum_key_pmc)
                end_of_used_list = mark_used(bucket->value.val.pmc_val,
                                             end_of_used_list);
            bucket = getBucket(hash, bucket->next);
        }
    }

    return end_of_used_list;
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
    BucketIndex* table;
    HASHBUCKET* bucket;
    UINTVAL new_size = (hash->hash_size ? hash->hash_size * 2
                        : INITIAL_BUCKETS);
    HashIndex hi;
    BucketIndex bi;
    UINTVAL old_pool_size = hash->bucket_pool->buflen / sizeof(HASHBUCKET);
    UINTVAL new_pool_size = new_size * MAXFULL_PERCENT / 100;

    Parrot_reallocate(interpreter, hash, new_size * sizeof(HASHBUCKET *));
    Parrot_reallocate(interpreter, hash->bucket_pool,
                      new_pool_size * sizeof(HASHBUCKET));

    /* Add the newly allocated buckets onto the free list */
    for (bi = old_pool_size; bi < new_pool_size; bi++) {
        bucket = getBucket(hash, bi);
        bucket->next = hash->free_list;
        hash->free_list = bi;
    }

    /* NULL out new space in table */
    memset((HashIndex *) hash->buffer.bufstart + hash->hash_size,
           NULLBucketIndex,
           (new_size - hash->hash_size) * sizeof(HASHBUCKET*));

    /* Warning: for efficiency, we cache the table in a local
     * variable. If any possibly gc-triggering code is added to the
     * following loop, this could become invalid. (Why would this
     * happen? Well, at the moment, two equivalent key strings with
     * different encodings will not map to the same hash value. This
     * is most probably a bug. But if you fix it by making key_hash
     * transcode to a canonical encoding, then you'll trigger GC.)
     * (And I'll probably forget to change this comment, but I think
     * I'm going to canonicalize key encodings on insertion.) */
    table = (BucketIndex*) hash->buffer.bufstart;

    /* Move buckets to new homes */
    for (hi = 0; hi < hash->hash_size; hi++) {
        BucketIndex* bucketIdxP = &table[hi];
        while (*bucketIdxP != NULLBucketIndex) {
            BucketIndex bucketIdx = *bucketIdxP;
            bucket = getBucket(hash, bucketIdx);
            if ((key_hash(interpreter, bucket->key) % new_size) != hi) {
                /* Remove from table */
                *bucketIdxP = bucket->next;

                /* Add to new spot in table */
                bucket->next = table[hi + hash->hash_size];
                table[hi + hash->hash_size] = bucketIdx;
            }
            else {
                bucketIdxP = &bucket->next;
            }
        }
    }

    hash->hash_size = new_size;
}

UINTVAL
new_bucket(Interp *interpreter, HASH *hash, STRING *key, KEY_ATOM *value)
{
    UINTVAL bucket_index;
    
    if (key == NULL) {
        internal_exception(INTERNAL_PANIC, "NULL key\n");
        return NULL;
    }

    if (value == NULL) {
        internal_exception(INTERNAL_PANIC, "NULL value\n");
        return NULL;
    }

    bucket_index = hash->free_list;
    if (bucket_index != NULLBucketIndex) {
        HASHBUCKET *bucket = getBucket(hash, bucket_index);
        
        hash->free_list = bucket->next;
        bucket->key = key;
        memcpy(&bucket->value, value, sizeof(*value));
        return bucket_index;
    }

    /* Free list is empty. Need to expand the hashtable. */
    expand_hash(interpreter, hash);
    return new_bucket(interpreter, hash, key, value);
}

static HASHBUCKET *
find_bucket(Interp *interpreter, HASH* hash, BucketIndex head, STRING *key)
{
    if (head == NULLBucketIndex) return NULL;

    if (key != NULL) {
        HASHBUCKET* bucket = getBucket(hash, head);
        while (bucket != NULL) {
            if (string_compare(interpreter, key, bucket->key) == 0) {
                return bucket;
            }
            bucket = getBucket(hash, bucket->next);
        }
    }
    else {
        fprintf(stderr, "*** find_bucket given a null key\n");
    }

    return NULL;
}

HASH *
new_hash(Interp *interpreter)
{
    HASH *hash = (HASH *)new_bufferlike_header(interpreter, sizeof(*hash));
    /*      hash->buffer.flags |= BUFFER_report_FLAG; */
    hash->hash_size = 0;
    hash->entries = 0;
    hash->bucket_pool = new_buffer_header(interpreter);
    /*      hash->bucket_pool->flags |= BUFFER_report_FLAG; */
    hash->free_list = NULLBucketIndex;
    expand_hash(interpreter, hash);
    return hash;
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
        fprintf(stderr, "*** hash_size asked to check a NULL hash\n");
        return 0;
    }
}

static HASHBUCKET *
hash_lookup(Interp *interpreter, HASH *hash, STRING *key)
{
    UINTVAL hashval = key_hash(interpreter, key);
    HashIndex* table = (HashIndex*) hash->buffer.bufstart;
    BucketIndex chain = table[hashval % hash->hash_size];
    return find_bucket(interpreter, hash, chain, key);
}

KEY_ATOM *
hash_get(Interp *interpreter, HASH *hash, STRING *key)
{
    HASHBUCKET* bucket = hash_lookup(interpreter, hash, key);
    if (bucket == NULL) return NULL; /* Not found */
    return &bucket->value;
}

/* The key is *not* copied. */
void
hash_put(Interp *interpreter, HASH *hash, STRING *key, KEY_ATOM *value)
{
    BucketIndex* table;
    UINTVAL hashval;
    UINTVAL bucket_index; 
    BucketIndex chain;
    HASHBUCKET* bucket;

    /*      dump_hash(interpreter, hash); */

    hashval = key_hash(interpreter, key);
    table = (BucketIndex*) hash->buffer.bufstart;
    chain = table ? table[hashval % hash->hash_size] : NULLBucketIndex;
    bucket = find_bucket(interpreter, hash, chain, key);

    /*      fprintf(stderr, "HASH=%p buckets=%p chain=%p bucket=%p KEY=%s\n", */
    /*              hash, hash->buffer.bufstart, chain, bucket, string_to_cstring(interpreter, key)); */

    if (bucket) {
        /* Replacing old value */
        memcpy(&bucket->value, value, sizeof(KEY_ATOM));
    }
    else {
        /* Create new bucket */
        hash->entries++;
        bucket_index = new_bucket(interpreter, hash, key, value);
        bucket = getBucket(hash, bucket_index);
        table = (BucketIndex*) hash->buffer.bufstart;
        bucket->next = table[hashval % hash->hash_size];
        table[hashval % hash->hash_size] = bucket_index;
    }
    /*      dump_hash(interpreter, hash); */
}

void
hash_delete(Interp *interpreter, HASH *hash, STRING *key)
{
    UINTVAL hashval;
    HashIndex slot;
    HASHBUCKET* bucket;
    HASHBUCKET* prev = NULL;

    hashval = key_hash(interpreter, key);
    slot = hashval % hash->hash_size;

    for (bucket = lookupBucket(hash, slot);
         bucket != NULL;
         bucket = getBucket(hash, bucket->next))
    {
        if (string_compare(interpreter, key, bucket->key) == 0) {
            if (prev)
                prev->next = bucket->next;
            else {
                BucketIndex* table = (BucketIndex*) hash->buffer.bufstart;
                table[slot] = bucket->next;
            }
            hash->entries--;
            return;
        }
        prev = bucket;
    }

    fprintf(stderr, "*** hash_delete given nonexistent key\n");
}

HASH *
hash_clone(struct Parrot_Interp * interp, HASH * hash) {
    HASH * ret = new_hash(interp);
    BucketIndex* table = (BucketIndex*) hash->buffer.bufstart;
    BucketIndex i;
    for (i = 0; i < hash->hash_size; i++) {
        HASHBUCKET * b = lookupBucket(hash, i);
        while (b) {
            /* XXX: does b->key need to be copied? */
            hash_put(interp, ret, b->key, &(b->value));
            b = getBucket(hash, b->next);
        }
    }
    return ret;
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
