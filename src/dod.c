/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/dod.c - Dead object destruction of the various headers

=head1 DESCRIPTION

This file implements I<dead object destruction>. This is documented in
PDD 9 with supplementary notes in F<docs/dev/dod.dev>.

It's possible to turn on/off the checking of the system stack and
processor registers. The actual checking is implemented in F<src/cpu_dep.c>.

There's also a verbose mode for garbage collection.

=head2 Functions

=over 4

=cut

*/

#define DOD_C_SOURCE
#include "parrot/parrot.h"
#include <assert.h>

/* Set this to 1 to see if unanchored objects are found in system areas.
 * Please note: these objects might be bogus
 */
#define GC_VERBOSE 0

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;
#endif

static size_t find_common_mask(size_t val1, size_t val2);

/*

=item C<static void
mark_special(Parrot_Interp interpreter, PMC* obj)>

Mark a special PMC. If it has a C<PMC_EXT> structure, append or prepend
the C<next_for_GC> pointer; otherwise, do the custom mark directly.

This should really be inline, so if inline isn't available, it would
be better if it was a macro.

=cut

*/

static void
mark_special(Parrot_Interp interpreter, PMC* obj)
{
    int hi_prio;
    struct Arenas *arena_base;

    /*
     * If the object is shared, we have to use the arena and dod
     * pointers of the originating interpreter.
     *
     * We are possibly changing other interpreter's data here, so
     * the mark phase of DOD must run only on one interpreter of a pool
     * at a time. However, freeing of unused objects can be done in
     * parallel.
     * And: to be sure that a shared object is dead, we have to finish
     * the mark phase of all interpreters in a pool that might reference
     * the object.
     */
    if (PObj_is_PMC_shared_TEST(obj)) {
        interpreter = PMC_sync(obj)->owner;
        assert(interpreter);
        /* XXX FIXME hack */
        if (!interpreter->arena_base->dod_mark_ptr)
            interpreter->arena_base->dod_mark_ptr = obj;
    }
    arena_base = interpreter->arena_base;

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
            PMC_next_for_GC(tptr) = (PMC*)obj;
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
        VTABLE_mark(interpreter, obj);
    }
}

#if !PARROT_GC_GMS

/* XXX This should really use the same header, with different guts #ifdeffed */
void
pobject_lives(Interp *interpreter, PObj *obj)
{
    /* if object is live or on free list return */
    if (PObj_is_live_or_free_TESTALL(obj)) {
        return;
    }
#if ! DISABLE_GC_DEBUG
#  if GC_VERBOSE
    if (CONSERVATIVE_POINTER_CHASING) {
        fprintf(stderr, "GC Warning! Unanchored %s %p " 
                " found in system areas \n",
                PObj_is_PMC_TEST(obj) ? "PMC" : "Buffer", obj);
    }
#  endif
#endif
    /* mark it live */
    PObj_live_SET(obj);

    /* if object is a PMC and contains buffers or PMCs, then attach
     * the PMC to the chained mark list.
     */
    if (PObj_is_special_PMC_TEST(obj)) {
        mark_special(interpreter, (PMC*) obj);
    }
#ifndef NDEBUG
    else {
        if (PObj_is_PMC_TEST(obj)) {
            PMC * const p = (PMC*)obj;
            if (p->pmc_ext && PMC_metadata(p)) {
                fprintf(stderr, "GC: error obj %p (%s) has properties\n",
                        p, (char*)p->vtable->whoami->strstart);
            }
        }
    }
#endif
#if GC_VERBOSE
    /* buffer GC_DEBUG stuff */
    if (! GC_DEBUG(interpreter))
        return;

    if (PObj_report_TEST(obj)) {
        fprintf(stderr, "GC: buffer %p pointing to %p marked live\n",
                obj, PObj_bufstart((Buffer*) obj));
    }
#endif
}

#endif  /* PARROT_GC_GMS */

