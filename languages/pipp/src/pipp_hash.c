/*
Copyright (C) 2008 The Perl Foundation.
$Id$

=head1 NAME

languages/pipp/src/pipp_hash.c - core functions and data structs for the
PHPArray PMC

=head1 DESCRIPTION

A hashtable contains an array of bucket indexes. Buckets are nodes in a
linked list, each containing a C<void *> key and value. During hash
creation, the type of the value can be set.  All keys are stored as STRINGs.

=head2 Initialization and Finalization Functions

=over 4

=cut

*/

#include "pipp_hash.h"

/*

=item C<PippHashTable* pipp_hash_create(PARROT_INTERP, UINTVAL size)>

Create and initialize a new PippHash with at least C<size> buckets.

=cut

*/


PippHashTable* pipp_hash_create(PARROT_INTERP, UINTVAL size) {
    UINTVAL        real_size;
    PippHashTable *ht;

    dprintf("pipp_hash_create called with size = %d\n", size);
    real_size = size;
    NEXT_POW_2(real_size);

    ht = mem_allocate_zeroed_typed(PippHashTable);

    ht->buckets = mem_allocate_n_zeroed_typed(real_size, PippBucket*);
    ht->capacity = real_size;
    ht->hashMask = real_size - 1;
    ht->elementCount = 0;
    ht->nextIndex = 0;
    ht->tableHead = NULL;
    ht->tableTail = NULL;

    return ht;
}

/*

=item C<void pipp_hash_destroy(PARROT_INTERP, PippHashTable *ht)>

Non-recursively free all memory used by this PippHash.

=cut

*/

void pipp_hash_destroy(PARROT_INTERP, PippHashTable *ht) {

   pipp_hash_empty(interp, ht);
   mem_sys_free(ht->buckets);
   mem_sys_free(ht);
}

/*

=item C<void pipp_hash_empty(PARROT_INTERP, PippHashTable *ht)>

Delete all items from this PippHash, leaving the size unchanged.

=cut

*/

void pipp_hash_empty(PARROT_INTERP, PippHashTable *ht) {
   PippBucket *b1, *b2;

   b1 = ht->tableHead;
   while (b1 != NULL) {
       b2 = b1;
       b1 = b1->tableNext;
       mem_sys_free(b2);
   }
   memset(ht->buckets, '\0', ht->capacity);
   ht->tableHead = NULL;
   ht->tableTail = NULL;
   ht->elementCount = 0;
   ht->nextIndex = 0;
}

/*

=back

=head2 Debugging Functions

=over 4

=item C<void pipp_hash_sanity_check(PARROT_INTERP, PippHashTable *ht)>

Iterate through the PippHash, making sure that everything's sane.  This
function is intended only for internal debugging.  If anything's goofy, an
exception with a descriptive message is thrown.

=cut

*/

