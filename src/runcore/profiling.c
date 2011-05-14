/*
Copyright (C) 2009-2011, Parrot Foundation.

=head1 NAME

src/runcore/profiling.c

=head1 DESCRIPTION

Functions controlling Parrot's profiling runcore.

=head2 Functions

=over 4

=cut

*/

#include "parrot/runcore_api.h"
#include "parrot/extend.h"
#include "parrot/embed.h"
#include "parrot/runcore_profiling.h"
#include "parrot/oplib/core_ops.h"

#include "profiling.str"

#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"
#include "pmc/pmc_namespace.h"

#ifdef WIN32
#  define getpid _getpid
#endif

#define PPROF_VERSION 2

#define code_start interp->code->base.data
#define code_end (interp->code->base.data + interp->code->base.size)

/* HEADERIZER HFILE: include/parrot/runcore_profiling.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void destroy_basic_output(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore))
        __attribute__nonnull__(2);

static void destroy_profiling_core(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static char* get_filename_cstr(PARROT_INTERP,
    ARGIN(PMC* ctx_pmc),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static INTVAL get_line_num_from_cache(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(PMC *ctx_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static char* get_ns_cstr(PARROT_INTERP, ARGIN(PMC* ctx_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void init_basic_output(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void init_null_output(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static void * init_profiling_core(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void record_annotations(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(PPROF_DATA *pprof_data),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void record_bogus_parent_runloop(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t * runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void record_ctx_info(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(PPROF_DATA *pprof_data),
    ARGIN(PMC* ctx_pmc),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

static void record_op(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(PPROF_DATA *pprof_data),
    ARGIN(const char *op_name),
    INTVAL op_time,
    INTVAL line_num)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void record_values_ascii_pprof(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t * runcore),
    ARGIN(PPROF_DATA *pprof_data),
    ARGIN_NULLOK(Parrot_profiling_line type))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void record_version_and_cli(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore),
    ARGIN(PPROF_DATA* pprof_data))
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

static void store_postop_time(PARROT_INTERP,
    ARGIN(Parrot_profiling_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_destroy_basic_output __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_destroy_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_get_filename_cstr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx_pmc) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_get_line_num_from_cache __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(ctx_pmc))
#define ASSERT_ARGS_get_ns_cstr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx_pmc))
#define ASSERT_ARGS_init_basic_output __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_init_null_output __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_init_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_record_annotations __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pprof_data) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_record_bogus_parent_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_record_ctx_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pprof_data) \
    , PARROT_ASSERT_ARG(ctx_pmc) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_record_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pprof_data) \
    , PARROT_ASSERT_ARG(op_name))
#define ASSERT_ARGS_record_values_ascii_pprof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pprof_data))
#define ASSERT_ARGS_record_version_and_cli __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pprof_data))
#define ASSERT_ARGS_runops_profiling_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_store_postop_time __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void Parrot_runcore_profiling_init(PARROT_INTERP)>

Register the profiling runcore with Parrot.

=cut

*/

void
Parrot_runcore_profiling_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_profiling_init)

    Parrot_profiling_runcore_t * const coredata =
            mem_gc_allocate_zeroed_typed(interp, Parrot_profiling_runcore_t);

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

    STRING *output_str;

    /* initialize the runcore struct */
    runcore->runops  = (Parrot_runcore_runops_fn_t)  runops_profiling_core;
    runcore->destroy = (Parrot_runcore_destroy_fn_t) destroy_profiling_core;

    runcore->output.init     = NULL;
    runcore->output.store    = NULL;
    runcore->output.destroy  = NULL;
    runcore->prev_ctx        = NULL;
    runcore->profiling_flags = 0;
    runcore->runloop_count   = 0;
    runcore->time_size       = 32;
    runcore->line_cache      = Parrot_hash_new_pointer_hash(interp);
    runcore->time            = mem_gc_allocate_n_typed(interp, runcore->time_size,
                                                    UHUGEINTVAL);

    /* figure out what format the output should be in */
    output_str = Parrot_getenv(interp, CONST_STRING(interp, "PARROT_PROFILING_OUTPUT"));

    if (!STRING_IS_NULL(output_str)) {

        STRING * const profile_format_str = output_str;
        if (STRING_equal(interp, profile_format_str, CONST_STRING(interp, "pprof"))) {
            runcore->output.init    = init_basic_output;
            runcore->output.store   = record_values_ascii_pprof;
            runcore->output.destroy = destroy_basic_output;
        }
        else if (STRING_equal(interp, profile_format_str, CONST_STRING(interp, "none"))) {
            runcore->output.init    = init_null_output;
            runcore->output.store   = NULL;
            runcore->output.destroy = NULL;
        }
        else {
            Parrot_eprintf(interp, "'%Ss' is not a valid profiling output format.\n", output_str);
            Parrot_eprintf(interp, "Valid values are pprof and none.  The default is pprof.\n");
            exit(1);
        }
    }
    else {
        runcore->output.init    = init_basic_output;
        runcore->output.store   = record_values_ascii_pprof;
        runcore->output.destroy = destroy_basic_output;
    }

    RUNCORE_init(interp, runcore);

    Profiling_first_loop_SET(runcore);

    return runops_profiling_core(interp, runcore, pc);
}


