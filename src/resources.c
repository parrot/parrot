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
#include "assert.h"

/* Add a string header to the free string header pool */
static void add_pmc_to_free(struct Parrot_Interp *interpreter,
			    struct PMC_free_pool *pool, void
			    *to_add) {
  PMC **temp_ptr;
  /* First, check and see if there's enough space in the free pool. If
   we're within the size of a STRING pointer, we make it bigger */
  if (pool->entries_in_pool * sizeof(PMC *) >=
      pool->pool_buffer.buflen - sizeof(PMC *)) {
    /* If not, make the free pool bigger. We enlarge it by 20% */
    pool->pool_buffer.bufstart = mem_realloc(interpreter,
					     pool->pool_buffer.bufstart,
					     pool->pool_buffer.buflen,
					     (UINTVAL)(pool->pool_buffer.buflen * 1.2));
    pool->pool_buffer.buflen = (UINTVAL)(pool->pool_buffer.buflen * 1.2);

  }

  /* Okay, so there's space. Add the header on */
  ((PMC *)to_add)->flags = PMC_on_free_list_FLAG;
  temp_ptr = pool->pool_buffer.bufstart;
  temp_ptr += pool->entries_in_pool;
  *temp_ptr = to_add;
  pool->entries_in_pool++;
  
  /* Note the numbers */
  interpreter->active_PMCs--;
}


/* We have no more headers on the free header pool. Go allocate more
   and put them on */
static void alloc_more_pmc_headers(struct Parrot_Interp *interpreter) {
  struct PMC_Arena *new_arena, *old_arena;
  PMC *cur_pmc;
  int i;

  /* First, try and find some unused headers */
  Parrot_do_dod_run(interpreter);

  /* If we found some, then bail as we don't need to do anything */
  if (interpreter->arena_base->pmc_pool->entries_in_pool) {
    return;
  }
  
  new_arena = mem_sys_allocate(sizeof(struct PMC_Arena));
  new_arena->GC_data = mem_sys_allocate(sizeof(PMC *) * PMC_HEADERS_PER_ALLOC);
  memset(new_arena->GC_data, NULL, sizeof(PMC *) * PMC_HEADERS_PER_ALLOC);
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
     add_header_to_free assumes that it's adding an active header to
     the free list */
  interpreter->active_PMCs += PMC_HEADERS_PER_ALLOC;

  cur_pmc = new_arena->start_PMC;
  for (i = 0; i < PMC_HEADERS_PER_ALLOC; i++) {
    add_pmc_to_free(interpreter,
		    interpreter->arena_base->pmc_pool,
		    cur_pmc++);
  }
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
    /* Return it */
    return return_me;
  }
}

void free_pmc(PMC *pmc) {
  if (pmc) {
    memset(pmc, 0, sizeof(PMC));
  }
}

Buffer *new_tracked_header(struct Parrot_Interp *interpreter, UINTVAL size) {
  UNUSED (interpreter);
  return( (Buffer *)mem_sys_allocate(size));
}

void free_tracked(Buffer *thing) {
  mem_sys_free(thing);
}

