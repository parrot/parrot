/*
Copyright: (c) 2002 Leopold Toetsch <lt@toetsch.at>
License:  Artistic/GPL, see README and LICENSES for details
$Id$

=head1 NAME

src/list.c - List aka array routines

=head1 DESCRIPTION

List is roughly based on concepts of IntList (thanks to Steve),
so I don't repeat them here.

Especially the same invariants hold, except an empty list is really
empty, meaning, push does first check for space.

The main differences are:

- List can hold items of different size, it's suitable for ints and PMCs
..., calculations are still done in terms of items. The item_size is
specified at list creation time with the "type" argument.

If you later store different item types in the list, as stated
initially, you'll get probably not what you want - so don't do this.

- List does auto grow. The caller may implement a different behaviour if
she likes.

- Error checking for out of bounds access is minimal, caller knows
better, what should be done.

- List structure itself is different from List_chunk, implying:

=over 4

=item * end of list is not C<<list->prev>> but C<<list->end>>

=item * start of list is list->first

=item * the list of chunks is not closed, detecting the end is more simple

=item * no spare is keeped, didn't improve due to size constraints

=item * the List object itself doesn't move around for shift/unshift

=back

- list chunks don't have C<<->start>> and C<<->end>> fields. Instead the list has
C<<->start>>, which is start of first chunk, and C<<->cap>>, the total usable
capacity in the list.

- number of items in chunks are not fixed, but there is a mode
using same sized chunks

=head2 Grow policy

=over 4

=item C<enum_grow_fixed>

All chunks are of C<MAX_ITEMS> size, chosen, when the first access to
the array is indexed and beyond C<MIN_ITEMS> and below 10 *
C<MAX_ITEMS>

If the first access is beyond 10 * C<MAX_ITEMS> a sparse chunk will
be created.

To avoid this - and the performance penalty - set the array size
before setting elements.

    new P0, .PerlArray
    set P0, 100000  # sets fixed sized, no sparse

This is only meaningful, if a lot of the entries are used too.

=item C<enum_grow_growing>

Chunk sizes grow from C<MIN_ITEMS> to C<MAX_ITEMS>, this will be selected
for pushing data on an empty array.

=item C<enum_grow_mixed>

Mixture of above chunk types and when sparse chunks are present, or
after insert and delete.

The chunks hold the information, how many chunks are of the same type,
beginning from the current, and how many items are included in this
range. See C<get_chunk> below for details.

=back

=head2 Sparse lists


To save memory, List can handle sparse arrays. This code snippet:

new P0, .IntList
set P0[1000000], 42

generates 3 List_chunks, one at the beginning of the array, a
big sparse chunk and a chunk for the actual data.

Setting values inside sparse chunks changes them to real chunks.
For poping/shifting inside sparse chunks, s. return value below.

=head2 Chunk types

=over 4

=item C<fixed_items>

Have allocated space, size is a power of 2, consecutive chunks are same sized.

=item C<grow_items>

Same, but consecutive chunks are growing.

=item C<no_power_2>

Have allocated space but any size.

=item C<sparse>

Only dummy allocation, C<<chunk->items>> holds the items of this sparse
hole.

=back

=head2 Data types

A List can hold various datatypes. See F<src/datatypes.h> for the
enumeration of types.

Not all are yet implemented in C<list_set>/C<list_item>, see the
C<switch()>.

Arbitrary length data:

Construct initializer with:

=over 4

=item C<enum_type_sized>

=item C<item_size> (in bytes)

=item C<items_per_chunk> (rounded up to power of 2, default C<MAX_ITEMS>)

=back

In C<list_assign> the values are copied into the array, C<list_get>
returns a pointer as for all other data types.

See F<src/list_2.t> and C<list_new_init()>.

=head2 Return value

List get functions return a C<(void*)> pointer to the location of the
stored data. The caller has to extract the value from this pointer.

For non existent data beyond the dimensions of the array a C<NULL>
pointer is returned.

For non existing data inside sparse holes, a pointer C<(void*)-1> is
returned.

The caller can decide to assume these data as undef or 0 or whatever is
appropriate.

=head2 Testing

See F<t/src/{int,}list.c> and F<t/pmc/{int,}list.t>.

Also all array usage depends on list.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/* internals */
static List_chunk *allocate_chunk(Interp *interpreter, List *list,
        UINTVAL items, UINTVAL size);
#ifdef LIST_DEBUG
static void list_dump(FILE *fp, List *list, INTVAL type);
#endif
static UINTVAL rebuild_chunk_list(Interp *interpreter, List *list);
static List_chunk *alloc_next_size(Interp *interpreter, List *list,
        int where, UINTVAL idx);
static List_chunk *add_chunk(Interp *interpreter, List *list,
        int where, UINTVAL idx);
UINTVAL ld(UINTVAL x);
static List_chunk *get_chunk(Interp *interpreter, List *list, UINTVAL *idx);
static void split_chunk(Interp *interpreter, List *list,
        List_chunk *chunk, UINTVAL idx);
static void
  list_set(Interp *interpreter, List *list, void *item, INTVAL type, INTVAL idx);
static void *list_item(Interp *interpreter, List *list, int type, INTVAL idx);
static void list_append(Interp *interpreter, List *list, void *item,
        int type, UINTVAL idx);

#define chunk_list_size(list) \
                (list->chunk_list.buflen / sizeof(List_chunk *))

/* hide the ugly cast somehow: */
#define chunk_list_ptr(list, idx) \
        ((List_chunk**)list->chunk_list.bufstart)[idx]

/*

=item C<static List_chunk *
allocate_chunk(Interp *interpreter, List *list, UINTVAL items, UINTVAL size)>

Make a new chunk, size bytes big, holding items items.

=cut

*/

static List_chunk *
allocate_chunk(Interp *interpreter, List *list, UINTVAL items, UINTVAL size)
{
    List_chunk *chunk;

    Parrot_block_DOD(interpreter);
    Parrot_block_GC(interpreter);
    chunk = (List_chunk *)new_bufferlike_header(interpreter, sizeof(*chunk));
    chunk->items = items;
    chunk->n_chunks = 0;
    chunk->n_items  = 0;
    chunk->next     = NULL;
    chunk->prev     = NULL;
    Parrot_allocate_zeroed(interpreter, (Buffer *)chunk, size);
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interpreter);
    return chunk;
}

#ifdef LIST_DEBUG

/*

=item C<static void
list_dump(FILE *fp, List *list, INTVAL type)>

Only char and int are supported currently.

=cut

*/