void pipp_hash_sanity_check(PARROT_INTERP, PippHashTable *ht) {
    UINTVAL     count_tbl_fw, count_tbl_bk, count_bkt_ord, element_count, i,
                expected_bucket, ip_pos;
    INTVAL      max_index, expected_next_index;
    PippBucket *curr_bkt, *cmp_bkt;
    STRING     *curr_key;
    PippIsInt  *isInt;

    element_count = ht->elementCount;

    /* Check that ht->buckets points to a valid location. */
    dprintf("  ****SANITY CHECK****\n");
    if (ht->buckets == NULL && ht->capacity != 0)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: buckets is null in a non-0 capacity hash");

    /* Check that capacity < elementCount and that elementCount is accurate. */
    if (ht->capacity <= ht->elementCount && ht->elementCount)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: element count (%d) >= capacity (%d)",
                ht->elementCount, ht->capacity);

    /* Iterate by bucket order. */
    dprintf("checking element count and hash/bucket consistency by bucket order...\n");
    count_bkt_ord = 0;
    for (i = 0; i < ht->capacity; i++) {
        dprintf("starting bucket #%d\n", i);
        curr_bkt = ht->buckets[i];
        while (curr_bkt) {
            dprintf("bucket #%d has a pair mapping '%Ss'=>'%Ss'\n", i,
                    curr_bkt->key, VTABLE_get_string(interp, curr_bkt->value));
            dprintf("next bucket from 0x%X lives at 0x%X\n", curr_bkt, curr_bkt->bucketNext);
            if (curr_bkt == curr_bkt->bucketNext)
                Parrot_ex_throw_from_c_args(interp, NULL, -1,
                        "PHPArray corruption: curr_bkt == curr_bkt->bucketNext");
            expected_bucket = curr_bkt->hashValue & ht->hashMask;
            if (i != expected_bucket)
                Parrot_ex_throw_from_c_args(interp, NULL, -1,
                        "PHPArray corruption: Bucket in list #%d should be in "
                        "list #%d.", i, expected_bucket);
            curr_bkt = curr_bkt->bucketNext;
            count_bkt_ord++;
        }
        dprintf("done with bucket #%d\n", i);
    }

    if (count_bkt_ord != element_count)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: Bucket order count (%d) is different from"
                " ht->elementCount (%d).", count_bkt_ord, element_count);

    /* Iterate through the table forward and backwards. */
    dprintf("checking element count by table order (forwards)...\n");
    curr_bkt = ht->tableHead;
    count_tbl_fw = 0;
    while (element_count && curr_bkt != NULL) {
        dprintf("found pair mapping '%Ss' => '%Ss'\n", curr_bkt->key,
                VTABLE_get_string(interp, curr_bkt->value));
        count_tbl_fw++;
        if (curr_bkt == curr_bkt->tableNext)
            Parrot_ex_throw_from_c_args(interp, NULL, -1,
                    "PHPArray corruption: curr_bkt == curr_bkt->tableNext");

        curr_bkt = curr_bkt->tableNext;
    }

    dprintf("checking element count by table order (backwards)...\n");
    curr_bkt = ht->tableTail;
    count_tbl_bk = 0;
    while (element_count && (curr_bkt != NULL)) {
        dprintf("found pair mapping '%Ss' => '%Ss'\n", curr_bkt->key,
                VTABLE_get_string(interp, curr_bkt->value));
        if (curr_bkt == curr_bkt->tablePrev)
            Parrot_ex_throw_from_c_args(interp, NULL, -1,
                    "PHPArray corruption: curr_bkt == curr_bkt->tablePrev");
        count_tbl_bk++;
        curr_bkt = curr_bkt->tablePrev;
    }

    if (count_tbl_fw != count_tbl_bk)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: Backwards table order count "
                "(%d) is different from forward table order count (%d).",
                count_tbl_bk, count_tbl_fw);
    if (count_tbl_fw != element_count)
        Parrot_ex_throw_from_c_args(interp, NULL, -1,
                "PHPArray corruption: Table order count (%d) is different "
                "from ht->elementCount (%d).", count_tbl_fw, element_count);

    /* Make sure buckets with keyIsInt are sane. */
    dprintf("Checking that cached keyInt values and nextIndex are consistent...\n");
    curr_bkt = ht->tableHead;
    max_index = -1;
    while (element_count && (curr_bkt = curr_bkt->tableNext)) {
        isInt = pipp_hash_get_intval(interp, curr_bkt->key);
        if (isInt->isInt != curr_bkt->keyIsInt)
            Parrot_ex_throw_from_c_args(interp, NULL, -1, "PHPArray corruption: "
                    "A key is confused about if it's an int.");
        if (curr_bkt->keyIsInt && curr_bkt->keyInt != isInt->intval)
            Parrot_ex_throw_from_c_args(interp, NULL, -1, "PHPArray corruption: "
                    "An int key ('%Ss') has an incorrect value (%d != %d) cached.",
                    curr_bkt->key, curr_bkt->keyInt, isInt->intval);
        if (isInt->isInt && isInt->intval > max_index)
            max_index = isInt->intval;
    }
        /* nextIndex doesn't change when an element is deleted, so it's not
         * possible to predict exactly what it should be for a known set of
         * indicies. */
    if (ht->nextIndex < max_index+1)
        Parrot_ex_throw_from_c_args(interp, NULL, -1, "PHPArray corruption: "
                "ht->nextIndex is %d but shouldn't be less than %d.", ht->nextIndex,
                max_index+1);
    dprintf("ht->nextIndex is %d, which looks plausible\n", ht->nextIndex);


    /*Look for duplicate keys using a exhaustive n^2 algorithm.  Performance
     * isn't a big concern, since this code won't be called very often.  */
    dprintf("looking for duplicate keys...\n");
    if (ht->elementCount) {
        curr_bkt = ht->tableHead;
        while (curr_bkt != ht->tableTail) {
            curr_key = curr_bkt->key;
            cmp_bkt = curr_bkt->tableNext;
            while (cmp_bkt != NULL) {
                if (!string_compare(interp, curr_key, cmp_bkt->key))
                    Parrot_ex_throw_from_c_args(interp, NULL, -1,
                            "PHPArray corruption: PHPArray contains duplicate keys.");
                cmp_bkt = cmp_bkt->tableNext;
            }
            curr_bkt = curr_bkt->tableNext;
        }
    }

    /* check that internalPointer is sane */
    dprintf("checking that ht->internalPointer points to something in this PHPArray...\n");
    if (ht->internalPointer != NULL) {
        curr_bkt = ht->tableHead;
        ip_pos = 0;
        while (curr_bkt != NULL && curr_bkt != ht->internalPointer) {
            curr_bkt = curr_bkt->tableNext;
            ip_pos++;
        }
        if (curr_bkt != ht->internalPointer)
            Parrot_ex_throw_from_c_args(interp, NULL, -1,
                    "PHPArray corruption: ht->internalPointer doesn't point to "
                    "an element of this PHPArray.");
        dprintf("internalPointer points at position #%d (0 being the beginning)\n", ip_pos);
    }
    else
        dprintf("internalPointer is NULL, which is just fine\n");
    dprintf("  ****SANITY CHECK FINISHED****\n");
}