/*

=item C<static opcode_t * runops_profiling_core(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations with tracing, bounds checking and profiling enabled.

Some ops, such as those which call VTABLE functions, spawn inner (a.k.a.
"inferior" or "nested") runloops.  To properly calculate the time used by these
ops, it's necessary to keep track of start and end of both the current op and
the current runloop.  The time spent by an op which spawns an inner runloop
is calculated as the time between the start of the op and the start of the
inner runloop (between A and B below), plus the time between the end of the
inner runloop and the end of the op (between C and D below).   The AB tracking
is handled after DO_OP(), using the exit_check flag to ensure that the value is
only calculated when leaving an inner runloop.  The CD tracking is handled by
C<store_postop_time>.

 ___________outer runloop_______________
/op        op with inner runloop     op \
----   ---------------------------- ----
|  |   |     __inner runloop__    | |  |
----   -    /    op    op     \   - ----
                ----  ----
       ^    ^   |  |  |  |    ^   ^
       |    |   ----  ----    |   |
       A    B                 C   D

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_profiling_core(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_profiling_core)

    opcode_t    *preop_pc;
    const char  *preop_opname;
    UHUGEINTVAL  op_time;
    PPROF_DATA   pprof_data[PPROF_DATA_MAX + 1];

    runcore->runcore_start = Parrot_hires_get_time();

    /* if we're in a inner runloop, */
    if (interp->current_runloop_level != 1)
        store_postop_time(interp, runcore);

    record_version_and_cli(interp, runcore, (PPROF_DATA *)&pprof_data);

    while (pc) {
        Parrot_Context *preop_ctx;
        INTVAL          preop_line_num;
        PMC            *preop_ctx_pmc;

        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "attempt to access code outside of current code segment");

        preop_ctx_pmc         = CURRENT_CONTEXT(interp);
        preop_ctx             = PMC_data_typed(preop_ctx_pmc, Parrot_Context*);
        preop_ctx->current_pc = pc;
        preop_pc              = pc;
        preop_opname          = interp->code->op_info_table[*pc]->name;
        preop_line_num        = get_line_num_from_cache(interp, runcore, preop_ctx_pmc);

        Profiling_exit_check_CLEAR(runcore);

        runcore->op_start  = Parrot_hires_get_time();
        DO_OP(pc, interp);
        runcore->op_finish = Parrot_hires_get_time();

        if (Profiling_exit_check_TEST(runcore)) {
            op_time  = runcore->op_finish - runcore->runcore_finish;
            op_time += runcore->time[interp->current_runloop_level-1];
            runcore->time[interp->current_runloop_level-1] = 0;
        }
        else
            op_time = runcore->op_finish - runcore->op_start;

        /* Occasionally the ctx stays the same while the sub changes, e.g.
         * with a call to a subclass' method. */
        if ((runcore->prev_ctx != preop_ctx) || runcore->prev_sub != preop_ctx->current_sub)
            record_ctx_info(interp, runcore, (PPROF_DATA *) &pprof_data, preop_ctx_pmc, preop_pc);

        if (Profiling_report_annotations_TEST(runcore) && interp->code->annotations)
            record_annotations(interp, runcore, (PPROF_DATA *) &pprof_data, pc);

        record_op(interp, runcore, (PPROF_DATA *) &pprof_data,
                  preop_opname, op_time, preop_line_num);
    }

    /* make it easy to tell separate runloops apart */
    if (interp->current_runloop_level == 1) {
        RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_END_OF_RUNLOOP);
        record_bogus_parent_runloop(interp, runcore);
    }

    Profiling_exit_check_SET(runcore);
    runcore->runcore_finish = Parrot_hires_get_time();
    return pc;
}

