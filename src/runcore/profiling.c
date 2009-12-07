/*
Copyright (C) 2009, Parrot Foundation.
$Id$

=head1 NAME

src/runcore/profiling.c

=head1 DESCRIPTION

Functions controlling Parrot's profiling runcore.

=head2 Functions

=over 4

=cut

*/

#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/runcore_profiling.h"
#include "parrot/oplib/core_ops.h"

#include "profiling.str"

#include "pmc/pmc_sub.h"
#include "pmc/pmc_context.h"
#include "pmc/pmc_namespace.h"

#ifdef WIN32
#  define getpid _getpid
#endif

#define PPROF_VERSION 2
#define MAX_NAMESPACE_DEPTH 32

#define code_start interp->code->base.data
#define code_end (interp->code->base.data + interp->code->base.size)

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

static void record_values_ascii_pprof(
    ARGIN(Parrot_profiling_runcore_t * runcore),
    ARGIN(Parrot_profiling_line type))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_profiling_core(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_init_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_record_values_ascii_pprof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(type))
#define ASSERT_ARGS_runops_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
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

    profile_output_var = Parrot_getenv(interp, CONST_STRING(interp, "PARROT_PROFILING_OUTPUT"));

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

    runcore->prev_ctx        = NULL;
    runcore->profiling_flags = 0;
    runcore->runloop_count   = 0;
    runcore->level           = 0;
    runcore->time_size       = 32;
    runcore->line_cache      = parrot_new_pointer_hash(interp);
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

        char   *exec_cstr, *cli_cstr, *full_cli_cstr;

        exec_cstr = Parrot_str_to_cstring(interp,
                VTABLE_get_string(interp, executable));
        cli_cstr  = Parrot_str_to_cstring(interp, command_line);

        /* CLI line won't reflect any options passed to the parrot binary. */
        fprintf(runcore->profile_fd, "CLI:%s %s\n", exec_cstr, cli_cstr);

        Parrot_str_free_cstring(exec_cstr);
        Parrot_str_free_cstring(cli_cstr);

        Profiling_have_printed_cli_SET(runcore);
    }

    if (Profiling_first_loop_TEST(runcore)) {

        record_values_ascii_pprof(runcore, PPROF_LINE_VERSION);

        /* make all separate runloops appear to come from a single source */
        runcore->pprof_data[PPROF_DATA_NAMESPACE] = (PPROF_DATA) "main";
        runcore->pprof_data[PPROF_DATA_FILENAME]  = (PPROF_DATA) "no_file";
        runcore->pprof_data[PPROF_DATA_SUB_ADDR]  = 1;
        runcore->pprof_data[PPROF_DATA_CTX_ADDR]  = 1;
        record_values_ascii_pprof(runcore, PPROF_LINE_CONTEXT_SWITCH);

        runcore->pprof_data[PPROF_DATA_LINE]   = runcore->runloop_count;
        runcore->pprof_data[PPROF_DATA_TIME]   = 0;
        runcore->pprof_data[PPROF_DATA_OPNAME] = (PPROF_DATA) "noop";
        record_values_ascii_pprof(runcore, PPROF_LINE_OP);

        runcore->runloop_count++;
        Profiling_first_loop_CLEAR(runcore);
    }

    while (pc) {
        STRING         *preop_filename;
        Parrot_Context *preop_ctx;
        INTVAL          preop_line;

        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "attempt to access code outside of current code segment");

        preop_ctx = PMC_data_typed(CURRENT_CONTEXT(interp), Parrot_Context*);
        preop_line = hash_value_to_int(interp, runcore->line_cache,
            parrot_hash_get(interp, runcore->line_cache,
                        preop_ctx->current_pc));

        preop_filename = Parrot_Sub_get_filename_from_pc(interp,
                Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp)), pc);

        if (preop_line == 0) {
            preop_line = Parrot_Sub_get_line_from_pc(interp,
                    Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp)),
                    preop_ctx->current_pc);
            parrot_hash_put(interp, runcore->line_cache,
                            preop_ctx->current_pc, (void *) preop_line);
        }

        preop_ctx->current_pc = pc;
        preop_sub             = preop_ctx->current_sub;
        preop_pc              = pc;

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

        /* if current context changed since the last printing of a CS line... */
        /* Occasionally the ctx stays the same while the sub changes, possible
         * with a call to a subclass' method. */

        if ((runcore->prev_ctx != preop_ctx)
        ||   runcore->prev_sub != preop_ctx->current_sub) {

            if (preop_ctx->current_sub) {
                STRING *sub_name, *full_ns, *ns_separator;
                char   *full_ns_cstr, *filename_cstr;
                STRING *ns_names[MAX_NAMESPACE_DEPTH];
                PMC    *ns = preop_ctx->current_namespace;
                INTVAL  i;

                filename_cstr = Parrot_str_to_cstring(interp, preop_filename);

                /* build the namespace string */
                full_ns      = Parrot_str_new(interp, "", 0);
                ns_separator = Parrot_str_new(interp, ";", 1);

                i = MAX_NAMESPACE_DEPTH - 1;
                for (;ns ; i--) {
                    if (i < 0) {
                        /* should probably warn about truncated namespace here */
                        break;
                    }
                    GETATTR_NameSpace_name(interp, ns, ns_names[i]);
                    GETATTR_NameSpace_parent(interp, ns, ns);
                }

                i++;
                i++; /* the root namespace has an empty name, so ignore it */
                for (;i < MAX_NAMESPACE_DEPTH; i++) {
                    full_ns = Parrot_str_concat(interp, full_ns, ns_names[i], 0);
                    full_ns = Parrot_str_concat(interp, full_ns, ns_separator, 0);
                }

                GETATTR_Sub_name(interp, preop_ctx->current_sub, sub_name);
                full_ns = Parrot_str_concat(interp, full_ns, sub_name, 0);
                full_ns_cstr = Parrot_str_to_cstring(interp, full_ns);

                runcore->pprof_data[PPROF_DATA_NAMESPACE] = (PPROF_DATA) full_ns_cstr;
                runcore->pprof_data[PPROF_DATA_FILENAME]  = (PPROF_DATA) filename_cstr;
                runcore->pprof_data[PPROF_DATA_SUB_ADDR]  = (PPROF_DATA) preop_ctx->current_sub;
                runcore->pprof_data[PPROF_DATA_CTX_ADDR]  = (PPROF_DATA) preop_ctx;
                record_values_ascii_pprof(runcore, PPROF_LINE_CONTEXT_SWITCH);

                Parrot_str_free_cstring(full_ns_cstr);
                Parrot_str_free_cstring(filename_cstr);
            }

            runcore->prev_ctx = preop_ctx;
            runcore->prev_sub = preop_ctx->current_sub;
        }

        runcore->pprof_data[PPROF_DATA_LINE]   = preop_line;
        runcore->pprof_data[PPROF_DATA_TIME]   = op_time;
        runcore->pprof_data[PPROF_DATA_OPNAME] =
            (PPROF_DATA)(interp->op_info_table)[*preop_pc].name;
        record_values_ascii_pprof(runcore, PPROF_LINE_OP);
    }

    /* make it easy to tell separate runloops apart */
    if (runcore->level == 0) {
        record_values_ascii_pprof(runcore, PPROF_LINE_END_OF_RUNLOOP);

        /* make all separate runloops appear to come from a single source */
        runcore->pprof_data[PPROF_DATA_NAMESPACE] = (PPROF_DATA) "main";
        runcore->pprof_data[PPROF_DATA_FILENAME]  = (PPROF_DATA) "no_file";
        runcore->pprof_data[PPROF_DATA_SUB_ADDR]  = 1;
        runcore->pprof_data[PPROF_DATA_CTX_ADDR]  = 1;
        record_values_ascii_pprof(runcore, PPROF_LINE_CONTEXT_SWITCH);

        runcore->pprof_data[PPROF_DATA_LINE]   = runcore->runloop_count;
        runcore->pprof_data[PPROF_DATA_TIME]   = 0;
        runcore->pprof_data[PPROF_DATA_OPNAME] = (PPROF_DATA) "noop";
        record_values_ascii_pprof(runcore, PPROF_LINE_OP);

        runcore->runloop_count++;
    }

    Profiling_exit_check_SET(runcore);
    runcore->runcore_finish = Parrot_hires_get_time();;
    return pc;
}

