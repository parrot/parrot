/* interpreter.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The interpreter api handles running the operations
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/interp_guts.h"
#include "parrot/oplib/core_ops.h"

runops_core_f   runops_cores[8] = {
  runops_t0p0b0_core,
  runops_t0p0b1_core,
  runops_t0p1b0_core,
  runops_t0p1b1_core,
  runops_t1p0b0_core,
  runops_t1p0b1_core,
  runops_t1p1b0_core,
  runops_t1p1b1_core
};

/*=for api interpreter check_fingerprint
 * TODO: Not really part of the API, but here's the docs.
 * Check the bytecode's opcode table fingerprint.
 */
void
check_fingerprint(struct Parrot_Interp *interpreter) {
/*    if (PNCONST == 0) { */

    return;

#if 0
    if (interpreter->code->const_table->const_count == 0) {
        fprintf(stderr, "Warning: Bytecode does not include opcode table fingerprint!\n");
    }
    else {
        const char * fp_data;
        INTVAL           fp_len;

        fp_data = PCONST(0)->string->bufstart;
        fp_len  = PCONST(0)->string->buflen;
        
        if (strncmp(OPCODE_FINGERPRINT, fp_data, fp_len)) {
            fprintf(stderr, "Error: Opcode table fingerprint in bytecode does not match interpreter!\n");
            fprintf(stderr, "       Bytecode:    %*s\n", (int)-fp_len, fp_data);
            fprintf(stderr, "       Interpreter: %s\n", OPCODE_FINGERPRINT);
            exit(1);
        }
    }
#endif

}

/*
 *=for api interpreter trace_op_dump
 * TODO: This isn't really part of the API, but here's its documentation. Prints the PC, OP
 * and ARGS. Used by trace_op_b0 and trace_op_b1.
 */
void
trace_op_dump(struct Parrot_Interp *interpreter, opcode_t *code_start, opcode_t *pc) {
    INTVAL i;

    fprintf(stderr, "PC=%ld; OP=%ld (%s)", (long)(pc - code_start), *pc,
        interpreter->opcode_info[*pc].full_name);

    if (interpreter->opcode_info[*pc].arg_count > 1) {
        fprintf(stderr, "; ARGS=(");
        for(i = 1; i < interpreter->opcode_info[*pc].arg_count; i++) {
            if (i > 1) { fprintf(stderr, ", "); }
            switch(interpreter->opcode_info[*pc].types[i]) {
            case PARROT_ARG_IC:
                fprintf(stderr, "%ld", (long) *(pc + i));
                break;
            case PARROT_ARG_NC:
                fprintf(stderr, "%f", interpreter->code->const_table->constants[*(pc + i)]->number);
                break;
            case PARROT_ARG_PC:
                /* what is a PMC constant look like? */
                fprintf(stderr, "%ld", (long) *(pc + i));
                break;
            case PARROT_ARG_SC:
                fprintf(stderr, "\"%s\"", interpreter->code->const_table->constants[*(pc + i)]->string->bufstart);
                break;
            case PARROT_ARG_I:
                fprintf(stderr, "I%ld=%ld", (long) *(pc + i), (long) interpreter->int_reg->registers[*(pc + i)]);
                break;
            case PARROT_ARG_N:
                fprintf(stderr, "N%ld=%f", (long) *(pc + i), interpreter->num_reg->registers[*(pc + i)]);
                break;
            case PARROT_ARG_P:
                /* what does a PMC constant look like? */
                fprintf(stderr, "P%ld=???", (long) *(pc + i));
                break;
            case PARROT_ARG_S:
                if(interpreter->string_reg->registers[*(pc + i)]) {
                    fprintf(stderr, "S%ld=\"%s\"", (long) *(pc + i), interpreter->string_reg->registers[*(pc + i)]->bufstart);
                } else {
                    fprintf(stderr, "S%ld=(null)", (long) *(pc + i));
                }
                break;
            }
        }
        fprintf(stderr, ")");
    }
    fprintf(stderr, "\n");
}



/*
 *=for api interpreter trace_op_b0
 * TODO: This isn't really part of the API, but here's its documentation. Prints the PC, OP
 * and ARGS. Used by runops_trace.
 *
 * No bounds checking.
 */
void
trace_op_b0(struct Parrot_Interp *interpreter, opcode_t * code_start, opcode_t *pc) {
    if (!pc) {
        return;
    }
    (void)fflush(NULL); /* Flush *ALL* output before printing trace info */
    trace_op_dump(interpreter, code_start, pc);
    (void)fflush(stderr); /* Flush *stderr* now that we've output the trace info */
}

/*
 *=for api interpreter trace_op_b1
 * TODO: This isn't really part of the API, but here's its documentation. Prints the PC, OP
 * and ARGS. Used by runops_trace.
 *
 * With bounds checking.
 */
