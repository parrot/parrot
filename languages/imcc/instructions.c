
#include <stdlib.h>
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
    if(!nullreg)
	nullreg = mk_symreg("", 'I');

    i->fmt = str_dup(fmt);
    i->r0 = r0;
    i->r1 = r1;
    i->r2 = r2;
    i->r3 = r3;
    i->basic_block = NULL;
    i->flags = flags;

    if(!i->r0) {i->r0 = nullreg;} else {i->r0->score++;}
    if(!i->r1) {i->r1 = nullreg;} else {i->r1->score++;}
    if(!i->r2) {i->r2 = nullreg;} else {i->r2->score++;}
    if(!i->r3) {i->r3 = nullreg;} else {i->r3->score++;}
    
    return i;
}


/* Resizes the array of instructions */

Instruction ** resize_instructions(Instruction ** i, int num) {
    i = realloc(i, num * sizeof(Instruction *));
    return i;
}


/* Emits the instructions buffered in 'instructions' */

Instruction * emitb(Instruction * i) {
#if DEBUG
    emit(i);	
#endif
    if(!instructions) {
        instructions = calloc(4096, sizeof(Instruction *));
	n_instructions = 0;
    }
    
    instructions[n_instructions++] = i;

    i->basic_block = NULL;
    return i;
}

Instruction * emit(Instruction * i) {
    printf(i->fmt, i->r0->reg, i->r1->reg, i->r2->reg, i->r3->reg);
    printf("\n");
    return i;
}	

void emit_flush() {
    int i;
    if (n_spill > 0) {
       printf("new P31, .PerlArray\n");
    }
    
    for(i = 0; i < n_instructions; i++) {
	emit(instructions[i]);
        free(instructions[i]);
        instructions[i] = 0;
    }
    free(instructions);
    instructions = NULL;
    n_instructions = 0;

    printf("\n\n");
}