/*

=back

=head2 Miscellaneous Housekeeping Functions

=over 4

=item C<void pipp_hash_renumber(PARROT_INTERP, PippHashTable *ht)>

Renumber all numerically-indexed elements of this PippHash, starting from 0.
Numbering is done according to insertion order.

=cut

*/

void pipp_hash_renumber(PARROT_INTERP, PippHashTable *ht) {

    INTVAL curr_idx = 0;
    PippBucket *bkt;

    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        if (bkt->keyIsInt) {
            dprintf("renumbering from %d to %d\n", bkt->keyInt, curr_idx);
            bkt->key    = string_from_int(interp, curr_idx);
            bkt->keyInt = curr_idx;
            curr_idx++;
        }
    }
    ht->nextIndex = curr_idx;

    /* If any indicies have changed, we need to rehash. */
    if (curr_idx)
        pipp_hash_rehash(interp, ht);
}

/*

=item C<void pipp_hash_rehash(PARROT_INTERP, PippHashTable *ht)>

Recalculate the hash of each element, potentially placing it in another bucket.
This is used when a PippHash grows and has its hashMask changed.

=cut

*/

void pipp_hash_rehash(PARROT_INTERP, PippHashTable *ht) {

    UINTVAL bucket_idx;
    PippBucket *bkt;

    for (bucket_idx = 0; bucket_idx < ht->capacity; bucket_idx++)
        ht->buckets[bucket_idx] = NULL;
    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        bucket_idx = bkt->hashValue & ht->hashMask;
        dprintf("putting item with key '%Ss' in bucket #%d\n", bkt->key,
                bucket_idx);
        BUCKET_LIST_PREPEND(bkt, ht->buckets[bucket_idx]);
    }
}


/*

=item C<void pipp_hash_resize(PARROT_INTERP, PippHashTable *ht, INTVAL new_size)>

Increase the capacity and number of buckets of this PippHash.  Resizing implies
rehashing.

=cut

*/

void pipp_hash_resize(PARROT_INTERP, PippHashTable *ht, INTVAL new_size) {

    NEXT_POW_2(new_size);
    ht->capacity = new_size;
    ht->buckets  = mem_allocate_n_zeroed_typed(new_size, PippBucket*);
    ht->hashMask = new_size - 1;
    pipp_hash_rehash(interp, ht);
}

