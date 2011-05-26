/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/gc_private.h - private header file for the GC subsystem

=head1 DESCRIPTION

This is a private header file for the GC subsystem. It contains definitions
that are only for use in the GC and don't need to be included in the rest of
Parrot.
*/

#ifndef PARROT_GC_PRIVATE_H_GUARD
#define PARROT_GC_PRIVATE_H_GUARD

#include "parrot/settings.h"
#include "variable_size_pool.h"

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack. Defined in src/gc/system.c */
extern int CONSERVATIVE_POINTER_CHASING;
#endif

#ifdef __ia64__

#  include <ucontext.h>
extern void *flush_reg_store(void);
#  define BACKING_STORE_BASE 0x80000fff80000000

#  ifdef __hpux
#    include <sys/pstat.h>
#    include <ia64/sys/inline.h>
#  endif /* __hpux */

#endif /* __ia64__ */

/* the percent of used Arena items at which to trace next time through */
#define GC_DEBUG_REPLENISH_LEVEL_FACTOR        0.0
#define GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR 1
#define REPLENISH_LEVEL_FACTOR                 0.5

/* this factor is totally arbitrary, but gives good timings for stress.pasm */
#define UNITS_PER_ALLOC_GROWTH_FACTOR          1.75

#define POOL_MAX_BYTES                         65536 * 128
#define GC_SIZE_THRESHOLD                      1024  * 1024
#define GC_DEFAULT_DYNAMIC_THRESHOLD           75
#define GC_DEFAULT_MIN_THRESHOLD               4 * 1024 * 1024
/* promills of system memory */
#define GC_DEFAULT_NURSERY_SIZE                2

#define PMC_HEADERS_PER_ALLOC     4096 * 10 / sizeof (PMC)
#define BUFFER_HEADERS_PER_ALLOC  4096      / sizeof (Buffer)
#define STRING_HEADERS_PER_ALLOC  4096 * 20 / sizeof (STRING)

#define CONSTANT_PMC_HEADERS_PER_ALLOC 4096 / sizeof (PMC)
#define GET_SIZED_POOL_IDX(x) ((x) / sizeof (void *))
#define GC_NUM_INITIAL_FIXED_SIZE_POOLS 128


/* these values are used for the attribute allocator */
#define GC_ATTRIB_POOLS_HEADROOM 8
#define GC_FIXED_SIZE_POOL_SIZE 4096

/* Set to 1 if we want to use the fixed-size allocator. Set to 0 if we want
   to allocate these things using mem_sys_allocate instead */
#define GC_USE_FIXED_SIZE_ALLOCATOR 1

/* We're using this here to add an additional pointer to a PObj without
   having to actually add an entire pointer to every PObj-alike structure
   in Parrot. Astute observers may notice that if the PObj is comprised of
   only an INTVAL, then there are some systems where sizeof(PObj*) can be
   larger then sizeof(PObj), thus creating overflow. However PObjs are never
   used by themselves, things like PMCs and STRINGs are cast to PObj in the
   GC, so we should have plenty of space. */

typedef struct GC_MS_PObj_Wrapper {
    size_t flags;
    struct GC_MS_PObj_Wrapper * next_ptr;
} GC_MS_PObj_Wrapper;

/* how often to skip a full GC when this pool has nothing free */
typedef enum _gc_skip_type_enum {
    GC_NO_SKIP = 0,
    GC_ONE_SKIP,        /* unused */
    GC_ALWAYS_SKIP,
    GC_NEVER_SKIP       /* unused */
} gc_skip_type_enum;

/** statistics for GC **/
typedef struct GC_Statistics {
    size_t  gc_mark_runs;       /* Number of times we've done a mark run */
    size_t  gc_lazy_mark_runs;  /* Number of successful lazy mark runs */
    size_t  gc_collect_runs;    /* Number of times we've done a memory
                                   compaction */
    size_t  mem_allocs_since_last_collect;      /* The number of memory
                                                 * allocations from the
                                                 * system since the last
                                                 * compaction run.
                                                 * UNUSED, ALWAYS 0 */
    size_t  header_allocs_since_last_collect;   /* The size of header
                                                 * blocks allocated from
                                                 * the system since the last
                                                 * GC run.
                                                 * UNUSED, ALWAYS 0 */
    size_t  memory_allocated;     /* The total amount of memory allocated
                                   * in fixed and variable size pools.
                                   * Doesn't count memory for internal
                                   * structures */
    size_t  memory_used;          /* The total amount of memory used
                                   * in fixed and variable size
                                   * pools. Also includes memory in
                                   * variable size pools that has been
                                   * freed but can only be reclaimed
                                   * by a GC run */
    size_t  mem_used_last_collect;    /* The total amount of
                                       * memory used after
                                       * the last GC run */
    UINTVAL memory_collected;     /* Total amount of memory copied
                                     during collection */

} GC_Statistics;

