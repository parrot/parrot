/* stacks.h
 *  Copyright: (When this is determined...it will go here)
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
    INTVAL length; /* Only valid for the "head" chunk */
    INTVAL start;
    INTVAL end;
    IntList_Chunk* next;
    IntList_Chunk* prev;
};

typedef IntList_Chunk IntList;

PMC* intlist_mark(Interp*, IntList*, PMC* last);

IntList *intlist_new(Interp*);

static INTVAL intlist_length(Interp* interpreter, IntList* list)
{
    UNUSED(interpreter);
    return list->length;
}

void intlist_assign(Interp*, IntList*, INTVAL idx, INTVAL val);

void intlist_push(Interp*, IntList*, INTVAL);

INTVAL intlist_pop(Interp*, IntList*);

void intlist_unshift(Interp*, IntList**, INTVAL);

INTVAL intlist_shift(Interp *, IntList**);

INTVAL intlist_get(Interp*, IntList*, INTVAL idx);

/* Debugging use only */
void intlist_dump(FILE* fp, IntList* list, int verbose);

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