/*

=back

=head2 Hash Manipulation Functions

=over 4

=item C<PippBucket* pipp_hash_get_bucket(PARROT_INTERP, PippHashTable *ht, STRING *key)>

If there is a bucket with a the key C<key>, return a pointer to it.  Otherwise
return NULL.

=cut

*/

PippBucket* pipp_hash_get_bucket(PARROT_INTERP, PippHashTable *ht, STRING *key){
    INTVAL key_hash, bucket_idx;
    PippBucket *bucket;

    key_hash = string_hash(interp, key);
    bucket   = ht->buckets[key_hash & ht->hashMask];
    dprintf("pipp_hash_get_bucket called with key '%Ss', has hash 0x%X\n",
            key, key_hash);

    while (bucket != NULL && string_compare(interp, bucket->key, key))
        bucket = bucket->bucketNext;
    if (bucket) {
        dprintf("found bucket with key '%Ss'\n", bucket->key);
        return bucket;
    }
    dprintf("bucket not found\n");
    return NULL;
}

/*

=item C<PMC* pipp_hash_get(PARROT_INTERP, PippHashTable *ht, STRING *key)>

If there is a bucket with a the key C<key>, return the value of that bucket.
Otherwise return NULL.

=cut

*/

PMC* pipp_hash_get(PARROT_INTERP, PippHashTable *ht, STRING *key) {
    PippBucket *bucket;

    dprintf("pipp_hash_get called with key '%Ss'\n", key);
    bucket = pipp_hash_get_bucket(interp, ht, key);
    if (bucket)
        return bucket->value;
    dprintf("pipp_hash_get is returning null\n");
    return PMCNULL;
}

/*

=item C<PippBucket* pipp_hash_put(PARROT_INTERP, PippHashTable *ht, STRING *key, PMC *p_val)>

Store C<p_val>, indexed by C<key>, in the hash.  Return the bucket where
C<p_val> was stored.

=cut

*/

PippBucket* pipp_hash_put(PARROT_INTERP, PippHashTable *ht, STRING *key, PMC *p_val) {
    PippIsInt  *isInt;
    PippBucket *first_bucket, *curr_bucket;
    INTVAL      key_hash, bucket_idx;

    key_hash     = string_hash(interp, key);
    bucket_idx   = key_hash & ht->hashMask;
    curr_bucket  = ht->buckets[bucket_idx];
    first_bucket = curr_bucket;
    isInt        = pipp_hash_get_intval(interp, key);

    if (PMC_IS_NULL(p_val)) {
        dprintf("pipp_hash_put called: key is '%Ss', p_val is null, hash is "
                "0x%X\n", key, key_hash);
    }
    else {
        dprintf("pipp_hash_put called: key is '%Ss', p_val stringifies to "
                "'%Ss', hash is 0x%X\n", key, VTABLE_get_string(interp, p_val),
                key_hash);
    }

    /* Find the right bucket for the key. */
    while (curr_bucket != NULL &&
           string_compare(interp, curr_bucket->key, key)) {
        dprintf("looking for the right bucket: '%Ss' != '%Ss'\n", curr_bucket->key, key);
        curr_bucket = curr_bucket->bucketNext;
    }

    /* If buckets[i] is empty or the key isn't there, make a new bucket. */
    if (curr_bucket == NULL) {

        dprintf("storing value in a new bucket with hash %X\n", key_hash);
        first_bucket = mem_allocate_zeroed_typed(PippBucket);

        first_bucket->key       = key;
        first_bucket->value     = p_val;
        first_bucket->hashValue = key_hash;
        first_bucket->keyIsInt  = isInt->isInt;

        if (first_bucket->keyIsInt)
            first_bucket->keyInt = isInt->intval;

        BUCKET_LIST_PREPEND(first_bucket, ht->buckets[bucket_idx]);
        TABLE_LIST_APPEND(first_bucket, ht);
        curr_bucket = first_bucket;
        ht->elementCount++;

        if (ht->capacity <= ht->elementCount+1) {
            dprintf("time to grow...\n");
            pipp_hash_resize(interp, ht, ht->capacity * 2);
        }
    }
    /* Otherwise replace the contents of an existing bucket. */
    else {
        dprintf("overwriting old value (%Ss) in an existing bucket with hash %X\n",
                VTABLE_get_string(interp, curr_bucket->value), key_hash);
        curr_bucket->key       = key;
        curr_bucket->value     = p_val;
        curr_bucket->hashValue = key_hash;
        curr_bucket->keyIsInt  = isInt->isInt;

        if (curr_bucket->keyIsInt)
            curr_bucket->keyInt = isInt->intval;
    }

    if (isInt->isInt && isInt->intval >= ht->nextIndex)
        ht->nextIndex = isInt->intval + 1;

    mem_sys_free(isInt);
    return curr_bucket;
}

