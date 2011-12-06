/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/interp/api.c - Parrot Interpreter API

=head1 DESCRIPTION

Functions related to managing the Parrot interpreter

=head2 Functions

=over 4

=cut

*/


#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/oplib/core_ops.h"
#include "pmc/pmc_callcontext.h"
#include "../gc/gc_private.h"
#include "api.str"
#include "pmc/pmc_parrotinterpreter.h"
#include "parrot/has_header.h"
#include "imcc/embed.h"

static Interp* emergency_interp;

/* HEADERIZER HFILE: include/parrot/interpreter.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static int Parrot_interp_is_env_var_set(PARROT_INTERP, ARGIN(STRING* var))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_interp_is_env_var_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(var))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define ATEXIT_DESTROY

/*

=item C<static int Parrot_interp_is_env_var_set(PARROT_INTERP, STRING* var)>

Checks whether the specified environment variable is set.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
Parrot_interp_is_env_var_set(PARROT_INTERP, ARGIN(STRING* var))
{
    ASSERT_ARGS(Parrot_interp_is_env_var_set)
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

=item C<Parrot_Interp Parrot_interp_new(Parrot_Interp parent)>

Returns a new Parrot interpreter.

The first created interpreter (C<parent> is C<NULL>) is the last one
to get destroyed.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
Parrot_interp_new(ARGIN_NULLOK(Parrot_Interp parent))
{
    ASSERT_ARGS(Parrot_interp_new)
    /* api.c:make_interpreter builds a new Parrot_Interp. */
    return Parrot_interp_make_interpreter(parent, PARROT_NO_FLAGS);
}

/*

=item C<void Parrot_interp_init_stacktop(PARROT_INTERP, void *stack_top)>

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
Parrot_interp_init_stacktop(PARROT_INTERP, ARGIN(void *stack_top))
{
    ASSERT_ARGS(Parrot_interp_init_stacktop)
    interp->lo_var_ptr = stack_top;
    Parrot_gbl_init_world_once(interp);
}

/*

=item C<Parrot_Interp Parrot_interp_make_interpreter(Interp *parent, INTVAL
flags)>

Create the Parrot interpreter. Allocate memory and clear the registers.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
Parrot_interp_make_interpreter(ARGIN_NULLOK(Interp *parent), INTVAL flags)
{
    ASSERT_ARGS(Parrot_interp_make_interpreter)
    int stacktop;
    Parrot_GC_Init_Args args;
    Interp * const interp = Parrot_interp_allocate_interpreter(parent, flags);
    memset(&args, 0, sizeof (args));
    args.stacktop = &stacktop;
    Parrot_interp_initialize_interpreter(interp, &args);
    return interp;
}

/*

=item C<Parrot_Interp Parrot_interp_allocate_interpreter(Interp *parent, INTVAL
flags)>

Allocate new interpreter from system memory. Everything is preallocated but not
initialized. Used in next cycle:

    allocate_interpreter
    parseflags
   Parrot_interp_initialize_interpreter

for overriding subsystems (e.g. GC) which require early initialization.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
Parrot_interp_allocate_interpreter(ARGIN_NULLOK(Interp *parent), INTVAL flags)
{
    ASSERT_ARGS(Parrot_interp_allocate_interpreter)
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

=item C<Parrot_Interp Parrot_interp_initialize_interpreter(PARROT_INTERP,
Parrot_GC_Init_Args *args)>

Initialize previously allocated interpreter.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Interp
Parrot_interp_initialize_interpreter(PARROT_INTERP, ARGIN(Parrot_GC_Init_Args *args))
{
    ASSERT_ARGS(Parrot_interp_initialize_interpreter)

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
    if (Parrot_interp_is_env_var_set(interp, CONST_STRING(interp, "PARROT_GC_DEBUG"))) {
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

    /* Done. Return and be done with it */

    /* Okay, we've finished doing anything that might trigger GC.
     * Actually, we could enable GC earlier, but here all setup is
     * done
     */
    Parrot_unblock_GC_mark(interp);
    Parrot_unblock_GC_sweep(interp);

    /* all sys running, init the event and signal stuff
     * the first or "master" interpreter is handling events and signals
     */

    Parrot_cx_init_scheduler(interp);

