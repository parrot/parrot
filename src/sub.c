/*  sub.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Sub-routines, continuations, co-routines and other fun stuff...
 *  Data Structure and Algorithms:
 *  History:
 *     Initial version by Melvin on 2002/06/6
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/method_util.h"


/*
 * Save current "context" of interpreter.
 */
void
save_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(ctx, &interp->ctx, sizeof(*ctx));
}

/*
 * Save current context of interpreter and mark it copy-on-write
 * We mark the pads and stacks, not the actual context struct.
 * This is used for continuations. Stacks are COW marked to delay
 * stack copying until continuation is activated.
 */
void
cow_copy_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(ctx, &interp->ctx, sizeof(*ctx));
    mark_register_stack_cow(interp, &ctx->int_reg_stack);
    mark_register_stack_cow(interp, &ctx->num_reg_stack);
    mark_register_stack_cow(interp, &ctx->string_reg_stack);
    mark_register_stack_cow(interp, &ctx->pmc_reg_stack);
    stack_mark_cow(ctx->pad_stack);
    stack_mark_cow(ctx->user_stack);
    stack_mark_cow(ctx->control_stack);
    buffer_mark_COW(ctx->warns);
}

/*
 * Set context of interpreter from a context buffer
 */
void
restore_context(struct Parrot_Interp *interp, struct Parrot_Context *ctx)
{
    memcpy(&interp->ctx, ctx, sizeof(*ctx));
}

void
mark_context(struct Parrot_Interp* interpreter, struct Parrot_Context* ctx)
{
    mark_stack(interpreter, ctx->pad_stack);
    mark_stack(interpreter, ctx->user_stack);
    mark_stack(interpreter, ctx->control_stack);
    mark_register_stack(interpreter, &ctx->int_reg_stack);
    mark_register_stack(interpreter, &ctx->num_reg_stack);
    mark_string_register_stack(interpreter, &ctx->string_reg_stack);
    mark_pmc_register_stack(interpreter, &ctx->pmc_reg_stack);
}

static void coro_error(Stack_Entry_t *e)
{
    internal_exception(1, "Coroutine popped main stack");
}

/*
 * the final ctx_stack = interp_stack + saved_stack
 * which then gets swapped with the interp_stack
 */
static void
prepend_stack(struct Parrot_Interp *interp,
                struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk *saved_stack)
{
    size_t i;

    /*
     * if the interp_stack is empty, just put the saved_stack in
     */
    if (stack_height(interp, *interp_stack) == 0) {
        *interp_stack = saved_stack;
        *ctx_stack = *interp_stack;
        return;
    }
    /* save current interp stack */
    *ctx_stack = *interp_stack;
    /* copy the interp stack */
    stack_mark_cow(*interp_stack);
    /* we push a mark on that stack, so if the coroutine pops
     * beyond its own stack into the interpeter stack
     * we can catch this
     */
    stack_push(interp, interp_stack, NULL, STACK_ENTRY_CORO_MARK,
            coro_error);
    /*
     * now append the coroutine stack
     * TODO look if we can do some kind of chunk_copy here
     */
    for (i = 0; i < stack_height(interp, saved_stack); i++) {
        Stack_Entry_t *e = stack_entry(interp, saved_stack, -1 - i);
        stack_push(interp, interp_stack, e, e->entry_type, STACK_CLEANUP_NULL);
    }
}

/*
 * swap interp and ctx stack and save the coroutine only parts of
 * the stack in saved_stack, so effectively undoing above action
 */
static void
restore_stack(struct Parrot_Interp *interp,
                struct Stack_Chunk **interp_stack,
                struct Stack_Chunk **ctx_stack,
                struct Stack_Chunk **saved_stack)
{
    size_t i, hi, hc, hs;
    int mark_found = 0;
    /*
     * if the interp_stack is empty, just restore the stack
     */
    hi = stack_height(interp, *interp_stack);
    if (hi == 0) {
        *interp_stack = *ctx_stack;
        return;
    }
    /*
     * if the saved stack is empty just swap
     */
    hc = stack_height(interp, *ctx_stack);
    if (hc == 0) {
        *saved_stack = *interp_stack;
        *interp_stack = *ctx_stack;
        return;
    }

