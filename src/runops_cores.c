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

#include "parrot/interp_guts.h"

/*=for api interpreter runops_fast_core
 * run parrot operations until the program is complete
 *
 * No bounds checking.
 * No profiling.
 * No tracing.
 */

opcode_t *
runops_fast_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    while (pc) { DO_OP(pc, interpreter); }
    return pc;
}

/*=for api interpreter runops_t1p1b1_core
 *
 * With tracing.
 * With profiling.
 * With bounds checking.
 */

opcode_t *
runops_slow_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    trace_op(interpreter, code_start, code_end, pc);
    
    while (pc && pc >= code_start && pc < code_end ) {
        if (interpreter->flags & PARROT_PROFILE_FLAG) {
            interpreter->profile[*pc]++;
        }
        DO_OP(pc, interpreter);
        trace_op(interpreter, code_start, code_end, pc);
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