/* Callback for live string. Use Buffer for now... */
typedef void (*string_iterator_callback)(PARROT_INTERP, Buffer *str, void *data);

typedef struct GC_Subsystem {
    /* Which GC subsystem are we using? See PARROT_GC_DEFAULT_TYPE in
     * include/parrot/settings.h for possible values */
    gc_sys_type_enum sys_type;

    /** Function hooks that each subsystem MUST provide */
    void (*finalize_gc_system) (PARROT_INTERP);
    void (*destroy_child_interp)(ARGMOD(Interp *dest_interp), ARGIN(Interp *child_interp));

    void (*do_gc_mark)(PARROT_INTERP, UINTVAL flags);
    void (*compact_string_pool)(PARROT_INTERP);

    void (*mark_special)(PARROT_INTERP, ARGMOD(PMC *pmc));
    void (*pmc_needs_early_collection)(PARROT_INTERP, ARGMOD(PMC *));

    void (*init_pool)(PARROT_INTERP, ARGMOD(struct Fixed_Size_Pool *));

    PMC* (*allocate_pmc_header)(PARROT_INTERP, UINTVAL flags);
    void (*free_pmc_header)(PARROT_INTERP, ARGFREE(PMC *));

    STRING* (*allocate_string_header)(PARROT_INTERP, UINTVAL flags);
    void    (*free_string_header)(PARROT_INTERP, ARGFREE(STRING *));

    Buffer* (*allocate_bufferlike_header)(PARROT_INTERP, size_t size);
    void    (*free_bufferlike_header)(PARROT_INTERP, ARGFREE(Buffer *), size_t size);

    int  (*is_pmc_ptr)(PARROT_INTERP, ARGIN_NULLOK(void *));
    int  (*is_string_ptr)(PARROT_INTERP, ARGIN_NULLOK(void *));
    void (*mark_str_header)(PARROT_INTERP, ARGMOD(STRING *));
    void (*mark_pmc_header)(PARROT_INTERP, ARGMOD(PMC *));

    void* (*allocate_pmc_attributes)(PARROT_INTERP, ARGMOD(PMC *));
    void (*free_pmc_attributes)(PARROT_INTERP, ARGMOD(PMC *));

    void (*allocate_string_storage)(PARROT_INTERP, ARGMOD(STRING *str), size_t size);
    void (*reallocate_string_storage)(PARROT_INTERP, ARGMOD(STRING *str), size_t size);

    void (*allocate_buffer_storage)(PARROT_INTERP, ARGMOD(Buffer *buffer), size_t nsize);
    void (*reallocate_buffer_storage)(PARROT_INTERP, ARGMOD(Buffer *buffer), size_t newsize);

    void* (*allocate_fixed_size_storage)(PARROT_INTERP, size_t size);
    void (*free_fixed_size_storage)(PARROT_INTERP, size_t size, ARGMOD(void *));

    void* (*allocate_memory_chunk)(PARROT_INTERP, size_t size);
    void* (*reallocate_memory_chunk)(PARROT_INTERP, ARGFREE(void *data), size_t newsize);
    void* (*allocate_memory_chunk_with_interior_pointers)(PARROT_INTERP, size_t size);
    void* (*reallocate_memory_chunk_with_interior_pointers)(PARROT_INTERP, ARGFREE(void *data),
            size_t oldsize, size_t newsize);
    void (*free_memory_chunk)(PARROT_INTERP, ARGFREE(void *data));

    void (*block_mark)(PARROT_INTERP);
    void (*unblock_mark)(PARROT_INTERP);
    unsigned int (*is_blocked_mark)(PARROT_INTERP);

    void (*block_sweep)(PARROT_INTERP);
    void (*unblock_sweep)(PARROT_INTERP);
    unsigned int (*is_blocked_sweep)(PARROT_INTERP);

    /* Introspection. Each GC must provide this function. Even with fake data */
    /* Return by value to simplify memory management */
    size_t (*get_gc_info)(PARROT_INTERP, Interpinfo_enum);

    /* Get boundaries of allocated memory. Used during scanning of C stack */
    void* (*get_low_str_ptr)(PARROT_INTERP);
    void* (*get_high_str_ptr)(PARROT_INTERP);
    void* (*get_low_pmc_ptr)(PARROT_INTERP);
    void* (*get_high_pmc_ptr)(PARROT_INTERP);

    /* Iterate over _live_ strings. Used for string pool compacting */
    void (*iterate_live_strings)(PARROT_INTERP, string_iterator_callback callback, void *data);

    /* Write barrier */
    void (*write_barrier)(PARROT_INTERP, ARGMOD(PMC *));

    /* Statistic for GC */
    struct GC_Statistics stats;

    /* Holds system-specific data structures */
    void * gc_private;
} GC_Subsystem;



