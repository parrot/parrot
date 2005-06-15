#if !defined(PARROT_SMALLOBJECT_H_GUARD)
#define PARROT_SMALLOBJECT_H_GUARD

#include "parrot/parrot.h"

struct Small_Object_Arena {
    size_t used;
    size_t total_objects;
#if ARENA_DOD_FLAGS
    size_t object_size;     /* size in bytes of an individual pool item */
    UINTVAL * dod_flags;
    struct Small_Object_Pool * pool;
    size_t live_objects;
#endif /* ARENA_DOD_FLAGS */
    struct Small_Object_Arena *prev;
    struct Small_Object_Arena *next;
    void *start_objects;
};

#if ARENA_DOD_FLAGS
/*
 * objects on the free list are overlaid with
 * this data structure just for resetting
 * the on_free_list FLAG cheaper
 *
 * this structure should not be bigger then a PMC
 */
typedef struct {
    void *free_list_ptr;        /* generic free list ptr */
    size_t object_buflen_dont_use;
    UINTVAL object_flags_dont_use;
    UINTVAL *arena_dod_flag_ptr;/* ptr to the dod flag nibble */
    int flag_shift;         /* shift inside dod_flags */
} Dead_PObj;

#endif /* ARENA_DOD_FLAGS */

struct Small_Object_Pool;

typedef void (*add_free_object_fn_type)(Interp *,
                             struct Small_Object_Pool *, void *);
typedef void * (*get_free_object_fn_type)(Interp *,
                             struct Small_Object_Pool *);
typedef void  (*alloc_objects_fn_type)(Interp *,
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

#define PObj_to_GMSH(o) ( ((Gc_gms_hdr*)o)-1 )
#define GMSH_to_PObj(p) ( (PObj*) (p+1) )

/* the structure uses 2 ptrs itself */
#define GC_GMS_STORE_SIZE (64-2)

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
    UINTVAL gen_no;		        /* generation number */
    UINTVAL timely_destruct_obj_sofar; 	/* sum up to this generation */
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

#endif

/* Tracked resource pool */
struct Small_Object_Pool {
    struct Small_Object_Arena *last_Arena;
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
    UINTVAL align_1;    /* alignment (must be power of 2) minus one */
    /* adds a free object to the pool's free list  */
    add_free_object_fn_type     add_free_object;
    get_free_object_fn_type     get_free_object;
    alloc_objects_fn_type       alloc_objects;
    alloc_objects_fn_type       more_objects;
    /* gets and removes a free object from the pool's free list */
    /* allocates more objects */
    void *mem_pool;
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
};

/*
 * macros used in arena scan code to convert from object pointers
 * to arena pointers ...
 */

#if PARROT_GC_GMS
#  define GC_HEADER_SIZE (sizeof(Gc_gms_hdr))
#  define PObj_to_ARENA(o) PObj_to_GMSH(o)
#  define ARENA_to_PObj(p) GMSH_to_PObj((Gc_gms_hdr*)(p))
#else
#  define GC_HEADER_SIZE 0
#  define PObj_to_ARENA(o) (o)
#  define ARENA_to_PObj(p) (p)
#endif

INTVAL contained_in_pool(Interp *,
                         struct Small_Object_Pool *, void *);
size_t get_max_pool_address(Interp *interpreter,
                            struct Small_Object_Pool *pool);
size_t get_min_pool_address(Interp *interpreter,
                            struct Small_Object_Pool *pool);

struct Small_Object_Pool * new_small_object_pool(Interp *,
                                                 size_t, size_t);

int Parrot_is_const_pmc(Parrot_Interp, PMC *);

void Parrot_append_arena_in_pool(Interp *, struct Small_Object_Pool *pool,
    struct Small_Object_Arena *new_arena, size_t size);
void Parrot_add_to_free_list(Interp *, struct Small_Object_Pool *pool,
        struct Small_Object_Arena *arena, UINTVAL start, UINTVAL end);

#endif /* PARROT_SMALLOBJECT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
