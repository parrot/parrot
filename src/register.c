/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/register.c - Register handling routines

=head1 DESCRIPTION

Parrot has 4 register sets, one for each of its basic types. There are
32 registers in each set.

Each register set has a register frame stack for saving and restoring
its contents. Note that, whereas the C<push{i,n,s,p}> opcodes push all
32 registers on to the stack, in the C implementation a register frame
is actually only I<half> the register set. The opcode calls the the
C<Parrot_push_{i,n,s,p}()> function twice, once for each half of the
set.

=head2 C Implementation

As the registers and register frame stacks for the various types share
essentially the same structure we'll take as our example the integer
registers and their register frame stack.

Each instance of C<Parrot_Interp> contains an C<IReg> which in turn
contains an array of 32 (i.e. C<NUM_REGISTER>) C<INTVAL>s. This array is
the integer register set.

The register frame stacks are contained within the interpreter's
C<Parrot_Context>. This context contains a pointer to an C<IRegChunk>
which is the top of the integer register frame stack. The C<IRegChunk>
contains an array of 16 (i.e. C<FRAMES_PER_CHUNK>) C<IRegFrame>s, with
each C<IRegFrame> containing an array of 16 (i.e. C<NUM_REGISTER / 2>)
C<INTVAL>s.

The top frame is always C<used - 1>. When C<used> indicates that a new
C<IRegChunk> should be created, it is allocated with
C<mem_sys_allocate()> and the C<int_reg_top>, C<previous>, C<next>
pointers set accordingly. Popping register frames from the stack
decrements C<used>. Chunks are reclaimed with C<mem_sys_free()>.

Note that C<int_reg_top>'s C<next> is always empty - it I<is> the top of
the stack.

In the cases of C<STRING> and C<PMC> the C<registers> arrays contain
pointers.

=head2 Functions

Note that the API header for this file is F<include/parrot/regfuncs.h>
not F<include/parrot/register.h> - that contains the various registers
and register frame stacks.

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<void
setup_register_stacks(Parrot_Interp interpreter)>

Sets up the register stacks.

=cut

*/

void
setup_register_stacks(Parrot_Interp interpreter)
{
    struct RegisterChunkBuf* buf;
    make_bufferlike_pool(interpreter, sizeof(struct RegisterChunkBuf));

    Parrot_block_DOD(interpreter);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct IRegChunkBuf));
    interpreter->ctx.int_reg_stack.top = buf;
    interpreter->ctx.int_reg_stack.frame_size = sizeof(struct IRegFrame);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct SRegChunkBuf));
    interpreter->ctx.string_reg_stack.top = buf;
    interpreter->ctx.string_reg_stack.frame_size = sizeof(struct SRegFrame);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct NRegChunkBuf));
    interpreter->ctx.num_reg_stack.top = buf;
    interpreter->ctx.num_reg_stack.frame_size = sizeof(struct NRegFrame);

    buf = new_bufferlike_header(interpreter, sizeof(struct RegisterChunkBuf));
    Parrot_allocate_zeroed(interpreter, buf, sizeof(struct PRegChunkBuf));
    interpreter->ctx.pmc_reg_stack.top = buf;
    interpreter->ctx.pmc_reg_stack.frame_size = sizeof(struct PRegFrame);

    Parrot_unblock_DOD(interpreter);
}

/*

=item C<void
mark_register_stack(Parrot_Interp interpreter, struct RegStack* stack)>

Marks the contents of the register stacks as live.

=cut

*/

void
mark_register_stack(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        pobject_lives(interpreter, (PObj*)chunk);
    }
}

/*

=item C<void
mark_pmc_register_stack(Parrot_Interp interpreter, struct RegStack* stack)>

Marks the PMC register stack as live.

=cut

*/

void
mark_pmc_register_stack(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    UINTVAL i, j;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        struct PRegChunkBuf* pc = chunk->data.bufstart;
        pobject_lives(interpreter, (PObj*)chunk);
        for (i = 0; i < chunk->used; i++) {
            struct PRegFrame *pf = &pc->PRegFrame[i];
            for (j = 0; j < NUM_REGISTERS/2; j++) {
                PObj* reg = (PObj*) pf->registers[j];
                if (reg)
                    pobject_lives(interpreter, reg);
            }
        }
    }
}

/*

=item C<void
mark_string_register_stack(Parrot_Interp interpreter, struct RegStack* stack)>

Mark the contents of the string register stack as live.

=cut

*/

void
mark_string_register_stack(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    UINTVAL i, j;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        struct SRegChunkBuf* sc = chunk->data.bufstart;
        pobject_lives(interpreter, (PObj*)chunk);
        for (i = 0; i < chunk->used; i++) {
            struct SRegFrame *sf = &sc->SRegFrame[i];
            for (j = 0; j < NUM_REGISTERS/2; j++) {
                PObj* reg = (PObj*) sf->registers[j];
                if (reg)
                    pobject_lives(interpreter, reg);
            }
        }
    }
}

/*

=item C<void
mark_register_stack_cow(Parrot_Interp interpreter, struct RegStack* stack)>

Marks the contents of the register stacks as Copy on Write.

=cut

*/

void
mark_register_stack_cow(Parrot_Interp interpreter, struct RegStack* stack)
{
    struct RegisterChunkBuf* chunk;
    for (chunk = stack->top; chunk; chunk = chunk->next) {
        PObj_COW_SET((PObj*)chunk);
    }
}

/*

=item C<static struct RegisterChunkBuf*
regstack_copy_chunk(Parrot_Interp interpreter,
                    struct RegisterChunkBuf* chunk,
                    struct RegStack* stack)>

Copies the specified register stack chunk.

=cut

*/

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
    Parrot_allocate(interpreter, buf, stack->frame_size * FRAMES_PER_CHUNK);
    Parrot_unblock_DOD(interpreter);

    memcpy(buf->data.bufstart, chunk->data.bufstart,
                stack->frame_size * chunk->used);
    return buf;
}

/*

=item C<static struct RegisterChunkBuf*
regstack_push_entry(Parrot_Interp interpreter, struct RegStack* stack)>

Pushes the entry on the specified register stack.

=cut

*/

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
        Parrot_allocate(interpreter, (PObj*)buf,
                    stack->frame_size * FRAMES_PER_CHUNK);
        Parrot_unblock_DOD(interpreter);

        buf->used = 1;
        buf->next = top;

        stack->top = buf;
        return buf;
    }
}

/*

=item C<static void
regstack_pop_entry(Parrot_Interp interpreter, struct RegStack* stack)>

Pushes the entry on the specified register stack.

=cut

*/

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

/*

=item C<void
Parrot_push_on_stack(void *thing, INTVAL size, INTVAL type)>

Unimplemented at present.

=cut

*/

void
Parrot_push_on_stack(void *thing, INTVAL size, INTVAL type)
{
    UNUSED(thing);
    UNUSED(size);
    UNUSED(type);
}

/*

=item C<void
Parrot_pop_off_stack(void *thing, INTVAL type)>

Unimplemented at present.

=cut

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

=back

=head1 SEE ALSO

F<include/parrot/register.h> and F<include/parrot/regfuncs.h>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
