/* hash.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *     A hashtable contains an array of pointers to buckets. Buckets
 *     are nodes in a linked list, each containing a STRING key and
 *     a value. The value is currently stored as a KEY_ATOM, which
 *     maybe makes sense for some hashes but probably doesn't for what
 *     they're currently used for, which is PerlHashes (since those
 *     should probably just be hashes of STRINGs mapping to PMCs.)
 *
 *     To minimize memory overhead, buckets are carved out of a pool
 *     that is allocated normally by parrot's memory subsystem. That
 *     means that the pool can get moved around a lot. Which in turns
 *     means that any bucket pointers will be invalidated. The simple
 *     way to handle this would be to use integer indexes into the
 *     pool instead of pointers, but when I started coding that up, it
 *     made everything much messier. So instead, I use pointers but
 *     fixup all the pointers whenever necessary (either because the
 *     GC moved stuff, or because the hashtable was resized.) This is
 *     done in restore_invariants, which compares the current base
 *     address of the bucket pool to a stored value that indicates
 *     what all of the pointers are relative to, and traverses through
 *     the entire hash to fix them up. A side effect of this approach
 *     is that pointers to buckets can never be allowed to escape this
 *     module, but that shouldn't be allowed anyway.
 *
 *  History:
 *     Initial version by Jeff G. on 2001.12.05
 *     Substantially rewritten by Steve F.
 *  Notes:
 *     Future optimizations:
 *       - compute modulus by ANDing with num_buckets-1 (The compiler
 *         cannot know that num_buckets is always a power of 2.)
 *       - Stop reallocating the bucket pool, and instead add chunks on.
 *         (Saves pointer fixups and copying during realloc.)
 *       - Hash contraction (dunno if it's worth it)
 *  References:
 *     pdd08_keys.pod */

#include "parrot/parrot.h"

#define INITIAL_BUCKETS 16
#define MAXFULL_PERCENT 80

struct _hashbucket {
    STRING *key;
    KEY_ATOM value;
    HASHBUCKET *next;
};

struct _hash {
    Buffer buffer;              /* This struct is a Buffer subclass! */
    UINTVAL num_buckets;
    UINTVAL entries;            /* Number of values stored in hashtable */
    Buffer *bucket_pool;        /* Buffer full of buckets, used and unused */
    HASHBUCKET *free_list;
    HASHBUCKET *former_base;
};

/* This routine must be called at the beginning of all public entry
 * points. It adjusts the pointers in case the garbage collector has
 * moved things around. If it bothers you that this has to scan the
 * whole hashtable and so will slow things down tremendously, consider
 * this: that's what garbage collection does during DOD anyway! */
static void
restore_invariants(Interp *interpreter, HASH *hash)
{
    ptrdiff_t adjust;
    UINTVAL i;
    HASHBUCKET **table;
    HASHBUCKET *current_base = (HASHBUCKET *)hash->bucket_pool->bufstart;
    UINTVAL table_size;

    UNUSED(interpreter);

    if (current_base == NULL || current_base == hash->former_base)
        return;                 /* Nothing has moved, so we're good. */

    if (hash->former_base == NULL) {
        /* Moved from nowhere to somewhere, so no fixup needed */
        hash->former_base = current_base;
        return;
    }

/*      fprintf(stderr, "Moving hash %p buckets from %p -> %p\n", */
/*              hash, hash->former_base, current_base); */

    adjust = (char *)current_base - (char *)hash->former_base;

    /* Fix up the free list */
    if (hash->free_list)
        hash->free_list = (HASHBUCKET *)((char *)hash->free_list + adjust);

    /* Fix up the hashtable */
    table = (HASHBUCKET **)hash->buffer.bufstart;
    for (i = 0; i < hash->num_buckets; i++) {
        if (table[i])
            table[i] = (HASHBUCKET *)((char *)table[i] + adjust);
    }

    /* Fix up the buckets themselves. All buckets in the pool are
     * either on the free list or in a hash chain, and either way they
     * need to be adjusted. So there is no need to chase down all the
     * chains. */
    table_size = hash->bucket_pool->buflen / sizeof(HASHBUCKET);
    for (i = 0; i < table_size; i++) {
        if (current_base[i].next)
            current_base[i].next = (HASHBUCKET *)((char *)current_base[i].next
                                                  + adjust);
    }

    hash->former_base = current_base;
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
    UINTVAL i;
    HASHBUCKET **buckets = (HASHBUCKET **)hash->buffer.bufstart;
    fprintf(stderr, "Hashtable[" INTVAL_FMT "/" INTVAL_FMT "]\n",
            hash->entries, hash->num_buckets);
    for (i = 0; i <= hash->num_buckets; i++) {
        HASHBUCKET *bucket;
        if (i == hash->num_buckets)
            bucket = hash->free_list;
        else
            bucket = buckets[i];
        if (bucket == NULL)
            continue;
        fprintf(stderr, "  Bucket " INTVAL_FMT ": ", i);
        while (bucket) {
            fprintf(stderr, "type(%d)", bucket->value.type);
            bucket = bucket->next;
            if (bucket)
                fprintf(stderr, " -> ");
        }
        fprintf(stderr, "\n");
    }
}

