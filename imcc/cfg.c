
#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "optimizer.h"

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
    Basic_block *bb;
    Instruction *ins, *lab;
    int nu = 0;

    init_basic_blocks();

    ins = instructions;

    bb = make_basic_block(ins);
    for(ins=ins->next; ins; ins = ins->next) {

        bb->end = ins;
        ins->bbindex = n_basic_blocks - 1;
        /* a LABEL starts a new basic block, but not, if we have
         * a new one (last was a branch) */
        if (nu)
            nu = 0;
        else if ( (ins->type & ITLABEL)) {
            bb = make_basic_block(ins);
        }
        /* a branch is the end of a basic block
         * so start a new with the next ins */
        if (ins->type & ITBRANCH) {
            int found = 1;
            /* if we have a bsr, then consider it only as a branch,
             * when we have the target here
             * and it doesn't saveall - like P6C recursive bsr's
             */
            if (!strcmp(ins->op, "bsr")) {
                char *name = ins->r[0]->name;
                found = 0;
                for (lab = instructions; lab; lab = lab->next) {
                    if ((lab->type & ITLABEL) &&
                            !strcmp(lab->r[0]->name, name)) {
                        int j = 0;
                        found = 1;
                        /* XXX look if first 5 ins have saveall
                         * this is a ugly but working hack ;-)
                         */
                        for (lab = lab->next; j < 5 && lab;
                                lab = lab->next, j++) {
                            if (!strcmp(lab->op, "saveall")) {
                                found = 0;
                                break;
                            }
                        }
                        break;
                    }
                }
                debug(DEBUG_CFG, "bsr %s local:%s\n",
                        name, found ? "yes": "no");
            }
            if (found) {
                if (ins->next)
                    bb = make_basic_block(ins->next);
                nu = 1;
            }
        }
        /* XXX instruction type ITADDR is probably address of a
         * CATCH block - we don't optimize them
         * XXX they are marked as branch, to avoid dead code removal
         * when we are sure, how exception will work, we will see.
         */
        if (ins->type & ITADDR)
            dont_optimize = 1;
    }

    if (IMCC_DEBUG & DEBUG_CFG)
	dump_instructions();
}

/* Once the basic blocks have been computed, build_cfg computes
   the dependences between them. */

void build_cfg() {
    int i, j;
    SymReg * addr;
    Basic_block *last, *bb;
    Edge *pred;

    for (i = 0; bb_list[i]; i++) {
        bb = bb_list[i];

        /* if the block can fall-through */
        if (i > 0 && ! (last->end->type & IF_goto) )
            bb_add_edge(last, bb);
        /* look if instruction is a branch */
        addr = get_branch_reg(bb->end);
        if (addr)
            bb_findadd_edge(bb, addr);
        if (!strcmp(bb->end->op, "ret")) {
            debug(DEBUG_CFG, "found ret in bb %d\n", i);
            /* now go back, find labels and connect these with
             * bsrs
             */
            for (pred = bb->pred_list; pred; pred=pred->pred_next) {
                if (!strcmp(pred->from->end->op, "bsr")) {
                    SymReg *r = pred->from->end->r[0];
                    int found = 0;

                    j = pred->from->index;
                    debug(DEBUG_CFG, "\tcalled from bb %d label '%s'? - ",
                            j, r->name);
                    if ((bb->start->type & ITLABEL) &&
                            (!strcmp(bb->start->r[0]->name, r->name)))
                        found = 1;
                    if (found) {
                        debug(DEBUG_CFG, "yep!\n");
                        bb_add_edge(bb, bb_list[j+1]);
                    }
                    else
                        debug(DEBUG_CFG, "na!\n");

                }
            }
        }

        last = bb;
    }

    if (IMCC_DEBUG & DEBUG_CFG)
        dump_cfg();
}


/* find the placement of the label, and link the two nodes */