/*

=item C<static void record_values_ascii_pprof(Parrot_profiling_runcore_t *
runcore, Parrot_profiling_line type)>

Record profiling data to a filehandle in a human-readable format.

=cut

*/

static void
record_values_ascii_pprof(ARGIN(Parrot_profiling_runcore_t * runcore),
ARGIN(Parrot_profiling_line type))
{
    ASSERT_ARGS(record_values_ascii_pprof)

    switch (type) {
        case PPROF_LINE_CONTEXT_SWITCH:
            {
                char *pnamespace = (char *) runcore->pprof_data[PPROF_DATA_NAMESPACE];
                char *pfilename  = (char *) runcore->pprof_data[PPROF_DATA_FILENAME];
                void *sub_addr =  (void *) runcore->pprof_data[PPROF_DATA_SUB_ADDR];
                void *ctx_addr =  (void *) runcore->pprof_data[PPROF_DATA_CTX_ADDR];
                fprintf(runcore->profile_fd,
                        "OP:{x{ns:%s}x}{x{file:%s}x}{x{sub:%p}x}{x{ctx:%p}x}\n",
                        pnamespace, pfilename, sub_addr, ctx_addr);
            }
            break;

        case PPROF_LINE_OP:
            {
                PPROF_DATA line   = (PPROF_DATA) runcore->pprof_data[PPROF_DATA_LINE];
                PPROF_DATA time   = (PPROF_DATA) runcore->pprof_data[PPROF_DATA_TIME];
                char  *opname = (char *) runcore->pprof_data[PPROF_DATA_OPNAME];
                fprintf(runcore->profile_fd, "OP:{x{line:%d}x}{x{time:%d}x}{x{op:%s}x}\n",
                        (int) line, (int) time, opname);
            }
            break;

        case PPROF_LINE_CLI:
            {
                char *cli = (char *) runcore->pprof_data[PPROF_DATA_CLI];
                fprintf(runcore->profile_fd, "CLI: %s\n", cli);
            }
            break;

        case PPROF_LINE_VERSION:
            fprintf(runcore->profile_fd, "VERSION:%d\n", PPROF_VERSION);
            break;

        case PPROF_LINE_END_OF_RUNLOOP:
            fprintf(runcore->profile_fd, "END_OF_RUNLOOP:1\n");
            break;

        default:
            break;
    } /* switch */
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
    parrot_hash_destroy(interp, runcore->line_cache);

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
