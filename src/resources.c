/* pmc.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Allocate and deallocate tracked resources
 *  Data Structure and Algorithms:
 *     
 *  History:
 *     Initial version by Dan on 2001.10.2
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static void add_header_to_free(struct Parrot_Interp *interpreter,
                               struct free_pool *pool, void *to_add);

/* Add a string header to the free string header pool */
static void add_pmc_to_free(struct Parrot_Interp *interpreter,
                            struct free_pool *pool, void
                            *to_add) {
  PMC **temp_ptr;
  /* First, check and see if there's enough space in the free pool. If
   we're within the size of a STRING pointer, we make it bigger */
  if (pool->entries_in_pool * sizeof(PMC *) >=
      pool->pool_buffer.buflen - sizeof(PMC *)) {
    /* If not, make the free pool bigger. We enlarge it by 20% */
    Parrot_reallocate(interpreter,
                      &pool->pool_buffer,
                      (UINTVAL)(pool->pool_buffer.buflen * 1.2));

  }
#ifdef GC_DEBUG
    Parrot_go_collect(interpreter);
#endif

  /* Okay, so there's space. Add the header on */
  ((PMC *)to_add)->flags = PMC_on_free_list_FLAG;
  temp_ptr = pool->pool_buffer.bufstart;
  temp_ptr += pool->entries_in_pool;
  *temp_ptr = to_add;
  pool->entries_in_pool++;
  
  /* Note the numbers */
  interpreter->active_PMCs--;
}


/* Just go and get more headers unconditionally */
void
Parrot_new_pmc_header_arena(struct Parrot_Interp *interpreter) {
  struct PMC_Arena *new_arena;
  PMC *cur_pmc;
  int i;

  new_arena = mem_sys_allocate(sizeof(struct PMC_Arena));
  new_arena->GC_data = mem_sys_allocate(sizeof(PMC *) * PMC_HEADERS_PER_ALLOC);
  memset(new_arena->GC_data, 0, sizeof(PMC *) * PMC_HEADERS_PER_ALLOC);
  new_arena->start_PMC = mem_sys_allocate(sizeof(PMC) * PMC_HEADERS_PER_ALLOC);
  memset(new_arena->start_PMC, 0, sizeof(PMC) * PMC_HEADERS_PER_ALLOC);
  new_arena->free = 0;
  new_arena->used = PMC_HEADERS_PER_ALLOC; /* Need to rethink the whole arena free/used
                             thing, as the headers go into a single
                             allocation pool */
  new_arena->next = NULL;
  new_arena->prev = interpreter->arena_base->last_PMC_Arena;
  /* Is there a previous arena */
  if (new_arena->prev) {
    new_arena->prev->next = new_arena;
  }

  interpreter->arena_base->last_PMC_Arena = new_arena;

  /* Note it in our stats */
  interpreter->total_PMCs += PMC_HEADERS_PER_ALLOC;
  /* Yeah, this is skanky. They're not really active, but
     add_pmc_to_free assumes that it's adding an active header to
     the free list */
  interpreter->active_PMCs += PMC_HEADERS_PER_ALLOC;

  cur_pmc = new_arena->start_PMC;
  for (i = 0; i < PMC_HEADERS_PER_ALLOC; i++) {
    add_pmc_to_free(interpreter,
                    interpreter->arena_base->pmc_pool,
                    cur_pmc++);
  }
}

/* We have no more headers on the free header pool. Go allocate more
   and put them on */
static void alloc_more_pmc_headers(struct Parrot_Interp *interpreter) {

  /* First, try and find some unused headers */
  Parrot_do_dod_run(interpreter);

  /* If we found some, then bail as we don't need to do anything */
  if (interpreter->arena_base->pmc_pool->entries_in_pool) {
    return;
  }

  /* We didn't find any, so go get more */
  Parrot_new_pmc_header_arena(interpreter);
}

PMC *new_pmc_header(struct Parrot_Interp *interpreter) {
  PMC *return_me;

  /* We return system memory if we've got no interpreter yet */
  if (NULL == interpreter) {
    return_me = mem_sys_allocate(sizeof(PMC));
    return_me->flags = PMC_live_FLAG;
    return_me->vtable = NULL;
    return_me->data = NULL;
    return return_me;
  }

  if (!interpreter->arena_base->pmc_pool->entries_in_pool) {
    alloc_more_pmc_headers(interpreter);
  }
#ifdef GC_DEBUG
  else {
    Parrot_do_dod_run(interpreter);
  }
#endif

    {
    /* A stupid temp variable. Our pointer into the pool */
    PMC **foo;
    /* Set the pointer to the beginning of the pool */
    foo =
      interpreter->arena_base->pmc_pool->pool_buffer.bufstart;
    /* Decrement the count of entries in the pool */
    interpreter->arena_base->pmc_pool->entries_in_pool--;
    /* Add the count of entries in the pool to the base
       pointer. Conveniently this is both the offset into a zero-based
       array and the count for the next time */
    foo +=
      interpreter->arena_base->pmc_pool->entries_in_pool;
    /* Dereference the buffer pointer to get the real string pointer */
    return_me = *foo;
    /* Count that we've allocated it */
    interpreter->active_PMCs++;
    /* Mark it live */
    return_me->flags = PMC_live_FLAG;
    /* Don't let it point to garbage memory */
    return_me->data = NULL;
    /* Return it */
    return return_me;
  }
}

