/*
Copyright (C) 2009, Parrot Foundation.
$Id$

=head2 Functions

=over 4

=cut

*/

#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/runcore_profiling.h"
#include "parrot/oplib/core_ops.h"

#include "profiling.str"

#include "../pmc/pmc_sub.h"

#ifdef WIN32
#  define getpid _getpid
#endif

#define  code_start interp->code->base.data
#define  code_end (interp->code->base.data + interp->code->base.size)

/* HEADERIZER HFILE: include/parrot/runcore_profiling.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CAN_RETURN_NULL
static void * init_profiling_core(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_profiling_core(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_init_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    && PARROT_ASSERT_ARG(runcore) \
    && PARROT_ASSERT_ARG(pc)
#define ASSERT_ARGS_runops_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    && PARROT_ASSERT_ARG(runcore) \
    && PARROT_ASSERT_ARG(pc)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void Parrot_runcore_profiling_init(PARROT_INTERP)>

Registers the profiling runcore with Parrot.

=cut

*/

void
Parrot_runcore_profiling_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_profiling_init)

    Parrot_profiling_runcore_t *coredata =
                                 mem_allocate_typed(Parrot_profiling_runcore_t);

    coredata->name        = CONST_STRING(interp, "profiling");
    coredata->id          = PARROT_PROFILING_CORE;
    coredata->opinit      = PARROT_CORE_OPLIB_INIT;
    coredata->runops      = (Parrot_runcore_runops_fn_t) init_profiling_core;
    coredata->destroy     = NULL;
    coredata->prepare_run = NULL;
    coredata->flags       = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, (Parrot_runcore_t *) coredata);
}


/*

=item C<static void * init_profiling_core(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore, opcode_t *pc)>

Perform initialization for the profiling runcore.

=cut

*/

PARROT_CAN_RETURN_NULL
static void *
init_profiling_core(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(init_profiling_core)

    char *profile_filename, *profile_output_var;
    int free_env_var;

    profile_output_var = Parrot_getenv("PARROT_PROFILING_OUTPUT", &free_env_var);

    if (profile_output_var) {
        STRING  *lc_filename;
        runcore->profile_filename = Parrot_str_new(interp, profile_output_var, 0);
        profile_filename          = Parrot_str_to_cstring(interp, runcore->profile_filename);
        lc_filename               = Parrot_str_downcase(interp, runcore->profile_filename);

        if (Parrot_str_equal(interp, lc_filename, CONST_STRING(interp, "stderr"))) {
            runcore->profile_fd       = stderr;
            runcore->profile_filename = lc_filename;
        }
        else if (Parrot_str_equal(interp, lc_filename, CONST_STRING(interp, "stdout"))) {
            runcore->profile_fd       = stdout;
            runcore->profile_filename = lc_filename;
        }
        else
            runcore->profile_fd = fopen(profile_filename, "w");

        if (free_env_var)
            mem_sys_free(profile_output_var);
    }
    else {
        runcore->profile_filename = Parrot_sprintf_c(interp, "parrot.pprof.%d", getpid());
        profile_filename          = Parrot_str_to_cstring(interp, runcore->profile_filename);
        runcore->profile_fd       = fopen(profile_filename, "w");
    }

    /* profile_filename gets collected if it's not marked or in the root set. */
    gc_register_pmc(interp, (PMC *) runcore->profile_filename);

    runcore->runops  = (Parrot_runcore_runops_fn_t)  runops_profiling_core;
    runcore->destroy = (Parrot_runcore_destroy_fn_t) destroy_profiling_core;

    runcore->prev_ctx        = 0;
    runcore->profiling_flags = 0;
    runcore->runloop_count   = 0;
    runcore->level           = 0;
    runcore->time_size       = 32;
    runcore->time            = mem_allocate_n_typed(runcore->time_size,
                                                    UHUGEINTVAL);
    Profiling_first_loop_SET(runcore);

    if (!runcore->profile_fd) {
        fprintf(stderr, "unable to open %s for writing", profile_filename);
        Parrot_str_free_cstring(profile_filename);
        exit(1);
    }

    Parrot_str_free_cstring(profile_filename);

    return runops_profiling_core(interp, runcore, pc);
}