static void
list_dump(FILE *fp, List *list, INTVAL type)
{
    List_chunk *chunk = list->first;
    UINTVAL i;
    UINTVAL idx = 0;

    for (; chunk; chunk = chunk->next) {
        printf(chunk->flags & no_power_2 ? "(" : "[");
        if (chunk->flags & sparse)
            printf(INTVAL_FMT " x ''", chunk->items);
        else
            for (i = 0; i < chunk->items; i++) {
                if (idx++ >= list->start && idx <= list->length + list->start) {
                    switch (list->item_type) {
                    case enum_type_int:
                    case enum_type_short:
                        printf("%d", (int)((int *)chunk->data.bufstart)[i]);
                        break;
                    case enum_type_char:
                        printf("%c", (char)((char *)chunk->data.bufstart)[i]);
                        break;
                    }
                }
                if (i < chunk->items - 1)
                    printf(",");
            }
        printf(chunk->flags & no_power_2 ? ")" : "]");
        if (chunk->next)
            printf(" -> ");
    }
    printf("\n");
}
#endif

/*

=item C<static void
rebuild_chunk_ptrs(List *list, int cut)>

Rebuild chunk_list and update/optimize chunk usage, helper functions.

Delete empty chunks, count chunks and fix prev pointers.

=cut

*/

static void
rebuild_chunk_ptrs(List *list, int cut)
{
    List_chunk *chunk, *prev;
    UINTVAL len = 0, start = list->start;
    UINTVAL cap;

    cap = 0;
    for (prev = 0, chunk = list->first; chunk; chunk = chunk->next) {
        /* skip empty chunks, first is empty, when all items get skipped due
         * to list->start */
        if (chunk->items == start) {
            if (prev)
                prev->next = chunk->next;
            else
                list->first = chunk->next;
            start = 0;
            continue;
        }
        len++;
        start = 0;
        chunk->prev = prev;
        prev = chunk;
        list->last = chunk;
        if (cut && cap > list->start + list->length && chunk != list->first) {
            list->last = chunk->prev ? chunk->prev : list->first;
            len--;
            break;
        }
        cap += chunk->items;
    }
    if (list->last)
        list->last->next = 0;
    list->cap = cap;
    if (list->first)
        list->first->prev = 0;
    list->n_chunks = len;
}

/*

=item C<static void
rebuild_sparse(List *list)>

Coalesce adjacent sparse chunks.

=cut

*/

static void
rebuild_sparse(List *list)
{
    List_chunk *chunk, *prev;
    int changes = 0;

    for (prev = 0, chunk = list->first; chunk; chunk = chunk->next) {
        if (prev && (prev->flags & sparse) &&
                (chunk->flags & sparse)) {
            prev->items += chunk->items;
            chunk->items = 0;
            changes++;
            continue;
        }
        prev = chunk;
    }
    if (changes)
        rebuild_chunk_ptrs(list, 0);
}

/*

=item C<static void
rebuild_other(Interp *interpreter, List *list)>

Coalesce adjacent irregular chunks.

=cut

*/

static void
rebuild_other(Interp *interpreter, List *list)
{
    List_chunk *chunk, *prev;
    int changes = 0;

    for (prev = 0, chunk = list->first; chunk; chunk = chunk->next) {
        /* two adjacent irregular chunks */
        if (prev && (prev->flags & no_power_2) &&
                (chunk->flags & no_power_2)) {
            /* DONE don't make chunks bigger then MAX_ITEMS, no - make then
             * but: if bigger, split them in a next pass
             * TODO test the logic that solves the above problem */
            if(prev->items + chunk->items > MAX_ITEMS) {
                Parrot_reallocate(interpreter, (Buffer *)prev,
                    MAX_ITEMS * list->item_size);
                mem_sys_memmove(
                        (char *)prev->data.bufstart +
                        prev->items * list->item_size,
                        (char *)chunk->data.bufstart,
                        (MAX_ITEMS - prev->items) * list->item_size);
                mem_sys_memmove(
                        (char *)chunk->data.bufstart,
                        (char *)chunk->data.bufstart +
                        (MAX_ITEMS - prev->items) * list->item_size,
                        (chunk->items - (MAX_ITEMS - prev->items)) * list->item_size);
                chunk->items = chunk->items - (MAX_ITEMS - prev->items);
                prev->items = MAX_ITEMS;
            }
            else {
                Parrot_reallocate(interpreter, (Buffer *)prev,
                        (prev->items + chunk->items) * list->item_size);
                mem_sys_memmove(
                        (char *)prev->data.bufstart +
                        prev->items * list->item_size,
                        (char *)chunk->data.bufstart,
                        chunk->items * list->item_size);
                prev->items += chunk->items;
                chunk->items = 0;
            }
            changes++;
            continue;
        }
        prev = chunk;
    }
    if (changes)
        rebuild_chunk_ptrs(list, 0);
}

/*

=item C<static void
rebuild_fix_ends(Interp *interpreter, List *list)>

Called by C<rebuild_chunk_list()>.

=cut

*/

static void
rebuild_fix_ends(Interp *interpreter, List *list)
{
    List_chunk *chunk;

    chunk = list->first;
    /* first is irregular, next is empty */
    if (list->n_chunks <= 2 && (chunk->flags & no_power_2) &&
            (!chunk->next || chunk->next->items == 0 ||
                    list->start + list->length <= chunk->items)) {
        chunk->flags = 0;
        list->grow_policy = enum_grow_unknown;
        list->cap += chunk->data.buflen / list->item_size - chunk->items;
        chunk->items = chunk->data.buflen / list->item_size;
    }
    /* XXX - still needed? - if last is empty and last->prev not full then
     * delete last - combine small chunks if list is big */
}

/*

=item C<static UINTVAL
rebuild_chunk_list(Interp *interpreter, List *list)>

Called to optimise the list when modifying it in some way.

=cut

*/

