/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/alloc_resources.c - Allocate and deallocate buffer resources such as
STRINGS.

=head1 DESCRIPTION

Functions to manage non-PObj memory, including strings and buffers.

=head2 Parrot Memory Management Code

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"


#define RECLAMATION_FACTOR 0.20
#define WE_WANT_EVER_GROWING_ALLOCATIONS 0

/* show allocated blocks on stderr */
#define RESOURCE_DEBUG 0
#define RESOURCE_DEBUG_SIZE 1000000

typedef struct string_callback_data {
    Memory_Block *new_block;     /* A pointer to our working block */
    char         *cur_spot;      /* Where we're currently copying to */
} string_callback_data;

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const char * buffer_location(PARROT_INTERP, ARGIN(const Buffer *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void check_fixed_size_obj_pool(ARGIN(const Fixed_Size_Pool *pool))
        __attribute__nonnull__(1);

static void check_memory_system(ARGIN(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

static void check_var_size_obj_pool(ARGIN(const Variable_Size_Pool *pool))
        __attribute__nonnull__(1);

static void debug_print_buf(PARROT_INTERP, ARGIN(const Buffer *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void fix_pmc_syncs(
    ARGMOD(Interp *dest_interp),
    ARGIN(const Fixed_Size_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest_interp);

static void free_pool(ARGFREE(Fixed_Size_Pool *pool));
static void Parrot_gc_merge_buffer_pools(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *dest),
    ARGMOD(Fixed_Size_Pool *source))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*mem_pools)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*source);

static int sweep_cb_buf(PARROT_INTERP,
    ARGIN(Memory_Pools *mem_pools),
    ARGFREE(Fixed_Size_Pool *pool),
    int flag,
    void *arg)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int sweep_cb_pmc(PARROT_INTERP,
    ARGMOD(Memory_Pools *mem_pools),
    ARGMOD(Fixed_Size_Pool *pool),
    int flag,
    void *arg)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*mem_pools)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_buffer_location __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_check_fixed_size_obj_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_check_memory_system __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_check_var_size_obj_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_debug_print_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fix_pmc_syncs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest_interp) \
    , PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_free_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_gc_merge_buffer_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_sweep_cb_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools))
#define ASSERT_ARGS_sweep_cb_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(pool))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static const char * buffer_location(PARROT_INTERP, const Buffer *b)>

Returns a constant string representing the location of the given
Buffer C<b> in one of the PMC registers. If the PMC is not located
in one of the PMC registers of the current context, returns the
string C<"???">.

=cut

*/

#if RESOURCE_DEBUG
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static const char *
buffer_location(PARROT_INTERP, ARGIN(const Buffer *b))
{
    ASSERT_ARGS(buffer_location)
    Parrot_Context * const ctx = CONTEXT(interp);
    static char reg[10];
    int i;

    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; ++i) {
        PObj * const obj = (PObj *)Parrot_pcc_get_STRING_reg(interp, ctx, i);
        if ((PObj *)obj == b) {
            sprintf(reg, "S%d", (int)i);
            return reg;
        }
    }

    return "???";
}

/*

=item C<static void debug_print_buf(PARROT_INTERP, const Buffer *b)>

Prints a debug statement with information about the given PObj C<b>.

=cut

*/

static void
debug_print_buf(PARROT_INTERP, ARGIN(const Buffer *b))
{
    ASSERT_ARGS(debug_print_buf)
    fprintf(stderr, "found %p, len %d, flags 0x%08x at %s\n",
            b, (int)Buffer_buflen(b), (uint)PObj_get_FLAGS(b),
            buffer_location(interp, b));
}
#endif

/*

=back

=head2 Parrot Re/Allocate Code

=over 4

=item C<void merge_pools(Variable_Size_Pool *dest, Variable_Size_Pool *source)>

Merge two memory pools together. Do this by moving all memory blocks
from the C<*source> pool into the C<*dest> pool. The C<source> pool
is emptied, but is not destroyed here.

=cut

*/