/*

=item C<static int
trace_active_PMCs(Interp *interpreter, int trace_stack)>

Do a full trace run and mark all the PMCs as active if they are. Returns
whether the run wasn't aborted; i.e. whether it's safe to proceed with
GC.

=item C<int
Parrot_dod_trace_root(Interp *interpreter, int trace_stack)>

Trace the root set. Returns 0 if its a lazy DOD run and all objects
that need timely destruction were found.

C<trace_stack> can have these values:

 0 ... trace normal roots, no system areas
 1 ... trace whole root set
 2 ... trace system areas only

=cut

*/

int
Parrot_dod_trace_root(Interp *interpreter, int trace_stack)
{

    struct Arenas *arena_base = interpreter->arena_base;
    parrot_context_t *ctx;

    /*
     * note: adding locals here did cause increased DOD runs
     */
    unsigned int i = 0;

    if (trace_stack == 2) {
        trace_system_areas(interpreter);
        return 0;
    }
    if (interpreter->profile)
        Parrot_dod_profile_start(interpreter);
    /* We have to start somewhere, the interpreter globals is a good place */
    if (!arena_base->dod_mark_start) {
        arena_base->dod_mark_start = arena_base->dod_mark_ptr =
            interpreter->iglobals;
    }

    /* mark it as used  */
    pobject_lives(interpreter, (PObj *)interpreter->iglobals);

    /* mark the current context. */
    ctx = CONTEXT(interpreter->ctx);
    mark_context(interpreter, ctx);

    /*
     * mark vtable->data
     *
     * XXX these PMCs are constant and shouldn't get collected
     * but t/library/dumper* fails w/o this marking.
     *
     * It seems that the Class PMC gets DODed - these should
     * get created as constant PMCs.
     */
    for (i = 1; i < (unsigned int)interpreter->n_vtable_max; i++) {
        VTABLE *vtable;
        /*
         * XXX dynpmc groups have empty slots for abstract objects
         */
        if ( (vtable = interpreter->vtables[i])) {
#if 0
            if (vtable->class)
                pobject_lives(interpreter, (PObj *)vtable->class);
#endif
            if (vtable->mro)
                pobject_lives(interpreter, (PObj *)vtable->mro);
            pobject_lives(interpreter, (PObj *)vtable->_namespace);
        }
    }

    /* mark exception list */
    for (i = 0; i <= E_LAST_PYTHON_E; ++i) {
        pobject_lives(interpreter, (PObj*)interpreter->exception_list[i]);
    }
    /* mark the root_namespace */
    pobject_lives(interpreter, (PObj *)interpreter->root_namespace);
    /* s. packfile.c */
    mark_const_subs(interpreter);

    /* mark caches and freelists */
    mark_object_cache(interpreter);

    /* Now mark the class hash */
    pobject_lives(interpreter, (PObj *)interpreter->class_hash);

    /* Mark the registry if any */
    if (interpreter->DOD_registry)
        pobject_lives(interpreter, (PObj *)interpreter->DOD_registry);

    /* Mark the transaction log */
    /* XXX do this more generically? */
    if (interpreter->thread_data && interpreter->thread_data->stm_log)
        Parrot_STM_mark_transaction(interpreter);

    /* Walk the iodata */
    Parrot_IOData_mark(interpreter, interpreter->piodata);

    /* quick check, if we can already bail out */
    if (arena_base->lazy_dod && arena_base->num_early_PMCs_seen >=
            arena_base->num_early_DOD_PMCs) {
        return 0;
    }

    /* Find important stuff on the system stack */
    if (trace_stack)
        trace_system_areas(interpreter);

    if (interpreter->profile)
        Parrot_dod_profile_end(interpreter, PARROT_PROF_DOD_p1);
    return 1;
}

static int
trace_active_PMCs(Interp *interpreter, int trace_stack)
{
    if (!Parrot_dod_trace_root(interpreter, trace_stack))
        return 0;
    /* Okay, we've marked the whole root set, and should have a good-sized
     * list of things to look at. Run through it */
    return Parrot_dod_trace_children(interpreter, (size_t) -1);
}

