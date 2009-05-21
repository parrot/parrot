/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/mark_sweep.c - Small Object Pools and general mark/sweep GC behavior

=head1 DESCRIPTION

This file implements a number of routines related to the mark and sweep phases
of the garbage collector system. The functions in this file attempt to perform
various useful utilities without interfering with the operations of the
particular GC core. Individual GC cores may choose to use these functions or
to reimplement their functionality, hopefully without causing any problems
throughout the rest of Parrot.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void free_pmc_in_pool(PARROT_INTERP,
    SHIM(Small_Object_Pool *pool),
    ARGMOD(PObj *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*p);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool * new_buffer_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool * new_bufferlike_pool(PARROT_INTERP,
    size_t actual_buffer_size)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool * new_pmc_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool * new_small_object_pool(
    size_t object_size,
    size_t objects_per_alloc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool * new_string_pool(PARROT_INTERP, INTVAL constant)
        __attribute__nonnull__(1);

static void free_buffer(SHIM_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGMOD(PObj *b))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*b);

static void free_buffer_malloc(SHIM_INTERP,
    SHIM(Small_Object_Pool *pool),
    ARGMOD(PObj *b))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*b);

#define ASSERT_ARGS_free_pmc_in_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_new_buffer_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_bufferlike_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_pmc_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_small_object_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_new_string_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_free_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_free_buffer_malloc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(b)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;

/*

=item C<void Parrot_gc_run_init(PARROT_INTERP)>

Prepares the collector for a mark & sweep GC run. Initializes the various
fields in the Arenas structure that need to be zeroed out prior to the
mark phase.

=cut

*/

void
Parrot_gc_run_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_run_init)
    Arenas * const arena_base       = interp->arena_base;

    arena_base->gc_trace_ptr        = NULL;
    arena_base->gc_mark_start       = NULL;
    arena_base->num_early_PMCs_seen = 0;
    arena_base->num_extended_PMCs   = 0;
}

/*

=item C<int Parrot_gc_trace_root(PARROT_INTERP, Parrot_gc_trace_type trace)>

Traces the root set with behavior that's dependent on the flags passed.
Returns 0 if it's a lazy GC run and all objects that need timely destruction
were found. Returns 1 otherwise.

The flag C<trace> can have these values:

=over 4

=item * GC_TRACE_ROOT_ONLY

trace normal roots

=item * GC_TRACE_SYSTEM_ONLY

trace system areas only

=item * GC_TRACE_FULL

trace whole root set, including system areas.

=back

=cut

*/

int
Parrot_gc_trace_root(PARROT_INTERP, Parrot_gc_trace_type trace)
{
    ASSERT_ARGS(Parrot_gc_trace_root)
    Arenas           * const arena_base = interp->arena_base;
    Parrot_Context   *ctx;
    PObj             *obj;

    /* note: adding locals here did cause increased GC runs */
    mark_context_start();

    if (trace == GC_TRACE_SYSTEM_ONLY) {
        trace_system_areas(interp);
        return 0;
    }

    if (interp->profile)
        Parrot_gc_profile_start(interp);

    /* We have to start somewhere; the interpreter globals is a good place */
    if (!arena_base->gc_mark_start) {
        arena_base->gc_mark_start
            = arena_base->gc_mark_ptr
            = interp->iglobals;
    }

    /* mark the list of iglobals */
    Parrot_gc_mark_PObj_alive(interp, (PObj *)interp->iglobals);

    /* mark the current continuation */
    obj = (PObj *)interp->current_cont;
    if (obj && obj != (PObj *)NEED_CONTINUATION)
        Parrot_gc_mark_PObj_alive(interp, obj);

    /* mark the current context. */
    ctx = CONTEXT(interp);
    mark_context(interp, ctx);

    /* mark the dynamic environment. */
    mark_stack(interp, interp->dynamic_env);

    /* mark the vtables: the data, Class PMCs, etc. */
    mark_vtables(interp);

    /* mark the root_namespace */
    Parrot_gc_mark_PObj_alive(interp, (PObj *)interp->root_namespace);

    /* mark the concurrency scheduler */
    if (interp->scheduler)
        Parrot_gc_mark_PObj_alive(interp, (PObj *)interp->scheduler);

    /* s. packfile.c */
    mark_const_subs(interp);

    /* mark caches and freelists */
    mark_object_cache(interp);

    /* Now mark the class hash */
    Parrot_gc_mark_PObj_alive(interp, (PObj *)interp->class_hash);

    /* Mark the registry */
    PARROT_ASSERT(interp->gc_registry);
    Parrot_gc_mark_PObj_alive(interp, (PObj *)interp->gc_registry);

    /* Mark the MMD cache. */
    if (interp->op_mmd_cache)
        Parrot_mmd_cache_mark(interp, interp->op_mmd_cache);

    /* Walk the iodata */
    Parrot_IOData_mark(interp, interp->piodata);

    if (trace == GC_TRACE_FULL)
        trace_system_areas(interp);

    /* quick check to see if we have already marked all impatient PMCs. If we
       have, return 0 and exit here. This will alert other parts of the GC
       that if we are in a lazy run we can just stop it. */
    if (arena_base->lazy_gc
    &&  arena_base->num_early_PMCs_seen >= arena_base->num_early_gc_PMCs)
        return 0;

    if (interp->profile)
        Parrot_gc_profile_end(interp, PARROT_PROF_GC_p1);

    return 1;
}


