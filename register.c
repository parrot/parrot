/* register.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Register handling routines
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/*=for api register Parrot_push_i
  pushes a new integer register frame on the frame stack
*/
void
Parrot_push_i(struct Parrot_Interp *interpreter) {
    struct IRegChunk *chunk_base;
    
    chunk_base = INT_CHUNK_BASE(interpreter->int_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->int_reg = &chunk_base->IReg[chunk_base->used++];
        chunk_base->free--;
    }
    /* Nope, so plan B time. Allocate a new chunk of integer register frames */
    else {
        struct IRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct IRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_INT_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        interpreter->int_reg = &new_chunk->IReg[0];
    }
}

/*=for api register Parrot_clone_i
  pushes a new integer register frame on the frame stack and
  copies the last frame to the current frame
*/
void
Parrot_clone_i(struct Parrot_Interp *interpreter) {
    struct IRegChunk *chunk_base;
    
    chunk_base = INT_CHUNK_BASE(interpreter->int_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->int_reg = &chunk_base->IReg[chunk_base->used++];
        chunk_base->free--;
        mem_sys_memcopy(&chunk_base->IReg[chunk_base->used-1],
                        &chunk_base->IReg[chunk_base->used-2],
                        sizeof(struct IReg));
    }
    /* Nope, so plan B time. Allocate a new chunk of integer register frames */
    else {
        struct IRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct IRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_INT_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        mem_sys_memcopy(&new_chunk->IReg[0],
                        &chunk_base->IReg[chunk_base->used-1],
                        sizeof(struct IReg));
        interpreter->int_reg = &new_chunk->IReg[0];
    }
}

/*=for api register Parrot_pop_i
  pops an integer register frame off of the frame stack
*/
void
Parrot_pop_i(struct Parrot_Interp *interpreter) {
    struct IRegChunk *chunk_base;
    chunk_base = INT_CHUNK_BASE(interpreter->int_reg);
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
            interpreter->int_reg = &chunk_base->IReg[chunk_base->used - 1];
        }
        /* Nope. So pitch a fit */
        else {
            internal_exception(NO_REG_FRAMES, 
                               "No more I register frames to pop!");
        }
    }
}

/*=for api register Parrot_clear_i
  sets each register in an integer register frame to 0
*/
void
Parrot_clear_i(struct Parrot_Interp *interpreter) {
    int i;
    for (i=0; i<NUM_REGISTERS; i++) {
        interpreter->int_reg->registers[i] = 0;
    }
}

/*=for api register Parrot_push_s
  pushes a new string register frame on the frame stack
*/
void
Parrot_push_s(struct Parrot_Interp *interpreter) {
    struct SRegChunk *chunk_base;
    
    chunk_base = STR_CHUNK_BASE(interpreter->string_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->string_reg = &chunk_base->SReg[chunk_base->used++];
        chunk_base->free--;
    }
    /* Nope, so plan B time. Allocate a new chunk of string register frames */
    else {
        struct SRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct SRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_STR_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        interpreter->string_reg = &new_chunk->SReg[0];
        /* Gotta NULL them out as some string
           functions depend on NULL strings */
        Parrot_clear_s(interpreter);
    }
}

/*=for api register Parrot_clone_s
  pushes a new string register frame on the frame stack and
  copies the last frame to the current frame
*/
void
Parrot_clone_s(struct Parrot_Interp *interpreter) {
    struct SRegChunk *chunk_base;
    
    chunk_base = STR_CHUNK_BASE(interpreter->string_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->string_reg = &chunk_base->SReg[chunk_base->used++];
        chunk_base->free--;
        mem_sys_memcopy(&chunk_base->SReg[chunk_base->used-1],
                        &chunk_base->SReg[chunk_base->used-2],
                        sizeof(struct SReg));
    }
    /* Nope, so plan B time. Allocate a new chunk of string register frames */
    else {
        struct SRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct SRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_STR_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        mem_sys_memcopy(&new_chunk->SReg[0],
                        &chunk_base->SReg[chunk_base->used-1],
                        sizeof(struct SReg));
        interpreter->string_reg = &new_chunk->SReg[0];
        /* Gotta NULL them out as some string
           functions depend on NULL strings */
        Parrot_clear_s(interpreter);
    }
}

/*=for api register Parrot_pop_s
  pops a string register frame off of the frame stack
*/
void
Parrot_pop_s(struct Parrot_Interp *interpreter) {
    struct SRegChunk *chunk_base;
    chunk_base = STR_CHUNK_BASE(interpreter->string_reg);
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
            interpreter->string_reg = &chunk_base->SReg[chunk_base->used - 1];
        }
        /* Nope. So pitch a fit */
        else {
            internal_exception(NO_REG_FRAMES, 
                               "No more S register frames to pop!");
        }
    }
}

/*=for api register Parrot_clear_s
  sets each register in a string register frame to NULL
*/
void
Parrot_clear_s(struct Parrot_Interp *interpreter) {
    int i;
    for (i=0; i<NUM_REGISTERS; i++) {
        interpreter->string_reg->registers[i] = NULL;
    }
}

/*=for api register Parrot_push_n
  pushes a new numeric register frame on the frame stack
*/
void
Parrot_push_n(struct Parrot_Interp *interpreter) {
    struct NRegChunk *chunk_base;
    
    chunk_base = NUM_CHUNK_BASE(interpreter->num_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->num_reg = &chunk_base->NReg[chunk_base->used++];
        chunk_base->free--;
    }
    /* Nope, so plan B time. Allocate a new chunk of float register frames */
    else {
        struct NRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct NRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_NUM_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        interpreter->num_reg = &new_chunk->NReg[0];
    }
}