/* This header structure describes an arena: a block of memory that is part of a
   fixed-sized pool. The arena has enough memory for 'total_objects' objects
   of a particular size specified in the pool. */

typedef struct Fixed_Size_Arena {
    size_t                   used;          /* Number of objects slots used. */
    size_t                   total_objects; /* Total number of object slots. */
    struct Fixed_Size_Arena *prev;          /* Pointer to previous arena. */
    struct Fixed_Size_Arena *next;          /* Pointer to next arena. */
    void                    *start_objects; /* Pointer to arena memory. */
} Fixed_Size_Arena;

/* This simple header structure describes a free PMC attribute object.
   A list of them hang off the PMC attribute pool. */

typedef struct PMC_Attribute_Free_List {
    struct PMC_Attribute_Free_List * next; /* Pointer to next free object. */
} PMC_Attribute_Free_List;

/* This header structure describes a PMC attribute arena: A block of memory
   that is part of a PMC attribute pool. The allocatable memory follows
   this header. */

typedef struct PMC_Attribute_Arena {
    struct PMC_Attribute_Arena * next;  /* Pointer to next arena. */
    struct PMC_Attribute_Arena * prev;  /* Pointer to previous arena. */
} PMC_Attribute_Arena;

/* This structure describes a PMC attribute pool. A vector of them hang
   off the Memory_Pools root structure. */

typedef struct PMC_Attribute_Pool {
    size_t attr_size;                    /* Size of attribute object. */
    size_t total_objects;                /* Total objects in the pool. */
    size_t objects_per_alloc;            /* Number of object slots to allocate. */
    size_t num_free_objects;             /* Number of objects on the free list. */
    PMC_Attribute_Free_List * free_list; /* List of free object slots, or NULL. */
    PMC_Attribute_Arena     * top_arena; /* Pointer to most recent arena. */
    PMC_Attribute_Free_List * newfree;   /* Pointer to next object slot in
                                            latest arena, or NULL (slots weren't
                                            put on free list). */
    PMC_Attribute_Free_List * newlast;   /* High water mark in arena. */

} PMC_Attribute_Pool;

/* This structure describes a fixed-size memory pool. Various such pools
   hang off the Memory_Pools root structure. */

typedef struct Fixed_Size_Pool {
    size_t object_size;                 /* Size in bytes of an individual pool
                                           object. This size may include
                                           a GC system-specific GC header. */

    size_t start_arena_memory;          /* Address of the lowest arena. */
    size_t end_arena_memory;            /* And the highest one. */

    Fixed_Size_Arena *last_Arena;       /* Pointer to most recent arena. */
    GC_MS_PObj_Wrapper * free_list;     /* List of free object slots, or NULL. */
    size_t num_free_objects;            /* Number of objects on the free list. */
    size_t total_objects;               /* Total objects in the pool. */

    PARROT_OBSERVER const char *name;   /* Name of pool. */

    size_t objects_per_alloc;           /* Number of object slots to allocate. */

    int skip;                           /* How often to skip full GC
                                           (see gc_skip_type_enum). */
    size_t replenish_level;             /* Replenish pool when free object slots
                                           goes below this level. */

    add_free_object_fn_type add_free_object; /* Adds a free object to
                                                the pool's free list  */
    get_free_object_fn_type get_free_object; /* Gets and removes a free object
                                                from the pool's free list. */
    alloc_objects_fn_type   alloc_objects;   /* Allocates an arena for objects. */
    alloc_objects_fn_type   more_objects;    /* Obtain more free objects. */
    gc_object_fn_type       gc_object;       /* GCs object during sweep. */

    /* Contains GC system-specific data structures ... unused at the moment,
     * but this is where it should go when we need it ...
    union {
    } gc_private;
    */

    void *newfree;    /* Pointer to next object slot in
                         latest arena, or NULL (slots weren't
                         put on free list). */
    void *newlast;    /* High water mark in arena. */

} Fixed_Size_Pool;

/* String GC subsystem data */
typedef struct String_GC {
    Variable_Size_Pool  *memory_pool;           /* General memory pool. */
    Variable_Size_Pool  *constant_string_pool;  /* Constant string pool (not
                                                   compacted */
} String_GC;

