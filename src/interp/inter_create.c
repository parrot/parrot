/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/interp/inter_create.c - Parrot Interpreter Creation and Destruction

=head1 DESCRIPTION

Create or destroy a Parrot interpreter

=head2 Functions

=over 4

=cut

*/


#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/oplib/core_ops.h"
#include "pmc/pmc_callcontext.h"
#include "../gc/gc_private.h"
#include "inter_create.str"

static Interp* emergency_interp;

/* HEADERIZER HFILE: include/parrot/interpreter.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static int is_env_var_set(PARROT_INTERP, ARGIN(STRING* var))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_is_env_var_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(var))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define ATEXIT_DESTROY

/*

=item C<static int is_env_var_set(PARROT_INTERP, STRING* var)>

Checks whether the specified environment variable is set.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
is_env_var_set(PARROT_INTERP, ARGIN(STRING* var))
{
    ASSERT_ARGS(is_env_var_set)
    int retval;
    STRING * const value = Parrot_getenv(interp, var);
    if (STRING_IS_NULL(value))
        retval = 0;
    else if (STRING_IS_EMPTY(value))
        retval = 0;
    else
        retval = !STRING_equal(interp, value, CONST_STRING(interp, "0"));
    return retval;
}

/*

=item C<Parrot_Interp Parrot_new(Parrot_Interp parent)>

Returns a new Parrot interpreter.

The first created interpreter (C<parent> is C<NULL>) is the last one
to get destroyed.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
Parrot_new(ARGIN_NULLOK(Parrot_Interp parent))
{
    ASSERT_ARGS(Parrot_new)
    /* inter_create.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(parent, PARROT_NO_FLAGS);
}

/*

=item C<void Parrot_init_stacktop(PARROT_INTERP, void *stack_top)>

Initializes the new interpreter when it hasn't been initialized before.

Additionally sets the stack top, so that Parrot objects created
in inner stack frames will be visible during GC stack walking code.
B<stack_top> should be the address of an automatic variable in the caller's
stack frame. All unanchored Parrot objects (PMCs) must live in inner stack
frames so that they are not destroyed during GC runs.

Use this function when you call into Parrot before entering a run loop.

=cut

*/

PARROT_EXPORT
void
Parrot_init_stacktop(PARROT_INTERP, ARGIN(void *stack_top))
{
    ASSERT_ARGS(Parrot_init_stacktop)
    interp->lo_var_ptr = stack_top;
    Parrot_gbl_init_world_once(interp);
}

/*

=item C<Parrot_Interp make_interpreter(Interp *parent, INTVAL flags)>

Create the Parrot interpreter. Allocate memory and clear the registers.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
make_interpreter(ARGIN_NULLOK(Interp *parent), INTVAL flags)
{
    ASSERT_ARGS(make_interpreter)
    int stacktop;
    Parrot_GC_Init_Args args;
    Interp * const interp = allocate_interpreter(parent, flags);
    memset(&args, 0, sizeof (args));
    args.stacktop = &stacktop;
    initialize_interpreter(interp, &args);
    return interp;
}

/*

=item C<Parrot_Interp allocate_interpreter(Interp *parent, INTVAL flags)>

Allocate new interpreter from system memory. Everything is preallocated but not
initialized. Used in next cycle:

    allocate_interpreter
    parseflags
    initialize_interpreter

for overriding subsystems (e.g. GC) which require early initialization.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
allocate_interpreter(ARGIN_NULLOK(Interp *parent), INTVAL flags)
{
    ASSERT_ARGS(allocate_interpreter)
    Interp *interp;

    /* Get an empty interpreter from system memory */
    interp = mem_internal_allocate_zeroed_typed(Interp);

    /* the last interpreter (w/o) parent has to cleanup globals
     * so remember parent if any */
    if (parent)
        interp->parent_interpreter = parent;
    else {
        interp->parent_interpreter = NULL;
        emergency_interp           = interp;

        PMCNULL                    = NULL;
    }

    /* Must initialize flags before Parrot_gc_initialize() is called
     * so the GC_DEBUG stuff is available. */
    interp->flags = flags;

    interp->ctx         = NULL;
    interp->resume_flag = RESUME_INITIAL;

    interp->recursion_limit = RECURSION_LIMIT;

    /* PANIC will fail until this is done */
    interp->piodata = NULL;

    /* create exceptions list */
    interp->current_runloop_id    = 0;
    interp->current_runloop_level = 0;

    interp->gc_sys           = mem_internal_allocate_zeroed_typed(GC_Subsystem);

    /* Done. Return and be done with it */
    return interp;
}

