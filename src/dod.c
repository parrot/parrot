/* dod.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  Data Structure and Algorithms:
 *
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/method_util.h"
#include <assert.h>

/* set this to 1 for tracing the system stack and processor registers */
#define TRACE_SYSTEM_AREAS 0

/* set this to 1 and above to zero to see if unanchored objects
 * are found in system areas. Please note: these objects might be bogus
 */
#define GC_VERBOSE 0

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
int CONSERVATIVE_POINTER_CHASING = 0;
#endif

static size_t find_common_mask(size_t val1, size_t val2);

/* Tag a buffer header as alive. Used by the GC system when tracing
 * the root set, and used by the PMC GC handling routines to tag their
 * individual pieces if they have private ones */
void pobject_lives(struct Parrot_Interp *interpreter, PObj *obj)
{
    /* if object is live or on free list return */
    if (PObj_is_live_or_free_TESTALL(obj)) {
        return;
    }
#if ! DISABLE_GC_DEBUG
#  if GC_VERBOSE
    if (CONSERVATIVE_POINTER_CHASING) {
        fprintf(stderr, "GC Warning! Unanchored %s %p version " INTVAL_FMT
                " found in system areas \n",
                PObj_is_PMC_TEST(obj) ? "PMC" : "Buffer",
                obj, obj->version);
    }
#  endif
#endif
    /* mark it live */
    PObj_live_SET(obj);
    /* if object is a PMC and contains buffers or PMCs, then attach
     * the PMC to the chained mark list
     */
    if (PObj_is_PMC_TEST(obj)) {
        UINTVAL mask = PObj_is_PMC_ptr_FLAG | PObj_is_buffer_ptr_FLAG
            | PObj_custom_mark_FLAG;
        if ( (PObj_get_FLAGS(obj) & mask) || ((PMC*)obj)->metadata) {
            /* put it on the end of the list */
            interpreter->mark_ptr->next_for_GC = (PMC *)obj;
            /* Explicitly make the tail of the linked list be
             * self-referential */
            interpreter->mark_ptr = ((PMC*)obj)->next_for_GC = (PMC *)obj;
        }
        return;
    }
#if GC_VERBOSE
    /* buffer GC_DEBUG stuff */
    if (! GC_DEBUG(interpreter))
        return;

    if (PObj_report_TEST(obj)) {
        fprintf(stderr, "GC: buffer %p pointing to %p marked live\n",
                obj, ((Buffer*)obj)->bufstart);
    }
#endif
}


