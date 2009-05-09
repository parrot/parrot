/* gc_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 */

#ifndef PARROT_GC_API_H_GUARD
#define PARROT_GC_API_H_GUARD

/* Set this to 1 to see if unanchored objects are found in system areas.
 * Please note: these objects might be bogus */
#define GC_VERBOSE 0

#include "parrot/parrot.h"

/*
 * we need an alignment that is the same as malloc(3) have for
 * allocating Buffer items like FLOATVAL (double)
 * This should be either a config hint or tested
 */
#ifdef MALLOC_ALIGNMENT
#  define BUFFER_ALIGNMENT MALLOC_ALIGNMENT
#else
/* or (2 * sizeof (size_t)) */
#  define BUFFER_ALIGNMENT 8
#endif

#define BUFFER_ALIGN_1 (BUFFER_ALIGNMENT - 1)
#define BUFFER_ALIGN_MASK ~BUFFER_ALIGN_1

#define WORD_ALIGN_1 (sizeof (void *) - 1)
#define WORD_ALIGN_MASK ~WORD_ALIGN_1

/* pool iteration */
typedef enum {
    POOL_PMC    = 0x01,
    POOL_BUFFER = 0x02,
    POOL_CONST  = 0x04,
    POOL_ALL    = 0x07
} pool_iter_enum;

typedef int (*pool_iter_fn)(PARROT_INTERP, struct Small_Object_Pool *, int, void*);

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

typedef struct Small_Object_Arena {
    size_t                     used;
    size_t                     total_objects;
    struct Small_Object_Arena *prev;
    struct Small_Object_Arena *next;
    void                      *start_objects;
} Small_Object_Arena;

struct Small_Object_Pool;

typedef enum {
    GC_TRACE_FULL,
    GC_TRACE_ROOT_ONLY,
    GC_TRACE_SYSTEM_ONLY
} Parrot_gc_trace_type;

typedef void (*add_free_object_fn_type)(PARROT_INTERP, struct Small_Object_Pool *, void *);
typedef void * (*get_free_object_fn_type)(PARROT_INTERP, struct Small_Object_Pool *);
typedef void (*alloc_objects_fn_type)(PARROT_INTERP, struct Small_Object_Pool *);
typedef void (*gc_object_fn_type)(PARROT_INTERP, struct Small_Object_Pool *, PObj *);

#if PARROT_GC_GMS
/*
 * all objects have this header in front of the actual
 * object pointer. The prev/next pointers chain all existing
 * objects for one pool (sizeclass) together.
 *
 * XXX this could lead to unaligned FLOATVALs in the adjacent PMC
 *     if that's true either insert a dummy or reorder PMC members
 *     ??? How is that possible?
 */
typedef struct _gc_gms_hdr {
    struct _gc_gms_hdr *prev;
    struct _gc_gms_hdr *next;
    struct _gc_gms_gen *gen;
    void *gc_dummy_align;       /* see above */
} Gc_gms_hdr;

#  define PObj_to_GMSH(o) (((Gc_gms_hdr*)(o))-1)
#  define GMSH_to_PObj(p) ((PObj*) ((p)+1))

/* the structure uses 2 ptrs itself */
#  define GC_GMS_STORE_SIZE (64-2)

typedef struct _gc_gms_hdr_store {
    struct _gc_gms_hdr_store *next;
    Gc_gms_hdr **ptr;                           /* insert location */
    Gc_gms_hdr * (store[GC_GMS_STORE_SIZE]);    /* array of hdr pointers */
} Gc_gms_hdr_store;

typedef struct _gc_gms_hdr_list {
    Gc_gms_hdr_store *first;
    Gc_gms_hdr_store *last;
} Gc_gms_hdr_list;


/*
 * all objects belong to one generation
 */
typedef struct _gc_gms_gen {
    UINTVAL gen_no;                     /* generation number */
    UINTVAL timely_destruct_obj_sofar;  /* sum up to this generation */
    UINTVAL black_color;                /* live color of this generation */
    struct _gc_gms_hdr *first;          /* first header in this generation */
    struct _gc_gms_hdr *last;           /* last header in this generation */
    struct _gc_gms_hdr *fin;            /* need destruction/finalization */
    struct Small_Object_Pool *pool;     /* where this generation belongs to */
    Gc_gms_hdr_list igp;                /* IGPs for this generation */
    UINTVAL n_possibly_dead;            /* overwritten count */
    UINTVAL n_objects;                  /* live objects count */
    struct _gc_gms_gen *prev;
    struct _gc_gms_gen *next;
} Gc_gms_gen;

