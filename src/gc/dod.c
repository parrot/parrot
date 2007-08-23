/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/dod.c - Dead object destruction of the various headers

=head1 DESCRIPTION

This file implements I<dead object destruction>. This is documented in
PDD 9 with supplementary notes in F<docs/dev/dod.pod>.

It's possible to turn on/off the checking of the system stack and
processor registers. The actual checking is implemented in F<src/cpu_dep.c>.

There's also a verbose mode for garbage collection.

=head1 FUNCTIONS

*/

#define DOD_C_SOURCE
#include "parrot/parrot.h"
#include "parrot/dod.h"

/* HEADERIZER HFILE: include/parrot/dod.h */

/* HEADERIZER BEGIN: static */

static void clear_live_bits( NOTNULL(Small_Object_Pool *pool) )
        __attribute__nonnull__(1);

PARROT_CONST_FUNCTION
static size_t find_common_mask( PARROT_INTERP, size_t val1, size_t val2 )
        __attribute__nonnull__(1);

static void mark_special( PARROT_INTERP, NOTNULL(PMC *obj) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int sweep_cb( PARROT_INTERP,
    NOTNULL(Small_Object_Pool *pool),
    int flag,
    NOTNULL(void *arg) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

static int trace_active_PMCs( PARROT_INTERP, int trace_stack )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */


/* Set this to 1 to see if unanchored objects are found in system areas.
 * Please note: these objects might be bogus
 */
#define GC_VERBOSE 0

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;
#endif

/*

FUNCDOC: mark_special

Mark a special PMC. If it has a C<PMC_EXT> structure, append or prepend
the C<next_for_GC> pointer; otherwise, do the custom mark directly.

This should really be inline, so if inline isn't available, it would
be better if it were a macro.

*/

static void
mark_special(PARROT_INTERP, NOTNULL(PMC *obj))
{
    int     hi_prio;
    Arenas *arena_base;

    /*
     * If the object is shared, we have to use the arena and dod
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
        if (!interp->arena_base->dod_mark_ptr)
            interp->arena_base->dod_mark_ptr = obj;
    }

    arena_base = interp->arena_base;

    if (PObj_needs_early_DOD_TEST(obj))
        ++arena_base->num_early_PMCs_seen;

    if (PObj_high_priority_DOD_TEST(obj) && arena_base->dod_trace_ptr) {
        /* set obj's parent to high priority */
        PObj_high_priority_DOD_SET(arena_base->dod_trace_ptr);
        hi_prio = 1;
    }
    else
        hi_prio = 0;

    if (obj->pmc_ext) {
        PMC* const tptr = arena_base->dod_trace_ptr;

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
        if (tptr || hi_prio) {
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
            PMC_next_for_GC(arena_base->dod_mark_ptr) = obj;

            /* Explicitly make the tail of the linked list be
             * self-referential */
            arena_base->dod_mark_ptr = PMC_next_for_GC(obj) = obj;
        }
    }
    else if (PObj_custom_mark_TEST(obj)) {
        PObj_get_FLAGS(obj) |= PObj_custom_GC_FLAG;
        VTABLE_mark(interp, obj);
    }
}

PARROT_API
void
pobject_lives(PARROT_INTERP, NOTNULL(PObj *obj))
{
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
    if (CONSERVATIVE_POINTER_CHASING) {
        fprintf(stderr, "GC Warning! Unanchored %s %p "
                " found in system areas \n",
                PObj_is_PMC_TEST(obj) ? "PMC" : "Buffer", obj);
    }
#    endif
#  endif
    /* mark it live */
    PObj_live_SET(obj);

    /* if object is a PMC and it's real_self pointer points to another
     * PMC, we must mark that. */
    if (PObj_is_PMC_TEST(obj)) {
        PMC * const p = (PMC*)obj;
        if (p->real_self != p)
            pobject_lives(interp, (PObj *)p->real_self);
    }

    /* if object is a PMC and contains buffers or PMCs, then attach
     * the PMC to the chained mark list.
     */
    if (PObj_is_special_PMC_TEST(obj)) {
        mark_special(interp, (PMC*) obj);
    }
#  ifndef NDEBUG
    else {
        if (PObj_is_PMC_TEST(obj)) {
            PMC * const p = (PMC*)obj;

            if (p->pmc_ext && PMC_metadata(p)) {
                fprintf(stderr, "GC: error obj %p (%s) has properties\n",
                        (void *)p, (char*)p->vtable->whoami->strstart);
            }
        }
    }
#  endif
#  if GC_VERBOSE
    /* buffer GC_DEBUG stuff */
    if (! GC_DEBUG(interp))
        return;

    if (PObj_report_TEST(obj)) {
        fprintf(stderr, "GC: buffer %p pointing to %p marked live\n",
                obj, PObj_bufstart((Buffer*) obj));
    }
#  endif
#endif  /* PARROT_GC_GMS */
}

/*

FUNCDOC: Parrot_dod_trace_root

Trace the root set. Returns 0 if it's a lazy DOD run and all objects
that need timely destruction were found.

C<trace_stack> can have these values:

 0 ... trace normal roots, no system areas
 1 ... trace whole root set
 2 ... trace system areas only

*/

int
Parrot_dod_trace_root(PARROT_INTERP, int trace_stack)
{
    Arenas           * const arena_base = interp->arena_base;
    parrot_context_t *ctx;

    /* note: adding locals here did cause increased DOD runs */
    unsigned int i = 0;

    if (trace_stack == 2) {
        trace_system_areas(interp);
        return 0;
    }

    if (interp->profile)
        Parrot_dod_profile_start(interp);

    /* We have to start somewhere; the interpreter globals is a good place */
    if (!arena_base->dod_mark_start) {
        arena_base->dod_mark_start
            = arena_base->dod_mark_ptr
            = interp->iglobals;
    }

    /* mark it as used  */
    pobject_lives(interp, (PObj *)interp->iglobals);

    /* mark the current context. */
    ctx = CONTEXT(interp->ctx);
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

    /* mark exception list */
    for (i = 0; i <= E_LAST_PYTHON_E; ++i)
        pobject_lives(interp, (PObj*)interp->exception_list[i]);

    /* mark the root_namespace */
    pobject_lives(interp, (PObj *)interp->root_namespace);

    /* s. packfile.c */
    mark_const_subs(interp);

    /* mark caches and freelists */
    mark_object_cache(interp);

    /* Now mark the class hash */
    pobject_lives(interp, (PObj *)interp->class_hash);

    /* Mark the PMC Proxy PMC array. */
    pobject_lives(interp, (PObj *)interp->pmc_proxies);

    /* Mark the registry if any */
    if (interp->DOD_registry)
        pobject_lives(interp, (PObj *)interp->DOD_registry);

    /* Mark the transaction log */
    /* XXX do this more generically? */
    if (interp->thread_data && interp->thread_data->stm_log)
        Parrot_STM_mark_transaction(interp);

    /* Walk the iodata */
    Parrot_IOData_mark(interp, interp->piodata);

    /* quick check if we can already bail out */
    if (arena_base->lazy_dod && arena_base->num_early_PMCs_seen >=
            arena_base->num_early_DOD_PMCs)
        return 0;

    /* Find important stuff on the system stack */
    if (trace_stack)
        trace_system_areas(interp);

    if (interp->profile)
        Parrot_dod_profile_end(interp, PARROT_PROF_DOD_p1);

    return 1;
}


/*

FUNCDOC: trace_active_PMCs

Do a full trace run and mark all the PMCs as active if they are. Returns
whether the run completed, that is, whether it's safe to proceed with GC.

*/

static int
trace_active_PMCs(PARROT_INTERP, int trace_stack)
{
    if (!Parrot_dod_trace_root(interp, trace_stack))
        return 0;

    /* Okay, we've marked the whole root set, and should have a good-sized
     * list of things to look at. Run through it */
    return Parrot_dod_trace_children(interp, (size_t) -1);
}

/*

FUNCDOC: Parrot_dod_trace_children

Returns whether the tracing process completed.

*/

int
Parrot_dod_trace_children(PARROT_INTERP, size_t how_many)
{
    Arenas * const arena_base = interp->arena_base;
    const int      lazy_dod   = arena_base->lazy_dod;
    PMC           *current    = arena_base->dod_mark_start;
    PMC           *next       = PMCNULL;

    const UINTVAL mask = PObj_data_is_PMC_array_FLAG | PObj_custom_mark_FLAG;

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
        Parrot_dod_profile_start(interp);

    pt_DOD_mark_root_finished(interp);

    for (; ; current = next) {
        const UINTVAL bits = PObj_get_FLAGS(current) & mask;

        if (lazy_dod && arena_base->num_early_PMCs_seen >=
                arena_base->num_early_DOD_PMCs) {
            return 0;
        }

        arena_base->dod_trace_ptr = current;

        /* short-term hack to color objects black */
        PObj_get_FLAGS(current) |= PObj_custom_GC_FLAG;

        /* clearing the flag is much more expensive then testing */
        if (!PObj_needs_early_DOD_TEST(current))
            PObj_high_priority_DOD_CLEAR(current);

        /* mark properties */
        if (PMC_metadata(current))
            pobject_lives(interp, (PObj *)PMC_metadata(current));

        /* Start by checking if there's anything at all. This assumes that the
         * largest percentage of PMCs won't have anything in their data
         * pointer that we need to trace. */
        if (bits) {
            if (bits == PObj_data_is_PMC_array_FLAG)
                Parrot_dod_trace_pmc_data(interp, current);
            else {
                /* All that's left is the custom */
                PARROT_ASSERT(!PObj_on_free_list_TEST(current));
                VTABLE_mark(interp, current);
            }
        }

        next = PMC_next_for_GC(current);

        if (!PMC_IS_NULL(next) && next == current)
            break;

        if (--how_many == 0) {
            current = next;
            break;
        }
    }

    arena_base->dod_mark_start = current;
    arena_base->dod_trace_ptr  = NULL;

    if (interp->profile)
        Parrot_dod_profile_end(interp, PARROT_PROF_DOD_p2);

    return 1;
}

void
Parrot_dod_trace_pmc_data(PARROT_INTERP, NOTNULL(PMC * const p))
{
    /* malloced array of PMCs */
    PMC ** const data = PMC_data_typed(p, PMC **);
    INTVAL i;

    if (!data)
        return;

    for (i = 0; i < PMC_int_val(p); i++) {
        if (data[i])
            pobject_lives(interp, (PObj *)data[i]);
    }
}

#ifdef GC_IS_MALLOC

/*

FUNCDOC: clear_cow

Clear the COW ref count.

*/

void
clear_cow(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool), int cleanup)
{
    const UINTVAL       object_size = pool->object_size;
    Small_Object_Arena *cur_arena;

    /* clear refcount for COWable objects. */
    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        UINTVAL i;
        Buffer *b = cur_arena->start_objects;

        for (i = 0; i < cur_arena->used; i++) {
            if (!PObj_on_free_list_TEST(b)) {
                if (cleanup) {
                    /* clear COWed external FLAG */
                    PObj_external_CLEAR(b);

                    /* if cleanup (Parrot_destroy) constants are dead too */
                    PObj_constant_CLEAR(b);
                    PObj_live_CLEAR(b);
                }

                if (PObj_COW_TEST(b) && PObj_bufstart(b) &&
                        !PObj_external_TEST(b)) {
                    INTVAL * const refcount = PObj_bufrefcountptr(b);
                    *refcount               = 0;
                }
            }

            b = (Buffer *)((char *)b + object_size);
        }
    }
}

