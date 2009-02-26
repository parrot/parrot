/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/gc/register.c - Register handling routines

=head1 DESCRIPTION

Parrot has 4 register sets, one for each of its basic types. The number of
registers in each set varies depending on the use counts of the subroutine and
is determined by the PASM/PIR compiler in the register allocation pass
(F<imcc/reg_alloc.c>).

=cut

*/

#include "parrot/parrot.h"
#include "parrot/register.h"
#include "../pmc/pmc_sub.h"


/* set CTX_LEAK_DEBUG_FULL to 1 for enhanced context debugging.
 * When set (1) freed contexts are "poisoned" so that any dangling
 * references produce segfaults, and (2) contexts are not recycled
 * so that later allocations don't suddenly restore a dangling
 * reference to a "working" condition.
 */
#define CTX_LEAK_DEBUG_FULL 0



/* HEADERIZER HFILE: include/parrot/register.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void clear_regs(PARROT_INTERP, ARGMOD(Parrot_Context *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ctx);

static void init_context(PARROT_INTERP,
    ARGMOD(Parrot_Context *ctx),
    ARGIN_NULLOK(const Parrot_Context *old))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ctx);

#define ASSERT_ARGS_clear_regs __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
#define ASSERT_ARGS_init_context __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ctx)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*
=head2 Context and register frame layout

    +----------++----+------+------------+----+
    | context  || N  |  I   |   P        |  S +
    +----------++----+------+------------+----+
    ^          ^     ^                   ^
    |          |     ctx.bp              ctx.bp_ps
    ctx.state  opt
               padding

Registers are addressed as usual via the register base pointer ctx.bp.

The macro CONTEXT() hides these details

=cut

*/

/*
=head2 Context and register frame allocation

There are two allocation strategies: chunked memory and malloced with a free
list.

 CHUNKED_CTX_MEM = 1

C<ctx_mem.data> is a pointer to an allocated chunk of memory.  The pointer
C<ctx_mem.free> holds the next usable location. With (full) continuations the
C<ctx_mem.free> pointer can't be moved below the C<ctx_mem.threshold>, which is
the highest context pointer of all active continuations.

[the code for this is incomplete; it had suffered some bit-rot and was
getting in the way of maintaining the other case.  -- rgr, 4-Feb-06.]

RT #46177 GC has to lower this threshold when collecting continuations.

 CHUNKED_CTX_MEM = 0

Context/register memory is malloced. C<ctx_mem.free> is used as a free list of
reusable items.

=cut

*/

#define CTX_ALLOC_SIZE 0x20000

#define ALIGNED_CTX_SIZE (((sizeof (Parrot_Context) + NUMVAL_SIZE - 1) \
        / NUMVAL_SIZE) * NUMVAL_SIZE)

/*

=pod

Round register allocation size up to the nearest multiple of 8. A granularity
of 8 is arbitrary, it could have been some bigger power of 2. A "slot" is an
index into the free_list array. Each slot in free_list has a linked list of
pointers to already allocated contexts available for (re)use.  The slot where
an available context is stored corresponds to the size of the context.

=cut

*/

#define SLOT_CHUNK_SIZE 8

#define ROUND_ALLOC_SIZE(size) ((((size) + SLOT_CHUNK_SIZE - 1) \
        / SLOT_CHUNK_SIZE) * SLOT_CHUNK_SIZE)
#define CALCULATE_SLOT_NUM(size) ((size) / SLOT_CHUNK_SIZE)

#if CHUNKED_CTX_MEM
 #  error "Non-working code removed."
#endif

/*

=head2 Context and Register Allocation Functions

=over 4

=cut

*/

/*

=item C<void destroy_context>

Frees allocated context memory.

=cut

*/

void
destroy_context(PARROT_INTERP)
{
    ASSERT_ARGS(destroy_context)
    Parrot_Context *context = CONTEXT(interp);
    int             slot;

    while (context) {
        Parrot_Context * const prev = context->caller_ctx;
        Parrot_free_context(interp, context, 1);
        context = prev;
    }

    /* clear freed contexts */
    for (slot = 0; slot < interp->ctx_mem.n_free_slots; ++slot) {
        void *ptr = interp->ctx_mem.free_list[slot];
        while (ptr) {
            void * const next = *(void **) ptr;
            mem_sys_free(ptr);
            ptr = next;
        }
    }
    mem_sys_free(interp->ctx_mem.free_list);
}


