#define INTLIST_EMUL
/* grrmml */
#define intlist_length xx_x

#include "parrot/parrot.h"
#ifdef LIST_TEST
#define LIST_DEBUG
#include "parrot/embed.h"
#undef INTLIST_EMUL
#endif

#undef  intlist_length
#define intlist_length intlist_length

#include <limits.h>

typedef enum {
    enum_type_undef,
    enum_type_bit,
    enum_type_char,
    enum_type_short,
    enum_type_int,
    enum_type_ptr,
    enum_type_INTVAL,
    enum_type_FLOATVAL,
    enum_type_PMC,
    enum_type_STRING,
} ARRAY_ENTRY_TYPE;

typedef struct List_chunk {
    Buffer data;                /* item store */
    UINTVAL items;              /* items in this chunk */
    UINTVAL n_chunks;           /* # of chunks with grow policy in flags */
    UINTVAL n_items;            /* # of itemks with grow policy in flags */
    struct List_chunk *next;
    struct List_chunk *prev;
} List_chunk;

#define sparse_flag BUFFER_private0_FLAG
#define no_power_2  BUFFER_private1_FLAG
#define fixed_items BUFFER_private2_FLAG
#define grow_items BUFFER_private3_FLAG

typedef struct List {
    Buffer chunk_list;          /* pointers to chunks */
    UINTVAL length;             /* number of items in list */
    UINTVAL start;		/* offset, where array[0] is */
    int item_type;	        /* item type */
    int item_size;		/* item size */
    UINTVAL cap;                /* list capacity in items */
    int grow_policy;            /* fixed / variable len */
    UINTVAL collect_runs;       /* counter, when chunklist was built */
    UINTVAL n_chunks;           /* number of chunks */
    List_chunk *first;	        /* first chunk holding data */
    List_chunk *last;	        /* last chunk */
} List;

enum {
    enum_grow_unknown,          /* at beginning, or after emptying list */
    enum_grow_fixed = 1,        /* fixed maximum size */
    enum_grow_mixed = 2,        /* other */
    enum_grow_growing = 4,      /* growing at begin of list */
} ARRAY_GROW_TYPE;

enum {
    enum_add_at_start,          /* don't swap these */
    enum_add_at_end
} ARRAY_ADD_POS;


#define MIN_ITEMS 4		/* smallest chunk can hold */
#ifdef LIST_TEST
#define LD_MAX 4                /* log2(MAX_ITEMS) */
#define MAX_ITEMS 16  	        /* biggest chunk can hold */
#else
#define LD_MAX 10               /* log2(MAX_ITEMS) */
#define MAX_ITEMS 1024  	/* biggest chunk can hold */
#endif
#define MAX_MASK (MAX_ITEMS-1)

/*
 * bigger MAX_ITEMS didn't improve much in my tests
 * 10^6 list_get, MAX_ITEMS 1024: 0.34s, 2048: 0.33s
 */

List * list_new(Interp *interpreter, INTVAL type);
List * list_clone(Interp *interpreter, List *other);
PMC* list_mark(Interp* interpreter, List* list, PMC* last);
INTVAL list_length(Interp* interpreter, List* list);
void list_push(Interp *interpreter, List *list, void *item, int type);
void list_unshift(Interp *interpreter, List *list, void *item, int type);
void * list_pop(Interp *interpreter, List *list, int type);
void * list_shift(Interp *interpreter, List *list, int type);
void list_assign(Interp *interpreter, List *list, INTVAL idx,
        void *item, int type);
void * list_get(Interp *interpreter, List *list, INTVAL idx, int type);
void list_insert(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items);
void list_delete(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items);

/* EOH */

/* list.c */
static List_chunk* allocate_chunk(Interp *interpreter, List *list,
        UINTVAL items, UINTVAL size);
#ifdef LIST_DEBUG
static void list_dump(FILE *fp, List *list, INTVAL type);
#endif
static UINTVAL rebuild_chunk_list(Interp *interpreter, List *list);
static List_chunk * next_size(Interp *interpreter, List *list,
        int where, UINTVAL idx);
static List_chunk * add_chunk(Interp *interpreter, List *list,
        int where, UINTVAL idx);
static UINTVAL ld(UINTVAL x);
static List_chunk * get_chunk(Interp * interpreter, List *list, UINTVAL *idx);
static void split_chunk(Interp *interpreter, List *list,
        List_chunk *chunk, UINTVAL idx);
static void
list_set(Interp *interpreter, List *list, void *item, INTVAL type, INTVAL idx);
static void * list_item(Interp *interpreter, List *list, int type, INTVAL idx);
static void list_append(Interp *interpreter, List *list, void *item,
        int type, UINTVAL idx);

#define chunk_list_size(list) \
                (list->chunk_list.buflen / sizeof(List_chunk *))

/* hide the ugly cast somehow: */
#define chunk_list_ptr(list, idx) \
        ((List_chunk**)list->chunk_list.bufstart)[idx]

