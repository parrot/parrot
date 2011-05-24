/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/runcore/main.c - main functions for Parrot runcores

=head1 DESCRIPTION

The runcore API handles running the operations.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/runcore_profiling.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/oplib/ops.h"
#include "main.str"

#include "parrot/dynext.h"
#include "pmc/pmc_parrotlibrary.h"
#include "pmc/pmc_callcontext.h"


/* HEADERIZER HFILE: include/parrot/runcore_api.h */
/* XXX Needs to get done at the same time as the other interpreter files */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static oplib_init_f get_dynamic_op_lib_init(PARROT_INTERP,
    ARGIN(const PMC *lib))
        __attribute__nonnull__(2);

#define ASSERT_ARGS_get_dynamic_op_lib_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lib))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void Parrot_runcore_init(PARROT_INTERP)>

Initializes the runcores.

=cut

*/

void
Parrot_runcore_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_init)
    STRING * const default_core = CONST_STRING(interp, "fast");

    interp->cores        = NULL;
    interp->num_cores    = 0;

    Parrot_runcore_slow_init(interp);
    Parrot_runcore_fast_init(interp);

    Parrot_runcore_exec_init(interp);
    Parrot_runcore_gc_debug_init(interp);
    Parrot_runcore_debugger_init(interp);

    Parrot_runcore_profiling_init(interp);

    /* set the default runcore */
    Parrot_runcore_switch(interp, default_core);
}


/*

=item C<INTVAL Parrot_runcore_register(PARROT_INTERP, Parrot_runcore_t
*coredata)>

Registers a new runcore with Parrot.  Returns 1 on success, 0 on failure.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_runcore_register(PARROT_INTERP, ARGIN(Parrot_runcore_t *coredata))
{
    ASSERT_ARGS(Parrot_runcore_register)
    size_t i = interp->num_cores++;

    interp->cores = mem_gc_realloc_n_typed_zeroed(interp, interp->cores,
            interp->num_cores, i, Parrot_runcore_t *);

    interp->cores[i] = coredata;

    return 1;
}


/*

=item C<void Parrot_runcore_switch(PARROT_INTERP, STRING *name)>

Switches to a named runcore.  Throws an exception on an unknown runcore.

=cut

*/

PARROT_EXPORT
void
Parrot_runcore_switch(PARROT_INTERP, ARGIN(STRING *name))
{
    ASSERT_ARGS(Parrot_runcore_switch)

    size_t num_cores = interp->num_cores;
    size_t i;

    if (interp->run_core
    &&  STRING_equal(interp, name, interp->run_core->name))
        return;

    for (i = 0; i < num_cores; ++i) {
        if (STRING_equal(interp, name, interp->cores[i]->name)) {
            interp->run_core = interp->cores[i];
            return;
        }
    }

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Invalid runcore %Ss requested\n", name);
}


/*

=item C<static oplib_init_f get_dynamic_op_lib_init(PARROT_INTERP, const PMC
*lib)>

Returns an dynamic oplib's opcode's library C<op_lib> init function.

C<lib> will be a C<ParrotLibrary> PMC.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static oplib_init_f
get_dynamic_op_lib_init(SHIM_INTERP, ARGIN(const PMC *lib))
{
    ASSERT_ARGS(get_dynamic_op_lib_init)
    return (oplib_init_f)D2FPTR(
            ((Parrot_ParrotLibrary_attributes *)PMC_data(lib))->oplib_init);
}


/*

=item C<void prepare_for_run(PARROT_INTERP)>

Prepares to run the interpreter's run core.

=cut

*/

void
prepare_for_run(PARROT_INTERP)
{
    ASSERT_ARGS(prepare_for_run)
    const runcore_prepare_fn_type prepare_run = interp->run_core->prepare_run;

    if (prepare_run)
        (*prepare_run)(interp, interp->run_core);
}


/*

=item C<void runops_int(PARROT_INTERP, size_t offset)>

Run Parrot operations of loaded code segment until an end opcode is
reached.  Run core is selected depending on the C<Interp_flags>.  When a
C<restart> opcode is encountered, a different core may be selected and
evaluation of opcode continues.

=cut

*/

void
runops_int(PARROT_INTERP, size_t offset)
{
    ASSERT_ARGS(runops_int)

    interp->resume_offset = offset;
    interp->resume_flag  |= RESUME_RESTART;

    while (interp->resume_flag & RESUME_RESTART) {
        opcode_t * const pc = (opcode_t *)
            interp->code->base.data + interp->resume_offset;
        const runcore_runops_fn_type core = interp->run_core->runops;

        interp->resume_offset = 0;
        interp->resume_flag  &= ~(RESUME_RESTART | RESUME_INITIAL);

        (*core)(interp, interp->run_core, pc);

        /* if we have fallen out with resume and we were running CGOTO, set
         * the stacktop again to a sane value, so that restarting the runloop
         * is ok. */
        if (interp->resume_flag & RESUME_RESTART) {
            if ((int)interp->resume_offset < 0)
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "branch_cs: illegal resume offset");
        }
    }
}


/*

=item C<void Parrot_runcore_destroy(PARROT_INTERP)>

Shuts down the runcores and deallocates any dynops memory.

=cut

*/

