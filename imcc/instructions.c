
#include <stdlib.h>
#include <string.h>
#include "imc.h"

/* 
 * instructions.c
 *
 * When generating the code, the instructions of the program
 * are stored in an array. 
 *
 * After the register allocation is resolved, the instructions
 * array is flushed.
 *  
 * This functions operate over this array and its contents.
 */


/* Global variables */

Instruction ** instructions;
long n_instructions;



/* Creates a new instruction */

Instruction * mk_instruction(const char * fmt, SymReg * r0, SymReg * r1,
		             SymReg * r2, SymReg * r3, int flags)
{
    static SymReg * nullreg;
    Instruction * i = calloc(1, sizeof(Instruction));
    if (i == NULL) {
        fprintf(stderr, "Memory error at mk_instruction\n");
	abort();
    }	    
    if(!nullreg)
	nullreg = mk_symreg("", 'I');

    i->fmt = str_dup(fmt);
    i->r0 = r0;
    i->r1 = r1;
    i->r2 = r2;
    i->r3 = r3;
    i->basic_block = NULL;
    i->flags = flags;

    if(!i->r0) {i->r0 = nullreg;} 
    if(!i->r1) {i->r1 = nullreg;} 
    if(!i->r2) {i->r2 = nullreg;} 
    if(!i->r3) {i->r3 = nullreg;} 
    
    return i;
}


int instruction_reads(Instruction* ins, SymReg* r) {
    int f;
   
    if (ins == NULL) {
	   fprintf(stderr, "Internal error: instruction_reads called with NULL argument\n");
	   abort();
   }
 
    f = ins->flags;
    
    if ((ins->r0 == r) && f & IF_r0_read) return 1;
    if ((ins->r1 == r) && f & IF_r1_read) return 1;
    if ((ins->r2 == r) && f & IF_r2_read) return 1;
    if ((ins->r3 == r) && f & IF_r3_read) return 1;

    return 0;
}

int instruction_writes(Instruction* ins, SymReg* r) {
    int f;
   
    if (ins == NULL) {
	   fprintf(stderr, "Internal error: instruction_reads called with NULL argument\n");
	   abort();
   }
 
    f = ins->flags;
	
    if ((ins->r0 == r) && f & IF_r0_write) return 1;
    if ((ins->r1 == r) && f & IF_r1_write) return 1;
    if ((ins->r2 == r) && f & IF_r2_write) return 1;
    if ((ins->r3 == r) && f & IF_r3_write) return 1;

    return 0;
}


/* Resizes the array of instructions */

Instruction ** resize_instructions(Instruction ** i, int num) {
    i = realloc(i, num * sizeof(Instruction *));
    if (i == NULL) {
	fprintf(stderr, "Memory error at resize_instructions\n");    
    }	   
    return i;
}


/* Computes the cost of spilling each symbol. This is estimated by the number 
 * of times the symbol appears, weighted by 8**loop_depth */

void compute_spilling_costs () {
    int i, depth;
    Instruction *ins;
    Basic_block *bb;
    
    for (i = 0; i < n_instructions; i++) {
	ins = instructions[i];
	bb = ins->basic_block;
	
	depth = bb->loop_depth;
	
	ins->r0->score += 1 << (depth * 3);
	ins->r1->score += 1 << (depth * 3);
	ins->r2->score += 1 << (depth * 3); 
	ins->r3->score += 1 << (depth * 3); 

    }

     if (IMCC_DEBUG) 
	    dump_symreg();
   
}

/* Emits the instructions buffered in 'instructions' */

Instruction * emitb(Instruction * i) {
#if DEBUG
    emit(i);	
#endif
    if(!instructions) {
        instructions = calloc(4096, sizeof(Instruction *));
	if (instructions == NULL) {
	    fprintf(stderr, "Memory error at emitb\n");
	    abort();
	}
	n_instructions = 0;
    }
    
    i->index = n_instructions;
    instructions[n_instructions++] = i;

    return i;
}

Instruction * emit(Instruction * i) {
    printf(i->fmt, i->r0->reg, i->r1->reg, i->r2->reg, i->r3->reg);
    printf("\n");
    return i;
}	

void emit_flush() {
    int i = 0;
 
    /* first instruction should be ".sub" -- make sure we allocate P31
     * _after_ subroutine entry.  And after the "saveall", or any
     * other assortment of pushes. */
    if (n_spilled > 0 && n_instructions > 0) {
        emit(instructions[0]);
        free(instructions[0]);
        i++;
        while (i < n_instructions
               && (strncmp(instructions[i]->fmt, "push", 4) == 0
                   || strcmp(instructions[i]->fmt, "saveall") == 0)) {
	emit(instructions[i]);
	free(instructions[i]);
            ++i;
        }
	printf("new P31, .PerlArray\n");
    }
    for( ; i < n_instructions; i++) {
	emit(instructions[i]);
	free(instructions[i]);
	instructions[i] = 0;
    }
    free(instructions);
    instructions = NULL;
    n_instructions = 0;

    printf("\n\n");
}