/*

FUNCDOC: used_cow

Find other users of COW's C<bufstart>.

*/

void
used_cow(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool), int cleanup)
{
    UINTVAL             object_size = pool->object_size;
    Small_Object_Arena *cur_arena;

    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        const Buffer *b = cur_arena->start_objects;
        UINTVAL i;

        for (i = 0; i < cur_arena->used; i++) {
            if (!PObj_on_free_list_TEST(b) &&
                    PObj_COW_TEST(b) &&
                    PObj_bufstart(b) &&
                   !PObj_external_TEST(b)) {

                INTVAL * const refcount = PObj_bufrefcountptr(b);

                /* mark users of this bufstart by incrementing refcount */
                if (PObj_live_TEST(b))
                    *refcount = 1 << 29;        /* ~infinite usage */
                else
                    (*refcount)++;      /* dead usage */
            }

            b = (Buffer *)((char *)b + object_size);
        }
    }
}
#endif /* GC_IS_MALLOC */

/*

FUNCDOC: Parrot_dod_sweep

Put any buffers/PMCs that are now unused onto the pool's free list. If
C<GC_IS_MALLOC>, bufstart gets freed too, if possible. Avoid buffers that
are immune from collection (i.e. constant).

*/

void
Parrot_dod_sweep(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool))
{
    Arenas * const arena_base = interp->arena_base;

    UINTVAL i;
    UINTVAL total_used    = 0;
    UINTVAL object_size   = pool->object_size;

    Small_Object_Arena *cur_arena;

#if GC_VERBOSE
    if (Interp_trace_TEST(interp, 1)) {
        Interp *tracer = interp->debugger;
        PMC *pio       = PIO_STDERR(interp);

        PIO_flush(interp, pio);

        if (tracer) {
            pio = PIO_STDERR(tracer);
            PIO_flush(tracer, pio);
        }
    }
#endif

    /* Run through all the buffer header pools and mark */
    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        Buffer *b = (Buffer *)cur_arena->start_objects;

        for (i = 0; i < cur_arena->total_objects; i++) {
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

                /* if object is a PMC and needs destroying */
                if (PObj_is_PMC_TEST(b)) {
                    Parrot_dod_free_pmc(interp, (PMC *)b);
                }
                /* else object is a buffer(like) */
                else if (PObj_sysmem_TEST(b)) {
                    Parrot_dod_free_sysmem(interp, b);
                }
                else {
#ifdef GC_IS_MALLOC

                    /* free allocated space at (int*)bufstart - 1, but not if
                     * it used COW or is external */
                    if ( PObj_bufstart(b) &&
                        !PObj_is_external_or_free_TESTALL(b))
                        Parrot_dod_free_buffer_malloc(interp, b);
#else
                    Parrot_dod_free_buffer(interp, pool, b);
#endif
                    PObj_buflen(b) = 0;
                }

                pool->add_free_object(interp, pool, b);
            }
next:
            b = (Buffer *)((char *)b + object_size);
        }
    }

    pool->num_free_objects = pool->total_objects - total_used;
}

