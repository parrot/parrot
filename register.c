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
  pushes 16 registers worth of int registers onto the int reg stack
*/
void
Parrot_push_i(struct Parrot_Interp *interpreter, void *where)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->ctx.int_reg_top->used < FRAMES_PER_CHUNK) {
        memcpy(&interpreter->ctx.int_reg_top->
               IRegFrame[interpreter->ctx.int_reg_top->used],
               where, sizeof(struct IRegFrame));
        interpreter->ctx.int_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct IRegChunk *next_chunk;
        if (interpreter->ctx.int_reg_top->next)
            next_chunk = interpreter->ctx.int_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct IRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->ctx.int_reg_top;
            interpreter->ctx.int_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        interpreter->ctx.int_reg_top = next_chunk;
        memcpy(&next_chunk->IRegFrame[0],
               where, sizeof(struct IRegFrame));
    }
}

/*=for api register Parrot_pop_i
  pops 16 integer registers worth of data from the int reg stack
*/
void
Parrot_pop_i(struct Parrot_Interp *interpreter, void *where)
{
    struct IRegChunk *top = interpreter->ctx.int_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(where,
               &top->IRegFrame[top->used], sizeof(struct IRegFrame));
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->ctx.int_reg_top = top->prev;
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
Parrot_push_s(struct Parrot_Interp *interpreter, void *where)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->ctx.string_reg_top->used < FRAMES_PER_CHUNK) {
        memcpy(&interpreter->ctx.string_reg_top->
               SRegFrame[interpreter->ctx.string_reg_top->used],
               where, sizeof(struct SRegFrame));
        interpreter->ctx.string_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct SRegChunk *next_chunk;
        if (interpreter->ctx.string_reg_top->next)
            next_chunk = interpreter->ctx.string_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct SRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->ctx.string_reg_top;
            interpreter->ctx.string_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        interpreter->ctx.string_reg_top = next_chunk;
        memcpy(&next_chunk->SRegFrame[0],
               where, sizeof(struct SRegFrame));
    }
}

/*=for api register Parrot_pop_s
  pops a string register frame off of the frame stack
*/
void
Parrot_pop_s(struct Parrot_Interp *interpreter, void *where)
{
    struct SRegChunk *top = interpreter->ctx.string_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(where,
               &top->SRegFrame[top->used], sizeof(struct SRegFrame));
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->ctx.string_reg_top = top->prev;
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
Parrot_push_n(struct Parrot_Interp *interpreter, void *where)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->ctx.num_reg_top->used < FRAMES_PER_CHUNK) {
        memcpy(&interpreter->ctx.num_reg_top->
               NRegFrame[interpreter->ctx.num_reg_top->used],
               where, sizeof(struct NRegFrame));
        interpreter->ctx.num_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct NRegChunk *next_chunk;
        if (interpreter->ctx.num_reg_top->next)
            next_chunk = interpreter->ctx.num_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct NRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->ctx.num_reg_top;
            interpreter->ctx.num_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        interpreter->ctx.num_reg_top = next_chunk;
        memcpy(&next_chunk->NRegFrame[0],
               where, sizeof(struct NRegFrame));
    }
}

/*=for api register Parrot_pop_n
  pops a numeric register frame off of the frame stack
*/
void
Parrot_pop_n(struct Parrot_Interp *interpreter, void *where)
{
    struct NRegChunk *top = interpreter->ctx.num_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(where,
               &top->NRegFrame[top->used], sizeof(struct NRegFrame));
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->ctx.num_reg_top = top->prev;
            }
        }
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more N register frames to pop!");
    }
}

/*=for api register Parrot_clear_n
  sets each register in a numeric register frame to 0.0
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
Parrot_push_p(struct Parrot_Interp *interpreter, void *where)
{
    /* Do we have any space in the current savestack? If so, memcpy
     * down */
    if (interpreter->ctx.pmc_reg_top->used < FRAMES_PER_CHUNK) {
        memcpy(&interpreter->ctx.pmc_reg_top->
               PRegFrame[interpreter->ctx.pmc_reg_top->used],
               where, sizeof(struct PRegFrame));
        interpreter->ctx.pmc_reg_top->used++;
    }
    /* Nope, so either move to next stack chunk or grow the stack */
    else {
        struct PRegChunk *next_chunk;
        if (interpreter->ctx.pmc_reg_top->next)
            next_chunk = interpreter->ctx.pmc_reg_top->next;
        else {
            next_chunk = mem_sys_allocate(sizeof(struct PRegChunk));
            next_chunk->next = NULL;
            next_chunk->prev = interpreter->ctx.pmc_reg_top;
            interpreter->ctx.pmc_reg_top->next = next_chunk;
        }
        next_chunk->used = 1;
        interpreter->ctx.pmc_reg_top = next_chunk;
        memcpy(&next_chunk->PRegFrame[0],
               where, sizeof(struct PRegFrame));
    }
}

/*=for api register Parrot_pop_p
  pops a pmc register frame off of the frame stack
*/
void
Parrot_pop_p(struct Parrot_Interp *interpreter, void *where)
{
    struct PRegChunk *top = interpreter->ctx.pmc_reg_top;
    /* Do we even have anything? */
    if (top->used > 0) {
        top->used--;
        memcpy(where,
               &top->PRegFrame[top->used], sizeof(struct PRegFrame));
        /* Empty? */
        if (!top->used) {
            /* Yep, drop down a frame. Maybe */
            if (top->prev) {
                /* Keep one stack segment spare to avoid thrashing */
                if (top->next) {
                    mem_sys_free(top->next);
                    top->next = NULL;
                }
                interpreter->ctx.pmc_reg_top = top->prev;
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