static UINTVAL
rebuild_chunk_list(Interp *interpreter, List *list)
{
    List_chunk *chunk, *prev, *first;
    UINTVAL len;

    Parrot_block_DOD(interpreter);
    Parrot_block_GC(interpreter);
    /* count chunks and fix prev pointers */
    rebuild_chunk_ptrs(list, 0);
    /* if not regular, check & optimize */
    if (list->grow_policy == enum_grow_mixed) {
        rebuild_sparse(list);
        rebuild_other(interpreter, list);
        rebuild_fix_ends(interpreter, list);
    }

    /* allocate a new chunk_list buffer, if old one has moved or is too small */
    len = list->n_chunks;
    if (list->collect_runs != interpreter->collect_runs ||
            len > chunk_list_size(list)) {
        /* round up to reasonable size */
        len = 1 << (ld(len) + 1);
        if (len < 4)
            len = 4;
        Parrot_reallocate(interpreter, (Buffer *)list,
                len * sizeof(List_chunk *));
        list->collect_runs = interpreter->collect_runs;
    }

    /* reset type, actual state of chunks will show, what we really have */
    list->grow_policy = enum_grow_unknown;

    /* fill chunk_list and update statistics */
    first = chunk = list->first;
    for (prev = NULL, len = 0; chunk; chunk = chunk->next) {
        chunk_list_ptr(list, len) = chunk;
        len++;

        /* look, what type of chunks we have this is always correct: */
        chunk->n_chunks = 1;
        chunk->n_items = chunk->items;

        /* sparse hole or irregular chunk */
        if (chunk->flags & (sparse | no_power_2)) {
            List_chunk *next;

            /* add next sparse or no_power_2 chunks up so that get_chunk will
             * skip this range of chunks, when the idx is beyond this block. */
            for (next = chunk->next; next; next = next->next)
                if (next->flags & (sparse | no_power_2)) {
                    chunk->n_chunks++;
                    chunk->n_items += next->items;
                }
                else
                    break;
            first = chunk->next;
            list->grow_policy = enum_grow_mixed;
            continue;
        }
        /* clear flag, next chunks will tell what comes */
        chunk->flags = enum_grow_unknown;
        if (first && first != chunk) {
            /* constant chunk block */
            if (first->items == chunk->items) {
                first->n_chunks++;
                first->n_items += chunk->items;
                first->flags = fixed_items;
                /* TODO optimize for fixed but non MAX_ITEMS lists */
                if (first->items == MAX_ITEMS)
                    list->grow_policy |= enum_grow_fixed;
                else
                    list->grow_policy |= enum_grow_mixed;
            }
            /* growing chunk block could optimize small growing blocks, they
             * are probably not worth the effort. */
            else if (prev->items == chunk->items >> 1) {
                first->n_chunks++;
                first->n_items += chunk->items;
                first->flags = grow_items;
                list->grow_policy |= enum_grow_growing;
            }
            /* different growing scheme starts here */
            else {
                first = chunk;
            }
        }
        prev = chunk;
    }
    /* if we have some mixture of grow_policies, then set it to _mixed */
    if (list->grow_policy && list->grow_policy != enum_grow_growing &&
            list->grow_policy != enum_grow_fixed)
        list->grow_policy = enum_grow_mixed;
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interpreter);
    return len;
}

/*

=item C<static List_chunk *
alloc_next_size(Interp *interpreter, List *list, int where, UINTVAL idx)>

Calculate size and items for next chunk and allocate it.

=cut

*/

static List_chunk *
alloc_next_size(Interp *interpreter, List *list, int where, UINTVAL idx)
{
    UINTVAL items, size;
    List_chunk *new_chunk;
    int much = idx - list->cap >= MIN_ITEMS;
    int do_sparse = (INTVAL)idx - (INTVAL)list->cap >= 10 * MAX_ITEMS;

    if (list->item_type == enum_type_sized) {
        items = list->items_per_chunk;
        size = items * list->item_size;
        list->grow_policy = items == MAX_ITEMS ?
            enum_grow_fixed : enum_grow_mixed;
        do_sparse = 0;
    }
    else if (do_sparse) {
        assert(where);
        /* don't add sparse chunk at start of list */
        if (!list->n_chunks) {
            list->grow_policy = enum_grow_fixed;
            /* if wee need more, the next allocation will allocate the rest */
            items = MAX_ITEMS;
            size = items * list->item_size;
            do_sparse = 0;
        }
        else {
            items = idx - list->cap - 1;
            /* round down this function will then be called again, to add the
             * final real chunk, with the rest of the needed size */
            items &= ~(MAX_ITEMS - 1);
            list->grow_policy = enum_grow_mixed;
            /* allocate a dummy chunk holding many items virtually */
            size = list->item_size;
        }
    }
    /* initial size for empty lists grow_policy is not yet known or was
     * different */
    else if (!list->cap) {
#ifdef ONLY_FIXED_ALLOCATIONS
        list->grow_policy = enum_grow_fixed;
#else
        list->grow_policy = enum_grow_unknown;
#endif
        /* more then MIN_ITEMS, i.e. indexed access beyond length */
        if (much) {
            list->grow_policy = enum_grow_fixed;
            items = MAX_ITEMS;
        }
        else {
            /* TODO make bigger for small items like char */
            items = MIN_ITEMS;
        }
        size = items * list->item_size;
    }
    else {
        if (list->grow_policy & (enum_grow_fixed | enum_grow_mixed))
            items = MAX_ITEMS;
        else {
            items = where ? list->last->items : list->first->items;
            /* push: allocate at end, more if possbile */
            if (where) {
                if (items < MAX_ITEMS) {
                    items <<= 1;
                    list->grow_policy = enum_grow_growing;
                }
            }
            /* unshift: if possible, make less items */
            else {
                list->grow_policy = enum_grow_growing;
                if (items > MIN_ITEMS)
                    items >>= 1;        /* allocate less */
                /* if not: second allocation from unshift */
                else {
                    list->grow_policy = enum_grow_mixed;
                    items = MAX_ITEMS;
                }
            }
        }
        size = items * list->item_size;
    }
    new_chunk = allocate_chunk(interpreter, list, items, size);
    list->cap += items;
    if (do_sparse)
        new_chunk->flags |= sparse;
    return new_chunk;
}

/*

=item C<static List_chunk *
add_chunk(Interp *interpreter, List *list, int where, UINTVAL idx)>

Add chunk at start or end.

=cut

*/

static List_chunk *
add_chunk(Interp *interpreter, List *list, int where, UINTVAL idx)
{
    List_chunk *chunk = where ? list->last : list->first;
    List_chunk *new_chunk;

    new_chunk = alloc_next_size(interpreter, list, where, idx);

    if (where) {                /* at end */
        if (chunk)
            chunk->next = new_chunk;
        list->last = new_chunk;
        if (!list->first)
            list->first = new_chunk;
    }
    else {
        new_chunk->next = chunk;
        list->first = new_chunk;
        if (!list->last)
            list->last = new_chunk;
    }
    rebuild_chunk_list(interpreter, list);
    return new_chunk;
}

