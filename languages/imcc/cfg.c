
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
    int nu;
    Basic_block *bb;
    Instruction *ins, *next, *last;

    init_basic_blocks();

    last = instructions;

    bb = make_basic_block(last);
    nu = 0;
    ins = NULL;

    instructions->bbindex = 0;
    for(last=last->next; last; last = last->next) {

	next = last;

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
	last->bbindex = n_basic_blocks - 1;

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
    Instruction *ins;

    for (ins = instructions; ins; ins = ins->next) {
	if (ins->type == ITLABEL && label == ins->r0){

	    bb_add_edge(from, ins->basic_block);
	    return;

	    /* a label appears just once */

	}
    }
}


int blocks_are_connected(Basic_block *from, Basic_block *to)
{
    Edge *pred;
    for (pred = to->pred_list; pred != NULL; pred=pred->pred_next) {
	if (pred->from == from)
	    return 1; /*already linked*/
    }
    return 0;
}

static Edge * edge_list;

void bb_add_edge(Basic_block *from, Basic_block *to) {

    Edge *e;
    if (blocks_are_connected(from, to))
	return;

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

    /* mempory housekeeping */
    e->next = 0;
    if (edge_list == 0)
	edge_list = e;
    else {
	e->next = edge_list;
	edge_list = e;
    }
}

static void free_edge(void)
{
    Edge *e, *next;
    for (e = edge_list; e; ) {
	next = e->next;
	free(e);
	e = next;
    }
    edge_list = 0;
}

void life_analysis() {
    int i;

    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
	     if (r->type == VTIDENTIFIER || r->type == VTREG)
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
    Instruction* ins;
    Life_range* l;

    l = make_life_range(r, bb->index);

    for (ins = bb->start; ins ; ins = ins->next) {
        if (ins==NULL) {
		fprintf(stderr, "Index %i of %i has NULL instruction\n",
				ins->index, bb->end->index);
		abort();
	}
	if (instruction_reads(ins, r)) {
	    if (! (l->flags & LF_def) ) {

		/* we read before having written before, so the var was
		 * live at the beggining of the block */
		l->first_ins = bb->start;
		l->flags |= LF_use;
	    }
	    l->last_ins = ins;
	}

	if (instruction_writes(ins, r)) {

	    l->flags |= LF_def;

	    if (!l->first_ins) {
		l->first_ins = ins;
	    }

	    l->last_ins = ins;
	}
	if (ins == bb->end)
	    break;
    }

    if (!l->last_ins)
	l->last_ins = l->first_ins;

    /* l->last can latter be extended if it turns out
     * that another block needs the value resulting of this
     * computation */

}


void propagate_need(Basic_block *bb, SymReg* r) {
    Edge *edge;
    Basic_block *pred;
    Life_range *l;

    l = r->life_info[bb->index];
    l->last_ins = bb->end;

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
	    l->last_ins = pred->end;

	    if (! (l->flags & LF_def) ) {
		l->flags |= LF_lv_in;
		l->first_ins = pred->start;
		l->last_ins  = pred->end;

	        propagate_need(pred, r);
	    }
	}
    }
}

/*
 * Computes the dominators tree of the CFG.
 * Basick block A dominates B, if each path to B passes trough A
 */

void compute_dominators () {
    int i, change, pred_index;
    Edge *edge;

    dominators = malloc(sizeof(Set*) * n_basic_blocks);

    for (i=0; i < n_basic_blocks; i++) {
	if (i == 0) {
	    dominators[i] = set_make (n_basic_blocks);
	    set_add(dominators[i], 0);
	}
	else {
	    dominators[i] = set_make_full (n_basic_blocks);
	}
    }

    change = 1;
    while (change) {
        change = 0;

	/* TODO: This 'for' should be a breadth-first search for speed  */
	for (i = 0; i < n_basic_blocks; i++) {
	    Set *s = set_copy (dominators[i]);

	    for (edge=bb_list[i]->pred_list; edge!=NULL; edge=edge->pred_next) {
		pred_index = edge->from->index;

		set_intersec_inplace(s, dominators[pred_index]);
	    }

	    set_add(s, i);

	    if (! set_equal(dominators[i], s) ) {
	        change = 1;
		set_free (dominators[i]);
		dominators[i] = s;
	    }
	}
    }

    if (IMCC_DEBUG)
	dump_dominators();

}

/*
 * Searches for loops in the CFG. We search for edges that go from a node to one
 * of its dominators.
 */

void find_loops () {
    int i, succ_index;
    Set* dom;
    Edge* edge;

    for (i = 0; i < n_basic_blocks; i++) {
	dom = dominators[i];

	for (edge=bb_list[i]->succ_list; edge != NULL; edge=edge->succ_next) {
	    succ_index = edge->to->index;

	    if (set_contains(dom, succ_index) ) {
		mark_loop(edge);
	    }
        }
    }

    if (IMCC_DEBUG)
	dump_cfg();
}

/* Incresases the loop_depth of all the nodes in a loop */
void mark_loop (Edge* e){
   Set* loop;
   Basic_block *header, *footer;

   header =  e->to;
   footer =  e->from;

   if (IMCC_DEBUG)
	fprintf (stderr, "loop from %d to %d\n", footer->index, header->index );

   loop = set_make(n_basic_blocks);
   set_add(loop, footer->index);
   set_add(loop, header->index);

   footer->loop_depth++;
   header->loop_depth++;

   search_predecessors_not_in (footer, loop);

   /* now 'loop' contains the set of nodes inside the loop. We should probably save this
    * for later use */
}

void search_predecessors_not_in(Basic_block *node, Set* s) {
   Edge *edge;
   Basic_block *pred;

   for (edge = node->pred_list; edge != NULL; edge = edge->pred_next) {
	pred = edge->from;

	if (! set_contains(s, pred->index) ) {
	   set_add(s, pred->index);
	   pred->loop_depth++;
	   search_predecessors_not_in (pred, s);
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
   edge_list = 0;
}

void clear_basic_blocks() {
    int i;
    for (i=0; i < n_basic_blocks; i++)
	free(bb_list[i]);
   free(bb_list);
   bb_list = NULL;
   free_edge();
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
   bb->loop_depth = 0;

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
   l->first_ins = 0;
   l->last_ins = 0;

   r->life_info[index] = l;
   return l;
}