/*
 * List is roughly based on concepts of IntList (thanks to Steve),
 * so I don't repeat them here.
 *
 * Especially the same invariants hold, except an empty list
 * is really empty, meaning, push does first check for space.
 *
 * The main differences are:
 *  - List can hold items of different size, it's suitable for ints
 *    and PMCs ..., but calculations are still done in terms of items.
 *    The item_size is specified at list reation time in the item type.
 *
 *    If you later store different item types in the list, as stated
 *    initially, you'll get probably not what you want - so don't do this.
 *
 *  - List does auto grow. The caller may implement a different behaviour
 *    if she likes.
 *
 * - List is a standalone object, different fron List_chunk, implying:
 *   - end of list is not list->prev but list->end
 *   - start of list is list->first
 *   - the list of chunks is not closed, detecting the end is more simple
 *   - the List itself doesn't move around
 *
 *  - list chunks don't have ->start and ->end fields. Instead the list has
 *    ->start, which is start of first chunk, and ->cap, the total usable
 *    capacity in the list.
 *
 *  - number of items in chunks may differ, but there is a mode
 *    using same sized chunks
 *
 *
 *    Grow policy
 *    -----------
 *    enum_grow_fixed:
 *    All records are of MAX_ITEMS size, chosen, when the first access to
 *    the array is indexed and beyond MIN_ITEMS
 *
 *    enum_grow_growing:
 *    chunk sizes grow from MIN_ITEMS to MAX_ITEMS, this will be selected
 *    for pushing data on an empty array
 *
 *    enum_grow_mixed:
 *    any mixture of above chunk types and when sparse chunks are present
 *
 *    The chunks hold the information, how many chunks are
 *    growing or fixed beginning from the current, and how many items are
 *    included in this range.
 *
 *    Sparse lists
 *    ------------
 *
 *    To save memory, List can handle sparse arrays. This code snippet:
 *
 *      new P0, .List
 *      set P0[1000000], 42
 *
 *    generates 3 List_chunks, one at the beginning of the array, a
 *    big sparse chunk and a chunk for the actual data.
 *
 *    Setting values inside sparse chunks changes them to real chunks.
 *    For poping/shifting inside sparse chunks, s. return value below.
 *
 *    Chunk types
 *    -----------
 *
 *    fixed_items  ... allocated space, size is a power of 2
 *                     consecutive chunks are same sized
 *    grow_items   ... same, but consecutive chunks are growing
 *    no_power_2   ... allocated space any size
 *    sparse_flag  ... only dummy allocation, chunk->items holds
 *                     the items of this sparse hole
 *
 *    Return value
 *    ------------
 *
 *    List get functions return a (void*) pointer to the location, of the
 *    stored data. The caller has to extract the value from this
 *    pointer.
 *
 *    For non existent data beyond the dimensions of the
 *    array a NULL pointer is returned.
 *
 *    For non existing data inside sparse holes, a pointer (void*)-1
 *    is returned.
 *    The caller can decide to assume these data as undef or 0 or
 *    whatever is appropriate.
 *
 *
 *    Testing:
 *    --------
 *    If INTLIST_EMUL is defined, this code may be linked to parrot
 *    instead of intlist.c and can then run all intlist.t tests, which
 *    are pretty thorough.
 *
 *    There are also some tests included at the bottom. This file can
 *    be linked against libparrot and run standalone when
 *    LIST_TEST is defined:
 *
 *    cc -g -DLIST_TEST -Wall -Iinclude -o list list.c \
 *              blib/lib/libparrot.a -lm -ldl && ./list
 *
 */

/* make a new chunk, size bytes big, holding items items */
static List_chunk*
allocate_chunk(Interp *interpreter, List *list, UINTVAL items, UINTVAL size)
{
    List_chunk* chunk;

    interpreter->DOD_block_level++;
    interpreter->GC_block_level++;
    chunk = (List_chunk *) new_bufferlike_header(interpreter, sizeof(*chunk));
    chunk->items = items;
    Parrot_allocate(interpreter, (Buffer*) chunk, size);
    interpreter->DOD_block_level--;
    interpreter->GC_block_level--;
    return chunk;
}

#ifdef LIST_DEBUG
/* only char and int are supported currently */
static void list_dump(FILE *fp, List *list, INTVAL type)
{
    List_chunk* chunk = list->first;
    UINTVAL i;
    UINTVAL idx = 0;

    for (; chunk; chunk = chunk->next) {
        printf("[");
        if (chunk->data.flags & sparse_flag)
            printf(INTVAL_FMT " x ''", chunk->items);
        else
            for(i=0; i < chunk->items; i++) {
                if (idx++ >= list->start && idx <= list->length+list->start) {
                    switch (list->item_type) {
                        case enum_type_int:
                        case enum_type_short:
                            printf("%d", (int)((int*)chunk->data.bufstart)[i]);
                            break;
                        case enum_type_char:
                            printf("%c", (char)((char*)chunk->data.bufstart)[i]);
                            break;
                    }
                }
                if (i <chunk->data.buflen/list->item_size - 1)
                    printf(",");
            }
        printf("]");
        if (chunk->next)
            printf(" -> ");
    }
    printf("\n");
}
#endif

/* count chunks and fix prev pointers */
static void
rebuild_chunk_ptrs(List *list)
{
    List_chunk* chunk, *prev;
    UINTVAL len = 0;

    for (prev = 0, chunk = list->first; chunk; chunk = chunk->next) {
        /* skip empty chunks */
        if (!chunk->items) {
            if (prev)
                prev->next = chunk->next;
            else
                list->first = chunk->next;
            continue;
        }
        len++;
        chunk->prev = prev;
        prev = chunk;
        list->last = chunk;
    }
    list->last->next = 0;
    list->first->prev = 0;
    list->n_chunks = len;
}

/* coalesce adjacent sparse chunks */
static void
rebuild_spares(List *list)
{
    List_chunk* chunk, *prev;
    int changes = 0;
    for (prev = 0, chunk = list->first; chunk; chunk = chunk->next) {
        if (prev && (prev->data.flags & sparse_flag) &&
                    (chunk->data.flags & sparse_flag)) {
            prev->items += chunk->items;
            chunk->items = 0;
            changes++;
            continue;
        }
        prev = chunk;
    }
    if (changes)
        rebuild_chunk_ptrs(list);
}