#ifdef ATEXIT_DESTROY
    /*
     * if this is not a threaded interpreter, push the interpreter
     * destruction.
     * Threaded interpreters are destructed when the thread ends
     */
    if (!Interp_flags_TEST(interp, PARROT_IS_THREAD))
        Parrot_x_on_exit(interp, Parrot_interp_really_destroy, NULL);
#endif

    return interp;
}

/*

=item C<void Parrot_interp_destroy(PARROT_INTERP)>

Does nothing if C<ATEXIT_DESTROY> is defined. Otherwise calls
C<Parrot_really_destroy()> with exit code 0.

This function is not currently used.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_destroy(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_interp_destroy)
#ifdef ATEXIT_DESTROY
    UNUSED(interp);
#else
   Parrot_interp_really_destroy(interp, 0);
#endif
}

/*

=item C<void Parrot_interp_really_destroy(PARROT_INTERP, int exit_code, void
*arg)>

Waits for any threads to complete, then frees all allocated memory, and
closes any open file handles, etc.

=cut

*/

void
Parrot_interp_really_destroy(PARROT_INTERP, int exit_code, SHIM(void *arg))
{
    ASSERT_ARGS(Parrot_interp_really_destroy)

    /* wait for threads to complete if needed; terminate the event loop */
    if (!interp->parent_interpreter) {
        Parrot_cx_runloop_end(interp);

        /* Don't bother trying to provide a pir backtrace on assertion failures
         * during global destruction.  It only works in movies. */
       Parrot_interp_clear_emergency_interpreter();
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

=item C<Interp* Parrot_interp_get_emergency_interpreter(void)>

Provide access to a (possibly) valid interp pointer.  This is intended B<only>
for use cases when an interp is not available otherwise, which shouldn't be
often.  There are no guarantees about what this function returns.  If you
have access to a valid interp, use that instead.  Don't use this for anything
other than error handling.

=cut

*/

PARROT_CAN_RETURN_NULL
Interp*
Parrot_interp_get_emergency_interpreter(void) {
    ASSERT_ARGS(Parrot_interp_get_emergency_interpreter)

    return emergency_interp;
}

/*

=item C<void Parrot_interp_clear_emergency_interpreter(void)>

Null the C<emergency_interp> static variable.  This is only useful when
purposefully invalidating C<emergency_interp>.  This is not a general-purpose
function.  Don't use it for anything other than error handling.

=cut

*/

void
Parrot_interp_clear_emergency_interpreter(void) {
    emergency_interp = NULL;
}



/*

=item C<void Parrot_interp_register_nci_method(PARROT_INTERP, const int type,
void *func, const char *name, const char *proto)>

Create an entry in the C<nci_method_table> for the given NCI method of PMC
class C<type>.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_register_nci_method(PARROT_INTERP, const int type, ARGIN(void *func),
                    ARGIN(const char *name), ARGIN(const char *proto))
{
    ASSERT_ARGS(Parrot_interp_register_nci_method)
    PMC    * const method      = Parrot_pmc_new(interp, enum_class_NCI);
    STRING * const method_name = Parrot_str_new_init(interp, name, strlen(name),
        Parrot_default_encoding_ptr, PObj_constant_FLAG|PObj_external_FLAG);

    /* create call func */
    VTABLE_set_pointer_keyed_str(interp, method,
            Parrot_str_new_init(interp, proto, strlen(proto),
                Parrot_default_encoding_ptr, PObj_constant_FLAG|PObj_external_FLAG),
            func);

    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp, interp->vtables[type]->_namespace,
            method_name, method);
}