typedef struct Memory_Pools {
    String_GC            string_gc;

    Fixed_Size_Pool     *string_header_pool;
    Fixed_Size_Pool     *pmc_pool;
    Fixed_Size_Pool     *constant_pmc_pool;
    Fixed_Size_Pool     *constant_string_header_pool;
    Fixed_Size_Pool    **sized_header_pools;
    size_t               num_sized;

    PMC_Attribute_Pool **attrib_pools;
    size_t               num_attribs;

    /* GC blocking */
    UINTVAL gc_mark_block_level;  /* How many outstanding GC block
                                     requests are there? */
    UINTVAL gc_sweep_block_level; /* How many outstanding GC block
                                     requests are there? */

    PMC    *gc_mark_start;        /* first PMC marked during a GC run */
    PMC    *gc_mark_ptr;          /* last PMC marked during a GC run */
    PMC    *gc_trace_ptr;         /* last PMC trace_children was called on */
    int     lazy_gc;              /* flag that indicates whether we should stop
                                     when we've seen all impatient PMCs */
    UINTVAL num_early_gc_PMCs;    /* how many PMCs want immediate destruction */
    UINTVAL num_early_PMCs_seen;  /* how many such PMCs has GC seen */

    /* private data for the GC subsystem */
    void *gc_private;             /* GC subsystem data */
} Memory_Pools;


/* HEADERIZER BEGIN: src/gc/system.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void trace_system_areas(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_system_areas __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/system.c */

/* HEADERIZER BEGIN: src/gc/mark_sweep.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
INTVAL contained_in_pool(
    ARGIN(const Fixed_Size_Pool *pool),
    ARGIN(const void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Fixed_Size_Pool * get_bufferlike_pool(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    size_t buffer_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

PARROT_IGNORABLE_RESULT
int /*@alt void@*/
header_pools_iterate_callback(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    int flag,
    ARGIN_NULLOK(void *arg),
    NOTNULL(const pool_iter_fn func))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*mem_pools);

void initialize_fixed_size_pools(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

void mark_special(PARROT_INTERP, Memory_Pools *mem_pools, ARGIN(PMC *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

void Parrot_add_to_free_list(PARROT_INTERP,
    ARGMOD(Fixed_Size_Pool *pool),
    ARGMOD(Fixed_Size_Arena *arena))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*arena);

void Parrot_append_arena_in_pool(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool),
    ARGMOD(Fixed_Size_Arena *new_arena),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*mem_pools)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*new_arena);

void Parrot_gc_clear_live_bits(PARROT_INTERP,
    ARGIN(const Fixed_Size_Pool *pool))
        __attribute__nonnull__(2);

void Parrot_gc_run_init(PARROT_INTERP, ARGMOD(Memory_Pools *mem_pools))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

void Parrot_gc_sweep_pool(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*mem_pools)
        FUNC_MODIFIES(*pool);

int Parrot_gc_trace_root(PARROT_INTERP,
    ARGMOD_NULLOK(Memory_Pools *mem_pools),
    Parrot_gc_trace_type trace)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*mem_pools);

#define ASSERT_ARGS_contained_in_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_get_bufferlike_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_header_pools_iterate_callback __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(func))
#define ASSERT_ARGS_initialize_fixed_size_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_mark_special __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_Parrot_add_to_free_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(arena))
#define ASSERT_ARGS_Parrot_append_arena_in_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(new_arena))
#define ASSERT_ARGS_Parrot_gc_clear_live_bits __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_run_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_Parrot_gc_sweep_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_Parrot_gc_trace_root __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/mark_sweep.c */


/* HEADERIZER BEGIN: src/gc/alloc_resources.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void check_buffer_ptr(
    ARGMOD(Buffer * pobj),
    ARGMOD(Variable_Size_Pool * pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* pobj)
        FUNC_MODIFIES(* pool);

void merge_pools(
    ARGMOD(Variable_Size_Pool *dest),
    ARGMOD(Variable_Size_Pool *source))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*source);

void Parrot_gc_destroy_header_pools(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*mem_pools);

void Parrot_gc_merge_memory_pools(
    ARGMOD(Interp *dest_interp),
    ARGMOD(Memory_Pools *dest_arena),
    ARGIN(const Memory_Pools *source_arena))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dest_interp)
        FUNC_MODIFIES(*dest_arena);

#define ASSERT_ARGS_check_buffer_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pobj) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_merge_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_Parrot_gc_destroy_header_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_Parrot_gc_merge_memory_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest_interp) \
    , PARROT_ASSERT_ARG(dest_arena) \
    , PARROT_ASSERT_ARG(source_arena))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/alloc_resources.c */

