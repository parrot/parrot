/*
Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/new_hash.c - Hash table

=head1 DESCRIPTION

A hashtable contains an array of bucket indexes. Buckets are nodes in a
linked list, each containing a C<void *> key and value. During hash
creation the types of key and value as well as appropriate compare and
hashing functions can be set.

This hash implementation uses just one piece of malloced memory. The
C<hash->bu> union points into this regions. At positive indices are
bucket pointers, at negative indices is the bucket store itself.

This hash doesn't move during GC, therefore a lot of the old caveats
don't apply.

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#define STANDALONE 1
#define HASH_TEST  1

/*
 * this code will replace src/hash.c when it's tested thorougly
 */

#if STANDALONE
/*
 * dummy defs and types
 */
typedef void* Parrot_Interp;
typedef void* Interp;
typedef int PARROT_DATA_TYPES;
typedef void* PObj;
typedef void* PMC;
typedef void* STRING;
typedef size_t UINTVAL;
typedef long INTVAL;
#define PMC_int_val(k) (int)k
#define UNUSED(x) (void) x
#ifdef __GCC__
#define LVALUE_CAST(type, val) ((type)(val))
#else
#define LVALUE_CAST(type, val) (*((type *)&(val)))
#endif /* __GCC__ */

#endif

/* header defs */

/* a bit more stress */
#define INITIAL_BUCKETS 4	/* min is 4 */

typedef struct _hashbucket {
    struct _hashbucket *next;
    void *key;
    void *value;
} HashBucket;

struct _hash;

typedef int    (*hash_comp_fn)(Interp*, void*, void*);
typedef void   (*hash_mark_key_fn)(Interp*, PObj *);
typedef size_t (*hash_hash_key_fn)(Interp*, struct _hash*, void*);

typedef enum {
    Hash_key_type_none,
    Hash_key_type_int,
    Hash_key_type_cstring,
    Hash_key_type_ascii,
    Hash_key_type_utf8
} Hash_key_type;

typedef struct _hash {
    union {
	HashBucket **bi;        /* list of Bucket pointers */
	HashBucket *bs;         /* store of buckets */
    } bu;
    HashBucket *free_list;      /* empty buckets */
    UINTVAL entries;            /* Number of values stored in hashtable */
    UINTVAL mask;               /* alloced - 1 */
    PMC *container;             /* e.g. the PerlHash PMC */
    Hash_key_type key_type;     /* cstring, ascii-string, utf8-string */
    PARROT_DATA_TYPES entry_type;   /* type of value */
    size_t seed;                /* randomizes the hash_key generation
                                   updated for each new hash */
    hash_comp_fn   compare;     /* compare two keys, 0 = equal */
    hash_hash_key_fn hash_val;  /* generate a hash value for key */
    hash_mark_key_fn mark_key;  /* mark a key being alive */
} Hash;

/* code */

#define N_BUCKETS(n) ((n) - (n)/4)
#define HASH_ALLOC_SIZE(n) ( N_BUCKETS(n) * sizeof(HashBucket) + \
                             (n) * sizeof(HashBucket *))
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
    new_mem = realloc(old_mem, HASH_ALLOC_SIZE(new_size));
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
    memmove(new_bi, old_bi, old_size * sizeof(HashBucket*));

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
	    new_loc = (hash->hash_val)(interpreter, hash, b->key) &
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

static void
init_hash(Interp *interpreter, Hash *hash,
        PARROT_DATA_TYPES val_type,
        Hash_key_type hkey_type,
        hash_comp_fn compare, hash_hash_key_fn keyhash,
        hash_mark_key_fn mark)
{
    size_t i;
    HashBucket *bp;

    hash->compare = compare;
    hash->hash_val = keyhash;
    hash->mark_key = mark;
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
    hash->bu.bs = malloc(HASH_ALLOC_SIZE(INITIAL_BUCKETS));
    hash->free_list = NULL;
    for (i = 0, bp = hash->bu.bs; i < N_BUCKETS(INITIAL_BUCKETS); ++i, ++bp) {
	bp->next = hash->free_list;
	bp->key = bp->value = NULL;
	hash->free_list = bp;
    }
    /* see the grafic in expand_hash */
    hash->bu.bs = bp;
    for (i = 0; i < INITIAL_BUCKETS; ++i) {
	hash->bu.bi[i] = NULL;
    }
}