void free_pmc(PMC *pmc) {
  if (pmc) {
    memset(pmc, 0, sizeof(PMC));
  }
}

Buffer *new_tracked_header(struct Parrot_Interp *interpreter, size_t size) {
  UNUSED (interpreter);
  return (Buffer *)mem_sys_allocate(size);
}


/* We have no more headers on the free header pool. Go allocate more
   and put them on */
static void
alloc_more_buffer_headers(struct Parrot_Interp *interpreter) {
  struct Buffer_Arena *new_arena;
  Buffer *cur_buffer;
  int i;

  /* First, try and find some unused headers */
  Parrot_do_dod_run(interpreter);

  /* If we found some, then bail as we don't need to do anything */
  if (interpreter->arena_base->buffer_header_pool->entries_in_pool) {
    return;
  }
  
  new_arena = mem_sys_allocate(sizeof(struct Buffer_Arena));
  new_arena->start_Buffer = mem_sys_allocate(sizeof(Buffer) * BUFFER_HEADERS_PER_ALLOC);
  memset(new_arena->start_Buffer, 0, sizeof(Buffer) * BUFFER_HEADERS_PER_ALLOC);
  new_arena->free = 0;
  new_arena->used = BUFFER_HEADERS_PER_ALLOC; /* Need to rethink the whole arena free/used
                             thing, as the headers go into a single
                             allocation pool */
  new_arena->next = NULL;
  new_arena->prev = interpreter->arena_base->last_Buffer_Arena;
  /* Is there a previous arena */
  if (new_arena->prev) {
    new_arena->prev->next = new_arena;
  }

  interpreter->arena_base->last_Buffer_Arena = new_arena;

  /* Note it in our stats */
  interpreter->total_Buffers += BUFFER_HEADERS_PER_ALLOC;
  /* Yeah, this is skanky. They're not really active, but
     add_header_to_free assumes that it's adding an active header to
     the free list */
  interpreter->active_Buffers += BUFFER_HEADERS_PER_ALLOC;

  cur_buffer = new_arena->start_Buffer;
  for (i = 0; i < BUFFER_HEADERS_PER_ALLOC; i++) {
    add_header_to_free(interpreter,
                       interpreter->arena_base->buffer_header_pool,
                       cur_buffer++);
  }
}

/* Get a buffer out of our free pool */
Buffer *
new_buffer_header(struct Parrot_Interp *interpreter) {
  Buffer *return_me;

  /* Icky special case. Grab system memory if there's no interpreter
     yet */
  if (interpreter == NULL) {
    return_me = mem_sys_allocate(sizeof(Buffer));
    return_me->flags = BUFFER_live_FLAG;
    return return_me;
  }

  if (!interpreter->arena_base->buffer_header_pool->entries_in_pool) {
    alloc_more_buffer_headers(interpreter);
  }
#ifdef GC_DEBUG
  else {
    Parrot_do_dod_run(interpreter);
  }
#endif

  /* Okay, we do this the long, drawn-out, hard way. Otherwise I get
     really confused and things crash. This, generally, is a Bad
     Thing. */
  {
    /* A stupid temp variable. Our pointer into the pool */
    Buffer **foo;
    /* Set the pointer to the beginning of the pool */
    foo =
      interpreter->arena_base->buffer_header_pool->pool_buffer.bufstart;
    /* Decrement the count of entries in the pool */
    interpreter->arena_base->buffer_header_pool->entries_in_pool--;
    /* Add the count of entries in the pool to the base
       pointer. Conveniently this is both the offset into a zero-based
       array and the count for the next time */
    foo +=
      interpreter->arena_base->buffer_header_pool->entries_in_pool;
    /* Dereference the buffer pointer to get the real string pointer */
    return_me = *foo;
    /* Count that we've allocated it */
    interpreter->active_Buffers++;
    /* Mark it live */
    return_me->flags = BUFFER_live_FLAG;
    /* Don't let it point to garbage memory */
    return_me->bufstart = NULL;
    /* Return it */
    return return_me;
  }
}