/*

=item C<void Parrot_gc_sweep_pool(PARROT_INTERP, Small_Object_Pool *pool)>

Puts any buffers/PMCs that are marked as "dead" or "black" onto the pool
free list. If C<GC_IS_MALLOC>, bufstart gets freed too, if possible. Avoids
buffers that are immune from collection (i.e. constant).

=cut

*/

void
Parrot_gc_sweep_pool(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_sweep_pool)
    UINTVAL total_used        = 0;
    const UINTVAL object_size = pool->object_size;

    Small_Object_Arena *cur_arena;
    gc_object_fn_type   gc_object = pool->gc_object;

#if GC_VERBOSE
    if (Interp_trace_TEST(interp, 1)) {
        Interp * const tracer = interp->debugger;
        PMC *pio       = Parrot_io_STDERR(interp);

        Parrot_io_flush(interp, pio);

        if (tracer) {
            pio = Parrot_io_STDERR(tracer);
            Parrot_io_flush(tracer, pio);
        }
    }
#endif

    /* Run through all the buffer header pools and mark */
    for (cur_arena = pool->last_Arena; cur_arena; cur_arena = cur_arena->prev) {
        Buffer *b = (Buffer *)cur_arena->start_objects;
        UINTVAL i;

        /* loop only while there are objects in the arena */
        for (i = cur_arena->total_objects; i; i--) {

            if (PObj_on_free_list_TEST(b))
                ; /* if it's on free list, do nothing */
            else if (PObj_live_TEST(b)) {
                total_used++;
                PObj_live_CLEAR(b);
                PObj_get_FLAGS(b) &= ~PObj_custom_GC_FLAG;
            }
            else {
                /* it must be dead */

#if GC_VERBOSE
                if (Interp_trace_TEST(interp, 1)) {
                    fprintf(stderr, "Freeing pobject %p\n", b);
                    if (PObj_is_PMC_TEST(b)) {
                        fprintf(stderr, "\t = PMC type %s\n",
                                (char*) ((PMC*)b)->vtable->whoami->strstart);
                    }
                }
#endif

                if (PObj_is_shared_TEST(b)) {
                    /* only mess with shared objects if we
                     * (and thus everyone) is suspended for
                     * a GC run.
                     * XXX wrong thing to do with "other" GCs
                     */
                    if (!(interp->thread_data &&
                            (interp->thread_data->state &
                            THREAD_STATE_SUSPENDED_GC))) {
                        ++total_used;
                        goto next;
                    }
                }

                if (gc_object)
                    gc_object(interp, pool, b);

                pool->add_free_object(interp, pool, b);
            }
next:
            b = (Buffer *)((char *)b + object_size);
        }
    }

    pool->num_free_objects = pool->total_objects - total_used;
}


