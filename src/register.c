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
Parrot_push_i(struct Parrot_Interp *interpreter)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->int_reg_top->free) {
        memcpy(&interpreter->int_reg_top->IReg[interpreter->int_reg_top->used],
               &interpreter->int_reg, sizeof(struct IReg));
        interpreter->int_reg_top->free--;
        interpreter->int_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct IRegChunk *next_chunk;
        if(interpreter->int_reg_top->next)
            next_chunk = interpreter->int_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct IRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->int_reg_top;
            interpreter->int_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        next_chunk->free = FRAMES_PER_INT_REG_CHUNK - 1;
        interpreter->int_reg_top = next_chunk;
        memcpy(&next_chunk->IReg[0],
               &interpreter->int_reg, sizeof(struct IReg));
    }
}

/*=for api register Parrot_pop_i
  pops an integer register frame off of the frame stack
*/
void
Parrot_pop_i(struct Parrot_Interp *interpreter)
{
    struct IRegChunk *top = interpreter->int_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(&interpreter->int_reg,
               &top->IReg[top->used], sizeof(struct IReg));
        top->free++;
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->int_reg_top = top->prev;
            }
        }
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more I register frames to pop!");
    }
}

/*=for api register Parrot_clear_i
  sets each register in an integer register frame to 0
*/
void
Parrot_clear_i(struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->int_reg.registers[i] = 0;
    }
}

/*=for api register Parrot_push_s
  pushes a new string register frame on the frame stack
*/
void
Parrot_push_s(struct Parrot_Interp *interpreter)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->string_reg_top->free) {
        memcpy(&interpreter->string_reg_top->
               SReg[interpreter->string_reg_top->used],
               &interpreter->string_reg, sizeof(struct SReg));
        interpreter->string_reg_top->free--;
        interpreter->string_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct SRegChunk *next_chunk;
        if(interpreter->string_reg_top->next)
            next_chunk = interpreter->string_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct SRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->string_reg_top;
            interpreter->string_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        next_chunk->free = FRAMES_PER_STR_REG_CHUNK - 1;
        interpreter->string_reg_top = next_chunk;
        memcpy(&next_chunk->SReg[0],
               &interpreter->string_reg, sizeof(struct SReg));
    }
}

/*=for api register Parrot_pop_s
  pops a string register frame off of the frame stack
*/
void
Parrot_pop_s(struct Parrot_Interp *interpreter)
{
    struct SRegChunk *top = interpreter->string_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(&interpreter->string_reg,
               &top->SReg[top->used], sizeof(struct SReg));
        top->free++;
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->string_reg_top = top->prev;
            }
        }
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more S register frames to pop!");
    }
}

/*=for api register Parrot_clear_s
  sets each register in a string register frame to NULL
*/
void
Parrot_clear_s(struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->string_reg.registers[i] = NULL;
    }
}

/*=for api register Parrot_push_n
  pushes a new numeric register frame on the frame stack
*/
void
Parrot_push_n(struct Parrot_Interp *interpreter)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->num_reg_top->free) {
        memcpy(&interpreter->num_reg_top->NReg[interpreter->num_reg_top->used],
               &interpreter->num_reg, sizeof(struct NReg));
        interpreter->num_reg_top->free--;
        interpreter->num_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct NRegChunk *next_chunk;
        if(interpreter->num_reg_top->next)
            next_chunk = interpreter->num_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct NRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->num_reg_top;
            interpreter->num_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        next_chunk->free = FRAMES_PER_NUM_REG_CHUNK - 1;
        interpreter->num_reg_top = next_chunk;
        memcpy(&next_chunk->NReg[0],
               &interpreter->num_reg, sizeof(struct NReg));
    }
}

/*=for api register Parrot_pop_n
  pops a numeric register frame off of the frame stack
*/
void
Parrot_pop_n(struct Parrot_Interp *interpreter)
{
    struct NRegChunk *top = interpreter->num_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(&interpreter->num_reg,
               &top->NReg[top->used], sizeof(struct NReg));
        top->free++;
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->num_reg_top = top->prev;
            }
        }
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more N register frames to pop!");
    }
}

/*=for api register Parrot_clear_n
  sets each register in a numeric register frame to 0
*/
void
Parrot_clear_n(struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->num_reg.registers[i] = 0.0;
    }
}

/*=for api register Parrot_push_p
  pushes a new PMC register frame on the frame stack
*/
void
Parrot_push_p(struct Parrot_Interp *interpreter)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->pmc_reg_top->free) {
        memcpy(&interpreter->pmc_reg_top->PReg[interpreter->pmc_reg_top->used],
               &interpreter->pmc_reg, sizeof(struct PReg));
        interpreter->pmc_reg_top->free--;
        interpreter->pmc_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct PRegChunk *next_chunk;
        if(interpreter->pmc_reg_top->next)
            next_chunk = interpreter->pmc_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct PRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->pmc_reg_top;
            interpreter->pmc_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        next_chunk->free = FRAMES_PER_PMC_REG_CHUNK - 1;
        interpreter->pmc_reg_top = next_chunk;
        memcpy(&next_chunk->PReg[0],
               &interpreter->pmc_reg, sizeof(struct PReg));
    }
}

/*=for api register Parrot_pop_p
  pops a pmc register frame off of the frame stack
*/
void
Parrot_pop_p(struct Parrot_Interp *interpreter)
{
    struct PRegChunk *top = interpreter->pmc_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(&interpreter->pmc_reg,
               &top->PReg[top->used], sizeof(struct PReg));
        top->free++;
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->pmc_reg_top = top->prev;
            }
        }
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more P register frames to pop!");
    }
}

/*=for api register Parrot_clear_p
  sets each pmc register in a pmc frame stack to NULL.
*/
void
Parrot_clear_p(struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->pmc_reg.registers[i] = NULL;
    }
}

/*=for api register Parrot_push_on_stack
   pushes something on the parrot stack
*/
void
Parrot_push_on_stack(void *thing, INTVAL size, INTVAL type)
{
    UNUSED(thing);
    UNUSED(size);
    UNUSED(type);
}

/*=for api register Parrot_pop_off_stack
   pops something off the parrot stack
*/
void
Parrot_pop_off_stack(void *thing, INTVAL type)
{
    UNUSED(thing);
    UNUSED(type);
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
