/* runops_cores.c
 *  Copyright: (When this is determined...it will go here)
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
#ifdef HAVE_COMPUTED_GOTO
    pc = cg_core(pc, interpreter);
#else
    while (pc) {
        DO_OP(pc, interpreter);
    }
#endif
    return pc;
}

/*=for api interpreter runops_slow_core
 *
 * With tracing.
 * With profiling.
 * With bounds checking.
 */

void trace_op(struct Parrot_Interp *interpreter, opcode_t *code_start,
              opcode_t *code_end, opcode_t *pc);

opcode_t *
runops_slow_core(struct Parrot_Interp *interpreter, opcode_t *pc)
{
    opcode_t *code_start;
    INTVAL code_size;           /* in opcodes */
    opcode_t *code_end;
    opcode_t *lastpc = NULL;
    FLOATVAL starttime = 0;

    code_start = interpreter->code->byte_code;
    code_size = interpreter->code->byte_code_size / sizeof(opcode_t);
    code_end = interpreter->code->byte_code + code_size;

    if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
        trace_op(interpreter, code_start, code_end, pc);
    }

    while (pc && pc >= code_start && pc < code_end) {
        if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
            interpreter->profile[*pc].numcalls++;
            lastpc = pc;
            starttime = Parrot_floatval_time();
        }

        DO_OP(pc, interpreter);

        if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
            trace_op(interpreter, code_start, code_end, pc);
        }
        if (Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
            interpreter->profile[*lastpc].time +=
                Parrot_floatval_time() - starttime;
        }
    }

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