void free_buffer(Buffer *thing) {
  if (thing) {
    if (thing->bufstart && (thing->flags & BUFFER_sysmem_FLAG)) {
      mem_sys_free(thing->bufstart);
    }
    thing->bufstart = NULL;
    thing->buflen = 0;
    thing->flags = 0;
  }

}

/* Add a buffer header to a free buffer header pool */
static void add_header_to_free(struct Parrot_Interp *interpreter,
                               struct free_pool *pool, void
                               *to_add) {
  Buffer **temp_ptr;
  /* First, check and see if there's enough space in the free pool. If
   we're within the size of a STRING pointer, we make it bigger */
  if (pool->entries_in_pool * sizeof(STRING *) >=
      pool->pool_buffer.buflen - sizeof(STRING *)) {
    /* If not, make the free pool bigger. We enlarge it by 20% */
    Parrot_reallocate(interpreter,
                      &pool->pool_buffer,
                      (UINTVAL)(pool->pool_buffer.buflen * 1.2));

  }
#ifdef GC_DEBUG
  Parrot_go_collect(interpreter);
#endif

  /* Okay, so there's space. Add the header on */
  ((Buffer *)to_add)->flags = BUFFER_on_free_list_FLAG;
  temp_ptr = pool->pool_buffer.bufstart;
  temp_ptr += pool->entries_in_pool;
  *temp_ptr = to_add;
  pool->entries_in_pool++;
  
  /* Note the numbers */
  interpreter->active_Buffers--;
}

/* Mark all the PMCs as not in use.

*/
static void
mark_PMCs_unused(struct Parrot_Interp *interpreter) {
  struct PMC_Arena *cur_arena;
  UINTVAL i;

  /* Run through all the buffer header pools and mark */
  for (cur_arena = interpreter->arena_base->last_PMC_Arena;
       NULL != cur_arena;
       cur_arena = cur_arena->prev) {
    PMC *pmc_array = cur_arena->start_PMC;
    for (i = 0; i < cur_arena->used; i++) {
      /* Tentatively unused, unless it's a constant */
      if (!(pmc_array[i].flags & PMC_constant_FLAG)) {
        pmc_array[i].flags &= ~PMC_live_FLAG;
      }
      /* But the GC pointer's NULLed anyway */
      pmc_array[i].next_for_GC = NULL;
    }
  }
}

/* Mark all the buffers as unused */
static void
mark_buffers_unused(struct Parrot_Interp *interpreter) {
  struct STRING_Arena *cur_string_arena;
  struct Buffer_Arena *cur_buffer_arena;
  UINTVAL i;

  /* Run through all the buffer header pools and mark */
  for (cur_string_arena = interpreter->arena_base->last_STRING_Arena;
       NULL != cur_string_arena;
       cur_string_arena = cur_string_arena->prev) {
    STRING *string_array = cur_string_arena->start_STRING;
    for (i = 0; i < cur_string_arena->used; i++) {
      /* Tentatively unused, unless it's a constant */
      if (!(string_array[i].flags & BUFFER_constant_FLAG)) {
        string_array[i].flags &= ~BUFFER_live_FLAG;
      }
    }
  }

  for (cur_buffer_arena = interpreter->arena_base->last_Buffer_Arena;
       NULL != cur_buffer_arena;
       cur_buffer_arena = cur_buffer_arena->prev) {
    Buffer *buffer_array = cur_buffer_arena->start_Buffer;
    for (i = 0; i < cur_buffer_arena->used; i++) {
      /* Tentatively unused, unless it's a constant */
      if (!(buffer_array[i].flags & BUFFER_constant_FLAG)) {
        buffer_array[i].flags &= ~BUFFER_live_FLAG;
      }
    }
  }
}

