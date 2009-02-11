/*
Copyright (C) 2001-2009, The Perl Foundation.
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
#include "parrot/gc_mark_sweep.h"
#include "gc_private.h"

/* HEADERIZER HFILE: include/parrot/gc_mark_sweep.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void clear_live_bits(ARGIN(const Small_Object_Pool *pool))
        __attribute__nonnull__(1);

static void gc_ms_add_free_object(SHIM_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_add_free_pmc_ext(SHIM_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_ms_alloc_objects(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void * gc_ms_get_free_object(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void * gc_ms_get_free_pmc_ext(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void gc_ms_pool_init(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void mark_special(PARROT_INTERP, ARGIN(PMC *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void more_traceable_objects(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static int sweep_cb(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    int flag,
    ARGMOD(void *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*arg);

static int trace_active_PMCs(PARROT_INTERP, Parrot_gc_trace_type trace)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_clear_live_bits __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_gc_ms_add_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(to_add)
#define ASSERT_ARGS_gc_ms_add_free_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(to_add)
#define ASSERT_ARGS_gc_ms_alloc_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_gc_ms_get_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_gc_ms_get_free_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_gc_ms_pool_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_mark_special __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_more_traceable_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_sweep_cb __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(arg)
#define ASSERT_ARGS_trace_active_PMCs __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define GC_DEBUG_REPLENISH_LEVEL_FACTOR        0.0
#define GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR 1
#define REPLENISH_LEVEL_FACTOR                 0.3

/* this factor is totally arbitrary, but gives good timings for stress.pasm */
#define UNITS_PER_ALLOC_GROWTH_FACTOR          1.75

#define POOL_MAX_BYTES                         65536 * 128

/*

=item C<void Parrot_gc_ms_run>

Runs the stop-the-world mark & sweep (MS) collector.

=cut

*/

void
Parrot_gc_ms_run(PARROT_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(Parrot_gc_ms_run)
    Arenas * const arena_base = interp->arena_base;

    /* XXX these should go into the interpreter */
    int total_free     = 0;

    if (arena_base->DOD_block_level)
        return;

    if (interp->pdb && interp->pdb->debugger) {
        /*
         * if the other interpreter did a DOD run, it can set
         * live bits of shared objects, but these aren't reset, because
         * they are in a different arena. When now such a PMC points to
         * other non-shared object, these wouldn't be marked and hence
         * collected.
         */
        Parrot_gc_clear_live_bits(interp);
    }

    /*
     * the sync sweep is always at the end, so that
     * the live bits are cleared
     */
    if (flags & GC_finish_FLAG) {
        clear_live_bits(interp->arena_base->pmc_pool);
        clear_live_bits(interp->arena_base->constant_pmc_pool);

        /* keep the scheduler and its kids alive for Task-like PMCs to destroy
         * themselves; run a sweep to collect them */
        if (interp->scheduler) {
            pobject_lives(interp, (PObj *)interp->scheduler);
            VTABLE_mark(interp, interp->scheduler);
            Parrot_gc_sweep(interp, interp->arena_base->pmc_pool);
        }

        /* now sweep everything that's left */
        Parrot_gc_sweep(interp, interp->arena_base->pmc_pool);
        Parrot_gc_sweep(interp, interp->arena_base->constant_pmc_pool);

        return;
    }

    ++arena_base->DOD_block_level;
    arena_base->lazy_gc = flags & GC_lazy_FLAG;

    /* tell the threading system that we're doing DOD mark */
    pt_gc_start_mark(interp);
    Parrot_gc_ms_run_init(interp);

    /* compact STRING pools to collect free headers and allocated buffers */
    Parrot_go_collect(interp);

    /* Now go trace the PMCs */
    if (trace_active_PMCs(interp, (flags & GC_trace_stack_FLAG)
        ? GC_TRACE_FULL
        : GC_TRACE_ROOT_ONLY)) {
        int ignored;

        arena_base->gc_trace_ptr = NULL;
        arena_base->gc_mark_ptr  = NULL;

        /* mark is now finished */
        pt_gc_stop_mark(interp);

        /* Now put unused PMCs and Buffers on the free list */
        ignored = Parrot_forall_header_pools(interp, POOL_BUFFER | POOL_PMC,
            (void*)&total_free, sweep_cb);
        UNUSED(ignored);

        if (interp->profile)
            Parrot_gc_profile_end(interp, PARROT_PROF_DOD_cb);
    }
    else {
        pt_gc_stop_mark(interp); /* XXX */

        /* successful lazy DOD count */
        ++arena_base->lazy_gc_runs;

        Parrot_gc_clear_live_bits(interp);
        if (interp->profile)
            Parrot_gc_profile_end(interp, PARROT_PROF_DOD_p2);
    }

    /* Note it */
    arena_base->gc_runs++;
    --arena_base->DOD_block_level;

    return;
}