/*

=item C<UINTVAL
ld(UINTVAL x)>

Calculates log2(x).

Stolen from F<src/malloc.c>.

=cut

*/

UINTVAL
ld(UINTVAL x)
{
    UINTVAL m;                  /* bit position of highest set bit of m */

    /* On intel, use BSRL instruction to find highest bit */
#if defined(__GNUC__) && defined(i386)

  __asm__("bsrl %1,%0\n\t":"=r"(m)
  :        "g"(x));

#else
    {
        /*
         * Based on branch-free nlz algorithm in chapter 5 of Henry S. Warren
         * Jr's book "Hacker's Delight". */

        unsigned int n = ((x - 0x100) >> 16) & 8;

        x <<= n;
        m = ((x - 0x1000) >> 16) & 4;
        n += m;
        x <<= m;
        m = ((x - 0x4000) >> 16) & 2;
        n += m;
        x = (x << m) >> 14;
        m = 13 - n + (x & ~(x >> 1));
    }
#endif
    return m;
}

/*

=item C<static List_chunk *
get_chunk(Interp *interpreter, List *list, UINTVAL *idx)>

Get the chunk for C<idx>, also update the C<idx> to point into the chunk.

This routine will be called for every operation on list, so its
optimized to be fast and needs an up to date chunk statistic, that
C<rebuild_chunk_list> does provide.

The scheme of operations is:

    if all_chunks_are_MAX_ITEMS
         chunk = chunk_list[ idx / MAX_ITEMS ]
         idx =   idx % MAX_ITEMS
         done.
    
    chunk = first
    repeat
         if (index < chunk->items)
             done.
    
     if (index >= items_in_chunk_block)
         index -= items_in_chunk_block
         chunk += chunks_in_chunk_block
         continue
    
     calc chunk and index in this block
     done.

One chunk_block consists of chunks of the same type: fixed, growing or
other. So the time to look up a chunk doesn't depend on the array
length, but on the complexity of the array. C<rebuild_chunk_list> tries
to reduce the complexity, but may fail, if you e.g. do a prime sieve by
actually C<list_delet>ing the none prime numbers.

The complexity of the array is how many different C<chunk_blocks> are
there. They come from:

- initially fixed: 1

- initially growing: 2

- first unshift: 1 except for initially fixed arrays

- insert: 1 - 3

- delete: 1 - 2

- sparse hole: 3 (could be 2, code assumes access at either end now)

There could be some optimizer, that, after detecting almost only indexed
access after some time, does reorganize the array to be all C<MAX_ITEMS>
sized, when this would improve performance.

=cut

*/

static List_chunk *
get_chunk(Interp *interpreter, List *list, UINTVAL *idx)
{
    List_chunk *chunk;
    UINTVAL i;

#ifndef GC_IS_MALLOC
    if (list->collect_runs != interpreter->collect_runs)
        rebuild_chunk_list(interpreter, list);
#endif
#ifdef SLOW_AND_BORING
    for (chunk = list->first; chunk; chunk = chunk->next) {
        if (*idx < chunk->items)
            return chunk;
        *idx -= chunk->items;
    }
    internal_exception(INTERNAL_PANIC, "list structure chaos!\n");
#endif


    /* fixed sized chunks - easy: all MAX_ITEMS sized */
    if (list->grow_policy == enum_grow_fixed) {
        chunk = chunk_list_ptr(list, *idx >> LD_MAX);
        *idx &= MAX_MASK;
        return chunk;
    }

    /* else look at chunks flags, what grow type follows and adjust chunks and
     * idx */
    for (i = 0, chunk = list->first; chunk;) {
        /* if we have no more items, we have found the chunk */
        if (*idx < chunk->items)
            return chunk;

        /* now look, if we can use the range of items in chunk_block: if idx
         * is beyond n_items, skip n_chunks */
        if (*idx >= chunk->n_items) {
            i += chunk->n_chunks;
            *idx -= chunk->n_items;
            chunk = chunk_list_ptr(list, i);
            continue;
        }
        /* we are inside this range of items */
        if (chunk->flags & fixed_items) {
            /* all chunks are chunk->items big, a power of 2 */
            chunk = chunk_list_ptr(list, i + (*idx >> ld(chunk->items)));
            *idx &= chunk->items - 1;
            return chunk;
        }

/*
 * Here is a small table, providing the basics of growing sized
 * addressing, for people like me, who's math lessons are +30 years
 * in the past ;-)
 * assuming MIN_ITEMS=4
 *
 * ch#  size    idx     +4      bit             ld2(idx) -ld2(4)
 *
 * 0    4       0..3    4..7    0000 01xx       2       0
 * 1    8       4..11   8..15   0000 1xxx       3       1
 * 2    16      12..27  16..31  0001 xxxx       4       2
 * ...
 * 8    1024    1020..  ...2047                 10      8
 */

        if (chunk->flags & grow_items) {
            /* the next chunks are growing from chunk->items ... last->items */
            UINTVAL ld_first, slot;

            ld_first = ld(chunk->items);
            slot = ld(*idx + chunk->items) - ld_first;
            /* we are in this growing area, so we are done */
            assert(slot < chunk->n_chunks);
            *idx -= (1 << (ld_first + slot)) - chunk->items;
            return chunk_list_ptr(list, i + slot);
        }

        if (chunk->flags & (sparse | no_power_2)) {
            /* these chunks hold exactly chunk->items */
            *idx -= chunk->items;
            i++;
            chunk = chunk->next;
            continue;
        }
        internal_exception(INTERNAL_PANIC, "list structure chaos!\n");
    }
    internal_exception(INTERNAL_PANIC, "list structure chaos!\n");
    return 0;
}

/*

=item C<static void
split_chunk(Interp *interpreter, List *list, List_chunk *chunk, UINTVAL ix)>

Split a sparse chunk, so that we have

- allocated space at C<idx>

if sparse is big:

- C<MAX_ITEMS> near C<idx> and if there is still sparse space after the
real chunk, this also C<n*MAX_ITEMS> sized, so that consecutive writing
would make C<MAX_ITEMS> sized real chunks.

=cut

*/