/* Add a string header to the free string header pool */
static void add_header_to_free(struct Parrot_Interp *interpreter,
			       struct STRING_free_pool *pool, void
			       *to_add) {
  STRING **temp_ptr;
  /* First, check and see if there's enough space in the free pool. If
   we're within the size of a STRING pointer, we make it bigger */
  if (pool->entries_in_pool * sizeof(STRING *) >=
      pool->pool_buffer.buflen - sizeof(STRING *)) {
    /* If not, make the free pool bigger. We enlarge it by 20% */
    pool->pool_buffer.bufstart = mem_realloc(interpreter,
					     pool->pool_buffer.bufstart,
					     pool->pool_buffer.buflen,
					     (UINTVAL)(pool->pool_buffer.buflen * 1.2));
    pool->pool_buffer.buflen = (UINTVAL)(pool->pool_buffer.buflen * 1.2);

  }

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

   Not implemented yet

*/
static void
mark_PMCs_unused(struct Parrot_Interp *interpreter) {

  return;
}

/* Mark all the buffers as unused */
static void
mark_buffers_unused(struct Parrot_Interp *interpreter) {
  struct STRING_Arena *cur_arena;
  UINTVAL i;

  /* Run through all the buffer header pools and mark */
  for (cur_arena = interpreter->arena_base->last_STRING_Arena;
       NULL != cur_arena;
       cur_arena = cur_arena->prev) {
    STRING *string_array = cur_arena->start_STRING;
    for (i = 0; i < cur_arena->used; i++) {
      /* Tentatively unused, unless it's a constant */
      if (!(string_array[i].flags & BUFFER_constant_FLAG)) {
	string_array[i].flags &= ~BUFFER_live_FLAG;
      }
    }
  }
}

/* Do a full trace run and mark all the PMCs as active if they are

   Not implemented yet

*/
static void
trace_active_PMCs(struct Parrot_Interp *interpreter) {
  return;
}

/* Scan any buffers in S registers and other non-PMC places and mark
   them as active */
static void
trace_active_buffers(struct Parrot_Interp *interpreter) {
  UINTVAL i, j, chunks_traced;
  struct Stack_chunk_t *cur_stack, *start_stack;
  struct SRegChunk *cur_chunk;

  /* First mark the current set. We assume that all pointers in S
     registers are pointing to valid buffers. This is not a good
     assumption, but it'll do for now */
  for (i=0; i < NUM_REGISTERS; i++) {
    if (interpreter->string_reg.registers[i]) {
      buffer_lives((Buffer *)interpreter->string_reg.registers[i]);
    }
  }

  /* Now walk the string stack */
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
    for (i = 0; i < STACK_CHUNK_DEPTH; i++) {
      if (STACK_ENTRY_STRING == cur_stack->entry[i].flags) {
	buffer_lives((Buffer *)cur_stack->entry[i].entry.string_val);
      }
    }

    chunks_traced++;
    cur_stack = cur_stack->prev;
  }
}

/* Free up any PMCs that aren't in use

   Not yet implemented

*/
static void
free_unused_PMCs(struct Parrot_Interp *interpreter) {
  return;
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
  struct STRING_Arena *new_arena, *old_arena;
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
    /* Return it */
    return return_me;
  }
}

/* Mark the string as unused. The GC will later find it and put it on
   the free list */
void free_string(STRING *string) {
  if (string) {
    if (string->bufstart && (string->flags & BUFFER_sysmem_FLAG)) {
      mem_sys_free(string->bufstart);
    }
    string->bufstart = NULL;
    string->buflen = 0;
    string->flags = 0;
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
  struct Memory_Pool *new_block;	/* A pointer to our working pool */
  char *cur_spot;		/* Where we're currently copying to */
  UINTVAL cur_size;	/* How big our chunk is going to be */
  struct STRING_Arena *cur_arena; /* The string arena we're working on */

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

  /* First collect the free header pool */
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

  /* Run through all the buffer header pools and copy */
  for (cur_arena = interpreter->arena_base->last_STRING_Arena;
       NULL != cur_arena;
       cur_arena = cur_arena->prev) {
    UINTVAL i;
    STRING *string_array = cur_arena->start_STRING;
    for (i = 0; i < cur_arena->used; i++) {
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

  /* Okay, we're done with the copy. Set the bits in the pool struct */
  /* First, where we allocate next */
  new_block->top = cur_spot;
  /* How much is free. That's the total size minus the amount we used */
  new_block->free = new_block->size - (new_block->top - new_block->start);


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

/* Trace from the root set for all used strings */
static void
dead_string_run(struct Parrot_Interp *interpreter) {
}  

/* Allocate a new memory block. We allocate the larger of however much
   was asked for or the default size, whichever's larger */
void *
Parrot_alloc_new_block(struct Parrot_Interp *interpreter,
		       UINTVAL size, UINTVAL public) {
  UINTVAL alloc_size = (size > DEFAULT_SIZE) ? size : DEFAULT_SIZE;
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


void *
Parrot_allocate(struct Parrot_Interp *interpreter, UINTVAL size) {
  char *return_val;
  if (NULL == interpreter) {
    return mem_sys_allocate(size);
  }
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
  return((void *)return_val);
}

/* Tag a buffer header as alive. Used by the GC system when tracing
   the root set, and used by the PMC GC handling routines to tag their
   individual pieces if they have private ones
*/
void
buffer_lives(Buffer *buffer) {
  buffer->flags |= BUFFER_live_FLAG;
}
