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
#include "parrot/op_info.h"

runops_core_f   runops_cores[4] = {
  runops_t0b0_core,
  runops_t0b1_core,
  runops_t1b0_core,
  runops_t1b1_core
};

/*=for api interpreter check_fingerprint
 * TODO: Not really part of the API, but here's the docs.
 * Check the bytecode's opcode table fingerprint.
 */
void
check_fingerprint(struct Parrot_Interp *interpreter) {
/*    if (PNCONST == 0) { */
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
}

/*=for api interpreter runops_t0b0_core
 * run parrot operations until the program is complete
 *
 * No tracing.
 * No bounds checking.
 */
opcode_t *
runops_t0b0_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    while (*pc) { DO_OP(pc, interpreter); }
    return pc;
}

/*=for api interpreter runops_t0b1_core
 * run parrot operations until the program is complete
 *
 * No tracing.
 * With bounds checking.
 */
opcode_t *
runops_t0b1_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    while (pc >= code_start && pc < code_end && *pc) {
        DO_OP(pc, interpreter);
    }

    return pc;
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
    int i;

    fflush(NULL); /* Flush *ALL* output before printing trace info */

    fprintf(stderr, "PC=%ld; OP=%ld (%s)", (long)(pc - code_start), *pc,
        interpreter->opcode_info[*pc].name);

    if (interpreter->opcode_info[*pc].nargs) {
        fprintf(stderr, "; ARGS=(");
        for(i = 0; i < interpreter->opcode_info[*pc].nargs; i++) {
            if (i) { fprintf(stderr, ", "); }
            fprintf(stderr, "%ld", (long) *(pc + i + 1));
        }
        fprintf(stderr, ")");
    }
    fprintf(stderr, "\n");

    fflush(stderr); /* Flush *stderr* now that we've output the trace info */
}

/*=for api interpreter runops_t1b0_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 *
 * With tracing.
 * No bounds checking.
 */
opcode_t *
runops_t1b0_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t *code_start;

    code_start = (opcode_t *)interpreter->code->byte_code;

    trace_op_b0(interpreter, code_start, pc);
    while (*pc) {
        DO_OP(pc, interpreter);
        trace_op_b0(interpreter, code_start, pc);
    }

    return pc;
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
    int i;

    fflush(NULL); /* Flush *ALL* output before printing trace info */

    if (pc >= code_start && pc < code_end) {
        fprintf(stderr, "PC=%ld; OP=%ld (%s)", (long)(pc - code_start), *pc,
            interpreter->opcode_info[*pc].name);

        if (interpreter->opcode_info[*pc].nargs) {
            fprintf(stderr, "; ARGS=(");
            for(i = 0; i < interpreter->opcode_info[*pc].nargs; i++) {
                if (i) { fprintf(stderr, ", "); }
                fprintf(stderr, "%ld", (long) *(pc + i + 1));
            }
            fprintf(stderr, ")");
        }
        fprintf(stderr, "\n");
    }
    else {
        fprintf(stderr, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }

    fflush(stderr); /* Flush *stderr* now that we've output the trace info */
}

/*=for api interpreter runops_t1b1_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 *
 * With tracing.
 * With bounds checking.
 */
opcode_t *
runops_t1b1_core (struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    INTVAL     code_size;
    opcode_t * code_end;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    trace_op_b1(interpreter, code_start, code_end, pc);
    
    while (pc >= code_start && pc < code_end && *pc) {
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

    if (pc < code_start || pc >= code_end) {
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

    interpreter->resume_addr = (opcode_t *)code->byte_code;

    while (interpreter->resume_addr) {
        int        which = 0;
        opcode_t * pc    = interpreter->resume_addr;

        interpreter->resume_addr = (opcode_t *)NULL;

        which |= interpreter->flags & PARROT_BOUNDS_FLAG ? 0x01 : 0x00;
        which |= interpreter->flags & PARROT_TRACE_FLAG  ? 0x02 : 0x00;

        core = runops_cores[which];

        interpreter->code = code;

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
    interpreter = mem_sys_allocate(sizeof(struct Parrot_Interp));
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
    interpreter->stack_base = mem_allocate_new_stack();
    
    /* Need an empty stash */
    interpreter->perl_stash = mem_allocate_new_stash();
    
    /* Load the builtin op func and info tables */
    interpreter->opcode_funcs = builtin_op_func_table;
    interpreter->opcode_info  = builtin_op_info_table;
    
    /* In case the I/O system needs something */
    Init_IO(interpreter);
    
    /* Done. Return and be done with it */

    interpreter->code = (struct PackFile *)NULL;

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