/*

=item C<INTVAL contained_in_pool(const Small_Object_Pool *pool, const void
*ptr)>

Returns whether the given C<*ptr> points to a location in C<pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
contained_in_pool(ARGIN(const Small_Object_Pool *pool), ARGIN(const void *ptr))
{
    ASSERT_ARGS(contained_in_pool)
    const Small_Object_Arena *arena;

    ptr = PObj_to_ARENA(ptr);

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        const ptrdiff_t ptr_diff =
            (ptrdiff_t)ptr - (ptrdiff_t)arena->start_objects;

        if (0 <= ptr_diff
              && ptr_diff < (ptrdiff_t)(arena->used * pool->object_size)
              && ptr_diff % pool->object_size == 0)
            return 1;
    }

    return 0;
}


/*

=item C<void mark_special(PARROT_INTERP, PMC *obj)>

Marks the children of a special PMC. Handles the marking necessary
for shared PMCs, and ensures timely marking of high-priority PMCs.
Ensures PMC_EXT structures are properly organized for garbage
collection.

=cut

*/

void
mark_special(PARROT_INTERP, ARGIN(PMC *obj))
{
    ASSERT_ARGS(mark_special)
    int     hi_prio;
    Arenas *arena_base;

    /*
     * If the object is shared, we have to use the arena and gc
     * pointers of the originating interpreter.
     *
     * We are possibly changing another interpreter's data here, so
     * the mark phase of GC must run only on one interpreter of a pool
     * at a time. However, freeing unused objects can occur in parallel.
     * And: to be sure that a shared object is dead, we have to finish
     * the mark phase of all interpreters in a pool that might reference
     * the object.
     */
    if (PObj_is_PMC_shared_TEST(obj)) {
        interp = PMC_sync(obj)->owner;
        PARROT_ASSERT(interp);

        if (!interp->arena_base->gc_mark_ptr)
            interp->arena_base->gc_mark_ptr = obj;
    }

    arena_base = interp->arena_base;

    if (PObj_needs_early_gc_TEST(obj))
        ++arena_base->num_early_PMCs_seen;

    if (PObj_high_priority_gc_TEST(obj) && arena_base->gc_trace_ptr) {
        /* set obj's parent to high priority */
        PObj_high_priority_gc_SET(arena_base->gc_trace_ptr);
        hi_prio = 1;
    }
    else
        hi_prio = 0;

    if (obj->pmc_ext) {
        PMC * const tptr = arena_base->gc_trace_ptr;

        ++arena_base->num_extended_PMCs;
        /*
         * XXX this basically invalidates the high-priority marking
         *     of PMCs by putting all PMCs onto the front of the list.
         *     The reason for this is the by far better cache locality
         *     when aggregates and their contents are marked "together".
         *
         *     To enable high priority marking again we should probably
         *     use a second pointer chain, which is, when not empty,
         *     processed first.
         */
        if (hi_prio && tptr) {
            if (PMC_next_for_GC(tptr) == tptr)
                PMC_next_for_GC(obj) = obj;
            else
                /* put it at the head of the list */
                PMC_next_for_GC(obj) = PMC_next_for_GC(tptr);

            PMC_next_for_GC(tptr)    = (PMC*)obj;
        }
        else {
            /* put it on the end of the list */
            PMC_next_for_GC(arena_base->gc_mark_ptr) = obj;

            /* Explicitly make the tail of the linked list be
             * self-referential */
            arena_base->gc_mark_ptr = PMC_next_for_GC(obj) = obj;
        }
    }
    if (PObj_custom_mark_TEST(obj)) {
        PObj_get_FLAGS(obj) |= PObj_custom_GC_FLAG;
        if (!PObj_constant_TEST(obj))
            VTABLE_mark(interp, obj);
    }
}


/*

=item C<void Parrot_gc_clear_live_bits(PARROT_INTERP, const Small_Object_Pool
*pool)>

Resets the PMC pool, so all objects are marked as "White". This
is done after a GC run to reset the system and prepare for the
next mark phase.

=cut

*/