    /*
     * find our mark, everything above the mark is the real coroutine
     * stack
     */
    for (i = 0; i < hi; i++) {
        Stack_Entry_t *e = stack_entry(interp, *interp_stack, i);
        if (e->cleanup == coro_error) {
            (void)stack_pop(interp, interp_stack, NULL, STACK_ENTRY_CORO_MARK);
            mark_found = 1;
            break;
        }
    }
    if (!mark_found)
        internal_exception(1, "The coroutine messed with the stack");
    hi = stack_height(interp, *interp_stack);
    hs = stack_height(interp, *saved_stack);
    if (!i || (hi == hc + hs)) {
        /* the coroutine didn't change the stack */
        *interp_stack = *ctx_stack;
        return;
    }
    /*
     * walk up again
     * if  interp_stack > ctx_stack + saved_stack
     * the coroutine pushed something on the stack
     * else it popped off items
     */
    for (i = hc; i < stack_height(interp, *interp_stack); i++) {
        if (hi > hc + hs) {
            Stack_Entry_t *e = stack_entry(interp, *interp_stack, -1 - i);
            stack_push(interp, saved_stack, e, e->entry_type,
                    STACK_CLEANUP_NULL);
        }
        else {
            (void)stack_pop(interp, saved_stack, NULL, 0);
        }
    }
    *interp_stack = *ctx_stack;
}

/*
 * XXX: If this routine is specific to coroutine, we should change
 *      the argument to Parrot_Coroutine.
 */
void
swap_context(struct Parrot_Interp *interp, struct PMC *sub)
{
    struct Stack_Chunk * tmp_stack = NULL;
    Buffer * warns;
    struct Parrot_Coroutine* co = (struct Parrot_Coroutine *)PMC_sub(sub);
    struct Parrot_Context *ctx = &co->ctx;
    struct RegisterChunkBuf *reg_top;

    /*
     * Swap user stacks and warnings
     */

    tmp_stack = interp->ctx.user_stack;
    interp->ctx.user_stack = ctx->user_stack;
    ctx->user_stack = tmp_stack;

    warns = interp->ctx.warns;
    interp->ctx.warns = ctx->warns;
    ctx->warns = warns;

    /* swap register frame tops */
    reg_top = interp->ctx.int_reg_stack.top;
    interp->ctx.int_reg_stack.top = ctx->int_reg_stack.top;
    ctx->int_reg_stack.top = reg_top;
    reg_top = interp->ctx.num_reg_stack.top;
    interp->ctx.num_reg_stack.top = ctx->num_reg_stack.top;
    ctx->num_reg_stack.top = reg_top;
    reg_top = interp->ctx.string_reg_stack.top;
    interp->ctx.string_reg_stack.top = ctx->string_reg_stack.top;
    ctx->string_reg_stack.top = reg_top;
    reg_top = interp->ctx.pmc_reg_stack.top;
    interp->ctx.pmc_reg_stack.top = ctx->pmc_reg_stack.top;
    ctx->pmc_reg_stack.top = reg_top;

    /* if calling the coroutine */
    if (!(PObj_get_FLAGS(sub) & PObj_private0_FLAG)) {
        /*
         * construct stacks that have the interpreter stack
         * at bottom and the coroutine stack at top
         */
        prepend_stack(interp, &interp->ctx.control_stack, &ctx->control_stack,
                co->co_control_stack);
        PObj_get_FLAGS(sub) |= PObj_private0_FLAG;
    }
    else {
        PObj_get_FLAGS(sub) &= ~PObj_private0_FLAG;
        restore_stack(interp, &interp->ctx.control_stack, &ctx->control_stack,
                &co->co_control_stack);
    }
    /*
     * TODO FIXME swap the pad_stack or act like the control_stack
     */
#if 1
    tmp_stack = interp->ctx.pad_stack;
    interp->ctx.pad_stack = ctx->pad_stack;
    ctx->pad_stack = tmp_stack;
#endif
}

struct Parrot_Sub *
new_sub(struct Parrot_Interp *interp, size_t size)
{
    /* Using system memory until I figure out GC issues */
    struct Parrot_Sub *newsub =
        mem_sys_allocate_zeroed(size);
    newsub->ctx.warns = interp->ctx.warns;
    buffer_mark_COW(interp->ctx.warns);
    newsub->seg = interp->code->cur_cs;
    return newsub;
}

/*
 * XXX: Need to document semantics in detail
 */