/*

=item C<static void record_ctx_info(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore, PPROF_DATA *pprof_data, PMC* ctx_pmc, opcode_t *pc)>

If the active context has changed, record information about the new context.

=cut

*/

static void
record_ctx_info(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
ARGIN(PPROF_DATA *pprof_data), ARGIN(PMC* ctx_pmc), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(record_ctx_info)

    Parrot_Context * const ctx = PMC_data_typed(ctx_pmc, Parrot_Context *);

    if (ctx->current_sub) {
        char * const filename_cstr = get_filename_cstr(interp, ctx_pmc, pc);
        char * const ns_cstr       = get_ns_cstr(interp, ctx_pmc);

        pprof_data[PPROF_DATA_NAMESPACE] = (PPROF_DATA) ns_cstr;
        pprof_data[PPROF_DATA_FILENAME]  = (PPROF_DATA) filename_cstr;

        if (Profiling_canonical_output_TEST(runcore)) {
            pprof_data[PPROF_DATA_SUB_ADDR]  = (PPROF_DATA) 0x3;
            pprof_data[PPROF_DATA_CTX_ADDR]  = (PPROF_DATA) 0x3;
        }
        else {
            pprof_data[PPROF_DATA_SUB_ADDR]  = (PPROF_DATA) ctx->current_sub;
            pprof_data[PPROF_DATA_CTX_ADDR]  = (PPROF_DATA) ctx;
        }

        RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_CONTEXT_SWITCH);

        Parrot_str_free_cstring(ns_cstr);
        Parrot_str_free_cstring(filename_cstr);
    }

    runcore->prev_ctx = ctx;
    runcore->prev_sub = ctx->current_sub;

}

/*

=item C<static INTVAL get_line_num_from_cache(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore, PMC *ctx_pmc)>

Return the line number for the current context, either by fetching from cache
or by calculating.

=cut

*/

static INTVAL
get_line_num_from_cache(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
ARGIN(PMC *ctx_pmc))
{

    ASSERT_ARGS(get_line_num_from_cache)

    Parrot_Context * const ctx = PMC_data_typed(ctx_pmc, Parrot_Context *);

    INTVAL line_num = Parrot_hash_value_to_int(interp, runcore->line_cache,
            Parrot_hash_get(interp, runcore->line_cache, ctx->current_pc));

    /* Parrot_sub_get_line_from_pc eats up about 20-30% of execution time
     * *with* this cache in place. */
    if (line_num == 0) {
        line_num = Parrot_sub_get_line_from_pc(interp,
                Parrot_pcc_get_sub(interp, ctx_pmc), ctx->current_pc);
        Parrot_hash_put(interp, runcore->line_cache, ctx->current_pc, (void *) line_num);
    }
    return line_num;
}

/*

=item C<static void record_annotations(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore, PPROF_DATA *pprof_data, opcode_t *pc)>

Record annotation data for the current pc, if any exist.

=cut

*/

static void
record_annotations(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
ARGIN(PPROF_DATA *pprof_data), ARGIN(opcode_t *pc))
{

    ASSERT_ARGS(record_annotations)

    PMC * const annot = PackFile_Annotations_lookup(interp,
            interp->code->annotations, pc - code_start + 1, NULL);

    if (!PMC_IS_NULL(annot)) {

        PMC * const iter = VTABLE_get_iter(interp, annot);
        while (VTABLE_get_bool(interp, iter)) {

            STRING * const key      = VTABLE_shift_string(interp, iter);
            STRING * const val      = VTABLE_get_string_keyed_str(interp, annot, key);
            char   * const key_cstr = Parrot_str_to_cstring(interp, key);
            char   * const val_cstr = Parrot_str_to_cstring(interp, val);

            pprof_data[PPROF_DATA_ANNOTATION_NAME]  = (PPROF_DATA) key_cstr;
            pprof_data[PPROF_DATA_ANNOTATION_VALUE] = (PPROF_DATA) val_cstr;
            RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_ANNOTATION);

            Parrot_str_free_cstring(key_cstr);
            Parrot_str_free_cstring(val_cstr);
        }
    }
}

/*

=item C<static void record_op(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore, PPROF_DATA *pprof_data, const char *op_name, INTVAL op_time, INTVAL
line_num)>

Record profiing information about the most recently-executed op.

=cut

*/