static void
split_chunk(Interp *interpreter, List *list, List_chunk *chunk, UINTVAL ix)
{
    List_chunk *new_chunk;
    INTVAL n1, n2, n3, idx = ix;

    /* allocate space at idx */
    if (chunk->items <= MAX_ITEMS) {
        /* it fits, just allocate */
        Parrot_reallocate(interpreter, (Buffer *)chunk,
                chunk->items * list->item_size);
        chunk->flags |= no_power_2;
        chunk->flags &= ~sparse;
    }
    else {
        /* split chunk->items: n3 = n*MAX_ITEMS after chunk n2 = MAX_ITEMS
         * chunk n1 = rest before */
        n2 = MAX_ITEMS;
        n3 = ((chunk->items - idx) / MAX_ITEMS) * MAX_ITEMS;
        n1 = chunk->items - n2 - n3;
        chunk->items = n2;
        Parrot_reallocate(interpreter, (Buffer *)chunk,
                chunk->items * list->item_size);
        chunk->flags &= ~sparse;
        if (n3) {
            new_chunk = allocate_chunk(interpreter, list, n3, list->item_size);
            new_chunk->flags |= sparse;
            new_chunk->next = chunk->next;
            if (chunk->next)
                chunk->next = new_chunk;
            else
                list->last = new_chunk;
        }
        /* size before idx */
        if (n1 > 0) {
            /* insert a new sparse chunk before this one */
            new_chunk = allocate_chunk(interpreter, list, n1, list->item_size);
            new_chunk->flags |= sparse;
            new_chunk->next = chunk;
            if (chunk->prev)
                chunk->prev->next = new_chunk;
            else
                list->first = new_chunk;
        }
    }

    rebuild_chunk_list(interpreter, list);
}

/*

=item C<static void
list_set(Interp *interpreter, List *list, void *item, INTVAL type, INTVAL idx)>

Set C<item> of type C<type> in chunk at C<idx>.

=cut

*/

static void
list_set(Interp *interpreter, List *list, void *item, INTVAL type, INTVAL idx)
{
    INTVAL oidx = idx;
    List_chunk *chunk;

    chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
    assert(chunk);
    /* if this is a sparse chunk: split in possibly 2 sparse parts before and
     * after then make a real chunk, rebuild chunk list and set item */
    if (chunk->flags & sparse) {
        split_chunk(interpreter, list, chunk, idx);
        /* reget chunk and idx */
        idx = oidx;
        chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
        assert(chunk);
        assert(!(chunk->flags & sparse));
    }

    switch (type) {
    case enum_type_sized:
        /* copy data into list */
        memcpy(&((char *)chunk->data.bufstart)[idx * list->item_size],
                item, list->item_size);
        break;
    case enum_type_char:
        ((char *)chunk->data.bufstart)[idx] = (char)PTR2INTVAL(item);
        break;
    case enum_type_short:
        ((short *)chunk->data.bufstart)[idx] = (short)PTR2INTVAL(item);
        break;
    case enum_type_int:
        ((int *)chunk->data.bufstart)[idx] = (int)PTR2INTVAL(item);
        break;
    case enum_type_INTVAL:
        ((INTVAL *)chunk->data.bufstart)[idx] = PTR2INTVAL(item);
        break;
    case enum_type_FLOATVAL:
        ((FLOATVAL *)chunk->data.bufstart)[idx] = *(FLOATVAL *)item;
        break;
    case enum_type_PMC:
        ((PMC **)chunk->data.bufstart)[idx] = (PMC *)item;
        break;
    case enum_type_STRING:
        ((STRING **)chunk->data.bufstart)[idx] = (STRING *)item;
        break;
    default:
        internal_exception(1, "Unknown list entry type\n");
        break;
    }
}

/*

=item C<static void *
list_item(Interp *interpreter, List *list, int type, INTVAL idx)>

Get the pointer to the item of type C<type> in the chunk at C<idx>.

=cut

*/

static void *
list_item(Interp *interpreter, List *list, int type, INTVAL idx)
{
    List_chunk *chunk;

    chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
    /* if this is a sparse chunk return -1, the caller may decide to return 0
     * or undef or whatever */
    if (chunk->flags & sparse) {
#ifdef INTLIST_EMUL
        static int null = 0;

        return (void *)&null;
#else
        return (void *)-1;
#endif
    }

    switch (type) {
    case enum_type_sized:
        return (void *)&((char *)chunk->data.bufstart)[idx * list->item_size];
        break;
    case enum_type_char:
        return (void *)&((char *)chunk->data.bufstart)[idx];
        break;
    case enum_type_short:
        return (void *)&((short *)chunk->data.bufstart)[idx];
        break;
    case enum_type_int:
        return (void *)&((int *)chunk->data.bufstart)[idx];
        break;
    case enum_type_INTVAL:
        return (void *)&((INTVAL *)chunk->data.bufstart)[idx];
        break;
    case enum_type_FLOATVAL:
        return (void *)&((FLOATVAL *)chunk->data.bufstart)[idx];
        break;
    case enum_type_PMC:
        return (void *)&((PMC **)chunk->data.bufstart)[idx];
        break;
    case enum_type_STRING:
        return (void *)&((STRING **)chunk->data.bufstart)[idx];
        break;
    default:
        internal_exception(1, "Unknown list entry type\n");
        break;
    }
    return 0;

}

/*

=item C<static void
list_append(Interp *interpreter, List *list, void *item, int type, UINTVAL idx)>

Add one or more chunks to end of list.

=cut

*/

static void
list_append(Interp *interpreter, List *list, void *item, int type, UINTVAL idx)
{
    /* initially, list may be empty, also used by assign */
    while (idx >= list->cap)
        add_chunk(interpreter, list, enum_add_at_end, idx);
    list_set(interpreter, list, item, type, idx);
    /* invariant: prepare for next push */
    if (idx >= list->cap - 1)
        add_chunk(interpreter, list, enum_add_at_end, 0);
}

/*

=back

=head2 Public Interface Functions

=over 4

=item C<List *
list_new(Interp *interpreter, INTVAL type)>

Returns a new list of type C<type>.

=cut

*/

List *
list_new(Interp *interpreter, INTVAL type)
{
    List *list;

    list = (List *)new_bufferlike_header(interpreter, sizeof(*list));
    list->item_type = type;
    switch (type) {
    case enum_type_sized:       /* gets overridden below */
    case enum_type_char:
        list->item_size = sizeof(char);
        break;
    case enum_type_short:
        list->item_size = sizeof(short);
        break;
    case enum_type_int:
        list->item_size = sizeof(int);
        break;
    case enum_type_INTVAL:
        list->item_size = sizeof(INTVAL);
        break;
    case enum_type_FLOATVAL:
        list->item_size = sizeof(FLOATVAL);
        break;
    case enum_type_PMC:
        list->item_size = sizeof(PMC *);
        break;
    case enum_type_STRING:
        list->item_size = sizeof(STRING *);
        break;
    default:
        internal_exception(1, "Unknown list type\n");
        break;
    }
    return list;
}

