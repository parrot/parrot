/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/runops_cores.c - Run Loops

=head1 DESCRIPTION

This file implements the various run loops for the interpreter. A slow
one with bounds checking, tracing and (optional) profiling, and a fast
one without. There's also one which uses computed C<goto>, which enables
the faster dispatch of operations.

=head2 Functions

=over 4

=cut

*/

#include "runops_cores.h"
#include "parrot/embed.h"
#include "parrot/trace.h"
#include "interp_guts.h"

#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cg.h"
#endif

/*

=item C<opcode_t *
runops_fast_core(Interp *interpreter, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations.

No bounds checking, profiling or tracing is performed.

=cut

*/

opcode_t *
runops_fast_core(Interp *interpreter, opcode_t *pc)
{
    while (pc) {
        DO_OP(pc, interpreter);
    }
    return pc;
}

/*

=item C<opcode_t *
runops_cgoto_core(Interp *interpreter, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, using the computed C<goto> core.

No bounds checking, profiling or tracing is performed.

If computed C<goto> is not available then Parrot exits with exit code 1.

=cut

*/

opcode_t *
runops_cgoto_core(Interp *interpreter, opcode_t *pc)
{
#ifdef HAVE_COMPUTED_GOTO
    pc = cg_core(pc, interpreter);
    return pc;
#else
    PIO_eprintf(interpreter,
            "Computed goto unavailable in this configuration.\n");
    Parrot_exit(1);
    return NULL;
#endif
}

/*

=item C<opcode_t *
runops_slow_core(Interp *interpreter, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with tracing and bounds checking enabled.

=cut

*/

#ifdef code_start
#  undef code_start
#endif
#ifdef code_end
#  undef code_end
#endif

#define  code_start interpreter->code->base.data
#define  code_end   (interpreter->code->base.data + \
        interpreter->code->base.size)
static opcode_t *
runops_trace_core(Interp *interpreter, opcode_t *pc)
{
    static size_t dod, gc;
    struct Arenas *arena_base = interpreter->arena_base;
    Interp *debugger;

    dod = arena_base->dod_runs;
    gc = arena_base->collect_runs;
    if (!interpreter->debugger) {
        PMC *pio;

        debugger = interpreter->debugger = 
            /*
             * using a distinct interpreter for tracing should be ok
             * - just in case, make it easy to switch
             */
#if 1
            make_interpreter(interpreter, 0);
#else
            interpreter;
#endif
        debugger->lo_var_ptr = interpreter->lo_var_ptr;
        pio = PIO_STDERR(debugger);
        if (PIO_isatty(debugger, pio))
            PIO_setlinebuf(debugger, pio);
        else {
            /* this is essential (100 x faster!)  and should probably be in init/open code */
            PIO_setbuf(debugger, pio, 8192);
        }
    }
    else 
        debugger = interpreter->debugger;
    trace_op(interpreter, code_start, code_end, pc);
    while (pc) {
        if ( pc < code_start || pc >= code_end) {
            internal_exception(1,
                    "attempt to access code outside of current code segment");
        }
        CONTEXT(interpreter->ctx)->current_pc = pc;

        DO_OP(pc, interpreter);
        trace_op(interpreter, code_start, code_end, pc);
        if (dod != arena_base->dod_runs) {
            dod = arena_base->dod_runs;
            PIO_eprintf(debugger, "       DOD\n");
        }
        if (gc != arena_base->collect_runs) {
            gc = arena_base->collect_runs;
            PIO_eprintf(debugger, "       GC\n");
        }
    }
    return pc;
}

opcode_t *
runops_slow_core(Interp *interpreter, opcode_t *pc)
{

    if (Interp_trace_TEST(interpreter, PARROT_TRACE_OPS_FLAG)) {
        return runops_trace_core(interpreter, pc);
    }
    else if (interpreter->debugger && interpreter->debugger->pdb) {
        return Parrot_debug(interpreter->debugger, pc);
    }
    while (pc) {
        if ( pc < code_start || pc >= code_end) {
            internal_exception(1,
                    "attempt to access code outside of current code segment");
        }
        CONTEXT(interpreter->ctx)->current_pc = pc;

        DO_OP(pc, interpreter);

    }
#undef code_start
#undef code_end
    return pc;
}

/*

=item C<opcode_t *
runops_profile_core(Interp *interpreter, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with tracing, bounds checking and profiling enabled.

=cut

*/

opcode_t *
runops_profile_core(Interp *interpreter, opcode_t *pc)
{
    opcode_t cur_op;
    RunProfile * const profile = interpreter->profile;

    const opcode_t old_op = profile->cur_op;
    /*
     * if we are reentering the runloop:
     * - remember old op and calc time till now
     */
    if (old_op) {
        profile->data[old_op].time +=
            Parrot_floatval_time() - profile->starttime;
    }

    while (pc) {/* && pc >= code_start && pc < code_end) */
        CONTEXT(interpreter->ctx)->current_pc = pc;
        profile->cur_op = cur_op = *pc + PARROT_PROF_EXTRA;
        profile->data[cur_op].numcalls++;
        profile->starttime = Parrot_floatval_time();

        DO_OP(pc, interpreter);

        /* profile->cur_op may be different, if exception was thrown */
        profile->data[profile->cur_op].time +=
            Parrot_floatval_time() - profile->starttime;
    }
    if (old_op) {
        /* old opcode continues */
        profile->starttime = Parrot_floatval_time();
        profile->cur_op = old_op;
    }
    return pc;
}


/*

=back

=head1 SEE ALSO

F<src/runops_cores.h>.

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