/*

=item C<void create_initial_context>

Creates the interpreter's initial context.

=cut

*/

void
create_initial_context(PARROT_INTERP)
{
    ASSERT_ARGS(create_initial_context)
    static INTVAL   num_regs[] = {32, 32, 32, 32};
    Parrot_Context *ignored;

    /* Create some initial free_list slots. */

#define INITIAL_FREE_SLOTS 8
    interp->ctx_mem.n_free_slots = INITIAL_FREE_SLOTS;
    interp->ctx_mem.free_list    = mem_allocate_n_zeroed_typed(INITIAL_FREE_SLOTS, void *);

    /* For now create context with 32 regs each. Some src tests (and maybe
     * other extenders) assume the presence of these registers */
    ignored = Parrot_set_new_context(interp, num_regs);
    UNUSED(ignored);
}


/*

=item C<void parrot_gc_context>

Cleans up dead context memory; called by the garbage collector.  This only
applies in the chunked context memory scheme.

=cut

*/

PARROT_EXPORT
void
parrot_gc_context(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_gc_context)
#if CHUNKED_CTX_MEM
    Parrot_Context ctx;
    ASSERT_ARGS(parrot_gc_context)

    if (!interp->ctx_mem.threshold)
        return;
    LVALUE_CAST(char *, ctx.bp) = interp->ctx_mem.threshold
                                - sizeof (parrot_regs_t);
#else
    UNUSED(interp);
#endif
}


/*

=item C<static void clear_regs>

Clears all registers in a context.  PMC and STRING registers contain PMCNULL
and NULL, respectively.  Integer and float registers contain negative flag
values, for debugging purposes.

=cut

*/

static void
clear_regs(PARROT_INTERP, ARGMOD(Parrot_Context *ctx))
{
    ASSERT_ARGS(clear_regs)
    int i;

    /* NULL out registers - P/S have to be NULL for GC
     *
     * if the architecture has 0x := NULL and 0.0 we could memset too
     */

    for (i = 0; i < ctx->n_regs_used[REGNO_PMC]; i++) {
        CTX_REG_PMC(ctx, i) = PMCNULL;
    }

    for (i = 0; i < ctx->n_regs_used[REGNO_STR]; i++) {
        CTX_REG_STR(ctx, i) = NULL;
    }

    if (Interp_debug_TEST(interp, PARROT_REG_DEBUG_FLAG)) {
        /* depending on -D40 we set int, num to garbage different garbage
         * RT #46179 remove this code for parrot 1.0 */
        for (i = 0; i < ctx->n_regs_used[REGNO_INT]; i++) {
            CTX_REG_INT(ctx, i) = -999;
        }
        for (i = 0; i < ctx->n_regs_used[REGNO_NUM]; i++) {
            CTX_REG_NUM(ctx, i) = -99.9;
        }
    }
    else {
        for (i = 0; i < ctx->n_regs_used[REGNO_INT]; i++) {
            CTX_REG_INT(ctx, i) = -888;
        }
        for (i = 0; i < ctx->n_regs_used[REGNO_NUM]; i++) {
            CTX_REG_NUM(ctx, i) = -88.8;
        }
    }
}


/*

=item C<static void init_context>

Initializes a freshly allocated or recycled context.

=cut

*/

static void
init_context(PARROT_INTERP, ARGMOD(Parrot_Context *ctx),
        ARGIN_NULLOK(const Parrot_Context *old))
{
    ASSERT_ARGS(init_context)
    ctx->ref_count         = 0;
    ctx->gc_mark           = 0;
    ctx->current_results   = NULL;
    ctx->results_signature = NULL;
    ctx->lex_pad           = PMCNULL;
    ctx->outer_ctx         = NULL;
    ctx->current_cont      = NULL;
    ctx->current_object    = NULL;
    ctx->current_HLL       = 0;
    ctx->handlers          = PMCNULL;

    if (old) {
        /* some items should better be COW copied */
        ctx->constants         = old->constants;
        ctx->warns             = old->warns;
        ctx->errors            = old->errors;
        ctx->trace_flags       = old->trace_flags;
        ctx->pred_offset       = old->pred_offset;
        ctx->current_HLL       = old->current_HLL;
        ctx->current_namespace = old->current_namespace;
        /* end COW */
        ctx->recursion_depth   = old->recursion_depth;
    }

    /* other stuff is set inside Sub.invoke */
    clear_regs(interp, ctx);
}