/*

=item C<List *
list_new_init(Interp *interpreter, INTVAL type, PMC *init)>

C<list_new_init()> uses these initializers:

    0 ... size (set initial size of list)
    1 ... array dimensions (multiarray)
    2 ... type (overriding type parameter)
    3 ... item_size for enum_type_sized
    4 ... items_per_chunk

After getting these values out of the key/value pairs, a new array with
these values is stored in user_data, where the keys are explicit.

=cut

*/

List *
list_new_init(Interp *interpreter, INTVAL type, PMC *init)
{
    List *list;
    PMC * user_array, *multi_key;
    INTVAL i, len, size, key, val, item_size, items_per_chunk;

    if (!init->vtable ||
            ((init->vtable->base_type != enum_class_PerlArray) &&
             (init->vtable->base_type != enum_class_SArray) &&
             (init->vtable->base_type != enum_class_Array)))
        internal_exception(1, "Illegal initializer for init\n");
    len = VTABLE_elements(interpreter, init);
    if (len & 1)
        internal_exception(1, "Illegal initializer for init: odd elements\n");

    size = item_size = items_per_chunk = 0;
    multi_key = NULL;
    for (i = 0; i < len; i += 2) {
        key = VTABLE_get_integer_keyed_int(interpreter, init, i);
        val = i + 1;
        switch (key) {
            case 0:
                size = VTABLE_get_integer_keyed_int(interpreter,
                        init, val);
                break;
            case 1:
                multi_key = VTABLE_get_pmc_keyed_int(interpreter,
                        init, val);
                break;
            case 2:
                type = VTABLE_get_integer_keyed_int(interpreter,
                        init, val);
                break;
            case 3:
                item_size = VTABLE_get_integer_keyed_int(interpreter,
                        init, val);
                break;
            case 4:
                items_per_chunk = VTABLE_get_integer_keyed_int(
                        interpreter, init, val);
                break;
        }
    }
    list = list_new(interpreter, type);
    if (list->item_type == enum_type_sized) { /* overridde item_size */
        if (!item_size)
            internal_exception(1, "No item_size for type_sized list\n");
        list->item_size = item_size;
        if (items_per_chunk) {
            /* make power of 2 */
            items_per_chunk = 1 << (ld(items_per_chunk) + 1);
            list->items_per_chunk = items_per_chunk;
        }
        else
            list->items_per_chunk = MAX_ITEMS;
    }
    if (size)
        list_set_length(interpreter, list, size);
    /* make a private copy of init data */
    list->user_data = user_array = pmc_new(interpreter, enum_class_SArray);
    /* set length */
    VTABLE_set_integer_native(interpreter, user_array, 2);
    /* store values */
    VTABLE_set_integer_keyed_int(interpreter, user_array, 0,  size);
    VTABLE_set_pmc_keyed_int(interpreter, user_array, 1, multi_key);
    return list;
}

/*

=item C<List *
list_clone(Interp *interpreter, List *other)>

Return a clone of the list.

TODO - Barely tested. Optimize new array structure, fixed if big.

=cut

*/

List *
list_clone(Interp *interpreter, List *other)
{
    List *l;
    List_chunk *chunk, *prev, *new_chunk;
    UINTVAL i;
    PMC *op;
    STRING *s;

    Parrot_block_DOD(interpreter);
    Parrot_block_GC(interpreter);

    l = list_new(interpreter, other->item_type);
    mem_sys_memcopy(l, other, sizeof(List));
    l->chunk_list.buflen = 0;
    l->chunk_list.bufstart = 0;

    for (chunk = other->first, prev = 0; chunk; chunk = chunk->next) {
        new_chunk = allocate_chunk(interpreter, l,
                chunk->items, chunk->data.buflen);
        new_chunk->flags = chunk->flags;
        if (!prev)
            l->first = new_chunk;
        else
            prev->next = new_chunk;
        prev = new_chunk;

        if (!(new_chunk->flags & sparse)) {
            switch (l->item_type) {
            case enum_type_PMC:
                for (i = 0; i < chunk->items; i++) {
                    op = ((PMC **)chunk->data.bufstart)[i];
                    if (op) {
                        ((PMC **)new_chunk->data.bufstart)[i] =
                            VTABLE_clone(interpreter, op);
                    }
                }
                break;
            case enum_type_STRING:
                for (i = 0; i < chunk->items; i++) {
                    s = ((STRING **)chunk->data.bufstart)[i];
                    if (s) {
                        ((STRING **)new_chunk->data.bufstart)[i] =
                                string_copy(interpreter, s);
                    }
                }
                break;
            default:
                mem_sys_memcopy(new_chunk->data.bufstart,
                        chunk->data.bufstart, chunk->data.buflen);
                break;
            }
        }
    }
    if (other->user_data) {
        l->user_data = VTABLE_clone(interpreter, other->user_data);
    }
    rebuild_chunk_list(interpreter, l);
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interpreter);
    return l;
}

/*

=item C<void
list_mark(Interp *interpreter, List *list)>

Mark the list and its contents as live.

=cut

*/

void
list_mark(Interp *interpreter, List *list)
{
    List_chunk *chunk;
    PObj *p;
    UINTVAL i;

    for (chunk = list->first; chunk; chunk = chunk->next) {
        pobject_lives(interpreter, (PObj *)chunk);
        if (list->item_type == enum_type_PMC ||
                list->item_type == enum_type_STRING) {
            if (!(chunk->flags & sparse))
                for (i = 0; i < chunk->items; i++) {
                    p = ((PObj **)chunk->data.bufstart)[i];
                    if (p)
                        pobject_lives(interpreter, p);
                }

        }
    }
    pobject_lives(interpreter, (PObj *)list);
    if (list->user_data)
        pobject_lives(interpreter, (PObj *) list->user_data);
}

/*

=item C<void
list_visit(Interp *interpreter, List *list, void *pinfo)>

This is used by freeze/thaw to visit the contents of the list.

C<pinfo> is the visit info, (see include/parrot/pmc_freeze.h>).

=cut

*/

