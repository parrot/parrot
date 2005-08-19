/*
Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/hash.c - Hash table

=head1 DESCRIPTION

A hashtable contains an array of bucket indexes. Buckets are nodes in a
linked list, each containing a C<void *> key and value. During hash
creation the types of key and value as well as appropriate compare and
hashing functions can be set.

This hash implementation uses just one piece of malloced memory. The
C<< hash->bu >> union points into this regions. At positive indices are
bucket pointers, at negative indices is the bucket store itself.

This hash doesn't move during GC, therefore a lot of the old caveats
don't apply.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

#define INITIAL_BUCKETS 16

#define N_BUCKETS(n) ((n) - (n)/4)
#define HASH_ALLOC_SIZE(n) ( N_BUCKETS(n) * sizeof(HashBucket) + \
                             (n) * sizeof(HashBucket *))


/*

=item C<static size_t
key_hash_STRING(Interp *interpreter, void *value, size_t seed)>

Return the hashed value of the key C<value>.

=cut

*/

/* see also string.c */

static size_t
key_hash_STRING(Interp *interpreter, void *value, size_t seed)
{
    STRING *s = value;

    if (s->hashval) {
        return s->hashval;
    }

    return string_hash(interpreter, s, seed);
}

/*

=item C<static int
STRING_compare(Parrot_Interp interp, void *a, void *b)>

Compares the two strings, return 0 if they are identical.

C<a> is the search key, C<b> is the bucket key.

=cut

*/

static int
STRING_compare(Parrot_Interp interp, void *a, void *b)
{
    return string_equal(interp, (STRING *)a, (STRING *) b);
}

/*

=item C<static size_t
key_hash_cstring(Interp *interpreter, void *value, size_t seed)>

=cut

*/

static size_t
key_hash_cstring(Interp *interpreter, void *value, size_t seed)
{
    register size_t h = seed;
    unsigned char * p = (unsigned char *) value;
    while (*p) {
        h += h << 5;
        h += *p++;
    }
    return h;
}

/*

=item C<static int
cstring_compare(Parrot_Interp interp, void *a, void *b)>

C string versions of the C<key_hash> and C<compare> functions.

=cut

*/

static int
cstring_compare(Parrot_Interp interp, void *a, void *b)
{
    UNUSED(interp);
    return strcmp(a, b);
}

/*

=item C<static size_t
key_hash_int(Interp *interp, void *value, size_t seed)>

=item C<static int
int_compare(Parrot_Interp interp, void *a, void *b)>

Custom C<key_hash> and C<compare> functions.

=cut

*/

static size_t
key_hash_int(Interp *interp, void *value, size_t seed)
{
    UNUSED(interp);
    return (size_t)value ^ seed;
}

static int
int_compare(Parrot_Interp interp, void *a, void *b)
{
    UNUSED(interp);
    return a != b;
}

static void
pobject_lives_fn(Interp *interp, PObj *o)
{
    pobject_lives(interp, o);
}

/*

=item C<void
dump_hash(Interp *interpreter, Hash *hash)>

Print out the hash in human-readable form.

=cut

*/

void
dump_hash(Interp *interpreter, Hash *hash)
{
}

/*

=item C<void
mark_hash(Interp *interpreter, Hash *hash)>

Marks the hash and its contents as live.

=cut

*/

void
mark_hash(Interp *interpreter, Hash *hash)
{
    UINTVAL found = 0;
    HashBucket *bucket;
    int mark_key = 0, mark_value = 0;
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
        bucket = hash->bu.bi[i];
        while (bucket) {
            if (++found > hash->entries)
                internal_exception(1,
                        "Detected hash corruption at hash %p entries %d",
                        hash, (int)hash->entries);
            if (mark_key)
                pobject_lives(interpreter, (PObj *)bucket->key);
            if (mark_value)
                pobject_lives(interpreter, (PObj *)bucket->value);
            bucket = bucket->next;
        }
    }
}

/*

=item C<void
hash_visit(Interp *interpreter, Hash *hash, void* pinfo)>

This is used by freeze/thaw to visit the contents of the hash.

C<pinfo> is the visit info, (see include/parrot/pmc_freeze.h>).

=cut

*/