/*

=item C<int Parrot_gc_trace_root>

Traces the root set. Returns 0 if it's a lazy DOD run and all objects
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

    /* note: adding locals here did cause increased DOD runs */
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
    pobject_lives(interp, (PObj *)interp->iglobals);

    /* mark the current continuation */
    obj = (PObj *)interp->current_cont;
    if (obj && obj != (PObj *)NEED_CONTINUATION)
        pobject_lives(interp, obj);

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
     * It seems that the Class PMC gets DODed - these should
     * get created as constant PMCs.
     */
    mark_vtables(interp);

    /* mark the root_namespace */
    pobject_lives(interp, (PObj *)interp->root_namespace);

    /* mark the concurrency scheduler */
    if (interp->scheduler)
        pobject_lives(interp, (PObj *)interp->scheduler);

    /* s. packfile.c */
    mark_const_subs(interp);

    /* mark caches and freelists */
    mark_object_cache(interp);

    /* Now mark the class hash */
    pobject_lives(interp, (PObj *)interp->class_hash);

    /* Mark the registry */
    PARROT_ASSERT(interp->DOD_registry);
    pobject_lives(interp, (PObj *)interp->DOD_registry);

    /* Mark the MMD cache. */
    if (interp->op_mmd_cache)
        Parrot_mmd_cache_mark(interp, interp->op_mmd_cache);

    /* Walk the iodata */
    Parrot_IOData_mark(interp, interp->piodata);

    /* quick check if we can already bail out */
    if (arena_base->lazy_gc
    &&  arena_base->num_early_PMCs_seen >= arena_base->num_early_DOD_PMCs)
        return 0;

    /* Find important stuff on the system stack */
    if (trace == GC_TRACE_FULL)
        trace_system_areas(interp);

    if (interp->profile)
        Parrot_gc_profile_end(interp, PARROT_PROF_DOD_p1);

    return 1;
}


/*

=item C<void Parrot_gc_sweep>

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

=item C<void pobject_lives>

Marks the PObj as "alive" for the Garbage Collector. Takes a pointer to a PObj,
and performs necessary marking to ensure the PMC and its direct children nodes
are marked alive. Implementation is generally dependant on the particular
garbage collector in use.

=cut

*/

PARROT_EXPORT
void
pobject_lives(PARROT_INTERP, ARGMOD(PObj *obj))
{
    ASSERT_ARGS(pobject_lives)
#if PARROT_GC_GMS
    do {
        if (!PObj_live_TEST(obj) && \
                PObj_to_GMSH(obj)->gen->gen_no >= interp->gc_generation) \
            parrot_gc_gms_pobject_lives(interp, obj); \
    } while (0);
#else /* not PARROT_GC_GMS */

    /* if object is live or on free list return */
    if (PObj_is_live_or_free_TESTALL(obj))
        return;

#  if ! DISABLE_GC_DEBUG
#    if GC_VERBOSE
    if (CONSERVATIVE_POINTER_CHASING)
        fprintf(stderr, "GC Warning! Unanchored %s %p found in system areas \n",
                PObj_is_PMC_TEST(obj) ? "PMC" : "Buffer", obj);

#    endif
#  endif
    /* mark it live */
    PObj_live_SET(obj);

    /* if object is a PMC and contains buffers or PMCs, then attach the PMC
     * to the chained mark list. */
    if (PObj_is_PMC_TEST(obj)) {
        PMC * const p = (PMC *)obj;

        if (PObj_is_special_PMC_TEST(obj))
            mark_special(interp, p);

#  ifndef NDEBUG
        else if (p->pmc_ext && PMC_metadata(p))
            fprintf(stderr, "GC: error obj %p (%s) has properties\n",
                    (void *)p, (char*)p->vtable->whoami->strstart);
#  endif
    }
#  if GC_VERBOSE
    /* buffer GC_DEBUG stuff */
    if (GC_DEBUG(interp) && PObj_report_TEST(obj))
        fprintf(stderr, "GC: buffer %p pointing to %p marked live\n",
                obj, PObj_bufstart((Buffer *)obj));
#  endif
#endif  /* PARROT_GC_GMS */
}
/*

=item C<INTVAL contained_in_pool>

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

=item C<int Parrot_is_const_pmc>

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

=item C<static void mark_special>

Marks the children of a special PMC. Handles the marking necessary
for shared PMCs, and ensures timely marking of high-priority PMCs.
Ensures PMC_EXT structures are properly organized for garbage
collection.

=cut

*/

