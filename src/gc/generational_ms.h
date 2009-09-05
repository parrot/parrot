#ifndef PARROT_GC_GMS_H_GUARD
#define PARROT_GC_GMS_H_GUARD

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

/* System-specific data for the Small_Object_Pool struct's gc_sys_private_data field. */
struct gc_gms_smallobjpool_data {
    Gc_gms_hdr marker;          /* limit of list ... also the anchor of the "header chain"
				   -- see gc_gms_chain_objects() */
    Gc_gms_hdr *black;          /* alive */
    Gc_gms_hdr *black_fin;      /* alive, needs destruction */
    Gc_gms_hdr *gray;           /* to be scanned */
    Gc_gms_hdr *white;          /* unprocessed */
    Gc_gms_hdr *white_fin;      /* unprocesse, needs destruction */

    Gc_gms_gen *first_gen;      /* linked list of generations */
    Gc_gms_gen *last_gen;
};


/*For arenas->gc_private*/
typedef struct Gc_gms_private {
    UINTVAL current_gen_no;             /* the nursery generation number */
} Gc_gms_private;


/*For gc_sys_priv_data in interp*/
struct gc_gms_sys_data {
  UINTVAL gc_generation;        /* GC generation number */
} gc_gms_sys_data;

#endif /*PARROT_GC_GMS_H_GUARD*/
