/* register.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

void
setup_register_stacks(struct Parrot_Interp* interpreter)
{
    struct RegisterChunkBuf* buf;
    make_bufferlike_pool(interpreter, sizeof(struct RegisterChunkBuf));

    Parrot_block_DOD(interpreter);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, (PObj*)buf, sizeof(struct IRegChunkBuf));
    interpreter->ctx.int_reg_stack.top = buf;
    interpreter->ctx.int_reg_stack.chunk_size = sizeof(struct IRegChunkBuf);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, (PObj*)buf, sizeof(struct SRegChunkBuf));
    interpreter->ctx.string_reg_stack.top = buf;
    interpreter->ctx.string_reg_stack.chunk_size = sizeof(struct SRegChunkBuf);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, (PObj*)buf, sizeof(struct NRegChunkBuf));
    interpreter->ctx.num_reg_stack.top = buf;
    interpreter->ctx.num_reg_stack.chunk_size = sizeof(struct NRegChunkBuf);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, (PObj*)buf, sizeof(struct PRegChunkBuf));
    interpreter->ctx.pmc_reg_stack.top = buf;
    interpreter->ctx.pmc_reg_stack.chunk_size = sizeof(struct PRegChunkBuf);

    Parrot_unblock_DOD(interpreter);
}

void
mark_register_stack(struct Parrot_Interp* interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
    }
}

void
mark_pmc_register_stack(struct Parrot_Interp* interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    UINTVAL i, j;
    for (chunk = stack->top; chunk;
        chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
        for (i = 0; i < chunk->used; i++) {
            for (j = 0; j < NUM_REGISTERS/2; j++) {
                if (((struct PRegChunkBuf*)chunk->data.bufstart)->PRegFrame[i].registers[j]) {
                    pobject_lives(interpreter,
                            (PObj*)((struct PRegChunkBuf*)chunk->data.bufstart)->
                                PRegFrame[i].registers[j]);
                }
            }
        }
    }
}

void
mark_string_register_stack(struct Parrot_Interp* interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    UINTVAL i, j;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
        for (i = 0; i < chunk->used; i++) {
            for (j = 0; j < NUM_REGISTERS/2; j++) {
                PObj* reg = (PObj*)((struct SRegChunkBuf*)chunk->data.bufstart)->
                    SRegFrame[i].registers[j];
                if (reg)
                    pobject_lives(interpreter, reg);
            }
        }
    }
}

void
mark_register_stack_cow(struct Parrot_Interp* interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        PObj_COW_SET((PObj*)chunk);
    }
}

static struct RegisterChunkBuf*
regstack_copy_chunk(struct Parrot_Interp* interpreter,
                    struct RegisterChunkBuf* chunk,
                    struct RegStack* stack)
{
    struct RegisterChunkBuf* buf =
            new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    *buf = *chunk;

    PObj_COW_CLEAR((PObj*) buf);

    Parrot_block_DOD(interpreter);
    Parrot_allocate(interpreter, buf, stack->chunk_size);
    Parrot_unblock_DOD(interpreter);

    memcpy(buf->data.bufstart, chunk->data.bufstart, stack->chunk_size);
    return buf;
}

static void
regstack_push_entry(struct Parrot_Interp* interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* top = stack->top;
    /* Before we change anything, is this a read-only stack? */
    if (PObj_COW_TEST((PObj*)top))
        top = stack->top = regstack_copy_chunk(interpreter, top, stack);
    /* If we can stay in the current frame, we will.  Else make a new chunk */
    if (top->used < FRAMES_PER_CHUNK) {
        top->used++;
    }
    else {
        struct RegisterChunkBuf* buf = new_bufferlike_header(interpreter,
                                sizeof(struct RegisterChunkBuf));

        Parrot_block_DOD(interpreter);
        Parrot_allocate_zeroed(interpreter, (PObj*)buf, stack->chunk_size);
        Parrot_unblock_DOD(interpreter);

        buf->used = 1;
        buf->next = top;

        stack->top = buf;
    }
}

static void
regstack_pop_entry(struct Parrot_Interp* interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* top = stack->top;
    if (top->used > 1) {
        /* Before we change anything, is this a read-only stack? */
        if (PObj_COW_TEST((PObj*)top))
            top = stack->top = regstack_copy_chunk(interpreter, stack->top, stack);
        top->used--;
    }
    else {
        /* XXX: If this isn't marked COW, we should keep it around to
         * prevent thrashing */
        if (top->next) {
            stack->top = top->next;
        }
        else {
            if (PObj_COW_TEST((PObj*)top))
                top = stack->top = regstack_copy_chunk(interpreter, stack->top, stack);
            top->used--;
        }
    }
}

