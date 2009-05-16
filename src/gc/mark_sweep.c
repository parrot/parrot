/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/mark_sweep.c - Small Object Pools and general mark/sweep GC behavior

=head1 DESCRIPTION

Handles the accessing of small object pools (header pools).  All of the
mark/sweep garbage collectors use this code.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void more_traceable_objects(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_more_traceable_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;

/*

=item C<int Parrot_gc_trace_root(PARROT_INTERP, Parrot_gc_trace_type trace)>

Traces the root set. Returns 0 if it's a lazy GC run and all objects
that need timely destruction were found.

C<trace_stack> can have these values:

=over 4

=item * GC_TRACE_FULL

trace whole root set, including system areas

=item * GC_TRACE_ROOT_ONLY

trace normal roots, no system areas

=item * GC_TRACE_SYSTEM_ONLY

trace system areas only

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

    /* mark it as used  */
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

    /*
     * mark vtable->data
     *
     * XXX these PMCs are constant and shouldn't get collected
     * but t/library/dumper* fails w/o this marking.
     *
     * It seems that the Class PMC gets GCed - these should
     * get created as constant PMCs.
     */
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

    /* quick check if we can already bail out */
    if (arena_base->lazy_gc
    &&  arena_base->num_early_PMCs_seen >= arena_base->num_early_gc_PMCs)
        return 0;

    /* Find important stuff on the system stack */
    if (trace == GC_TRACE_FULL)
        trace_system_areas(interp);

    if (interp->profile)
        Parrot_gc_profile_end(interp, PARROT_PROF_GC_p1);

    return 1;
}



/*

=item C<void Parrot_gc_sweep(PARROT_INTERP, Small_Object_Pool *pool)>

Puts any buffers/PMCs that are now unused onto the pool's free list. If
C<GC_IS_MALLOC>, bufstart gets freed too, if possible. Avoids buffers that
are immune from collection (i.e. constant).

=cut

*/

void
Parrot_gc_sweep(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(Parrot_gc_sweep)
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

=item C<int Parrot_is_const_pmc(PARROT_INTERP, const PMC *pmc)>

Returns whether C<*pmc> is a constant PMC. The given pointer is a constant
PMC if it points into the constant PMC pool.

=cut

*/

int
Parrot_is_const_pmc(PARROT_INTERP, ARGIN(const PMC *pmc))
{
    ASSERT_ARGS(Parrot_is_const_pmc)
    Small_Object_Pool * const pool = interp->arena_base->constant_pmc_pool;
    const               int   c    = contained_in_pool(pool, pmc);

    /* some paranoia first. */
    /* I wonder if it would save any machine cycles to write
       !(PObj_constant_TEST(pmc) ^ c)
       instead. */
    PARROT_ASSERT(!!PObj_constant_TEST(pmc) == !!c);

    return c;
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
        /* XXX FIXME hack */
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
            if (PMC_next_for_GC(tptr) == tptr) {
                PMC_next_for_GC(obj) = obj;
            }
            else {
                /* put it at the head of the list */
                PMC_next_for_GC(obj) = PMC_next_for_GC(tptr);
            }

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

=item C<int trace_active_PMCs(PARROT_INTERP, Parrot_gc_trace_type trace)>

Performs a full trace run and marks all the PMCs as active if they
are. Returns whether the run completed, that is, whether it's safe
to proceed with GC.

=cut

*/

int
trace_active_PMCs(PARROT_INTERP, Parrot_gc_trace_type trace)
{
    ASSERT_ARGS(trace_active_PMCs)
    if (!Parrot_gc_trace_root(interp, trace))
        return 0;

    /* Okay, we've marked the whole root set, and should have a good-sized
     * list of things to look at. Run through it */
    return Parrot_gc_trace_children(interp, (size_t) -1);
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

Returns whether the tracing process has completed.

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

Adds the objects in the newly allocated C<arena> to the free list.

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

=item C<Small_Object_Pool * new_small_object_pool(size_t object_size, size_t
objects_per_alloc)>

Creates a new C<Small_Object_Pool> and returns a pointer to it.
Initializes the pool structure based on the size of objects in the
pool and the number of items to allocate in each arena.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool *
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

=item C<void Parrot_small_object_pool_merge(PARROT_INTERP, Small_Object_Pool
*dest, Small_Object_Pool *source)>

Merge pool C<source> into pool C<dest>. Combines the free lists directly,
moves all arenas to the new pool, and remove the old pool. To merge, the
two pools must have the same object size, and the same name (if they have
names).

=cut

*/

void
Parrot_small_object_pool_merge(PARROT_INTERP,
        ARGMOD(Small_Object_Pool *dest), ARGMOD(Small_Object_Pool *source))
{
    ASSERT_ARGS(Parrot_small_object_pool_merge)
    Small_Object_Arena  *cur_arena;
    void               **free_list_end;

    /* XXX num_free_objects doesn't seem to be accounted correctly in, e.g.,
     * the PMC_EXT pool.
     */
#if 0
    if (source->num_free_objects == source->total_objects) {
        return;
    }
#endif

    /* PARROT_ASSERT(source->total_objects); */
    PARROT_ASSERT(dest->object_size == source->object_size);
    PARROT_ASSERT((dest->name == NULL && source->name == NULL)
                || STREQ(dest->name, source->name));

    dest->total_objects += source->total_objects;

    /* append new free_list to old */
    /* XXX this won't work with, e.g., gc_gms */
    free_list_end  = &dest->free_list;

    while (*free_list_end)
        free_list_end = (void **)*free_list_end;

    *free_list_end = source->free_list;

    /* now append source arenas */
    cur_arena = source->last_Arena;

    while (cur_arena) {
        size_t                     total_objects;
        Small_Object_Arena * const next_arena = cur_arena->prev;

        cur_arena->next = cur_arena->prev = NULL;

        total_objects   = cur_arena->total_objects;

        Parrot_append_arena_in_pool(interp, dest, cur_arena,
            cur_arena->total_objects);

        /* XXX needed? */
        cur_arena->total_objects = total_objects;

        cur_arena = next_arena;
    }

    /* remove things from source */
    /* XXX is this enough? */
    source->last_Arena       = NULL;
    source->free_list        = NULL;
    source->total_objects    = 0;
    source->num_free_objects = 0;
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
