
#include "imc.h"

void dump_instructions() {
    Instruction *ins;
    Basic_block *bb;
    int i;

    fprintf(stderr, "\nDumping the instructions status:\n-------------------------------\n");
    for (ins = instructions; ins; ins = ins->next) {
	bb = ins->basic_block;

	if (bb) {
	     fprintf(stderr, "%i\t%d\t%x\t", ins->index, bb->index, ins->flags);
	}
	else {
	     fprintf(stderr, "\t");
	}

	fprintf(stderr, ins->fmt, ins->r0->name, ins->r1->name,
			ins->r2->name, ins->r3->name);
	fprintf(stderr, "\n");
    }
    fprintf(stderr, "\n");
    fprintf(stderr, "basic blocks\n");
    for (i=0; i< n_basic_blocks; i++) {
	    bb = bb_list[i];
	    fprintf(stderr, "%d\t%d\t%d\n",
			    bb->index, bb->start->index, bb->end->index);
    }
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
	fprintf(stderr, "\t\t <- ");
	for (e=bb->pred_list; e != NULL; e=e->pred_next) {
	    fprintf(stderr, "%d ", e->from->index);
	}
	fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");

}

void dump_symreg() {
    int i;

    fprintf(stderr, "\nSymbols:\n----------------------------------------------\n");
    fprintf(stderr, "name\tfirst\tlast\t1.blk\t-blk\tset\tcolor\tscore\n----------------------------------------------\n");
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
            if(r->type != VTREG && r->type != VTIDENTIFIER) continue;
	    if(!r->first_ins) continue;
	    fprintf(stderr, "%s\t%d\t%d\t%d\t%d\t%c\t%d\t%d\n", r->name,
		    r->first_ins->index, r->last_ins->index,
		    r->first_ins->bbindex, r->last_ins->bbindex,
		    r->set,
		    r->color, r->score);
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
	    if (r->type == VTIDENTIFIER || r->type == VTREG ) dump_liveness_status_var(r);
    	}
    }
    fprintf(stderr, "\n");

}


void dump_liveness_status_var(SymReg* r) {
    int i;
    Life_range *l;

    fprintf(stderr, "\nSymbol %s:", r->name);
    if (r->life_info==NULL) return;
    for (i=0; i<n_basic_blocks; i++) {
        l = r->life_info[i];

	if (l->flags & LF_lv_all) {
		fprintf(stderr, "\n\t%i:ALL\t", i);
	}
	else if (l->flags & LF_lv_inside) {
            fprintf(stderr, "\n\t%i:INSIDE", i);
	}

	if (l->flags & LF_lv_in)      fprintf(stderr, "\n\t%i: IN\t", i);
	else if (l->flags & LF_lv_out)     fprintf(stderr, "\n\t%i: OUT\t", i);
	else if (l->first_ins)     fprintf(stderr, "\n\t%i: INS\t", i);

	if(l->first_ins) {
	      fprintf(stderr, "[%d,%d]\t", l->first_ins->index, l->last_ins->index);
	}
    }
    fprintf(stderr, "\n");
}

void dump_interference_graph() {
    int x, y, cnt;
    SymReg *r;

    fprintf(stderr, "\nDumping the Interf. graph:\n-------------------------------\n");
    for (x = 0; x < n_symbols; x++) {

	if (!interference_graph[x]->first_ins) continue;

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

