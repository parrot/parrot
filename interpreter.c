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
#include "parrot/runops_cores.h"


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

        core = which ? runops_slow_core : runops_fast_core;

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
make_interpreter(INTVAL flags) {
    struct Parrot_Interp *interpreter;
    /* Get an empty interpreter from system memory */
    interpreter = mem_sys_allocate((INTVAL)sizeof(struct Parrot_Interp));
    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);

    /* Initialize interpreter's flags */
    interpreter->flags = flags;
    
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
    
    /* Need a user stack */
    interpreter->user_stack_base = mem_allocate_aligned(sizeof(struct StackChunk));
    interpreter->user_stack_top = &interpreter->user_stack_base->entry[0];
    /* Unlike the registers, we start with zero used */
    interpreter->user_stack_base->used = 0;
    interpreter->user_stack_base->free = STACK_CHUNK_DEPTH;
    interpreter->user_stack_base->next = NULL;
    interpreter->user_stack_base->prev = NULL;
    
    /* And a control stack */
    interpreter->control_stack_base = mem_allocate_aligned(sizeof(struct StackChunk));
    interpreter->control_stack_top = &interpreter->control_stack_base->entry[0];
    /* Unlike the registers, we start with zero used */
    interpreter->control_stack_base->used = 0;
    interpreter->control_stack_base->free = STACK_CHUNK_DEPTH;
    interpreter->control_stack_base->next = NULL;
    interpreter->control_stack_base->prev = NULL;
    
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
