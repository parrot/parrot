/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/inter_create.c - Parrot Interpreter Creation and Destruction

=head1 DESCRIPTION

Create or destroy a Parrot interpreter.c

=head2 Functions

=over 4

=cut

*/


#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/method_util.h"
#include "parrot/oplib/core_ops.h"

#if EXEC_CAPABLE
Interp interpre;
#endif

#define CTX_LEAK_DEBUG 0

#define ATEXIT_DESTROY

/*

=item C<static int is_env_var_set(const char* var)>

Checks whether the specified environment variable is set.

=cut

*/

static int
is_env_var_set(const char* var)
{
    int free_it, retval;
    char* value = Parrot_getenv(var, &free_it);
    if (value == NULL)
        retval = 0;
    else if (*value == '\0')
        retval = 0;
    else
        retval = ! (strcmp(value, "0") == 0);
    if (free_it)
        mem_sys_free(value);
    return retval;
}

/*

=item C<static void setup_default_compreg(Parrot_Interp interpreter)>

Setup default compiler for PASM.

=cut

*/

static void setup_default_compreg(Parrot_Interp interpreter)
{
    STRING *pasm1 = string_from_cstring(interpreter, "PASM1", 0);

    /* register the nci compiler object */
    Parrot_compreg(interpreter, pasm1, (Parrot_compiler_func_t)PDB_compile);
}

/*
 * Context and register frame layout
 *
 *    +----------+--------------------------+
 *    | context  | registers                +
 *    +----------+--------------------------+
 *               ^
 *               |
 *               ctx.bp pointer
 *
 * Registers are addressed as usual via the register base pointer ctx.bp.
 * Context variables are to the "left" of the pointer and accessible with
 * the ctx union member ctx.rctx e.g. ctx.rctx[-1].current_sub
 *
 * The macro CONTEXT() hides these details
 *
 */

#define CHUNKED_CTX_MEM 0

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
 * of all avtive continuations.
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

=item C<static void destroy_context(Interp *)>

Free allocated context memory

=item C<static void create_initial_context(Interp *)>

Create initial interpreter context.

=cut

*/

#if CHUNKED_CTX_MEM
static void
new_context_mem(Interp *interpreter, context_mem *ctx_mem)
{
    ctx_mem->data = mem_sys_allocate(CTX_ALLOC_SIZE);
    ctx_mem->free = ctx_mem->data;
    ctx_mem->threshold = NULL;
    ctx_mem->prev = NULL;
}

static void
destroy_context(Interp *interpreter)
{
    context_mem *ctx_mem, *prev;

    mem_sys_free(interpreter->ctx_mem.data);
    for (ctx_mem = interpreter->ctx_mem.prev; ctx_mem; ) {
        prev = ctx_mem->prev;
        mem_sys_free(ctx_mem->data);
        mem_sys_free(ctx_mem);
        ctx_mem = prev;
    }
}

static void
create_initial_context(Interp *interpreter)
{
    size_t to_alloc = sizeof(struct parrot_regs_t) + ALIGNED_CTX_SIZE;

    new_context_mem(interpreter, &interpreter->ctx_mem);
    LVALUE_CAST(char *, interpreter->ctx.bp) =
        interpreter->ctx_mem.free + ALIGNED_CTX_SIZE;
    interpreter->ctx_mem.free += to_alloc;
    memset(CONTEXT(interpreter->ctx), 0, sizeof(struct Parrot_Context));
    CONTEXT(interpreter->ctx)->prev = NULL;
}

#else

static void
destroy_context(Interp *interpreter)
{
}

static void
create_initial_context(Interp *interpreter)
{
    size_t to_alloc = sizeof(struct parrot_regs_t) + ALIGNED_CTX_SIZE;
    char *p;

    p = mem_sys_allocate(to_alloc);
    LVALUE_CAST(char *, interpreter->ctx.bp) = p + ALIGNED_CTX_SIZE;
#if CTX_LEAK_DEBUG
    fprintf(stderr, "alloc %p\n", interpreter->ctx.bp);
#endif
    interpreter->ctx_mem.free = NULL;
    memset(CONTEXT(interpreter->ctx), 0, sizeof(struct Parrot_Context));
    CONTEXT(interpreter->ctx)->prev = NULL;
}

