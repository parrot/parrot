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

char *op_names[2048];
int   op_args[2048];

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

/*=for api interpreter runops
 * run parrot operations until the program is complete
 */
opcode_t *
runops_notrace_core (struct Parrot_Interp *interpreter) {
    /* Move these out of the inner loop. No need to redeclare 'em each
       time through */
    opcode_t *(* func)();
    opcode_t *(**temp)();
    opcode_t * code_start;
    INTVAL         code_size;
    opcode_t * code_end;
    opcode_t * pc;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    pc = code_start;

    while (pc >= code_start && pc < code_end && *pc) {
        DO_OP(pc, temp, func, interpreter);
    }

    return pc;
}

/*
 *=for api interpreter trace_op
 * TODO: This isn't really part of the API, but here's its documentation. Prints the PC, OP
 * and ARGS. Used by runops_trace.
 */
void
trace_op(opcode_t * code_start, opcode_t * code_end, opcode_t *pc) {
    int i;

    if (pc >= code_start && pc < code_end) {
        fprintf(stderr, "PC=%ld; OP=%ld (%s)", (long)(pc - code_start), *pc, op_names[*pc]);
        if (op_args[*pc]) {
            fprintf(stderr, "; ARGS=(");
            for(i = 0; i < op_args[*pc]; i++) {
                if (i) { fprintf(stderr, ", "); }
                fprintf(stderr, "%ld", *(pc + i + 1));
            }
            fprintf(stderr, ")");
        }
        fprintf(stderr, "\n");
    }
    else {
        fprintf(stderr, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }
}

/*=for api interpreter runops_trace_core
 * TODO: Not really part of the API, but here's the docs.
 * Passed to runops_generic() by runops_trace().
 */
opcode_t *
runops_trace_core (struct Parrot_Interp *interpreter) {
    /* Move these out of the inner loop. No need to redeclare 'em each
       time through */
    opcode_t *( *func)();
    opcode_t *(**temp)();
    opcode_t * code_start;
    INTVAL         code_size;
    opcode_t * code_end;
    opcode_t * pc;

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    pc = code_start;

    trace_op(code_start, code_end, pc);
    
    while (pc >= code_start && pc < code_end && *pc) {
        DO_OP(pc, temp, func, interpreter);

        trace_op(code_start, code_end, pc);
    }

    return pc;
}

/*=for api interpreter runops_generic
 * TODO: Not really part of the API, but here's the docs.
 * Generic runops, which takes a function pointer for the core.
 */
void
runops_generic (opcode_t * (*core)(struct Parrot_Interp *), struct Parrot_Interp *interpreter) {
    opcode_t * code_start;
    INTVAL         code_size;
    opcode_t * code_end;
    INTVAL *       pc;

    check_fingerprint(interpreter);

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    pc = core(interpreter);

    if (pc < code_start || pc >= code_end) {
        fprintf(stderr, "Error: Control left bounds of byte-code block (now at location %d)!\n", pc - code_start);
        exit(1);
    }
}


/*=for api interpreter runops
 * run parrot operations until the program is complete
 */
void
runops (struct Parrot_Interp *interpreter, struct PackFile * code) {
    opcode_t * (*core)(struct Parrot_Interp *);

    if (interpreter->flags & PARROT_TRACE_FLAG) {
        core = runops_trace_core;
    }
    else {
        core = runops_notrace_core;
    }

    interpreter->code = code;

    runops_generic(core, interpreter);
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
    
    /* The default opcode function table would be a good thing here... */
    {
        opcode_t *(**foo)();
        foo = mem_sys_allocate(2048 * sizeof(void *));
        
        BUILD_TABLE(foo);
        
        interpreter->opcode_funcs = (void*)foo;

        BUILD_NAME_TABLE(op_names);
        BUILD_ARG_TABLE(op_args);
    }
    
    /* In case the I/O system needs something */
    Init_IO(interpreter);
    
    /* Done. Return and be done with it */

    interpreter->code = (struct PackFile *)NULL;

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