#endif /* PARROT_GC_GMS */

/* Tracked resource pool */
typedef struct Small_Object_Pool {
    Small_Object_Arena *last_Arena;
    /* Size in bytes of an individual pool item. This size may include
     * a GC-system specific GC header.
     * See the macros below.
     */
    size_t object_size;
    size_t objects_per_alloc;
    size_t total_objects;
    size_t num_free_objects;    /* number of resources in the free pool */
    int skip;
    size_t replenish_level;
    void *free_list;
    /* adds a free object to the pool's free list  */
    add_free_object_fn_type     add_free_object;
    get_free_object_fn_type     get_free_object;
    alloc_objects_fn_type       alloc_objects;
    alloc_objects_fn_type       more_objects;
    gc_object_fn_type           gc_object;
    /* gets and removes a free object from the pool's free list */
    /* allocates more objects */
    struct Memory_Pool *mem_pool;
    size_t start_arena_memory;
    size_t end_arena_memory;
    const char *name;
#if PARROT_GC_GMS
    struct _gc_gms_hdr marker;          /* limit of list */
    struct _gc_gms_hdr *black;          /* alive */
    struct _gc_gms_hdr *black_fin;      /* alive, needs destruction */
    struct _gc_gms_hdr *gray;           /* to be scanned */
    struct _gc_gms_hdr *white;          /* unprocessed */
    struct _gc_gms_hdr *white_fin;      /* unprocesse, needs destruction */

    struct _gc_gms_gen *first_gen;      /* linked list of generations */
    struct _gc_gms_gen *last_gen;

#endif
} Small_Object_Pool;

/*
 * macros used in arena scan code to convert from object pointers
 * to arena pointers ...
 */

#if PARROT_GC_GMS
#  define GC_HEADER_SIZE (sizeof (Gc_gms_hdr))
#  define PObj_to_ARENA(o) PObj_to_GMSH(o)
#  define ARENA_to_PObj(p) GMSH_to_PObj((Gc_gms_hdr*)(p))
#else
#  define GC_HEADER_SIZE 0
#  define PObj_to_ARENA(o) (o)
#  define ARENA_to_PObj(p) (p)
#endif

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


/* Macros for recursively blocking and unblocking GC mark */
#define Parrot_block_GC_mark(interp) \
        { \
            (interp)->arena_base->gc_mark_block_level++; \
            Parrot_shared_gc_block(interp); \
        }

#define Parrot_unblock_GC_mark(interp) \
        if ((interp)->arena_base->gc_mark_block_level) { \
            (interp)->arena_base->gc_mark_block_level--; \
            Parrot_shared_gc_unblock(interp); \
        }

/* Macros for recursively blocking and unblocking GC sweep */
#define Parrot_block_GC_sweep(interp) \
        (interp)->arena_base->gc_sweep_block_level++

#define Parrot_unblock_GC_sweep(interp) \
        if ((interp)->arena_base->gc_sweep_block_level) \
            (interp)->arena_base->gc_sweep_block_level--

/* Macros for testing if the GC mark and sweep are blocked */
#define Parrot_is_blocked_GC_mark(interp) \
        ((interp)->arena_base->gc_mark_block_level)

#define Parrot_is_blocked_GC_sweep(interp) \
        ((interp)->arena_base->gc_sweep_block_level)

#define GC_trace_stack_FLAG    (UINTVAL)(1 << 0)   /* trace system areas and stack */
#define GC_trace_normal        (UINTVAL)(1 << 0)   /* the same */
#define GC_lazy_FLAG           (UINTVAL)(1 << 1)   /* timely destruction run */
#define GC_finish_FLAG         (UINTVAL)(1 << 2)   /* on Parrot exit: mark (almost) all PMCs dead and */
                                                   /* garbage collect. */