/*

=item C<PippBucket* pipp_hash_find(PARROT_INTERP, PippHashTable *ht, STRING *key)>

If there is a bucket with a the key C<key>, return 1.  Otherwise return 0.

=cut

*/

INTVAL pipp_hash_find(PARROT_INTERP, PippHashTable *ht, STRING *key){
    return pipp_hash_get_bucket(interp, ht, key) != NULL;
}

/*

=item C<void pipp_hash_delete(PARROT_INTERP, PippHashTable *ht, STRING *key)>

If there's a bucket in this hash with the key C<key>, it is deleted.  If
there's no matching bucket, nothing happens.

=cut

*/

void pipp_hash_delete(PARROT_INTERP, PippHashTable *ht, STRING *key){
    PippBucket *b;
    INTVAL      bucket_idx;

    b = pipp_hash_get_bucket(interp, ht, key);

    if (b != NULL) {
        bucket_idx = ht->hashMask & b->hashValue;
        TABLE_LIST_DELETE(b, ht);
        BUCKET_LIST_DELETE(b, ht->buckets[bucket_idx]);
        mem_sys_free(b);
        ht->elementCount--;
    }
}

/*

=back

=head2 Deque Functions

=over 4

=item C<PippBucket* pipp_hash_push(PARROT_INTERP, PippHashTable *ht, PMC *p_val)>

Append a bucket with C<p_val> to the PippHash.  Its index will be determined by
the value of ht->nextIndex.  Pushing onto a PippHash does *not* affect
internalPointer.

=cut

*/

PippBucket* pipp_hash_push(PARROT_INTERP, PippHashTable *ht, PMC *p_val){
    STRING     *s_key;
    PippBucket *bkt;
    INTVAL      key_hash, bucket_idx;

    if (ht->capacity <= ht->elementCount+1) {
        dprintf("time to grow...\n");
        pipp_hash_resize(interp, ht, ht->capacity * 2);
    }

    s_key    = string_from_int(interp, ht->nextIndex);
    key_hash = string_hash(interp, s_key);
    bkt      = mem_allocate_zeroed_typed(PippBucket);

    bkt->key       = s_key;
    bkt->value     = p_val;
    bkt->hashValue = key_hash;
    bkt->keyIsInt  = 1;
    bkt->keyInt    = ht->nextIndex;

    bucket_idx = bkt->hashValue & ht->hashMask;

    BUCKET_LIST_PREPEND(bkt, ht->buckets[bucket_idx]);
    TABLE_LIST_APPEND(bkt, ht);
    ht->elementCount++;
    ht->nextIndex++;
    dprintf("pushed a value: key is '%Ss', keyInt is %d, hash is 0x%X\n",
            s_key, bkt->keyInt, key_hash)

    return bkt;
}

/*

=item C<PMC* pipp_hash_pop(PARROT_INTERP, PippHashTable *ht)>

Delete the element at the end of this hash, returning its value.  Popping from
a PippHash also resets internalPointer to point at the first element of the
array.

=cut

*/