/* Do a full trace run and mark all the PMCs as active if they are */
static void
trace_active_PMCs(struct Parrot_Interp *interpreter)
{
    PMC *current, *prev = NULL;
    /* Pointers to the currently being processed PMC, and
     * in the previously processed PMC in a loop.
     *
     * initialize locals to zero, so no garbage is on stack
     *
     * note: adding locals here did cause increased DOD runs
     */
    unsigned int i = 0, j = 0;
    struct PRegChunk *cur_chunk = 0;
    struct Stash *stash = 0;
    UINTVAL mask = PObj_is_PMC_ptr_FLAG | PObj_is_buffer_ptr_FLAG
        | PObj_custom_mark_FLAG;

    /* We have to start somewhere, and the classname hash is a good place */
    interpreter->mark_ptr = current = interpreter->Parrot_base_classname_hash;

    /* mark it as used  */
    pobject_lives(interpreter, (PObj *)current);

    /* Now, go run through the PMC registers and mark them as live */
    /* First mark the current set. */
    for (i = 0; i < NUM_REGISTERS; i++) {
        if (interpreter->ctx.pmc_reg.registers[i]) {
            pobject_lives(interpreter,
                    (PObj *)interpreter->ctx.pmc_reg.registers[i]);
        }
    }

    /* Walk through the stashes */
    stash = interpreter->perl_stash;
    while (stash) {
        pobject_lives(interpreter, (PObj *)stash->stash_hash);
        stash = stash->parent_stash;
    }

    /* Now walk the pmc stack. Make sure to walk from top down since stack may
     * have segments above top that we shouldn't walk. */
    for (cur_chunk = interpreter->ctx.pmc_reg_top; cur_chunk;
            cur_chunk = cur_chunk->prev) {
        for (j = 0; j < cur_chunk->used; j++) {
            for (i = 0; i < NUM_REGISTERS; i++) {
                if (cur_chunk->PReg[j].registers[i]) {
                    pobject_lives(interpreter,
                            (PObj *)cur_chunk->PReg[j].registers[i]);
                }
            }
        }
    }

    /* Walk all stacks: lexical pad, user and control */
    {
        Stack_Chunk_t *stacks[3];

        stacks[0] = interpreter->ctx.pad_stack;
        stacks[1] = interpreter->ctx.user_stack;
        stacks[2] = interpreter->ctx.control_stack;
        for (j = 0; j < 3; j++)
            mark_stack(interpreter, stacks[j]);

    }
    /* Find important stuff on the system stack */
#if TRACE_SYSTEM_AREAS
    trace_system_areas(interpreter);
#endif

    /* Okay, we've marked the whole root set, and should have a good-sized
     * list 'o things to look at. Run through it */
    for (; current != prev; current = current->next_for_GC) {
        UINTVAL bits = PObj_get_FLAGS(current) & mask;

        /* mark properties */
        if (current->metadata) {
            pobject_lives(interpreter, (PObj *)current->metadata);
        }
        /* Start by checking if there's anything at all. This assumes that the
         * largest percentage of PMCs won't have anything in their data
         * pointer that we need to trace */
        if (bits) {
            if (bits == PObj_is_PMC_ptr_FLAG) {
                if (current->data) {
                    pobject_lives(interpreter, current->data);
                }
            }
            else if (bits == PObj_is_buffer_ptr_FLAG) {
                if (current->data) {
                    pobject_lives(interpreter, current->data);
                }
            }
            else if (bits == PObj_is_buffer_of_PMCs_ptr_FLAG) {
                /* buffer of PMCs */
                Buffer *trace_buf = current->data;

                if (trace_buf) {
                    PMC **cur_pmc = trace_buf->bufstart;

                    /* Mark the damn buffer as used! */
                    pobject_lives(interpreter, trace_buf);
                    for (i = 0; i < trace_buf->buflen / sizeof(*cur_pmc); i++) {
                        if (cur_pmc[i]) {
                            pobject_lives(interpreter, (PObj *)cur_pmc[i]);
                        }
                    }
                }
            }
            else {
                /* All that's left is the custom */
                current->vtable->mark(interpreter, current);
            }
        }

        prev = current;
    }
}

/* Scan any buffers in S registers and other non-PMC places and mark
 * them as active */
static void
trace_active_buffers(struct Parrot_Interp *interpreter)
{
    UINTVAL i, j;
    Stack_Chunk_t *cur_stack;
    struct SRegChunk *cur_chunk;
    Stack_Entry_t *entry;

    /* First mark the current set. We assume that all pointers in S registers
     * are pointing to valid buffers. This is not a good assumption, but it'll
     * do for now */
    for (i = 0; i < NUM_REGISTERS; i++) {
        Buffer *reg = (Buffer *)interpreter->ctx.string_reg.registers[i];

        if (reg)
            pobject_lives(interpreter, reg);
    }

    /* The interpreter has a few strings of its own */
    if (interpreter->current_file)
        pobject_lives(interpreter, (Buffer *)interpreter->current_file);
    if (interpreter->current_package)
        pobject_lives(interpreter, (Buffer *)interpreter->current_package);
    for (i = 1; i < enum_class_max; i++)
        pobject_lives(interpreter, (Buffer *)Parrot_base_vtables[i].name
                (interpreter, 0));

    /* Now walk the string stack. Make sure to walk from top down since stack
     * may have segments above top that we shouldn't walk. */
    for (cur_chunk = interpreter->ctx.string_reg_top;
            cur_chunk; cur_chunk = cur_chunk->prev) {
        for (j = 0; j < cur_chunk->used; j++) {
            for (i = 0; i < NUM_REGISTERS; i++) {
                Buffer *reg = (Buffer *)cur_chunk->SReg[j].registers[i];

                if (reg)
                    pobject_lives(interpreter, reg);
            }
        }
    }
}

#ifdef GC_IS_MALLOC