static void
record_op(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
ARGIN(PPROF_DATA *pprof_data), ARGIN(const char *op_name), INTVAL op_time,
INTVAL line_num)
{

    ASSERT_ARGS(record_op)

    if (Profiling_canonical_output_TEST(runcore))
        pprof_data[PPROF_DATA_TIME] = 1;
    else
        pprof_data[PPROF_DATA_TIME] = op_time;

    pprof_data[PPROF_DATA_LINE]   = line_num;
    pprof_data[PPROF_DATA_OPNAME] = (PPROF_DATA) op_name;
    RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_OP);
}




/*

=item C<static void store_postop_time(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore)>

Record the time spend between the end of an inner runloop and the end of an
outer op.

=cut

*/

static void
store_postop_time(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore))
{

    ASSERT_ARGS(store_postop_time)

    if (interp->current_runloop_level-1 >= (int)runcore->time_size) {
        runcore->time_size *= 2;
        runcore->time = mem_gc_realloc_n_typed(interp,
                runcore->time, runcore->time_size + 1, UHUGEINTVAL);
    }

    runcore->time[interp->current_runloop_level-1] = runcore->runcore_start - runcore->op_start;
}

/*

=item C<static void record_version_and_cli(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore, PPROF_DATA* pprof_data)>

Record information about CLI arguments passed to the program being profiled and
the version of the output file format.

Note that because of the way the parrot executable parses its options,
arguments passed directly to C<parrot> (such as C<--gc ms2> or C<--hash-seed
234>) will not appear here.

=cut

*/

static void
record_version_and_cli(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore),
                       ARGIN(PPROF_DATA* pprof_data))
{

    ASSERT_ARGS(record_version_and_cli)

    PMC    * const argv = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_ARGV_LIST);

    /* argv isn't initialized until after :init (etc) subs are executed */
    if (!PMC_IS_NULL(argv) && !Profiling_have_printed_cli_TEST(runcore)) {
        STRING *space, *cli_args, *cli_exe, *cli_str;
        char *cli_cstr;
        PMC *exe_name;

        Profiling_have_printed_cli_SET(runcore);
        exe_name = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE);
        space    = CONST_STRING(interp, " ");
        cli_args = Parrot_str_join(interp, space, argv);
        cli_exe  = VTABLE_get_string(interp, exe_name);
        cli_str  = Parrot_sprintf_c(interp, "%Ss %Ss", cli_exe, cli_args);
        cli_cstr = Parrot_str_to_cstring(interp, cli_str);

        /* CLI line won't reflect any options passed to the parrot binary. */
        pprof_data[PPROF_DATA_CLI] = (PPROF_DATA) cli_cstr;
        RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_CLI);

        Parrot_str_free_cstring(cli_cstr);
    }

    if (Profiling_first_loop_TEST(runcore)) {
        Profiling_first_loop_CLEAR(runcore);
        pprof_data[PPROF_DATA_VERSION] = (PPROF_DATA) PPROF_VERSION;
        RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_VERSION);
        record_bogus_parent_runloop(interp, runcore);
    }

}

/*

=item C<static char* get_ns_cstr(PARROT_INTERP, PMC* ctx_pmc)>

Return a C string containing a human-readable representation of the namespace
for C<ctx_pmc>.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static char*
get_ns_cstr(PARROT_INTERP, ARGIN(PMC* ctx_pmc))
{

    ASSERT_ARGS(get_ns_cstr)

    STRING         *sub_name, *full_ns, *ns_separator, *tmp;
    Parrot_Context * const ctx = PMC_data_typed(ctx_pmc, Parrot_Context *);
    PMC            *ns = ctx->current_namespace;

    full_ns      = Parrot_str_new(interp, "", 0);
    ns_separator = Parrot_str_new(interp, ";", 1);

    while (1) {
        GETATTR_NameSpace_name(interp, ns, tmp);

        /* The root ns has the empty string as its name, so ignore it. */
        if (Parrot_str_length(interp, tmp) == 0)
            break;

        full_ns = Parrot_str_concat(interp, ns_separator, full_ns);
        full_ns = Parrot_str_concat(interp, tmp, full_ns);

        GETATTR_NameSpace_parent(interp, ns, ns);
    }

    GETATTR_Sub_name(interp, ctx->current_sub, sub_name);
    full_ns = Parrot_str_concat(interp, full_ns, sub_name);
    return Parrot_str_to_cstring(interp, full_ns);

}


