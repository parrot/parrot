/* runops_cores.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The switchable runops cores.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/runops_cores.h"
#include "parrot/trace.h"

#include "parrot/interp_guts.h"

#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cg.h"
#endif

/*=for api interpreter runops_fast_core
 * run parrot operations until the program is complete
 *
 * No bounds checking.
 * No profiling.
 * No tracing.
 */

opcode_t *
runops_fast_core(struct Parrot_Interp *interpreter, opcode_t *pc)
{
    while (pc) {
        DO_OP(pc, interpreter);
    }
    return pc;
}

/*=for api interpreter runops_cgoto_core
 * run parrot operations until the program is complete, using the computed
 * goto core (if available).
 *
 * No bounds checking.
 * No profiling.
 * No tracing.
 */

opcode_t *
runops_cgoto_core(struct Parrot_Interp *interpreter, opcode_t *pc)
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

/*=for api interpreter runops_slow_core
 *
 * With tracing.
 * With profiling.
 * With bounds checking.
 */

/* using an extern interpreter for tracing is broken due
 * to Parrot_destroy: cleanup of ctx fails
 */

opcode_t *
runops_slow_core(struct Parrot_Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start;
    opcode_t *code_end;
#ifdef USE_TRACE_INTERP
    Interp * trace_i;
    struct Parrot_Context *trace_ctx;
#endif

#ifdef code_start
#  undef code_start
#endif
#ifdef code_end
#  undef code_end
#endif

#define  code_start interpreter->code->byte_code
#define  code_end   (interpreter->code->byte_code + \
        interpreter->code->cur_cs->base.size)

#ifdef USE_TRACE_INTERP
    if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
        trace_i = make_interpreter(NO_FLAGS);
        Parrot_init(trace_i, (void*)& starttime);
        /* remeber old context */
        trace_ctx = mem_sys_allocate(sizeof(struct Parrot_Context));
        mem_sys_memcopy(trace_ctx, &trace_i->ctx,
                sizeof(struct Parrot_Context));
        /* copy in current */
        mem_sys_memcopy(&trace_i->ctx, &interpreter->ctx,
                sizeof(struct Parrot_Context));
        trace_i->code = interpreter->code;
        Interp_flags_SET(trace_i, PARROT_EXTERN_CODE_FLAG);
        trace_op(trace_i, code_start, code_end, pc);
    }
#else
    if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG))
        trace_op(interpreter, code_start, code_end, pc);
#endif

    while (pc && pc >= code_start && pc < code_end) {
        if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
            interpreter->profile->data[*pc].numcalls++;
            interpreter->profile->lastpc = pc;
            interpreter->profile->starttime = Parrot_floatval_time();
        }

        DO_OP(pc, interpreter);

        if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
#ifdef USE_TRACE_INTERP
            mem_sys_memcopy(&trace_i->ctx, &interpreter->ctx,
                    sizeof(struct Parrot_Context));
            trace_op(trace_i, code_start, code_end, pc);
#else
            trace_op(interpreter, code_start, code_end, pc);
#endif
        }
        if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
            interpreter->profile->data[*interpreter->profile->lastpc].time +=
                Parrot_floatval_time() - interpreter->profile->starttime;
        }
    }
#ifdef USE_TRACE_INTERP
    if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
        /* restore trace context */
        mem_sys_memcopy(&trace_i->ctx, trace_ctx,
                sizeof(struct Parrot_Context));
        mem_sys_free(trace_ctx);
    }
#endif

    if (pc && (pc < code_start || pc >= code_end)) {
        internal_exception(INTERP_ERROR,
       "Error: Control left bounds of byte-code block (now at location %d)!\n",
       (int)(pc - code_start));
    }
#undef code_stat
#undef code_end
    return pc;
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
