
#include <stdlib.h>
#include <string.h>
#include "imc.h"

/* 
 * cfg.c
 * 
 * A basic block is the longest sequence of instructions that we are
 * sure will be executed sequentally: no branches, no labels.
 *
 * The control-flow graph is a directed graph that reflects the 
 * flow of execution between blocks.
 */
 

/* Code: */


void find_basic_blocks () {
    int j, nu;
    Basic_block *bb;
    Instruction *ins, *next, *last;

    init_basic_blocks();

    last = instructions[0];

    bb = make_basic_block(last);
    nu = 0;
    ins = NULL;
    
    for(j = 1; instructions[j]; j++) {

	next = instructions[j];

	if (nu) {
	    bb = make_basic_block(next);
	    nu = 0;
	}
	else if (next->type == ITLABEL) {
	    if (ins != NULL) {
		bb->end = ins;
	        bb = make_basic_block(next);
	    }	    
	}
	else if (next->type == ITBRANCH) {
	    next->basic_block = bb;
	    bb->end = next;
	    nu = 1;
	} 
	else {
	    next->basic_block = bb;
	}
	
	ins = next;
    }

    /* At the end, ins holds the last instruction of the block */
    bb->end = ins;
   
    if (IMCC_DEBUG)  
	dump_instructions();
}


/* Once the basic blocks have been computed, build_cfg computes
   the dependences between them. */

void build_cfg() {
    int i;
    Basic_block *last, *bb;
    
    for (i = 0; bb_list[i]; i++) {
	bb = bb_list[i];

	/* if the block can fall-through */
	if (i > 0 && ! (last->end->flags & IF_goto) )  bb_add_edge(last, bb);

	if (bb->end->flags & IF_r0_branch)   bb_findadd_edge(bb, bb->end->r0);	
	if (bb->end->flags & IF_r1_branch)   bb_findadd_edge(bb, bb->end->r1);
	if (bb->end->flags & IF_r2_branch)   bb_findadd_edge(bb, bb->end->r2);	
	if (bb->end->flags & IF_r3_branch)   bb_findadd_edge(bb, bb->end->r3);

	last = bb;
    }

   if (IMCC_DEBUG)
        dump_cfg();
}


/* find the placement of the label, and link the two nodes */

void bb_findadd_edge(Basic_block *from, SymReg *label) {
    int i;
    Instruction *ins;

    for (i = 0; instructions[i]; i++) {
	ins = instructions[i];
	if (ins->type == ITLABEL && label == ins->r0){
		
	    bb_add_edge(from, ins->basic_block);
	    return;
	    
	    /* a label appears just once */ 
			    
	}
    }	
}


void bb_add_edge(Basic_block *from, Basic_block *to) {
    Edge *pred, *e;
		
    for (pred = to->pred_list; pred != NULL; pred=pred->pred_next) {
	if (pred->from == from)  return; /*already linked*/
    }	    

    /* we assume that the data is correct, and thus if the edge is not
       on the predecessors of 'from', it won't be on the successors
       of 'to'. */
    
    e = malloc(sizeof(Edge));
    if (e==NULL) {
        fprintf(stderr, "Memory error at bb_add_edge\n");
	abort();
    }
    
    e->succ_next = from->succ_list;
    e->from = from;
    
    e->pred_next = to->pred_list;
    e->to = to;

    from->succ_list = to->pred_list = e;
}


void life_analysis() {
    int i;

    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
	     if (r->type == VTIDENTIFIER)  
		analyse_life_symbol(r);	        
    	}
    }
}

void analyse_life_symbol(SymReg* r) {
    int i;

    r->life_info = calloc(n_basic_blocks, sizeof(Life_range*));
    if (r->life_info == NULL) {
        fprintf(stderr, "Memory error at analyse_life_symbol");
        abort();
    }

    /* First we make a pass to each block to gather the information
     * that can be obtained locally */
	
    for (i=0; i < n_basic_blocks; i++) {
	analyse_life_block(bb_list[i], r);
    }

    /* Now we need to consider the relations between blocks */

    for (i=0; i < n_basic_blocks; i++) {
	if (r->life_info[i]->flags & LF_use) {
			    
	    /* This block uses r, so it must be live at 
	       the beggining */
	    r->life_info[i]->flags |= LF_lv_in;
	    
	    /* propagate this info to every predecessor */	
	    propagate_need (bb_list[i], r);
	}
    }	    
}

/* analyse_life_block studies the state of the var r
 * in the block bb. 
 *
 * Its job is to set the flags LF_use, or LF_read,
 * and record the intervals inside the block where
 * the var is alive.
 */