/*

=item C<static char* get_filename_cstr(PARROT_INTERP, PMC* ctx_pmc, opcode_t
*pc)>

Return the filename for C<ctx_pmc> as a C string.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static char*
get_filename_cstr(PARROT_INTERP, ARGIN(PMC* ctx_pmc), ARGIN(opcode_t *pc))
{

    ASSERT_ARGS(get_filename_cstr)

    STRING * const filename = Parrot_sub_get_filename_from_pc(interp,
            Parrot_pcc_get_sub(interp, ctx_pmc), pc);
    char * const filename_cstr = Parrot_str_to_cstring(interp, filename);

    return filename_cstr;
}



/*

=item C<static void record_bogus_parent_runloop(PARROT_INTERP,
Parrot_profiling_runcore_t * runcore)>

Record profiling information for a bogus parent runloop.  Parrot program
generally have several runloops, so a little trickery is needed to profile them
all as a single program.  This is accomplished by having a fake sub named
'main' which has no cost in itself but which appears to call all top-level
runloops as children.

=cut

*/

static void
record_bogus_parent_runloop(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t * runcore))
{
    ASSERT_ARGS(record_bogus_parent_runloop)

    PPROF_DATA pprof_data[PPROF_DATA_MAX+1];

    /* make all separate runloops appear to come from a single source */
    pprof_data[PPROF_DATA_NAMESPACE] = (PPROF_DATA) "main";
    pprof_data[PPROF_DATA_FILENAME]  = (PPROF_DATA) "no_file";
    pprof_data[PPROF_DATA_SUB_ADDR]  = 1;
    pprof_data[PPROF_DATA_CTX_ADDR]  = 1;
    RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_CONTEXT_SWITCH);

    pprof_data[PPROF_DATA_LINE]   = runcore->runloop_count;
    pprof_data[PPROF_DATA_TIME]   = 0;
    pprof_data[PPROF_DATA_OPNAME] = (PPROF_DATA) "noop";
    RUNCORE_store(interp, runcore, pprof_data, PPROF_LINE_OP);

    ++runcore->runloop_count;
}

/*

=item C<static void destroy_profiling_core(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore)>

Perform any finalization needed by the profiling runcore.

=cut

*/

static void
destroy_profiling_core(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore))
{
    ASSERT_ARGS(destroy_profiling_core)

    char * const filename_cstr = Parrot_str_to_cstring(interp, runcore->profile_filename);

    fprintf(stderr, "\nPROFILING RUNCORE: wrote profile to %s\n"
        "Use tools/dev/pprof2cg.pl to generate Callgrind-compatible "
        "output from this file.\n", filename_cstr);

    Parrot_str_free_cstring(filename_cstr);
    Parrot_hash_destroy(interp, runcore->line_cache);

    RUNCORE_destroy(interp, runcore);
    mem_gc_free(interp, runcore->time);
}

/*

=item C<static void record_values_ascii_pprof(PARROT_INTERP,
Parrot_profiling_runcore_t * runcore, PPROF_DATA *pprof_data,
Parrot_profiling_line type)>

Record profiling data to a filehandle in a human-readable format.

=cut

*/

static void
record_values_ascii_pprof(SHIM_INTERP, ARGIN(Parrot_profiling_runcore_t * runcore),
    ARGIN(PPROF_DATA *pprof_data), ARGIN_NULLOK(Parrot_profiling_line type))
{
    ASSERT_ARGS(record_values_ascii_pprof)

    switch (type) {
        case PPROF_LINE_CONTEXT_SWITCH:
            {
                const char * const pd_namespace = (const char *) pprof_data[PPROF_DATA_NAMESPACE];
                const char * const pd_filename  = (const char *) pprof_data[PPROF_DATA_FILENAME];
                const void * const sub_addr     = (const void *) pprof_data[PPROF_DATA_SUB_ADDR];
                const void * const ctx_addr     = (const void *) pprof_data[PPROF_DATA_CTX_ADDR];
                fprintf(runcore->profile_fd,
                        "CS:{x{ns:%s}x}{x{file:%s}x}{x{sub:%p}x}{x{ctx:%p}x}\n",
                        pd_namespace, pd_filename, sub_addr, ctx_addr);
            }
            break;

        case PPROF_LINE_OP:
            {
                const PPROF_DATA line     = (PPROF_DATA) pprof_data[PPROF_DATA_LINE];
                const PPROF_DATA time     = (PPROF_DATA) pprof_data[PPROF_DATA_TIME];
                const char * const opname = (const char *) pprof_data[PPROF_DATA_OPNAME];
                fprintf(runcore->profile_fd, "OP:{x{line:%d}x}{x{time:%d}x}{x{op:%s}x}\n",
                        (int) line, (int) time, opname);
            }
            break;

        case PPROF_LINE_ANNOTATION:
            {
                const char * const name  = (const char *) pprof_data[PPROF_DATA_ANNOTATION_NAME];
                const char * const value = (const char *) pprof_data[PPROF_DATA_ANNOTATION_VALUE];
                fprintf(runcore->profile_fd, "AN:{x{name:%s}x}{x{value:%s}x}\n", name, value);
            }
            break;

        case PPROF_LINE_CLI:
            fprintf(runcore->profile_fd, "CLI: %s\n", (const char *) pprof_data[PPROF_DATA_CLI]);
            break;

        case PPROF_LINE_VERSION:
            fprintf(runcore->profile_fd, "VERSION:%d\n", (int) pprof_data[PPROF_DATA_VERSION]);
            break;

        case PPROF_LINE_END_OF_RUNLOOP:
            fprintf(runcore->profile_fd, "END_OF_RUNLOOP:1\n");
            break;

        default:
            break;
    } /* switch */
}

