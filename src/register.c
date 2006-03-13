/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/register.c - Register handling routines

=head1 DESCRIPTION

Parrot has 4 register sets, one for each of its basic types. The amount
of registers in each set varies depending on the use counts of the
respective subroutine and is determined by the PASM/PIR compiler in
the register allocation pass (F<imcc/reg_alloc.c>).

There is one register stack to support the C<saveall> and
C<restoreall> opcodes. The former copies all registers to a newly
allocated storage and points the register base pointers to this
storage. In C<Parrot_pop_regs> the register base pointers are restored
to the previous values and the allocated register memory is discarded.

=head2 Context and Register Allocation Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*
 * Context and register frame layout
 *
 *    +----------++----+------+------------+----+
 *    | context  || N  |  I   |   P        |  S +
 *    +----------++----+------+------------+----+
 *    ^          ^     ^                   ^
 *    |          |     ctx.bp              ctx.bp_ps
 *    ctx.state  opt
 *               padding
 *
 * Registers are addressed as usual via the register base pointer ctx.bp.
 *
 * The macro CONTEXT() hides these details
 *
 */

/*
 * Context and register frame allocation
 *
 * There are two allocation strategies: chunked memory and malloced
 * with a free list.
 *
 * CHUNKED_CTX_MEM = 1
 *
 * C<ctx_mem.data> is a pointer to an allocated chunk of memory.
 * The pointer C<ctx_mem.free> holds the next usable
 * location. With (full) continuations the C<ctx_mem.free> pointer can't be
 * moved below the C<ctx_mem.threshold>, which is the highest context pointer
 * of all active continuations.
 * [the code for this is incomplete; it had suffered some bit-rot and was
 * getting in the way of maintaining the other case.  -- rgr, 4-Feb-06.]
 *
 * TODO GC has to lower this threshold when collecting continuations.
 *
 * CHUNKED_CTX_MEM = 0
 *
 * Context/register memory is malloced. C<ctx_mem.free> is used as a free
 * list of reusable items.
 */

#define CTX_ALLOC_SIZE 0x20000

/*

=item C<static void new_context_mem(Interp *, context_mem *ctx_mem)>

Allocate and initialize context memory chunk.

=item C<void destroy_context(Interp *)>

Free allocated context memory

=item C<void create_initial_context(Interp *)>

Create initial interpreter context.

=cut

*/

#if CHUNKED_CTX_MEM
#error "Non-working code removed."
#endif

void
destroy_context(Interp *interpreter)
{
    int slot;
    void *ptr, *next;

    for (slot = 0; slot < interpreter->ctx_mem.n_free_slots; ++slot) {
        ptr = interpreter->ctx_mem.free_list[slot];
        while (ptr) {
            next = *(void **) ptr;
            mem_sys_free(ptr);
            ptr = next;
        }
    }
    mem_sys_free(interpreter->ctx_mem.free_list);
}

void
create_initial_context(Interp *interpreter)
{
    int i;
    static INTVAL num_regs[] ={32,32,32,32};

    /*
     * create some initial free_list slots
     */
#define INITIAL_FREE_SLOTS 8
    interpreter->ctx_mem.n_free_slots = INITIAL_FREE_SLOTS;
    interpreter->ctx_mem.free_list =
        mem_sys_allocate(INITIAL_FREE_SLOTS * sizeof(void *));
    for (i = 0; i < INITIAL_FREE_SLOTS; ++i)
        interpreter->ctx_mem.free_list[i] = NULL;
    /*
     * For now create context with 32 regs each. Some src tests (and maybe other
     * extenders) are assuming the presence of these registers
     */
    Parrot_alloc_context(interpreter, num_regs);
}