/* coalesce adjacent irregular chunks */
static void
rebuild_other(Interp *interpreter, List *list)
{
    List_chunk* chunk, *prev;
    int changes = 0;
    for (prev = 0, chunk = list->first; chunk; chunk = chunk->next) {
        /* two adjacent irregular chunks */
        if (prev && (prev->data.flags & no_power_2) &&
                   (chunk->data.flags & no_power_2)) {
            /* XXX don't make chunks bigger then MAX_ITEMS,
             * if bigger, split them */
            Parrot_reallocate(interpreter, (Buffer *) prev,
                (prev->items + chunk->items) * list->item_size);
            mem_sys_memmove(
                (char *)prev->data.bufstart + prev->items * list->item_size,
                (char *)chunk->data.bufstart,
                chunk->items * list->item_size);
            prev->items += chunk->items;
            chunk->items = 0;
            changes++;
            continue;
        }
        prev = chunk;
    }
    if (changes)
        rebuild_chunk_ptrs(list);
}

static void
rebuild_fix_ends(Interp *interpreter, List *list)
{
    List_chunk* chunk;

    chunk = list->first;
    /* irregular first chunk */
    /* XXX doesn't work - disabled */
    if (0 && (chunk->data.flags & no_power_2) && chunk->items < MAX_ITEMS) {
        /* round up to power 2 */
        UINTVAL items = 1 << (ld(chunk->items) + 1);
        /* if we have a next chunk, check, if we can make a growing
         * sequence, but only for short lists  */
        if (chunk->next && (chunk->next->data.flags != sparse_flag)) {
            if (list->length < MAX_ITEMS &&
                    items <= (chunk->next->items >> 1)) {
                items = chunk->next->items >> 1;
            }
            /* else make same size if possible */
            else if (items < chunk->next->items) {
                items = chunk->next->items;
            }
        }
        assert(items >= chunk->items);
        if (items != chunk->items && list->start == 0) {
            INTVAL diff = items - (INTVAL) chunk->items;
            list->start += diff;
            list->cap += diff;
            Parrot_reallocate(interpreter, (Buffer *) chunk,
                    items * list->item_size);
            mem_sys_memmove(
                (char *)chunk->data.bufstart + diff * list->item_size,
                (char *)chunk->data.bufstart,
                chunk->items * list->item_size);
            chunk->items = items;
            chunk->data.flags &= ~no_power_2;
        }
    }
    /* fix end */
    if (list->n_chunks <= 2 && (chunk->data.flags & no_power_2) &&
            (!chunk->next || chunk->next->items == 0 ||
             list->start + list->length <= chunk->items)) {
        chunk->data.flags = 0;
        list->grow_policy = enum_grow_unknown;
        list->cap += chunk->data.buflen / list->item_size - chunk->items;
        chunk->items = chunk->data.buflen / list->item_size;
    }
    /* XXX
     * - if last is empty and last->prev not full then delete last
     * - combine small chunks if list is big
     */
}

static UINTVAL
rebuild_chunk_list(Interp *interpreter, List *list)
{
    List_chunk* chunk, *prev, *first;
    UINTVAL len;

    /* first, count chunks and fix prev pointers */
    rebuild_chunk_ptrs(list);
    /* if not regular, check & optimize */
    if (list->grow_policy == enum_grow_mixed) {
        rebuild_spares(list);
        rebuild_other(interpreter, list);
        rebuild_fix_ends(interpreter, list);
    }

    /* allocate a new chunk_list buffer, if old one has moved or
     * is too small */
    len = list->n_chunks;
    if (list->collect_runs != interpreter->collect_runs ||
            len > chunk_list_size(list)) {
        len = 1 << (ld(len) + 1);
        if (len < 4)
            len = 4;
        Parrot_allocate(interpreter, &list->chunk_list,
                len * sizeof(List_chunk *));
        list->collect_runs = interpreter->collect_runs;
    }

    chunk = list->first;
    list->grow_policy = enum_grow_unknown;

    /* fill list and update statistics */
    for (first = chunk, prev = 0, len = 0; chunk; chunk = chunk->next) {
        chunk_list_ptr(list, len) = chunk;
        len++;

        /* look, what type of item sizes we have */
        chunk->n_chunks = 1;
        chunk->n_items = chunk->items;
        /* sparse hole or irregular chunk */
        if (chunk->data.flags & (sparse_flag|no_power_2)) {
            first = chunk->next;
            list->grow_policy = enum_grow_mixed;
            continue;
        }
        /* clear flag */
        chunk->data.flags = enum_grow_unknown;
        if (first && first != chunk) {
            /* constant area */
            if (first->items == chunk->items) {
                first->n_chunks++;
                first->n_items += chunk->items;
                first->data.flags = fixed_items;
                list->grow_policy |= enum_grow_fixed;
            }
            /* growing area */
            else if (prev->items == chunk->items >> 1) {
                first->n_chunks++;
                first->n_items += chunk->items;
                first->data.flags = grow_items;
                list->grow_policy |= enum_grow_growing;
            }
            /* different growing scheme starts here */
            else {
                first = chunk;
            }
        }
        prev = chunk;
    }
    if (list->grow_policy && list->grow_policy != enum_grow_growing &&
            list->grow_policy != enum_grow_fixed)
        list->grow_policy  = enum_grow_mixed;
    assert(len);
    return len;
}

/* calculate size and items for next chunk and
 * allocate it
 */
