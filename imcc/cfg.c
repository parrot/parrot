
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

static void add_instruc_reads(Instruction *ins, SymReg *r0);
static void add_instruc_writes(Instruction *ins, SymReg *r0);
static void propagate_need(Basic_block *bb, SymReg* r, int i);

/* Code: */


void find_basic_blocks () {
    Basic_block *bb;
    Instruction *ins;
    int nu = 0;
    int i;

    info(2, "find_basic_blocks\n");
    init_basic_blocks();
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
        if (r && (r->type & VTADDRESS)) {
            r->last_ins = NULL;
        }
    }

    ins = instructions;
    ins->index = i = 0;

    bb = make_basic_block(ins);
    if (ins->type & ITBRANCH) {
        SymReg * addr = get_branch_reg(bb->end);
        if (addr)
            addr->last_ins = ins;
    }
    for (ins = ins->next; ins; ins = ins->next) {
        ins->index = ++i;

        bb->end = ins;
        ins->bbindex = n_basic_blocks - 1;
        /* invoke w/o arg implicitly uses P0, so mark it as doing so
         * XXX but in the parser
         */
        if ( !strcmp(ins->op, "invoke") || !strcmp(ins->op, "invokecc")) {
            if (ins->opsize == 1) {
                SymReg * p0 = mk_pasm_reg(str_dup("P0"));
                add_instruc_reads(ins, p0);
                ins->type |= 1;      /* mark branch register */
                dont_optimize = 1;  /* too complex, to follow */
                optimizer_level &= ~OPT_PASM;
                p0->use_count++;
            }
            ins->type |= IF_r0_branch | ITBRANCH;
        }
        else if ( !strcmp(ins->op, "newsub") && ins->opsize == 5) {
            SymReg * p0 = mk_pasm_reg(str_dup("P0"));
            SymReg * p1 = mk_pasm_reg(str_dup("P1"));
            add_instruc_writes(ins, p0);
            add_instruc_writes(ins, p1);
        }
        if ( (ins->type & ITLABEL)) {
            /* set the labels address (ins) */
            ins->r[0]->first_ins = ins;
        }
        /* a LABEL starts a new basic block, but not, if we already have
         * a new one (last was a branch)
         */
        if (nu)
            nu = 0;
        else if ( (ins->type & ITLABEL)) {
            /* XXX look at this change bb->end did include the label,
             * now no more
             * s. t/rx/basic_6
             */
            bb->end = ins->prev;
            bb = make_basic_block(ins);
        }
        /* a branch is the end of a basic block
         * so start a new with the next ins */
        if (ins->type & ITBRANCH) {
            SymReg * addr = get_branch_reg(bb->end);
            int found = 1;

            if (addr)
                addr->last_ins = ins;
            /* if we have a bsr, then consider it only as a branch,
             * when we have the target here
             * and it doesn't saveall - like P6C recursive bsr's
             *
             * ignore set_addr - no new basic block
             */
            if (!strcmp(ins->op, "bsr") || !strcmp(ins->op, "set_addr")) {
                char *name = ins->r[0]->name;
                SymReg *r = get_sym(name);
                if (*ins->op == 'b') {  /* bsr */
                    Instruction * lab;
                    found = r != NULL && r->first_ins;
                    debug(DEBUG_CFG, "bsr %s local:%s\n",
                            name, found ? "yes": "no");
                    if (r) {
                        int j;
                        lab = r->first_ins;
                        if (lab)
                            for (j = 0, lab = lab->next; j < 5 && lab;
                                    lab = lab->next, j++) {
                                if (!strcmp(lab->op, "saveall")) {
                                    ins->type |= ITSAVES;
                                    lab->type |= ITSAVES;
                                    debug(DEBUG_CFG, "\ttype saveall\n");
                                    break;
                                }
                            }
                    }
                }
                else {
                    /* don't treat set_addr as jump source */
                    found = 0;
                }
            }
            if (found) {
                if (ins->next)
                    bb = make_basic_block(ins->next);
                nu = 1;
            }
        }
    }

    if (IMCC_DEBUG & DEBUG_CFG) {
        dump_instructions();
        dump_labels();
    }
}

/* Once the basic blocks have been computed, build_cfg computes
   the dependences between them. */