/*

=item C<Parrot_Context * Parrot_push_context>

Creates and sets the current context to a new context, remembering the old
context in C<caller_ctx>.  Suitable to use with C<Parrot_pop_context>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Parrot_Context *
Parrot_push_context(PARROT_INTERP, ARGIN(const INTVAL *n_regs_used))
{
    ASSERT_ARGS(Parrot_push_context)
    Parrot_Context * const old = CONTEXT(interp);
    Parrot_Context * const ctx = Parrot_set_new_context(interp, n_regs_used);

    ctx->caller_ctx  = old;

    /* doesn't change */
    ctx->current_sub = old->current_sub;

    /* copy more ? */
    return ctx;
}


/*

=item C<void Parrot_pop_context>

Frees the context created with C<Parrot_push_context> and restores the previous
context (the caller context).

=cut

*/

PARROT_EXPORT
void
Parrot_pop_context(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_pop_context)
    Parrot_Context * const ctx = CONTEXT(interp);
    Parrot_Context * const old = ctx->caller_ctx;

#if CTX_LEAK_DEBUG
    if (ctx->ref_count > 0 &&
            Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
        fprintf(stderr, "[force recycle of context %p (%d refs)]\n",
            (void *)ctx, ctx->ref_count);
    }
#endif
    ctx->ref_count = 0;
    Parrot_free_context(interp, ctx, 0);

    /* restore old, set cached interpreter base pointers */
    CONTEXT(interp)      = old;
    interp->ctx.bp       = old->bp;
    interp->ctx.bp_ps    = old->bp_ps;
}


/*

=item C<Parrot_Context * Parrot_alloc_context>

Allocates and returns a new context.  Does not set this new context as the
current context. Note that the register usage C<n_regs_used> is copied.  Use
the init flag to indicate whether you want to initialize the new context
(setting its default values and clearing its registers).

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Parrot_Context *
Parrot_alloc_context(PARROT_INTERP, ARGIN(const INTVAL *number_regs_used),
    ARGIN_NULLOK(Parrot_Context *old))
{
    ASSERT_ARGS(Parrot_alloc_context)
    Parrot_Context *ctx;
    void *p;

    const size_t size_i = sizeof (INTVAL)   * number_regs_used[REGNO_INT];
    const size_t size_n = sizeof (FLOATVAL) * number_regs_used[REGNO_NUM];
    const size_t size_s = sizeof (STRING *) * number_regs_used[REGNO_STR];
    const size_t size_p = sizeof (PMC *)    * number_regs_used[REGNO_PMC];

    const size_t size_nip      = size_n + size_i + size_p;
    const size_t all_regs_size = size_n + size_i + size_p + size_s;
    const size_t reg_alloc     = ROUND_ALLOC_SIZE(all_regs_size);
    const int    slot          = CALCULATE_SLOT_NUM(reg_alloc);

    /* this gets attached to the context, which should free it */
    INTVAL * const n_regs_used = mem_allocate_n_zeroed_typed(4, INTVAL);
    n_regs_used[REGNO_INT]     = number_regs_used[REGNO_INT];
    n_regs_used[REGNO_NUM]     = number_regs_used[REGNO_NUM];
    n_regs_used[REGNO_STR]     = number_regs_used[REGNO_STR];
    n_regs_used[REGNO_PMC]     = number_regs_used[REGNO_PMC];

    /*
     * If slot is beyond the end of the allocated list, extend the list to
     * allocate more slots.
     */
    if (slot >= interp->ctx_mem.n_free_slots) {
        const int extend_size = slot + 1;
        int i;

        mem_realloc_n_typed(interp->ctx_mem.free_list, extend_size, void *);
        for (i = interp->ctx_mem.n_free_slots; i < extend_size; ++i)
            interp->ctx_mem.free_list[i] = NULL;
        interp->ctx_mem.n_free_slots = extend_size;
    }

    /*
     * The free_list contains a linked list of pointers for each size (slot
     * index). Pop off an available context of the desired size from free_list.
     * If no contexts of the desired size are available, allocate a new one.
     */
    ctx = (Parrot_Context *)interp->ctx_mem.free_list[slot];

    if (ctx) {
        /*
         * Store the next pointer from the linked list for this size (slot
         * index) in free_list. On "*(void **) ctx", C won't dereference a void
         * * pointer (untyped), so type cast ctx to void ** (a dereference-able
         * type) then dereference it to get a void *. Store the dereferenced
         * value (the next pointer in the linked list) in free_list.
         */
        interp->ctx_mem.free_list[slot] = *(void **)ctx;
    }
    else {
        const size_t to_alloc = reg_alloc + ALIGNED_CTX_SIZE;
        ctx                   = (Parrot_Context *)mem_sys_allocate_zeroed(to_alloc);
    }

