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
    /*
     * function slots that each subsystem must provide
     */
    void (*do_dod_run)(Interp*, int flags);
    void (*de_init_gc_system) (Interp*);
    /*
     * statistics for DOD and GC
     */
    size_t  dod_runs;           /* Number of times we've done a DOD sweep */
    size_t  lazy_dod_runs;      /* Number of successful lazy DOD sweep */
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
    UINTVAL num_early_DOD_PMCs; /* how many PMCs want immediate destruction */
    UINTVAL num_early_PMCs_seen;/* how many such PMCs has DOD seen */
    UINTVAL num_extended_PMCs;  /* active PMCs having pmc_ext */
    PMC* dod_mark_start;        /* first PMC marked during a DOD run */
    PMC* dod_mark_ptr;          /* last PMC marked during a DOD run */
    PMC* dod_trace_ptr;         /* last PMC trace_children was called on */
    int lazy_dod;               /* flag that indicates whether we should stop
                                   when we've seen all impatient PMCs */
    /*
     * DOD, GC blocking
     */
    UINTVAL DOD_block_level;    /* How many outstanding DOD block
                                   requests are there? */
    UINTVAL GC_block_level;     /* How many outstanding GC block
                                   requests are there? */
    /*
     * private data for the GC subsystem
     */
    void *  gc_private;         /* gc subsystem data */
};

struct Stash {
    struct PMC *stash_hash;
    struct Stash *parent_stash;
};

/* &gen_from_enum(interpinfo.pasm) prefix(INTERPINFO_) */

typedef enum {
    TOTAL_MEM_ALLOC = 1,
    DOD_RUNS,
    COLLECT_RUNS,
    ACTIVE_PMCS,
    ACTIVE_BUFFERS,
    TOTAL_PMCS,
    TOTAL_BUFFERS,
    HEADER_ALLOCS_SINCE_COLLECT,
    MEM_ALLOCS_SINCE_COLLECT,
    TOTAL_COPIED,
    IMPATIENT_PMCS,
    LAZY_DOD_RUNS,
    EXTENDED_PMCS,

    /* interpinfo_p constants */
    CURRENT_SUB,
    CURRENT_CONT,
    CURRENT_OBJECT,
    CURRENT_NAMESPACE_ROOT,
    CURRENT_LEXPAD
} Interpinfo_enum;

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