void build_cfg() {
    int i, j;
    SymReg * addr;
    Basic_block *last = NULL, *bb;
    Edge *pred;

    info(2, "build_cfg\n");
    for (i = 0; i < n_basic_blocks; i++) {
        bb = bb_list[i];

        /* if the block can fall-through */
        if (i > 0 && ! (last->end->type & IF_goto) )
            bb_add_edge(last, bb);
        /* look if instruction is a branch */
        addr = get_branch_reg(bb->end);
        if (addr)
            bb_findadd_edge(bb, addr);
        if (!strcmp(bb->end->op, "ret")) {
            Instruction * sub;
            debug(DEBUG_CFG, "found ret in bb %d\n", i);
            /* now go back, find labels and connect these with
             * bsrs
             */
            for (pred = bb->pred_list; pred; pred = pred->next) {
                int found = 0;
                if (!strcmp(pred->from->end->op, "bsr")) {

                    SymReg *r = pred->from->end->r[0];

                    sub = pred->to->start;
                    if ((sub->type & ITLABEL) &&
                            (!strcmp(sub->r[0]->name, r->name)))
                        found = 1;
invok:
                    j = pred->from->index;
                    if (found) {
                        int saves = 0;
                        debug(DEBUG_CFG, "\tcalled from bb %d '%s'\n",
                            j, ins_string(pred->from->end));
                        for (; sub && sub != bb->end; sub = sub->next) {
                            if (!strcmp(sub->op, "saveall"))
                                if (!(sub->type & ITSAVES)) {
                                    break;
                                }
                            bb_list[sub->bbindex]->flag |= BB_IS_SUB;
                            if (!strcmp(sub->op, "restoreall")) {
                                sub->type |= ITSAVES;
                                saves = 1;
                            }
                        }
                        if (!saves)
                            bb_add_edge(bb, bb_list[j+1]);
                        debug(DEBUG_CFG, "\tand does saevall %s\n",
                                saves ? "yes" : "no");
                    }
                }
                else if (!strcmp(pred->from->end->op, "invoke")) {
                    found = 1;
                    sub = pred->to->start;
                    goto invok;
                }
                if (!found)
                    debug(DEBUG_CFG, "\tcalled from unknown!\n");
            }
        }

        last = bb;
    }
}


/* find the placement of the label, and link the two nodes */