/*

=item C<void parrot_gc_context(Interp *)>

Cleanup dead context memory. Called by the gargabe collector.

=item C<parrot_context_t* Parrot_alloc_context(Interp *, INTVAL *n_regs_used)>

Allocate a new context and set the context pointer. Please note that the register
usage C<n_regs_used> is not copied, just the pointer is stored.
The function returns the new context.

=item C<parrot_context_t* Parrot_push_context(Interp *, INTVAL *n_regs_used)>

Like above, remember old context in C<caller_ctx>, suitable to use with
C<Parrot_pop_context>.

=item C<parrot_context_t* Parrot_dup_context(Interp *, parrot_context_t*)>

Like above but duplicate the passed context.

=item C<void Parrot_set_context_threshold(Interp *, parrot_context_t *ctxp)>

Mark the context as possible threshold.

=item C<void Parrot_free_context(Interp *, parrot_context_t *ctxp, int re_use)>

Free the context. If C<re_use> is true, this function is called by a
return continuation invoke, else from the destructur of a continuation.

=item C<void Parrot_pop_context(Interp *)>

Free the context created with C<Parrot_push_context> and restore the previous
context.

=cut

*/

void
parrot_gc_context(Interp *interpreter)
{
#if CHUNKED_CTX_MEM
    parrot_context_t ctx;

    if (!interpreter->ctx_mem.threshold)
        return;
    LVALUE_CAST(char *, ctx.bp) = interpreter->ctx_mem.threshold -
        sizeof(struct parrot_regs_t);
    /* TODO */
#endif
}

static void
clear_regs(Interp *interpreter, parrot_context_t *ctx)
{
    int i;

    /* NULL out registers
     *
     * if the architecture has 0x := NULL and 0.0 we could memset too
     */
    ctx->bp.regs_i = interpreter->ctx.bp.regs_i;
    ctx->bp_ps.regs_s = interpreter->ctx.bp_ps.regs_s;
    for (i = 0; i < ctx->n_regs_used[REGNO_PMC]; i++) {
        CTX_REG_PMC(ctx, i) = PMCNULL;
    }
    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; i++) {
        CTX_REG_STR(ctx, i) = NULL;
    }
#ifndef NDEBUG
    for (i = 0; i < ctx->n_regs_used[REGNO_INT]; i++) {
        /* depending on -D40 we set int, num to garbage or zero
         */
        if (Interp_debug_TEST(interpreter, PARROT_REG_DEBUG_FLAG)) {
            /* TODO better use rand values */
            CTX_REG_INT(ctx, i) = -999;
        }
        else {
            CTX_REG_INT(ctx, i) = 0;
        }
    }
    for (i = 0; i < ctx->n_regs_used[REGNO_NUM]; i++) {
        /* depending on -D40 we set int, num to garbage or zero
         */
        if (Interp_debug_TEST(interpreter, PARROT_REG_DEBUG_FLAG)) {
            CTX_REG_NUM(ctx, i) = -99.9;
        }
        else {
            CTX_REG_NUM(ctx, i) = 0.0;
        }
    }
#endif
}

static void
init_context(Interp *interpreter, parrot_context_t *ctx, parrot_context_t *old)
{
    ctx->ref_count = 0;                 /* TODO 1 - Exceptions !!! */
    ctx->current_results = NULL;
    ctx->lex_pad = PMCNULL;
    ctx->outer_ctx = NULL;
    ctx->current_cont = NULL;
    ctx->current_method = NULL; /* XXX who clears it? */
    ctx->current_object = NULL; /* XXX who clears it?  */
    ctx->current_HLL = 0;
    if (old) {
        /* some items should better be COW copied */
        ctx->constants = old->constants;
        ctx->reg_stack = old->reg_stack;     /* XXX move into interpreter? */
        ctx->user_stack = old->user_stack;   /* XXX move into interpreter? */
        ctx->control_stack = old->control_stack;
        ctx->warns = old->warns;
        ctx->errors = old->errors;
        ctx->trace_flags = old->trace_flags;
        ctx->runloop_level = old->runloop_level;
	ctx->pred_offset = old->pred_offset;
        ctx->current_HLL = old->current_HLL;
        ctx->current_namespace = old->current_namespace;
        /* end COW */
        ctx->recursion_depth = old->recursion_depth;
    }
    /* other stuff is set inside Sub.invoke */
    clear_regs(interpreter, ctx);
}