/*

=item C<void Parrot_interp_register_native_pcc_method_in_ns(PARROT_INTERP, const
int type, void *func, STRING *name, STRING *signature)>

Create an entry in the C<nci_method_table> for the given raw NCI method
of PMC class C<type>.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_register_native_pcc_method_in_ns(PARROT_INTERP, const int type, ARGIN(void *func),
        ARGIN(STRING *name), ARGIN(STRING *signature))
{
    ASSERT_ARGS(Parrot_interp_register_native_pcc_method_in_ns)
    PMC * method = Parrot_pmc_new(interp, enum_class_NativePCCMethod);

    /* setup call func */
    VTABLE_set_pointer_keyed_str(interp, method, signature, func);

    /* insert it into namespace */
    VTABLE_set_pmc_keyed_str(interp, interp->vtables[type]->_namespace,
            name, method);
}

/*

=item C<void Parrot_interp_mark_method_writes(PARROT_INTERP, int type, const
char *name)>

Mark the method C<name> on PMC type C<type> as one that modifies the PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_mark_method_writes(PARROT_INTERP, int type, ARGIN(const char *name))
{
    ASSERT_ARGS(Parrot_interp_mark_method_writes)
    STRING *const str_name = Parrot_str_new_constant(interp, name);
    PMC    *const pmc_true = Parrot_pmc_new_init_int(interp, enum_class_Integer, 1);
    PMC    *const method   = VTABLE_get_pmc_keyed_str(
        interp, interp->vtables[type]->_namespace, str_name);
    VTABLE_setprop(interp, method, CONST_STRING(interp, "write"), pmc_true);
}

/*

=item C<PMC * Parrot_interp_get_compiler(PARROT_INTERP, STRING *type)>

Get a compiler PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_interp_get_compiler(PARROT_INTERP, ARGIN(STRING *type))
{
    ASSERT_ARGS(Parrot_interp_get_compiler)
    PMC * const  hash = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_COMPREG_HASH);

    if (PMC_IS_NULL(hash)) {
        /* No compiler has been registered yet */
        return PMCNULL;
    }

    /* Fetch the compiler */
    return VTABLE_get_pmc_keyed_str(interp, hash, type);
}

/*

=item C<void Parrot_interp_set_compiler(PARROT_INTERP, STRING *type, PMC
*compiler)>

Register a parser/compiler PMC.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_compiler(PARROT_INTERP, ARGIN(STRING *type), ARGIN(PMC *compiler))
{
    ASSERT_ARGS(Parrot_interp_set_compiler)
    PMC    * const iglobals = interp->iglobals;
    PMC    * hash           = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                              IGLOBALS_COMPREG_HASH);

    if (PMC_IS_NULL(hash)) {
        hash = Parrot_pmc_new_noinit(interp, enum_class_Hash);
        VTABLE_init(interp, hash);
        VTABLE_set_pmc_keyed_int(interp, iglobals,
                (INTVAL)IGLOBALS_COMPREG_HASH, hash);
    }

    VTABLE_set_pmc_keyed_str(interp, hash, type, compiler);
}

/*

=item C<PMC * Parrot_interp_compile_file(PARROT_INTERP, STRING *fullname, INTVAL
is_pasm)>

Compile code file.

TODO: This should take a PMC* option for the compiler to use. Do not assume
we have PIR/PASM compilers installed, and do not assume that the user is
going to want to use either of these. TT #2135.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_interp_compile_file(PARROT_INTERP, ARGIN(STRING *fullname), INTVAL is_pasm)
{
    ASSERT_ARGS(Parrot_interp_compile_file)
    PMC *result               = NULL;
    UINTVAL regs_used[4]      = {3, 3, 3, 3};
    PMC * const newcontext    = Parrot_push_context(interp, regs_used);
    STRING * const compiler_s = is_pasm ? CONST_STRING(interp, "PASM") : CONST_STRING(interp, "PIR");
    PMC * compiler   = Parrot_interp_get_compiler(interp, compiler_s);
    imc_info_t *imcc = (imc_info_t *) VTABLE_get_pointer(interp, compiler);

    Parrot_block_GC_mark(interp);
    Parrot_pcc_set_HLL(interp, newcontext, 0);
    Parrot_pcc_set_sub(interp, newcontext, 0);


    imcc_reset(imcc);
    result = imcc_compile_file(imcc, fullname, is_pasm);
    if (PMC_IS_NULL(result)) {
        STRING * const msg = imcc_last_error_message(imcc);
        INTVAL code = imcc_last_error_code(imcc);
        Parrot_ex_throw_from_c_args(interp, NULL, code, "%Ss", msg);
    }

    Parrot_pop_context(interp);
    Parrot_unblock_GC_mark(interp);

    return result;
}

/*

=item C<Parrot_PMC Parrot_interp_compile_string(PARROT_INTERP, Parrot_String
type, const char *code, Parrot_String *error)>

Compiles a code string.

DEPRECATED: UseParrot_interp_compile_file (or whatever replaces it, TT #2135).

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Parrot_PMC
Parrot_interp_compile_string(PARROT_INTERP, Parrot_String type, ARGIN(const char *code),
        ARGOUT(Parrot_String *error))
{
    ASSERT_ARGS(Parrot_interp_compile_string)
    PMC * const compiler = Parrot_interp_get_compiler(interp, type);

    /* XXX error is not being set */
    if (PMC_IS_NULL(compiler)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not find compiler %Ss", type);
    }
    else {
        PMC *result;
        STRING * const code_s = Parrot_str_new(interp, code, 0);
        imc_info_t * imcc     = (imc_info_t*) VTABLE_get_pointer(interp, compiler);
        const INTVAL is_pasm  = VTABLE_get_integer(interp, compiler);

        Parrot_block_GC_mark(interp);
        result = imcc_compile_string(imcc, code_s, is_pasm);
        if (PMC_IS_NULL(result)) {
            STRING * const msg = imcc_last_error_message(imcc);
            const INTVAL code  = imcc_last_error_code(imcc);

            Parrot_unblock_GC_mark(interp);
            Parrot_ex_throw_from_c_args(interp, NULL, code, "%Ss", msg);
        }
        Parrot_unblock_GC_mark(interp);
        return result;
    }
}

