/* resources.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Defines the resource allocation API
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_RESOURCES_H_GUARD
#define PARROT_RESOURCES_H_GUARD

#include "parrot/parrot.h"

typedef struct Memory_Block {
    size_t free;
    size_t size;
    struct Memory_Block *prev;
    struct Memory_Block *next;
    char *start;
    char *top;
} Memory_Block;

typedef struct Memory_Pool {
    Memory_Block *top_block;
    void (*compact)(PARROT_INTERP, struct Memory_Pool *);
    size_t minimum_block_size;
    size_t total_allocated; /* total bytes allocated to this pool */
    size_t guaranteed_reclaimable;     /* bytes that can definitely be reclaimed*/
    size_t possibly_reclaimable;     /* bytes that can possibly be reclaimed
                                      * (above plus COW-freed bytes) */
    FLOATVAL reclaim_factor; /* minimum percentage we will reclaim */
} Memory_Pool;


/* HEADERIZER BEGIN: src/gc/resources.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
char * aligned_mem(ARGIN(const Buffer *buffer), ARGIN(char *mem))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t aligned_size(ARGIN(const Buffer *buffer), size_t len)
        __attribute__nonnull__(1);

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t aligned_string_size(size_t len);

void compact_pool(PARROT_INTERP, ARGMOD(Memory_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void * mem_allocate(PARROT_INTERP, size_t size, ARGMOD(Memory_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

void merge_pools(ARGMOD(Memory_Pool *dest), ARGMOD(Memory_Pool *source))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*source);

void Parrot_allocate(PARROT_INTERP, ARGOUT(Buffer *buffer), size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

void Parrot_destroy_memory_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_profile_end(PARROT_INTERP, int what)
        __attribute__nonnull__(1);

void Parrot_gc_profile_start(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_initialize_memory_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_aligned_mem __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(buffer) \
    || PARROT_ASSERT_ARG(mem)
#define ASSERT_ARGS_aligned_size __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(buffer)
#define ASSERT_ARGS_aligned_string_size __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_compact_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_mem_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_merge_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(dest) \
    || PARROT_ASSERT_ARG(source)
#define ASSERT_ARGS_Parrot_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(buffer)
#define ASSERT_ARGS_Parrot_destroy_memory_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_profile_end __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_profile_start __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_initialize_memory_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/resources.c */

typedef struct Arenas {
    Memory_Pool *memory_pool;
    Memory_Pool *constant_string_pool;
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
    void (*do_gc_mark)(PARROT_INTERP, UINTVAL flags);
    void (*finalize_gc_system) (PARROT_INTERP);
    void (*init_pool)(PARROT_INTERP, struct Small_Object_Pool *);
    /*
     * statistics for GC
     */
    size_t  gc_mark_runs;       /* Number of times we've done a mark run*/
    size_t  gc_lazy_mark_runs;  /* Number of successful lazy mark runs */
    size_t  gc_collect_runs;    /* Number of times we've done a memory
                                   compaction */
    size_t  mem_allocs_since_last_collect;      /* The number of memory
                                                 * allocations from the
                                                 * system since the last
                                                 * compaction run */
    size_t  header_allocs_since_last_collect;   /* The number of header
                                                 * blocks allocated from
                                                 * the system since the last
                                                 * GC run */
    size_t  memory_allocated;     /* The total amount of
                                   * allocatable memory
                                   * allocated. Doesn't count
                                   * memory for headers or
                                   * internal structures or
                                   * anything */
    UINTVAL memory_collected;     /* Total amount of memory copied
                                     during collection */
    UINTVAL num_early_gc_PMCs;    /* how many PMCs want immediate destruction */
    UINTVAL num_early_PMCs_seen;  /* how many such PMCs has GC seen */
    UINTVAL num_extended_PMCs;    /* active PMCs having pmc_ext */
    PMC* gc_mark_start;           /* first PMC marked during a GC run */
    PMC* gc_mark_ptr;             /* last PMC marked during a GC run */
    PMC* gc_trace_ptr;            /* last PMC trace_children was called on */
    int lazy_gc;                  /* flag that indicates whether we should stop
                                     when we've seen all impatient PMCs */
    /*
     * GC blocking
     */
    UINTVAL gc_mark_block_level;  /* How many outstanding GC block
                                     requests are there? */
    UINTVAL gc_sweep_block_level; /* How many outstanding GC block
                                     requests are there? */
    /*
     * private data for the GC subsystem
     */
    void *  gc_private;           /* gc subsystem data */
} Arenas;

/* &gen_from_enum(interpinfo.pasm) prefix(INTERPINFO_) */

typedef enum {
    TOTAL_MEM_ALLOC = 1,
    GC_MARK_RUNS,
    GC_COLLECT_RUNS,
    ACTIVE_PMCS,
    ACTIVE_BUFFERS,
    TOTAL_PMCS,
    TOTAL_BUFFERS,
    HEADER_ALLOCS_SINCE_COLLECT,
    MEM_ALLOCS_SINCE_COLLECT,
    TOTAL_COPIED,
    IMPATIENT_PMCS,
    GC_LAZY_MARK_RUNS,
    EXTENDED_PMCS,
    CURRENT_RUNCORE,

    /* interpinfo_p constants */
    CURRENT_SUB,
    CURRENT_CONT,
    CURRENT_OBJECT,
    CURRENT_LEXPAD,

    /* interpinfo_s constants */
    EXECUTABLE_FULLNAME,
    EXECUTABLE_BASENAME,
    RUNTIME_PREFIX
} Interpinfo_enum;

/* &end_gen */

#endif /* PARROT_RESOURCES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