void
Parrot_gc_clear_live_bits(PARROT_INTERP, ARGIN(const Small_Object_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_clear_live_bits)
    Small_Object_Arena *arena;
    const UINTVAL object_size = pool->object_size;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        Buffer *b = (Buffer *)arena->start_objects;
        UINTVAL i;

        for (i = 0; i < arena->used; i++) {
            PObj_live_CLEAR(b);
            b = (Buffer *)((char *)b + object_size);
        }
    }
}


/*

=item C<int Parrot_gc_trace_children(PARROT_INTERP, size_t how_many)>

Traces through the linked list formed by the C<next_for_GC> pointer.
Returns 0 if this is a lazy GC run and we've found all impatient PMCs.
Returns 1 if we've traced the entire list.

=cut

*/

int
Parrot_gc_trace_children(PARROT_INTERP, size_t how_many)
{
    ASSERT_ARGS(Parrot_gc_trace_children)
    Arenas * const arena_base = interp->arena_base;
    const int      lazy_gc    = arena_base->lazy_gc;
    PMC           *current    = arena_base->gc_mark_start;

    /*
     * First phase of mark is finished. Now if we are the owner
     * of a shared pool, we must run the mark phase of other
     * interpreters in our pool, so that live shared PMCs in that
     * interpreter are appended to our mark_ptrs chain.
     *
     * If there is a count of shared PMCs and we have already seen
     * all these, we could skip that.
     */
    if (interp->profile)
        Parrot_gc_profile_start(interp);

    pt_gc_mark_root_finished(interp);

    do {
        PMC *next;

        if (lazy_gc && arena_base->num_early_PMCs_seen >=
                arena_base->num_early_gc_PMCs) {
            return 0;
        }

        arena_base->gc_trace_ptr = current;

        /* short-term hack to color objects black */
        PObj_get_FLAGS(current) |= PObj_custom_GC_FLAG;

        /* clearing the flag is much more expensive then testing */
        if (!PObj_needs_early_gc_TEST(current))
            PObj_high_priority_gc_CLEAR(current);

        /* mark properties */
        if (PMC_metadata(current))
            Parrot_gc_mark_PObj_alive(interp, (PObj *)PMC_metadata(current));

         if (PObj_custom_mark_TEST(current)) {
            PARROT_ASSERT(!PObj_on_free_list_TEST(current));
            VTABLE_mark(interp, current);
        }

        next = PMC_next_for_GC(current);

        if (!PMC_IS_NULL(next) && next == current)
            break;

        current = next;
    } while (--how_many > 0);

    arena_base->gc_mark_start = current;
    arena_base->gc_trace_ptr  = NULL;

    if (interp->profile)
        Parrot_gc_profile_end(interp, PARROT_PROF_GC_p2);

    return 1;
}

/*

=item C<void Parrot_add_to_free_list(PARROT_INTERP, Small_Object_Pool *pool,
Small_Object_Arena *arena)>

Adds the objects in the newly allocated C<arena> to the free list of the pool.

=cut

*/

void
Parrot_add_to_free_list(PARROT_INTERP,
        ARGMOD(Small_Object_Pool  *pool),
        ARGMOD(Small_Object_Arena *arena))
{
    ASSERT_ARGS(Parrot_add_to_free_list)
    UINTVAL  i;
    void    *object;
    const UINTVAL num_objects = pool->objects_per_alloc;

    pool->total_objects += num_objects;
    arena->used          = num_objects;

    /* Move all the new objects into the free list */
    object = (void *)arena->start_objects;

    for (i = 0; i < num_objects; i++) {
        pool->add_free_object(interp, pool, object);
        object = (void *)((char *)object + pool->object_size);
    }

    pool->num_free_objects += num_objects;
}


/*

=item C<void Parrot_append_arena_in_pool(PARROT_INTERP, Small_Object_Pool *pool,
Small_Object_Arena *new_arena, size_t size)>

Insert the new arena into the pool's structure. Arenas are stored in a
linked list, so add the new arena to the list. Set information in the
arenas structure, such as the number of objects allocated in it.

=cut

*/

