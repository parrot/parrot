/* stacks.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Integer list routines. Constant-time push, pop, length operations.
 *     Fast linear-time lookup (requires walking through the chunks).
 *     All memory is managed by the Parrot garbage collector.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_INTLIST_H_GUARD)
#define PARROT_INTLIST_H_GUARD

#include "parrot/parrot.h"

/* Number of entries (NOT bytes) in each chunk of the list */
#define INTLIST_CHUNK_SIZE 256

typedef struct IntList_chunk_t IntList_Chunk;

struct IntList_chunk_t {
    Buffer buffer; /* This struct is a Buffer header subclass! */
    INTVAL length;              /* number of items in list (1) */
    size_t  collect_runs;       /* counter, when chunklist was built (1) */
    Buffer chunk_list;          /* holding list of chunks for fast access (1) */
    size_t n_chunks;            /* number of used chunks in chunk_list (1) */
    /* all above items, marked (1) are only valid in the head junk
     * s. intlist.c for a detailled description */
    INTVAL start;
    INTVAL end;
    IntList_Chunk* next;
    IntList_Chunk* prev;
};

typedef IntList_Chunk IntList;

void intlist_mark(Interp*, IntList*);

IntList *intlist_clone(Interp*i, IntList *list);

IntList *intlist_new(Interp*);

INTVAL intlist_length(Interp* interpreter, IntList* list);

void intlist_assign(Interp*, IntList*, INTVAL idx, INTVAL val);

void intlist_push(Interp*, IntList*, INTVAL);

INTVAL intlist_pop(Interp*, IntList*);

void intlist_unshift(Interp*, IntList**, INTVAL);

INTVAL intlist_shift(Interp *, IntList**);

INTVAL intlist_get(Interp*, IntList*, INTVAL idx);

/* Debugging use only */
void intlist_dump(FILE* fp, IntList* list, int verbose);

#endif /* PARROT_INTLIST_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
