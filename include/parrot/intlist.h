/* stacks.h
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

void intlist_assign( Interp *i /*NN*/,
    IntList *l /*NN*/,
    INTVAL idx,
    INTVAL val )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

IntList * intlist_clone( Interp *i /*NN*/, const IntList *list/*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__malloc__
        __attribute__warn_unused_result__;

void intlist_dump( FILE *fp, IntList *list /*NN*/, int verbose )
        __attribute__nonnull__(2);

INTVAL intlist_get( Interp *interp /*NN*/, IntList *list /*NN*/, INTVAL idx )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

INTVAL intlist_length( Interp *interp, const IntList *list /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

void intlist_mark( Interp *i /*NN*/, IntList *l /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

IntList * intlist_new( Interp *i /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__malloc__
        __attribute__warn_unused_result__;

INTVAL intlist_pop( Interp *i /*NN*/, IntList *l /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void intlist_push( Interp *i /*NN*/, IntList *l /*NN*/, INTVAL val )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL intlist_shift( Interp *i, IntList **l /*NN*/ )
        __attribute__nonnull__(2);

void intlist_unshift( Interp *i /*NN*/, IntList **l /*NN*/, INTVAL val )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/intlist.c */

#endif /* PARROT_INTLIST_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
