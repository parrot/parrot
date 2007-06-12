#ifndef PARROT_SMALLOBJECT_H_GUARD
#define PARROT_SMALLOBJECT_H_GUARD

#  include "parrot/parrot.h"

typedef struct Small_Object_Arena {
    size_t used;
    size_t total_objects;
    struct Small_Object_Arena *prev;
    struct Small_Object_Arena *next;
    void *start_objects;
} Small_Object_Arena;


struct Small_Object_Pool;

typedef void (*add_free_object_fn_type)(Interp *,
                             struct Small_Object_Pool *, void *);
typedef void * (*get_free_object_fn_type)(Interp *,
                             struct Small_Object_Pool *);
typedef void (*alloc_objects_fn_type)(Interp *,
                           struct Small_Object_Pool *);

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

#  define PObj_to_GMSH(o) (((Gc_gms_hdr*)o)-1)
#  define GMSH_to_PObj(p) ((PObj*) (p+1))

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


/* HEADERIZER BEGIN: src/gc/smallobject.c */

INTVAL contained_in_pool( Interp *interp,
    Small_Object_Pool *pool /*NN*/,
    void *ptr )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

void gc_pmc_ext_pool_init( Interp *interp, Small_Object_Pool *pool );
Small_Object_Pool * new_small_object_pool( Interp *interp,
    size_t object_size,
    size_t objects_per_alloc )
        __attribute__warn_unused_result__;

void Parrot_add_to_free_list( Interp *interp,
    Small_Object_Pool *pool /*NN*/,
    Small_Object_Arena *arena /*NN*/,
    UINTVAL start,
    UINTVAL end )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_append_arena_in_pool( Interp *interp /*NN*/,
    Small_Object_Pool *pool /*NN*/,
    Small_Object_Arena *new_arena /*NN*/,
    size_t size )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_gc_ms_init( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

int Parrot_is_const_pmc( Parrot_Interp interp /*NN*/, PMC *pmc )
        __attribute__nonnull__(1);

void Parrot_small_object_pool_merge( Interp *interp,
    Small_Object_Pool *dest /*NN*/,
    Small_Object_Pool *source /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: src/gc/smallobject.c */

#endif /* PARROT_SMALLOBJECT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