/*

=item C<Parrot_Interp initialize_interpreter(PARROT_INTERP, Parrot_GC_Init_Args
*args)>

Initialize previously allocated interpreter.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Interp
initialize_interpreter(PARROT_INTERP, ARGIN(Parrot_GC_Init_Args *args))
{
    ASSERT_ARGS(initialize_interpreter)

    /* Set up the memory allocation system */
    Parrot_gc_initialize(interp, args);
    Parrot_block_GC_mark(interp);
    Parrot_block_GC_sweep(interp);

    interp->ctx         = PMCNULL;
    interp->resume_flag = RESUME_INITIAL;

    interp->recursion_limit = RECURSION_LIMIT;

    /* PANIC will fail until this is done */
    interp->piodata = NULL;
    Parrot_io_init(interp);

    /* use the system time as the prng seed */
    Parrot_util_srand(Parrot_get_entropy(interp));

    /*
     * Set up the string subsystem
     * This also generates the constant string tables
     */
    Parrot_str_init(interp);

    /* create caches structure */
    init_object_cache(interp);

    /* initialize classes - this needs mmd func table */
    interp->HLL_info = NULL;

    Parrot_vtbl_initialize_core_vtables(interp);

    /* create the root set registry */
    interp->gc_registry = Parrot_pmc_new(interp, enum_class_AddrRegistry);

    /* Set up MMD; MMD cache for builtins. */
    interp->op_mmd_cache = Parrot_mmd_cache_create(interp);
    Parrot_pmc_gc_register(interp, interp->op_mmd_cache);

    Parrot_gbl_init_world_once(interp);

    /* context data */
    if (is_env_var_set(interp, CONST_STRING(interp, "PARROT_GC_DEBUG"))) {
#if ! DISABLE_GC_DEBUG
        Interp_flags_SET(interp, PARROT_GC_DEBUG_FLAG);
#else
        fprintf(stderr, "PARROT_GC_DEBUG is set but the binary was compiled "
                "with DISABLE_GC_DEBUG.\n");
#endif
    }

    /* Initialize interpreter's flags */
    PARROT_WARNINGS_off(interp, PARROT_WARNINGS_ALL_FLAG);

    /* same with errors */
    PARROT_ERRORS_off(interp, PARROT_ERRORS_ALL_FLAG);

    /* param count mismatch is an error by default */
    PARROT_ERRORS_on(interp, PARROT_ERRORS_PARAM_COUNT_FLAG);

    create_initial_context(interp);

    /* clear context introspection vars */
    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), NULL);
    Parrot_pcc_set_continuation(interp, CURRENT_CONTEXT(interp), NULL); /* TODO Use PMCNULL */
    Parrot_pcc_set_object(interp, CURRENT_CONTEXT(interp), NULL);

    /* initialize built-in runcores */
    Parrot_runcore_init(interp);

    /* Load the core op func and info tables */
    interp->all_op_libs         = NULL;
    interp->evc_func_table      = NULL;
    interp->evc_func_table_size = 0;
    interp->code                = NULL;

    /* create exceptions list */
    interp->current_runloop_id    = 0;
    interp->current_runloop_level = 0;

    /* setup stdio PMCs */
    Parrot_io_init(interp);

    /* all sys running, init the event and signal stuff
     */

    Parrot_cx_init_scheduler(interp);

    /* Done. Return and be done with it */

    /* Okay, we've finished doing anything that might trigger GC.
     * Actually, we could enable GC earlier, but here all setup is
     * done
     */
    Parrot_unblock_GC_mark(interp);
    Parrot_unblock_GC_sweep(interp);

#ifdef ATEXIT_DESTROY
    /*
     * if this is not a threaded interpreter, push the interpreter
     * destruction.
     * Threaded interpreters are destructed when the thread ends
     */
    if (!Interp_flags_TEST(interp, PARROT_IS_THREAD))
        Parrot_x_on_exit(interp, Parrot_really_destroy, NULL);
#endif

    return interp;
}


/*

=item C<void Parrot_destroy(PARROT_INTERP)>

Does nothing if C<ATEXIT_DESTROY> is defined. Otherwise calls
C<Parrot_really_destroy()> with exit code 0.

This function is not currently used.

=cut

*/

PARROT_EXPORT
void
Parrot_destroy(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_destroy)
#ifdef ATEXIT_DESTROY
    UNUSED(interp);
#else
    Parrot_really_destroy(interp, 0);
#endif
}

/*

=item C<void Parrot_really_destroy(PARROT_INTERP, int exit_code, void *arg)>

Waits for any threads to complete, then frees all allocated memory, and
closes any open file handles, etc.

=cut

*/