#endif

/*

=item C<void parrot_gc_context(Interp *)>

Cleanup dead context memory. Called by the gargabe collector.

=item C<void Parrot_alloc_context(Interp *)>

Allocate a new context and set the context pointer.

=item C<void Parrot_set_context_threshold(Interp *, parrot_context_t *ctxp)>

Mark the context as possible threshold.

=item C<void Parrot_free_context(Interp *, parrot_context_t *ctxp, int re_use)>

Free the context. If C<re_use> is true, this function is called by a
return continuation invoke, else from the destructur of a continuation.

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
init_context(Interp *interpreter, parrot_context_t *oldp)
{
    struct parrot_regs_t *bp;
    parrot_context_t old = *oldp;
    int i;

    memcpy(CONTEXT(interpreter->ctx),
           CONTEXT(old), sizeof(struct Parrot_Context));
    CONTEXT(interpreter->ctx)->prev = old.rctx;
    CONTEXT(interpreter->ctx)->ref_count = 0;
    CONTEXT(interpreter->ctx)->current_results = NULL;
    CONTEXT(interpreter->ctx)->current_args = NULL;

    /* NULL out registers
     *
     * if the architecture has 0x := NULL and 0.0 we could memset too
     *
     */
    bp = interpreter->ctx.bp;
    for (i = 0; i < NUM_REGISTERS; i++) {
        BP_REG_PMC(bp, i) = PMCNULL;
        BP_REG_STR(bp, i) = NULL;
#ifndef NDEBUG
        /* depending on -D40 we set int, num to garbage or zero
         */
        if (Interp_debug_TEST(interpreter, PARROT_REG_DEBUG_FLAG)) {
            /* TODO better use rand values */
            BP_REG_INT(bp, i) = -999;
            BP_REG_NUM(bp, i) = -99.9;
        }
        else {
            BP_REG_INT(bp, i) = 0;
            BP_REG_NUM(bp, i) = 0.0;
        }
#endif
    }
}

#if CHUNKED_CTX_MEM
void
Parrot_alloc_context(Interp *interpreter)
{

    parrot_context_t ctx;
    size_t used;

    /* for now still use 32 regs fixed chunks */
    size_t to_alloc = sizeof(struct parrot_regs_t) + ALIGNED_CTX_SIZE;

    used = interpreter->ctx_mem.free - interpreter->ctx_mem.data;
    if (used + to_alloc >= CTX_ALLOC_SIZE ) {
        /* trigger a DOD run to reuse ctx hel by dead continuations */
        if (interpreter->ctx_mem.threshold) {
            Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
            used = interpreter->ctx_mem.free - interpreter->ctx_mem.data;
        }
        if (used + to_alloc >= CTX_ALLOC_SIZE ) {
            context_mem *ctx_mem = mem_sys_allocate(sizeof(context_mem));
            memcpy(ctx_mem, &interpreter->ctx_mem, sizeof(context_mem));
            ctx_mem->prev = NULL;
            new_context_mem(interpreter, &interpreter->ctx_mem);
            interpreter->ctx_mem.prev = ctx_mem;
        }
    }
    ctx = interpreter->ctx;
    LVALUE_CAST(char *, interpreter->ctx.bp) =
        interpreter->ctx_mem.free + ALIGNED_CTX_SIZE;
    interpreter->ctx_mem.free += to_alloc;
    init_context(interpreter, ctx);
}

