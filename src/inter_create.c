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

    Parrot_csub_t p = (Parrot_csub_t) PDB_compile;
    /* register the nci ccompiler object */
    Parrot_compreg(interpreter, pasm1, (PMC*)F2DPTR(p));
}

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
    }
    interpreter->resume_flag = RESUME_INITIAL;
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
    register_fallback_methods(interpreter);

    /* initialize classes - this needs mmd func table */
    Parrot_init(interpreter);

    /* context data */
    /* Initialize interpreter's flags */
    PARROT_WARNINGS_off(interpreter, PARROT_WARNINGS_ALL_FLAG);

    /* same with errors */
    PARROT_ERRORS_off(interpreter, PARROT_ERRORS_ALL_FLAG);
    /* undefined globals are errors by default */
    PARROT_ERRORS_on(interpreter, PARROT_ERRORS_GLOBALS_FLAG);

    /* create caches structure */
    init_object_cache(interpreter);
    /* allocate stack chunk cache */
    stack_system_init(interpreter);
#if INDIRECT_REGS
    /*
     * XXX create mem for regs - intermediate step
     *     to check indirect accressing
     */
    interpreter->ctx.bp = mem_sys_allocate(sizeof(struct parrot_regs_t));
#endif

    /* Set up the initial register chunks */
    setup_register_stacks(interpreter, &interpreter->ctx);

    Parrot_clear_s(interpreter);
    Parrot_clear_p(interpreter);

    /* Stack for lexical pads */
    interpreter->ctx.pad_stack = new_stack(interpreter, "Pad");

    /* Need a user stack */
    interpreter->ctx.user_stack = new_stack(interpreter, "User");

    /* And a control stack */
    interpreter->ctx.control_stack = new_stack(interpreter, "Control");

    /* A regex stack would be nice too. */
    interpreter->ctx.intstack = intstack_new(interpreter);

    /* clear context introspection vars */
    SET_NULL_P(interpreter->ctx.current_sub, PMC*);
    SET_NULL_P(interpreter->ctx.current_cont, PMC*);
    SET_NULL_P(interpreter->ctx.current_object, PMC*);

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
        string_make(interpreter, "(unknown file)", 14, "iso-8859-1", 0);
    interpreter->current_package =
        string_make(interpreter, "(unknown package)", 18, "iso-8859-1", 0);;

    SET_NULL_P(interpreter->code, struct PackFile *);
    SET_NULL_P(interpreter->profile, ProfData *);

    /* next two are pointers to the real thing in the current code seg */
    SET_NULL_P(interpreter->prederef.code, void **);
    SET_NULL_P(interpreter->prederef.branches, Prederef_btanch*);
    SET_NULL(interpreter->jit_info);

    /* null out the root set registry */
    SET_NULL_P(interpreter->DOD_registry, PMC *);

    /* create exceptions list */
    Parrot_init_exceptions(interpreter);

    /* register assembler/compilers */
    setup_default_compreg(interpreter);

    /* setup stdio PMCs */
    PIO_init(interpreter);

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
        if (Interp_flags_TEST(interpreter, PARROT_PYTHON_MODE))
            Parrot_py_exit(interpreter);
    }
    /* if something needs destruction (e.g. closing PIOs)
     * we must destroy it now:
     *
     * Be sure that an async collector hasn't live bits set now, so
     * trigger a finish run
     */
    Parrot_do_dod_run(interpreter, DOD_finish_FLAG);

    Parrot_dod_sweep(interpreter, interpreter->arena_base->pmc_pool);
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
    /* packfile */

    if (!Interp_flags_TEST(interpreter, PARROT_EXTERN_CODE_FLAG))  {
        struct PackFile *pf = interpreter->code;
        if (pf)
            PackFile_destroy(pf);
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

    stack_destroy(interpreter->ctx.pad_stack);
    stack_destroy(interpreter->ctx.user_stack);
    stack_destroy(interpreter->ctx.control_stack);
    /* intstack */
    intstack_free(interpreter, interpreter->ctx.intstack);

    /* predefined excpetions */
    mem_sys_free(interpreter->exception_list);
    if (interpreter->evc_func_table)
        mem_sys_free(interpreter->evc_func_table);
    /* strings, chartype, encodings */
    if (!interpreter->parent_interpreter) {
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
