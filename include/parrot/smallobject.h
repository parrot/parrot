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

typedef void (*add_free_object_fn_type)(struct Parrot_Interp *,
                             struct Small_Object_Pool *, void *);
typedef void * (*get_free_object_fn_type)(struct Parrot_Interp *,
                             struct Small_Object_Pool *);
typedef void  (*alloc_objects_fn_type)(struct Parrot_Interp *,
                           struct Small_Object_Pool *);

/* Tracked resource pool */
struct Small_Object_Pool {
    struct Small_Object_Arena *last_Arena;
    size_t object_size;     /* size in bytes of an individual pool item */
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
};

extern add_free_object_fn_type add_free_object_fn;
extern get_free_object_fn_type get_free_object_fn;
extern alloc_objects_fn_type   alloc_objects_fn;
extern alloc_objects_fn_type   more_objects_fn;

INTVAL contained_in_pool(struct Parrot_Interp *,
                         struct Small_Object_Pool *, void *);
size_t get_max_pool_address(struct Parrot_Interp *interpreter,
                            struct Small_Object_Pool *pool);
size_t get_min_pool_address(struct Parrot_Interp *interpreter,
                            struct Small_Object_Pool *pool);


void more_traceable_objects(struct Parrot_Interp *interpreter,
                struct Small_Object_Pool *pool);
void more_non_traceable_objects(struct Parrot_Interp *interpreter,
                struct Small_Object_Pool *pool);

void add_free_object(struct Parrot_Interp *,
                     struct Small_Object_Pool *, void *);

void alloc_objects(struct Parrot_Interp *, struct Small_Object_Pool *);

struct Small_Object_Pool * new_small_object_pool(struct Parrot_Interp *,
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
