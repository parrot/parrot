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
setup_register_stacks(Parrot_Interp interpreter)
{
    struct RegisterChunkBuf* buf;
    make_bufferlike_pool(interpreter, sizeof(struct RegisterChunkBuf));

    Parrot_block_DOD(interpreter);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct IRegChunkBuf));
    interpreter->ctx.int_reg_stack.top = buf;
    interpreter->ctx.int_reg_stack.chunk_size = sizeof(struct IRegChunkBuf);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct SRegChunkBuf));
    interpreter->ctx.string_reg_stack.top = buf;
    interpreter->ctx.string_reg_stack.chunk_size = sizeof(struct SRegChunkBuf);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct NRegChunkBuf));
    interpreter->ctx.num_reg_stack.top = buf;
    interpreter->ctx.num_reg_stack.chunk_size = sizeof(struct NRegChunkBuf);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct PRegChunkBuf));
    interpreter->ctx.pmc_reg_stack.top = buf;
    interpreter->ctx.pmc_reg_stack.chunk_size = sizeof(struct PRegChunkBuf);

    Parrot_unblock_DOD(interpreter);
}

void
mark_register_stack(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
    }
}

void
mark_pmc_register_stack(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    UINTVAL i, j;
    for (chunk = stack->top; chunk;
            chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
        for (i = 0; i < chunk->used; i++) {
            struct PRegFrame *pf =
                ((struct PRegChunkBuf*)chunk->data.bufstart)->PRegFrame;
            for (j = 0; j < NUM_REGISTERS/2; j++) {
                PObj* reg = (PObj*) pf[i].registers[j];
                if (reg)
                    pobject_lives(interpreter, reg);
            }
        }
    }
}

void
mark_string_register_stack(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    UINTVAL i, j;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
        for (i = 0; i < chunk->used; i++) {
            struct SRegFrame *sf =
                ((struct SRegChunkBuf*)chunk->data.bufstart)->SRegFrame;
            for (j = 0; j < NUM_REGISTERS/2; j++) {
                PObj* reg = (PObj*) sf[i].registers[j];
                if (reg)
                    pobject_lives(interpreter, reg);
            }
        }
    }
}

void
mark_register_stack_cow(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        PObj_COW_SET((PObj*)chunk);
    }
}

static struct RegisterChunkBuf*
regstack_copy_chunk(Parrot_Interp interpreter,
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

static struct RegisterChunkBuf*
regstack_push_entry(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* top = stack->top;
    /* Before we change anything, is this a read-only stack? */
    if (PObj_COW_TEST((PObj*)top))
        top = stack->top = regstack_copy_chunk(interpreter, top, stack);
    /* If we can stay in the current frame, we will.  Else make a new chunk */
    if (top->used < FRAMES_PER_CHUNK) {
        top->used++;
        return top;
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
        return buf;
    }
}

static void
regstack_pop_entry(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* top = stack->top;
    if (top->used > 1) {
        /* Before we change anything, is this a read-only stack? */
        if (PObj_COW_TEST((PObj*)top))
            top = stack->top =
                regstack_copy_chunk(interpreter, stack->top, stack);
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
                top = stack->top =
                    regstack_copy_chunk(interpreter, stack->top, stack);
            top->used--;
        }
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

#define REG_PUSH Parrot_push_i
#define REG_POP Parrot_pop_i
#define REG_CLEAR Parrot_clear_i
#define REG_STACK int_reg_stack
#define REG_TYPE int_reg
#define REG_CHUNK_BUF IRegChunkBuf
#define REG_FRAME IRegFrame
#define REG_EXCEPTION_STRING "No more I register frames to pop!"
#define REG_NULL 0
#include "generic_register.c"

#define REG_PUSH Parrot_push_s
#define REG_POP Parrot_pop_s
#define REG_CLEAR Parrot_clear_s
#define REG_STACK string_reg_stack
#define REG_TYPE string_reg
#define REG_CHUNK_BUF SRegChunkBuf
#define REG_FRAME SRegFrame
#define REG_EXCEPTION_STRING "No more S register frames to pop!"
#define REG_NULL NULL
#include "generic_register.c"

#define REG_PUSH Parrot_push_n
#define REG_POP Parrot_pop_n
#define REG_CLEAR Parrot_clear_n
#define REG_STACK num_reg_stack
#define REG_TYPE num_reg
#define REG_CHUNK_BUF NRegChunkBuf
#define REG_FRAME NRegFrame
#define REG_EXCEPTION_STRING "No more N register frames to pop!"
#define REG_NULL 0.0
#include "generic_register.c"

#define REG_PUSH Parrot_push_p
#define REG_POP Parrot_pop_p
#define REG_CLEAR Parrot_clear_p
#define REG_STACK pmc_reg_stack
#define REG_TYPE pmc_reg
#define REG_CHUNK_BUF PRegChunkBuf
#define REG_FRAME PRegFrame
#define REG_EXCEPTION_STRING "No more P register frames to pop!"
#define REG_NULL PMCNULL
#include "generic_register.c"


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