static void
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
     * the mark phase of DOD must run only on one interpreter of a pool
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

    if (PObj_needs_early_DOD_TEST(obj))
        ++arena_base->num_early_PMCs_seen;

    if (PObj_high_priority_DOD_TEST(obj) && arena_base->gc_trace_ptr) {
        /* set obj's parent to high priority */
        PObj_high_priority_DOD_SET(arena_base->gc_trace_ptr);
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

=item C<static void more_traceable_objects>

We're out of traceable objects. First we try a DOD run to free some up. If
that doesn't work, allocate a new arena.

=cut

*/

static void
more_traceable_objects(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(more_traceable_objects)
    if (pool->skip)
        pool->skip = 0;
    else {
        Small_Object_Arena * const arena = pool->last_Arena;
        if (arena) {
            if (arena->used == arena->total_objects)
                Parrot_do_gc_run(interp, GC_trace_stack_FLAG);

            if (pool->num_free_objects <= pool->replenish_level)
                pool->skip = 1;
        }
    }

    /* requires that num_free_objects be updated in Parrot_do_gc_run. If gc
     * is disabled, then we must check the free list directly. */
    if (!pool->free_list)
        (*pool->alloc_objects) (interp, pool);
}

/*

=item C<static void gc_ms_add_free_pmc_ext>

Add a freed PMC_EXT structure to the free list in the PMC_EXT pool. Objects
on the free list can be reused later.

=cut

*/

static void
gc_ms_add_free_pmc_ext(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool), ARGIN(void *to_add))
{
    ASSERT_ARGS(gc_ms_add_free_pmc_ext)
    PMC_EXT * const object = (PMC_EXT *)to_add;
    object->_metadata      = NULL;

    /* yes, this cast is a hack for now, but a pointer is a pointer */
    object->_next_for_GC   = (PMC *)pool->free_list;
    pool->free_list        = object;
}

/*

=item C<static void gc_ms_add_free_object>

Add an unused object back to the pool's free list for later reuse. Set
the PObj flags to indicate that the item is free.

=cut

*/

static void
gc_ms_add_free_object(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool), ARGIN(void *to_add))
{
    ASSERT_ARGS(gc_ms_add_free_object)
    PObj *object           = (PObj *)to_add;

    PObj_flags_SETTO(object, PObj_on_free_list_FLAG);

    ((GC_MS_PObj_Wrapper*)object)->next_ptr = (PObj *)pool->free_list;
    pool->free_list        = object;
}


/*

=item C<static void * gc_ms_get_free_object>

Free object allocator for the MS garbage collector system. If there are no
free objects, call C<gc_ms_add_free_object> to either free them up with a
DOD run, or allocate new objects. If there are objects available on the
free list, pop it off and return it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void *
gc_ms_get_free_object(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_ms_get_free_object)
    PObj *ptr;
    PObj *free_list = (PObj *)pool->free_list;

    /* if we don't have any objects */
    if (!free_list) {
        (*pool->more_objects)(interp, pool);
        free_list = (PObj *)pool->free_list;
    }

    ptr             = free_list;
    pool->free_list = ((GC_MS_PObj_Wrapper*)ptr)->next_ptr;

    PObj_flags_SETTO(ptr, 0);

    --pool->num_free_objects;

    return ptr;
}


/*

=item C<static void * gc_ms_get_free_pmc_ext>

Get a new PMC_EXT structure from the free pool and return it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static void *
gc_ms_get_free_pmc_ext(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_ms_get_free_pmc_ext)
    PMC_EXT *ptr;
    PMC_EXT *free_list = (PMC_EXT *)pool->free_list;

    /* if we don't have any objects */
    if (!free_list) {
        (*pool->more_objects)(interp, pool);
        free_list = (PMC_EXT *)pool->free_list;
    }

    ptr               = free_list;
    pool->free_list   = ptr->_next_for_GC;
    ptr->_next_for_GC = NULL;

    --pool->num_free_objects;

    return ptr;
}


/*

=item C<static int sweep_cb>

Sweeps the given pool for the MS collector. This function also ends
the profiling timer, if profiling is enabled. Returns the total number
of objects freed.

=cut

*/

static int
sweep_cb(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool), int flag,
    ARGMOD(void *arg))
{
    ASSERT_ARGS(sweep_cb)
    int * const total_free = (int *) arg;

    Parrot_gc_sweep(interp, pool);

    if (interp->profile && (flag & POOL_PMC))
        Parrot_gc_profile_end(interp, PARROT_PROF_DOD_cp);

    *total_free += pool->num_free_objects;

    return 0;
}


/*

=item C<static int trace_active_PMCs>

Performs a full trace run and marks all the PMCs as active if they
are. Returns whether the run completed, that is, whether it's safe
to proceed with GC.

=cut

*/

static int
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

=item C<static void clear_live_bits>

Runs through all PMC arenas and clear live bits. This is used to reset
the GC system after a full system sweep.

