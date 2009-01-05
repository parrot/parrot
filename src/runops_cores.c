/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/runops_cores.c - Run Loops

=head1 DESCRIPTION

This file implements the various run loops for the interpreter.  See
F<docs/running.pod> for a fuller description of the runcores and what they do.

=head2 Functions

=over 4

=cut

*/

#include "runops_cores.h"
#include "parrot/embed.h"
#include "trace.h"
#include "interp_guts.h"

#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cg.h"
#endif

/* HEADERIZER HFILE: src/runops_cores.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_trace_core(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_runops_trace_core __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pc)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<opcode_t * runops_fast_core>

Runs the Parrot operations starting at C<pc> until there are no more
operations.  This performs no bounds checking, profiling, or tracing.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
runops_fast_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_fast_core)
    while (pc) {
        DO_OP(pc, interp);
    }

    return pc;
}


/*

=item C<opcode_t * runops_cgoto_core>

Runs the Parrot operations starting at C<pc> until there are no more
operations, using the computed C<goto> core, performing no bounds checking,
profiling, or tracing.

If computed C<goto> is not available then Parrot exits with exit code 1.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
runops_cgoto_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_cgoto_core)
#ifdef HAVE_COMPUTED_GOTO
    pc = cg_core(pc, interp);
    return pc;
#else
    UNUSED(pc);
    Parrot_io_eprintf(interp,
            "Computed goto unavailable in this configuration.\n");
    Parrot_exit(interp, 1);
#endif
}

#ifdef code_start
#  undef code_start
#endif
#ifdef code_end
#  undef code_end
#endif

#define  code_start interp->code->base.data
#define  code_end (interp->code->base.data + interp->code->base.size)


/*

=item C<static opcode_t * runops_trace_core>

Runs the Parrot operations starting at C<pc> until there are no more
operations, using the tracing interpreter.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_trace_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_trace_core)
    static size_t dod, gc;
    Arenas * const arena_base = interp->arena_base;
    Interp *debugger;

    dod = arena_base->dod_runs;
    gc = arena_base->collect_runs;
    if (!interp->debugger) {
        PMC *pio;

        debugger = interp->debugger =
            /*
             * using a distinct interpreter for tracing should be ok
             * - just in case, make it easy to switch
             */
#if 1
            make_interpreter(interp, 0);
#else
            interp;
#endif
        /* set the top of the stack so GC can trace it for GC-able pointers
         * see trace_system_areas() in src/cpu_dep.c */
        debugger->lo_var_ptr = interp->lo_var_ptr;

        pio = Parrot_io_STDERR(debugger);

        if (Parrot_io_is_tty(debugger, pio))
            Parrot_io_setlinebuf(debugger, pio);
        else {
            /* this is essential (100 x faster!)  and should probably
             * be in init/open code */
            Parrot_io_setbuf(debugger, pio, 8192);
        }
    }
    else
        debugger = interp->debugger;

    trace_op(interp, code_start, code_end, pc);
    while (pc) {
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        CONTEXT(interp)->current_pc = pc;

        DO_OP(pc, interp);
        trace_op(interp, code_start, code_end, pc);

        if (dod != arena_base->dod_runs) {
            dod = arena_base->dod_runs;
            Parrot_io_eprintf(debugger, "       DOD\n");
        }

        if (gc != arena_base->collect_runs) {
            gc = arena_base->collect_runs;
            Parrot_io_eprintf(debugger, "       GC\n");
        }
    }

    Parrot_io_flush(debugger, Parrot_io_STDERR(debugger));

    return pc;
}


/*

=item C<opcode_t * runops_slow_core>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with tracing and bounds checking enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
runops_slow_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_slow_core)

    if (Interp_trace_TEST(interp, PARROT_TRACE_OPS_FLAG))
        return runops_trace_core(interp, pc);
#if 0
    if (interp->debugger && interp->debugger->pdb)
        return Parrot_debug(interp, interp->debugger, pc);
#endif

    while (pc) {
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        CONTEXT(interp)->current_pc = pc;

        DO_OP(pc, interp);
    }

    return pc;
}


/*

=item C<opcode_t * runops_gc_debug_core>

Runs the Parrot operations starting at C<pc> until there are no more
operations, performing a full GC run before each op.  This is very slow, but
it's also a very quick way to find GC problems.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
runops_gc_debug_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_gc_debug_core)
    while (pc) {
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        Parrot_do_dod_run(interp, 0);
        CONTEXT(interp)->current_pc = pc;

        DO_OP(pc, interp);
    }

    return pc;
}

#undef code_start
#undef code_end


/*

=item C<opcode_t * runops_profile_core>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with tracing, bounds checking, and profiling enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
runops_profile_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_profile_core)
    RunProfile * const profile = interp->profile;
    const opcode_t     old_op  = profile->cur_op;

    /* if reentering the runloop, remember old op and calc time 'til now */
    if (old_op)
        profile->data[old_op].time +=
            Parrot_floatval_time() - profile->starttime;

    while (pc) {/* && pc >= code_start && pc < code_end) */
        opcode_t cur_op;

        CONTEXT(interp)->current_pc      = pc;
        profile->cur_op                  = cur_op = *pc + PARROT_PROF_EXTRA;
        profile->starttime               = Parrot_floatval_time();
        profile->data[cur_op].numcalls++;

        DO_OP(pc, interp);

        /* profile->cur_op may be different, if exception was thrown */
        profile->data[profile->cur_op].time +=
            Parrot_floatval_time() - profile->starttime;
    }

    if (old_op) {
        /* old opcode continues */
        profile->starttime = Parrot_floatval_time();
        profile->cur_op    = old_op;
    }

    return pc;
}

/*

=item C<opcode_t * runops_debugger_core>

Used by the debugger, under construction

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
runops_debugger_core(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_debugger_core)
    /*fprintf(stderr, "Enter runops_debugger_core\n");*/

    PARROT_ASSERT(interp->pdb);

    if (interp->pdb->state & PDB_ENTER) {
        Parrot_debugger_start(interp, pc);
    }

    while (pc) {
        if (pc < interp->code->base.data || pc >= interp->code->base.data + interp->code->base.size)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "attempt to access code outside of current code segment");

        if (interp->pdb->state & PDB_GCDEBUG)
            Parrot_do_dod_run(interp, 0);

        if (interp->pdb->state & PDB_TRACING) {
            trace_op(interp,
                    interp->code->base.data,
                    interp->code->base.data +
                    interp->code->base.size,
                    interp->pdb->cur_opcode);
        }

        CONTEXT(interp)->current_pc = pc;
        DO_OP(pc, interp);

        if (interp->pdb->state & PDB_STOPPED) {
            Parrot_debugger_start(interp, pc);
        }
        else
        {
            if (PDB_break(interp)) {
                Parrot_debugger_start(interp, pc);
                continue;
            }

            if (interp->pdb->tracing) {
                if (--interp->pdb->tracing == 0) {
                    Parrot_debugger_start(interp, pc);
                }
            }
        }
    }

    return pc;
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
