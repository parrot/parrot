
#include "imc.h"

void dump_instructions() {
    Instruction *ins;
    Basic_block *bb;
    int i;
   
    fprintf(stderr, "\nDumping the instructions status:\n-------------------------------\n");
    for (i=0; instructions[i]; i++) {	   
        ins = instructions[i];
	bb = ins->basic_block;
	
	if (bb) {
	     fprintf(stderr, "%d\t", bb->index);
	}
	else {
	     fprintf(stderr, "\t");
	}

	fprintf(stderr, ins->fmt, ins->r0->name, ins->r1->name, 
			ins->r2->name, ins->r3->name);
	fprintf(stderr, "\n");
    }	  
    fprintf(stderr, "\n");
}

void dump_cfg() {
    int i;
    Basic_block *bb;
    Edge *e;
    
    fprintf(stderr, "\nDumping the CFG:\n-------------------------------\n");
    for (i=0; bb_list[i]; i++) {
	bb = bb_list[i];
	fprintf(stderr, "%d\t -> ", bb->index);
	for (e=bb->succ_list; e != NULL; e=e->succ_next) {
	    fprintf(stderr, "%d ", e->to->index);
	}
	fprintf(stderr, "\n");
    }	 

    fprintf(stderr, "\n");

}

void dump_symreg() {
    int i;

    fprintf(stderr, "\nSymbols:\n--------------------------------------\n");
    fprintf(stderr, "name\tfirst\tlast\tset\tcolor\n-------------------------------------\n");
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
            if(r->type != VTREG && r->type != VTIDENTIFIER) continue;
	    if(r->first < 0) continue;
	    fprintf(stderr, "%s\t%d\t%d\t%c\t%d\n", r->name, r->first, r->last, r->set, r->color);
    	}
    }
    fprintf(stderr, "\n");
}

void dump_interference_graph() {
    int x, y, cnt;  
    SymReg *r;

    fprintf(stderr, "\nDumping the Interf. graph:\n-------------------------------\n");
    for (x = 0; x < n_symbols; x++) {

	if (interference_graph[x]->first < 0) continue;

	fprintf(stderr, "%s\t -> ", interference_graph[x]->name);
	cnt = 0;
	
        for (y = 0; y < n_symbols; y++) {
		
	     r = interference_graph[(1+x)*n_symbols + y + 1];
	     if ( r && !r->simplified) {
	        fprintf(stderr, "%s ", r->name);
		cnt++;
	     }
        }
        fprintf(stderr, "(%d)\n", cnt);
    }
    fprintf(stderr, "\n");
}

	