void
merge_pools(ARGMOD(Variable_Size_Pool *dest), ARGMOD(Variable_Size_Pool *source))
{
    ASSERT_ARGS(merge_pools)
    Memory_Block *cur_block;

    cur_block = source->top_block;

    while (cur_block) {
        Memory_Block * const next_block = cur_block->prev;

        if (cur_block->free == cur_block->size)
            mem_internal_free(cur_block);
        else {
            cur_block->next        = NULL;
            cur_block->prev        = dest->top_block;

            dest->top_block        = cur_block;
            dest->total_allocated += cur_block->size;
        }
        cur_block = next_block;
    }

    dest->guaranteed_reclaimable += source->guaranteed_reclaimable;
    dest->possibly_reclaimable   += source->possibly_reclaimable;

    source->top_block              = NULL;
    source->total_allocated        = 0;
    source->possibly_reclaimable   = 0;
    source->guaranteed_reclaimable = 0;
}

/*

=item C<static void check_memory_system(const Memory_Pools *mem_pools)>

Checks the memory system of parrot on any corruptions, including
the string system.

=cut

*/

static void
check_memory_system(ARGIN(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(check_memory_system)
    size_t i;

    check_var_size_obj_pool(mem_pools->string_gc.memory_pool);
    check_var_size_obj_pool(mem_pools->string_gc.constant_string_pool);

    check_fixed_size_obj_pool(mem_pools->pmc_pool);
    check_fixed_size_obj_pool(mem_pools->constant_pmc_pool);
    check_fixed_size_obj_pool(mem_pools->string_header_pool);
    check_fixed_size_obj_pool(mem_pools->constant_string_header_pool);

    for (i = 0; i < mem_pools->num_sized; ++i) {
        const Fixed_Size_Pool * const pool = mem_pools->sized_header_pools[i];
        if (pool != NULL && pool != mem_pools->string_header_pool)
            check_fixed_size_obj_pool(pool);
    }
}

/*

=item C<static void check_fixed_size_obj_pool(const Fixed_Size_Pool *pool)>

Checks a small object pool, if it contains buffer it checks the buffers also.

=cut

*/

static void
check_fixed_size_obj_pool(ARGIN(const Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(check_fixed_size_obj_pool)
    size_t total_objects;
    size_t last_free_list_count;
    Fixed_Size_Arena * arena_walker;
    size_t free_objects;
    size_t count;
    GC_MS_PObj_Wrapper * pobj_walker;

    count = 10000000; /*detect unendless loop just use big enough number*/

    total_objects = pool->total_objects;
    last_free_list_count = 1;
    free_objects = 0;

    arena_walker = pool->last_Arena;
    while (arena_walker != NULL) {
        size_t i;
        PObj * object;

        total_objects -= arena_walker->total_objects;
        object = (PObj*)arena_walker->start_objects;

        for (i = 0; i < arena_walker->total_objects; ++i) {
            if (PObj_on_free_list_TEST(object)) {
                ++free_objects;
                pobj_walker = (GC_MS_PObj_Wrapper*)object;
                if (pobj_walker->next_ptr == NULL)
                    /* should happen only once at the end */
                    --last_free_list_count;
                else {
                    /* next item on free list should also be flaged as free item */
                    pobj_walker = (GC_MS_PObj_Wrapper*)pobj_walker->next_ptr;
                    PARROT_ASSERT(PObj_on_free_list_TEST((PObj*)pobj_walker));
                }
            }
            object = (PObj*)((char *)object + pool->object_size);
            PARROT_ASSERT(--count);
        }
        /*check the list*/
        if (arena_walker->prev != NULL)
            PARROT_ASSERT(arena_walker->prev->next == arena_walker);
        arena_walker = arena_walker->prev;
        PARROT_ASSERT(--count);
    }

    count = 10000000;

    PARROT_ASSERT(free_objects == pool->num_free_objects);

    pobj_walker = (GC_MS_PObj_Wrapper*)pool->free_list;
    while (pobj_walker != NULL) {
        PARROT_ASSERT(pool->start_arena_memory <= (size_t)pobj_walker);
        PARROT_ASSERT(pool->end_arena_memory > (size_t)pobj_walker);
        PARROT_ASSERT(PObj_on_free_list_TEST((PObj*)pobj_walker));
        --free_objects;
        pobj_walker = (GC_MS_PObj_Wrapper*)pobj_walker->next_ptr;
        PARROT_ASSERT(--count);
    }

    PARROT_ASSERT(total_objects == 0);
    PARROT_ASSERT(last_free_list_count == 0 || pool->num_free_objects == 0);
    PARROT_ASSERT(free_objects == 0);
}

/*

=item C<static void check_var_size_obj_pool(const Variable_Size_Pool *pool)>

Checks a memory pool, containing buffer data

=cut

*/

static void
check_var_size_obj_pool(ARGIN(const Variable_Size_Pool *pool))
{
    ASSERT_ARGS(check_var_size_obj_pool)
    Memory_Block *block_walker = (Memory_Block *)pool->top_block;

#ifdef NDEBUG
    while (block_walker) {
        block_walker = block_walker->prev;
    }
#else
    /* detect unendless loop with a big enough number */
    size_t count = 10000000;

    while (block_walker) {
        PARROT_ASSERT(block_walker->start
            == (char *)block_walker + sizeof (Memory_Block));
        PARROT_ASSERT((size_t)(block_walker->top - block_walker->start)
            == block_walker->size - block_walker->free);

        /*check the list*/
        if (block_walker->prev)
            PARROT_ASSERT(block_walker->prev->next == block_walker);
        block_walker = block_walker->prev;
        --count;
        PARROT_ASSERT(count > 0);
    }
#endif
}

/*

=item C<void check_buffer_ptr(Buffer * pobj, Variable_Size_Pool * pool)>

Checks wether the buffer is within the bounds of the memory pool

=cut

*/

void
check_buffer_ptr(ARGMOD(Buffer * pobj), ARGMOD(Variable_Size_Pool * pool))
{
    ASSERT_ARGS(check_buffer_ptr)
    Memory_Block * cur_block = pool->top_block;
    char * bufstart;

    bufstart = (char*)Buffer_bufstart(pobj);

    if (bufstart == NULL && Buffer_buflen(pobj) == 0)
        return;

    if (PObj_external_TEST(pobj) || PObj_sysmem_TEST(pobj)) {
        /*buffer does not come from the memory pool*/
        if (PObj_is_string_TEST(pobj)) {
            PARROT_ASSERT(((STRING *) pobj)->strstart >=
                (char *) Buffer_bufstart(pobj));
            PARROT_ASSERT(((STRING *) pobj)->strstart +
                ((STRING *) pobj)->strlen <=
                (char *) Buffer_bufstart(pobj) + Buffer_buflen(pobj));
        }
        return;
    }

    if (PObj_is_COWable_TEST(pobj))
        bufstart -= sizeof (void*);

    while (cur_block) {
        if ((char *)bufstart >= cur_block->start &&
            (char *)Buffer_bufstart(pobj) +
            Buffer_buflen(pobj) < cur_block->start + cur_block->size) {
            if (PObj_is_string_TEST(pobj)) {
                PARROT_ASSERT(((STRING *)pobj)->strstart >=
                    (char *)Buffer_bufstart(pobj));
                PARROT_ASSERT(((STRING *)pobj)->strstart +
                    ((STRING *)pobj)->strlen <= (char *)Buffer_bufstart(pobj) +
                    Buffer_buflen(pobj));
            }
            return;
        }
        cur_block = cur_block->prev;
    }
    PARROT_ASSERT(0);
}


/*

=item C<void Parrot_gc_destroy_header_pools(PARROT_INTERP, Memory_Pools
*mem_pools)>

Performs a garbage collection sweep on all pools, then frees them.  Calls
C<header_pools_iterate_callback> to loop over all the pools, passing
C<sweep_cb_pmc> and C<sweep_cb_buf> callback routines. Frees the array of sized
header pointers in the C<Memory_Pools> structure too.

=cut

*/

void
Parrot_gc_destroy_header_pools(PARROT_INTERP, ARGMOD(Memory_Pools *mem_pools))
{
    ASSERT_ARGS(Parrot_gc_destroy_header_pools)

    /* const/non const COW strings life in different pools
     * so in first pass
     * COW refcount is done, in 2. refcounting
     * in 3rd freeing
     */
    const INTVAL start = 2;

    header_pools_iterate_callback(interp, mem_pools, POOL_PMC, NULL, sweep_cb_pmc);
    header_pools_iterate_callback(interp, mem_pools, POOL_PMC | POOL_CONST, NULL,
            sweep_cb_pmc);

    header_pools_iterate_callback(interp, mem_pools, POOL_BUFFER | POOL_CONST,
            (void *)start, sweep_cb_buf);

    mem_internal_free(mem_pools->sized_header_pools);

    if (mem_pools->attrib_pools) {
        unsigned int i;
        for (i = 0; i < mem_pools->num_attribs; ++i) {
            PMC_Attribute_Pool  *pool  = mem_pools->attrib_pools[i];
            PMC_Attribute_Arena *arena;

            if (!pool)
                continue;

            arena = pool->top_arena;

            while (arena) {
                PMC_Attribute_Arena *next = arena->next;
                mem_internal_free(arena);
                arena = next;
            }
            mem_internal_free(pool);
        }

        mem_internal_free(mem_pools->attrib_pools);
    }

    mem_pools->attrib_pools       = NULL;
    mem_pools->sized_header_pools = NULL;
}

/*

=item C<static int sweep_cb_pmc(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool, int flag, void *arg)>

Performs a garbage collection sweep of the given pmc pool, then frees it. Calls
C<Parrot_gc_sweep_pool> to perform the sweep, and C<free_pool> to free the pool and
all its arenas. Always returns C<0>.

=cut

*/

static int
sweep_cb_pmc(PARROT_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *pool),
        SHIM(int flag), SHIM(void *arg))
{
    ASSERT_ARGS(sweep_cb_pmc)
    Parrot_gc_sweep_pool(interp, mem_pools, pool);
    free_pool(pool);
    return 0;
}

/*

=item C<static int sweep_cb_buf(PARROT_INTERP, Memory_Pools *mem_pools,
Fixed_Size_Pool *pool, int flag, void *arg)>

Performs a final garbage collection sweep, then frees the pool. Calls
C<Parrot_gc_sweep_pool> to perform the sweep, and C<free_pool> to free the pool and
all its arenas.

=cut

*/

static int
sweep_cb_buf(PARROT_INTERP,
        ARGIN(Memory_Pools *mem_pools),
        ARGFREE(Fixed_Size_Pool *pool),
        SHIM(int flag), SHIM(void *arg))
{
    ASSERT_ARGS(sweep_cb_buf)

    Parrot_gc_sweep_pool(interp, mem_pools, pool);
    free_pool(pool);

    return 0;
}

/*

=item C<static void free_pool(Fixed_Size_Pool *pool)>

Frees a pool and all of its arenas. Loops through the list of arenas backwards
and returns each to the memory manager. Then, frees the pool structure itself.

=cut

*/

static void
free_pool(ARGFREE(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(free_pool)
    Fixed_Size_Arena *cur_arena;

    for (cur_arena = pool->last_Arena; cur_arena;) {
        Fixed_Size_Arena * const next = cur_arena->prev;
        mem_internal_free(cur_arena->start_objects);
        mem_internal_free(cur_arena);
        cur_arena = next;
    }
    mem_internal_free(pool);
}



/*

=item C<void Parrot_gc_merge_memory_pools(Interp *dest_interp, Memory_Pools
*dest_arena, const Memory_Pools *source_arena)>

Merges the header pools of C<source_interp> into those of C<dest_interp>.
(Used to deal with shared objects left after interpreter destruction.)

=cut

*/

void
Parrot_gc_merge_memory_pools(ARGMOD(Interp *dest_interp),
    ARGMOD(Memory_Pools *dest_arena),
    ARGIN(const Memory_Pools *source_arena))
{
    ASSERT_ARGS(Parrot_gc_merge_memory_pools)

    UINTVAL        i;

    /* heavily borrowed from forall_header_pools */
    fix_pmc_syncs(dest_interp, source_arena->constant_pmc_pool);
    Parrot_gc_merge_buffer_pools(dest_interp, dest_arena,
            dest_arena->constant_pmc_pool, source_arena->constant_pmc_pool);

    fix_pmc_syncs(dest_interp, source_arena->pmc_pool);
    Parrot_gc_merge_buffer_pools(dest_interp, dest_arena,
            dest_arena->pmc_pool, source_arena->pmc_pool);

    Parrot_gc_merge_buffer_pools(dest_interp, dest_arena,
            dest_arena->constant_string_header_pool,
            source_arena->constant_string_header_pool);

    for (i = 0; i < source_arena->num_sized; ++i) {
        if (!source_arena->sized_header_pools[i])
            continue;

        if (i >= dest_arena->num_sized
        || !dest_arena->sized_header_pools[i]) {
            Fixed_Size_Pool *ignored = get_bufferlike_pool(dest_interp,
                    dest_arena, i * sizeof (void *));
            UNUSED(ignored);
            PARROT_ASSERT(dest_arena->sized_header_pools[i]);
        }

        Parrot_gc_merge_buffer_pools(dest_interp, dest_arena,
            dest_arena->sized_header_pools[i],
            source_arena->sized_header_pools[i]);
    }
}

/*

=item C<static void Parrot_gc_merge_buffer_pools(PARROT_INTERP, Memory_Pools
*mem_pools, Fixed_Size_Pool *dest, Fixed_Size_Pool *source)>

Merge pool C<source> into pool C<dest>. Combines the free lists directly,
moves all arenas to the new pool, and remove the old pool. To merge, the
two pools must have the same object size, and the same name (if they have
names).

=cut

*/

static void
Parrot_gc_merge_buffer_pools(PARROT_INTERP,
        ARGMOD(Memory_Pools *mem_pools),
        ARGMOD(Fixed_Size_Pool *dest), ARGMOD(Fixed_Size_Pool *source))
{
    ASSERT_ARGS(Parrot_gc_merge_buffer_pools)
    Fixed_Size_Arena  *cur_arena;

    PARROT_ASSERT(dest->object_size == source->object_size);
    PARROT_ASSERT((dest->name == NULL && source->name == NULL)
                || STREQ(dest->name, source->name));

    dest->total_objects += source->total_objects;

    /* append new free_list to old */
    /* XXX this won't work with, e.g., gc_gms */
    if (dest->free_list == NULL)
        dest->free_list = source->free_list;
    else {
        GC_MS_PObj_Wrapper  *free_list_end = dest->free_list;
        while (free_list_end->next_ptr)
            free_list_end = free_list_end->next_ptr;

        free_list_end->next_ptr = source->free_list;
    }

    /* now append source arenas */
    cur_arena = source->last_Arena;

    while (cur_arena) {
        Fixed_Size_Arena * const next_arena = cur_arena->prev;
        const size_t total_objects          = cur_arena->total_objects;

        cur_arena->next = cur_arena->prev = NULL;

        Parrot_append_arena_in_pool(interp, mem_pools, dest, cur_arena,
            cur_arena->total_objects);

        /* XXX needed? */
        cur_arena->total_objects = total_objects;

        cur_arena = next_arena;
    }

    /* remove things from source */
    source->last_Arena       = NULL;
    source->free_list        = NULL;
    source->total_objects    = 0;
    source->num_free_objects = 0;
}

/*

=item C<static void fix_pmc_syncs(Interp *dest_interp, const Fixed_Size_Pool
*pool)>

Walks through the given arena, looking for all live and shared PMCs,
transferring their sync values to the destination interpreter.

=cut

*/

static void
fix_pmc_syncs(ARGMOD(Interp *dest_interp), ARGIN(const Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(fix_pmc_syncs)
    Fixed_Size_Arena *cur_arena;
    const UINTVAL       object_size = pool->object_size;

    for (cur_arena = pool->last_Arena; cur_arena; cur_arena = cur_arena->prev) {
        PMC   *p = (PMC *)((char*)cur_arena->start_objects);
        size_t i;

        for (i = 0; i < cur_arena->used; ++i) {
            if (!PObj_on_free_list_TEST(p) && PObj_is_PMC_TEST(p)) {
                Parrot_ex_throw_from_c_args(dest_interp, NULL,
                    EXCEPTION_INTERP_ERROR,
                    "Unshared PMC still alive after interpreter"
                    "destruction. address=%p, base_type=%d\n",
                    p, p->vtable->base_type);
            }

            p = (PMC *)((char *)p + object_size);
        }
    }
}


/*

=back

=head1 SEE ALSO

F<src/gc/memory.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
