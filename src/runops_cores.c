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

runops_core_f   runops_cores[] = {
  runops_t0p0b0_core,
  runops_t0p0b1_core,
  runops_t0p1b0_core,
  runops_t0p1b1_core,
  runops_t1p0b0_core,
  runops_t1p0b1_core,
  runops_t1p1b0_core,
  runops_t1p1b1_core
};


/*=for api interpreter runops_t0p0b0_core
 * run parrot operations until the program is complete
 *
 * No bounds checking.
 * No profiling.
 * No tracing.
 */

opcode_t *
runops_t0p0b0_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    while (pc) { DO_OP(pc, interpreter); }
    return pc;
}

/*=for api interpreter runops_t0p0b1_core
 * run parrot operations until the program is complete
 *
 * With bounds checking.
 * No profiling.
 * No tracing.
 */

opcode_t *
runops_t0p0b1_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    while (pc && pc >= code_start && pc < code_end) {
        DO_OP(pc, interpreter);
    }

    return pc;
}

/*=for api interpreter runops_t0p1b0_core
 * run parrot operations until the program is complete
 *
 * No bounds checking.
 * With profiling.
 * No tracing.
 */

opcode_t *
runops_t0p1b0_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    while (pc) {
        interpreter->profile[*pc]++;
        DO_OP(pc, interpreter);
    }
    return pc;
}

/*=for api interpreter runops_t0p1b1_core
 * run parrot operations until the program is complete
 *
 * With bounds checking.
 * With profiling.
 * No tracing.
 */

opcode_t *
runops_t0p1b1_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    while (pc && pc >= code_start && pc < code_end) {
        interpreter->profile[*pc]++;
        DO_OP(pc, interpreter);
    }

    return pc;
}

/*=for api interpreter runops_t1p0b0_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 *
 * No bounds checking.
 * No profiling.
 * With tracing.
 */

opcode_t *
runops_t1p0b0_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t *code_start;

    code_start = (opcode_t *)interpreter->code->byte_code;

    trace_op_b0(interpreter, code_start, pc);
    while (pc) {
        DO_OP(pc, interpreter);
        trace_op_b0(interpreter, code_start, pc);
    }

    return pc;
}

/*=for api interpreter runops_t1p0b1_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 *
 * With bounds checking.
 * No profiling.
 * With tracing.
 */

opcode_t *
runops_t1p0b1_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    trace_op_b1(interpreter, code_start, code_end, pc);
    
    while (pc && pc >= code_start && pc < code_end ) {
        DO_OP(pc, interpreter);
        trace_op_b1(interpreter, code_start, code_end, pc);
    }

    return pc;
}

/*=for api interpreter runops_t1p1b0_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 *
 * No bounds checking.
 * With profiling.
 * With tracing.
 */

opcode_t *
runops_t1p1b0_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t *code_start;

    code_start = (opcode_t *)interpreter->code->byte_code;

    trace_op_b0(interpreter, code_start, pc);
    while (pc) {
        interpreter->profile[*pc]++;
        DO_OP(pc, interpreter);
        trace_op_b0(interpreter, code_start, pc);
    }

    return pc;
}

/*=for api interpreter runops_t1p1b1_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 *
 * With tracing.
 * With bounds checking.
 */

opcode_t *
runops_t1p1b1_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    trace_op_b1(interpreter, code_start, code_end, pc);
    
    while (pc && pc >= code_start && pc < code_end ) {
        interpreter->profile[*pc]++;
        DO_OP(pc, interpreter);
        trace_op_b1(interpreter, code_start, code_end, pc);
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