/*

=item C<INTVAL Parrot_interp_info(PARROT_INTERP, INTVAL what)>

C<what> specifies the type of information you want about the interpreter.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_interp_info(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(Parrot_interp_info)
    INTVAL ret;

    switch (what) {
      case TOTAL_MEM_ALLOC:
        ret = Parrot_gc_total_memory_allocated(interp);
        break;
      case TOTAL_MEM_USED:
        ret = Parrot_gc_total_memory_used(interp);
        break;
      case GC_MARK_RUNS:
        ret = Parrot_gc_count_mark_runs(interp);
        break;
      case GC_LAZY_MARK_RUNS:
        ret = Parrot_gc_count_lazy_mark_runs(interp);
        break;
      case GC_COLLECT_RUNS:
        ret = Parrot_gc_count_collect_runs(interp);
        break;
      case ACTIVE_PMCS:
        ret = Parrot_gc_active_pmcs(interp);
        break;
      case ACTIVE_BUFFERS:
        ret = Parrot_gc_active_sized_buffers(interp);
        break;
      case TOTAL_PMCS:
        ret = Parrot_gc_total_pmcs(interp);
        break;
      case TOTAL_BUFFERS:
        ret = Parrot_gc_total_sized_buffers(interp);
        break;
      case HEADER_ALLOCS_SINCE_COLLECT:
        ret = Parrot_gc_headers_alloc_since_last_collect(interp);
        break;
      case MEM_ALLOCS_SINCE_COLLECT:
        ret = Parrot_gc_mem_alloc_since_last_collect(interp);
        break;
      case TOTAL_COPIED:
        ret = Parrot_gc_total_copied(interp);
        break;
      case IMPATIENT_PMCS:
        ret = Parrot_gc_impatient_pmcs(interp);
        break;
      case CURRENT_RUNCORE:
        ret = interp->run_core->id;
        break;
      default:        /* or a warning only? */
        ret = -1;
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in Parrot_interp_info");
    }
    return ret;
}