void
Parrot_really_destroy(PARROT_INTERP, int exit_code, SHIM(void *arg))
{
    ASSERT_ARGS(Parrot_really_destroy)

    if (!interp->parent_interpreter) {
        /* Don't bother trying to provide a pir backtrace on assertion failures
         * during global destruction.  It only works in movies. */
        Parrot_clear_emergency_interp();
    }

    /* if something needs destruction (e.g. closing PIOs)
     * we must destroy it now:
     *
     * Be sure that an async collector hasn't live bits set now, so
     * trigger a finish run
     *
     * Need to turn off GC blocking, else things stay alive and IO
     * handles aren't closed
     */
    Parrot_gc_completely_unblock(interp);

    /* Set non buffered mode in standard out and err handles, flushing
     * the buffers and avoiding pending output gets confused or lost in
     * case of errors during destruction.
     */
    Parrot_io_setbuf(interp,
            Parrot_io_stdhandle(interp, PIO_STDOUT_FILENO, NULL), PIOCTL_NONBUF);
    Parrot_io_setbuf(interp,
            Parrot_io_stdhandle(interp, PIO_STDERR_FILENO, NULL), PIOCTL_NONBUF);

    if (Interp_trace_TEST(interp, ~0)) {
        Parrot_io_eprintf(interp, "FileHandle objects (like stdout and stderr)"
            "are about to be closed, so clearing trace flags.\n");
        Interp_trace_CLEAR(interp, ~0);
    }

    /*
     * that doesn't get rid of constant PMCs like these in vtable->data
     * so if such a PMC needs destroying, we get a memory leak, like for
     * the SharedRef PMC
     * TODO sweep constants too or special treatment - depends on how
     *      many constant PMCs we'll create
     */

    /* Now the PIOData gets also cleared */
    Parrot_io_finish(interp);

    /* deinit runcores and dynamic op_libs */
    if (!interp->parent_interpreter)
        Parrot_runcore_destroy(interp);

    /*
     * now all objects that need timely destruction should be finalized
     * so terminate the event loop
     */
 /*   if (!interp->parent_interpreter) {
        PIO_internal_shutdown(interp);
        Parrot_kill_event_loop(interp);
    }
  */

    /* we destroy all child interpreters and the last one too,
     * if the --leak-test commandline was given */
    if (! (interp->parent_interpreter
    ||    Interp_flags_TEST(interp, PARROT_DESTROY_FLAG)))
        return;

    if (interp->parent_interpreter)
        Parrot_gc_destroy_child_interp(interp->parent_interpreter, interp);

    Parrot_gc_mark_and_sweep(interp, GC_finish_FLAG);

    destroy_runloop_jump_points(interp);

    /* cache structure */
    destroy_object_cache(interp);

    if (interp->evc_func_table) {
        mem_gc_free(interp, interp->evc_func_table);
        interp->evc_func_table      = NULL;
        interp->evc_func_table_size = 0;
    }

    /* strings, encodings - only once */
    Parrot_str_finish(interp);

    PARROT_CORE_OPLIB_INIT(interp, 0);

    if (!interp->parent_interpreter) {
        /* get rid of ops */
        if (interp->op_hash)
            Parrot_hash_destroy(interp, interp->op_hash);

        /* free vtables */
        Parrot_vtbl_free_vtables(interp);

        /* Finalize GC */
        Parrot_gc_finalize(interp);

        mem_internal_free(interp);
    }

    else {
        Parrot_vtbl_free_vtables(interp);

        /* Finalize GC */
        Parrot_gc_finalize(interp);
        mem_internal_free(interp);
    }
}


/*

=item C<Interp* Parrot_get_emergency_interp(void)>

Provide access to a (possibly) valid interp pointer.  This is intended B<only>
for use cases when an interp is not available otherwise, which shouldn't be
often.  There are no guarantees about what this function returns.  If you
have access to a valid interp, use that instead.  Don't use this for anything
other than error handling.

=cut

*/

PARROT_CAN_RETURN_NULL
Interp*
Parrot_get_emergency_interp(void) {
    ASSERT_ARGS(Parrot_get_emergency_interp)

    return emergency_interp;
}


/*

=item C<void Parrot_clear_emergency_interp(void)>

Null the C<emergency_interp> static variable.  This is only useful when
purposefully invalidating C<emergency_interp>.  This is not a general-purpose
function.  Don't use it for anything other than error handling.

=cut

*/

void
Parrot_clear_emergency_interp(void) {
    emergency_interp = NULL;
}


/*

=back

=head1 SEE ALSO

L<include/parrot/interpreter.h>, L<src/interp/interpreter.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