/* HEADERIZER BEGIN: src/gc/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_gc_mark_PObj_alive(PARROT_INTERP, ARGMOD(PObj *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

void Parrot_gc_add_pmc_ext(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void Parrot_gc_add_pmc_sync(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void Parrot_gc_allocate_aligned(PARROT_INTERP,
    ARGOUT(Buffer *buffer),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

void Parrot_gc_allocate_string_storage(PARROT_INTERP,
    ARGOUT(STRING *str),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

void Parrot_gc_cleanup_next_for_GC(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_compact_memory_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_destroy_header_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_destroy_memory_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_free_bufferlike_header(PARROT_INTERP,
    ARGMOD(PObj *obj),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

void Parrot_gc_free_pmc_ext(PARROT_INTERP, ARGMOD(PMC *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*p);

void Parrot_gc_initialize(PARROT_INTERP, ARGIN(void *stacktop))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_gc_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

void Parrot_gc_merge_header_pools(
    ARGMOD(Interp *dest_interp),
    ARGIN(Interp *source_interp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest_interp);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void * Parrot_gc_new_bufferlike_header(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_gc_new_pmc_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_gc_new_string_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int Parrot_gc_ptr_in_memory_pool(PARROT_INTERP, ARGIN(void *bufstart))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int Parrot_gc_ptr_is_pmc(PARROT_INTERP, ARGIN(void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_gc_reallocate_string_storage(PARROT_INTERP,
    ARGMOD(STRING *str),
    size_t newsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

void Parrot_reallocate(PARROT_INTERP,
    ARGMOD(Buffer *buffer),
    size_t newsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

#define ASSERT_ARGS_Parrot_gc_mark_PObj_alive __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_Parrot_gc_add_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_gc_add_pmc_sync __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_gc_allocate_aligned __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(buffer)
#define ASSERT_ARGS_Parrot_gc_allocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(str)
#define ASSERT_ARGS_Parrot_gc_cleanup_next_for_GC __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_compact_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_destroy_header_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_destroy_memory_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_free_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_Parrot_gc_free_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_Parrot_gc_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stacktop)
#define ASSERT_ARGS_Parrot_gc_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_merge_header_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(dest_interp) \
    || PARROT_ASSERT_ARG(source_interp)
#define ASSERT_ARGS_Parrot_gc_new_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_new_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_new_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_ptr_in_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(bufstart)
#define ASSERT_ARGS_Parrot_gc_ptr_is_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ptr)
#define ASSERT_ARGS_Parrot_gc_reallocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(str)
#define ASSERT_ARGS_Parrot_reallocate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(buffer)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/api.c */

/* write barrier */
#if PARROT_GC_MS
#  define GC_WRITE_BARRIER(interp, agg, old, _new) do { } while (0)
#  define GC_WRITE_BARRIER_KEY(interp, agg, old, old_key, _new, new_key) do { } while (0)
#endif

#if PARROT_GC_GMS
#  define GC_WRITE_BARRIER(interp, agg, old, _new) do { \
    UINTVAL gen_agg, gen_new; \
    if (!(_new) || PMC_IS_NULL(_new)) \
        break; \
    gen_agg = PObj_to_GMSH(agg)->gen->gen_no; \
    gen_new = PObj_to_GMSH(_new)->gen->gen_no; \
    if (gen_agg < gen_new) \
        parrot_gc_gms_wb((interp), (agg), (old), (_new)); \
} while (0)

#  define GC_WRITE_BARRIER_KEY(interp, agg, old, old_key, _new, new_key) do { \
    UINTVAL gen_agg, gen_new, gen_key; \
    if (!(_new) || PMC_IS_NULL(_new)) \
        break; \
    gen_agg = PObj_to_GMSH(agg)->gen->gen_no; \
    gen_new = PObj_to_GMSH(_new)->gen->gen_no; \
    gen_key = PObj_to_GMSH(new_key)->gen->gen_no; \
    if (gen_agg < gen_new || gen_agg < gen_key) \
        parrot_gc_gms_wb_key((interp), (agg), (old), (old_key), (_new), (new_key)); \
} while (0)

#endif

#endif /* PARROT_GC_API_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