/* GC subsystem init functions */
/* HEADERIZER BEGIN: src/gc/gc_ms.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void gc_ms_allocate_buffer_storage(PARROT_INTERP,
    ARGIN(Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
void * gc_ms_allocate_fixed_size_storage(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

void gc_ms_allocate_string_storage(PARROT_INTERP,
    ARGIN(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void gc_ms_compact_memory_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

void gc_ms_free_fixed_size_storage(PARROT_INTERP,
    size_t size,
    ARGFREE_NOTNULL(void *data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

void gc_ms_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void gc_ms_mark_pmc_header(PARROT_INTERP, ARGMOD_NULLOK(PMC *obj))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*obj);

void gc_ms_pmc_needs_early_collection(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void gc_ms_reallocate_buffer_storage(PARROT_INTERP,
    ARGIN(Buffer *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void gc_ms_reallocate_string_storage(PARROT_INTERP,
    ARGIN(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t Parrot_gc_get_info(PARROT_INTERP,
    Interpinfo_enum which,
    ARGIN(GC_Statistics *stats))
        __attribute__nonnull__(3);

void Parrot_gc_ms_init(PARROT_INTERP, Parrot_GC_Init_Args *args)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int Parrot_gc_ms_needed(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_gc_ms_allocate_buffer_storage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms_allocate_fixed_size_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_allocate_string_storage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms_compact_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_free_fixed_size_storage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_gc_ms_free_pmc_attributes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms_mark_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_ms_pmc_needs_early_collection \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_ms_reallocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_ms_reallocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_Parrot_gc_get_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(stats))
#define ASSERT_ARGS_Parrot_gc_ms_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_gc_ms_needed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/gc_ms.c */

/* HEADERIZER BEGIN: src/gc/gc_inf.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_gc_inf_init(PARROT_INTERP, Parrot_GC_Init_Args *args)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_gc_inf_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/gc_inf.c */

/* HEADERIZER BEGIN: src/gc/gc_ms2.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_gc_maybe_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

void Parrot_gc_ms2_init(PARROT_INTERP, ARGIN(Parrot_GC_Init_Args *args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_gc_maybe_mark_and_sweep \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_gc_ms2_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/gc_ms2.c */

/* HEADERIZER BEGIN: src/gc/gc_gms.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void gc_gms_print_stats_always(PARROT_INTERP, ARGIN(const char* header))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_gc_gms_init(PARROT_INTERP, ARGIN(Parrot_GC_Init_Args *args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int pobj2gen(ARGIN(PObj *pmc))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_gc_gms_print_stats_always __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(header))
#define ASSERT_ARGS_Parrot_gc_gms_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_pobj2gen __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/gc_gms.c */

/* HEADERIZER BEGIN: src/gc/string_gc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_gc_str_allocate_buffer_storage(PARROT_INTERP,
    ARGIN(String_GC *gc),
    ARGOUT(Buffer *buffer),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*buffer);

void Parrot_gc_str_allocate_string_storage(PARROT_INTERP,
    ARGIN(String_GC *gc),
    ARGMOD(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*str);

void Parrot_gc_str_compact_pool(PARROT_INTERP, ARGIN(String_GC *gc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_gc_str_finalize(PARROT_INTERP, ARGMOD(String_GC *gc))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*gc);

void Parrot_gc_str_free_buffer_storage(PARROT_INTERP,
    ARGIN(String_GC *gc),
    ARGMOD(Buffer *b))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*b);

void Parrot_gc_str_initialize(PARROT_INTERP, ARGMOD(String_GC *gc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*gc);

void Parrot_gc_str_reallocate_buffer_storage(PARROT_INTERP,
    ARGIN(String_GC *gc),
    ARGMOD(Buffer *buffer),
    size_t newsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*buffer);

void Parrot_gc_str_reallocate_string_storage(PARROT_INTERP,
    ARGIN(String_GC *gc),
    ARGMOD(STRING *str),
    size_t newsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*str);

#define ASSERT_ARGS_Parrot_gc_str_allocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(gc) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_gc_str_allocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(gc) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_Parrot_gc_str_compact_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(gc))
#define ASSERT_ARGS_Parrot_gc_str_finalize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(gc))
#define ASSERT_ARGS_Parrot_gc_str_free_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(gc) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_Parrot_gc_str_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(gc))
#define ASSERT_ARGS_Parrot_gc_str_reallocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(gc) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_gc_str_reallocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(gc) \
    , PARROT_ASSERT_ARG(str))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/string_gc.c */

#endif /* PARROT_GC_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
