
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


/* Creates a new instruction */
static SymReg * nullreg;

Instruction * mk_instruction(const char * fmt, SymReg * r0, SymReg * r1,
		             SymReg * r2, SymReg * r3, int flags)
{
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

    if ((ins->r0 == r) && (f & IF_r0_read)) return 1;
    if ((ins->r1 == r) && (f & IF_r1_read)) return 1;
    if ((ins->r2 == r) && (f & IF_r2_read)) return 1;
    if ((ins->r3 == r) && (f & IF_r3_read)) return 1;

    return 0;
}

int instruction_writes(Instruction* ins, SymReg* r) {
    int f;

    if (ins == NULL) {
	   fprintf(stderr, "Internal error: instruction_reads called with NULL argument\n");
	   abort();
   }

    f = ins->flags;

    if ((ins->r0 == r) && (f & IF_r0_write)) return 1;
    if ((ins->r1 == r) && (f & IF_r1_write)) return 1;
    if ((ins->r2 == r) && (f & IF_r2_write)) return 1;
    if ((ins->r3 == r) && (f & IF_r3_write)) return 1;

    return 0;
}


/* Computes the cost of spilling each symbol. This is estimated by the number
 * of times the symbol appears, weighted by 8**loop_depth */

void compute_spilling_costs () {
    int depth;
    Instruction *ins;
    Basic_block *bb;

    for (ins = instructions; ins; ins = ins->next) {
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
static Instruction * last_ins;
static int n_instructions;
Instruction * emitb(Instruction * i) {
#if DEBUG
    emit(i);
#endif
    if(!instructions)
        last_ins = instructions = i;
    else {
	last_ins->next = i;
	last_ins = i;
    }

    i->index = n_instructions++;
    return i;
}

void free_ins(Instruction *ins)
{
    free(ins->fmt);
    free(ins);
}


static void emit(Instruction * ins) {
    char regb[4][8];
    char *reg[4];
    SymReg *r[4];
    int i;
    r[0] = ins->r0;
    r[1] = ins->r1;
    r[2] = ins->r2;
    r[3] = ins->r3;
    for (i = 0; i < 4; i++)
	if (r[i]->type == VTREG || r[i]->type == VTIDENTIFIER) {
	    sprintf(regb[i], "%c%d", r[i]->set, r[i]->color);
	    reg[i] = regb[i];
	}
	else
	    reg[i] = r[i]->name;
    printf(ins->fmt, reg[0], reg[1], reg[2], reg[3]);
    printf("\n");
}

void emit_flush() {

    Instruction * ins, *next;
    /* first instruction should be ".sub" -- make sure we allocate P31
     * _after_ subroutine entry.  And after the "saveall", or any
     * other assortment of pushes. */
    ins = instructions;
    if (n_spilled > 0 && n_instructions > 0) {
        emit(ins);
        ins = ins->next;
        while (ins
               && (strncmp(ins->fmt, "push", 4) == 0
                   || strcmp(ins->fmt, "saveall") == 0)) {
	    emit(ins);
	    ins = ins->next;
        }
	printf("new P31, .PerlArray\n");
    }
    for (; ins; ins = ins->next) {
	emit(ins);
    }
    for (ins = instructions; ins; ) {
	next = ins->next;
	free_ins(ins);
	ins = next;
    }
    instructions = NULL;
    n_instructions = 0;
    if (nullreg)
	free(nullreg);
    nullreg = 0;
    printf("\n\n");
}