=cut

*/

static void
clear_live_bits(ARGIN(const Small_Object_Pool *pool))
{
    ASSERT_ARGS(clear_live_bits)
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

=item C<void Parrot_gc_clear_live_bits>

Resets the PMC pool, so all objects are marked as "White". This
is done after a GC run to reset the system and prepare for the
next mark phase.

=cut

*/

void
Parrot_gc_clear_live_bits(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_clear_live_bits)
    Small_Object_Pool * const pool = interp->arena_base->pmc_pool;
    clear_live_bits(pool);
}


/*

=item C<int Parrot_gc_trace_children>

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
                arena_base->num_early_DOD_PMCs) {
            return 0;
        }

        arena_base->gc_trace_ptr = current;

        /* short-term hack to color objects black */
        PObj_get_FLAGS(current) |= PObj_custom_GC_FLAG;

        /* clearing the flag is much more expensive then testing */
        if (!PObj_needs_early_DOD_TEST(current))
            PObj_high_priority_DOD_CLEAR(current);

        /* mark properties */
        if (PMC_metadata(current))
            pobject_lives(interp, (PObj *)PMC_metadata(current));

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
        Parrot_gc_profile_end(interp, PARROT_PROF_DOD_p2);

    return 1;
}

/*

=item C<void Parrot_add_to_free_list>

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

=item C<void Parrot_append_arena_in_pool>

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

=item C<static void gc_ms_alloc_objects>

New arena allocator function for the MS garbage collector system. Allocates
and initializes a new memory arena in the given pool. Adds all the new
objects to the pool's free list for later allocation.

=cut

*/

static void
gc_ms_alloc_objects(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_ms_alloc_objects)
    /* Setup memory for the new objects */
    Small_Object_Arena * const new_arena =
        mem_internal_allocate_typed(Small_Object_Arena);

    const size_t size = pool->object_size * pool->objects_per_alloc;
    size_t alloc_size;

    /* could be mem_internal_allocate too, but calloc is fast */
    new_arena->start_objects = mem_internal_allocate_zeroed(size);

    Parrot_append_arena_in_pool(interp, pool, new_arena, size);

    Parrot_add_to_free_list(interp, pool, new_arena);

    /* Allocate more next time */
    if (GC_DEBUG(interp)) {
        pool->objects_per_alloc *= GC_DEBUG_UNITS_PER_ALLOC_GROWTH_FACTOR;
        pool->replenish_level =
                (size_t)(pool->total_objects *
                GC_DEBUG_REPLENISH_LEVEL_FACTOR);
    }
    else {
        pool->objects_per_alloc = (size_t)(pool->objects_per_alloc *
            UNITS_PER_ALLOC_GROWTH_FACTOR);
        pool->replenish_level   =
                (size_t)(pool->total_objects * REPLENISH_LEVEL_FACTOR);
    }

    /* check alloc size against maximum */
    alloc_size = pool->object_size * pool->objects_per_alloc;

    if (alloc_size > POOL_MAX_BYTES)
        pool->objects_per_alloc = POOL_MAX_BYTES / pool->object_size;
}


/*

=item C<Small_Object_Pool * new_small_object_pool>

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

=item C<void gc_pmc_ext_pool_init>

Initialize the PMC_EXT pool functions. This is done separately from other
pools.

=cut

*/

void
gc_pmc_ext_pool_init(ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_pmc_ext_pool_init)
    pool->add_free_object = gc_ms_add_free_pmc_ext;
    pool->get_free_object = gc_ms_get_free_pmc_ext;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = gc_ms_alloc_objects;
}


/*

=item C<static void gc_ms_pool_init>

Initialize a memory pool for the MS garbage collector system. Sets the
function pointers necessary to perform basic operations on a pool, such
as object allocation.

=cut

*/

static void
gc_ms_pool_init(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    ASSERT_ARGS(gc_ms_pool_init)
    pool->add_free_object = gc_ms_add_free_object;
    pool->get_free_object = gc_ms_get_free_object;
    pool->alloc_objects   = gc_ms_alloc_objects;
    pool->more_objects    = more_traceable_objects;
}


/*

=item C<void Parrot_gc_ms_init>

Initialize the state structures of the gc system. Called immediately before
creation of memory pools. This function must set the function pointers
for C<add_free_object_fn>, C<get_free_object_fn>, C<alloc_object_fn>, and
C<more_object_fn>.

=cut

*/

void
Parrot_gc_ms_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_ms_init)
    Arenas * const arena_base     = interp->arena_base;

    arena_base->do_gc_mark         = Parrot_gc_ms_run;
    arena_base->finalize_gc_system = NULL;
    arena_base->init_pool          = gc_ms_pool_init;
}


/*

=item C<void Parrot_small_object_pool_merge>

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
