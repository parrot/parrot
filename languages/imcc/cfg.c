
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
    
    for(j = 1; instructions[j]; j++) {

	next = instructions[j];

	if (nu) {
	    bb = make_basic_block(next);
	    nu = 0;
	}
	else if (next->type == ITLABEL) {
	    bb->end = ins;
	    bb = make_basic_block(next);
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
    
    e->succ_next = from->succ_list;
    e->from = from;
    
    e->pred_next = to->pred_list;
    e->to = to;

    from->succ_list = to->pred_list = e;
}

/*** Utility functions ***/ 

void init_basic_blocks() {

   if (bb_list == NULL) {
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

