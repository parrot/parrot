
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
	     fprintf(stderr, "%i\t%d\t", ins->index, bb->index);
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
	fprintf(stderr, "%d (%d)\t -> ", bb->index, bb->loop_depth);
	for (e=bb->succ_list; e != NULL; e=e->succ_next) {
	    fprintf(stderr, "%d ", e->to->index);
	}
	fprintf(stderr, "\n");
    }	 

    fprintf(stderr, "\n");

}

void dump_symreg() {
    int i;

    fprintf(stderr, "\nSymbols:\n----------------------------------------------\n");
    fprintf(stderr, "name\tfirst\tlast\tset\tcolor\tscore\n----------------------------------------------\n");
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
            if(r->type != VTREG && r->type != VTIDENTIFIER) continue;
	    if(r->first < 0) continue;
	    fprintf(stderr, "%s\t%d\t%d\t%c\t%d\t%d\n", r->name, r->first, r->last, r->set, r->color, r->score);
    	}
    }
    fprintf(stderr, "\n");
    dump_liveness_status();

}

void dump_liveness_status() {
    int i;

    fprintf(stderr, "\nSymbols:\n--------------------------------------\n");
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
	    if (r->type == VTIDENTIFIER) dump_liveness_status_var(r);
    	}
    }
    fprintf(stderr, "\n");
    
}


void dump_liveness_status_var(SymReg* r) {
    int i, j;
    Life_range *l;
    
    fprintf(stderr, "\nSymbol %s:", r->name);
    if (r->life_info==NULL) return;
    for (i=0; i<n_basic_blocks; i++) {
        l = r->life_info[i];
    
	if (l->flags & LF_lv_all) {
		fprintf(stderr, "\n\t%i:ALL\t", i);
	}
	else if (l->flags & LF_lv_inside) {
            fprintf(stderr, "\n\t%i:", i);		   
	    
	    if (l->flags & LF_lv_in)      fprintf(stderr, "IN\t");
	    if (l->flags & LF_lv_out)     fprintf(stderr, "OUT\t");
	
	    for (j=0; j < l->n_intervals; j++) {
	       fprintf(stderr, "[%d,%d]\t", 
	       l->intervals[2*j], l->intervals[2*j+1] );
	    }		  
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

void dump_dominators() {
    int i, j;
    
    fprintf(stderr, "\nDumping the Dominators Tree:\n-------------------------------\n");
    for (i=0; i < n_basic_blocks; i++) {
	fprintf (stderr, "%d <- ", i);

	for(j=0; j < n_basic_blocks; j++) {
            if (set_contains(dominators[i], j)) {
		fprintf(stderr, " %d ", j);
	    }
	}

	fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");
}
	