void
Parrot_dod_free_pmc(PARROT_INTERP, NOTNULL(PMC * const p))
{
    Arenas * const arena_base = interp->arena_base;

    /* TODO collect objects with finalizers */
    if (PObj_needs_early_DOD_TEST(p))
        --arena_base->num_early_DOD_PMCs;

    if (PObj_active_destroy_TEST(p))
        VTABLE_destroy(interp, p);

    if (PObj_is_PMC_EXT_TEST(p))
         Parrot_free_pmc_ext(interp, p);

#ifndef NDEBUG

    /* invalidate the PMC */
    p->pmc_ext     = (PMC_EXT *)0xdeadbeef;
    p->vtable      = (VTABLE  *)0xdeadbeef;
    PMC_pmc_val(p) = (PMC     *)0xdeadbeef;

#endif

}

/*

FUNCDOC: Parrot_free_pmc_ext

Frees the PMC_EXT structure attached to a PMC, if it exists.

*/

void
Parrot_free_pmc_ext(PARROT_INTERP, NOTNULL(PMC *p))
{
    /* if the PMC has a PMC_EXT structure, return it to the pool/arena */
    Arenas            * const arena_base = interp->arena_base;
    Small_Object_Pool * const ext_pool   = arena_base->pmc_ext_pool;

    if (PObj_is_PMC_shared_TEST(p) && PMC_sync(p)) {
        MUTEX_DESTROY(PMC_sync(p)->pmc_lock);
        mem_internal_free(PMC_sync(p));
        PMC_sync(p) = NULL;
    }

    if (p->pmc_ext)
        ext_pool->add_free_object(interp, ext_pool, (PObj *)p->pmc_ext);

    p->pmc_ext = NULL;
}