void
Parrot_append_arena_in_pool(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGMOD(Small_Object_Arena *new_arena), size_t size)
{
    ASSERT_ARGS(Parrot_append_arena_in_pool)

    /* Maintain the *_arena_memory invariant for stack walking code. Set it
     * regardless if we're the first pool to be added. */
    if (!pool->last_Arena
    || (pool->start_arena_memory > (size_t)new_arena->start_objects))
        pool->start_arena_memory = (size_t)new_arena->start_objects;

    if (!pool->last_Arena
    || (pool->end_arena_memory < (size_t)new_arena->start_objects + size))
        pool->end_arena_memory = (size_t)new_arena->start_objects + size;

    new_arena->total_objects = pool->objects_per_alloc;
    new_arena->next          = NULL;
    new_arena->prev          = pool->last_Arena;

    if (new_arena->prev)
        new_arena->prev->next = new_arena;

    pool->last_Arena = new_arena;
    interp->arena_base->header_allocs_since_last_collect++;
}

/*

=item C<void Parrot_gc_profile_start(PARROT_INTERP)>

Records the start time of a GC mark run when profiling is enabled.

=cut

*/

void
Parrot_gc_profile_start(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_profile_start)
    if (Interp_flags_TEST(interp, PARROT_PROFILE_FLAG))
        interp->profile->gc_time = Parrot_floatval_time();
}

/*

=item C<void Parrot_gc_profile_end(PARROT_INTERP, int what)>

Records the end time of the GC mark run part C<what> run when profiling is
enabled. Also record start time of next part.

=cut

*/

void
Parrot_gc_profile_end(PARROT_INTERP, int what)
{
    ASSERT_ARGS(Parrot_gc_profile_end)
    if (Interp_flags_TEST(interp, PARROT_PROFILE_FLAG)) {
        RunProfile * const profile = interp->profile;
        const FLOATVAL     now     = Parrot_floatval_time();

        profile->data[what].numcalls++;
        profile->data[what].time += now - profile->gc_time;

        /*
         * we've recorded the time of a GC piece from
         * gc_time until now, so add this to the start of the
         * currently executing opcode, which hasn't run this
         * interval.
         */
        profile->starttime += now - profile->gc_time;

        /* prepare start for next step */
        profile->gc_time    = now;
    }
}

#ifndef GC_IS_MALLOC
#  define PMC_HEADERS_PER_ALLOC    10240 / sizeof (PMC)
#  define BUFFER_HEADERS_PER_ALLOC  5120 / sizeof (Buffer)
#  define STRING_HEADERS_PER_ALLOC  5120 / sizeof (STRING)
#else /* GC_IS_MALLOC */
#  define PMC_HEADERS_PER_ALLOC    10240 / sizeof (PMC)
#  define BUFFER_HEADERS_PER_ALLOC 10240 / sizeof (Buffer)
#  define STRING_HEADERS_PER_ALLOC 10240 / sizeof (STRING)
#endif /* GC_IS_MALLOC */

#define CONSTANT_PMC_HEADERS_PER_ALLOC 64
#define GET_SIZED_POOL_IDX(x) ((x) / sizeof (void *))



/*

=back

=head2 Header Pool Creation Functions

=over 4

=item C<static Small_Object_Pool * new_pmc_pool(PARROT_INTERP)>

Creates and initializes a new pool for PMCs and returns it.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool *
new_pmc_pool(PARROT_INTERP)
{
    ASSERT_ARGS(new_pmc_pool)
    const int num_headers = PMC_HEADERS_PER_ALLOC;
    Small_Object_Pool * const pmc_pool =
        new_small_object_pool(sizeof (PMC), num_headers);

    pmc_pool->mem_pool   = NULL;
    pmc_pool->gc_object  = free_pmc_in_pool;

    (interp->arena_base->init_pool)(interp, pmc_pool);
    return pmc_pool;
}

/*

=item C<static void free_pmc_in_pool(PARROT_INTERP, Small_Object_Pool *pool,
PObj *p)>

Frees a PMC that is no longer being used. Calls a custom C<destroy> VTABLE
method if one is available. If the PMC uses a PMC_EXT structure, that is freed
as well.

=cut

*/