/*

=item C<static opcode_t * runops_profiling_core(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with tracing, bounds checking, and profiling enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_profiling_core(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_profiling_core)

    PMC                *preop_sub, *argv;
    opcode_t           *preop_pc;
    STRING             *unknown_file = CONST_STRING(interp, "<unknown file>");
    UHUGEINTVAL         op_time;

    runcore->runcore_start = Parrot_hires_get_time();

    /* if we're in a nested runloop, */
    if (runcore->level != 0) {

        if (runcore->level >= runcore->time_size) {
            runcore->time_size *= 2;
            runcore->time =
                mem_realloc_n_typed(runcore->time, runcore->time_size + 1,
                                    UHUGEINTVAL);
        }

        /* store the time between DO_OP and the start of this runcore in this
         * op's running total */
        runcore->time[runcore->level] =
             runcore->runcore_start - runcore->op_start;
    }

    argv = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_ARGV_LIST);

    if (argv && !Profiling_have_printed_cli_TEST(runcore)) {
        /* silly way to avoid line length codingstds nit */
        PMC    *iglobals     = interp->iglobals;
        PMC    *executable   = VTABLE_get_pmc_keyed_int(interp, iglobals,
                                                        IGLOBALS_EXECUTABLE);
        STRING *command_line = Parrot_str_join(interp, CONST_STRING(interp, " "), argv);

        char   *exec_cstr, *command_line_cstr;

        exec_cstr         = Parrot_str_to_cstring(interp,
                                 VTABLE_get_string(interp, executable));
        command_line_cstr = Parrot_str_to_cstring(interp, command_line);

        /* CLI line won't reflect any options passed to the parrot binary. */
        fprintf(runcore->profile_fd, "CLI:%s %s\n", exec_cstr, command_line_cstr);

        Parrot_str_free_cstring(exec_cstr);
        Parrot_str_free_cstring(command_line_cstr);

        Profiling_have_printed_cli_SET(runcore);
    }

    if (Profiling_first_loop_TEST(runcore)) {
        fprintf(runcore->profile_fd, "VERSION:1\n");

        /* silly hack to make all separate runloops appear to come from a
         * single source
         * NOTE: yes, {x{ foo:bar }x} is ugly an inefficient.  Escaping would
         * be more effort but the priority right now is to get the runcore
         * working correctly.  Once all the bugs are ironed out we'll switch to
         * a nice efficient compressed binary format. */
        fprintf(runcore->profile_fd,
            "CS:{x{ns:main}x}{x{file:no_file}x}{x{sub:0x1}x}{x{ctx:0x1}x}\n"
            "OP:{x{line:%d}x}{x{time:0}x}{x{op:noop}x}\n",
             (int) runcore->runloop_count);

        runcore->runloop_count++;
        Profiling_first_loop_CLEAR(runcore);
    }

    while (pc) {
        STRING         *postop_filename;
        Parrot_Context *preop_ctx;
        INTVAL          preop_line;

        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "attempt to access code outside of current code segment");

        preop_line = Parrot_Sub_get_line_from_pc(interp,
                Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp)),
                CONTEXT(interp)->current_pc);

        CONTEXT(interp)->current_pc = pc;
        preop_sub                   = CONTEXT(interp)->current_sub;
        preop_pc                    = pc;
        preop_ctx                   = CONTEXT(interp);

        runcore->level++;
        Profiling_exit_check_CLEAR(runcore);

        runcore->op_start  = Parrot_hires_get_time();
        DO_OP(pc, interp);
        runcore->op_finish = Parrot_hires_get_time();

        if (Profiling_exit_check_TEST(runcore)) {
            op_time  = runcore->op_finish - runcore->runcore_finish;
            op_time += runcore->time[runcore->level];
            runcore->time[runcore->level] = 0;
        }
        else
            op_time = runcore->op_finish - runcore->op_start;

        runcore->level--;
        postop_filename = Parrot_Sub_get_filename_from_pc(interp,
                Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp)), pc);

        /* if current context changed since the last printing of a CS line... */
        /* Occasionally the ctx stays the same while the sub changes, possible
         * with a call to a subclass' method. */

        if ((runcore->prev_ctx != preop_ctx)
        ||   runcore->prev_sub != preop_ctx->current_sub) {

            if (preop_ctx->current_sub) {
                STRING *sub_name;
                char *sub_cstr, *filename_cstr, *ns_cstr;

                GETATTR_Sub_name(interp, preop_ctx->current_sub, sub_name);
                sub_cstr      = Parrot_str_to_cstring(interp, sub_name);
                filename_cstr = Parrot_str_to_cstring(interp, postop_filename);
                ns_cstr       = Parrot_str_to_cstring(interp,
                                    VTABLE_get_string(interp,
                                        preop_ctx->current_namespace));

                fprintf(runcore->profile_fd,
                    "CS:{x{ns:%s;%s}x}{x{file:%s}x}{x{sub:0x%p}x}{x{ctx:0x%p}x}\n",
                    ns_cstr, sub_cstr, filename_cstr,
                    preop_ctx->current_sub, preop_ctx);

                Parrot_str_free_cstring(sub_cstr);
                Parrot_str_free_cstring(filename_cstr);
                Parrot_str_free_cstring(ns_cstr);
            }

            runcore->prev_ctx = preop_ctx;
            runcore->prev_sub = preop_ctx->current_sub;
        }

        fprintf(runcore->profile_fd,
            "OP:{x{line:%d}x}{x{time:%li}x}{x{op:%s}x}\n",
            (int)preop_line, (unsigned long)op_time,
            (interp->op_info_table)[*preop_pc].name);
    }

    /* make it easy to tell separate runloops apart */
    if (runcore->level == 0) {
        fprintf(runcore->profile_fd, "END_OF_RUNLOOP\n");

        /* silly hack to make all separate runloops appear to come from a
         * single source */
        fprintf(runcore->profile_fd,
            "CS:{x{ns:main}x}{x{file:no_file}x}{x{sub:0x1}x}{x{ctx:0x1}x}\n"
            "OP:{x{line:%d}x}{x{time:0}x}{x{op:noop}x}\n",
            (int) runcore->runloop_count);

        runcore->runloop_count++;
    }

    Profiling_exit_check_SET(runcore);
    runcore->runcore_finish = Parrot_hires_get_time();;
    return pc;
}


/*

=item C<void * destroy_profiling_core(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore)>

Perform any finalization needed by the profiling runcore.

=cut

*/

PARROT_CAN_RETURN_NULL
void *
destroy_profiling_core(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore))
{
    ASSERT_ARGS(destroy_profiling_core)

    char *filename_cstr = Parrot_str_to_cstring(interp, runcore->profile_filename);

    fprintf(stderr, "\nPROFILING RUNCORE: wrote profile to %s\n"
        "Use tools/dev/pprof2cg.pl to generate Callgrind-compatible "
        "output from this file.\n", filename_cstr);

    Parrot_str_free_cstring(filename_cstr);

    fclose(runcore->profile_fd);
    mem_sys_free(runcore->time);

    return NULL;
}

/*

=back

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