/*

=item C<PMC* Parrot_interp_info_p(PARROT_INTERP, INTVAL what)>

C<what> specifies the type of information you want about the
interpreter.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_interp_info_p(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(Parrot_interp_info_p)

    PMC *result;
    switch (what) {
      case CURRENT_CTX:
        result = CURRENT_CONTEXT(interp);
        break;
      case CURRENT_SUB:
        result = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_CONT:
        result = Parrot_pcc_get_continuation(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_OBJECT:
        result = Parrot_pcc_get_object(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_LEXPAD:
        result = Parrot_pcc_get_lex_pad(interp, CURRENT_CONTEXT(interp));
        break;
      case CURRENT_TASK:
        result = Parrot_cx_current_task(interp);
        break;
      default:        /* or a warning only? */
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in Parrot_interp_info");
    }

    /* Don't send NULL values to P registers */
    return result ? result : PMCNULL;
}

/*

=item C<STRING* Parrot_interp_info_s(PARROT_INTERP, INTVAL what)>

Takes an interpreter name and an information type as arguments.
Returns corresponding information strings about the interpreter:
the full pathname, executable name, or the file stem,
(or throws an error exception, if the type is not recognized).
Valid types are EXECUTABLE_FULLNAME, EXECUTABLE_BASENAME,
and RUNTIME_PREFIX.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
Parrot_interp_info_s(PARROT_INTERP, INTVAL what)
{
    ASSERT_ARGS(Parrot_interp_info_s)
    switch (what) {
        case EXECUTABLE_FULLNAME: {
            PMC * const exe_name = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                    IGLOBALS_EXECUTABLE);
            if (PMC_IS_NULL(exe_name))
                return CONST_STRING(interp, "");
            return VTABLE_get_string(interp, exe_name);
        }
        case EXECUTABLE_BASENAME: {
            PMC    * const exe_name = VTABLE_get_pmc_keyed_int(interp,
                                interp->iglobals, IGLOBALS_EXECUTABLE);

            if (PMC_IS_NULL(exe_name))
                return CONST_STRING(interp, "");

            else {
                /* Need to strip back to what follows the final / or \. */
                STRING * const fullname = VTABLE_get_string(interp, exe_name);
                const int      len      = STRING_length(fullname);
                int            pos;

                for (pos = len - 1; pos > 0; --pos) {
                    const INTVAL c = STRING_ord(interp, fullname, pos);

                    if (c == '/' || c == '\\') {
                        ++pos;
                        break;
                    }
                }

                return Parrot_str_substr(interp, fullname, pos, len - pos);
            }
        }
        case RUNTIME_PREFIX:
            return Parrot_get_runtime_path(interp);
        case GC_SYS_NAME: {
            STRING * name = Parrot_gc_sys_name(interp);
            Parrot_warn_experimental(interp, "GC_SYS_NAME option is experimental");
            return name;
        }
        case CURRENT_RUNCORE:
            return interp->run_core->name;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "illegal argument in Parrot_interp_info");
    }
}

/*

=item C<Interp * Parrot_interp_get_from_pmc(PMC * interp_pmc)>

C<interp_pmc> is a ParrotInterpreter PMC. Extract the raw C<Interp*> from it
without needing an existing C<Interp *> reference.

Do not use with any other type of PMC.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Interp *
Parrot_interp_get_from_pmc(ARGIN(PMC * interp_pmc))
{
    ASSERT_ARGS(Parrot_interp_get_from_pmc)
    PARROT_ASSERT(interp_pmc->vtable->base_type == enum_class_ParrotInterpreter);
    return ((Parrot_ParrotInterpreter_attributes*)interp_pmc->data)->interp;
}

/*

=item C<void Parrot_interp_set_flag(PARROT_INTERP, INTVAL flag)>

Sets on any of the following flags, specified by C<flag>, in the interpreter:

Flag                    Effect
C<PARROT_BOUNDS_FLAG>   enable bounds checking
C<PARROT_PROFILE_FLAG>  enable profiling,

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_flag(PARROT_INTERP, INTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_set_flag)
    /* These two macros (from interpreter.h) do exactly what they look like. */

    Interp_flags_SET(interp, flag);
    switch (flag) {
      case PARROT_BOUNDS_FLAG:
      case PARROT_PROFILE_FLAG:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        break;
      default:
        break;
    }
}