static void
hash_thaw(Interp *interpreter, Hash *hash, visit_info* info)
{
    size_t i, n;
    STRING *s_key;
    INTVAL i_key;
    IMAGE_IO *io = info->image_io;
    HashBucket *b;

    /*
     * during thaw info->extra is the key/value count
     */
    assert(info->extra_flags == EXTRA_IS_COUNT);
    n = (size_t) info->extra;
    for (i = 0; i < n; ++i) {
        switch (hash->key_type) {
            case Hash_key_type_STRING:
                s_key = io->vtable->shift_string(interpreter, io);
                b = hash_put(interpreter, hash, s_key, NULL);
                break;
            case Hash_key_type_int:
                i_key = io->vtable->shift_integer(interpreter, io);
                b = hash_put(interpreter, hash, (void*)i_key, NULL);
                break;
            default:
                internal_exception(1, "unimplemented key type");
                b = NULL;
                break;
        }
        switch (hash->entry_type) {
            case enum_hash_pmc:
                info->thaw_ptr = (PMC**)&b->value;
                (info->visit_pmc_now)(interpreter, NULL, info);
                break;
            case enum_hash_int:
                b->value = (void*)io->vtable->shift_integer(interpreter, io);
                break;
            default:
                internal_exception(1, "unimplemented value type");
                break;
        }
    }
}

static void
hash_freeze(Interp *interpreter, Hash *hash, visit_info* info)
{
    size_t i, n;
    STRING *s_key;
    INTVAL i_key;
    IMAGE_IO *io = info->image_io;
    HashBucket *b;

    for (i = 0; i <= hash->mask; i++) {
        b = hash->bu.bi[i];
        while (b) {
            switch (hash->key_type) {
                case Hash_key_type_STRING:
                    io->vtable->push_string(interpreter, io, b->key);
                    break;
                case Hash_key_type_int:
                    io->vtable->push_integer(interpreter, io, (INTVAL)b->key);
                    break;
                default:
                    internal_exception(1, "unimplemented key type");
                    b = NULL;
                    break;
            }
            switch (hash->entry_type) {
                case enum_hash_pmc:
                    (info->visit_pmc_now)(interpreter, b->value, info);
                    break;
                case enum_hash_int:
                    io->vtable->push_integer(interpreter, io, (INTVAL)b->value);
                    break;
                default:
                    internal_exception(1, "unimplemented value type");
                    break;
            }
            b = b->next;
        }
    }
}

void
hash_visit(Interp *interpreter, Hash *hash, void* pinfo)
{
    visit_info* info = (visit_info*) pinfo;

    switch (info->what) {
        case VISIT_THAW_NORMAL:
        case VISIT_THAW_CONSTANTS:
            hash_thaw(interpreter, hash, info);
            break;
        case VISIT_FREEZE_NORMAL:
        case VISIT_FREEZE_AT_DESTRUCT:
            hash_freeze(interpreter, hash, info);
            break;
        default:
            internal_exception(1, "unimplemented visit mode");
            break;
    }
}

/*

=item C<static void
expand_hash(Interp *interpreter, Hash *hash)>

For a hashtable of size N, we use C<MAXFULL_PERCENT> % of N as the
number of buckets. This way, as soon as we run out of buckets on the
free list, we know that it's time to resize the hashtable.

Algorithm for expansion: We exactly double the size of the hashtable.
Keys are assigned to buckets with the formula

	bucket_index = hash(key) % hash_size

so when doubling the size of the hashtable, we know that every key is
either already in the correct bucket, or belongs in the current bucket
plus C<hash_size> (the old C<hash_size>). In fact, because the hashtable
is always a power of two in size, it depends only on the next bit in the
hash value, after the ones previously used.

So we scan through all the buckets in order, moving the buckets that
need to be moved. No bucket will be scanned twice, and the cache should
be reasonably happy because the hashtable accesses will be two parallel
sequential scans. (Of course, this also mucks with the C<< ->next >>
pointers, and they'll be all over memory.)

=cut

*/