static List_chunk *
next_size(Interp *interpreter, List *list, int where, UINTVAL idx)
{
    UINTVAL items, size;
    List_chunk * new_chunk;
    int much = idx - list->cap >= MIN_ITEMS;
    int sparse = (INTVAL)idx - (INTVAL)list->cap >= 2*MAX_ITEMS;

    if (sparse) {
        assert(where);
        /* don't add sparse chunk at start of list */
        if (!list->n_chunks) {
            list->grow_policy = enum_grow_fixed;
            /* if wee need more, the next allocation will allocate
             * the rest */
            items = MAX_ITEMS;
            size = items * list->item_size;
            sparse = 0;
        }
        else {
            items = idx - list->cap - 1;
            /* round down
             * this function will then be called again, to
             * add the final real chunk, with the rest of the needed size */
            items &= ~(MAX_ITEMS - 1);
            list->grow_policy = enum_grow_mixed;
            /* allocate a dummy chunk holding many items virtually */
            size = list->item_size;
        }
    }
    /* initial size for empty lists
     * grow_policy is not known yet or was different
     */
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
                    items >>= 1;		/* allocate less */
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
    if (sparse)
        new_chunk->data.flags |= sparse_flag;
    return new_chunk;
}

/* add chunk at start or end */
static List_chunk *
add_chunk(Interp *interpreter, List *list, int where, UINTVAL idx)
{
    List_chunk * chunk = where ? list->last : list->first;
    List_chunk * new_chunk;

    new_chunk = next_size(interpreter, list, where, idx);

    if (where) {        /* at end */
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

/* stolen from malloc.c
 * calc log2(x) */

static UINTVAL
ld(UINTVAL x)
{
  UINTVAL m;            /* bit position of highest set bit of m */

  /* On intel, use BSRL instruction to find highest bit */
#if defined(__GNUC__) && defined(i386)

  __asm__("bsrl %1,%0\n\t"
          : "=r" (m)
          : "g"  (x));

#else
  {
    /*
      Based on branch-free nlz algorithm in chapter 5 of Henry
      S. Warren Jr's book "Hacker's Delight".
    */

    unsigned int n = ((x - 0x100) >> 16) & 8;
    x <<= n;
    m = ((x - 0x1000) >> 16) & 4;
    n += m;
    x <<= m;
    m = ((x - 0x4000) >> 16) & 2;
    n += m;
    x = (x << m) >> 14;
    m = 13 - n + (x & ~(x>>1));
  }
#endif
  return m;
}
/*
 * Here is a small table, providing the basics of growing sized
 * addressing, for people like me, who's math lessons are +30 years
 * in the past ;-)
 *
 * ch#	size	idx	+4	bit		ld2(idx) -ld2(4)
 *
 * 0	4	0..3	4..7	0000 01xx	2	0
 * 1	8	4..11	8..15	0000 1xxx	3	1
 * 2	16	12..27	16..31	0001 xxxx	4	2
 * ...
 * 8	1024	1020..	...2047			10	8
 */


/* get the chunk for idx, also update the idx to point into the chunk */
static List_chunk *
get_chunk(Interp * interpreter, List *list, UINTVAL *idx)
{
    List_chunk *chunk;
    UINTVAL i;

#ifndef GC_IS_MALLOC
    if (list->collect_runs != interpreter->collect_runs)
        rebuild_chunk_list(interpreter, list);
#endif

    /* fixed sized chunks - easy: all MAX_ITEMS sized */
    if (list->grow_policy == enum_grow_fixed) {
        chunk = chunk_list_ptr(list, *idx >> LD_MAX);
        *idx &= MAX_MASK;
        return chunk;
    }

#ifdef SLOW_AND_BORING
    for (chunk = list->first; chunk; chunk = chunk->next) {
        if (*idx < chunk->items)
            return chunk;
        *idx -= chunk->items;
    }
    internal_exception(INTERNAL_PANIC , "list structure chaos!\n");
#endif

    /* else look at chuns flags, what grow type follows and
     * adjust chunks and idx */
    for (i = 0, chunk = list->first; chunk; ) {
        /* if we have no more items, we have found the chunk */
        if (*idx < chunk->items)
            return chunk;

        /* now look, if we can use the range of items:
         * if idx is beyond n_items, skip n_chunks */
        if (*idx >= chunk->n_items) {
            i += chunk->n_chunks;
            *idx -= chunk->n_items;
            chunk = chunk_list_ptr(list, i);
            continue;
        }
        /* we are inside this range of items */
        if (chunk->data.flags & fixed_items) {
            /* all chunks are chunk->items big, a power of 2 */
            chunk = chunk_list_ptr(list, i + (*idx >> ld(chunk->items)));
            *idx &= chunk->items - 1;
            return chunk;
        }

        if (chunk->data.flags & grow_items) {
            /* the next chunks are growing from chunk->items ... last->items */
            UINTVAL ld_first, slot;
            List_chunk * last;

            last = chunk_list_ptr(list, i + chunk->n_chunks - 1);
            ld_first = ld(chunk->items);

            slot = ld(*idx + chunk->items) - ld_first;
            /* we are in this growing area, so we are done */
            assert (slot < chunk->n_chunks);
            *idx -= (1 << (ld_first + slot)) - chunk->items;
            return chunk_list_ptr(list, i + slot);
        }

        if (chunk->data.flags & (sparse_flag | no_power_2)) {
            /* these chunk hold exactly chunk->items */
            *idx -= chunk->items;
            i++;
            chunk = chunk->next;
            continue;
        }
        internal_exception(INTERNAL_PANIC , "list structure chaos!\n");
    }
    internal_exception(INTERNAL_PANIC , "list structure chaos!\n");
    return 0;
}

/* split a sparse chunk, so that we have
 * - allocated space at idx
 *   if sparse is big:
 *   - MAX_ITEMS near idx and if there is still sparse space after
 *     the real chunk, this whole also n*MAX_ITEMS sized, so that
 *     consecutive writing would make MAX_ITEMS sized real chunks
 */
static void
split_chunk(Interp *interpreter, List *list, List_chunk *chunk, UINTVAL ix)
{
    List_chunk *new_chunk;
    INTVAL n1, n2, n3, idx = ix;

    /* allocate space at idx */
    if (chunk->items <= MAX_ITEMS) {
        /* it fits, just allocate */
        Parrot_reallocate(interpreter, (Buffer *) chunk,
                chunk->items * list->item_size);
        chunk->data.flags |= no_power_2;
        chunk->data.flags &= ~sparse_flag;
    }
    else {
        /* split chunk->items:
         * n3 = n*MAX_ITEMS after chunk
         * n2 = MAX_ITEMS chunk
         * n1 = rest before */
        n2 = MAX_ITEMS;
        n3 = ((chunk->items-idx) / MAX_ITEMS) * MAX_ITEMS;
        n1 = chunk->items - n2 - n3;
        chunk->items = n2;
        Parrot_reallocate(interpreter, (Buffer *) chunk,
                chunk->items * list->item_size);
        chunk->data.flags &= ~sparse_flag;
        if (n3) {
            new_chunk = allocate_chunk(interpreter, list, n3, list->item_size);
            new_chunk->data.flags |= sparse_flag;
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
            new_chunk->data.flags |= sparse_flag;
            new_chunk->next = chunk;
            if (chunk->prev)
                chunk->prev->next = new_chunk;
            else
                list->first = new_chunk;
        }
    }

    rebuild_chunk_list(interpreter, list);
}

/* set item of type in chunk at idx */
static void
list_set(Interp *interpreter, List *list, void *item, INTVAL type, INTVAL idx)
{
    INTVAL oidx = idx;
    List_chunk *chunk;

    chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
    assert(chunk);
    /* if this is a sparse chunk:
     * split in possibly 2 sparse parts before and after
     * then make a real chunk, rebuild chunk list
     * and set item */
    if ( chunk->data.flags & sparse_flag ) {
        split_chunk(interpreter, list, chunk, idx);
        /* reget chunk and idx */
        idx = oidx;
        chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
        assert(chunk);
        assert(!(chunk->data.flags & sparse_flag) );
    }

    switch (type) {
	case enum_type_char:
	    ((char*)chunk->data.bufstart)[idx] = (char)PTR2INTVAL(item);
	    break;
	case enum_type_short:
	    ((short*)chunk->data.bufstart)[idx] = (short)PTR2INTVAL(item);
	    break;
	case enum_type_int:
	    ((int*)chunk->data.bufstart)[idx] = (int)PTR2INTVAL(item);
	    break;
	case enum_type_INTVAL:
	    ((INTVAL*)chunk->data.bufstart)[idx] = PTR2INTVAL(item);
	    break;
	case enum_type_FLOATVAL:
	    ((FLOATVAL*)chunk->data.bufstart)[idx] = *(FLOATVAL*) item;
	    break;
	case enum_type_PMC:
	    ((PMC**)chunk->data.bufstart)[idx] = (PMC*)item;
	    break;
	case enum_type_STRING:
	    ((STRING**)chunk->data.bufstart)[idx] = (STRING*)item;
	    break;
	default:
	    internal_exception(1, "type N/Y\n");
	    break;
    }
}

/* get pointer to item of type in chunk at idx */
static void *
list_item(Interp *interpreter, List *list, int type, INTVAL idx)
{
    List_chunk *chunk;

    chunk = get_chunk(interpreter, list, (UINTVAL *)&idx);
    /* if this is a sparse chunk
     * return -1, the caller may decide to return 0 or undef or
     * whatever */
    if (chunk->data.flags & sparse_flag) {
#ifdef INTLIST_EMUL
        static int null = 0;
        return (void*)&null;
#else
        return (void*)-1;
#endif
    }

    switch (type) {
	case enum_type_char:
	    return (void*)&((char*)chunk->data.bufstart)[idx];
	    break;
	case enum_type_short:
	    return (void*)&((short*)chunk->data.bufstart)[idx];
	    break;
	case enum_type_int:
	    return (void*)&((int*)chunk->data.bufstart)[idx];
	    break;
	case enum_type_INTVAL:
	    return (void*)&((INTVAL*)chunk->data.bufstart)[idx];
	    break;
	case enum_type_FLOATVAL:
	    return (void*)&((FLOATVAL*)chunk->data.bufstart)[idx];
	    break;
	case enum_type_PMC:
	    return (void*)((PMC**)chunk->data.bufstart)[idx];
	    break;
	case enum_type_STRING:
	    return (void*)((STRING**)chunk->data.bufstart)[idx];
	    break;
	default:
	    internal_exception(1, "type N/Y\n");
	    break;
    }
    return 0;

}

/* add one or more chunks at end of list */
static void
list_append(Interp *interpreter, List *list, void *item, int type, UINTVAL idx)
{
    /* initially, list may be empty, also used by assign */
    while (idx >= list->cap)
        add_chunk(interpreter, list, enum_add_at_end, idx);
    list_set(interpreter, list, item, type, idx);
    /* invariant: prepare for next push */
    if (idx >= list->cap-1)
        add_chunk(interpreter, list, enum_add_at_end, 0);
}

/* public interface functions */

/*
 * TODO pass grow policy additionally
 */
List *
list_new(Interp *interpreter, INTVAL type)
{
    List *list;

    list = (List *) new_bufferlike_header(interpreter, sizeof(*list));
    list->item_type = type;
    switch (type) {
	case enum_type_char:
	    list->item_size = sizeof(char); break;
	case enum_type_short:
	    list->item_size = sizeof(short); break;
	case enum_type_int:
	    list->item_size = sizeof(int); break;
	case enum_type_INTVAL:
	    list->item_size = sizeof(INTVAL); break;
	case enum_type_FLOATVAL:
	    list->item_size = sizeof(FLOATVAL); break;
	case enum_type_PMC:
	    list->item_size = sizeof(PMC*); break;
	case enum_type_STRING:
	    list->item_size = sizeof(STRING*); break;
	default:
	    internal_exception(1, "N/Y\n"); break;
    }
    return list;
}

/* barely tested: clone */
/* TODO optimize new array structure, fixed if big */
List *
list_clone(Interp *interpreter, List *other)
{
    List * l;
    List_chunk * chunk, *prev, *new_chunk;
    UINTVAL i;
    PMC *op, *np;
    STRING *s;

    interpreter->DOD_block_level++;
    interpreter->GC_block_level++;

    l = list_new(interpreter, other->item_type);
    mem_sys_memcopy(l, other, sizeof(List));

    for (chunk = other->first, prev = 0; chunk ; chunk = chunk->next) {
        new_chunk = allocate_chunk(interpreter, l,
            chunk->items, chunk->data.buflen);
        new_chunk->data.flags = chunk->data.flags;
        if (!prev)
            l->first = new_chunk;
        else
            prev->next = new_chunk;
        prev = new_chunk;

        if (!(new_chunk->data.flags & sparse_flag)) {
            switch (l->item_type) {
                case enum_type_PMC:
                    for (i = 0; i < chunk->items; i++) {
                        op = ((PMC**) chunk->data.bufstart) [i];
                        if (op) {
                            np = op->vtable->clone(interpreter, op);
                            ((PMC**) new_chunk->data.bufstart)[i] = np;
                        }
                    }
                    break;
                case enum_type_STRING:
                    for (i = 0; i < chunk->items; i++) {
                        s = ((STRING**) chunk->data.bufstart) [i];
                        if (s) {
                            ((STRING**) new_chunk->data.bufstart)[i] =
                                string_copy(interpreter, s);
                        }
                    }
                    break;
            }
        }
    }
    rebuild_chunk_list(interpreter, l);
    interpreter->DOD_block_level--;
    interpreter->GC_block_level--;
    return l;
}


PMC*
list_mark(Interp* interpreter, List* list, PMC* last)
{
    List_chunk* chunk = list->first;
    for (; chunk; chunk = chunk->next)
        buffer_lives((Buffer *) chunk);
    buffer_lives((Buffer *) list);
    return last;
}

INTVAL
list_length(Interp* interpreter, List* list)
{
    UNUSED(interpreter);
    return list->length;
}

/* TODO list_set_length */

/* make room for n_items at idx */
void list_insert(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items) {
    List_chunk * chunk, *new_chunk, *rest;

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
    if (chunk->data.flags & sparse_flag)
        chunk->items += n_items;
    else {
        /* 1. cut this chunk at idx */
        list->grow_policy = enum_grow_mixed;
        /* allocate a sparse chunk, n_items big */
        new_chunk = allocate_chunk(interpreter, list, n_items, list->item_size);
        new_chunk->data.flags |= sparse_flag;
        /* allocate a small chunk, holding the rest of chunk beyond idx */
        items = chunk->items - idx;
        /* TODO */
        assert(!(chunk->data.flags & no_power_2));
        /* TODO check for EOList */
        if (items) {
            chunk->data.flags = no_power_2;
            rest = allocate_chunk(interpreter, list, items, items*list->item_size);
            rest->data.flags |= no_power_2;
            /* hang them togehter */
            rest->next = chunk->next;
            chunk->next = new_chunk;
            new_chunk->next = rest;
            /* copy data over */
            mem_sys_memmove(
                (char *)rest->data.bufstart,
                (char *)chunk->data.bufstart +
                idx * list->item_size,
                (chunk->items - idx) * list->item_size);
        }
        else {
            new_chunk->next = chunk->next;
            chunk->next = new_chunk;
        }
        chunk->items = idx;
    }
    rebuild_chunk_list(interpreter, list);
}

/* delete n_items at idx */
void
list_delete(Interp *interpreter, List *list,
        INTVAL idx, INTVAL n_items)
{
    List_chunk * chunk;

    assert(idx >= 0);
    idx += list->start;
    assert(n_items >= 0);
    if (n_items == 0)
        return;
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
            if (!(chunk->data.flags & sparse_flag)) {
                chunk->data.flags = no_power_2;
                if (idx + n_items <= (INTVAL)chunk->items) {
                    mem_sys_memmove(
                            (char *)chunk->data.bufstart +
                            idx * list->item_size,
                            (char *)chunk->data.bufstart +
                            (idx + n_items) * list->item_size,
                            (chunk->items - idx - n_items) * list->item_size);
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
            if (!(chunk->data.flags & sparse_flag))
                chunk->data.flags = no_power_2;
            n_items -= chunk->items - idx;
            chunk->items = idx;
        }
        idx = 0;
        chunk = chunk->next;
    }
    rebuild_chunk_list(interpreter, list);
}

void
list_push(Interp *interpreter, List *list, void *item, int type)
{
    INTVAL idx = list->start + list->length++;
    list_append(interpreter, list, item, type, idx);
}

void
list_unshift(Interp *interpreter, List *list, void *item, int type)
{
    List_chunk * chunk;

    if (list->start == 0) {
        chunk  = add_chunk(interpreter, list, enum_add_at_start, 0);
        list->start = chunk->items;
    }
    else
        chunk = list->first;
    list_set(interpreter, list, item, type, --list->start);
    list->length++;
}

void *
list_pop(Interp *interpreter, List *list, int type)
{
    UINTVAL idx;
    void *ret;
    List_chunk * chunk = list->last;

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

void *
list_shift(Interp *interpreter, List *list, int type)
{
    void * ret;
    UINTVAL idx = list->start++;
    List_chunk * chunk = list->first;

    if (list->length == 0) {
        return 0;
    }
    list->length--;
    /* optimize push + shift on empty lists */
    if (list->length == 0)
        list->start = 0;
    ret = list_item(interpreter,list, type, idx);
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

void
list_assign(Interp *interpreter, List *list, INTVAL idx, void *item, int type)
{
    INTVAL length = list->length;

    if (idx < 0)
        idx += length;
    if (idx >= length) {
        list_append(interpreter, list, item, type, list->start + idx);
	list->length = idx + 1;
    }
    else {
	list_set(interpreter, list, item, type, idx);
    }
}

void *
list_get(Interp *interpreter, List *list, INTVAL idx, int type)
{
    INTVAL length = list->length;

    if (idx >= length || -idx > length) {
        return 0;
    }

    if (idx < 0) idx += length;
    idx +=  list->start;
    return list_item( interpreter, list, type, idx);
}

#ifdef INTLIST_EMUL

/* getting data outside the array dimensions will
 * return the value NULL, which will SIGSEGV, the intlist did
 * an explicit exception, so there is not much difference.
 * Of course, a check for valid pointers could be added here.
 */

PMC* intlist_mark(Interp*i, IntList*l, PMC* last) {
    return list_mark(i, (List*) l, last);
}

IntList *intlist_new(Interp*i){
    return (IntList *) list_new(i, enum_type_int);
}

INTVAL intlist_length(Interp* interpreter, IntList* list)
{
    UNUSED(interpreter);
    return ((List*)list)->length;
}

void intlist_assign(Interp*i, IntList*l, INTVAL idx, INTVAL val) {
    list_assign(i, (List*)l, idx, INTVAL2PTR(void*,val), enum_type_int);
}

void intlist_push(Interp*i, IntList*l, INTVAL val) {
    list_push(i,(List*)l,INTVAL2PTR(void*, val), enum_type_int);
}

INTVAL intlist_pop(Interp *i, IntList* l) {
    int ret =  *(INTVAL*) list_pop(i,(List*)l,enum_type_int);
    return ret;
}
void intlist_unshift(Interp*i, IntList**l, INTVAL val) {
    list_unshift(i, (List*)*l, INTVAL2PTR(void*, val), enum_type_int);
}
INTVAL intlist_shift(Interp *i, IntList**l) {
    return *(INTVAL*) list_shift(i,(List*)*l,enum_type_int);
}

INTVAL intlist_get(Interp*i, IntList*l, INTVAL idx) {
    return *(INTVAL*) list_get(i,(List*)l,idx, enum_type_int);
}
void intlist_dump(FILE* fp, IntList* list, int verbose) {
#ifdef LIST_DEBUG
    list_dump(fp, (List*)list, verbose);
#endif
}

#endif

#ifdef LIST_TEST
int main(int argc, char* argv[]) {
    int x, i, j;
    char c;
    short t;
    FLOATVAL f;
    STRING *s;
    List* list, *list2;
    PMC *p1, *p2;

    Interp* interpreter = Parrot_new();
    if (interpreter == NULL) return 1;
    Parrot_init(interpreter, (void*) &interpreter);

    list = list_new(interpreter, enum_type_int);
    if (list == NULL) return 1;

    for (i = 0, x = 32; x < 43; x++, i++) {
	list_push(interpreter, list, INTVAL2PTR(void*, x) ,enum_type_int);
	j = *(int*) list_get(interpreter, list, i, enum_type_int);
	if (i < 10)
	    ;
	else
	    printf("The answer is %d.\n", j);
    }

    /* test various data types */
    list = list_new(interpreter, enum_type_char);

    list_assign(interpreter, list, 0 ,(void*) 'a', enum_type_char);
    list_assign(interpreter, list, 1 ,(void*) 'b', enum_type_char);
    list_assign(interpreter, list, 2 ,(void*) 'c', enum_type_char);
    list_assign(interpreter, list, 3 ,(void*) 'd', enum_type_char);
    c = *(char*) list_get(interpreter, list, 1, enum_type_char);
    printf("char\t%c\n",  c);

    list = list_new(interpreter, enum_type_short);

    list_assign(interpreter, list, 20 ,(void*) 15, enum_type_short);
    list_assign(interpreter, list, 21 ,(void*) -15, enum_type_short);
    list_assign(interpreter, list, 22 ,(void*) 99, enum_type_short);
    t = *(short*) list_get(interpreter, list, 21, enum_type_short);
    printf("short\t%d\n",  t);

    list = list_new(interpreter, enum_type_FLOATVAL);

    f = 1234.56;
    list_assign(interpreter, list, 20 ,(void*) &f, enum_type_FLOATVAL);
    f = *(FLOATVAL*) list_get(interpreter, list, 20, enum_type_FLOATVAL);
    printf("num\t" FLOATVAL_FMT "\n",  f);

    s = string_make(interpreter, "Seems ok\n", 9, 0, BUFFER_external_FLAG,0);

    list = list_new(interpreter, enum_type_PMC);

    p1 = pmc_new(interpreter, enum_class_PerlString);
    p1->vtable->set_string_native(interpreter, p1, s);

    list_push(interpreter, list, p1, enum_type_PMC);

    p2 = list_shift(interpreter, list, enum_type_PMC);
    s = p2->vtable->get_string(interpreter, p2);
    printf("string\t%s", string_to_cstring(interpreter, s));

    i = list_length(interpreter, list);
    printf("len now %d\n", i);

    s = string_make(interpreter, "list\n", 5, 0, BUFFER_external_FLAG,0);
    p1 = pmc_new(interpreter, enum_class_PerlString);
    p1->vtable->set_string_native(interpreter, p1, s);
    list_assign(interpreter, list, 0, p1, enum_type_PMC);

    /* clone */
    list2 = list_clone(interpreter, list);

    s = string_make(interpreter, "list 2\n", 7, 0, BUFFER_external_FLAG,0);
    p1 = pmc_new(interpreter, enum_class_PerlString);
    p1->vtable->set_string_native(interpreter, p1, s);
    list_assign(interpreter, list2, 0, p1, enum_type_PMC);

    p1 = list_shift(interpreter, list, enum_type_PMC);
    s = p1->vtable->get_string(interpreter, p1);
    printf("string\t%s", string_to_cstring(interpreter, s));

    p2 = list_shift(interpreter, list2, enum_type_PMC);
    s = p2->vtable->get_string(interpreter, p2);
    printf("string\t%s", string_to_cstring(interpreter, s));

    list = list_new(interpreter, enum_type_STRING);
    s = string_make(interpreter, "list\n", 5, 0, BUFFER_external_FLAG,0);
    list_assign(interpreter, list, 0, s, enum_type_STRING);

    list2 = list_clone(interpreter, list);

    s = string_make(interpreter, "list 2\n", 7, 0, BUFFER_external_FLAG,0);
    list_assign(interpreter, list2, 0, s, enum_type_STRING);
    s = list_shift(interpreter, list, enum_type_STRING);
    printf("string\t%s", string_to_cstring(interpreter, s));
    s = list_shift(interpreter, list2, enum_type_STRING);
    printf("string\t%s", string_to_cstring(interpreter, s));

    /* delete test */
    printf("new list(0..19)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 20; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    printf("delete(1,1)\n");
    list_delete(interpreter, list, 1, 1);
    list_dump(0, list, 0);
    printf("delete(1,4)\n");
    list_delete(interpreter, list, 1, 4);
    list_dump(0, list, 0);
    j = *(char*) list_get(interpreter, list, 1, enum_type_char);
    assert(j == 6+'a');

    printf("new list(0..25)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 26; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    printf("delete(1,20)\n");
    list_delete(interpreter, list, 1, 20);
    list_dump(0, list, 0);
    j = *(char*) list_get(interpreter, list, 1, enum_type_char);
    assert(j == 21+'a');
    printf("shift, push('X')\n");
    list_shift(interpreter, list, enum_type_char);
    list_push(interpreter, list, (void*) 'X', enum_type_char);
    list_dump(0, list, 0);

    printf("new list(0..25)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 26; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    printf("delete(2,30)\n");
    list_delete(interpreter, list, 2, 30);
    list_dump(0, list, 0);
    printf("push('A'..'Z')\n");
    for (i = 0; i < 26; i++)
	list_push(interpreter, list, (void*) 'A'+i, enum_type_char);
    list_dump(0, list, 0);
    j = *(char*) list_get(interpreter, list, 6, enum_type_char);
    assert(j == 'E');
    assert(list_length(interpreter, list) == 28);

    printf("new list(0..2)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 3; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    printf("list[2000]='Y'\n");
    list_assign(interpreter, list, 2000 ,(void*)'Y', enum_type_char);
    printf("list[4000]='Z'\n");
    list_assign(interpreter, list, 4000 ,(void*)'Z', enum_type_char);
    list_dump(0, list, 0);
    printf("delete(3,3000)\n");
    list_delete(interpreter, list, 3, 3000);
    list_dump(0, list, 0);
    printf("delete(2,996)\n");
    list_delete(interpreter, list, 2, 996);
    list_dump(0, list, 0);
    assert(list_length(interpreter, list) == 5);
    j = *(char*) list_get(interpreter, list, -1, enum_type_char);
    assert(j == 'Z');

    /* insert */
    printf("new list(0..5)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 6; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    printf("insert(2, 5)\n");
    list_insert(interpreter, list, 2, 5);
    list_dump(0, list, 0);
    printf("list(2..7) = 'A'..'F'\n");
    for (i = 0; i < 6; i++)
        list_assign(interpreter, list, 2+i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);

    printf("new list(0..5)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 6; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    printf("insert(0, 3)\n");
    list_insert(interpreter, list, 0, 3);
    list_dump(0, list, 0);
    printf("list(0..4) = 'A'..'E'\n");
    for (i = 0; i < 5; i++)
        list_assign(interpreter, list, i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);

    printf("new list(0..5)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 6; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    printf("insert(5, 3)\n");
    list_insert(interpreter, list, 5, 3);
    list_dump(0, list, 0);
    printf("list(5..9) = 'A'..'E'\n");
    for (i = 0; i < 5; i++)
        list_assign(interpreter, list, 5+i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);

    printf("new list(0..5)\n");
    list = list_new(interpreter, enum_type_char);
    for (i = 0; i < 6; i++)
	list_push(interpreter, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    printf("insert(6, 3)\n");
    list_insert(interpreter, list, 6, 3);
    list_dump(0, list, 0);
    printf("list(5..9) = 'A'..'E'\n");
    for (i = 0; i < 5; i++)
        list_assign(interpreter, list, 5+i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);
    printf("delete(0,1)\n");
    list_delete(interpreter, list, 0, 1);
    list_dump(0, list, 0);

    printf("new list(0..5)\n");
    list = list_new(interpreter, enum_type_char);
    printf("insert(0, 3)\n");
    list_insert(interpreter, list, 0, 3);
    list_dump(0, list, 0);
    return 0;
}
#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

