/* resources.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the resource allocation API
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_RESOURCES_H_GUARD)
#define PARROT_RESOURCES_H_GUARD

#include "parrot/parrot.h"

struct Memory_Block {
    size_t free;
    size_t size;
    struct Memory_Block *prev;
    struct Memory_Block *next;
    char *start;
    char *top;
};

struct Memory_Pool {
    struct Memory_Block *top_block;
    void (*compact)(struct Parrot_Interp *, struct Memory_Pool *);
    size_t minimum_block_size;
    size_t total_allocated; /* total bytes allocated to this pool */
    size_t guaranteed_reclaimable;     /* bytes that can definitely be reclaimed*/
    size_t possibly_reclaimable;     /* bytes that can possibly be reclaimed
                                      * (above plus COW-freed bytes) */
    FLOATVAL reclaim_factor; /* minimum percentage we will reclaim */
};




void *Parrot_allocate(struct Parrot_Interp *, void *, size_t size);
void *Parrot_allocate_zeroed(struct Parrot_Interp *, void *, size_t size);
void *Parrot_allocate_string(struct Parrot_Interp *, STRING *, size_t size);
void *Parrot_reallocate(struct Parrot_Interp *interpreter,
                        void *from, size_t tosize);
void *Parrot_reallocate_string(struct Parrot_Interp *interpreter,
                               STRING *, size_t tosize);

void Parrot_initialize_memory_pools(struct Parrot_Interp *);
void Parrot_destroy_memory_pools(struct Parrot_Interp *interpreter);

void Parrot_go_collect(struct Parrot_Interp *);

struct Arenas {
    struct Memory_Pool *memory_pool;
    struct Memory_Pool *constant_string_pool;
    struct Small_Object_Pool *string_header_pool;
    struct Small_Object_Pool *pmc_pool;
    struct Small_Object_Pool *pmc_ext_pool;
    struct Small_Object_Pool *constant_pmc_pool;
    struct Small_Object_Pool *buffer_header_pool;
    struct Small_Object_Pool *constant_string_header_pool;
    struct Small_Object_Pool **sized_header_pools;
    size_t num_sized;
    void *  gc_private;         /* gc subsystem data */
    /* Some counters for the garbage collector */
    size_t  dod_runs;           /* Number of times we've * done a DOD sweep */
    size_t  lazy_dod_runs;      /* Number of lazy DOD sweep */
    size_t  collect_runs;       /* Number of times we've
                                 * done a memory compaction
                                 */
    size_t  mem_allocs_since_last_collect;      /* The number of memory
                                                 * allocations from the
                                                 * system since the last
                                                 * compaction run */
    size_t  header_allocs_since_last_collect;   /* The number of header
                                                 * blocks allocated from
                                                 * the system since the last
                                                 * DOD run */
    size_t  memory_allocated;   /* The total amount of
                                 * allocatable memory
                                 * allocated. Doesn't count
                                 * memory for headers or
                                 * internal structures or
                                 * anything */
    UINTVAL memory_collected;   /* Total amount of memory copied
                                   during collection */
    UINTVAL DOD_block_level;    /* How many outstanding DOD block
                                   requests are there? */
    UINTVAL GC_block_level;     /* How many outstanding GC block
                                   requests are there? */
    UINTVAL num_early_DOD_PMCs; /* how many PMCs want immediate destruction */
    UINTVAL num_early_PMCs_seen;/* how many such PMCs has DOD seen */
    UINTVAL num_extended_PMCs;  /* active PMCs having pmc_ext */
    PMC* dod_mark_start;        /* first PMC marked during a DOD run */
    PMC* dod_mark_ptr;          /* last PMC marked during a DOD run */
    PMC* dod_trace_ptr;         /* last PMC trace_children was called on */
    int lazy_dod;               /* flag that indicates whether we should stop
                                   when we've seen all impatient PMCs */
};

struct Stash {
    struct PMC *stash_hash;
    struct Stash *parent_stash;
};

/* &gen_from_def(interpinfo.pasm) prefix(INTERPINFO_) */

#define TOTAL_MEM_ALLOC 1
#define DOD_RUNS 2
#define COLLECT_RUNS 3
#define ACTIVE_PMCS 4
#define ACTIVE_BUFFERS 5
#define TOTAL_PMCS 6
#define TOTAL_BUFFERS 7
#define HEADER_ALLOCS_SINCE_COLLECT 8
#define MEM_ALLOCS_SINCE_COLLECT 9
#define TOTAL_COPIED 10
#define IMPATIENT_PMCS 11
#define LAZY_DOD_RUNS 12
#define EXTENDED_PMCS 13

/* &end_gen */

#endif /* PARROT_RESOURCES_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