static void
expand_hash(Interp *interpreter, Hash *hash)
{
    UINTVAL old_size = hash->mask + 1;
    UINTVAL new_size = old_size << 1;
    UINTVAL old_nb;
    HashBucket **old_bi, **new_bi;
    HashBucket  *bs, *b, **next_p;
    void *old_mem;
    void *new_mem;
    size_t offset, i, new_loc;

    /*
       allocate some less buckets
       e.g. 3 buckets, 4 pointers:

         +---+---+---+-+-+-+-+
	 | bs <--    | -> bi |
         +---+---+---+-+-+-+-+
	 ^           ^
	 | old_mem   | hash->bu
    */
    old_nb = N_BUCKETS(old_size);
    old_mem = hash->bu.bs - old_nb;
    /*
     * resize mem
     */
    new_mem = mem_sys_realloc(old_mem, HASH_ALLOC_SIZE(new_size));
    /*
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
	 |  bs       | old_bi    |  new_bi       |
         +---+---+---+---+---+---+-+-+-+-+-+-+-+-+
  	 ^                       ^
	 | new_mem	         | hash->bu
    */
    bs = new_mem;
    old_bi = (HashBucket**) (bs + old_nb);
    new_bi = (HashBucket**) (bs + N_BUCKETS(new_size));
    /* things can have moved by this offset */
    offset = (char*)new_mem - (char*)old_mem;
    /* relocate the bucket index */
    mem_sys_memmove(new_bi, old_bi, old_size * sizeof(HashBucket*));

    /* update hash data */
    hash->bu.bi = new_bi;
    hash->mask = new_size - 1;

    /* clear freshly allocated bucket index */
    memset(new_bi + old_size, 0, sizeof(HashBucket*) * old_size);
    /*
     * reloc pointers
     */
    if (offset) {
	for (i = 0; i < old_size; ++i) {
	    next_p = new_bi + i;
	    while (*next_p) {
		LVALUE_CAST(char*, *next_p) += offset;
		b = *next_p;
		next_p = &b->next;
	    }
	}
    }
    /* recalc bucket index */
    for (i = 0; i < old_size; ++i) {
	next_p = new_bi + i;
	while (*next_p) {
	    b = *next_p;
	    /* rehash the bucket */
	    new_loc = (hash->hash_val)(interpreter, b->key, hash->seed) &
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
    /* add new buckets to free_list */
    for (i = 0, b = (HashBucket*)old_bi; i < old_nb; ++i, ++b) {
	b->next = hash->free_list;
	b->key = b->value = NULL;
	hash->free_list = b;
    }

}


/*

=item C<void
new_hash(Interp *interpreter, Hash **hptr)>

Returns a new Parrot STRING hash in C<hptr>.

new_pmc_hash(Interp *interpreter, PMC *container)>

Create a new Parrot STRING hash in PMC_struct_val(container)

=cut

*/

void
new_hash(Interp *interpreter, Hash **hptr)
{
    new_hash_x(interpreter, hptr,
            enum_type_PMC,
            Hash_key_type_STRING,
            STRING_compare,     /* STRING compare */
            key_hash_STRING);    /*        hash */
}

void
new_pmc_hash(Interp *interpreter, PMC *container)
{
    new_pmc_hash_x(interpreter, container,
            enum_type_PMC,
            Hash_key_type_STRING,
            STRING_compare,     /* STRING compare */
            key_hash_STRING);    /*        hash */
}
/*

=item C<void
new_cstring_hash(Interp *interpreter, Hash **hptr)>

Returns a new C string hash in C<hptr>.

=cut

*/

void
new_cstring_hash(Interp *interpreter, Hash **hptr)
{
    new_hash_x(interpreter, hptr,
            enum_type_PMC,
            Hash_key_type_cstring,
            cstring_compare,     /* cstring compare */
            key_hash_cstring);    /*        hash */
}

/*

=item C<void
new_hash_x(Interp *interpreter, Hash **hptr,
        PARROT_DATA_TYPES val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)>

Returns a new hash in C<hptr>.

FIXME: This function can go back to just returning the hash struct
pointer once Buffers can define their own custom mark routines.

The problem is: During DODs stack walking the item on the stack must be
a PMC. When an auto C<Hash*> is seen, it doesn't get properly marked
(only the C<Hash*> buffer is marked, not its contents). By passing the
C<**hptr> up to the PerlHash's or Hash's init function, the newly constructed PMC is
on the stack I<including> this newly constructed Hash, so that it gets
marked properly.

=item C<void
new_pmc_hash_x(Interp *interpreter, PMC *container,
        PARROT_DATA_TYPES val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)>

Like above but w/o the described problems. The passed in C<container> PMC gets
stored in the Hash end the newly created Hash is in PMC_struct_val(container).

=cut

*/

static void
init_hash(Interp *interpreter, Hash *hash,
        PARROT_DATA_TYPES val_type,
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
    hash->bu.bs = mem_sys_allocate(HASH_ALLOC_SIZE(INITIAL_BUCKETS));
    hash->free_list = NULL;
    for (i = 0, bp = hash->bu.bs; i < N_BUCKETS(INITIAL_BUCKETS); ++i, ++bp) {
	bp->next = hash->free_list;
	bp->key = bp->value = NULL;
	hash->free_list = bp;
    }
    /* see the graphic in expand_hash */
    hash->bu.bs = bp;
    for (i = 0; i < INITIAL_BUCKETS; ++i) {
	hash->bu.bi[i] = NULL;
    }
}

void
hash_destroy(Interp * interpreter, Hash *hash)
{
    UINTVAL nb;
    void *mem;

    nb = N_BUCKETS(hash->mask + 1);
    mem = hash->bu.bs - nb;
    mem_sys_free(mem);
    mem_sys_free(hash);
}

void
new_hash_x(Interp *interpreter, Hash **hptr,
        PARROT_DATA_TYPES val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)
{
    Hash *hash = mem_sys_allocate(sizeof(Hash));
    *hptr = hash;
    init_hash(interpreter, hash, val_type, hkey_type,
            compare, keyhash);
}

void
new_pmc_hash_x(Interp *interpreter, PMC *container,
        PARROT_DATA_TYPES val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash)
{
    Hash *hash = mem_sys_allocate(sizeof(Hash));
    PMC_struct_val(container) = hash;
    hash->container = container;
    init_hash(interpreter, hash, val_type, hkey_type,
            compare, keyhash);
}

/*

=item C<PMC* Parrot_new_INTVAL_hash(Interp *interpreter, UINTVAL flags)>

Create a new Hash PMC with INTVAL keys and values. C<flags> can be
C<PObj_constant_FLAG> or 0.

=cut

*/
PMC*
Parrot_new_INTVAL_hash(Interp *interpreter, UINTVAL flags)
{
    PMC *h;

    if (flags & PObj_constant_FLAG)
        h = constant_pmc_new_noinit(interpreter, enum_class_Hash);
    else
        h = pmc_new_noinit(interpreter, enum_class_Hash);
    new_pmc_hash_x(interpreter, h, enum_type_INTVAL, Hash_key_type_int,
            int_compare, key_hash_int);
    PObj_active_destroy_SET(h);
    return h;
}
/*

=item C<INTVAL
hash_size(Interp *interpreter, Hash *hash)>

Return the number of used entries in the hash.

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

=item C<void *
hash_get_idx(Interp *interpreter, Hash *hash, PMC * key)>

Called by iterator.

=cut

*/

void *
hash_get_idx(Interp *interpreter, Hash *hash, PMC * key)
{
    INTVAL i = PMC_int_val(key);
    BucketIndex bi = (BucketIndex)PMC_data(key);
    HashBucket *b;
    void *res;

    /* idx directly in the bucket store, which is at negative
     * address from the data pointer
     */
    /* locate initial */
    if (bi == INITBucketIndex) {
        i = 0;
        PMC_data(key) = NULL;
    }
    else if (i >= (INTVAL)N_BUCKETS(hash->mask + 1)) {
        PMC_int_val(key) = -1;
        return NULL;
    }
    res = NULL;
    for (b = hash->bu.bs-i-1; i < (INTVAL)N_BUCKETS(hash->mask + 1); ++i, --b) {
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
    if (i >= (INTVAL)N_BUCKETS(hash->mask + 1))
        i = -1;
    PMC_int_val(key) = i;
    return res;
}

/*

=item C<HashBucket *
hash_get_bucket(Interp *interpreter, Hash *hash, void *key)>

Returns the bucket for C<key>.

=cut

*/

HashBucket *
hash_get_bucket(Interp *interpreter, Hash *hash, void *key)
{
    UINTVAL hashval = (hash->hash_val)(interpreter, key, hash->seed);
    HashBucket *bucket = hash->bu.bi[hashval & hash->mask];
    while (bucket) {
	/* store hash_val or not */
        if ((hash->compare)(interpreter, key, bucket->key) == 0)
	    return bucket;
	bucket = bucket->next;
    }
    return NULL;
}

/*

=item C<void *
hash_get(Interp *interpreter, Hash *hash, void *key)>

Returns the bucket for C<key> or C<NULL> if no bucket is found.

=cut

*/

void *
hash_get(Interp *interpreter, Hash *hash, void *key)
{
    HashBucket *bucket = hash_get_bucket(interpreter, hash, key);
    return bucket ? bucket->value : NULL;
}

/*

=item C<INTVAL
hash_exists(Interp *interpreter, Hash *hash, void *key)>

Returns whether the key exists in the hash.

=cut

*/

INTVAL
hash_exists(Interp *interpreter, Hash *hash, void *key)
{
    HashBucket *bucket = hash_get_bucket(interpreter, hash, key);
    return bucket ? 1 : 0;
}

/*

=item C<HashBucket*
hash_put(Interp *interpreter, Hash *hash, void *key, void *value)>

Puts the key and value into the hash. Note that C<key> is B<not>
copied.

=cut

*/

HashBucket*
hash_put(Interp *interpreter, Hash *hash, void *key, void *value)
{
    UINTVAL hashval = (hash->hash_val)(interpreter, key, hash->seed);
    HashBucket *bucket = hash->bu.bi[hashval & hash->mask];
    while (bucket) {
	/* store hash_val or not */
        if ((hash->compare)(interpreter, key, bucket->key) == 0)
	    break;
	bucket = bucket->next;
    }

    if (bucket) {
        if (hash->entry_type == enum_type_PMC && hash->container) {
            DOD_WRITE_BARRIER_KEY(interpreter, hash->container,
                    (PMC*)bucket->value, bucket->key, (PMC*)value, key);
        }
        bucket->value = value;	/* replace value */
    }
    else {
        if (hash->entry_type == enum_type_PMC && hash->container) {
            DOD_WRITE_BARRIER_KEY(interpreter, hash->container,
                    NULL, NULL, (PMC*)value, key);
        }
	bucket = hash->free_list;
	if (!bucket) {
	    expand_hash(interpreter, hash);
	    bucket = hash->free_list;
	}
        hash->entries++;
	hash->free_list = bucket->next;
        bucket->key = key;
        bucket->value = value;
	bucket->next = hash->bu.bi[hashval & hash->mask];
	hash->bu.bi[hashval & hash->mask] = bucket;
    }
    return bucket;
}

/*

=item C<void
hash_delete(Interp *interpreter, Hash *hash, void *key)>

Deletes the key from the hash.

=cut

*/

void
hash_delete(Interp *interpreter, Hash *hash, void *key)
{
    UINTVAL hashval;
    HashBucket *bucket;
    HashBucket *prev = NULL;

    hashval = (hash->hash_val)(interpreter, key, hash->seed) & hash->mask;

    for (bucket = hash->bu.bi[hashval]; bucket; bucket = bucket->next) {
        if ((hash->compare)(interpreter, key, bucket->key) == 0) {
            if (prev)
                prev->next = bucket->next;
            else {
                hash->bu.bi[hashval] = bucket->next;
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

=item C<void
hash_clone(Interp *interp, Hash *hash, Hash **dest)>

Clones C<hash> to C<dest>.

=cut

*/

void
hash_clone(Interp *interp, Hash *hash, Hash **dest)
{
    UINTVAL i;
    HashBucket *b;

    new_hash_x(interp, dest, hash->entry_type,
            hash->key_type, hash->compare, hash->hash_val);
    for (i = 0; i <= hash->mask; i++) {
        b = hash->bu.bi[i];
        while (b) {
            void *key = b->key;
            void *valtmp;
            switch (hash->entry_type) {
            case enum_type_undef:
            case enum_type_ptr:
            case enum_type_INTVAL:
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
            b = b->next;
        }
    }
}

/*

=back

=head1 SEE ALSO

F<docs/pdds/pdd08_keys.pod>.

=head1 HISTORY

=over 4

=item * Initial version by Jeff G. on 2001.12.05

=item * Substantially rewritten by Steve F.

=item * 2003.10.25

leo add function pointer for compare, hash, mark

hash keys are now C<(void *)>

add C<new_cstring_hash()> function

=item * 2003.11.04

C<< bucket->value >> is now a plain pointer, no more an C<HASH_ENTRY>

With little changes, we can again store arbitrary items if needed, see
TODO in code.

=item * 2003.11.06

boemmels renamed C<HASH> and C<HASHBUCKET> to C<Hash> and C<HashBucket>

=item * 2003.11.11

leo randomize C<key_hash> seed

extend C<new_hash_x()> init call by C<value_type> and C<_size>.

=item * 2003.11.14

leo C<USE_STRING_EQUAL> define, see comment above

=item * 2005.05.23

leo heavy rewrite: use just one piece of malloced memory

=back

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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