void
Parrot_dod_free_sysmem(PARROT_INTERP, NOTNULL(PObj *b))
{
    /* has sysmem allocated, e.g. string_pin */
    if (PObj_bufstart(b))
        mem_sys_free(PObj_bufstart(b));

    PObj_bufstart(b) = NULL;
    PObj_buflen(b)   = 0;
}

void
Parrot_dod_free_buffer_malloc(PARROT_INTERP, NOTNULL(PObj *b))
{
    if (PObj_COW_TEST(b)) {
        INTVAL *refcount = ((INTVAL *)PObj_bufstart(b) - 1);

        if (!--(*refcount)) {
            free(refcount); /* the actual bufstart */
            refcount = NULL;
        }
    }
    else
        free((INTVAL *)PObj_bufstart(b) - 1);
}

void
Parrot_dod_free_buffer( PARROT_INTERP, NOTNULL(Small_Object_Pool *pool),
    NOTNULL(PObj *b))
{
    Memory_Pool *mem_pool = (Memory_Pool *)pool->mem_pool;

    /* XXX Jarkko reported that on irix pool->mem_pool was NULL, which really
     * shouldn't happen */
    if (mem_pool) {
        if (!PObj_COW_TEST(b))
            mem_pool->guaranteed_reclaimable += PObj_buflen(b);

         mem_pool->possibly_reclaimable += PObj_buflen(b);
    }
}