struct Parrot_Sub *
new_closure(struct Parrot_Interp *interp)
{
    struct Parrot_Sub *newsub = new_sub(interp, sizeof(struct Parrot_Sub));
    PMC * pad = scratchpad_get_current(interp);
    newsub->ctx.pad_stack = new_stack(interp, "Pad");
    if (pad) {
        /* put the correct pad in place */
        stack_push(interp, &newsub->ctx.pad_stack, pad,
                STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
    return newsub;
}

struct Parrot_Sub *
new_continuation(struct Parrot_Interp *interp)
{
    struct Parrot_Sub *cc = new_sub(interp, sizeof(struct Parrot_Sub));
    cow_copy_context(interp, &cc->ctx);
    return cc;
}

struct Parrot_Sub *
new_ret_continuation(struct Parrot_Interp *interp)
{
    struct Parrot_Sub *cc = new_sub(interp, sizeof(struct Parrot_Sub));
    save_context(interp, &cc->ctx);
    return cc;
}

/*
 * XXX: Need to document semantics in detail
 */
struct Parrot_Sub *
new_coroutine(struct Parrot_Interp *interp)
{
    PMC * pad;
    struct Parrot_Coroutine *co = (struct Parrot_Coroutine *)new_sub(interp,
            sizeof(struct Parrot_Coroutine));
    struct Parrot_Context *ctx = &co->ctx;
    save_context(interp, ctx);
    /* put in a COWed copy of the user stack */
    ctx->user_stack = interp->ctx.user_stack;
    stack_mark_cow(ctx->user_stack);
    /* create new pad and control stacks,
     * when invoking the coroutine the real stacks are
     * constructed in swap_context
     * XXX decide what to do with pad
     */
    ctx->pad_stack = interp->ctx.pad_stack;
    stack_mark_cow(ctx->pad_stack);

    co->co_control_stack = new_stack(interp, "Control");

    /*
     * XXX probably in swap_context
     */
    pad = scratchpad_get_current(interp);
    if (pad) {
        stack_push(interp, &ctx->pad_stack, pad,
                   STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
    return (struct Parrot_Sub *)co;
}


PMC *
new_ret_continuation_pmc(struct Parrot_Interp * interp, opcode_t * address)
{
    PMC* continuation = pmc_new(interp, enum_class_RetContinuation);
    continuation->cache.struct_val = address;
    return continuation;
}

/*
 * Uses scope_index to find and return the appropriate scope.
 */
static struct Parrot_Lexicals *
scratchpad_index(struct Parrot_Interp* interpreter, PMC* pad,
                 INTVAL scope_index)
{
    /* if scope_index is negative we count out from current pad */
    scope_index = scope_index < 0 ?
        pad->cache.int_val + scope_index : scope_index;

    if (scope_index >= pad->cache.int_val || scope_index < 0) {
        internal_exception(-1, "Pad index out of range");
        return NULL;
    }

    return &(((struct Parrot_Lexicals *)PMC_data(pad))[scope_index]);
}

/*
 * Returns a pointer to the current scratchpad.
 */
PMC *
scratchpad_get_current(struct Parrot_Interp * interp)
{
    return (PMC *)stack_peek(interp, interp->ctx.pad_stack, NULL);
}

/*
 * Returns the position of the lexical variable corresponding to
 * name. If such a variable can not be found the length of the list
 * is returned (i.e. the position that this new lexical should be
 * stored in).
 */
static INTVAL
lexicals_get_position(struct Parrot_Interp * interp,
                      struct Parrot_Lexicals *lex, STRING* name)
{
    STRING * cur;
    INTVAL pos;

    for (pos = 0; pos < list_length(interp, lex->names); pos++) {
        cur = *(STRING**)list_get(interp, lex->names, pos, enum_type_STRING);
        if (cur && string_compare(interp, cur, name) == 0) {
            break;
        }
    }

    return pos;
}

/*
 * Returns first lexical scope and position where name is found, or
 * NULL if it can not be found.
 */
static struct Parrot_Lexicals *
scratchpad_find(struct Parrot_Interp* interp, PMC* pad, STRING * name,
                INTVAL * position)
{
    INTVAL i, pos = 0;
    struct Parrot_Lexicals * lex = NULL;

    for (i = pad->cache.int_val - 1; i >= 0; i--) {
        lex = &(((struct Parrot_Lexicals *)PMC_data(pad))[i]);
        pos = lexicals_get_position(interp, lex, name);
        if (pos == list_length(interp, lex->names))
            lex = NULL;
        else
            break;
    }

    *position = pos;
    return lex;
}

/*
 * Creates and initializes a new Scratchpad PMC.
 */
PMC*
scratchpad_new(struct Parrot_Interp * interp, PMC * base, INTVAL depth)
{
    PMC * pad_pmc;

    Parrot_block_DOD(interp);
    pad_pmc = pmc_new(interp, enum_class_Scratchpad);
    if (base && depth < 0) {
        depth = base->cache.int_val + depth + 1;
    }

    if ((depth < 0)
        || (base && depth > base->cache.int_val)
        || (!base && depth != 0)) {
        Parrot_unblock_DOD(interp);
        internal_exception(-1, "-scratch_pad: too deep\n");
        return NULL;
    }

    /* XXX JPS: should we use a List * here instead? */
    PMC_data(pad_pmc) = mem_sys_allocate((depth + 1) *
                                     sizeof(struct Parrot_Lexicals));

    if (base) {
        /* XXX JPS: I guess this is copying the front, when it should
           be copying the end of the parent (base) */
        memcpy(PMC_data(pad_pmc), PMC_data(base), depth *
               sizeof(struct Parrot_Lexicals));
    }

    pad_pmc->cache.int_val = depth + 1;

    /* in case call to list_new triggers gc */
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].values = NULL;
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].names = NULL;

    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].values =
        list_new(interp, enum_type_PMC);
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].names =
        list_new(interp, enum_type_STRING);

    Parrot_unblock_DOD(interp);

    return pad_pmc;
}