void
trace_op_b1(struct Parrot_Interp *interpreter, opcode_t * code_start, opcode_t * code_end, opcode_t *pc) {
    INTVAL i;

    if (!pc) {
        return;
    }

    (void)fflush(NULL); /* Flush *ALL* output before printing trace info */
    if (pc >= code_start && pc < code_end) {
        trace_op_dump(interpreter, code_start, pc);
    }
    else if (pc) {
        fprintf(stderr, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }

    (void)fflush(stderr); /* Flush *stderr* now that we've output the trace info */
}

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

/*=for api interpreter runops_generic
 * TODO: Not really part of the API, but here's the docs.
 * Generic runops, which takes a function pointer for the core.
 */
void
runops_generic (opcode_t * (*core)(struct Parrot_Interp *, opcode_t *), struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL         code_size;
    opcode_t * code_end;

    check_fingerprint(interpreter);

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    pc = core(interpreter, pc);

    if (pc && (pc < code_start || pc >= code_end)) {
        fprintf(stderr, "Error: Control left bounds of byte-code block (now at location %d)!\n", (int) (pc - code_start));
        exit(1);
    }
}


/*=for api interpreter runops
 * run parrot operations until the program is complete
 */
void
runops (struct Parrot_Interp *interpreter, struct PackFile * code) {
    opcode_t * (*core)(struct Parrot_Interp *, opcode_t *);

    interpreter->code        = code;
    interpreter->resume_addr = (opcode_t *)interpreter->code->byte_code;

    while (interpreter->resume_addr) {
        int        which = 0;
        opcode_t * pc    = interpreter->resume_addr;

        interpreter->resume_addr = (opcode_t *)NULL;

        which |= interpreter->flags & PARROT_BOUNDS_FLAG  ? 0x01 : 0x00;
        which |= interpreter->flags & PARROT_PROFILE_FLAG ? 0x02 : 0x00;
        which |= interpreter->flags & PARROT_TRACE_FLAG   ? 0x04 : 0x00;

        core = runops_cores[which];

        if ((interpreter->flags & PARROT_PROFILE_FLAG) != 0) {
            int i;

            if (interpreter->profile == NULL) {
                interpreter->profile = (INTVAL *)mem_sys_allocate(core_numops * sizeof(INTVAL));
            }

            for (i = 0; i < core_numops; i++) {
                interpreter->profile[i] = 0;
            }
        }

        runops_generic(core, interpreter, pc);
    }
}

/*=for api interpreter make_interpreter
 *  Create the Parrot interpreter.  Allocate memory and clear the registers.
 */
struct Parrot_Interp *
make_interpreter() {
    struct Parrot_Interp *interpreter;
    /* Get an empty interpreter from system memory */
    interpreter = mem_sys_allocate((INTVAL)sizeof(struct Parrot_Interp));
    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);

    /* Blank out the interpreter's flags */
    interpreter->flags = 0;
    
    /* Set up the initial register chunks */
    interpreter->int_reg_base = mem_allocate_aligned(sizeof(struct IRegChunk));
    interpreter->num_reg_base = mem_allocate_aligned(sizeof(struct NRegChunk));
    interpreter->string_reg_base = mem_allocate_aligned(sizeof(struct SRegChunk));
    interpreter->pmc_reg_base = mem_allocate_aligned(sizeof(struct PRegChunk));
    
    /* Set up the initial register frame pointers */
    interpreter->int_reg = &interpreter->int_reg_base->IReg[0];
    interpreter->num_reg = &interpreter->num_reg_base->NReg[0];
    interpreter->string_reg = &interpreter->string_reg_base->SReg[0];
    interpreter->pmc_reg = &interpreter->pmc_reg_base->PReg[0];
    
    /* Initialize the integer register chunk */
    interpreter->int_reg_base->used = 1;
    interpreter->int_reg_base->free = FRAMES_PER_INT_REG_CHUNK - 1;
    interpreter->int_reg_base->next = NULL;
    interpreter->int_reg_base->prev = NULL;
    
    /* Initialize the initial numeric register chunk */
    interpreter->num_reg_base->used = 1;
    interpreter->num_reg_base->free = FRAMES_PER_NUM_REG_CHUNK - 1;
    interpreter->num_reg_base->next = NULL;
    interpreter->num_reg_base->prev = NULL;
    
    /* Initialize the inital string register chunk, be sure to
       NULL out the strings because string functions rely
       on NULL strings */
    interpreter->string_reg_base->used = 1;
    interpreter->string_reg_base->free = FRAMES_PER_STR_REG_CHUNK - 1;
    interpreter->string_reg_base->next = NULL;
    interpreter->string_reg_base->prev = NULL;
    Parrot_clear_s(interpreter);
    
    /* Initialize the initial PMC register chunk. Gotta NULL them out,
       too, otherwise we might GC Wrong Things later */
    interpreter->pmc_reg_base->used = 1;
    interpreter->pmc_reg_base->free = FRAMES_PER_PMC_REG_CHUNK - 1;
    interpreter->pmc_reg_base->next = NULL;
    interpreter->pmc_reg_base->prev = NULL;
    Parrot_clear_p(interpreter);
    
    /* Need a default stack */
    interpreter->stack_base = mem_allocate_aligned(sizeof(struct StackChunk));
    interpreter->stack_top = &interpreter->stack_base->entry[0];
    /* Unlike the registers, we start with zero used */
    interpreter->stack_base->used = 0;
    interpreter->stack_base->free = STACK_CHUNK_DEPTH;
    interpreter->stack_base->next = NULL;
    interpreter->stack_base->prev = NULL;
    
    /* Need an empty stash */
    interpreter->perl_stash = mem_allocate_new_stash();
    
    /* Load the core op func and info tables */

    interpreter->opcode_funcs = core_opfunc;
    interpreter->opcode_info  = core_opinfo;
    
    /* In case the I/O system needs something */
    Init_IO(interpreter);
    
    /* Done. Return and be done with it */

    interpreter->code = (struct PackFile *)NULL;
    interpreter->profile = (INTVAL *)NULL;

    interpreter->resume_addr = (opcode_t *)NULL;

    return interpreter;   
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