#ifndef PLATFORM_STACK_WALK

/*

FUNCDOC: find_common_mask

Find a mask covering the longest common bit-prefix of C<val1> and C<val2>.

*/

PARROT_CONST_FUNCTION
static size_t
find_common_mask(PARROT_INTERP, size_t val1, size_t val2)
{
    int       i;
    const int bound = sizeof (size_t) * 8;

    /* Shifting a value by its size (in bits) or larger is undefined behaviour.
       So need an explicit check to return 0 if there is no prefix, rather than
       attempting to rely on (say) 0xFFFFFFFF << 32 being 0.  */
    for (i = 0; i < bound; i++) {
        if (val1 == val2)
            return ~(size_t)0 << i;

        val1 >>= 1;
        val2 >>= 1;
    }

    if (val1 == val2) {
        PARROT_ASSERT(i == bound);
        return 0;
    }

    real_exception(interp, NULL, INTERP_ERROR,
            "Unexpected condition in find_common_mask()!\n");
}

/*

FUNCDOC: trace_mem_block

Traces the memory block between C<lo_var_ptr> and C<hi_var_ptr>.

*/

void
trace_mem_block(PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr)
{
    size_t    prefix;
    ptrdiff_t cur_var_ptr;

    const size_t buffer_min = get_min_buffer_address(interp);
    const size_t buffer_max = get_max_buffer_address(interp);
    const size_t pmc_min    = get_min_pmc_address(interp);
    const size_t pmc_max    = get_max_pmc_address(interp);

    const size_t mask       =
        find_common_mask(interp,
                         buffer_min < pmc_min ? buffer_min : pmc_min,
                         buffer_max > pmc_max ? buffer_max : pmc_max);

    if (!lo_var_ptr || !hi_var_ptr)
        return;

    if (lo_var_ptr < hi_var_ptr) {
        const size_t tmp_ptr = hi_var_ptr;
        hi_var_ptr           = lo_var_ptr;
        lo_var_ptr           = tmp_ptr;
    }

    /* Get the expected prefix */
    prefix = mask & buffer_min;

    for (cur_var_ptr = hi_var_ptr;
            (ptrdiff_t)cur_var_ptr < (ptrdiff_t)lo_var_ptr;
            cur_var_ptr = (size_t)((ptrdiff_t)cur_var_ptr + sizeof (void *))) {
        const size_t ptr = *(size_t *)cur_var_ptr;

        /* Do a quick approximate range check by bit-masking */
        if ((ptr & mask) == prefix || !prefix) {
            /* Note that what we find via the stack or registers are not
             * guaranteed to be live pmcs/buffers, and could very well have
             * had their bufstart/vtable destroyed due to the linked list of
             * free headers... */
            if (pmc_min <= ptr && ptr < pmc_max &&
                    is_pmc_ptr(interp, (void *)ptr)) {
                /* ...so ensure that pobject_lives checks PObj_on_free_list_FLAG
                 * before adding it to the next_for_GC list, to have
                 * vtable->mark() called. */
                pobject_lives(interp, (PObj *)ptr);
            }
            else if (buffer_min <= ptr && ptr < buffer_max &&
                    is_buffer_ptr(interp, (void *)ptr)) {
                /* ...and since pobject_lives doesn't care about bufstart, it
                 * doesn't really matter if it sets a flag */
                pobject_lives(interp, (PObj *)ptr);
            }
        }
    }

    return;
}
#endif