PMC* pipp_hash_pop(PARROT_INTERP, PippHashTable *ht) {
    INTVAL bl_hash, bucket_idx;
    PippBucket *bucket;
    PMC        *p_val;

    if (ht->elementCount == 0)
        return PMCNULL;

    bucket  = ht->tableTail;
    p_val   = bucket->value;
    bl_hash = bucket->hashValue & ht->hashMask;

    TABLE_LIST_DELETE(bucket, ht);
    BUCKET_LIST_DELETE(bucket, ht->buckets[bl_hash]);
    mem_sys_free(bucket);
    ht->elementCount--;
    ht->internalPointer = ht->tableHead;

    return p_val;
}

/*

=item C<PippBucket* pipp_hash_unshift(PARROT_INTERP, PippHashTable *ht, PMC *p_val)>

Prepend a bucket with C<p_val> to the PippHash.  Its index will be 0 and all
other numerically indexed elements will be renumbered according to insertion
order.  Unshifting also points internalPointer at the first element.

=cut

*/

PippBucket* pipp_hash_unshift(PARROT_INTERP, PippHashTable *ht, PMC *p_val){
    STRING     *s_key;
    PippBucket *bkt;
    INTVAL      key_hash, bucket_idx;

    if (ht->capacity <= ht->elementCount+1) {
        dprintf("time to grow...\n");
        pipp_hash_resize(interp, ht, ht->capacity * 2);
    }

    s_key    = string_from_int(interp, 0);
    key_hash = string_hash(interp, s_key);
    bkt      = mem_allocate_zeroed_typed(PippBucket);

    bkt->key       = s_key;
    bkt->value     = p_val;
    bkt->hashValue = key_hash;
    bkt->keyIsInt  = 1;
    bkt->keyInt    = 0;

    bucket_idx = bkt->hashValue & ht->hashMask;

    BUCKET_LIST_PREPEND(bkt, ht->buckets[bucket_idx]);
    TABLE_LIST_PREPEND(bkt, ht);
    ht->elementCount++;
    pipp_hash_renumber(interp, ht);
    ht->internalPointer = ht->tableHead;
    dprintf("unshifted a value: key is '%Ss', keyInt is %d, hash is 0x%X\n",
            s_key, bkt->keyInt, key_hash)

    return bkt;
}

/*

=item C<PMC* pipp_hash_shift(PARROT_INTERP, PippHashTable *ht)>

Delete the element at the beginning of this hash, returning its value.  This
also resets internalPointer to point at the first element of the resulting
hash.

=cut

*/

PMC* pipp_hash_shift(PARROT_INTERP, PippHashTable *ht) {
    INTVAL bl_hash, bucket_idx;
    PippBucket *bucket;
    PMC        *p_val;

    if (ht->elementCount == 0)
        return PMCNULL;

    bucket  = ht->tableHead;
    p_val   = bucket->value;
    bl_hash = bucket->hashValue & ht->hashMask;

    TABLE_LIST_DELETE(bucket, ht);
    BUCKET_LIST_DELETE(bucket, ht->buckets[bl_hash]);
    mem_sys_free(bucket);
    ht->elementCount--;
    ht->internalPointer = ht->tableHead;

    return p_val;
}

/*

=back

=head2 Freeze/Thaw Helper Functions

=over 4

=item C<void pipp_hash_visit(PARROT_INTERP, PippHashTable *ht, visit_info *info)>

Dispatch a call to VTABLE_visit to the appropriate internal function.

=cut

*/

void pipp_hash_visit(PARROT_INTERP, PippHashTable *ht, visit_info *info) {
    switch (info->what) {
        case VISIT_THAW_NORMAL:
        case VISIT_THAW_CONSTANTS:
            dprintf("pipp_hash_visit is dispatching to pipp_hash_thaw\n");
            pipp_hash_thaw(interp, ht, info);
            break;
        case VISIT_FREEZE_NORMAL:
        case VISIT_FREEZE_AT_DESTRUCT:
            dprintf("pipp_hash_visit is dispatching to pipp_hash_freeze\n");
            pipp_hash_freeze(interp, ht, info);
            break;
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "unimplemented visit mode");
            break;
    }
}