void
list_visit(Interp *interpreter, List *list, void *pinfo)
{
    List_chunk *chunk;
    visit_info *info = (visit_info*) pinfo;
    UINTVAL i, idx, n;
    PMC **pos;

    n = list_length(interpreter, list);
    assert (list->item_type == enum_type_PMC);
    /* TODO intlist ... */
    for (idx = 0, chunk = list->first; chunk; chunk = chunk->next) {
        /* TODO deleted elements */
        if (!(chunk->flags & sparse)) {
            for (i = 0; i < chunk->items && idx < n; i++, idx++) {
                pos = ((PMC **)chunk->data.bufstart) + i;
                info->thaw_ptr = pos;
                (info->visit_pmc_now)(interpreter, *pos, info);
            }
        }
        /*
         * TODO handle sparse
         */
    }
}

/*

=item C<INTVAL
list_length(Interp *interpreter, List *list)>

Returns the length of the list.

=cut

*/

INTVAL
list_length(Interp *interpreter, List *list)
{
    UNUSED(interpreter);
    return list->length;
}

/*

=item C<void
list_set_length(Interp *interpreter, List *list, INTVAL len)>

Sets the length of the list to C<len>.

=cut

*/

void
list_set_length(Interp *interpreter, List *list, INTVAL len)
{
    UINTVAL idx;

    if (len < 0)
        len += list->length;
    if (len >= 0) {
        idx = list->start + (UINTVAL)len;
        list->length = len;
        if (idx >= list->cap) {
            /* assume user will fill it, so don't generate sparse
             * chunks
             */
            if (!list->cap && idx > MAX_ITEMS) {
                while (idx - MAX_ITEMS >= list->cap) {
                    add_chunk(interpreter, list, enum_add_at_end,
                            list->cap + MAX_ITEMS);
                }
            }

            list_append(interpreter, list, 0, list->item_type, idx);
        }
        else {
            rebuild_chunk_ptrs(list, 1);
        }
        rebuild_chunk_list(interpreter, list);
    }
}

/*

=item C<void
list_insert(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items)>

Make room for C<n_items> at C<idx>.

=cut

*/

void
list_insert(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items)
{
    List_chunk *chunk, *new_chunk, *rest;

    INTVAL items;

    assert(idx >= 0);
    idx += list->start;
    assert(n_items >= 0);
    if (n_items == 0)
        return;
    /* empty list */
    if (!list->cap) {
        idx += n_items;
        list->length = idx;
        while (idx >= (INTVAL)list->cap)
            add_chunk(interpreter, list, enum_add_at_end, idx);
        return;
    }
    list->length += n_items;
    list->cap += n_items;
    chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
    /* the easy case: */
    if (chunk->flags & sparse)
        chunk->items += n_items;
    else {
        /* 1. cut this chunk at idx */
        list->grow_policy = enum_grow_mixed;
        /* allocate a sparse chunk, n_items big */
        new_chunk = allocate_chunk(interpreter, list, n_items,
                list->item_size);
        new_chunk->flags |= sparse;
        items = chunk->items - idx;
        if (items) {
            /* allocate a small chunk, holding the rest of chunk beyond idx */
            chunk->flags = no_power_2;
            rest = allocate_chunk(interpreter, list, items,
                    items * list->item_size);
            rest->flags |= no_power_2;
            /* hang them together */
            rest->next = chunk->next;
            chunk->next = new_chunk;
            new_chunk->next = rest;
            /* copy data over */
            mem_sys_memmove(
                    (char *)rest->data.bufstart,
                    (char *)chunk->data.bufstart + idx * list->item_size,
                    items * list->item_size);
        }
        else {
            new_chunk->next = chunk->next;
            chunk->next = new_chunk;
        }
        chunk->items = idx;
    }
    rebuild_chunk_list(interpreter, list);
}

/*

=item C<void
list_delete(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items)>

Delete C<n_items> at C<idx>.

=cut

*/

void
list_delete(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items)
{
    List_chunk *chunk;

    assert(idx >= 0);
    assert(n_items >= 0);
    if (n_items == 0)
        return;
    idx += list->start;
    chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
    /* deleting beyond end? */
    if (idx + n_items > (INTVAL)list->length)
        n_items = list->length - idx;
    list->length -= n_items;
    list->cap -= n_items;
    list->grow_policy = enum_grow_mixed;
    while (n_items > 0) {
        if (idx + n_items <= (INTVAL)chunk->items) {
            /* chunk is bigger then we want to delete */
            if (!(chunk->flags & sparse)) {
                chunk->flags = no_power_2;
                if (idx + n_items <= (INTVAL)chunk->items) {
#ifdef __LCC__
                    /* LCC has a bug where it can't handle all the temporary
                     * variables created in this one line.  adding an explicit
                     * one fixes things.  No need to force this workaround on
                     * less brain-damaged compilers though */
                    size_t tmp_size = (chunk->items - idx - n_items) *
                            list->item_size;

                    mem_sys_memmove(
                            (char *)chunk->data.bufstart +
                            idx * list->item_size,
                            (char *)chunk->data.bufstart +
                            (idx + n_items) * list->item_size, tmp_size);
#else
                    mem_sys_memmove(
                            (char *)chunk->data.bufstart +
                            idx * list->item_size,
                            (char *)chunk->data.bufstart +
                            (idx + n_items) * list->item_size,
                            (chunk->items - idx - n_items) * list->item_size);
#endif
                }
            }
            chunk->items -= n_items;
            break;
        }
        if (idx == 0 && n_items >= (INTVAL)chunk->items) {
            /* delete this chunk */
            n_items -= chunk->items;
            /* rebuild_chunk_list will kill it because: */
            chunk->items = 0;
            if (!chunk->prev)
                list->first = chunk->next;
        }
        else if (idx) {
            /* else shrink chunk, it starts at idx then */
            if (!(chunk->flags & sparse))
                chunk->flags = no_power_2;
            n_items -= chunk->items - idx;
            chunk->items = idx;
        }
        idx = 0;
        chunk = chunk->next;
    }
    rebuild_chunk_ptrs(list, 1);
    rebuild_chunk_list(interpreter, list);
}

/*

=item C<void
list_push(Interp *interpreter, List *list, void *item, int type)>

Pushes C<item> of type C<type> on to the end of the list.

=cut

*/

void
list_push(Interp *interpreter, List *list, void *item, int type)
{
    INTVAL idx = list->start + list->length++;

    list_append(interpreter, list, item, type, idx);
}

/*

=item C<void
list_unshift(Interp *interpreter, List *list, void *item, int type)>

Pushes C<item> of type C<type> on to the start of the list.

=cut

*/