static void
free_pmc_in_pool(PARROT_INTERP, SHIM(Small_Object_Pool *pool),
        ARGMOD(PObj *p))
{
    ASSERT_ARGS(free_pmc_in_pool)
    PMC    * const pmc        = (PMC *)p;
    Arenas * const arena_base = interp->arena_base;

    /* TODO collect objects with finalizers */
    if (PObj_needs_early_gc_TEST(p))
        --arena_base->num_early_gc_PMCs;

    if (PObj_active_destroy_TEST(p))
        VTABLE_destroy(interp, pmc);

    if (PObj_is_PMC_EXT_TEST(p))
         Parrot_gc_free_pmc_ext(interp, pmc);

#ifndef NDEBUG

    pmc->pmc_ext     = (PMC_EXT *)0xdeadbeef;
    pmc->vtable      = (VTABLE  *)0xdeadbeef;

#endif

}


/*

=item C<static Small_Object_Pool * new_bufferlike_pool(PARROT_INTERP, size_t
actual_buffer_size)>

Creates a new pool for buffer-like structures. This is called from
C<get_bufferlike_pool()>, and should probably not be called directly.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool *
new_bufferlike_pool(PARROT_INTERP, size_t actual_buffer_size)
{
    ASSERT_ARGS(new_bufferlike_pool)
    const int num_headers          = BUFFER_HEADERS_PER_ALLOC;
    const size_t buffer_size       =
            (actual_buffer_size + sizeof (void *) - 1) & ~(sizeof (void *) - 1);
    Small_Object_Pool * const pool =
            new_small_object_pool(buffer_size, num_headers);

    pool->gc_object = NULL;
    pool->mem_pool  = interp->arena_base->memory_pool;
    (interp->arena_base->init_pool)(interp, pool);
    return pool;
}

/*

=item C<static Small_Object_Pool * new_small_object_pool(size_t object_size,
size_t objects_per_alloc)>

Creates a new C<Small_Object_Pool> and returns a pointer to it.
Initializes the pool structure based on the size of objects in the
pool and the number of items to allocate in each arena.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool *
new_small_object_pool(size_t object_size, size_t objects_per_alloc)
{
    ASSERT_ARGS(new_small_object_pool)
    Small_Object_Pool * const pool =
        mem_internal_allocate_zeroed_typed(Small_Object_Pool);

    pool->last_Arena        = NULL;
    pool->free_list         = NULL;
    pool->mem_pool          = NULL;
    pool->object_size       = object_size;
    pool->objects_per_alloc = objects_per_alloc;

    return pool;
}



/*

=item C<static Small_Object_Pool * new_buffer_pool(PARROT_INTERP)>

Creates a new C<Small_Object_Pool> structure for managing buffer objects.

Non-constant strings and plain Buffers are stored in the sized header pools.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool *
new_buffer_pool(PARROT_INTERP)
{
    ASSERT_ARGS(new_buffer_pool)
    Small_Object_Pool * const pool = get_bufferlike_pool(interp, sizeof (Buffer));

#ifdef GC_IS_MALLOC
    pool->gc_object = free_buffer_malloc;
#else
    pool->gc_object = free_buffer;
#endif

    return pool;
}

/*

=item C<static void free_buffer_malloc(PARROT_INTERP,
Small_Object_Pool *pool, PObj *b)>

Frees the given buffer, returning the storage space to the operating system
and removing it from Parrot's memory management system. If the buffer is COW,
The buffer is not freed if the reference count is greater then 1.

=cut

*/

static void
free_buffer_malloc(SHIM_INTERP, SHIM(Small_Object_Pool *pool),
        ARGMOD(PObj *b))
{
    ASSERT_ARGS(free_buffer_malloc)
    /* free allocated space at (int *)bufstart - 1, but not if it used COW or is
     * external */
    PObj_buflen(b) = 0;

    if (!PObj_bufstart(b) || PObj_is_external_or_free_TESTALL(b))
        return;

    if (PObj_COW_TEST(b)) {
        INTVAL * const refcount = PObj_bufrefcountptr(b);

        if (--(*refcount) == 0) {
            mem_sys_free(refcount); /* the actual bufstart */
        }
    }
    else
        mem_sys_free(PObj_bufrefcountptr(b));
}