void
Parrot_set_context_threshold(Interp * interpreter, parrot_context_t *ctxp)
{
    char *used_ctx_mem;
    parrot_context_t ctx = *ctxp;

    used_ctx_mem = (char *)ctx.bp + sizeof(struct parrot_regs_t);
    if ((UINTVAL)used_ctx_mem > (UINTVAL)interpreter->ctx_mem.free)
        interpreter->ctx_mem.free = used_ctx_mem;
}

void
Parrot_free_context(Interp *interpreter, parrot_context_t *ctxp, int re_use)
{

    struct Parrot_Context *prev;
    size_t to_alloc = sizeof(struct parrot_regs_t) + ALIGNED_CTX_SIZE;
    parrot_context_t ctx = *ctxp;
    char *used_ctx_mem;

    prev = CONTEXT(ctx)->prev;
    if (!prev) {
        /* returning from main */
        return;
    }
    CONTEXT(ctx)->prev = NULL;
    used_ctx_mem = (char *)ctx.bp + sizeof(struct parrot_regs_t);

    /* if we are at the top end of memory
     * (e.g. return continuation was invoked)
     * then lower free
     */
    if (used_ctx_mem == interpreter->ctx_mem.free &&
            interpreter->ctx_mem.free > interpreter->ctx_mem.threshold) {
        interpreter->ctx_mem.free -= to_alloc;
        if (interpreter->ctx_mem.free == interpreter->ctx_mem.data) {
            /* reached lower end of context chunk */
            if (interpreter->ctx_mem.prev) {
                context_mem *ctx_mem = interpreter->ctx_mem.prev;
#if 0
                /* TODO
                 * can't do that yet
                 * runops_fromc still fetches results after the
                 * return continuation is invoked
                 * XXX leak the register memory for now
                 */
                mem_sys_free(interpreter->ctx_mem.data);
#endif
                memcpy(&interpreter->ctx_mem, ctx_mem, sizeof(context_mem));
                mem_sys_free(ctx_mem);
            }
        }
    }
    if (!re_use) {
        /*
         * real continuation was GCed
         * mark this ctx area dead
         */
        if (interpreter->ctx_mem.threshold == used_ctx_mem) {
            /* if threshold is at the end of used memory, lower threshold */
            interpreter->ctx_mem.threshold -= to_alloc;
        }
        else {
            /* mark it dead by setting a uniq signature into the
             * prev pointer location
             */
            *(void**)&CONTEXT(ctx)->prev = (void*) 0xdeaddead;
        }
    }
}

#else


void
Parrot_alloc_context(Interp *interpreter)
{

    parrot_context_t ctx;
    struct Parrot_Context *p;
    void *ptr;

    ptr = interpreter->ctx_mem.free;
    if (ptr) {
        interpreter->ctx_mem.free = *(void **) ptr;
    }
    else {
        ptr = mem_sys_allocate(sizeof(struct parrot_regs_t) +
                ALIGNED_CTX_SIZE);
        *(void **) ptr = NULL;
    }
    p = (void *) ((char *)ptr + ALIGNED_CTX_SIZE);
    p[-1].prev = NULL;
    ctx = interpreter->ctx;
    interpreter->ctx.rctx = p;
#if CTX_LEAK_DEBUG
    fprintf(stderr, "alloc %p\n", p);
#endif
    init_context(interpreter, &ctx);
}

void
Parrot_free_context(Interp *interpreter, parrot_context_t *ctxp, int re_use)
{
    struct Parrot_Context *free_list;
    void *ptr;

    /*
     * The context structure has a reference count, initially 0
     * it' incrementented when a continuation is created either directly
     * or a continuation is cloned or a retcontinuation is converted
     * to a full continuation in invalidate_retc
     * this *should* be ok, but obviously leaks memory
     * (turn CTX_LEAK_DEBUG on)
     *
     */
    if (re_use || --CONTEXT(*ctxp)->ref_count == 0) {
        ptr = ctxp->bp;
        ptr = (char *)ptr - ALIGNED_CTX_SIZE;
        *(void **)ptr = interpreter->ctx_mem.free;
        interpreter->ctx_mem.free = ptr;
#if CTX_LEAK_DEBUG
        fprintf(stderr, "free  %p\n", ctxp->rctx);
#endif
    }
}

