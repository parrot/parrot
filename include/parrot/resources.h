/* register.h
 *  Copyright: (When this is determined...it will go here)
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
    UINTVAL align_1;    /* alignment (must be power of 2) minus one */
    size_t total_allocated; /* total bytes allocated to this pool */
    size_t reclaimable;     /* bytes that can be reclaimed (approximate) */
    FLOATVAL reclaim_factor; /* minimum percentage we will reclaim */
};

PMC *new_pmc_header(struct Parrot_Interp *);
void free_pmc(PMC *);

STRING *new_string_header(struct Parrot_Interp *, UINTVAL flags);
Buffer *new_tracked_header(struct Parrot_Interp *, size_t size);
Buffer *new_buffer_header(struct Parrot_Interp *);
void free_buffer(Buffer *);

void *Parrot_allocate(struct Parrot_Interp *, void *, size_t size);
void *Parrot_allocate_string(struct Parrot_Interp *, STRING *, size_t size);

void Parrot_do_dod_run(struct Parrot_Interp *);
void Parrot_go_collect(struct Parrot_Interp *);

void *Parrot_reallocate(struct Parrot_Interp *interpreter, void *from,
                        size_t tosize);
void *Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *,
                               size_t tosize);

/* Functions needed for custom DOD routines */
PMC * mark_used(PMC *used_pmc, PMC *current_end_of_list);
void buffer_lives(Buffer *);

void Parrot_initialize_resource_pools(struct Parrot_Interp *);
void Parrot_initialize_memory_pools(struct Parrot_Interp *);

#define STRING_HEADERS_PER_ALLOC 16
#define PMC_HEADERS_PER_ALLOC 16
#define BUFFER_HEADERS_PER_ALLOC 16
#define SIZED_HEADERS_PER_ALLOC 16

struct PMC_Arena {
    size_t used;         /* Count of PMCs in this arena */
    struct PMC_Arena *prev;
    struct PMC_Arena *next;
    PMC *start_PMC;      /* Pointer to array of PMCs */
    size_t *GC_data;     /* Actually an array with one element per PMC */
};

struct Buffer_Arena {
    size_t used;
    struct Buffer_Arena *prev;
    struct Buffer_Arena *next;
    Buffer *start_Buffer;
};

/* Tracked resource pool */
struct Resource_Pool {
    void *last_Arena;
    void *free_list;
    size_t unit_size;     /* size in bytes of an individual pool item */
    size_t units_per_alloc; 
    size_t free_entries;    /* number of resources in the free pool */
    size_t replenish_level; /* minimum free entries before replenishing */
    void (*replenish)(struct Parrot_Interp *, struct Resource_Pool *);
    struct Memory_Pool *mem_pool;
};
        
struct Arenas {
    struct Memory_Pool *memory_pool;
    struct Memory_Pool *string_pool;
    struct Memory_Pool *constant_string_pool;
    struct Resource_Pool *string_header_pool;
    struct Resource_Pool *pmc_pool;
    struct Resource_Pool *buffer_header_pool;
    struct Resource_Pool *constant_string_header_pool;
    struct Resource_Pool **sized_header_pools;
    size_t num_sized;
};

struct Stash {
    struct PMC *stash_hash;
    struct Stash *parent_stash;
};

#define TOTAL_MEM_ALLOC 1
#define DOD_RUNS 2
#define COLLECT_RUNS 3
#define ACTIVE_PMCS 4
#define ACTIVE_BUFFERS 5
#define TOTAL_PMCS 6
#define TOTAL_BUFFERS 7
#define HEADERS_ALLOC_SINCE_COLLECT 8
#define MEM_ALLOCS_SINCE_COLLECT 9
#define TOTAL_COPIED 10

#endif /* PARROT_RESOURCES_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
