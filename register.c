/* register.c
 *
 * Register handling routines
 *
 */

#include "parrot.h"

void Parrot_push_i(struct Perl_Interp *interpreter) {
  struct IRegChunk *chunk_base;

  chunk_base = CHUNK_BASE(interpreter->int_reg);
  /* Do we have any slots left in the current chunk? */
  if (chunk_base->free) {
    interpreter->int_reg = &chunk_base->IReg[chunk_base->used++];
    chunk_base->free--;
  }
  /* Nope, so plan B time. Allocate a new chunk of integer register frames */
  else {
    struct IRegChunk *new_chunk;
    new_chunk = Allocate_Aligned(sizeof(struct IRegChunk));
    new_chunk->used = 1;
    new_chunk->free = FRAMES_PER_INT_REG_CHUNK - 1;
    new_chunk->next = NULL;
    new_chunk->prev = chunk_base;
    chunk_base->next = new_chunk;
    interpreter->int_reg = &new_chunk->IReg[0];
  }
}

void Parrot_pop_i(struct Perl_Interp *interpreter) {
  struct IRegChunk *chunk_base;
  chunk_base = CHUNK_BASE(interpreter->int_reg);
  /* Is there more than one register frame in use? */
  if (chunk_base->used > 1) {
    chunk_base->used--;
    chunk_base->free++;
    interpreter->int_reg = &chunk_base->IReg[chunk_base->used - 1];
  }
  /* nope. Walk back */
  else {
    /* Can we even walk back? */
    if (chunk_base->prev) {
      /* Do so. We don't need to adjust used/free, since they're
	 already OK for the "We're full" case */
      chunk_base = chunk_base->prev;
      interpreter->int_reg = &chunk_base->IReg[chunk_base->used];
    }
    /* Nope. So pitch a fit */
    else {
      INTERNAL_EXCEPTION(NO_REG_FRAMES, "No more I register frames to pop!");
    }
  }
}

void Parrot_clear_i(struct Perl_Interp *interpreter) {
  int i;
  for (i=0; i<NUM_REGISTERS; i++) {
    INT_REG(i) = 0;
  }
}

void Parrot_push_s(struct Perl_Interp *interpreter) {
  struct SRegChunk *chunk_base;

  chunk_base = CHUNK_BASE(interpreter->string_reg);
  /* Do we have any slots left in the current chunk? */
  if (chunk_base->free) {
    interpreter->string_reg = &chunk_base->SReg[chunk_base->used++];
    chunk_base->free--;
  }
  /* Nope, so plan B time. Allocate a new chunk of string register frames */
  else {
    struct SRegChunk *new_chunk;
    new_chunk = Allocate_Aligned(sizeof(struct SRegChunk));
    new_chunk->used = 1;
    new_chunk->free = FRAMES_PER_STR_REG_CHUNK - 1;
    new_chunk->next = NULL;
    new_chunk->prev = chunk_base;
    chunk_base->next = new_chunk;
    interpreter->string_reg = &new_chunk->SReg[0];
  }
}

void Parrot_pop_s(struct Perl_Interp *interpreter) {
  struct SRegChunk *chunk_base;
  chunk_base = CHUNK_BASE(interpreter->string_reg);
  /* Is there more than one register frame in use? */
  if (chunk_base->used > 1) {
    chunk_base->used--;
    chunk_base->free++;
    interpreter->string_reg = &chunk_base->SReg[chunk_base->used - 1];
  }
  /* nope. Walk back */
  else {
    /* Can we even walk back? */
    if (chunk_base->prev) {
      /* Do so. We don't need to adjust used/free, since they're
	 already OK for the "We're full" case */
      chunk_base = chunk_base->prev;
      interpreter->string_reg = &chunk_base->SReg[chunk_base->used];
    }
    /* Nope. So pitch a fit */
    else {
      INTERNAL_EXCEPTION(NO_REG_FRAMES, "No more S register frames to pop!");
    }
  }
}

void Parrot_clear_s(struct Perl_Interp *interpreter) {
  int i;
  for (i=0; i<NUM_REGISTERS; i++) {
    STR_REG(i) = NULL;
  }
}