#if CTX_LEAK_DEBUG
    if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
        fprintf(stderr, "[alloc ctx %p]\n", ctx);
    }
#endif

    ctx->regs_mem_size   = reg_alloc;
    ctx->n_regs_used     = n_regs_used;

    /* regs start past the context */
    p   = (void *) ((char *)ctx + ALIGNED_CTX_SIZE);

    /* ctx.bp points to I0, which has Nx on the left */
    ctx->bp.regs_i = (INTVAL *)((char *)p + size_n);

    /* ctx.bp_ps points to S0, which has Px on the left */
    ctx->bp_ps.regs_s = (STRING **)((char *)p + size_nip);

    init_context(interp, ctx, old);

    return ctx;
}


/*

=item C<Parrot_Context * Parrot_set_new_context>

Allocates and returns a new context as the current context.  Note that the
register usage C<n_regs_used> is copied.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Parrot_Context *
Parrot_set_new_context(PARROT_INTERP, ARGIN(const INTVAL *number_regs_used))
{
    ASSERT_ARGS(Parrot_set_new_context)
    Parrot_Context *old = CONTEXT(interp);
    Parrot_Context *ctx = Parrot_alloc_context(interp, number_regs_used, old);

    CONTEXT(interp)          = ctx;
    interp->ctx.bp.regs_i    = ctx->bp.regs_i;
    interp->ctx.bp_ps.regs_s = ctx->bp_ps.regs_s;

    return ctx;
}


/*

=item C<void Parrot_free_context>

Frees the context if its reference count is zero.  If C<deref>
is true, then reduce the reference count prior to determining
if the context should be freed.

=cut

*/

PARROT_EXPORT
void
Parrot_free_context(PARROT_INTERP, ARGMOD(Parrot_Context *ctx), int deref)
{
    ASSERT_ARGS(Parrot_free_context)
    /*
     * The context structure has a reference count, initially 0.
     * This field is incremented when something outside of the normal
     * calling chain (such as a continuation or outer scope) wants to
     * preserve the context.  The field is decremented when
     * Parrot_free_context is called with the C<deref> flag set true.
     * To trace context handling and check for leaks,
     * (a) disable NDEBUG, (b) enable CTX_LEAK_DEBUG in interpreter.h,
     * and (c) execute "debug 0x80" in a (preferably small) test case.
     *
     */
    if (deref) {
#if CTX_LEAK_DEBUG
        if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
            fprintf(stderr, "[reference to context %p released]\n", (void*)ctx);
        }
#endif
        ctx->ref_count--;
    }
    if (ctx->ref_count <= 0) {
        void *ptr;
        int slot;

#ifndef NDEBUG
        if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)
            && ctx->current_sub) {
            /* can't probably Parrot_io_eprintf here */
            Parrot_sub *doomed;
            PMC_get_sub(interp, ctx->current_sub, doomed);

            if (doomed) {
                fprintf(stderr, "[free  ctx %p of sub '%s']\n",
                        (void *)ctx,
                        (doomed->name == (void*)0xdeadbeef
                        ? "???"
                        : (char*)doomed->name->strstart));
            }
            else {
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "NULL doomed sub detected in Parrot_free_context");
            }
        }