void
Parrot_runcore_destroy(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_destroy)
    size_t            num_cores = interp->num_cores;
    size_t            i;

    for (i = 0; i < num_cores; ++i) {
        Parrot_runcore_t * const core = interp->cores[i];
        const runcore_destroy_fn_type destroy = core->destroy;

        if (destroy)
            (*destroy)(interp, core);

        mem_gc_free(interp, core);
    }

    if (interp->cores)
        mem_gc_free(interp, interp->cores);

    interp->cores    = NULL;
    interp->run_core = NULL;

    if (interp->all_op_libs)
        mem_gc_free(interp, interp->all_op_libs);

    interp->all_op_libs = NULL;
}


/*

=back

=head2 Dynamic Loading Functions

=over 4

=item C<void dynop_register(PARROT_INTERP, PMC *lib_pmc)>

Register a dynamic oplib.

=cut

*/

PARROT_EXPORT
void
dynop_register(PARROT_INTERP, ARGIN(PMC *lib_pmc))
{
    ASSERT_ARGS(dynop_register)
    op_lib_t     *lib;
    oplib_init_f  init_func;

    if (n_interpreters > 1) {
        /* This is not supported yet because interp->all_op_libs
         * and interp->op_hash are shared.
         */
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "loading a new dynoplib while "
            "more than one thread is running is not supported.");
    }

    if (!interp->all_op_libs)
        interp->all_op_libs = mem_gc_allocate_n_zeroed_typed(interp,
                interp->n_libs + 1, op_lib_t*);
    else
        interp->all_op_libs = mem_gc_realloc_n_typed_zeroed(interp, interp->all_op_libs,
                interp->n_libs + 1, interp->n_libs, op_lib_t *);

    init_func = get_dynamic_op_lib_init(interp, lib_pmc);
    lib       = init_func(interp, 1);

    interp->all_op_libs[interp->n_libs++] = lib;

    /* if we are registering an op_lib variant, called from below the base
     * names of this lib and the previous one are the same */
    if (interp->n_libs >= 2
    && (STREQ(interp->all_op_libs[interp->n_libs-2]->name, lib->name)))
        return;

    parrot_hash_oplib(interp, lib);
}


/*

=item C<void parrot_hash_oplib(PARROT_INTERP, op_lib_t *lib)>

Add the ops in C<lib> to the global name => op_info hash.

=cut

*/

void
parrot_hash_oplib(PARROT_INTERP, ARGIN(op_lib_t *lib))
{
    ASSERT_ARGS(parrot_hash_oplib)

    int i;

    DECL_CONST_CAST;

    for (i = 0; i < lib->op_count; i++) {
        op_info_t *op = &lib->op_info_table[i];
        Parrot_hash_put(interp, interp->op_hash, PARROT_const_cast(char *, op->full_name),
                                                 (void *)op);

        if (!Parrot_hash_exists(interp, interp->op_hash, PARROT_const_cast(char *, op->name)))
            Parrot_hash_put(interp, interp->op_hash, PARROT_const_cast(char *, op->name),
                                                     (void *)op);
    }
}


/*

=item C<void disable_event_checking(PARROT_INTERP)>

Restore old function table.

XXX This is only implemented for the function core at present.

=cut

*/

PARROT_EXPORT
void
disable_event_checking(PARROT_INTERP)
{
    ASSERT_ARGS(disable_event_checking)
    PackFile_ByteCode *cs = interp->code;
    /* restore func table */
    PARROT_ASSERT(cs->save_func_table);
    cs->op_func_table   = cs->save_func_table;
    cs->save_func_table = NULL;
}


/*

=item C<void enable_event_checking(PARROT_INTERP)>

Replace func table with one that does event checking for all opcodes.

NOTE: C<enable_event_checking()> is called async by the event handler
thread. All action done from here has to be async safe.

XXX This is only implemented for the function core at present.

=cut

*/

PARROT_EXPORT
void
enable_event_checking(PARROT_INTERP)
{
    ASSERT_ARGS(enable_event_checking)
    PackFile_ByteCode *cs = interp->code;

    /* only save if we're not already event checking */
    if (cs->save_func_table == NULL)
        cs->save_func_table = cs->op_func_table;

    /* ensure event checking table is big enough */
    if (interp->evc_func_table_size < cs->op_count) {
        size_t i;
        op_lib_t *core_lib = get_core_op_lib_init(interp, interp->run_core)(interp, 1);

        interp->evc_func_table = interp->evc_func_table ?
                                    mem_gc_realloc_n_typed_zeroed(interp,
                                        interp->evc_func_table, cs->op_count,
                                        interp->evc_func_table_size, op_func_t) :
                                    mem_gc_allocate_n_zeroed_typed(interp,
                                        cs->op_count, op_func_t);

        for (i = interp->evc_func_table_size; i < cs->op_count; i++)
            interp->evc_func_table[i] =
                core_lib->op_func_table[PARROT_OP_check_events__];

        interp->evc_func_table_size = cs->op_count;
    }

    /* put evc table in place */
    cs->op_func_table   = interp->evc_func_table;
}


/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interp/inter_cb.c>,
F<src/interp/inter_create.c>, F<src/interp/inter_misc.c>, F<src/call/ops.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