void
list_unshift(Interp *interpreter, List *list, void *item, int type)
{
    List_chunk *chunk;

    if (list->start == 0) {
        chunk = add_chunk(interpreter, list, enum_add_at_start, 0);
        list->start = chunk->items;
    }
    else
        chunk = list->first;
    list_set(interpreter, list, item, type, --list->start);
    list->length++;
}

/*

=item C<void *
list_pop(Interp *interpreter, List *list, int type)>

Removes and returns the last item of type C<type> from the end of the list.

=cut

*/

void *
list_pop(Interp *interpreter, List *list, int type)
{
    UINTVAL idx;
    void *ret;
    List_chunk *chunk = list->last;

    if (list->length == 0) {
        return 0;
    }
    idx = list->start + --list->length;
    if (list->length == 0)
        list->start = 0;

    /* shrink array if necessary */
    if (idx < list->cap - chunk->items) {
        list->cap -= chunk->items;
        chunk = list->last = chunk->prev;
        chunk->next = 0;
        if (list->n_chunks <= 2)
            list->first = list->last;
        rebuild_chunk_list(interpreter, list);
    }
    ret = list_item(interpreter, list, type, idx);
    return ret;
}

/*

=item C<void *
list_shift(Interp *interpreter, List *list, int type)>

Removes and returns the first item of type C<type> from the start of the list.

=cut

*/

void *
list_shift(Interp *interpreter, List *list, int type)
{
    void *ret;
    UINTVAL idx = list->start++;
    List_chunk *chunk = list->first;

    if (list->length == 0) {
        return 0;
    }
    list->length--;
    /* optimize push + shift on empty lists */
    if (list->length == 0)
        list->start = 0;
    ret = list_item(interpreter, list, type, idx);
    if (list->start >= chunk->items) {
        list->cap -= chunk->items;
        chunk = list->first = chunk->next ? chunk->next : list->last;
        list->start = 0;
        rebuild_chunk_list(interpreter, list);
        if (list->n_chunks == 1)
            list->last = list->first;
    }
    return ret;
}

/*

=item C<void
list_assign(Interp *interpreter, List *list, INTVAL idx, void *item, int type)>

Assigns C<item> of type C<type> to index C<idx>.

=cut

*/

void
list_assign(Interp *interpreter, List *list, INTVAL idx, void *item, int type)
{
    INTVAL length = list->length;

    if (idx < -length)
        idx = -idx - length - 1;
    else if (idx < 0)
        idx += length;
    if (idx >= length) {
        list_append(interpreter, list, item, type, list->start + idx);
        list->length = idx + 1;
    }
    else {
        list_set(interpreter, list, item, type, list->start + idx);
    }
}

/*

=item C<void *
list_get(Interp *interpreter, List *list, INTVAL idx, int type)>

Returns the item of type C<type> at index C<idx>.

=cut

*/

void *
list_get(Interp *interpreter, List *list, INTVAL idx, int type)
{
    INTVAL length = list->length;

    if (idx >= length || -idx > length) {
        return 0;
    }

    if (idx < 0)
        idx += length;
    idx += list->start;
    return list_item(interpreter, list, type, idx);
}

/*

=item C<void
list_splice(Interp *interpreter, List *list, PMC *value, INTVAL offset,
        INTVAL count)>

Replaces C<count> items starting at C<offset> with the items in C<value>.

If C<count> is 0 then the items in C<value> will be inserted after C<offset>.

=cut

*/

void
list_splice(Interp *interpreter, List *list, PMC *value, INTVAL offset,
        INTVAL count)
{
    List *value_list = value ? (List *)PMC_data(value): NULL;
    INTVAL value_length = value_list ? value_list->length : 0;
    INTVAL length = list->length;
    INTVAL i, j;
    int type = list->item_type;

    if (value_list && type != value_list->item_type)
        internal_exception(1, "Item type mismatch in splice\n");

    /* start from end */
    if (offset < 0)
        offset += length;
    if (offset < 0)
        internal_exception(OUT_OF_BOUNDS, "illegal splice offset\n");
    /* "leave that many elements off the end of the array" */
    if (count < 0)
        count += length - offset + 1;
    if (count < 0)
        count = 0;

    /* replace count items at offset with values */
    for (i = j = 0; i < count && j < value_length; i++, j++) {
        void *val = list_get(interpreter, value_list, j, type);

        /* no clone here, if the HL want's to reuse the values, the HL has to
         * clone the values */
        if (type == enum_type_PMC)
            val = *(PMC **)val;
        else if (type == enum_type_STRING)
            val = *(STRING **)val;
        list_assign(interpreter, list, offset + i, val, type);
    }
    /* if we still have values in value_list, insert them */
    if (j < value_length) {
        /* make room for the remaining values */
        list_insert(interpreter, list, offset + i, value_length - j);
        for (; j < value_length; i++, j++) {
            void *val = list_get(interpreter, value_list, j, type);

            if (type == enum_type_PMC)
                val = *(PMC **)val;
            else if (type == enum_type_STRING)
                val = *(STRING **)val;
            list_assign(interpreter, list, offset + i, val, type);
        }
    }
    else {
        /* else delete the rest */
        list_delete(interpreter, list, offset + i, count - i);
    }
}

/*

=back

=head1 HISTORY

=over 4

=item * 1.1

10.10.2002 Initial version.

=item * 1.2

11.10.2002 More documentation, optimized irregular chunk blocks,
fixed indexed access WRT C<<list->start>>, cosmetics.

=item * 1.3

13.10.2002 Put C<intlist_length> into F<src/intlist.c>.

=item * 1.4

16.10.2002 Integrated list in parrot/arrays.

=item * 1.5

17.10.2002 Clone integral data (intlist).

=item * 1.6

18.10.2002 Moved tests to C<t/src/list.t>.

=item * 1.7

19.10.2002 Set intial length (C<new_init>).

=item * 1.8

21.10.2002 C<gc_debug> stuff.

=item * 1.9

21.10.2002 splice.

=item * 1.10

22.10.2002 Update comment WRT clone in splice.

=item * 1.11

26.10.2002 C<user_data>

=item * 1.18

Fixes.

=item * 1.19

08.11.2002 arbitrary sized items (C<enum_type_sized>).

=item * 1.26

08.01.2003 move C<Chunk_list> flags out of buffer header.

=item * 1.29

Join chunks > C<MAX_ITEMS> (Matt Fowles)

=item * 1.30

Greater threshold before C<do_sparse()>. Setting initial size to avoid
sparse

=item * 1.33 

04.07.2003 Use a SArray for user_data

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