/*=for api register Parrot_push_i
  pushes a new integer register frame onto the corresponding frame stack
*/
void
Parrot_push_i(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top;
    regstack_push_entry(interpreter, &interpreter->ctx.int_reg_stack);
    top = interpreter->ctx.int_reg_stack.top;
    memcpy(&((struct IRegChunkBuf*)top->data.bufstart)->
                    IRegFrame[top->used-1].registers,
           where, sizeof(struct IRegFrame));
}

/*=for api register Parrot_pop_i
  pops an integer register frame from the corresponding frame stack
*/
void
Parrot_pop_i(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top = interpreter->ctx.int_reg_stack.top;
    /* Do we even have anything? */
    if (top->used > 0) {
        memcpy(where,
               &((struct IRegChunkBuf*)top->data.bufstart)->IRegFrame[top->used-1],
               sizeof(struct IRegFrame));
        regstack_pop_entry(interpreter, &interpreter->ctx.int_reg_stack);
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more I register frames to pop!");
    }
}

/*=for api register Parrot_clear_i
  sets each integer register in the current set to 0
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
  pushes a new string register frame onto the corresponding frame stack
*/
void
Parrot_push_s(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top;
    regstack_push_entry(interpreter, &interpreter->ctx.string_reg_stack);
    top = interpreter->ctx.string_reg_stack.top;
    memcpy(&((struct SRegChunkBuf*)top->data.bufstart)->
                    SRegFrame[top->used-1].registers,
           where, sizeof(struct SRegFrame));
}

/*=for api register Parrot_pop_s
  pops a string register frame from the corresponding frame stack
*/
void
Parrot_pop_s(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top = interpreter->ctx.string_reg_stack.top;
    /* Do we even have anything? */
    if (top->used > 0) {
        struct SRegFrame* irf = &((struct SRegChunkBuf*)top->data.bufstart)->
                    SRegFrame[top->used-1];
        memcpy(where,
               &irf->registers,
               sizeof(struct SRegFrame));
        regstack_pop_entry(interpreter, &interpreter->ctx.string_reg_stack);
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more S register frames to pop!");
    }
}

/*=for api register Parrot_clear_s
  sets each string register in the current set to NULL
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
  pushes a new numeric register frame onto the corresponding frame stack
*/
void
Parrot_push_n(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top;
    regstack_push_entry(interpreter, &interpreter->ctx.num_reg_stack);
    top = interpreter->ctx.num_reg_stack.top;
    memcpy(&((struct NRegChunkBuf*)top->data.bufstart)->
                    NRegFrame[top->used-1].registers,
           where, sizeof(struct NRegFrame));
}

/*=for api register Parrot_pop_n
  pops a numeric register frame from the corresponding frame stack
*/
void
Parrot_pop_n(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top = interpreter->ctx.num_reg_stack.top;
    /* Do we even have anything? */
    if (top->used > 0) {
        struct NRegFrame* irf = &((struct NRegChunkBuf*)top->data.bufstart)->
                    NRegFrame[top->used-1];
        memcpy(where,
               &irf->registers,
               sizeof(struct NRegFrame));
        regstack_pop_entry(interpreter, &interpreter->ctx.num_reg_stack);
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more N register frames to pop!");
    }
}

/*=for api register Parrot_clear_n
  sets each numeric register in the current set to 0.0
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
  pushes a new PMC register frame onto the corresponding frame stack
*/
void
Parrot_push_p(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top;
    regstack_push_entry(interpreter, &interpreter->ctx.pmc_reg_stack);
    top = interpreter->ctx.pmc_reg_stack.top;
    memcpy(&((struct PRegChunkBuf*)top->data.bufstart)->
                    PRegFrame[top->used-1].registers,
           where, sizeof(struct PRegFrame));
}

/*=for api register Parrot_pop_p
  pops a PMC register frame from the corresponding frame stack
*/
void
Parrot_pop_p(struct Parrot_Interp *interpreter, void *where)
{
    struct RegisterChunkBuf* top = interpreter->ctx.pmc_reg_stack.top;
    /* Do we even have anything? */
    if (top->used > 0) {
        struct PRegFrame* irf = &((struct PRegChunkBuf*)top->data.bufstart)->
                    PRegFrame[top->used-1];
        memcpy(where,
               &irf->registers,
               sizeof(struct PRegFrame));
        regstack_pop_entry(interpreter, &interpreter->ctx.pmc_reg_stack);
    }
    /* Nope. So pitch a fit */
    else {
        internal_exception(NO_REG_FRAMES, "No more P register frames to pop!");
    }
}

/*=for api register Parrot_clear_p
  sets each pmc register in the current set to NULL
*/
void
Parrot_clear_p(struct Parrot_Interp *interpreter)
{
    int i;
    for (i = 0; i < NUM_REGISTERS; i++) {
        interpreter->pmc_reg.registers[i] = PMCNULL;
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