#endif

        if (ctx->outer_ctx)
            Parrot_free_context(interp, ctx->outer_ctx, 1);

        if (ctx->n_regs_used) {
            mem_sys_free(ctx->n_regs_used);
            ctx->n_regs_used = NULL;
        }

#if CTX_LEAK_DEBUG_FULL
        /* for debugging, poison the freed context in case anything
         * tries to use it later. */
        ctx->current_results   = (opcode_t *)0xbeefcafe;
        ctx->results_signature = (PMC *)0xbeefcafe;
        ctx->lex_pad           = (PMC *)0xbeefcafe;
        ctx->outer_ctx         = (Parrot_Context *)0xbeefcafe;
        ctx->current_cont      = (PMC *)0xbeefcafe;
        ctx->current_object    = (PMC *)0xbeefcafe;
        ctx->current_HLL       = -1;
        ctx->handlers          = (PMC *)0xbeefcafe;
        ctx->constants         = (struct PackFile_Constant **)0xbeefcafe;
        ctx->current_namespace = (PMC *)0xbeefcafe;
#endif

        /* don't put the same context on the free list multiple times; we don't
         * have the re-use versus multiple ref count semantics right yet */
        if (ctx->ref_count < 0)
            return;

        /* force the reference count negative to indicate a dead context
         * so mark_context (src/sub.c) can report it */
        ctx->ref_count--;

        ptr             = ctx;
        slot            = CALCULATE_SLOT_NUM(ctx->regs_mem_size);

#if CTX_LEAK_DEBUG_FULL
        slot = 0;
#endif

        PARROT_ASSERT(slot < interp->ctx_mem.n_free_slots);
        *(void **)ptr                   = interp->ctx_mem.free_list[slot];
        interp->ctx_mem.free_list[slot] = ptr;
    }
}


/*

=item C<Parrot_Context * Parrot_context_ref_trace>

Helper function to trace references when CTX_LEAK_DEBUG is set.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Context *
Parrot_context_ref_trace(PARROT_INTERP, ARGMOD(Parrot_Context *ctx),
        ARGIN(const char *file), int line)
{
    ASSERT_ARGS(Parrot_context_ref_trace)
    if (Interp_debug_TEST(interp, PARROT_CTX_DESTROY_DEBUG_FLAG)) {
        const char *name = "unknown";
        Parrot_sub *sub;

        PMC_get_sub(interp, ctx->current_sub, sub);
        if (ctx->current_sub)
            name = (char *)(sub->name->strstart);

        fprintf(stderr, "[reference to context %p ('%s') taken at %s:%d]\n",
                (void *)ctx, name, file, line);
    }

    ctx->ref_count++;
    return ctx;
}


/*

=item C<void Parrot_set_context_threshold>

Marks the context as possible threshold.

=cut

*/

PARROT_EXPORT
void
Parrot_set_context_threshold(SHIM_INTERP, SHIM(Parrot_Context *ctx))
{
    ASSERT_ARGS(Parrot_set_context_threshold)
    /* nothing to do */
}

/*

=back

=head2 Register Stack Functions

=over 4

=cut

=item C<void Parrot_clear_i>

Sets all integer registers in the current context to 0.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_i(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_clear_i)
    int i;
    for (i = 0; i < CONTEXT(interp)->n_regs_used[REGNO_INT]; ++i)
        REG_INT(interp, i) = 0;
}


/*

=item C<void Parrot_clear_s>

Sets all STRING registers in the current context to NULL.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_s(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_clear_s)
    int i;
    for (i = 0; i < CONTEXT(interp)->n_regs_used[REGNO_STR]; ++i)
        REG_STR(interp, i) = NULL;
}


/*

=item C<void Parrot_clear_p>

Sets all PMC registers in the current context to NULL.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_p(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_clear_p)
    int i;
    for (i = 0; i < CONTEXT(interp)->n_regs_used[REGNO_PMC]; ++i)
        REG_PMC(interp, i) = PMCNULL;
}


/*

=item C<void Parrot_clear_n>

Sets all number registers in the current context to 0.0.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_n(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_clear_n)
    int i;
    for (i = 0; i < CONTEXT(interp)->n_regs_used[REGNO_NUM]; ++i)
        REG_NUM(interp, i) = 0.0;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/register.h> and F<src/stacks.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