PMC *
mark_hash(Interp *interpreter, HASH *hash, PMC *end_of_used_list)
{
    UINTVAL i;
    HASHBUCKET **buckets = (HASHBUCKET **)hash->buffer.bufstart;

    restore_invariants(interpreter, hash);

    buffer_lives((Buffer *)hash);
    buffer_lives(hash->bucket_pool);
    for (i = 0; i < hash->num_buckets; i++) {
        HASHBUCKET *bucket = buckets[i];
        while (bucket) {
            buffer_lives((Buffer *)bucket->key);
            if (bucket->value.type == enum_key_string)
                buffer_lives((Buffer *)bucket->value.val.string_val);
            else if (bucket->value.type == enum_key_pmc)
                end_of_used_list = mark_used(bucket->value.val.pmc_val,
                                             end_of_used_list);
            bucket = bucket->next;
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
 *    bucket_index = hash(key) % num_buckets
 * so when doubling the size of the hashtable, we know that every key
 * is either already in the correct bucket, or belongs in the current
 * bucket plus num_buckets (the old num_buckets). In fact, because the
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
    HASHBUCKET **table;
    HASHBUCKET *bucket;
    UINTVAL new_size = (hash->num_buckets ? hash->num_buckets * 2
                        : INITIAL_BUCKETS);
    UINTVAL i;
    UINTVAL old_pool_size = hash->bucket_pool->buflen / sizeof(HASHBUCKET);
    UINTVAL new_pool_size = new_size * MAXFULL_PERCENT / 100;

    Parrot_reallocate(interpreter, hash, new_size * sizeof(HASHBUCKET *));
    Parrot_reallocate(interpreter, hash->bucket_pool,
                      new_pool_size * sizeof(HASHBUCKET));
    restore_invariants(interpreter, hash);      /* Bucket pool may have moved */

    /* Add the newly allocated buckets onto the free list */
    for (i = old_pool_size; i < new_pool_size; i++) {
        bucket = &((HASHBUCKET *)hash->bucket_pool->bufstart)[i];
        bucket->next = hash->free_list;
        hash->free_list = bucket;
    }

    table = (HASHBUCKET **)hash->buffer.bufstart;

    /* NULL out new space in table */
    memset(table + hash->num_buckets, 0,
           (new_size - hash->num_buckets) * sizeof(HASHBUCKET *));

    /* Move buckets to new homes */
    for (i = 0; i < hash->num_buckets; i++) {
        HASHBUCKET **bucketP = &table[i];
        while (*bucketP != NULL) {
            bucket = *bucketP;
            if ((key_hash(interpreter, bucket->key) % new_size) != i) {
                /* Remove from table */
                *bucketP = bucket->next;

                /* Add to new spot in table */
                bucket->next = table[i + hash->num_buckets];
                table[i + hash->num_buckets] = bucket;
            }
            else {
                bucketP = &bucket->next;
            }
        }
    }

    hash->num_buckets = new_size;
}

static HASHBUCKET *
new_bucket(Interp *interpreter, HASH *hash, STRING *key, KEY_ATOM *value)
{
    if (key == NULL) {
        internal_exception(INTERNAL_PANIC, "NULL key\n");
        return NULL;
    }

    if (value == NULL) {
        internal_exception(INTERNAL_PANIC, "NULL value\n");
        return NULL;
    }

    if (hash->free_list != NULL) {
        HASHBUCKET *bucket = hash->free_list;
        hash->free_list = bucket->next;
        bucket->key = key;
        memcpy(&bucket->value, value, sizeof(*value));
        return bucket;
    }

    /* Free list is empty. Need to expand the hashtable. */
    expand_hash(interpreter, hash);
    return new_bucket(interpreter, hash, key, value);
}

static HASHBUCKET *
find_bucket(Interp *interpreter, HASHBUCKET *head, STRING *key)
{
    if (head != NULL) {
        if (key != NULL) {
            while (head != NULL) {
                if (string_compare(interpreter, key, head->key) == 0) {
                    return head;
                }
                head = head->next;
            }
        }
        else {
            fprintf(stderr, "*** find_bucket given a null key\n");
        }
    }
    return NULL;
}

HASH *
new_hash(Interp *interpreter)
{
    HASH *hash = (HASH *)new_tracked_header(interpreter, sizeof(*hash));
/*      hash->buffer.flags |= BUFFER_report_FLAG; */
    hash->num_buckets = 0;
    hash->entries = 0;
    hash->bucket_pool = new_buffer_header(interpreter);
/*      hash->bucket_pool->flags |= BUFFER_report_FLAG; */
    hash->free_list = NULL;
    hash->former_base = NULL;
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
    HASHBUCKET **table = (HASHBUCKET **)hash->buffer.bufstart;
    UINTVAL hashval = key_hash(interpreter, key);
    HASHBUCKET *chain = table[hashval % hash->num_buckets];
    return find_bucket(interpreter, chain, key);
}

KEY_ATOM *
hash_get(Interp *interpreter, HASH *hash, STRING *key)
{
    HASHBUCKET *bucket;
    restore_invariants(interpreter, hash);
    bucket = hash_lookup(interpreter, hash, key);
    if (bucket == NULL)
        return NULL;            /* Not found */
    return &bucket->value;
}

/* The key is *not* copied. */
void
hash_put(Interp *interpreter, HASH *hash, STRING *key, KEY_ATOM *value)
{
    HASHBUCKET **table;
    UINTVAL hashval;
    HASHBUCKET *chain;
    HASHBUCKET *bucket;

    restore_invariants(interpreter, hash);
/*      dump_hash(interpreter, hash); */

    table = (HASHBUCKET **)hash->buffer.bufstart;
    hashval = key_hash(interpreter, key);
    chain = table ? table[hashval % hash->num_buckets] : NULL;
    bucket = find_bucket(interpreter, chain, key);

/*      fprintf(stderr, "HASH=%p buckets=%p chain=%p bucket=%p KEY=%s\n", */
/*              hash, hash->buffer.bufstart, chain, bucket, string_to_cstring(interpreter, key)); */

    if (bucket) {
        /* Replacing old value */
        memcpy(&bucket->value, value, sizeof(KEY_ATOM));
    }
    else {
        /* Create new bucket */
        hash->entries++;
        bucket = new_bucket(interpreter, hash, key, value);
        table = (HASHBUCKET **)hash->buffer.bufstart;
        bucket->next = table[hashval % hash->num_buckets];
        table[hashval % hash->num_buckets] = bucket;
    }
/*      dump_hash(interpreter, hash); */
}

void
hash_delete(Interp *interpreter, HASH *hash, STRING *key)
{
    HASHBUCKET **table;
    UINTVAL hashval;
    HASHBUCKET *chain;
    HASHBUCKET *bucket;
    HASHBUCKET *prev = NULL;

    restore_invariants(interpreter, hash);

    table = (HASHBUCKET **)hash->buffer.bufstart;
    hashval = key_hash(interpreter, key);
    chain = table[hashval % hash->num_buckets];

    for (bucket = chain; bucket != NULL; bucket = bucket->next) {
        if (string_compare(interpreter, key, bucket->key) == 0) {
            if (prev)
                prev->next = bucket->next;
            else
                table[hashval % hash->num_buckets] = bucket->next;
            hash->entries--;
            return;
        }
        prev = bucket;
    }

    fprintf(stderr, "*** hash_delete given nonexistent key\n");
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