struct Parrot_Context *
Parrot_dup_context(Interp *interpreter, struct Parrot_Context *old)
{
    size_t reg_alloc, diff;
    int slot;
    void *ptr;
    struct Parrot_Context *ctx;

    reg_alloc = old->regs_mem_size;
    slot = reg_alloc >> 3;
    ptr = interpreter->ctx_mem.free_list[slot];

    if (ptr) {
        interpreter->ctx_mem.free_list[slot] = *(void **) ptr;
    }
    else {
	ptr = mem_sys_allocate(reg_alloc + ALIGNED_CTX_SIZE);
    }
    CONTEXT(interpreter->ctx) = ctx = ptr;
    ctx->regs_mem_size = reg_alloc;
    ctx->n_regs_used = old->n_regs_used;
    diff = (long*)ctx - (long*)old;
    interpreter->ctx.bp.regs_i += diff;
    interpreter->ctx.bp_ps.regs_s += diff;
    init_context(interpreter, ctx, old);
    return ctx;
}

struct Parrot_Context *
Parrot_push_context(Interp *interpreter, INTVAL *n_regs_used)
{
    struct Parrot_Context *old, *ctx;

    old = CONTEXT(interpreter->ctx);
    ctx = Parrot_alloc_context(interpreter, n_regs_used);
    ctx->caller_ctx = old;
    ctx->current_sub = old->current_sub;  /* doesn't change */
    /* copy more ? */
    return ctx;
}

void
Parrot_pop_context(Interp *interpreter)
{
    struct Parrot_Context *old, *ctx;
    ctx = CONTEXT(interpreter->ctx);
    old = ctx->caller_ctx;

    Parrot_free_context(interpreter, ctx, 1);
    /* restore old, set cached interpreter base pointers */
    CONTEXT(interpreter->ctx) = old;
    interpreter->ctx.bp = old->bp;
    interpreter->ctx.bp_ps = old->bp_ps;
}

