/*
 * list.h
 *  Copyright: (c) 2002 Leopold Toetsch <lt@toetsch.at>
 *  License:  Artistic/GPL, see README and LICENSES for details
 *  CVS Info
 *     $Id$
 *  Overview:
 *     list aka array routines for Parrot
 *     s. list.c for more
 */

#include "parrot/parrot.h"

#if !defined(PARROT_LIST_H_GUARD)
#define PARROT_LIST_H_GUARD

typedef struct List_chunk {
    Buffer data;                /* item store */
    UINTVAL flags;              /* chunk flags */
    UINTVAL items;              /* items in this chunk */
    UINTVAL n_chunks;           /* # of chunks with grow policy in flags */
    UINTVAL n_items;            /* # of items with grow policy in flags */
    struct List_chunk *next;
    struct List_chunk *prev;
} List_chunk;

#define sparse PObj_private0_FLAG
#define no_power_2  PObj_private1_FLAG
#define fixed_items PObj_private2_FLAG
#define grow_items PObj_private3_FLAG

typedef struct List {
    Buffer chunk_list;          /* pointers to chunks */
    UINTVAL length;             /* number of items in list */
    UINTVAL start;		/* offset, where array[0] is */
    int item_type;	        /* item type */
    int item_size;		/* item size */
    int items_per_chunk;	/* override defaults */
    UINTVAL cap;                /* list capacity in items */
    int grow_policy;            /* fixed / variable len */
    UINTVAL collect_runs;       /* counter, when chunklist was built */
    UINTVAL n_chunks;           /* number of chunks */
    PMC * user_data;		/* e.g. multiarray dimensions */
    List_chunk *first;	        /* first chunk holding data */
    List_chunk *last;	        /* last chunk */
} List;

typedef enum {
    enum_grow_unknown,          /* at beginning, or after emptying list */
    enum_grow_mixed = 1,        /* other */
    enum_grow_fixed = fixed_items,        /* fixed maximum size */
    enum_grow_growing = grow_items        /* growing at begin of list */
} ARRAY_GROW_TYPE;

typedef enum {
    enum_add_at_start,          /* don't swap these */
    enum_add_at_end
} ARRAY_ADD_POS;


#ifdef LIST_TEST
#  define MIN_ITEMS 4		/* smallest chunk can hold */
#  define LD_MAX 4                /* log2(MAX_ITEMS) */
#  define MAX_ITEMS 16  	        /* biggest chunk can hold */
#else
#  define MIN_ITEMS 16		/* smallest chunk can hold */
#  define LD_MAX 10               /* log2(MAX_ITEMS) */
#  define MAX_ITEMS 1024  	/* biggest chunk can hold */
#endif /* LIST_TEST */
#define MAX_MASK (MAX_ITEMS-1)

/*
 * bigger MAX_ITEMS didn't improve much in my tests
 * 10^6 list_get, MAX_ITEMS 1024: 0.34s, 2048: 0.33s
 */

List * list_new(Interp *interpreter, INTVAL type);
List * list_new_init(Interp *interpreter, INTVAL type, PMC *init);
List * list_clone(Interp *interpreter, List *other);
void list_mark(Interp* interpreter, List* list);
void list_visit(Interp* interpreter, List* list, void*);
INTVAL list_length(Interp* interpreter, List* list);
void list_set_length(Interp* interpreter, List* list, INTVAL len);
void list_push(Interp *interpreter, List *list, void *item, int type);
void list_unshift(Interp *interpreter, List *list, void *item, int type);
void * list_pop(Interp *interpreter, List *list, int type);
void * list_shift(Interp *interpreter, List *list, int type);
void list_assign(Interp *interpreter, List *list, INTVAL idx,
                 void *item, int type);
void * list_get(Interp *interpreter, List *list, INTVAL idx, int type);
void list_insert(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items);
void list_delete(Interp *interpreter, List *list, INTVAL idx, INTVAL n_items);
void list_splice(Interp *interpreter, List *list, PMC* value, INTVAL offset,
                 INTVAL count);

#endif /* PARROT_LIST_H_GUARD */


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