void Parrot_push_n(struct Perl_Interp *interpreter) {
  struct NRegChunk *chunk_base;

  chunk_base = CHUNK_BASE(interpreter->num_reg);
  /* Do we have any slots left in the current chunk? */
  if (chunk_base->free) {
    interpreter->num_reg = &chunk_base->NReg[chunk_base->used++];
    chunk_base->free--;
  }
  /* Nope, so plan B time. Allocate a new chunk of float register frames */
  else {
    struct NRegChunk *new_chunk;
    new_chunk = Allocate_Aligned(sizeof(struct NRegChunk));
    new_chunk->used = 1;
    new_chunk->free = FRAMES_PER_NUM_REG_CHUNK - 1;
    new_chunk->next = NULL;
    new_chunk->prev = chunk_base;
    chunk_base->next = new_chunk;
    interpreter->num_reg = &new_chunk->NReg[0];
  }
}

void Parrot_pop_n(struct Perl_Interp *interpreter) {
  struct NRegChunk *chunk_base;
  chunk_base = CHUNK_BASE(interpreter->num_reg);
  /* Is there more than one register frame in use? */
  if (chunk_base->used > 1) {
    chunk_base->used--;
    chunk_base->free++;
    interpreter->num_reg = &chunk_base->NReg[chunk_base->used - 1];
  }
  /* nope. Walk back */
  else {
    /* Can we even walk back? */
    if (chunk_base->prev) {
      /* Do so. We don't need to adjust used/free, since they're
	 already OK for the "We're full" case */
      chunk_base = chunk_base->prev;
      interpreter->num_reg = &chunk_base->NReg[chunk_base->used];
    }
    /* Nope. So pitch a fit */
    else {
      INTERNAL_EXCEPTION(NO_REG_FRAMES, "No more N register frames to pop!");
    }
  }
}

void Parrot_clear_n(struct Perl_Interp *interpreter) {
  int i;
  for (i=0; i<NUM_REGISTERS; i++) {
    NUM_REG(i) = 0;
  }
}

void Parrot_push_p(struct Perl_Interp *interpreter) {
  struct PRegChunk *chunk_base;

  chunk_base = CHUNK_BASE(interpreter->pmc_reg);
  /* Do we have any slots left in the current chunk? */
  if (chunk_base->free) {
    interpreter->pmc_reg = &chunk_base->PReg[chunk_base->used++];
    chunk_base->free--;
  }
  /* Nope, so plan B time. Allocate a new chunk of float register frames */
  else {
    struct PRegChunk *new_chunk;
    new_chunk = Allocate_Aligned(sizeof(struct PRegChunk));
    new_chunk->used = 1;
    new_chunk->free = FRAMES_PER_PMC_REG_CHUNK - 1;
    new_chunk->next = NULL;
    new_chunk->prev = chunk_base;
    chunk_base->next = new_chunk;
    interpreter->pmc_reg = &new_chunk->PReg[0];
  }
}

void Parrot_pop_p(struct Perl_Interp *interpreter) {
  struct PRegChunk *chunk_base;
  chunk_base = CHUNK_BASE(interpreter->pmc_reg);
  /* Is there more than one register frame in use? */
  if (chunk_base->used > 1) {
    chunk_base->used--;
    chunk_base->free++;
    interpreter->pmc_reg = &chunk_base->PReg[chunk_base->used - 1];
  }
  /* nope. Walk back */
  else {
    /* Can we even walk back? */
    if (chunk_base->prev) {
      /* Do so. We don't need to adjust used/free, since they're
	 already OK for the "We're full" case */
      chunk_base = chunk_base->prev;
      interpreter->pmc_reg = &chunk_base->PReg[chunk_base->used];
    }
    /* Nope. So pitch a fit */
    else {
      INTERNAL_EXCEPTION(NO_REG_FRAMES, "No more P register frames to pop!");
    }
  }
}

void Parrot_clear_p(struct Perl_Interp *interpreter) {
  int i;
  for (i=0; i<NUM_REGISTERS; i++) {
    PMC_REG(i) = NULL;
  }
}

void Parrot_push_on_stack(void *thing, IV size, IV type) {
}

void Parrot_pop_off_stack(void *thing, IV type) {
}