struct Parrot_Context *
Parrot_alloc_context(Interp *interpreter, INTVAL *n_regs_used)
{
    struct Parrot_Context *old, *ctx;
    void *ptr, *p;
    int i, n, slot;
    size_t to_alloc, reg_alloc, size_n, size_nip;

    /*
     * TODO (OPT) if we allocate a new context due to a self-recursive call
     *      create a spezialized version that just uses caller's size
     */
    size_n = sizeof(FLOATVAL) * n_regs_used[REGNO_NUM];
    size_nip = size_n +
        sizeof(INTVAL) *   n_regs_used[REGNO_INT] +
        sizeof(PMC*) *     n_regs_used[REGNO_PMC];
    reg_alloc = size_nip +
        sizeof(STRING*) *  n_regs_used[REGNO_STR];

    slot = (reg_alloc + 7) >> 3;
    reg_alloc = slot << 3;
    if (slot >= interpreter->ctx_mem.n_free_slots) {
        n = slot + 1;
        interpreter->ctx_mem.free_list = mem_sys_realloc(
                interpreter->ctx_mem.free_list, n * sizeof(void*));
        for (i = interpreter->ctx_mem.n_free_slots; i < n; ++i)
            interpreter->ctx_mem.free_list[i] = NULL;
        interpreter->ctx_mem.n_free_slots = n;
    }

    ptr = interpreter->ctx_mem.free_list[slot];
    old = CONTEXT(interpreter->ctx);
    if (ptr) {
        interpreter->ctx_mem.free_list[slot] = *(void **) ptr;
    }
    else {
        to_alloc = reg_alloc + ALIGNED_CTX_SIZE;
        if (old)
            ptr = mem_sys_allocate(to_alloc);
        else
            ptr = mem_sys_allocate_zeroed(to_alloc);
    }
#if CTX_LEAK_DEBUG
    if (Interp_debug_TEST(interpreter, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
        fprintf(stderr, "[alloc ctx %p]\n", ptr);
    }
#endif
    CONTEXT(interpreter->ctx) = ctx = ptr;
    ctx->regs_mem_size = reg_alloc;
    ctx->n_regs_used = n_regs_used;
    /* regs start past the context */
    p = (void *) ((char *)ptr + ALIGNED_CTX_SIZE);
    /* ctx.bp points to I0, which has Nx at left */
    interpreter->ctx.bp.regs_i = (INTVAL*)((char*)p + size_n);
    /* this points to S0 */
    interpreter->ctx.bp_ps.regs_s = (STRING**)((char*)p + size_nip);
    init_context(interpreter, ctx, old);
    return ctx;
}

void
Parrot_free_context(Interp *interpreter, parrot_context_t *ctxp, int re_use)
{
    void *ptr;
    int slot;

    /*
     * The context structure has a reference count, initially 0.  This field is
     * incrementented when a continuation that points to it is created -- either
     * directly, or when a continuation is cloned, or when a retcontinuation is
     * converted to a full continuation in invalidate_retc.  To check for leaks,
     * (a) disable NDEBUG, (b) enable CTX_LEAK_DEBUG in interpreter.h, and (c)
     * excecute "debug 0x80" in a (preferably small) test case.
     *
     */
    if (re_use || --ctxp->ref_count == 0) {
#ifndef NDEBUG
        if (Interp_debug_TEST(interpreter, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
            /* can't probably PIO_eprintf here */
            parrot_sub_t doomed = PMC_sub(ctxp->current_sub);
            fprintf(stderr, "[free  ctx %p of sub '%s']\n",
                    ctxp, (char*)doomed->name->strstart);
        }
#endif
        ptr = ctxp;
        slot = ctxp->regs_mem_size >> 3;

        assert(slot < interpreter->ctx_mem.n_free_slots);
        *(void **)ptr = interpreter->ctx_mem.free_list[slot];
        interpreter->ctx_mem.free_list[slot] = ptr;
    }
}

void
Parrot_set_context_threshold(Interp * interpreter, parrot_context_t *ctxp)
{
    /* nothing to do */
}

/*

=back

=head2 Register Stack Functions

=over 4

=item C<void
setup_register_stacks(Interp *)>

Sets up the register stacks.

=item C<void Parrot_push_regs(Interp *)>

Save all registers onto the register stack.

=item C<void Parrot_pop_regs(Interp *)>

Restore all registers from register stack.

=cut

*/

typedef struct {
    Regs_ni  old_bp_ni;   /* restoreall just resets ptrs */
    Regs_ps  old_bp_ps;
    Regs_ps  bp_ps;       /* pushed regs need DOD marking */
    INTVAL   n_regs_pmc;
    INTVAL   n_regs_str;
} save_regs_t;

void
setup_register_stacks(Interp * interpreter)
{
    CONTEXT(interpreter->ctx)->reg_stack =
        register_new_stack(interpreter,
            "Regs_", sizeof(save_regs_t));

}

void
Parrot_push_regs(Interp *interpreter)
{
    Stack_Chunk_t *chunk, **chunk_p;
    save_regs_t   *save_r;
    parrot_context_t *ctx;
    size_t size_nip, size_nips;
    void *ptr;

    ctx = CONTEXT(interpreter->ctx);
    chunk_p = &ctx->reg_stack;
    save_r = stack_prepare_push(interpreter, chunk_p);
    save_r->old_bp_ni.regs_i = ctx->bp.regs_i;
    save_r->old_bp_ps.regs_s = ctx->bp_ps.regs_s;
    save_r->n_regs_str = ctx->n_regs_used[REGNO_STR];
    save_r->n_regs_pmc = ctx->n_regs_used[REGNO_PMC];

    size_nip = _SIZEOF_NUMS + _SIZEOF_INTS + _SIZEOF_PMCS;
    size_nips = size_nip + _SIZEOF_STRS;
    ptr = mem_sys_allocate(size_nips);
    memcpy(ptr, (char*)ctx->bp.regs_i - _SIZEOF_NUMS, size_nips);
    interpreter->ctx.bp_ps.regs_s = ctx->bp_ps.regs_s =
        save_r->bp_ps.regs_s = (void*) ((char*) ptr + size_nip);
    interpreter->ctx.bp.regs_i = ctx->bp.regs_i =
        (void*) ((char*) ptr + _SIZEOF_NUMS);
    chunk = *chunk_p;
    PObj_bufstart(chunk) = ptr;
    PObj_buflen  (chunk) = size_nips;
    PObj_sysmem_SET(chunk);
}

void
Parrot_pop_regs(Interp* interpreter)
{
    Stack_Chunk_t *chunk, **chunk_p;
    save_regs_t   *save_r;
    parrot_context_t *ctx;

    ctx = CONTEXT(interpreter->ctx);
    chunk_p = &ctx->reg_stack;
    chunk = *chunk_p;
    save_r = stack_prepare_pop(interpreter, chunk_p);

    /* restore register base pointers */
    interpreter->ctx.bp.regs_i    = ctx->bp.regs_i    =
        save_r->old_bp_ni.regs_i;
    interpreter->ctx.bp_ps.regs_s = ctx->bp_ps.regs_s =
        save_r->old_bp_ps.regs_s;
    /* deal with allocated memory, GC handles the chunk itself */
    mem_sys_free(PObj_bufstart(chunk));
    PObj_bufstart(chunk) = NULL;
    PObj_buflen  (chunk) = 0;
    PObj_sysmem_CLEAR(chunk);
}

/*

=item C<void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* stack)>

Marks the register stack and it's registers as live.

=cut

*/

void
mark_register_stack(Parrot_Interp interpreter, Stack_Chunk_t* chunk)
{
    int i;
    PObj *obj;
    struct Interp_Context ctx;
    save_regs_t   *save_r;

    for (; ; chunk = chunk->prev) {
        pobject_lives(interpreter, (PObj*)chunk);
        if (chunk == chunk->prev)
            break;
        save_r = (save_regs_t *)STACK_DATAP(chunk);
        ctx.bp.regs_i    = NULL;
        ctx.bp_ps.regs_p = save_r->old_bp_ps.regs_p;
        for (i = 0; i < save_r->n_regs_pmc; ++i) {
            obj = (PObj *)CTX_REG_PMC(&ctx, i);
            if (obj)
                pobject_lives(interpreter, obj);
        }
        for (i = 0; i < save_r->n_regs_str; ++i) {
            obj = (PObj *)CTX_REG_STR(&ctx, i);
            if (obj)
                pobject_lives(interpreter, obj);
        }
    }
}


void
Parrot_clear_i(Interp *interpreter)
{
    int i;
    for (i = 0; i < CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT]; ++i)
        REG_INT(i) = 0;
}

void
Parrot_clear_s(Interp *interpreter)
{
    int i;
    for (i = 0; i < CONTEXT(interpreter->ctx)->n_regs_used[REGNO_STR]; ++i)
        REG_STR(i) = NULL;
}

void
Parrot_clear_p(Interp *interpreter)
{
    int i;
    for (i = 0; i < CONTEXT(interpreter->ctx)->n_regs_used[REGNO_PMC]; ++i)
        REG_PMC(i) = PMCNULL;
}

void
Parrot_clear_n(Interp *interpreter)
{
    int i;
    for (i = 0; i < CONTEXT(interpreter->ctx)->n_regs_used[REGNO_NUM]; ++i)
        REG_NUM(i) = 0.0;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/register.h> and F<src/stack_common.c>

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