void
Parrot_set_context_threshold(Interp * interpreter, parrot_context_t *ctxp)
{
    /* nothing to do */
}

#endif
/*

=item C<Parrot_Interp
make_interpreter(Parrot_Interp parent, Interp_flags flags)>

Create the Parrot interpreter. Allocate memory and clear the registers.

=cut

*/

void Parrot_really_destroy(int exit_code, void *interpreter);

Parrot_Interp
make_interpreter(Parrot_Interp parent, Interp_flags flags)
{
    Interp *interpreter;
#if EXEC_CAPABLE
    extern int Parrot_exec_run;
#endif

    /* Get an empty interpreter from system memory */
#if EXEC_CAPABLE
    if (Parrot_exec_run)
        interpreter = &interpre;
    else
#endif
        interpreter = mem_sys_allocate_zeroed(sizeof(Interp));

    /*
     * the last interpreter (w/o) parent has to cleanup globals
     * so remember parent if any
     */
    if (parent) {
        interpreter->parent_interpreter = parent;
        interpreter->lo_var_ptr = parent->lo_var_ptr;
    }
    else {
        SET_NULL(interpreter->parent_interpreter);
        SET_NULL(interpreter->lo_var_ptr);
        /*
         * we need a global mutex to protect the interpreter array
         */
        MUTEX_INIT(interpreter_array_mutex);
        MUTEX_INIT(class_count_mutex);
    }
    create_initial_context(interpreter);
    interpreter->resume_flag = RESUME_INITIAL;
    /* main is called as a Sub too - this will get depth 0 then */
    CONTEXT(interpreter->ctx)->recursion_depth = -1;
    interpreter->recursion_limit = 1000;

    /* Must initialize flags here so the GC_DEBUG stuff is available before
     * mem_setup_allocator() is called. */
    interpreter->flags = flags;

    /* PANIC will fail until this is done */
    SET_NULL(interpreter->piodata);
    PIO_init(interpreter);

    if (is_env_var_set("PARROT_GC_DEBUG")) {
#if ! DISABLE_GC_DEBUG
        Interp_flags_SET(interpreter, PARROT_GC_DEBUG_FLAG);
#else
        fprintf(stderr, "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.\n");
#endif
    }

    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);
    Parrot_block_DOD(interpreter);
    Parrot_block_GC(interpreter);

    /*
     * Set up the string subsystem
     * This also generates the constant string tables
     */
    string_init(interpreter);

    /* Set up the MMD struct */
    interpreter->binop_mmd_funcs = NULL;

    /* Go and init the MMD tables */
    mmd_add_function(interpreter, MMD_USER_FIRST - 1, (funcptr_t)0);

    /* create caches structure */
    init_object_cache(interpreter);

    /* initialize classes - this needs mmd func table */
    SET_NULL(interpreter->HLL_info);
    Parrot_init(interpreter);

    /* context data */
    /* Initialize interpreter's flags */
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* same with errors */
    PARROT_ERRORS_off(interpreter, PARROT_ERRORS_ALL_FLAG);
    /* undefined globals are errors by default */
    PARROT_ERRORS_on(interpreter, PARROT_ERRORS_GLOBALS_FLAG);

    /* allocate stack chunk cache */
    stack_system_init(interpreter);
    /* Set up the initial register chunks */
    setup_register_stacks(interpreter);

    Parrot_clear_s(interpreter);
    Parrot_clear_p(interpreter);
    Parrot_clear_i(interpreter);
    Parrot_clear_n(interpreter);

    /* Stack for lexical pads */
    CONTEXT(interpreter->ctx)->pad_stack = new_stack(interpreter, "Pad");

    /* Need a user stack */
    CONTEXT(interpreter->ctx)->user_stack = new_stack(interpreter, "User");

    /* And a control stack */
    CONTEXT(interpreter->ctx)->control_stack = new_stack(interpreter, "Control");

    /* clear context introspection vars */
    SET_NULL_P(CONTEXT(interpreter->ctx)->current_sub, PMC*);
    SET_NULL_P(CONTEXT(interpreter->ctx)->current_cont, PMC*);
    SET_NULL_P(CONTEXT(interpreter->ctx)->current_object, PMC*);

    /* Load the core op func and info tables */
    interpreter->op_lib = PARROT_CORE_OPLIB_INIT(1);
    interpreter->op_count = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;
    SET_NULL_P(interpreter->all_op_libs, op_lib_t **);
    SET_NULL_P(interpreter->evc_func_table, op_func_t *);
    SET_NULL_P(interpreter->save_func_table, op_func_t *);

    /* Set up defaults for line/package/file */
    interpreter->current_file =
        string_make(interpreter, "(unknown file)", 14, NULL, 0);
    CONTEXT(interpreter->ctx)->current_package =
        string_make(interpreter, "(unknown package)", 18, NULL, 0);

    SET_NULL_P(interpreter->code, struct PackFile *);
    SET_NULL_P(interpreter->profile, ProfData *);

    /* null out the root set registry */
    SET_NULL_P(interpreter->DOD_registry, PMC *);

    /* create exceptions list */
    Parrot_init_exceptions(interpreter);

    /* register assembler/compilers */
    setup_default_compreg(interpreter);

    /* setup stdio PMCs */
    PIO_init(interpreter);
    /* init builtin function struct */
    Parrot_init_builtins(interpreter);

    /* Done. Return and be done with it */

    /* Okay, we've finished doing anything that might trigger GC.
     * Actually, we could enable DOD/GC earlier, but here all setup is
     * done
     */
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interpreter);

    /* all sys running, init the event and signal stuff
     * the first or "master" interpreter is handling events and signals
     */
    SET_NULL_P(interpreter->task_queue, QUEUE*);
    SET_NULL_P(interpreter->thread_data, _Thread_data *);

    Parrot_init_events(interpreter);