/*

FUNCDOC:
Run through all PMC arenas and clear live bits.

*/

static void
clear_live_bits(NOTNULL(Small_Object_Pool *pool))
{
    Small_Object_Arena *arena;
    const UINTVAL       object_size = pool->object_size;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        Buffer *b = (Buffer *)arena->start_objects;
        UINTVAL i;

        for (i = 0; i < arena->used; i++) {
            PObj_live_CLEAR(b);
            b = (Buffer *)((char *)b + object_size);
        }
    }

}

void
Parrot_dod_clear_live_bits(PARROT_INTERP)
{
    Small_Object_Pool * const pool = interp->arena_base->pmc_pool;
    clear_live_bits(pool);
}

/*

FUNCDOC: Parrot_dod_profile_start

Records the start time of a DOD run when profiling is enabled.

*/

void
Parrot_dod_profile_start(PARROT_INTERP)
{
    if (Interp_flags_TEST(interp, PARROT_PROFILE_FLAG))
        interp->profile->dod_time = Parrot_floatval_time();
}

/*

FUNCDOC: Parrot_dod_profile_end

Records the end time of the DOD part C<what> run when profiling is enabled.
Also record start time of next part.

*/

void
Parrot_dod_profile_end(PARROT_INTERP, int what)
{
    if (Interp_flags_TEST(interp, PARROT_PROFILE_FLAG)) {
        RunProfile * const profile = interp->profile;
        const FLOATVAL     now     = Parrot_floatval_time();

        profile->data[what].numcalls++;
        profile->data[what].time += now - profile->dod_time;

        /*
         * we've recorded the time of a DOD/GC piece from
         * dod_time until now, so add this to the start of the
         * currently executing opcode, which hasn't run this
         * interval.
         */
        profile->starttime += now - profile->dod_time;

        /* prepare start for next step */
        profile->dod_time   = now;
    }
}

/*

FUNCDOC: Parrot_dod_ms_run_init

Prepare for a mark & sweep DOD run.

*/

void
Parrot_dod_ms_run_init(PARROT_INTERP)
{
    Arenas * const arena_base       = interp->arena_base;

    arena_base->dod_trace_ptr       = NULL;
    arena_base->dod_mark_start      = NULL;
    arena_base->num_early_PMCs_seen = 0;
    arena_base->num_extended_PMCs   = 0;
}