/*

=item C<int
Parrot_dod_trace_children(Interp *interpreter, size_t how_many)>

Returns whether the tracing process wasn't aborted.

=cut

*/

int
Parrot_dod_trace_children(Interp *interpreter, size_t how_many)
{
    PMC *next;
    struct Arenas * const arena_base = interpreter->arena_base;
    INTVAL i = 0;
    const UINTVAL mask = PObj_data_is_PMC_array_FLAG | PObj_custom_mark_FLAG;
    PMC *current = arena_base->dod_mark_start;

    const int lazy_dod = arena_base->lazy_dod;

    /*
     * First phase of mark is finished. Now if we are the owner
     * of a shared pool, we must run the mark phase of other
     * interpreters in our pool, so that live shared PMCs in that
     * interpreter are appended to our mark_ptrs chain.
     *
     * If there is a count of shared PMCs and we have already seen
     * all these, we could skip that.
     */
    if (interpreter->profile)
        Parrot_dod_profile_start(interpreter);
    pt_DOD_mark_root_finished(interpreter);

    for (; ; current = next) {
        const UINTVAL bits = PObj_get_FLAGS(current) & mask;

        if (lazy_dod && arena_base->num_early_PMCs_seen >=
                arena_base->num_early_DOD_PMCs) {
            return 0;
        }
        arena_base->dod_trace_ptr = current;
        /*
         * short-term hack to color objects black
         */
        PObj_get_FLAGS(current) |= PObj_custom_GC_FLAG;
        /*
         * clearing the flag is much more expensive then testing
         */
        if (!PObj_needs_early_DOD_TEST(current))
            PObj_high_priority_DOD_CLEAR(current);

        /* mark properties */
        if (PMC_metadata(current)) {
            pobject_lives(interpreter, (PObj *)PMC_metadata(current));
        }
        /* Start by checking if there's anything at all. This assumes that the
         * largest percentage of PMCs won't have anything in their data
         * pointer that we need to trace. */
        if (bits) {
            if (bits == PObj_data_is_PMC_array_FLAG) {
                /* malloced array of PMCs */
                PMC **data = PMC_data(current);

                if (data) {
                    for (i = 0; i < PMC_int_val(current); i++) {
                        if (data[i]) {
                            pobject_lives(interpreter, (PObj *)data[i]);
                        }
                    }
                }
            }
            else {
                /* All that's left is the custom */
                assert(!PObj_on_free_list_TEST(current));
                VTABLE_mark(interpreter, current);
            }
        }

        next = PMC_next_for_GC(current);
        if (next == current)
            break;
        if (--how_many == 0) {
            current = next;
            break;
        }
    }
    arena_base->dod_mark_start = current;
    arena_base->dod_trace_ptr = NULL;
    if (interpreter->profile)
        Parrot_dod_profile_end(interpreter, PARROT_PROF_DOD_p2);
    return 1;
}


#ifdef GC_IS_MALLOC

/*

=item C<void
clear_cow(Interp *interpreter, struct Small_Object_Pool *pool,
        int cleanup)>

Clear the COW ref count.

=cut

*/

void
clear_cow(Interp *interpreter, struct Small_Object_Pool *pool,
        int cleanup)
{
    const UINTVAL object_size = pool->object_size;
    struct Small_Object_Arena *cur_arena;

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
                    /* the real external flag */
                    if (PObj_bufstart_external_TEST(b))
                        PObj_external_SET(b);
                    /* if cleanup (Parrot_destroy) constants are dead too */
                    PObj_constant_CLEAR(b);
                    PObj_live_CLEAR(b);
                }

                if (PObj_COW_TEST(b) && PObj_bufstart(b) &&
                        !PObj_external_TEST(b)) {
                    INTVAL * const refcount = (INTVAL *) PObj_bufstart(b) - 1;
                    *refcount = 0;
                }
            }
            b = (Buffer *)((char *)b + object_size);
        }
    }
}