void bb_findadd_edge(Basic_block *from, SymReg *label) {
    Instruction *ins;
    SymReg *r = find_sym(label->name);

    if (r && (r->type & VTADDRESS) && r->first_ins)
        bb_add_edge(from, bb_list[r->first_ins->bbindex]);
    else {
        debug(DEBUG_CFG, "register branch %s ",
                ins_string(from->end));
        /* XXX is probably only ok, if the invoke is "near" the
         *     set_addr ins
         */
        for (ins = from->end; ins; ins = ins->prev) {
            if ((ins->type & ITBRANCH) && !strcmp(ins->op, "set_addr") &&
                    ins->r[1]->first_ins) {
                bb_add_edge(from, bb_list[ins->r[1]->first_ins->bbindex]);
                debug(DEBUG_CFG, "(%s) ", ins->r[1]->name);
                break;
            }
        }
        debug(DEBUG_CFG, "\n");
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

    /* memory housekeeping */
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

static void add_instruc_writes(Instruction *ins, SymReg *r0)
{
    int i;
    for (i = 0; i < IMCC_MAX_REGS && ins->r[i]; i++)
        if (r0 == ins->r[i])
            return;
    if (i == IMCC_MAX_REGS) {
        fatal(1, "add_instruc_writes","out of registers with %s\n", r0->name);
    }
    /* append reg */
    ins->r[i] = r0;
    ins->flags |= (1<< (16+i));
}
#ifdef ALIAS
/*
 * set P1, P0
 *
 * means, the PMC P1 points to whatever, P0 pointed to
 *
 * set P1, 4 sets P0 value
 * as long as P1 is used (not overwritten, by new or clone)
 *
 * XXX currently turned off, this extends life ranges too much
 */

static void propagate_alias(void)
{
    Instruction *ins, *curr;
    SymReg *r0, *r1;
    int any = 0;

    for (ins = instructions ; ins ; ins = ins->next) {
	if (ins->type & ITALIAS) {
	    /* make r1 live in each instruction
	     * where r0 lives, until r0 is written
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
                        any = 1;
		    }
		    else if (instruction_reads(ins, r1) &&
			   !instruction_reads(ins, r0)) {
			add_instruc_reads(ins, r0);
                        any = 1;
		    }
		ins = curr;
	    }
	}
    }
    if (any && (IMCC_DEBUG & DEBUG_CFG)) {
	debug(DEBUG_CFG, "\nAfter propagate_alias\n");
	dump_instructions();
    }
}
#endif

void life_analysis() {
    int i;

    info(2, "life_analysis\n");
#ifdef ALIAS
    propagate_alias();
#endif
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
	    propagate_need (bb_list[i], r, i);
	}
    }
}

void free_life_info(SymReg *r)
{
    int i;
    if (r->life_info) {
        for (i=0; i < n_basic_blocks; i++) {
            if (r->life_info[i])
                free(r->life_info[i]);
        }
        free(r->life_info);
        r->life_info = NULL;
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
    Instruction* ins, *special;
    Life_range* l;

    l = make_life_range(r, bb->index);

    special = NULL;
    for (ins = bb->start; ins ; ins = ins->next) {
        if (ins==NULL) {
		fatal(1,"analyse_life_block",
                        "Index %i of %i has NULL instruction\n",
				ins->index, bb->end->index);
	}
        /* restoreall and such */
        if (ins_writes2(ins, r->set))
            special = ins;

	if (instruction_reads(ins, r)) {
            /* if instruction gets read after a special, consider
             * the first read of this instruction, like if a write
             * had happened at special, so that the reg doesn't pop into
             * life */
	    if (! (l->flags & LF_def) ) {
                if (special) {
                    l->first_ins = special;
                    l->flags |= LF_def;
                    special = NULL;
                }
                else {
                    /* we read before having written before, so the var was
                     * live at the beggining of the block */
                    l->first_ins = bb->start;
                    l->flags |= LF_use;
                }
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


static void
propagate_need(Basic_block *bb, SymReg* r, int i) {
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
                /* we arrived at block 0
                 *
                 * emit a warning if -w
                 * looking at some perl6 examples, where this warning
                 * is emitted, there seems always to be a code path
                 * where the var is not initialized, so this might
                 * even be correct :)
                 */
                if (pred->index == 0) {
                    Instruction *ins = r->life_info[i]->first_ins;
                    int bbi = ins->bbindex;
                    for ( ; ins && ins->bbindex == bbi; ins = ins->next)
                        if (instruction_reads(ins, r))
                            break;
                    warning("propagate_need",
                            "'%s' might be used uninitialized in %s:%d\n",
                            r->name, function, ins->line);
                }

	        propagate_need(pred, r, i);
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
#define USE_BFS 1

#if !USE_BFS
    int i, change, pred_index;
#else
    int i, cur, len, succ_index;
    int *q;
    Set *visited;
#endif

    Edge *edge;

    info(2, "compute_dominators\n");
    dominators = malloc(sizeof(Set*) * n_basic_blocks);


    dominators[0] = set_make (n_basic_blocks);
    set_add(dominators[0], 0);
    for (i=1; i < n_basic_blocks; i++) {
        dominators[i] = set_make_full (n_basic_blocks);
    }

#if USE_BFS
    q = calloc(n_basic_blocks, sizeof(int));
    visited = set_make (n_basic_blocks);
    set_add(visited, 0);
    len=1;
    cur=0;

    while(cur < len) {
        for(edge = bb_list[q[cur]]->succ_list; edge; edge = edge->succ_next) {
            succ_index = edge->to->index;
            set_intersec_inplace(dominators[succ_index], dominators[q[cur]]);
            set_add(dominators[succ_index],succ_index);

            if(!set_contains(visited, succ_index)) {
                set_add(visited, succ_index);
                q[len++] = succ_index;
            }
        }
        cur++;
    }
#else
    change = 1;
    while(change) {
        change = 0;

	/* TODO: This 'for' should be a breadth-first search for speed */
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
#endif
    if (IMCC_DEBUG & DEBUG_CFG)
	dump_dominators();
#if USE_BFS
    free(q);
    set_free(visited);
#endif
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
    /* set depth, it's incorrect til now, as it did depend on the
     * order of finding loops
     */
    for (i = 0; i < n_loops-1; i++) {
        int first = -1, last = 0;
        loop_info[i]->depth = 1;
        /* we could also take the depth of the first contained
         * block, but below is a check, that a inner loop is fully
         * contained in a outer loop
         */
        for (j = 0; j < n_basic_blocks; j++)
            if (set_contains(loop_info[i+1]->loop, j)) {
                if (first < 0)
                    first = j;
                last = j;
            }
        for (j = i + 1; j < n_loops; j++) {
            if (set_contains(loop_info[i]->loop, first) &&
                    !set_contains(loop_info[i]->loop, last)) {
                debug(DEBUG_CFG, "sort_loops",
                        "loop %d contains first but not"
                        "last of outer loop %d\n", j, i);
            }
            if (set_contains(loop_info[i]->loop, last) &&
                    !set_contains(loop_info[i]->loop, first)) {
                debug(DEBUG_CFG, "sort_loops",
                        "loop %d contains last but not"
                        "first of outer loop %d\n", j, i);
            }
            loop_info[j]->depth = loop_info[i]->depth + 1;
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

    info(2, "find_loops\n");
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
        dump_loops();
    }
#if 0
    /* when a branch goes to the subroutine entry, this may happen
     * so its not an error
     */
    if (bb_list[0]->loop_depth) {
        fatal(1, "find_loops", "basic_block 0 in loop\n");
    }
#endif
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
            debug(DEBUG_CFG,
                    "\tcan't determine loop entry block (%d found)\n" ,i);
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
    if (bb_list) {
        for (i=0; i < n_basic_blocks; i++)
            free(bb_list[i]);
        free(bb_list);
        bb_list = NULL;
    }
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