void bb_findadd_edge(Basic_block *from, SymReg *label) {
    Instruction *ins;

    for (ins = instructions; ins; ins = ins->next) {
	if ((ins->type & ITLABEL) && label == ins->r[0]){

	    bb_add_edge(from, bb_list[ins->bbindex]);
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
        fatal(1, "bb_add_edge", "Out of mem");
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

int edge_count()
{
    Edge *e;
    int i;
    for (i=0, e = edge_list; e; e = e->next, i++)
        {}
    return i;
}

static void add_instruc_reads(Instruction *ins, SymReg *r0)
{
    int i;
    for (i = 0; i < IMCC_MAX_REGS && ins->r[i]; i++)
	if (r0 == ins->r[i])
	    return;
    if (i == IMCC_MAX_REGS) {
	fatal(1, "add_instruc_reads","out of registers with %s\n", r0->name);
    	}
    /* append reg */
    ins->r[i] = r0;
    /* this gets read */
    ins->flags |= (1<<i);
}
/*
 * set P1, P0
 *
 * means, the PMC P1 points to whatever, P0 pointed to
 *
 * set P1, 4 sets P0 value
 * as long as P1 is used (not overwritten, by new or clone)
 */

static void propagate_alias(void)
{
    Instruction *ins, *curr;
    SymReg *r0, *r1;
    for (ins = instructions ; ins ; ins = ins->next) {
	if (ins->type & ITALIAS) {
	    /* make r1 live in each instruction
	     * where r0 lifes, until r0 is written
	     */
	    curr = ins;
	    r0 = ins->r[0];
	    r1 = ins->r[1];
	    if (r1->type & VTREGISTER) {
		for(ins = ins->next ; ins; ins = ins->next)
		    if(instruction_writes(ins, r0))
			break;
		    else if (instruction_reads(ins, r0) &&
			   !instruction_reads(ins, r1)) {
			add_instruc_reads(ins, r1);
		    }
		    else if (instruction_reads(ins, r1) &&
			   !instruction_reads(ins, r0)) {
			add_instruc_reads(ins, r0);
		    }
		ins = curr;
	    }
	}
    }
    if (IMCC_DEBUG & DEBUG_CFG) {
	debug(DEBUG_CFG, "\nAfter propagate_alias\n");
	dump_instructions();
    }
}

void life_analysis() {
    int i;

    propagate_alias();
    for(i = 0; i < n_symbols; i++)
        analyse_life_symbol(reglist[i]);
}

void analyse_life_symbol(SymReg* r) {
    int i;

    if (r->life_info)
        free_life_info(r);
    r->life_info = calloc(n_basic_blocks, sizeof(Life_range*));
    if (r->life_info == NULL) {
        fatal(1, "analyse_life_symbol","Out of mem");
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

void free_life_info(SymReg *r)
{
    int i;
    for (i=0; i < n_basic_blocks; i++) {
	if (r->life_info[i])
            free(r->life_info[i]);
    }
    free(r->life_info);
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
		fatal(1,"analyse_life_block",
                        "Index %i of %i has NULL instruction\n",
				ins->index, bb->end->index);
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
 * Basic block A dominates B, if each path to B passes trough A
 *
 * s. gcc:flow.c compute_dominators
 */

void compute_dominators () {
    int i, change, pred_index;
    Edge *edge;

    dominators = malloc(sizeof(Set*) * n_basic_blocks);

    dominators[0] = set_make (n_basic_blocks);
    set_add(dominators[0], 0);
    for (i=1; i < n_basic_blocks; i++) {
	    dominators[i] = set_make_full (n_basic_blocks);
	}

    change = 1;
    while (change) {
        change = 0;

	/* TODO: This 'for' should be a breadth-first search for speed  */
	for (i = 1; i < n_basic_blocks; i++) {
	    Set *s = set_copy (dominators[i]);

	    for (edge=bb_list[i]->pred_list; edge; edge=edge->pred_next) {
		pred_index = edge->from->index;

		set_intersec_inplace(s, dominators[pred_index]);
	    }

	    set_add(s, i);

	    if (! set_equal(dominators[i], s) ) {
	        change = 1;
		set_free (dominators[i]);
		dominators[i] = s;
	    }
            else
                set_free(s);
	}
    }

    if (IMCC_DEBUG & DEBUG_CFG)
	dump_dominators();

}

static void free_dominators(void)
{
    int i;

    if (!dominators)
        return;
    for (i=0; i < n_basic_blocks; i++) {
        set_free (dominators[i]);
    }
    free(dominators);
    dominators = 0;
}


static void
sort_loops(void)
{
    int i, j, changed;
    Loop_info *li;

    for (i = 0; i < n_loops; i++) {
        loop_info[i]->size = 0;
        for (j = 0; j < n_basic_blocks; j++)
            if (set_contains(loop_info[i]->loop, j))
                loop_info[i]->size++;
    }
    changed = 1;
    while (changed) {
        changed = 0;
        for (i = 0; i < n_loops-1; i++)
            if (loop_info[i]->size < loop_info[i+1]->size) {
                li = loop_info[i];
                loop_info[i] = loop_info[i+1];
                loop_info[i+1] = li;
                changed = 1;
            }
    }
}


/*
 * Searches for loops in the CFG. We search for edges that
 * go from a node to one of its dominators.
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

    sort_loops();
    if (IMCC_DEBUG & DEBUG_CFG) {
        dump_instructions();
	dump_cfg();
        dump_loops();
    }
    if (bb_list[0]->loop_depth) {
        fatal(1, "find_loops", "basic_block 0 in loop\n");
    }
}

/* Incresases the loop_depth of all the nodes in a loop */

void mark_loop (Edge* e){
   Set* loop;
    Basic_block *header, *footer, *enter;
    int i;
    Edge *edge;

   header =  e->to;
   footer =  e->from;
    enter = 0;
    /* look from where loop was entered */

    for (i = 0, edge=header->pred_list; edge; edge=edge->pred_next)
	if (footer != edge->from) {
            enter = edge->from;
            i++;
        }

    debug (DEBUG_CFG, "loop from %d to %d, entered from %d\n", footer->index,
            header->index, enter ? enter->index : -1 );
    if (i != 1) {
        if (i==0)
            debug(DEBUG_CFG,"\tdead code\n");
        else
            debug(DEBUG_CFG,"\tcan't determine loop entry block (%d found)\n" ,i);
    }

   loop = set_make(n_basic_blocks);
   set_add(loop, footer->index);
   set_add(loop, header->index);

   footer->loop_depth++;

    if (header != footer) {
        header->loop_depth++;
   search_predecessors_not_in (footer, loop);
    }

    /* now 'loop' contains the set of nodes inside the loop.
     */
    loop_info = realloc(loop_info, (n_loops+1)*sizeof(Loop_info *));
    if (!loop_info)
        fatal(1, "mark_loop", "Out of mem\n");
    loop_info[n_loops] = malloc(sizeof(Loop_info));
    if (!loop_info[n_loops])
        fatal(1, "mark_loop", "Out of mem\n");
    loop_info[n_loops]->loop = loop;
    loop_info[n_loops]->depth = footer->loop_depth;
    loop_info[n_loops]->n_entries = i;
    loop_info[n_loops]->entry = enter ? enter->index : -1;
    n_loops++;
}

static void free_loops(void)
{
    int i;
    for (i = 0; i < n_loops; i++) {
        set_free(loop_info[i]->loop);
        free(loop_info[i]);
    }
    if (loop_info)
        free(loop_info);
    n_loops = 0;
    loop_info = 0;
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
static int bb_list_size;

void init_basic_blocks() {

    if (bb_list != NULL)
        clear_basic_blocks();
   bb_list = calloc(bb_list_size = 256, sizeof(Basic_block*) );
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
    free_dominators();
    free_loops();
}

Basic_block* make_basic_block(Instruction* ins) {
   Basic_block *bb;

   if (ins == NULL) {
        fatal(1, "make_basic_block", "called with NULL argument\n");
   }

   bb = malloc(sizeof(Basic_block));
   if (bb==NULL) {
        fatal(1, "make_basic_block","Out of mem\n");
   }

   bb->start = ins;
    bb->end = ins;

   bb->pred_list = NULL;
   bb->succ_list = NULL;
    ins->bbindex = bb->index = n_basic_blocks;
   bb->loop_depth = 0;
   if (n_basic_blocks == bb_list_size) {
       bb_list_size *= 2;
       bb_list = realloc(bb_list, bb_list_size*sizeof(Basic_block*) );
       if (bb_list == 0) {
            fatal(1, "make_basic_block","Out of mem\n");
       }
   }
   bb_list[n_basic_blocks] = bb;
   n_basic_blocks++;

   return bb;
}

Life_range* make_life_range(SymReg *r, int idx) {
   Life_range *l;

   l = calloc(1, sizeof(Life_range));
   if (l == NULL) {
        fatal(1, "make_life_range","Out of mem\n");
   }
   r->life_info[idx] = l;
   return l;
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