void analyse_life_block(Basic_block* bb, SymReg* r) {
    int i, write_pos, read_pos;
    Instruction* ins;
    Life_range* l;

    l = make_life_range(r, bb->index);  
    write_pos = -1;
    read_pos  = -1;
   
    for (i=bb->start->index; i < bb->end->index; i++) {
	ins = instructions[i];
        if (ins==NULL) {
		fprintf(stderr, "Index %i of %i has NULL instruction\n", 
				i, bb->end->index);
		fprintf(stderr, "Total numb. of instructions = %li\n", 
				n_instructions);
		abort();
	}
	if (instruction_reads(ins, r)) {
	    if (l->flags != LF_def) {

		/* we read before having written before, so the var was
		 * live at the beggining of the block */
		write_pos = bb->start->index;
		l->flags = LF_use;
	    } 
	    read_pos = i;
	}

	if (instruction_writes(ins, r)) {
	    if (write_pos < 0) {
		l->flags = LF_def;
		write_pos = i;
	    }
	    else if (read_pos < 0) {
		/* there has not been any read until here, so the previous write
		 * is irrelevant */
		write_pos = i;
	    }
	    else {
		/* this is new writing, after some reading */
		add_life_interval(l, write_pos, read_pos);
		read_pos = -1;
		write_pos = i;
	    }
	}		    
    }	  

    /* At the end, we need to add the last range */
    if (read_pos < 0)  read_pos = write_pos;
 
    if (write_pos >= 0) 
        add_life_interval(l, write_pos, read_pos);
	   
   
    /* The read_pos can latter be extended if it turns out 
     * that another block needs the value resulting of this 
     * computation */
}	

/* add_life_interval records a new range of use of the var 
 * and set the LF_lv_inside flag
 */

void add_life_interval(Life_range *l, int from, int to) {
    int length = l->n_intervals;
    
    l->intervals = realloc(l->intervals, (2 * length + 2) * sizeof(int));    
    if (l->intervals == NULL) {
	fprintf(stderr, "Memory error at add_life_interval\n");
	abort();
    }

    l->intervals[length*2] = from;
    l->intervals[length*2 + 1] = to;

    l->n_intervals = length + 1;

    l->flags |= LF_lv_inside;
    
}	


void propagate_need(Basic_block *bb, SymReg* r) {
    Edge *edge;
    Basic_block *pred;
    Life_range *l;
    
    /* every predecessor of a LF_lv_in block must be in LF_lv_out
       and, unless itself is LV_def, this should be propagated to 
       its predecessors themselves */    

    for (edge=bb->pred_list; edge!=NULL; edge=edge->pred_next) {
	pred = edge->from;
	l = r->life_info[pred->index];
	
	if (l->flags & LF_lv_out) {
	    /* this node has already been visited. Ignore it */
	}
	else {
            l->flags |= LF_lv_out;

	    if (l->flags & LF_lv_inside) {
	        /* we expand the last interval to the end */
                l->intervals[l->n_intervals * 2 - 1] = pred->end->index;
	    }

	    if (! (l->flags & LF_def) ) {
		l->flags |= LF_lv_in;
		if (! (l->flags & LF_lv_inside) ) {
		    l->flags |= LF_lv_all | LF_lv_inside;		    
		}
			
	        propagate_need(pred, r);		
	    }
	}
    }	   
}	


/*** Utility functions ***/ 

void init_basic_blocks() {

   if (bb_list != NULL) {
	free(bb_list); 
   }
   
   bb_list = calloc(256, sizeof(Basic_block*) );
   n_basic_blocks = 0;
}

void clear_basic_blocks() {
   free(bb_list);
   bb_list = NULL;
}

Basic_block* make_basic_block(Instruction* ins) {
   Basic_block *bb;

   if (ins == NULL) {
	   fprintf(stderr, "Internal error: make_basic_block called with NULL argument\n");
	   abort();
   }
   
   bb = malloc(sizeof(Basic_block));
   if (bb==NULL) {
        fprintf(stderr, "Memory error at make_basic_block\n");
	abort();
   }

   bb->start = ins;
   bb->end = NULL;
   bb->pred_list = NULL;
   bb->succ_list = NULL;
   bb->index = n_basic_blocks;
   
   bb_list[n_basic_blocks] = bb;
   ins->basic_block = bb;
   n_basic_blocks++;
   
   return bb;
}

Life_range* make_life_range(SymReg *r, int index) {
   Life_range *l;

   l = malloc(sizeof(Life_range));
   if (l==NULL) {
       fprintf(stderr, "Memory Error at make_life_range\n");
       abort();
   }

   l->flags = 0;
   l->n_intervals = 0;
   l->intervals = NULL;

   r->life_info[index] = l;
   return l;
}