/*

=item C<void Parrot_interp_set_debug(PARROT_INTERP, UINTVAL flag)>

Set a debug flag: C<PARROT_DEBUG_FLAG>.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_debug(PARROT_INTERP, UINTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_set_debug)
    interp->debug_flags |= flag;
}


/*

=item C<void Parrot_interp_set_executable_name(PARROT_INTERP, STRING * const
name)>

Sets the name of the executable launching Parrot (see C<pbc_to_exe> and the
C<parrot> binary).

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_executable_name(PARROT_INTERP, ARGIN(STRING * const name))
{
    ASSERT_ARGS(Parrot_interp_set_executable_name)
    PMC * const name_pmc = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, name_pmc, name);
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE,
        name_pmc);
}


/*

=item C<void Parrot_interp_set_trace(PARROT_INTERP, UINTVAL flag)>

Set a trace flag: C<PARROT_TRACE_FLAG>

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_trace(PARROT_INTERP, UINTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_set_trace)
    Parrot_pcc_trace_flags_on(interp, interp->ctx, flag);
    Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
}


/*

=item C<void Parrot_interp_clear_flag(PARROT_INTERP, INTVAL flag)>

Clears a flag in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_clear_flag(PARROT_INTERP, INTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_clear_flag)
    Interp_flags_CLEAR(interp, flag);
}


/*

=item C<void Parrot_interp_clear_debug(PARROT_INTERP, UINTVAL flag)>

Clears a flag in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_clear_debug(PARROT_INTERP, UINTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_clear_debug)
    interp->debug_flags &= ~flag;
}


/*

=item C<void Parrot_interp_clear_trace(PARROT_INTERP, UINTVAL flag)>

Clears a flag in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_clear_trace(PARROT_INTERP, UINTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_clear_trace)
    Parrot_pcc_trace_flags_off(interp, interp->ctx, flag);
}


/*

=item C<Parrot_Int Parrot_interp_test_flag(PARROT_INTERP, INTVAL flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Int
Parrot_interp_test_flag(PARROT_INTERP, INTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_test_flag)
    return Interp_flags_TEST(interp, flag);
}


/*

=item C<Parrot_UInt Parrot_interp_test_debug(PARROT_INTERP, UINTVAL flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_UInt
Parrot_interp_test_debug(PARROT_INTERP, UINTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_test_debug)
    return interp->debug_flags & flag;
}


/*

=item C<Parrot_UInt Parrot_interp_test_trace(PARROT_INTERP, UINTVAL flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_UInt
Parrot_interp_test_trace(PARROT_INTERP, UINTVAL flag)
{
    ASSERT_ARGS(Parrot_interp_test_trace)
    return Parrot_pcc_trace_flags_test(interp, interp->ctx, flag);
}


/*

=item C<void Parrot_interp_set_run_core(PARROT_INTERP, Parrot_Run_core_t core)>

Sets the specified run core.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_run_core(PARROT_INTERP, Parrot_Run_core_t core)
{
    ASSERT_ARGS(Parrot_interp_set_run_core)
    switch (core) {
      case PARROT_SLOW_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        break;
      case PARROT_FAST_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "fast"));
        break;
      case PARROT_EXEC_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "exec"));
        break;
      case PARROT_GC_DEBUG_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "gc_debug"));
        break;
      case PARROT_DEBUGGER_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "debugger"));
        break;
      case PARROT_PROFILING_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "profiling"));
        break;
      case PARROT_SUBPROF_SUB_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "subprof_sub"));
        break;
      case PARROT_SUBPROF_HLL_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "subprof_hll"));
        break;
      case PARROT_SUBPROF_OPS_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "subprof_ops"));
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Invalid runcore requested\n");
    }
}


/*

=item C<void Parrot_interp_set_warnings(PARROT_INTERP, Parrot_warnclass wc)>

Activates the given warnings.

=cut

*/

PARROT_EXPORT
void
Parrot_interp_set_warnings(PARROT_INTERP, Parrot_warnclass wc)
{
    ASSERT_ARGS(Parrot_interp_setwarnings)
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interp, wc);
}

/*

=back

=cut

*/

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