/*=for api register Parrot_clone_n
  pushes a new numeric register frame on the frame stack and copy the
  previous frame to the current frame
*/
void
Parrot_clone_n(struct Parrot_Interp *interpreter) {
    struct NRegChunk *chunk_base;
    
    chunk_base = NUM_CHUNK_BASE(interpreter->num_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->num_reg = &chunk_base->NReg[chunk_base->used++];
        chunk_base->free--;
        mem_sys_memcopy(&chunk_base->NReg[chunk_base->used-1],
                        &chunk_base->NReg[chunk_base->used-2],
                        sizeof(struct NReg));
    }
    /* Nope, so plan B time. Allocate a new chunk of float register frames */
    else {
        struct NRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct NRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_NUM_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        mem_sys_memcopy(&new_chunk->NReg[0],
                        &chunk_base->NReg[chunk_base->used-1],
                        sizeof(struct NReg));
        interpreter->num_reg = &new_chunk->NReg[0];
    }
}

/*=for api register Parrot_pop_n
  pops a numeric register frame off of the frame stack
*/
void
Parrot_pop_n(struct Parrot_Interp *interpreter) {
    struct NRegChunk *chunk_base;
    chunk_base = NUM_CHUNK_BASE(interpreter->num_reg);
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
            interpreter->num_reg = &chunk_base->NReg[chunk_base->used - 1];
        }
        /* Nope. So pitch a fit */
        else {
            internal_exception(NO_REG_FRAMES, 
                               "No more N register frames to pop!");
        }
    }
}

/*=for api register Parrot_clear_n
  sets each register in a numeric register frame to 0
*/
void
Parrot_clear_n(struct Parrot_Interp *interpreter) {
    int i;
    for (i=0; i<NUM_REGISTERS; i++) {
        interpreter->num_reg->registers[i] = 0.0;
    }
}

/*=for api register Parrot_push_p
  pushes a new PMC register frame on the frame stack
*/
void
Parrot_push_p(struct Parrot_Interp *interpreter) {
    struct PRegChunk *chunk_base;
    
    chunk_base = PMC_CHUNK_BASE(interpreter->pmc_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->pmc_reg = &chunk_base->PReg[chunk_base->used++];
        chunk_base->free--;
    }
    /* Nope, so plan B time. Allocate a new chunk of float register frames */
    else {
        struct PRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct PRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_PMC_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        interpreter->pmc_reg = &new_chunk->PReg[0];
        /* Gotta NULL them out or we might GC Wrong things later */
        Parrot_clear_p(interpreter);
    }
}

/*=for api register Parrot_clone_p
  pushes a new PMC register frame on the frame stack and copy the
  previous frame to the current frame
*/
void
Parrot_clone_p(struct Parrot_Interp *interpreter) {
    struct PRegChunk *chunk_base;
    
    chunk_base = PMC_CHUNK_BASE(interpreter->pmc_reg);
    /* Do we have any slots left in the current chunk? */
    if (chunk_base->free) {
        interpreter->pmc_reg = &chunk_base->PReg[chunk_base->used++];
        chunk_base->free--;
        mem_sys_memcopy(&chunk_base->PReg[chunk_base->used-1],
                        &chunk_base->PReg[chunk_base->used-2],
                        sizeof(struct PReg));
    }
    /* Nope, so plan B time. Allocate a new chunk of float register frames */
    else {
        struct PRegChunk *new_chunk;
        new_chunk = mem_allocate_aligned(sizeof(struct PRegChunk));
        new_chunk->used = 1;
        new_chunk->free = FRAMES_PER_PMC_REG_CHUNK - 1;
        new_chunk->next = NULL;
        new_chunk->prev = chunk_base;
        chunk_base->next = new_chunk;
        mem_sys_memcopy(&new_chunk->PReg[0],
                        &chunk_base->PReg[chunk_base->used-1],
                        sizeof(struct PReg));
        interpreter->pmc_reg = &new_chunk->PReg[0];
        /* Gotta NULL them out or we might GC Wrong things later */
        Parrot_clear_p(interpreter);
    }
}

/*=for api register Parrot_pop_p
  pops a pmc register frame off of the frame stack
*/
void
Parrot_pop_p(struct Parrot_Interp *interpreter) {
    struct PRegChunk *chunk_base;
    chunk_base = PMC_CHUNK_BASE(interpreter->pmc_reg);
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
            interpreter->pmc_reg = &chunk_base->PReg[chunk_base->used - 1];
        }
        /* Nope. So pitch a fit */
        else {
            internal_exception(NO_REG_FRAMES, 
                               "No more P register frames to pop!");
        }
    }
}

/*=for api register Parrot_clear_p
  sets each pmc register in a pmc frame stack to NULL.
*/
void
Parrot_clear_p(struct Parrot_Interp *interpreter) {
    int i;
    for (i=0; i<NUM_REGISTERS; i++) {
        interpreter->pmc_reg->registers[i] = NULL;
    }
}

/*=for api register Parrot_push_on_stack
   pushes something on the parrot stack
*/
void
Parrot_push_on_stack(void *thing, INTVAL size, INTVAL type) {
    UNUSED (thing); UNUSED (size); UNUSED (type);
}

/*=for api register Parrot_pop_off_stack
   pops something off the parrot stack
*/
void
Parrot_pop_off_stack(void *thing, INTVAL type) {
    UNUSED (thing); UNUSED (type);
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
