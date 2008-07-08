/* intlist.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
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

#ifndef PARROT_INTLIST_H_GUARD
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
     * s. intlist.c for a detailed description */
    INTVAL start;
    INTVAL end;
    IntList_Chunk* next;
    IntList_Chunk* prev;
};

typedef IntList_Chunk IntList;

/* HEADERIZER BEGIN: src/intlist.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void intlist_assign(PARROT_INTERP,
    ARGMOD(IntList *l),
    INTVAL idx,
    INTVAL val)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*l);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
IntList * intlist_clone(PARROT_INTERP, ARGIN(const IntList *list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
INTVAL intlist_get(PARROT_INTERP, ARGMOD(IntList *list), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*list);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL intlist_length(SHIM_INTERP, ARGIN(const IntList *list))
        __attribute__nonnull__(2);

void intlist_mark(PARROT_INTERP, ARGMOD(IntList *l))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*l);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
IntList * intlist_new(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL intlist_pop(PARROT_INTERP, ARGMOD(IntList *l))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*l);

void intlist_push(PARROT_INTERP, ARGMOD(IntList *l), INTVAL val)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*l);

INTVAL intlist_shift(PARROT_INTERP, ARGMOD(IntList **l))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*l);

void intlist_unshift(PARROT_INTERP, ARGMOD(IntList **l), INTVAL val)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*l);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/intlist.c */

#endif /* PARROT_INTLIST_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