/*
 * Routines for storing and reading lexicals in Scratchpad's. These
 * take both a name and a position, however in general only one of
 * these will be considered. This is to support both by name access
 * and by position (which is faster). If by position access is intended
 * name should be passed as NULL.
 */

void
scratchpad_store(struct Parrot_Interp * interp, PMC * pad,
                 STRING * name, INTVAL position, PMC* value)
{
    struct Parrot_Lexicals * lex;

    if (name) {
        /* use name to find lex and position */
        lex = scratchpad_find(interp, pad, name, &position);
        if (!lex)
            internal_exception(-1, "Lexical '%s' not found",
                               (name == NULL) ? "???"
                               : string_to_cstring(interp, name));
    }
    else {
        /* assume current lexical pad */
        lex = scratchpad_index(interp, pad, -1);
    }

    list_assign(interp, lex->values, position, value, enum_type_PMC);
}

void
scratchpad_store_index(struct Parrot_Interp * interp, PMC * pad,
                       INTVAL scope_index, STRING * name, INTVAL position,
                       PMC* value)
{
    struct Parrot_Lexicals * lex;

    lex = scratchpad_index(interp, pad, scope_index);

    if (name) {
        position = lexicals_get_position(interp, lex, name);
    }

    if (position == list_length(interp, lex->names)) {
        if (!name) {
            /* no name for new variable, give it a default name of "" */
            /* XXX JPS: is this the way to make an empty string? */
            name = string_make(interp, "        ", 9,0,0,0);
        }
        list_assign(interp, lex->names, position, name, enum_type_STRING);
    }

    list_assign(interp, lex->values, position, value, enum_type_PMC);
}

PMC *
scratchpad_get(struct Parrot_Interp * interp, PMC * pad, STRING * name,
               INTVAL position)
{
    struct Parrot_Lexicals * lex = NULL;

    if (!pad)
        return NULL;
    if (name) lex = scratchpad_find(interp, pad, name, &position);
    else lex = scratchpad_index(interp, pad, -1);

    if (!lex)
        return NULL;

    return *(PMC **)list_get(interp, lex->values, position, enum_type_PMC);
}

PMC *
scratchpad_get_index(struct Parrot_Interp * interp, PMC * pad,
                     INTVAL scope_index, STRING * name, INTVAL position)
{
    struct Parrot_Lexicals * lex;

    if (!pad)
        return NULL;
    lex = scratchpad_index(interp, pad, scope_index);

    if (name) {
        position = lexicals_get_position(interp, lex, name);
    }

    if (!lex || position < 0 || position >= list_length(interp, lex->values)) {
        return NULL;
    }

    return *(PMC **)list_get(interp, lex->values, position, enum_type_PMC);
}

void
lexicals_mark(struct Parrot_Interp * interp, struct Parrot_Lexicals *lex)
{
    if (lex->names)
        list_mark(interp, lex->names);
    if (lex->values)
        list_mark(interp, lex->values);
}

void
scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name)
{
    INTVAL pos;
    struct Parrot_Lexicals *lex = scratchpad_find(interp, pad, name, &pos);
    if (lex)
        list_assign(interp, lex->names, pos, NULL, enum_type_STRING);
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
