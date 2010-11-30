/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/variable_size_pool.h - implementation of allocator variable size objects.
E.g. strings.

=head1 DESCRIPTION

*/

#ifndef PARROT_GC_VARIABLE_SIZE_POOL_H_GUARD
#define PARROT_GC_VARIABLE_SIZE_POOL_H_GUARD

#include "parrot/settings.h"

struct GC_Statistics;

typedef struct Memory_Block {
    size_t free;
    size_t size;
    struct Memory_Block *prev;
    struct Memory_Block *next;
    char *start;
    char *top;

    /* Amount of freed memory. Used in compact_pool */
    size_t freed;
} Memory_Block;

typedef struct Variable_Size_Pool {
    Memory_Block *top_block;
    void (*compact)(PARROT_INTERP, struct GC_Statistics *, struct Variable_Size_Pool *);
    size_t minimum_block_size;
    size_t total_allocated; /* total bytes allocated to this pool */
    size_t guaranteed_reclaimable;     /* bytes that can definitely be reclaimed*/
    size_t possibly_reclaimable;     /* bytes that can possibly be reclaimed
                                      * (above plus COW-freed bytes) */
    FLOATVAL reclaim_factor; /* minimum percentage we will reclaim */
} Variable_Size_Pool;

/* HEADERIZER BEGIN: src/gc/variable_size_pool.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/variable_size_pool.c */


#endif /* PARROT_GC_VARIABLE_SIZE_POOL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