/*

=item C<void
used_cow(Interp *interpreter, struct Small_Object_Pool *pool,
        int cleanup)>

Find other users of COW's C<bufstart>.

=cut

*/

void
used_cow(Interp *interpreter, struct Small_Object_Pool *pool, int cleanup)
{
    UINTVAL object_size = pool->object_size;
    struct Small_Object_Arena *cur_arena;

    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        Buffer *b = cur_arena->start_objects;
        UINTVAL i;

        for (i = 0; i < cur_arena->used; i++) {
            if (!PObj_on_free_list_TEST(b) &&
                    PObj_COW_TEST(b) &&
                    PObj_bufstart(b) &&
                    !PObj_external_TEST(b)) {
                INTVAL * const refcount = (INTVAL *) PObj_bufstart(b) - 1;
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

=item C<void
Parrot_dod_sweep(Interp *interpreter,
        struct Small_Object_Pool *pool)>

Put any buffers/PMCs that are now unused onto the pool's free list. If
C<GC_IS_MALLOC>, bufstart gets freed too, if possible. Avoid buffers that
are immune from collection (i.e. constant).

=cut

*/

void
Parrot_dod_sweep(Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    struct Arenas *arena_base = interpreter->arena_base;
    struct Small_Object_Arena *cur_arena;
    UINTVAL i, total_used = 0;
    UINTVAL object_size = pool->object_size;
    size_t nm;
#if REDUCE_ARENAS
    UINTVAL free_arenas = 0, old_total_used = 0;
#endif

#if 0
                if (Interp_trace_TEST(interpreter, 1)) {
                    Interp *tracer = interpreter->debugger;
                    PMC *pio = PIO_STDERR(interpreter);
                    PIO_flush(interpreter, pio);
                    if (tracer) {
                        pio = PIO_STDERR(tracer);
                        PIO_flush(tracer, pio);
                    }
                }
#endif
    /* Run through all the buffer header pools and mark */
    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        Buffer *b = cur_arena->start_objects;

        for (i = nm = 0; i < cur_arena->used; i++) {
            if (PObj_on_free_list_TEST(b))
                ; /* if its on free list, do nothing */
            else if (PObj_live_TEST(b)) {
                /* its live */
                total_used++;
                PObj_live_CLEAR(b);
                PObj_get_FLAGS(b) &= ~PObj_custom_GC_FLAG;
            }
            else {
                /* it must be dead */
#if 0
                if (Interp_trace_TEST(interpreter, 1)) {
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
                    if (!(interpreter->thread_data &&
                            (interpreter->thread_data->state &
                            THREAD_STATE_SUSPENDED_GC))) {
                        ++total_used;
                        goto next;
                    } 
                }
                /* if object is a PMC and needs destroying */
                if (PObj_is_PMC_TEST(b)) {
                    PMC *p = (PMC*)b;

                    /* then destroy it here
                     *
                     * TODO collect objects with finalizers
                    */
                    if (PObj_needs_early_DOD_TEST(p))
                        --arena_base->num_early_DOD_PMCs;
                    if (PObj_active_destroy_TEST(p))
                        VTABLE_destroy(interpreter, p);

                    if (PObj_is_PMC_EXT_TEST(p) && p->pmc_ext != NULL) {
                        /* if the PMC has a PMC_EXT structure,
                         * return it to the pool/arena
                         */
                        struct Small_Object_Pool *ext_pool =
                            arena_base->pmc_ext_pool;
                        if (PObj_is_PMC_shared_TEST(p) && PMC_sync(p)) {
                            MUTEX_DESTROY(PMC_sync(p)->pmc_lock);
                            mem_internal_free(PMC_sync(p));
                            PMC_sync(p) = NULL;
                        }
                        ext_pool->add_free_object(interpreter, ext_pool,
                                p->pmc_ext);
                    }
#ifndef NDEBUG
                    /*
                     * invalidate the PMC
                     */
                    p->vtable = (void*)0xdeadbeef;
                    PMC_pmc_val(p) = (void*)0xdeadbeef;
                    p->pmc_ext = (void*)0xdeadbeef;
#endif
                }
                /* else object is a buffer(like) */
                else if (PObj_sysmem_TEST(b) && PObj_bufstart(b)) {
                    /* has sysmem allocated, e.g. string_pin */
                    mem_sys_free(PObj_bufstart(b));
                    PObj_bufstart(b) = NULL;
                    PObj_buflen(b) = 0;
                }
                else {
#ifdef GC_IS_MALLOC
                    /* free allocated space at (int*)bufstart - 1,
                     * but not if it is used COW or external
                     */
                    if (PObj_bufstart(b) &&
                            !PObj_is_external_or_free_TESTALL(b)) {
                        if (PObj_COW_TEST(b)) {
                            INTVAL *refcount = ((INTVAL *)PObj_bufstart(b) - 1);

                            if (!--(*refcount))
                                free(refcount); /* the actual bufstart */
                        }
                        else
                            free((INTVAL*)PObj_bufstart(b) - 1);
                    }
#else
                    /*
                     * XXX Jarkko did report that on irix pool->mem_pool
                     *     was NULL, which really shouldn't happen
                     */
                    if (pool->mem_pool) {
                        if (!PObj_COW_TEST(b)) {
                            ((struct Memory_Pool *)
                             pool->mem_pool)->guaranteed_reclaimable +=
                                PObj_buflen(b);
                        }
                        ((struct Memory_Pool *)
                         pool->mem_pool)->possibly_reclaimable +=
                            PObj_buflen(b);
                    }
#endif
                    PObj_buflen(b) = 0;
                }
                PObj_flags_SETTO((PObj *)b, PObj_on_free_list_FLAG);
                pool->add_free_object(interpreter, pool, b);
            }
next:
            b = (Buffer *)((char *)b + object_size);
        }
    }
    pool->num_free_objects = pool->total_objects - total_used;
}

#ifndef PLATFORM_STACK_WALK

/*

=item C<static size_t find_common_mask(size_t val1, size_t val2)>

Find a mask covering the longest common bit-prefix of C<val1> and
C<val2>.

=cut

*/

static size_t
find_common_mask(size_t val1, size_t val2)
{
    int i;
    const int bound = sizeof(size_t) * 8;

    /* Shifting a value by its size (in bits) or larger is undefined behaviour.
       So need an explicit check to return 0 if there is no prefix, rather than
       attempting to rely on (say) 0xFFFFFFFF << 32 being 0.  */
    for (i = 0; i < bound; i++) {
        if (val1 == val2) {
            return ~(size_t)0 << i;
        }
        val1 >>= 1;
        val2 >>= 1;
    }
    if (val1 == val2) {
        assert(i == bound);
        return 0;
    }

    internal_exception(INTERP_ERROR,
            "Unexpected condition in find_common_mask()!\n");
    return 0;
}

/*

=item C<void
trace_mem_block(Interp *interpreter,
                size_t lo_var_ptr, size_t hi_var_ptr)>

Traces the memory block between C<lo_var_ptr> and C<hi_var_ptr>.

=cut

*/

void
trace_mem_block(Interp *interpreter,
                size_t lo_var_ptr, size_t hi_var_ptr)
{
    size_t prefix;
    ptrdiff_t cur_var_ptr;

    const size_t buffer_min = get_min_buffer_address(interpreter);
    const size_t buffer_max = get_max_buffer_address(interpreter);
    const size_t pmc_min = get_min_pmc_address(interpreter);
    const size_t pmc_max = get_max_pmc_address(interpreter);

    const size_t mask = 
        find_common_mask(buffer_min < pmc_min ? buffer_min : pmc_min,
                         buffer_max > pmc_max ? buffer_max : pmc_max);

    if (!lo_var_ptr || !hi_var_ptr)
        return;
    if (lo_var_ptr < hi_var_ptr) {
        const size_t tmp_ptr = hi_var_ptr;
        hi_var_ptr = lo_var_ptr;
        lo_var_ptr = tmp_ptr;
    }
    /* Get the expected prefix */
    prefix = mask & buffer_min;


    for (cur_var_ptr = hi_var_ptr;
            (ptrdiff_t)cur_var_ptr < (ptrdiff_t)lo_var_ptr;
            cur_var_ptr = (size_t)((ptrdiff_t)cur_var_ptr + sizeof(void *))
            ) {
        const size_t ptr = *(size_t *)cur_var_ptr;

        /* Do a quick approximate range check by bit-masking */
        if ((ptr & mask) == prefix || !prefix) {
            /* Note that what we find via the stack or registers are not
             * guaranteed to be live pmcs/buffers, and could very well have
             * had their bufstart/vtable destroyed due to the linked list of
             * free headers... */
            if (pmc_min <= ptr && ptr < pmc_max &&
                    is_pmc_ptr(interpreter, (void *)ptr)) {
                /* ...so ensure that pobject_lives checks PObj_on_free_list_FLAG
                 * before adding it to the next_for_GC list, to have
                 * vtable->mark() called. */
                pobject_lives(interpreter, (PObj *)ptr);
            }
            else if (buffer_min <= ptr && ptr < buffer_max &&
                    is_buffer_ptr(interpreter, (void *)ptr)) {
                /* ...and since pobject_lives doesn't care about bufstart, it
                 * doesn't really matter if it sets a flag */
                pobject_lives(interpreter, (PObj *)ptr);
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
clear_live_bits(Parrot_Interp interpreter,
        struct Small_Object_Pool * const pool) {
    struct Small_Object_Arena *arena;
    UINTVAL i;
    const UINTVAL object_size = pool->object_size;

    for (arena = pool->last_Arena; arena; arena = arena->prev) {
        Buffer *b = arena->start_objects;
        for (i = 0; i < arena->used; i++) {
            PObj_live_CLEAR(b);
            b = (Buffer *)((char *)b + object_size);
        }
    }

}

void
Parrot_dod_clear_live_bits(Parrot_Interp interpreter)
{
    struct Small_Object_Pool * const pool = interpreter->arena_base->pmc_pool;
    clear_live_bits(interpreter, pool);
}

/*

=item C<void
Parrot_dod_profile_start(Parrot_Interp interpreter)>

Records the start time of a DOD run when profiling is enabled.

=cut

*/

void
Parrot_dod_profile_start(Parrot_Interp interpreter)
{
    if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        interpreter->profile->dod_time = Parrot_floatval_time();
    }
}

/*

=item C<void
Parrot_dod_profile_end(Parrot_Interp interpreter, int what)>

Records the end time of the DOD part C<what> run when profiling is enabled.
Also record start time of next part.

=cut

*/

void
Parrot_dod_profile_end(Parrot_Interp interpreter, int what)
{
    if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        RunProfile * const profile = interpreter->profile;
        const FLOATVAL now = Parrot_floatval_time();

        profile->data[what].numcalls++;
        profile->data[what].time += now - profile->dod_time;
        /*
         * we've recorded the time of a DOD/GC piece from
         * dod_time til now, so add this to the start of the
         * currently executing opcode, which hasn't run this
         * internval.
         */
        profile->starttime += now - profile->dod_time;
        /* prepare start for next step */
        profile->dod_time = now;
    }
}

/*

=item C<void
Parrot_do_dod_run(Interp *interpreter, UINTVAL flags)>

Call the configured garbage collector to reclaim unused headers.

=item C<void
Parrot_dod_ms_run(Interp *interpreter, UINTVAL flags)>

Run the stop-the-world mark & sweep collector.


=item C<void
Parrot_dod_ms_run_init(Interp *interpreter, UINTVAL flags)>

Prepare for a mark & sweep DOD run.

=cut

*/

void
Parrot_dod_ms_run_init(Interp *interpreter)
{
    struct Arenas * const arena_base = interpreter->arena_base;

    arena_base->dod_trace_ptr = NULL;
    arena_base->dod_mark_start = NULL;
    arena_base->num_early_PMCs_seen = 0;
    arena_base->num_extended_PMCs = 0;
}

static int
sweep_cb(Interp *interpreter, struct Small_Object_Pool *pool, int flag,
        void *arg)
{
    int * const total_free = (int *) arg;
#ifdef GC_IS_MALLOC
    if (flag & POOL_BUFFER)
        used_cow(interpreter, pool, 0);
#endif
    Parrot_dod_sweep(interpreter, pool);
#ifdef GC_IS_MALLOC
    if (flag & POOL_BUFFER)
        clear_cow(interpreter, pool, 0);
#endif
    if (interpreter->profile && (flag & POOL_PMC))
        Parrot_dod_profile_end(interpreter, PARROT_PROF_DOD_cp);
    *total_free += pool->num_free_objects;
    return 0;
}

void
Parrot_dod_ms_run(Interp *interpreter, int flags)
{
    struct Arenas *arena_base = interpreter->arena_base;
    /* XXX these should go into the interpreter */
    int total_free = 0;

    if (arena_base->DOD_block_level) {
        return;
    }
    if (interpreter->debugger) {
        /*
         * if the other interpreter did a DOD run, it can set
         * life bits of shared objects, but these aren't reset, because
         * they are in a different arena. When now such a PMC points to
         * other non-shared object, these wouldn't be marked amd hence
         * collected.
         */
        Parrot_dod_clear_live_bits(interpreter);
    }
    /*
     * the sync sweep is always at the end, so that
     * the live bits are cleared
     */
    if (flags & DOD_finish_FLAG) {
        /* XXX */
        Parrot_dod_clear_live_bits(interpreter);
        clear_live_bits(interpreter, 
            interpreter->arena_base->constant_pmc_pool);

        Parrot_dod_sweep(interpreter, interpreter->arena_base->pmc_pool);
        Parrot_dod_sweep(interpreter, 
		interpreter->arena_base->constant_pmc_pool);
        return;
    }
    ++arena_base->DOD_block_level;
    arena_base->lazy_dod = flags & DOD_lazy_FLAG;
    /*
     * tell the threading system that we gonna DOD mark
     */
    pt_DOD_start_mark(interpreter);
    Parrot_dod_ms_run_init(interpreter);

    /* Now go trace the PMCs */
    if (trace_active_PMCs(interpreter, flags & DOD_trace_stack_FLAG)) {

        arena_base->dod_trace_ptr = NULL;
        arena_base->dod_mark_ptr = NULL;
        /*
         * mark is now finished
         */
        pt_DOD_stop_mark(interpreter);

        /* Now put unused PMCs and Buffers on the free list */
        Parrot_forall_header_pools(interpreter, POOL_BUFFER | POOL_PMC,
            (void*)&total_free, sweep_cb);
        if (interpreter->profile)
            Parrot_dod_profile_end(interpreter, PARROT_PROF_DOD_cb);
    }
    else {
        pt_DOD_stop_mark(interpreter); /* XXX */
        /*
         * successful lazy DOD count
         */
        ++arena_base->lazy_dod_runs;
        /* it was an aborted lazy dod run - we should clear
         * the live bits, but e.g. t/pmc/timer_7 succeeds w/o this
         */
#if 1
        Parrot_dod_clear_live_bits(interpreter);
#endif
        if (interpreter->profile)
            Parrot_dod_profile_end(interpreter, PARROT_PROF_DOD_p2);
    }
    /* Note it */
    arena_base->dod_runs++;
    --arena_base->DOD_block_level;
    return;
}

void
Parrot_do_dod_run(Interp *interpreter, UINTVAL flags)
{
    interpreter->arena_base->do_dod_run(interpreter, flags);
    parrot_gc_context(interpreter);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/dod.h>, F<src/cpu_dep.c>, F<docs/dev/dod.dev> and
F<docs/pdds/pdd09_gc.pod>.

=head1 HISTORY

Initial version by Mike Lambert on 2002.05.27.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