/*

=item C<static void free_buffer(PARROT_INTERP, Small_Object_Pool
*pool, PObj *b)>

Frees a buffer, returning it to the memory pool for Parrot to possibly
reuse later.

=cut

*/

static void
free_buffer(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool), ARGMOD(PObj *b))
{
    ASSERT_ARGS(free_buffer)
    Memory_Pool * const mem_pool = (Memory_Pool *)pool->mem_pool;

    /* XXX Jarkko reported that on irix pool->mem_pool was NULL, which really
     * shouldn't happen */
    if (mem_pool) {
        if (!PObj_COW_TEST(b))
            mem_pool->guaranteed_reclaimable += PObj_buflen(b);

         mem_pool->possibly_reclaimable += PObj_buflen(b);
    }

    PObj_buflen(b)        = 0;
}


/*

=item C<static Small_Object_Pool * new_string_pool(PARROT_INTERP, INTVAL
constant)>

Creates a new pool for C<STRING>s and returns it. This calls
C<get_bufferlike_pool> internally, which in turn calls C<new_bufferlike_pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Small_Object_Pool *
new_string_pool(PARROT_INTERP, INTVAL constant)
{
    ASSERT_ARGS(new_string_pool)
    Small_Object_Pool *pool;
    if (constant) {
        pool           = new_bufferlike_pool(interp, sizeof (STRING));
        pool->mem_pool = interp->arena_base->constant_string_pool;
    }
    else
        pool = get_bufferlike_pool(interp, sizeof (STRING));

    pool->objects_per_alloc = STRING_HEADERS_PER_ALLOC;

    return pool;
}


/*

=item C<Small_Object_Pool * get_bufferlike_pool(PARROT_INTERP, size_t
buffer_size)>

Makes and return a bufferlike header pool for objects of a given size. If a
pool for objects of that size already exists, no new pool will be created and
the pointer to the existing pool is returned.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
get_bufferlike_pool(PARROT_INTERP, size_t buffer_size)
{
    ASSERT_ARGS(get_bufferlike_pool)
    Small_Object_Pool **sized_pools = interp->arena_base->sized_header_pools;
    const UINTVAL       num_old     = interp->arena_base->num_sized;
    const UINTVAL       idx         = GET_SIZED_POOL_IDX(buffer_size);

    /* Expands the array of sized resource pools, if necessary */
    if (num_old <= idx) {
        const UINTVAL num_new = idx + 1;
        /* XXX: use mem_sys_realloc_zeroed to do this easier? If we want the
                same debugging behavior as mem_internal_realloc, we would
                need to add a new function/macro for
                mem_internal_realloc_zeroed, to mirror mem_sys_realloc_zeroed. */
        sized_pools = (Small_Object_Pool **)mem_internal_realloc(sized_pools,
                                           num_new * sizeof (void *));
        memset(sized_pools + num_old, 0, sizeof (void *) * (num_new - num_old));

        interp->arena_base->sized_header_pools = sized_pools;
        interp->arena_base->num_sized = num_new;
    }

    if (sized_pools[idx] == NULL)
        sized_pools[idx] = new_bufferlike_pool(interp, buffer_size);

    return sized_pools[idx];
}

/*

=item C<void initialize_header_pools(PARROT_INTERP)>

The initialization routine for the interpreter's header pools. Initializes
pools for string headers, constant string headers, buffers, PMCs, PMC_EXTs, and
constant PMCs.

The C<string_header_pool> and C<buffer_header_pool> are actually both in the
sized pools, although no other sized pools are created here.

=cut

*/