#ifdef ATEXIT_DESTROY
    /*
     * if this is not a threaded interpreter, push the interpreter
     * destruction.
     * Threaded interpreters are destructed when the thread ends
     */
    if (!Interp_flags_TEST(interpreter, PARROT_IS_THREAD))
        Parrot_on_exit(Parrot_really_destroy, (void*)interpreter);
#endif

    return interpreter;
}

/*

=item C<void
Parrot_destroy(Interp *interpreter)>

Does nothing if C<ATEXIT_DESTROY> is defined. Otherwise calls
C<Parrot_really_destroy()> with exit code 0.

This function is not currently used.

=cut

*/

void
Parrot_destroy(Interp *interpreter)
{
#ifdef ATEXIT_DESTROY
    UNUSED(interpreter);
#else
    Parrot_really_destroy(0, (void*) interpreter);
#endif
}

/*

=item C<void
Parrot_really_destroy(int exit_code, void *vinterp)>

Waits for any threads to complete, then frees all allocated memory, and
closes any open file handles, etc.

Note that C<exit_code> is ignored.

=cut

*/

void
Parrot_really_destroy(int exit_code, void *vinterp)
{
    int i;
    Interp *interpreter = (Interp*) vinterp;
    struct Stash *stash, *next_stash;

    UNUSED(exit_code);

    /*
     * wait for threads to complete if needed
     */
    if (!interpreter->parent_interpreter) {
        pt_join_threads(interpreter);
    }
    /* if something needs destruction (e.g. closing PIOs)
     * we must destroy it now:
     *
     * Be sure that an async collector hasn't live bits set now, so
     * trigger a finish run
     *
     * Need to turn off DOD blocking, else things stay alive and IO
     * handles aren't closed
     */
    interpreter->arena_base->DOD_block_level =
        interpreter->arena_base->GC_block_level = 0;
    Parrot_do_dod_run(interpreter, DOD_finish_FLAG);

    /*
     * that doesn't get rid of constant PMCs like these in vtable->data
     * so if such a PMC needs destroy, we got a memory leak, like for
     * the SharedRef PMC
     * TODO sweep constants too or special treatment - depends on how
     *      many constant PMCs we'll create
     */

    /* Now the PIOData gets also cleared */
    PIO_finish(interpreter);

    /*
     * now all objects that need timely destruction should be finalized
     * so terminate the event loop
     */
    if (!interpreter->parent_interpreter) {
        PIO_internal_shutdown(interpreter);
        Parrot_kill_event_loop();
    }

    /* we destroy all child interpreters and the last one too,
     * if the --leak-test commandline was given
     */
    if (! (interpreter->parent_interpreter ||
                Interp_flags_TEST(interpreter, PARROT_DESTROY_FLAG)))
        return;

    if (interpreter->arena_base->de_init_gc_system)
        interpreter->arena_base->de_init_gc_system(interpreter);
    /* buffer headers, PMCs */
    Parrot_destroy_header_pools(interpreter);
    /* memory pools in resources */
    Parrot_destroy_memory_pools(interpreter);
    /* mem subsystem is dead now */
    mem_sys_free(interpreter->arena_base);
    interpreter->arena_base = NULL;
    /* cache structure */
    mem_sys_free(interpreter->caches);
    /* packfile */

    if (!Interp_flags_TEST(interpreter, PARROT_EXTERN_CODE_FLAG))  {
        struct PackFile *pf = interpreter->initial_pf;
        if (pf)
            PackFile_destroy(interpreter, pf);
    }

    /* walk and free the stash, pmc's are already dead */
    stash = interpreter->globals;
    while (stash) {
        next_stash = stash->parent_stash;
        mem_sys_free(stash);
        stash = next_stash;
    }
    /* free vtables */
    if (!interpreter->parent_interpreter)
        for (i = 1; i < (int)enum_class_max; i++)
            Parrot_destroy_vtable(interpreter, Parrot_base_vtables[i]);
    mmd_destroy(interpreter);


    if (interpreter->profile) {
        mem_sys_free(interpreter->profile->data);
        interpreter->profile->data = NULL;
        mem_sys_free(interpreter->profile);
        interpreter->profile = NULL;
    }

    /* deinit op_lib */
    (void) PARROT_CORE_OPLIB_INIT(0);

    stack_destroy(CONTEXT(interpreter->ctx)->pad_stack);
    stack_destroy(CONTEXT(interpreter->ctx)->user_stack);
    stack_destroy(CONTEXT(interpreter->ctx)->control_stack);

    destroy_context(interpreter);

    /* predefined exceptions */
    mem_sys_free(interpreter->exception_list);
    if (interpreter->evc_func_table)
        mem_sys_free(interpreter->evc_func_table);
    /* strings, chartype, encodings */
    if (!interpreter->parent_interpreter) {
        MUTEX_DESTROY(interpreter_array_mutex);
        MUTEX_DESTROY(class_count_mutex);
        string_deinit(interpreter);
        /*
           chartype_destroy();
           encoding_destroy();
           */
        mem_sys_free(interpreter);
        /*
         * finally free other globals
         */
        mem_sys_free(Parrot_base_vtables);
        Parrot_base_vtables = NULL;
        mem_sys_free(interpreter_array);
        interpreter_array = NULL;
    }

    else {
        /* don't free a thread interpreter, if it isn't joined yet */
        if (!interpreter->thread_data || (
                    interpreter->thread_data &&
                    (interpreter->thread_data->state & THREAD_STATE_JOINED))) {
            if (interpreter->thread_data ) {
                mem_sys_free(interpreter->thread_data);
                interpreter->thread_data = NULL;
            }
            mem_sys_free(interpreter);
        }
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

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