/*

=item C<static void init_basic_output(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore)>

Perform initializattion needed by the basic output methods.

=cut

*/

static void
init_basic_output(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore))
{
    ASSERT_ARGS(init_basic_output)

    /* figure out where to write the output */
    char   *profile_filename_cstr;
    STRING * const env_filename_str = Parrot_getenv(interp, CONST_STRING(interp, "PARROT_PROFILING_FILENAME"));

    if (!STRING_IS_NULL(env_filename_str)) {
        STRING  *lc_filename;
        runcore->profile_filename = env_filename_str;
        /* this is a little goofy, but it means that we unconditionally free
         * profile_filename later in this function */
        profile_filename_cstr     = Parrot_str_to_cstring(interp, runcore->profile_filename);
        lc_filename               = Parrot_str_downcase(interp, runcore->profile_filename);

        if (STRING_equal(interp, lc_filename, CONST_STRING(interp, "stderr"))) {
            runcore->profile_fd       = stderr;
            runcore->profile_filename = lc_filename;
        }
        else if (STRING_equal(interp, lc_filename, CONST_STRING(interp, "stdout"))) {
            runcore->profile_fd       = stdout;
            runcore->profile_filename = lc_filename;
        }
        else
            runcore->profile_fd = fopen(profile_filename_cstr, "w");
    }
    else {
        runcore->profile_filename = Parrot_sprintf_c(interp, "parrot.pprof.%d", getpid());
        profile_filename_cstr     = Parrot_str_to_cstring(interp, runcore->profile_filename);
        runcore->profile_fd       = fopen(profile_filename_cstr, "w");
    }

    /* put profile_filename in the gc root set so it won't get collected */
    Parrot_str_gc_register(interp, runcore->profile_filename);

    if (!runcore->profile_fd) {
        fprintf(stderr, "unable to open %s for writing", profile_filename_cstr);
        Parrot_str_free_cstring(profile_filename_cstr);
        exit(1);
    }

    Parrot_str_free_cstring(profile_filename_cstr);

    /* figure out if annotations are wanted */
    if (!STRING_IS_NULL(Parrot_getenv(interp, CONST_STRING(interp, "PARROT_PROFILING_ANNOTATIONS")))) {
        Profiling_report_annotations_SET(runcore);
    }

    if (!STRING_IS_NULL(Parrot_getenv(interp, CONST_STRING(interp, "PARROT_PROFILING_CANONICAL_OUTPUT")))) {
        Profiling_canonical_output_SET(runcore);
    }

}

/*

=item C<static void destroy_basic_output(PARROT_INTERP,
Parrot_profiling_runcore_t *runcore)>

Perform finalization needed by the basic output methods.

=cut

*/

static void
destroy_basic_output(SHIM_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore))
{
    ASSERT_ARGS(destroy_basic_output)

    fclose(runcore->profile_fd);
}

/*

=item C<static void init_null_output(PARROT_INTERP, Parrot_profiling_runcore_t
*runcore)>

Perform initialization needed by the null output methods.

=cut

*/

static void
init_null_output(PARROT_INTERP, ARGIN(Parrot_profiling_runcore_t *runcore))
{
    ASSERT_ARGS(init_null_output)
    runcore->profile_filename = CONST_STRING(interp, "none");
}

/*

=back

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