/*

=item C<void pipp_hash_freeze(PARROT_INTERP, PippHashTable *ht, visit_info *info)>

Do most of the actual work of serializing this PippHash into C<info>.

=cut

*/

void pipp_hash_freeze(PARROT_INTERP, PippHashTable *ht, visit_info *info) {
    PippBucket *bkt;
    for (bkt = ht->tableHead; bkt != NULL; bkt = bkt->tableNext) {
        VTABLE_push_string(interp, info->image_io, bkt->key);
        (info->visit_pmc_now)(interp, bkt->value, info);
    }
}


/*

=item C<void pipp_hash_thaw(PARROT_INTERP, PippHashTable *ht, visit_info *info)>

Unserialize this PippHash into C<info>.

=cut

*/

void pipp_hash_thaw(PARROT_INTERP, PippHashTable *ht, visit_info *info) {
    UINTVAL     i, element_count;
    STRING     *s_key;
    IMAGE_IO   *io;
    PippBucket *bkt;

    io = info->image_io;
    element_count = ht->elementCount;

    for (i = 0; i < element_count; i++) {
        s_key = VTABLE_shift_string(interp, io);
        bkt = pipp_hash_put(interp, ht, s_key, PMCNULL);
        /* XXX: This is hackey.  Find a better way.  It may at some point in
         * the future be a good idea to use a more minimal version of
         * pipp_hash_put here, but that'd be a premature optimization at this
         * point.*/
        ht->elementCount--;
        info->thaw_ptr = &bkt->value;
        (info->visit_pmc_now)(interp, PMCNULL, info);
    }
}


/*

=back

=head2 Miscellaneous Helper Functions

=over 4

=item C<PippIsInt* pipp_hash_get_intval(PARROT_INTERP, STRING *key)>

If C<s> looks like an INTVAL (i.e. /^([-]?[1-9][0-9]|0)*$/) and doesn't cause an
overflow, return a PippIsInt where C<p->intval> contains the INTVAL and
C<p->isInt> is true.  Otherwise, return a PippIsInt where C<p->isInt> is false
and C<p->intval> is undefined.

=cut

*/

PippIsInt* pipp_hash_get_intval(PARROT_INTERP, STRING *key) {
    PippIsInt          *isInt;
    INTVAL              overflow_check;
    UINTVAL             key_len, curr_idx, curr_char, negate;
    PippIntParserState  state;

    isInt    = mem_allocate_zeroed_typed(PippIsInt);
    key_len  = string_length(interp, key);
    negate       = 0;
    curr_idx     = 0;
    isInt->isInt = 1;

    state = PIPS_START;
    /* This is basically equivalient to matching against /^([-]?[1-9][0-9]*|0)$/ */
    while (curr_idx < key_len) {
        curr_char = string_index(interp, key, curr_idx);
        switch (state) {
            case PIPS_START:
                if (curr_char == '-') {
                    negate = 1;
                    state  = PIPS_INT_CHAR;
                }
                else if (curr_char == '0' && key_len == 1) {
                    isInt->intval = 0;
                    isInt->isInt  = 1;
                    return isInt;
                }
                else if (curr_char >= '1' && curr_char <= '9') {
                    isInt->intval = curr_char - '0';
                    state         = PIPS_INT_CHAR;
                }
                else
                    state = PIPS_REJECT;
                break;

            case PIPS_INT_CHAR:
                if (curr_char >= '0' && curr_char <= '9') {
                    overflow_check  = isInt->intval;
                    overflow_check *= 10;
                    overflow_check += (curr_char - '0');
                    if (overflow_check > isInt->intval)
                        isInt->intval = overflow_check;
                    else
                        state = PIPS_REJECT;
                }
                else
                    state = PIPS_REJECT;
                break;

            case PIPS_ACCEPT:
                isInt->isInt = 1;
                return isInt;

            case PIPS_REJECT:
            default:
                isInt->isInt = 0;
                return isInt;

        }
        curr_idx++;
    }
    if (state == PIPS_REJECT) {
        isInt->isInt = 0;
        return isInt;
    }
    if (negate)
        isInt->intval = 0 - isInt->intval;
    return isInt;
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
