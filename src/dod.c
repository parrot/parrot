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

static size_t find_common_mask(size_t val1, size_t val2);

PMC *
mark_used(PMC *used_pmc, PMC *current_end_of_list)
{
    /* If the PMC we've been handed has already been marked as live
     * (ie we put it on the list already) we just return. Otherwise we
     * could get in some nasty loops */
    if (used_pmc->next_for_GC) {
        return current_end_of_list;
    }

    /* First, mark the PMC itself as used */
    used_pmc->flags |= PMC_live_FLAG;

    /* Now put it on the end of the list */
    current_end_of_list->next_for_GC = used_pmc;

    /* Explicitly make the tail of the linked list be self-referential */
    used_pmc->next_for_GC = used_pmc;

    /* return the PMC we were passed as the new end of the list */
    return used_pmc;
}

/* Tag a buffer header as alive. Used by the GC system when tracing
 * the root set, and used by the PMC GC handling routines to tag their
 * individual pieces if they have private ones */

/* Do a full trace run and mark all the PMCs as active if they are */
static void
trace_active_PMCs(struct Parrot_Interp *interpreter)
{
    PMC *last, *current, *prev; /* Pointers to the last marked PMC, the
                                 * currently being processed PMC, and in
                                 * the previously processed PMC in a loop. */
    unsigned int i, j;
    Stack_Chunk_t *cur_stack;
    struct PRegChunk *cur_chunk;
    Stack_Entry_t *entry;
    struct Stash *stash;

    /* We have to start somewhere, and the global stash is a good
     * place */
    last = current = interpreter->perl_stash->stash_hash;

    /* mark it as used and get an updated end of list */
    last = mark_used(current, last);

    /* Find important stuff on the system stack */
    last = trace_system_stack(interpreter,last);

    /* Now, go run through the PMC registers and mark them as live */
    /* First mark the current set. */
    for (i = 0; i < NUM_REGISTERS; i++) {
        if (interpreter->ctx.pmc_reg.registers[i]) {
            last = mark_used(interpreter->ctx.pmc_reg.registers[i], last);
        }               
    }

    /* Walk through the stashes */
    stash = interpreter->perl_stash;
    while (stash) {
        last = mark_used(stash->stash_hash, last);
        stash = stash->parent_stash;
    }

    /* Now walk the pmc stack. Make sure to walk from top down
     * since stack may have segments above top that we shouldn't walk. */
    for (cur_chunk = interpreter->ctx.pmc_reg_top; cur_chunk;
         cur_chunk = cur_chunk->prev) {
        for (j = 0; j < cur_chunk->used; j++) {
            for (i = 0; i < NUM_REGISTERS; i++) {
                if (cur_chunk->PReg[j].registers[i]) {
                    last = mark_used(cur_chunk->PReg[j].registers[i], last);
                }
            }
        }
    }

    /* Walk lexical pad stack */
    cur_stack = interpreter->ctx.pad_stack;
    while (cur_stack) {
        if (cur_stack->buffer) {
            buffer_lives(cur_stack->buffer);
            entry = (Stack_Entry_t *)(cur_stack->buffer->bufstart);
            for (i = 0; i < cur_stack->used; i++) {
                if (STACK_ENTRY_PMC == entry[i].entry_type &&
                    entry[i].entry.pmc_val) {
                    last = mark_used(entry[i].entry.pmc_val, last);
                }
            }
        }
        cur_stack = cur_stack->prev;
    }

    /* Finally the general stack */
    cur_stack = interpreter->ctx.user_stack;

    while (cur_stack) {
        if(cur_stack->buffer){
            buffer_lives(cur_stack->buffer);

            entry = (Stack_Entry_t *)(cur_stack->buffer->bufstart);
            for (i = 0; i < cur_stack->used; i++) {
                if (STACK_ENTRY_PMC == entry[i].entry_type &&
                    entry[i].entry.pmc_val) {
                    last = mark_used(entry[i].entry.pmc_val, last);
                }
            }
        }

        cur_stack = cur_stack->prev;
    }

    cur_stack = interpreter->ctx.control_stack;

    while (cur_stack) {
        if(cur_stack->buffer){
            buffer_lives(cur_stack->buffer);

            entry = (Stack_Entry_t *)(cur_stack->buffer->bufstart);
            for (i = 0; i < cur_stack->used; i++) {
                if (STACK_ENTRY_PMC == entry[i].entry_type &&
                    entry[i].entry.pmc_val) {
                    last = mark_used(entry[i].entry.pmc_val, last);
                }
            }
        }

        cur_stack = cur_stack->prev;
    }

    cur_stack = (Stack_Chunk_t *)interpreter->ctx.intstack;

    while (cur_stack) {
        if(cur_stack->buffer){
            buffer_lives(cur_stack->buffer);
        }

        cur_stack = cur_stack->prev;
    }

    /* Okay, we've marked the whole root set, and should have a
     * good-sized list 'o things to look at. Run through it */
    prev = NULL;
    for (; current != prev; current = current->next_for_GC) {
        UINTVAL mask = PMC_is_PMC_ptr_FLAG | PMC_is_buffer_ptr_FLAG 
                     | PMC_custom_mark_FLAG;
        UINTVAL bits = current->flags & mask;

        /* Start by checking if there's anything at all. This assumes
         * that the largest percentage of PMCs won't have anything in
         * their data pointer that we need to trace */
        if (bits) {
            if (bits == PMC_is_PMC_ptr_FLAG) {
                if (current->data) {
                    last = mark_used(current->data, last);
                }
            }
            else if (bits == PMC_is_buffer_ptr_FLAG) {
                if (current->data) {
                    buffer_lives(current->data);
                }
            }
            else if (bits == (PMC_is_buffer_ptr_FLAG | PMC_is_PMC_ptr_FLAG)) {
                /* buffer of PMCs */
                Buffer *trace_buf = current->data;
                if (trace_buf) {
                    PMC **cur_pmc = trace_buf->bufstart;
                    /* Mark the damn buffer as used! */
                    buffer_lives(trace_buf);
                    for (i = 0; i < trace_buf->buflen / sizeof(*cur_pmc); i++) {
                        if (cur_pmc[i]) {
                            last = mark_used(cur_pmc[i], last);
                        }
                    }
                }
            }
            else {
                /* All that's left is the custom */
                last = current->vtable->mark(interpreter, current, last);
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

    /* First mark the current set. We assume that all pointers in S
     * registers are pointing to valid buffers. This is not a good
     * assumption, but it'll do for now */
    for (i = 0; i < NUM_REGISTERS; i++) {
        if (interpreter->ctx.string_reg.registers[i]) {
            buffer_lives((Buffer *)interpreter->ctx.string_reg.registers[i]);
        }
    }

    /* Now walk the string stack. Make sure to walk from top down
     * since stack may have segments above top that we shouldn't walk. */
    for (cur_chunk = interpreter->ctx.string_reg_top;
         cur_chunk; cur_chunk = cur_chunk->prev) {
        for (j = 0; j < cur_chunk->used; j++) {
            for (i = 0; i < NUM_REGISTERS; i++) {
                if (cur_chunk->SReg[j].registers[i]) {
                    buffer_lives((Buffer *)cur_chunk->SReg[j].registers[i]);
                }
            }
        }
    }

    /* Now the general stack */
    cur_stack = interpreter->ctx.user_stack;
    /* The general stack's circular, so we need to be careful */
    while (cur_stack) {
        if(cur_stack->buffer){ 
            buffer_lives(cur_stack->buffer);
            entry = (Stack_Entry_t *)(cur_stack->buffer->bufstart);
            for (i = 0; i < cur_stack->used; i++) {
                if (STACK_ENTRY_STRING == entry[i].entry_type &&
                    entry[i].entry.string_val) {
                    buffer_lives((Buffer *)entry[i].entry.string_val);
                }
            }
        }

        cur_stack = cur_stack->prev;
    }

    /* Finally the control stack frames must be marked live */
    cur_stack = interpreter->ctx.control_stack;
    while (cur_stack) {
        if(cur_stack->buffer){ 
            buffer_lives(cur_stack->buffer);
        }

        cur_stack = cur_stack->prev;
    }
}

/* Free up any PMCs that aren't in use */
static void
free_unused_PMCs(struct Parrot_Interp *interpreter)
{
    struct Small_Object_Arena *cur_arena;
    UINTVAL i, total_used = 0;
    
    /* Run through all the buffer header pools and mark */
    for (cur_arena = interpreter->arena_base->pmc_pool->last_Arena;
         NULL != cur_arena;
         cur_arena = cur_arena->prev) {
        PMC *pmc_array = cur_arena->start_objects;
        for (i = 0; i < cur_arena->used; i++) {
            /* If it's not live or on the free list, put it on the free list */
            if (!(pmc_array[i].flags & (PMC_live_FLAG | PMC_on_free_list_FLAG |
                                       PMC_constant_FLAG))) {
                add_free_pmc(interpreter,
                                interpreter->arena_base->pmc_pool,
                                &pmc_array[i]);
            } else if(!(pmc_array[i].flags & PMC_on_free_list_FLAG)) {
                total_used++;
                pmc_array[i].flags &= ~PMC_live_FLAG;
                pmc_array[i].next_for_GC = NULL;
            }
        }
    }
    interpreter->active_PMCs += total_used;
    interpreter->arena_base->pmc_pool->num_free_objects = 
        interpreter->arena_base->pmc_pool->total_objects - total_used;
}

/* Put any buffers that are now unused, on to the free list
 * Avoid buffers that are immune from collection (ie, constant) */
static void
free_unused_buffers(struct Parrot_Interp *interpreter, 
                    struct Small_Object_Pool *pool)
{
    struct Small_Object_Arena *cur_arena;
    UINTVAL i, total_used = 0;
    UINTVAL object_size = pool->object_size;

    /* Run through all the buffer header pools and mark */
    for (cur_arena = pool->last_Arena;
         NULL != cur_arena;
         cur_arena = cur_arena->prev) {
        Buffer *b = cur_arena->start_objects;
        for (i = 0; i < cur_arena->used; i++) {
            /* If this thing is not live and not dead yet, make it dead now. */
            if (!(b->flags & ( BUFFER_on_free_list_FLAG
                             | BUFFER_constant_FLAG
                             | BUFFER_live_FLAG )))
            {
                if (pool->mem_pool) {
                    if (!(b->flags & BUFFER_COW_FLAG)) {
                        ((struct Memory_Pool *)pool->mem_pool)->guaranteed_reclaimable += b->buflen;
                    }
                    ((struct Memory_Pool *)pool->mem_pool)->possibly_reclaimable += b->buflen;
                }
                add_free_buffer(interpreter, pool, b);
            } else if (!(b->flags & BUFFER_on_free_list_FLAG)) {
                total_used++;
            }
            b->flags &= ~BUFFER_live_FLAG;
            b = (Buffer *)((char *)b + object_size);
        }
    }
    interpreter->active_Buffers += total_used;
    pool->num_free_objects = pool->total_objects - total_used;
}

#ifndef PLATFORM_STACK_WALK

/* Find a mask covering the longest common bit-prefix of val1 and val2 */
static size_t
find_common_mask(size_t val1, size_t val2){
    int i;
    int bound = sizeof(size_t) * 8;

    for(i = 0; i < bound; i++){
        if(val1 == val2){
                return ~(size_t)0 << i;
        }
        val1 >>= 1;
        val2 >>= 1;
    }

    internal_exception(INTERP_ERROR,
                       "Unexpected condition in find_common_prefix()!\n");
    return 0;
}

PMC*
trace_system_stack(struct Parrot_Interp *interpreter, PMC *last)
{
    size_t lo_var_ptr = (size_t)interpreter->lo_var_ptr;
    size_t hi_var_ptr = (size_t)&lo_var_ptr;
    size_t prefix;
    ptrdiff_t cur_var_ptr;

    size_t buffer_min = get_min_buffer_address(interpreter);
    size_t buffer_max = get_max_buffer_address(interpreter);
    size_t pmc_min = get_min_pmc_address(interpreter);
    size_t pmc_max = get_max_pmc_address(interpreter);

    size_t mask = find_common_mask(buffer_min < pmc_min ? buffer_min: pmc_min,
                buffer_max > pmc_max ? buffer_max : pmc_max);

    /* Get the expected prefix */
    prefix = mask & buffer_min;

    if (!lo_var_ptr)
        return last;
    
    for (cur_var_ptr = lo_var_ptr;
         (ptrdiff_t)(cur_var_ptr * PARROT_STACK_DIR) < (ptrdiff_t)(hi_var_ptr * PARROT_STACK_DIR);
         cur_var_ptr = (size_t)( (ptrdiff_t)cur_var_ptr + PARROT_STACK_DIR * PARROT_PTR_ALIGNMENT )
         ) {
        size_t ptr = *(size_t *)cur_var_ptr;

        /* Do a quick approximate range check by bit-masking */
        if((ptr & mask) == prefix){
            if (pmc_min <= ptr && ptr < pmc_max && is_pmc_ptr(interpreter,(void *)ptr)) {
                last = mark_used((PMC *)ptr, last);
            } else if (buffer_min <= ptr && ptr < buffer_max && is_buffer_ptr(interpreter,(void *)ptr)) {
                buffer_lives((Buffer *)ptr);
            }
        }
    }
    return last;
}
#endif


/* See if we can find some unused headers */
void
Parrot_do_dod_run(struct Parrot_Interp *interpreter)
{
    if (interpreter->DOD_block_level) {
        return;
    }
    interpreter->DOD_block_level++;
    
    interpreter->active_PMCs = 0; 
    interpreter->active_Buffers = 0;

    /* Now go trace the PMCs */
    trace_active_PMCs(interpreter);

    /* And the buffers */
    trace_active_buffers(interpreter);

    /* Now put unused PMCs on the free list */
    free_unused_PMCs(interpreter);

    /* And unused buffers on the free list */
    free_unused_buffers(interpreter,
                        interpreter->arena_base->string_header_pool);
    free_unused_buffers(interpreter,
                        interpreter->arena_base->buffer_header_pool);

    /* Note it */
    interpreter->dod_runs++;

    interpreter->DOD_block_level--;
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