static PMC *
mark_used(PMC *used_pmc, PMC *current_end_of_list) {


    /* If the PMC we've been handed has already been marked as live
       (ie we put it on the list already) we just return. Otherwise we
       could get in some nasty loops */
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

/* Do a full trace run and mark all the PMCs as active if they are */
static void
trace_active_PMCs(struct Parrot_Interp *interpreter) {
    PMC *last, *current, *prev; /* Pointers to the last marked PMC, the
                                   currently being processed PMC, and in
                                   the previously processed PMC in a loop. */
    unsigned int i, j, chunks_traced;
    Stack_chunk *cur_stack, *start_stack;
    struct PRegChunk *cur_chunk;

    /* We have to start somewhere, and the global stash is a good
       place */
    last = current = interpreter->perl_stash->stash_hash;

    /* mark it as used and get an updated end of list */
    last = mark_used(current, last);

    /* Now, go run through the PMC registers and mark them as live */
    /* First mark the current set. */
    for (i=0; i < NUM_REGISTERS; i++) {
        if (interpreter->pmc_reg.registers[i]) {
            last = mark_used(interpreter->pmc_reg.registers[i], last);
        }
    }

    /* Now walk the pmc stack. Make sure to walk from top down
     * since stack may have segments above top that we shouldn't walk. */
    for (cur_chunk = interpreter->pmc_reg_top; cur_chunk;
         cur_chunk = cur_chunk->prev) {
        for (j = 0; j < cur_chunk->used; j++) {
            for (i=0; i < NUM_REGISTERS; i++) {
                if(cur_chunk->PReg[j].registers[i]) {
                    last =mark_used(cur_chunk->PReg[j].registers[i], last);
                }
            }
        }
    }
    
    /* Finally the general stack */
    start_stack = cur_stack = interpreter->user_stack;
    chunks_traced = 0;
    /* The general stack's circular, so we need to be careful */
    while(cur_stack && ((start_stack != cur_stack) || (chunks_traced == 0))) {
        for (i = 0; i < cur_stack->used; i++) {
            if (STACK_ENTRY_PMC == cur_stack->entry[i].entry_type) {
                last = mark_used(cur_stack->entry[i].entry.pmc_val, last);
            }
        }
        
        chunks_traced++;
        cur_stack = cur_stack->prev;
    }


    /* Okay, we've marked the whole root set, and should have a
       good-sized list 'o things to look at. Run through it */
    prev = NULL;
    for (; current != prev; current = current->next_for_GC) {
        UINTVAL mask = PMC_is_PMC_ptr_FLAG | PMC_is_buffer_ptr_FLAG | PMC_custom_mark_FLAG;
        UINTVAL bits = current->flags & mask;

        /* Start by checking if there's anything at all. This assumes
           that the largest percentage of PMCs won't have anything in
           their data pointer that we need to trace */
        if (bits) {
            if (bits == PMC_is_PMC_ptr_FLAG) {
                last = mark_used(current->data, last);
            }
            else {
                if (bits == PMC_is_buffer_ptr_FLAG) {
                    if (current->data) {
                        buffer_lives(current->data);
                    }
                }
                else {
                    if (bits == (PMC_is_buffer_ptr_FLAG &
                        PMC_is_PMC_ptr_FLAG)) {
                        /* buffer of PMCs */
                        Buffer *trace_buf = current->data;
                        PMC **cur_pmc = trace_buf->bufstart;
                        /* Mark the damn buffer as used! */
                        trace_buf->flags |= BUFFER_live_FLAG;
                        for (i = 0; i < trace_buf->buflen; i++) {
                            if (cur_pmc[i]) {
                                last = mark_used(cur_pmc[i], last);
                            }
                        }
                    }
                    else {
                        /* All that's left is the custom */
                        last = current->vtable->mark(interpreter,
                                                     current, last);
                    }
                }
            }
        }
        prev = current;
    }
}

/* Scan any buffers in S registers and other non-PMC places and mark
   them as active */
static void
trace_active_buffers(struct Parrot_Interp *interpreter) {
  UINTVAL i, j, chunks_traced;
  Stack_chunk *cur_stack, *start_stack;
  struct SRegChunk *cur_chunk;

  /* First mark the current set. We assume that all pointers in S
     registers are pointing to valid buffers. This is not a good
     assumption, but it'll do for now */
  for (i=0; i < NUM_REGISTERS; i++) {
    if (interpreter->string_reg.registers[i]) {
      buffer_lives((Buffer *)interpreter->string_reg.registers[i]);
    }
  }

  /* Now walk the string stack. Make sure to walk from top down
   * since stack may have segments above top that we shouldn't walk. */
  for (cur_chunk = interpreter->string_reg_top; cur_chunk;
       cur_chunk = cur_chunk->prev) {
    for (j = 0; j < cur_chunk->used; j++) {
      for (i=0; i < NUM_REGISTERS; i++) {
        if(cur_chunk->SReg[j].registers[i]) {
          buffer_lives((Buffer *)cur_chunk->SReg[j].registers[i]);
        }
      }
    }
  }

  /* Finally the general stack */
  start_stack = cur_stack = interpreter->user_stack;
  chunks_traced = 0;
  /* The general stack's circular, so we need to be careful */
  while(cur_stack && ((start_stack != cur_stack) || (chunks_traced == 0))) {
    for (i = 0; i < cur_stack->used; i++) {
      if (STACK_ENTRY_STRING == cur_stack->entry[i].entry_type) {
        buffer_lives((Buffer *)cur_stack->entry[i].entry.string_val);
      }
    }

    chunks_traced++;
    cur_stack = cur_stack->prev;
  }
}

/* Free up any PMCs that aren't in use

*/
static void
free_unused_PMCs(struct Parrot_Interp *interpreter) {

  struct PMC_Arena *cur_arena;
  UINTVAL i;

  /* Run through all the buffer header pools and mark */
  for (cur_arena = interpreter->arena_base->last_PMC_Arena;
       NULL != cur_arena;
       cur_arena = cur_arena->prev) {
    PMC *pmc_array = cur_arena->start_PMC;
    for (i = 0; i < cur_arena->used; i++) {
      /* If it's not live or on the free list, put it on the free list */
      if (!(pmc_array[i].flags & (PMC_live_FLAG | PMC_immune_FLAG |
                                  PMC_on_free_list_FLAG))) {
        add_pmc_to_free(interpreter,
                        interpreter->arena_base->pmc_pool,
                        &pmc_array[i]);
      }
    }
  }
}

/* Put any free buffers that aren't on the free list on the free list
 */
static void
free_unused_buffers(struct Parrot_Interp *interpreter) {
  struct STRING_Arena *cur_arena;
  UINTVAL i;

  /* Run through all the buffer header pools and mark */
  for (cur_arena = interpreter->arena_base->last_STRING_Arena;
       NULL != cur_arena;
       cur_arena = cur_arena->prev) {
    STRING *string_array = cur_arena->start_STRING;
    for (i = 0; i < cur_arena->used; i++) {
      /* If it's not live or on the free list, put it on the free list */
      if (!(string_array[i].flags & (BUFFER_live_FLAG |
                                     BUFFER_on_free_list_FLAG))) {
        add_header_to_free(interpreter,
                           interpreter->arena_base->string_header_pool,
                           &string_array[i]);
      }
    }
  }

}

/* See if we can find some unused headers */
void
Parrot_do_dod_run(struct Parrot_Interp *interpreter) {

  if (interpreter->DOD_block_level) {
    return;
  }

  /* First go mark all PMCs as unused */
  mark_PMCs_unused(interpreter);  

  /* Then mark the buffers as unused */
  mark_buffers_unused(interpreter);

  /* Now go trace the PMCs */
  trace_active_PMCs(interpreter);

  /* And the buffers */
  trace_active_buffers(interpreter);

  /* Now put unused PMCs on the free list */
  free_unused_PMCs(interpreter);

  /* And unused buffers on the free list */
  free_unused_buffers(interpreter);

  /* Note it */
  interpreter->dod_runs++;

  return;
}

/* We have no more headers on the free header pool. Go allocate more
   and put them on */
static void alloc_more_string_headers(struct Parrot_Interp *interpreter) {
  struct STRING_Arena *new_arena;
  STRING *cur_string;
  int i;

  /* First, try and find some unused headers */
  Parrot_do_dod_run(interpreter);

  /* If we found some, then bail as we don't need to do anything */
  if (interpreter->arena_base->string_header_pool->entries_in_pool) {
    return;
  }
  
  new_arena = mem_sys_allocate(sizeof(struct STRING_Arena));
  new_arena->start_STRING = mem_sys_allocate(sizeof(STRING) * STRING_HEADERS_PER_ALLOC);
  memset(new_arena->start_STRING, 0, sizeof(STRING) * STRING_HEADERS_PER_ALLOC);
  new_arena->free = 0;
  new_arena->used = STRING_HEADERS_PER_ALLOC; /* Need to rethink the whole arena free/used
                             thing, as the headers go into a single
                             allocation pool */
  new_arena->next = NULL;
  new_arena->prev = interpreter->arena_base->last_STRING_Arena;
  /* Is there a previous arena */
  if (new_arena->prev) {
    new_arena->prev->next = new_arena;
  }

  interpreter->arena_base->last_STRING_Arena = new_arena;

  /* Note it in our stats */
  interpreter->total_Buffers += STRING_HEADERS_PER_ALLOC;
  /* Yeah, this is skanky. They're not really active, but
     add_header_to_free assumes that it's adding an active header to
     the free list */
  interpreter->active_Buffers += STRING_HEADERS_PER_ALLOC;

  cur_string = new_arena->start_STRING;
  for (i = 0; i < STRING_HEADERS_PER_ALLOC; i++) {
    add_header_to_free(interpreter,
                       interpreter->arena_base->string_header_pool,
                       cur_string++);
  }
}

/* Fetch a string header from the free header pool */
STRING *new_string_header(struct Parrot_Interp *interpreter) {
  STRING *return_me;

  /* Icky special case. Grab system memory if there's no interpreter
     yet */
  if (interpreter == NULL) {
    return_me = mem_sys_allocate(sizeof(STRING));
    return_me->flags = BUFFER_live_FLAG;
    return return_me;
  }

  if (!interpreter->arena_base->string_header_pool->entries_in_pool) {
      alloc_more_string_headers(interpreter);
  }
#ifdef GC_DEBUG
  else {
    Parrot_do_dod_run(interpreter);
  }
#endif

  /* Okay, we do this the long, drawn-out, hard way. Otherwise I get
     really confused and things crash. This, generally, is a Bad
     Thing. */
  {
    /* A stupid temp variable. Our pointer into the pool */
    STRING **foo;
    /* Set the pointer to the beginning of the pool */
    foo =
      interpreter->arena_base->string_header_pool->pool_buffer.bufstart;
    /* Decrement the count of entries in the pool */
    interpreter->arena_base->string_header_pool->entries_in_pool--;
    /* Add the count of entries in the pool to the base
       pointer. Conveniently this is both the offset into a zero-based
       array and the count for the next time */
    foo +=
      interpreter->arena_base->string_header_pool->entries_in_pool;
    /* Dereference the buffer pointer to get the real string pointer */
    return_me = *foo;
    /* Count that we've allocated it */
    interpreter->active_Buffers++;
    /* Mark it live */
    return_me->flags = BUFFER_live_FLAG;
    /* Don't let it point to garbage memory */
    return_me->bufstart = NULL;
    /* Return it */
    return return_me;
  }
}

/* Figure out how much memory's been allocated total for buffered
   things */
static UINTVAL
calc_total_size(struct Parrot_Interp *interpreter) {
  UINTVAL size = 0;
  struct Memory_Pool *cur_pool;
  for (cur_pool = interpreter->arena_base->memory_pool;
         NULL != cur_pool; cur_pool = cur_pool->prev) {
    size += cur_pool->size;
  }
  return size;
}

/* Go do a GC run. This only scans the string pools and compacts them,
   it doesn't check for string liveness */
void
Parrot_go_collect(struct Parrot_Interp *interpreter) {
  UINTVAL total_size;
  struct Memory_Pool *new_block;        /* A pointer to our working pool */
  char *cur_spot;               /* Where we're currently copying to */
  UINTVAL cur_size;     /* How big our chunk is going to be */
  struct STRING_Arena *cur_string_arena; /* The string arena we're working on */
  struct Buffer_Arena *cur_buffer_arena;

  /* Bail if we're blocked */
  if (interpreter->GC_block_level) {
      return;
  }

  /* We're collecting */
  interpreter->mem_allocs_since_last_collect = 0;
  interpreter->collect_runs++;

  /* Find out how much memory we've used so far. We're guaranteed to
     use no more than this in our collection run */
  total_size = calc_total_size(interpreter);
  /* Snag a block big enough for everything */
  new_block = Parrot_alloc_new_block(interpreter, total_size, 0);

  /* Start at the beginning */
  cur_spot = new_block->start;

  /* First collect the free string header pool */
  memcpy(cur_spot,
         interpreter->arena_base->string_header_pool->pool_buffer.bufstart, 
         interpreter->arena_base->string_header_pool->pool_buffer.buflen);
  interpreter->arena_base->string_header_pool->pool_buffer.bufstart = cur_spot;
  cur_size = interpreter->arena_base->string_header_pool->pool_buffer.buflen;
  if (cur_size & 0x0f) {
    cur_size &= ~0x0f;
    cur_size += 16;
  }
  cur_spot += cur_size;

  /* Collect the PMC header pool */
  memcpy(cur_spot,
         interpreter->arena_base->pmc_pool->pool_buffer.bufstart, 
         interpreter->arena_base->pmc_pool->pool_buffer.buflen);
  interpreter->arena_base->pmc_pool->pool_buffer.bufstart = cur_spot;
  cur_size = interpreter->arena_base->pmc_pool->pool_buffer.buflen;
  if (cur_size & 0x0f) {
    cur_size &= ~0x0f;
    cur_size += 16;
  }
  cur_spot += cur_size;

  /* And the buffer header pool */
  memcpy(cur_spot,
         interpreter->arena_base->buffer_header_pool->pool_buffer.bufstart, 
         interpreter->arena_base->buffer_header_pool->pool_buffer.buflen);
  interpreter->arena_base->buffer_header_pool->pool_buffer.bufstart = cur_spot;
  cur_size = interpreter->arena_base->buffer_header_pool->pool_buffer.buflen;
  if (cur_size & 0x0f) {
    cur_size &= ~0x0f;
    cur_size += 16;
  }
  cur_spot += cur_size;

  /* Run through all the STRING header pools and copy */
  for (cur_string_arena = interpreter->arena_base->last_STRING_Arena;
       NULL != cur_string_arena;
       cur_string_arena = cur_string_arena->prev) {
    UINTVAL i;
    STRING *string_array = cur_string_arena->start_STRING;

    for (i = 0; i < cur_string_arena->used; i++) {
      /* Is the string live, and can we move it? */
      if (string_array[i].flags & BUFFER_live_FLAG
          && !(string_array[i].flags & BUFFER_immobile_FLAG)
          && string_array[i].bufstart) {
        memcpy(cur_spot, string_array[i].bufstart,
               string_array[i].buflen);
        string_array[i].bufstart = cur_spot;
        cur_size = string_array[i].buflen;
        if (cur_size & 0x0f) {
          cur_size &= ~0x0f;
          cur_size += 16;
        }
        cur_spot += cur_size;
      }
    }
  }

  /* Run through all the Buffer header pools and copy */
  for (cur_buffer_arena = interpreter->arena_base->last_Buffer_Arena;
       NULL != cur_buffer_arena;
       cur_buffer_arena = cur_buffer_arena->prev) {
    UINTVAL i;
    Buffer *buffer_array = cur_buffer_arena->start_Buffer;
    for (i = 0; i < cur_buffer_arena->used; i++) {
      /* Is the string live, and can we move it? */
      if (buffer_array[i].flags & BUFFER_live_FLAG
          && !(buffer_array[i].flags & BUFFER_immobile_FLAG)
          && buffer_array[i].bufstart) {
        memcpy(cur_spot, buffer_array[i].bufstart,
               buffer_array[i].buflen);
        buffer_array[i].bufstart = cur_spot;
        cur_size = buffer_array[i].buflen;
        if (cur_size & 0x0f) {
          cur_size &= ~0x0f;
          cur_size += 16;
        }
        cur_spot += cur_size;
      }
    }
  }

  /* Okay, we're done with the copy. Set the bits in the pool struct */
  /* First, where we allocate next */
  new_block->top = cur_spot;
  /* How much is free. That's the total size minus the amount we used */
  new_block->free = new_block->size - (new_block->top - new_block->start);

  interpreter->memory_collected += (new_block->top - new_block->start);

  /* Now we're done. Put us as the only block on the free list and
     free the rest */
  {
    struct Memory_Pool *cur_pool, *next_pool;
    
    cur_pool = interpreter->arena_base->memory_pool;
    while (cur_pool) {
      next_pool = cur_pool->prev;
      /* Note that we don't have it any more */
      interpreter->memory_allocated -= cur_pool->size;
      /* We know the pool body and pool header are a single chunk, so
         this is enough to get rid of 'em both */
      mem_sys_free(cur_pool);
      cur_pool = next_pool;
    }

    /* Set our new pool as the only pool */
    interpreter->arena_base->memory_pool = new_block;
    new_block->next = NULL;
    new_block->prev = NULL;
  }
}

/* Scan the string pools and find strings that aren't in use. Put the
   unused ones on the free list */
static void
find_dead_strings(struct Parrot_Interp *interpreter) {
}

/* Allocate a new memory block. We allocate the larger of however much
   was asked for or the default size, whichever's larger */
void *
Parrot_alloc_new_block(struct Parrot_Interp *interpreter,
                       size_t size, UINTVAL public) {
  size_t alloc_size = (size > DEFAULT_SIZE) ? size : DEFAULT_SIZE;
  struct Memory_Pool *new_pool;
  /* Allocate a new block. Header info's on the front, plus a fudge
     factor for good measure */
  new_pool = mem_sys_allocate(sizeof(struct Memory_Pool) + alloc_size + 32);
  if (!new_pool) {
    return NULL;
  }

  new_pool->free = alloc_size;
  new_pool->size = alloc_size;
  new_pool->next = NULL;
  new_pool->prev = NULL;
  new_pool->start = (char *)new_pool + sizeof(struct Memory_Pool);
  new_pool->top = new_pool->start;

  /* Note that we've allocated it */
  interpreter->memory_allocated += alloc_size;

  /* If this is a public pool, add it to the list of pools for this
     interpreter */
  if (public) {
    new_pool->prev = interpreter->arena_base->memory_pool;
    /* If we're not first, then tack us on the list */
    if (interpreter->arena_base->memory_pool) {
      interpreter->arena_base->memory_pool->next = new_pool;
    }
    interpreter->arena_base->memory_pool = new_pool;
  }
  return new_pool;
}

/* Takes an interpreter, a buffer pointer, and a new size. The buffer
   pointer is in as a void * because we may take a STRING or
   something, and C doesn't subclass */
void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t tosize)
{
    /* Put our void * pointer into something we don't have to cast
       around with */
    Buffer *buffer;
    size_t copysize;
    size_t alloc_size = tosize;
    void *mem;

    buffer = from;
    copysize = (buffer->buflen > tosize ? tosize : buffer->buflen);

    mem = mem_allocate(interpreter, &alloc_size);
    if (!mem) {
        return NULL;
    }
    /* We shouldn't ever have a 0 from size, but we do. If we can
       track down those bugs, this can be removed which would make
       things cheaper */
    if (copysize) {
        memcpy(mem, buffer->bufstart, copysize);
    }
    buffer->bufstart = mem;
    buffer->buflen = tosize;
    return mem;
}

