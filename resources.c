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

PMC *new_pmc_header(struct Parrot_Interp *interpreter) {
  UNUSED (interpreter);

  return mem_sys_allocate(sizeof(PMC));
}

void free_pmc(PMC *pmc) {
  free(pmc);
}

STRING *new_string_header(struct Parrot_Interp *interpreter) {
  UNUSED (interpreter);

  return mem_sys_allocate(sizeof(STRING));
}
static void
go_collect(struct Parrot_Interp *interpreter) {
}

/* Allocate a new memory block. We allocate the larger of however much
   was asked for or the default size, whichever's larger */
void
Parrot_alloc_new_block(struct Parrot_Interp *interpreter, UINTVAL size) {
  UINTVAL alloc_size = (size > DEFAULT_SIZE) ? size : DEFAULT_SIZE;
  struct Memory_Pool *new_pool;
  /* Allocate a new block. Header info's on the front, plus a fudge
     factor for good measure */
  new_pool = mem_sys_allocate(sizeof(struct Memory_Pool) + alloc_size + 32);
  if (!new_pool) {
    return;
  }
  new_pool->free = alloc_size;
  new_pool->size = alloc_size;
  new_pool->next = NULL;
  new_pool->prev = interpreter->arena_base->memory_pool;
  new_pool->start = (char *)new_pool + sizeof(struct Memory_Pool);
  new_pool->top = new_pool->start;
  /* If we're not first, then tack us on the list */
  if (interpreter->arena_base->memory_pool) {
    interpreter->arena_base->memory_pool->next = new_pool;
  }
  interpreter->arena_base->memory_pool = new_pool;

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
    go_collect(interpreter);
    /* Was that enough? */
    if (interpreter->arena_base->memory_pool->free >= size) {
      return_val = interpreter->arena_base->memory_pool->top;
      interpreter->arena_base->memory_pool->top += size;
      interpreter->arena_base->memory_pool->free -= size;
    }
    /* No, it wasn't */
    else {
      /* Allocate a new block, then */
      Parrot_alloc_new_block(interpreter, size);
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


void free_string(STRING *string) {
  if (string) {
    string->bufstart = NULL;
    string->buflen = 0;
  }
}