HashBucket *
hash_get_bucket(Interp *interpreter, Hash *hash, void *key)
{
    UINTVAL hashval = (hash->hash_val)(interpreter, hash, key);
    HashBucket *bucket = hash->bu.bi[hashval & hash->mask];
    while (bucket) {
	/* store hash_val or not */
        if ((hash->compare)(interpreter, key, bucket->key) == 0)
	    return bucket;
	bucket = bucket->next;
    }
    return NULL;
}

void *
hash_get(Interp *interpreter, Hash *hash, void *key)
{
    HashBucket *bucket = hash_get_bucket(interpreter, hash, key);
    return bucket ? bucket->value : NULL;
}

HashBucket*
hash_put(Interp *interpreter, Hash *hash, void *key, void *value)
{
    UINTVAL hashval = (hash->hash_val)(interpreter, hash, key);
    HashBucket *bucket = hash->bu.bi[hashval & hash->mask];
    while (bucket) {
	/* store hash_val or not */
        if ((hash->compare)(interpreter, key, bucket->key) == 0)
	    break;
	bucket = bucket->next;
    }

    if (bucket) {
        bucket->value = value;	/* replace value */
    }
    else {
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

void
hash_delete(Interp *interpreter, Hash *hash, void *key)
{
    UINTVAL hashval;
    HashBucket *bucket;
    HashBucket *prev = NULL;

    hashval = (hash->hash_val)(interpreter, hash, key) & hash->mask;

    for (bucket = hash->bu.bi[hashval]; bucket; bucket = bucket->next) {
        if ((hash->compare)(interpreter, key, bucket->key) == 0) {
            if (prev)
                prev->next = bucket->next;
            else {
                hash->bu.bi[hashval] = bucket->next;
            }
            hash->entries--;
            bucket->next = hash->free_list;
            hash->free_list = bucket;
            return;
        }
        prev = bucket;
    }
}

STRING *
hash_get_idx(Interp *interpreter, Hash *hash, PMC * key)
{
    INTVAL i = PMC_int_val(key);
    HashBucket *b;

    /* idx directly in the bucket store, which is at negative
     * addressess from the data pointer
     */
    if (i < 0)
	return NULL;
    ++i;
    for (b = hash->bu.bs - i; i < N_BUCKETS(hash->mask+1); ++i, --b) {
	/* XXX int keys may be zero - use different iterator
	 */
	if (b->key) {
	    PMC_int_val(key) = i;
	    return b->value;
	}
    }
    PMC_int_val(key) = -1;
    return NULL;
}

#if HASH_TEST
static size_t
key_hash_cstring(Interp *interpreter, Hash* hash, void *value)
{
    register size_t h = hash->seed;
    unsigned char * p = (unsigned char *) value;
    UNUSED(interpreter);
    while (*p) {
        h += h << 5;
        h += *p++;
    }
    return h;
}
static int
cstring_compare(Interp* interpreter, void *a, void *b)
{
    UNUSED(interpreter);
    return strcmp(a, b);
}

int main(int argc, char *argv[])
{
    Hash *hash = malloc(sizeof(Hash));
    char *s, *k, *v;
    int i, n = 100000;

    printf("sizeof(Hash) = %u\n", sizeof(Hash));
    init_hash(NULL, hash, 0, 0,
            cstring_compare, key_hash_cstring, 0);
    hash_put(0, hash, "k1", "v1");
    hash_put(0, hash, "k2", "v2");
    hash_put(0, hash, "k3", "v3");
    s = hash_get(0, hash, "k1");
    puts(s);
    s = hash_get(0, hash, "k2");
    puts(s);
    s = hash_get(0, hash, "k3");
    puts(s);
    for (i = 0; i < n; i++) {
	k = malloc(8);
	v = malloc(8);
	snprintf(k, 7, "k%d", i);
	snprintf(v, 7, "v%d", i);
	hash_put(0, hash, k, v);
    }

    hash_delete(0, hash, "k2");
    s = hash_get(0, hash, "k1");
    puts(s);
    s = hash_get(0, hash, "k2");
    assert(!s);
    s = hash_get(0, hash, "k3");
    puts(s);
    s = hash_get(0, hash, "k999");
    puts(s);
    puts("done");
    return 0;
}
#endif

/*

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