/* Takes an interpreter, a buffer pointer, and a new size. The buffer
   pointer is in as a void * because we may take a STRING or
   something, and C doesn't subclass. The destination may be bigger,
   since we round up to the allocation quantum */
void *
Parrot_reallocate_about(struct Parrot_Interp *interpreter, void *from, size_t tosize)
{
    /* Put our void * pointer into something we don't have to cast
       around with */
    Buffer *buffer;
    size_t copysize;
    size_t alloc_size = tosize;
    void *mem;

    buffer = from;
    copysize = (buffer->buflen > tosize ? tosize : buffer->buflen);

    mem = mem_allocate(interpreter, &alloc_size);
    if (!mem) {
        return NULL;
    }
    /* We shouldn't ever have a 0 from size, but we do. If we can
       track down those bugs, this can be removed which would make
       things cheaper */
    if (copysize) {
        memcpy(mem, buffer->bufstart, copysize);
    }
    buffer->bufstart = mem;
    buffer->buflen = alloc_size;
    return mem;
}

/* Allocate exactly as much memory as they asked for */
void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    size_t req_size = size;
    ((Buffer *)buffer)->buflen = 0;
    ((Buffer *)buffer)->bufstart = NULL;
    ((Buffer *)buffer)->bufstart = mem_allocate(interpreter, &req_size);
    ((Buffer *)buffer)->buflen = size;
    return buffer;
}