/* clear ref count */
void
clear_cow(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool,
        int cleanup)
{
    UINTVAL object_size = pool->object_size;
    struct Small_Object_Arena *cur_arena;
    UINTVAL i;
    Buffer *b;
    int *refcount;

    /* clear refcount for COWable objects. As these are STRINGs only these
     * have _is_string_FLAG set */
    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        b = cur_arena->start_objects;
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

                if (PObj_is_string_TEST(b) && b->bufstart &&
                        !PObj_external_TEST(b)) {
                    refcount = ((int *)b->bufstart);
                    *refcount = 0;
                }
            }
            b = (Buffer *)((char *)b + object_size);
        }
    }
}

/* find other users of COW's bufstart */
void
used_cow(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool,
        int cleanup)
{
    UINTVAL object_size = pool->object_size;
    struct Small_Object_Arena *cur_arena;
    UINTVAL i;
    Buffer *b;
    int *refcount;

    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        b = cur_arena->start_objects;
        for (i = 0; i < cur_arena->used; i++) {
            if (!PObj_on_free_list_TEST(b) &&
                    PObj_is_string_TEST(b) &&
                    b->bufstart &&
                    !PObj_external_TEST(b)) {
                refcount = ((int *)b->bufstart);
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

/* Put any buffers/PMCs that are now unused, on to the pools free list.
 * If GC_IS_MALLOC bufstart gets freed too if possible.
 * Avoid buffers that are immune from collection (ie, constant) */
void
free_unused_pobjects(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *cur_arena;
    UINTVAL i, total_used = 0;
    UINTVAL object_size = pool->object_size;
    UINTVAL wash_size = object_size - sizeof(Buffer);

    /* Run through all the buffer header pools and mark */
    for (cur_arena = pool->last_Arena;
            NULL != cur_arena; cur_arena = cur_arena->prev) {
        Buffer *b = cur_arena->start_objects;

        for (i = 0; i < cur_arena->used; i++) {
            /* If it's not live or on the free list, put it on the free list.
             * Note that it is technically possible to have a Buffer be both
             * on_free_list and live, because of our conservative stack-walk
             * collection. We must be wary of this case. */
            if (!PObj_is_live_or_free_TESTALL(b)) {
#if GC_VERBOSE
                if (GC_DEBUG(interpreter) && PObj_report_TEST(b))
                    fprintf(stderr, "Freeing pobject %p -> %p\n",
                            b, b->bufstart);
#endif
                /* if object is a PMC and needs destroying */
                if (PObj_is_PMC_TEST(b)) {
                    /* then destroy it here, add_free_pmc is called from
                     * more_objects too
                     */
                    if (PObj_active_destroy_TEST(b))
                        ((PMC *)b)->vtable->destroy(interpreter, (PMC *)b);
                }
                else {
                    /* else object is a buffer(like) */
#ifdef GC_IS_MALLOC
                    /* free allocated space at bufstart,
                     * but not if it is used COW or external
                     */
                    if (b->bufstart && !PObj_is_external_or_free_TESTALL(b)) {
                        if (PObj_is_string_TEST(b)) {
                            int *refcount = ((int *)b->bufstart);

                            if (!--(*refcount))
                                free(refcount); /* the actual bufstart */
                        }
                        else
                            free(b->bufstart);
                    }
#else
                    if (!PObj_COW_TEST(b)) {
                        ((struct Memory_Pool *)
                         pool->mem_pool)->guaranteed_reclaimable += b->buflen;
                    }
                    ((struct Memory_Pool *)
                     pool->mem_pool)->possibly_reclaimable += b->buflen;
#endif
                    /*
                     * clean memory for buffer_likes
                     * this is the slow thing in the whole sub, so PMCs
                     * have their own add_free function, which clears
                     * PMC specific data members
                     */
                    memset(b + 1, 0, wash_size);
                }
                pool->add_free_object(interpreter, pool, b);
            }
            else if (!PObj_on_free_list_TEST(b)) {
                /* should be live then */
                total_used++;
                PObj_live_CLEAR(b);
            }
            b = (Buffer *)((char *)b + object_size);
        }
    }
    pool->num_free_objects = pool->total_objects - total_used;
}

#ifndef PLATFORM_STACK_WALK

/* Find a mask covering the longest common bit-prefix of val1 and val2 */
static size_t
find_common_mask(size_t val1, size_t val2)
{
    int i;
    int bound = sizeof(size_t) * 8;

    for (i = 0; i < bound; i++) {
        if (val1 == val2) {
            return ~(size_t)0 << i;
        }
        val1 >>= 1;
        val2 >>= 1;
    }

    internal_exception(INTERP_ERROR,
            "Unexpected condition in find_common_mask()!\n");
    return 0;
}

void
trace_mem_block(struct Parrot_Interp *interpreter,
                size_t lo_var_ptr, size_t hi_var_ptr)
{
    size_t prefix, tmp_ptr;
    ptrdiff_t cur_var_ptr;

    size_t buffer_min = get_min_buffer_address(interpreter);
    size_t buffer_max = get_max_buffer_address(interpreter);
    size_t pmc_min = get_min_pmc_address(interpreter);
    size_t pmc_max = get_max_pmc_address(interpreter);

    size_t mask = find_common_mask(buffer_min < pmc_min ? buffer_min : pmc_min,
            buffer_max > pmc_max ? buffer_max : pmc_max);

    if (!lo_var_ptr || !hi_var_ptr)
        return;
    if (lo_var_ptr < hi_var_ptr) {
        tmp_ptr = hi_var_ptr;
        hi_var_ptr = lo_var_ptr;
        lo_var_ptr = tmp_ptr;
    }
    /* Get the expected prefix */
    prefix = mask & buffer_min;


    for (cur_var_ptr = hi_var_ptr;
            (ptrdiff_t)cur_var_ptr < (ptrdiff_t)lo_var_ptr;
            cur_var_ptr = (size_t)((ptrdiff_t)cur_var_ptr + sizeof(void *))
            ) {
        size_t ptr = *(size_t *)cur_var_ptr;

        /* Do a quick approximate range check by bit-masking */
        if ((ptr & mask) == prefix) {
            /* Note that what we find via the stack or registers are not
             * guaranteed to be live pmcs/buffers, and could very well their
             * bufstart/vtable destroyed due to the linked list of free
             * headers... */
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


/* See if we can find some unused headers */
void
Parrot_do_dod_run(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Pool *header_pool;
    int j;
    /* XXX these should go into the interpreter */
    static int skip = 0;
    static int last_total_free = 0;
    int total_free = 0;

    if (interpreter->DOD_block_level) {
        return;
    }
    if (skip) {
        skip = 0;
        return;
    }
    Parrot_block_DOD(interpreter);

    /* Now go trace the PMCs */
    trace_active_PMCs(interpreter);

    /* And the buffers */
    trace_active_buffers(interpreter);
#if !TRACE_SYSTEM_AREAS
# if GC_VERBOSE
    /* whe, we don't trace stack and registers, we check after
     * marking everything, if something was missed
     * not - these could also be stale objects
     */
#  if ! DISABLE_GC_DEBUG
    CONSERVATIVE_POINTER_CHASING = 1;
#  endif
    trace_system_areas(interpreter);
#  if ! DISABLE_GC_DEBUG
    CONSERVATIVE_POINTER_CHASING = 0;
#  endif
# endif
#endif

    /* Now put unused PMCs on the free list */
    header_pool = interpreter->arena_base->pmc_pool;
    free_unused_pobjects(interpreter, header_pool);
    total_free += header_pool->num_free_objects;

    /* And unused buffers on the free list */
    for (j = 0; j < (INTVAL)interpreter->arena_base->num_sized; j++) {
        header_pool = interpreter->arena_base->sized_header_pools[j];
        if (header_pool) {
#ifdef GC_IS_MALLOC
            used_cow(interpreter, header_pool, 0);
#endif
            free_unused_pobjects(interpreter, header_pool);
            total_free += header_pool->num_free_objects;
#ifdef GC_IS_MALLOC
            clear_cow(interpreter, header_pool, 0);
#endif
        }
    }
    /* Note it */
    interpreter->dod_runs++;
    /* if we don't have more free objects then last, skip next DOD run */
    if (total_free < last_total_free)
        skip = 1;
    last_total_free = total_free;
    Parrot_unblock_DOD(interpreter);
    return;
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