void
initialize_header_pools(PARROT_INTERP)
{
    ASSERT_ARGS(initialize_header_pools)
    Arenas * const arena_base                     = interp->arena_base;

    /* Init the constant string header pool */
    arena_base->constant_string_header_pool       = new_string_pool(interp, 1);
    arena_base->constant_string_header_pool->name = "constant_string_header";

    /* Init the buffer header pool
     *
     * The buffer_header_pool and the string_header_pool actually live in the
     * sized_header_pools. These pool pointers only provide faster access in
     * new_*_header */
    arena_base->buffer_header_pool       = new_buffer_pool(interp);
    arena_base->buffer_header_pool->name = "buffer_header";

    /* Init the string header pool */
    arena_base->string_header_pool       = new_string_pool(interp, 0);
    arena_base->string_header_pool->name = "string_header";

    /* Init the PMC header pool */
    arena_base->pmc_pool                 = new_pmc_pool(interp);
    arena_base->pmc_pool->name           = "pmc";

    /* pmc extension buffer */
    arena_base->pmc_ext_pool             =
        new_small_object_pool(sizeof (PMC_EXT), 1024);

#if PARROT_GC_MS
    /*
     * pmc_ext isn't a managed item. If a PMC has a pmc_ext structure
     * it is returned to the pool instantly - the structure is never
     * marked.
     * Use GS MS pool functions
     */
    gc_ms_pmc_ext_pool_init(arena_base->pmc_ext_pool);
#else
    /* rational, consistant behavior (as yet unwritten) */
#endif

    arena_base->pmc_ext_pool->name = "pmc_ext";

    /* constant PMCs */
    arena_base->constant_pmc_pool                    = new_pmc_pool(interp);
    arena_base->constant_pmc_pool->name              = "constant_pmc";
    arena_base->constant_pmc_pool->objects_per_alloc =
        CONSTANT_PMC_HEADERS_PER_ALLOC;
}


/*

=item C<int header_pools_iterate_callback(PARROT_INTERP, int flag, void *arg,
pool_iter_fn func)>

Iterates through header pools, invoking the given callback function on each
pool in the list matching the given criteria. Determines which pools to iterate
over depending on flags passed to the function.  Returns the callback's return
value, if non-zero. A non-zero return value from the callback function will
terminate the iteration prematurely.

=over 4

=item flag is one of

  POOL_PMC
  POOL_BUFFER
  POOL_CONST
  POOL_ALL

Only matching pools will be used. Notice that it is not possible to iterate
over certain sets of pools using the provided flags in the single pass. For
instance, both the PMC pool and the constant PMC pool cannot be iterated over
in a single pass.

=item arg

This argument is passed on to the iteration function.

=item pool_iter_fn

Called with C<(Parrot_Interp, Small_Object_Pool *, int flag, void *arg)>.  If
the function returns a non-zero value, iteration will stop.

=back

=cut

*/

PARROT_IGNORABLE_RESULT
int
header_pools_iterate_callback(PARROT_INTERP, int flag, ARGIN_NULLOK(void *arg),
        NOTNULL(pool_iter_fn func))
{
    ASSERT_ARGS(header_pools_iterate_callback)
    Arenas * const arena_base = interp->arena_base;

    if (flag & POOL_PMC) {
        Small_Object_Pool *pool = flag & POOL_CONST
            ? arena_base->constant_pmc_pool
            : arena_base->pmc_pool;

        const int ret_val = (func)(interp, pool,
            flag & (POOL_PMC | POOL_CONST) , arg);

        if (ret_val)
            return ret_val;
    }

    if (flag & POOL_BUFFER) {
        INTVAL i;

        if (flag & POOL_CONST) {
            const int ret_val = (func)(interp,
                arena_base->constant_string_header_pool,
                POOL_BUFFER | POOL_CONST, arg);

            if (ret_val)
                return ret_val;
        }

        for (i = interp->arena_base->num_sized - 1; i >= 0; --i) {
            Small_Object_Pool * const pool = arena_base->sized_header_pools[i];

            if (pool) {
                const int ret_val = (func)(interp, pool, POOL_BUFFER, arg);
                if (ret_val)
                    return ret_val;
            }
        }
    }

    return 0;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/mark_sweep.h>, F<docs/memory_internals.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