/* Allocate at least as much memory as they asked for. We round the
   amount up to the allocation quantum */
void *
Parrot_allocate_about(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    size_t req_size = size;
    ((Buffer *)buffer)->buflen = 0;
    ((Buffer *)buffer)->bufstart = NULL;
    ((Buffer *)buffer)->bufstart = mem_allocate(interpreter, &req_size);
    ((Buffer *)buffer)->buflen = req_size;
    return buffer;
}

void *
mem_allocate(struct Parrot_Interp *interpreter, size_t *req_size) {
  char *return_val;
  size_t size = *req_size;
  if (NULL == interpreter) {
    void *mem = mem_sys_allocate(size);
    return mem;
  }
#ifdef GC_DEBUG
  Parrot_go_collect(interpreter);
#endif

  /* Make sure we round up to a multiple of 16 */
  size += 16;
  size &= ~0x0f;
  /* Do we have enough in our top pool? */
  if (interpreter->arena_base->memory_pool->free >= size) {
    return_val = interpreter->arena_base->memory_pool->top;
    interpreter->arena_base->memory_pool->top += size;
    interpreter->arena_base->memory_pool->free -= size;
  }
  /* Or not. Go do what we need to */
  else {
    /* Trigger a collection */
    Parrot_go_collect(interpreter);
    /* Was that enough? */
    if (interpreter->arena_base->memory_pool->free >= size) {
      return_val = interpreter->arena_base->memory_pool->top;
      interpreter->arena_base->memory_pool->top += size;
      interpreter->arena_base->memory_pool->free -= size;
    }
    /* No, it wasn't */
    else {
      /* Allocate a new block, then */
      Parrot_alloc_new_block(interpreter, size, 1);
      interpreter->mem_allocs_since_last_collect++;
      /* Was *that* enough? */
      if (interpreter->arena_base->memory_pool->free >= size) {
        return_val = interpreter->arena_base->memory_pool->top;
        interpreter->arena_base->memory_pool->top += size;
        interpreter->arena_base->memory_pool->free -= size;
      }
      /* Good grief, no. Too bad for the allocator, I guess */
      else {
        return_val = NULL;
      }
    }
  }
  *req_size = size;
  return (void *)return_val;
}

/* Tag a buffer header as alive. Used by the GC system when tracing
   the root set, and used by the PMC GC handling routines to tag their
   individual pieces if they have private ones
*/
void
buffer_lives(Buffer *buffer) {
  buffer->flags |= BUFFER_live_FLAG;
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