static int
sweep_cb(PARROT_INTERP, NOTNULL(Small_Object_Pool *pool), int flag,
    NOTNULL(void *arg))
{
    int * const total_free = (int *) arg;

#ifdef GC_IS_MALLOC
    if (flag & POOL_BUFFER)
        used_cow(interp, pool, 0);
#endif

    Parrot_dod_sweep(interp, pool);

#ifdef GC_IS_MALLOC
    if (flag & POOL_BUFFER)
        clear_cow(interp, pool, 0);
#endif

    if (interp->profile && (flag & POOL_PMC))
        Parrot_dod_profile_end(interp, PARROT_PROF_DOD_cp);

    *total_free += pool->num_free_objects;

    return 0;
}

/*

FUNCDOC: Parrot_dod_ms_run

Run the stop-the-world mark & sweep collector.

*/

void
Parrot_dod_ms_run(PARROT_INTERP, int flags)
{
    Arenas * const arena_base = interp->arena_base;

    /* XXX these should go into the interpreter */
    int total_free     = 0;

    if (arena_base->DOD_block_level)
        return;

    if (interp->debugger) {
        /*
         * if the other interpreter did a DOD run, it can set
         * live bits of shared objects, but these aren't reset, because
         * they are in a different arena. When now such a PMC points to
         * other non-shared object, these wouldn't be marked and hence
         * collected.
         */
        Parrot_dod_clear_live_bits(interp);
    }

    /*
     * the sync sweep is always at the end, so that
     * the live bits are cleared
     */
    if (flags & DOD_finish_FLAG) {
        /* XXX */
        Parrot_dod_clear_live_bits(interp);
        clear_live_bits(interp->arena_base->constant_pmc_pool);

        Parrot_dod_sweep(interp, interp->arena_base->pmc_pool);
        Parrot_dod_sweep(interp, interp->arena_base->constant_pmc_pool);

        return;
    }

    ++arena_base->DOD_block_level;
    arena_base->lazy_dod = flags & DOD_lazy_FLAG;

    /* tell the threading system that we're doing DOD mark */
    pt_DOD_start_mark(interp);
    Parrot_dod_ms_run_init(interp);

    /* Now go trace the PMCs */
    if (trace_active_PMCs(interp, flags & DOD_trace_stack_FLAG)) {
        int ignored;

        arena_base->dod_trace_ptr = NULL;
        arena_base->dod_mark_ptr  = NULL;

        /* mark is now finished */
        pt_DOD_stop_mark(interp);

        /* Now put unused PMCs and Buffers on the free list */
        ignored = Parrot_forall_header_pools(interp, POOL_BUFFER | POOL_PMC,
            (void*)&total_free, sweep_cb);

        if (interp->profile)
            Parrot_dod_profile_end(interp, PARROT_PROF_DOD_cb);
    }
    else {
        pt_DOD_stop_mark(interp); /* XXX */

        /* successful lazy DOD count */
        ++arena_base->lazy_dod_runs;

        Parrot_dod_clear_live_bits(interp);
        if (interp->profile)
            Parrot_dod_profile_end(interp, PARROT_PROF_DOD_p2);
    }

    /* Note it */
    arena_base->dod_runs++;
    --arena_base->DOD_block_level;

    return;
}


/*

FUNCDOC: Parrot_do_dod_run

Call the configured garbage collector to reclaim unused headers.

*/

void
Parrot_do_dod_run(PARROT_INTERP, UINTVAL flags)
{
    interp->arena_base->do_dod_run(interp, flags);
    parrot_gc_context(interp);
}

/*

=head1 SEE ALSO

F<include/parrot/dod.h>, F<src/cpu_dep.c>, F<docs/dev/dod.dev> and
F<docs/pdds/pdd09_gc.pod>.

=head1 HISTORY

Initial version by Mike Lambert on 2002.05.27.

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
