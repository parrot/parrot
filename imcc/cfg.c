
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
static void bb_findadd_edge(Parrot_Interp, Basic_block*, SymReg*);
static void mark_loop(Parrot_Interp, Edge*);
static void init_basic_blocks(Parrot_Interp);
static void analyse_life_symbol(Parrot_Interp, SymReg*);
static void analyse_life_block(Parrot_Interp, Basic_block*, SymReg*);
static void bb_add_edge(Parrot_Interp, Basic_block*, Basic_block*);
static Basic_block* make_basic_block(Parrot_Interp, Instruction*);

/* Code: */

#define INVOKE_SUB_CALL 1
#define INVOKE_SUB_RET  2
#define INVOKE_SUB_LOOP 3
#define INVOKE_SUB_OTHER 4
static int
check_invoke_type(Instruction *ins)
{
    /*
     * 1) pcc sub call or yield
     */
    if (ins->type & (ITPCCSUB | ITPCCYIELD))
        return INVOKE_SUB_CALL;
    /*
     * inside another pcc_sub
     * 2) invoke = loop to begin
     */
    if (instructions->r[1] && instructions->r[1]->pcc_sub)
        return INVOKE_SUB_LOOP;
    /* 3) invoke P1 returns */
    if (ins->opsize == 2)
        return INVOKE_SUB_RET;
    /* 4) other usage */

    dont_optimize = 1;  /* too complex, to follow */
    optimizer_level &= ~OPT_PASM;
    return INVOKE_SUB_OTHER;
}

void
find_basic_blocks (Parrot_Interp interpreter, int first) {
    Basic_block *bb;
    Instruction *ins;
    int nu = 0;
    int i;

    info(interpreter, 2, "find_basic_blocks\n");
    init_basic_blocks(interpreter);
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
        if (r && (r->type & VTADDRESS)) {
            r->last_ins = NULL;
        }
    }

    ins = instructions;
    if (first && ins->type == ITLABEL && ins->r[1]) {
        debug(interpreter, DEBUG_CFG, "pcc_sub %s nparams %d\n",
                ins->r[0]->name, ins->r[1]->pcc_sub->nargs);
        expand_pcc_sub(interpreter, ins);
    }
    ins->index = i = 0;

    bb = make_basic_block(interpreter, ins);
    if (ins->type & ITBRANCH) {
        SymReg * addr = get_branch_reg(bb->end);
        if (addr)
            addr->last_ins = ins;
    }
    for (ins = ins->next; ins; ins = ins->next) {
        ins->index = ++i;

        bb->end = ins;
        ins->bbindex = IMCC_INFO(interpreter)->n_basic_blocks - 1;
        /* invoke w/o arg implicitly uses P0, so mark it as doing so
         * XXX but in the parser
         */
        if ( !strcmp(ins->op, "invoke") || !strcmp(ins->op, "invokecc")) {
            if (ins->opsize == 1) {
                SymReg * p0 = mk_pasm_reg(str_dup("P0"));
                add_instruc_reads(ins, p0);
                check_invoke_type(ins);
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
        if (ins->opnum == -1 && (ins->type & ITPCCSUB)) {
            if (first) {
                if (ins->type & ITLABEL) {
                    expand_pcc_sub_ret(interpreter, ins);
                    ins->type &= ~ITLABEL;
                }
                else {
                    /* if this is a pcc_sub_call expand it */
                    expand_pcc_sub_call(interpreter, ins);
                }
                ins->type &= ~ITPCCSUB;
            }
        }
        else if (ins->type & ITLABEL) {
            /* set the labels address (ins) */
            ins->r[0]->first_ins = ins;
        }
        /* a LABEL starts a new basic block, but not, if we already have
         * a new one (last was a branch)
         */
        if (nu)
            nu = 0;
        else if ( (ins->type & ITLABEL)) {
            bb->end = ins->prev;
            bb = make_basic_block(interpreter, ins);
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
            if (!strcmp(ins->op, "bsr") || !strcmp(ins->op, "set_addr") ||
                    !strcmp(ins->op, "newsub")) {
                char *name = ins->r[0]->name;
                SymReg *r = get_sym(name);
                if (*ins->op == 'b') {  /* bsr */
                    Instruction * lab;
                    found = r != NULL && r->first_ins;
                    debug(interpreter, DEBUG_CFG, "bsr %s local:%s\n",
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
                                    debug(interpreter, DEBUG_CFG, "\ttype saveall\n");
                                    break;
                                }
                            }
                    }
                }
                else {
                    /* don't treat set_addr/newsub as jump source */
                    found = 0;
                }
            }
            if (found) {
                if (ins->next)
                    bb = make_basic_block(interpreter, ins->next);
                nu = 1;
            }
        }
    }

    if (IMCC_INFO(interpreter)->debug & DEBUG_CFG) {
        dump_instructions(interpreter);
        dump_labels(interpreter);
    }
}

/* Once the basic blocks have been computed, build_cfg computes
   the dependences between them. */

void build_cfg(Parrot_Interp interpreter) {
    int i, j;
    SymReg * addr;
    Basic_block *last = NULL, *bb;
    Edge *pred;

    info(interpreter, 2, "build_cfg\n");
    for (i = 0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++) {
        bb = IMCC_INFO(interpreter)->bb_list[i];

        /* if the block can fall-through */
        if (i > 0 && ! (last->end->type & IF_goto) )
            bb_add_edge(interpreter, last, bb);
        /* look if instruction is a branch */
        addr = get_branch_reg(bb->end);
        if (addr)
            bb_findadd_edge(interpreter, bb, addr);
        else if (!strcmp(bb->start->op, "invoke") ||
                !strcmp(bb->start->op, "invokecc")) {
            if (check_invoke_type(bb->start) == INVOKE_SUB_LOOP)
                bb_add_edge(interpreter, bb, IMCC_INFO(interpreter)->bb_list[0]);
        }
        if (!strcmp(bb->end->op, "ret")) {
            Instruction * sub;
            debug(interpreter, DEBUG_CFG, "found ret in bb %d\n", i);
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
                        debug(interpreter, DEBUG_CFG, "\tcalled from bb %d '%s'\n",
                            j, ins_string(pred->from->end));
                        for (; sub && sub != bb->end; sub = sub->next) {
                            if (!strcmp(sub->op, "saveall"))
                                if (!(sub->type & ITSAVES)) {
                                    break;
                                }
                            IMCC_INFO(interpreter)->bb_list[sub->bbindex]->
                                flag |= BB_IS_SUB;
                            if (!strcmp(sub->op, "restoreall")) {
                                sub->type |= ITSAVES;
                                saves = 1;
                            }
                        }
                        if (!saves)
                            bb_add_edge(interpreter, bb,
                                    IMCC_INFO(interpreter)->bb_list[j+1]);
                        debug(interpreter, DEBUG_CFG, "\tand does saevall %s\n",
                                saves ? "yes" : "no");
                    }
                }
                else if (!strcmp(pred->from->end->op, "invoke")) {
                    found = 1;
                    sub = pred->to->start;
                    goto invok;
                }
                if (!found)
                    debug(interpreter, DEBUG_CFG, "\tcalled from unknown!\n");
            }
        }

        last = bb;
    }
}


/* find the placement of the label, and link the two nodes */

static void
bb_findadd_edge(Parrot_Interp interpreter, Basic_block *from, SymReg *label) {
    Instruction *ins;
    SymReg *r = find_sym(label->name);

    if (r && (r->type & VTADDRESS) && r->first_ins)
        bb_add_edge(interpreter, from,
                IMCC_INFO(interpreter)->bb_list[r->first_ins->bbindex]);
    else {
        debug(interpreter, DEBUG_CFG, "register branch %s ",
                ins_string(from->end));
        /* XXX is probably only ok, if the invoke is "near" the
         *     set_addr ins
         */
        for (ins = from->end; ins; ins = ins->prev) {
            if ((ins->type & ITBRANCH) && !strcmp(ins->op, "set_addr") &&
                    ins->r[1]->first_ins) {
                bb_add_edge(interpreter, from, IMCC_INFO(interpreter)->
                        bb_list[ins->r[1]->first_ins->bbindex]);
                debug(interpreter, DEBUG_CFG, "(%s) ", ins->r[1]->name);
                break;
            }
        }
        debug(interpreter, DEBUG_CFG, "\n");
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


void
bb_add_edge(Parrot_Interp interpreter, Basic_block *from, Basic_block *to) {

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
    if (IMCC_INFO(interpreter)->edge_list == 0)
	IMCC_INFO(interpreter)->edge_list = e;
    else {
	e->next = IMCC_INFO(interpreter)->edge_list;
	IMCC_INFO(interpreter)->edge_list = e;
    }
}

static void
free_edge(Parrot_Interp interpreter)
{
    Edge *e, *next;
    for (e = IMCC_INFO(interpreter)->edge_list; e; ) {
	next = e->next;
	free(e);
	e = next;
    }
    IMCC_INFO(interpreter)->edge_list = 0;
}

int
edge_count(Parrot_Interp interpreter)
{
    Edge *e;
    int i;
    for (i=0, e = IMCC_INFO(interpreter)->edge_list; e; e = e->next, i++)
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
    if (any && (IMCC_INFO(interpreter)->debug & DEBUG_CFG)) {
	debug(interpreter, DEBUG_CFG, "\nAfter propagate_alias\n");
	dump_instructions(interpreter);
    }
}
#endif

void life_analysis(Parrot_Interp interpreter) {
    int i;

    info(interpreter, 2, "life_analysis\n");
#ifdef ALIAS
    propagate_alias();
#endif
    for(i = 0; i < n_symbols; i++)
        analyse_life_symbol(interpreter, reglist[i]);
}

static void
analyse_life_symbol(Parrot_Interp interpreter, SymReg* r) {
    int i;

    if (r->life_info)
        free_life_info(interpreter, r);
    r->life_info = calloc(IMCC_INFO(interpreter)->n_basic_blocks,
            sizeof(Life_range*));
    if (r->life_info == NULL) {
        fatal(1, "analyse_life_symbol","Out of mem");
    }

    /* First we make a pass to each block to gather the information
     * that can be obtained locally */

    for (i=0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++) {
	analyse_life_block(interpreter, IMCC_INFO(interpreter)->bb_list[i], r);
    }

    /* Now we need to consider the relations between blocks */

    for (i=0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++) {
	if (r->life_info[i]->flags & LF_use) {

	    /* This block uses r, so it must be live at
	       the beggining */
	    r->life_info[i]->flags |= LF_lv_in;

	    /* propagate this info to every predecessor */
	    propagate_need (IMCC_INFO(interpreter)->bb_list[i], r, i);
	}
    }
}

void
free_life_info(Parrot_Interp interpreter, SymReg *r)
{
    int i;
    if (r->life_info) {
        for (i=0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++) {
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

void
analyse_life_block(Parrot_Interp interpreter, Basic_block* bb, SymReg* r) {
    Instruction* ins, *special;
    Life_range* l;

    UNUSED(interpreter);
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
    /* l->last_ins = bb->end; XXX:leo why? */

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
                 *
                 * XXX subroutines
                 */
#if 0
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
#endif
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

void
compute_dominators (Parrot_Interp interpreter) {
#define USE_BFS 1

#if !USE_BFS
    int i, change, pred_index;
#else
    int i, cur, len, succ_index;
    int *q;
    Set *visited;
#endif
    int n;
    Edge *edge;
    Set** dominators;

    n = IMCC_INFO(interpreter)->n_basic_blocks;
    info(interpreter, 2, "compute_dominators\n");
    dominators = IMCC_INFO(interpreter)->dominators = malloc(sizeof(Set*) * n);


    dominators[0] = set_make(n);
    set_add(dominators[0], 0);
    for (i = 1; i < n; i++) {
        dominators[i] = set_make_full(n);
    }

#if USE_BFS
    q = calloc(n, sizeof(int));
    visited = set_make (n);
    set_add(visited, 0);
    len=1;
    cur=0;

    while(cur < len) {
        for (edge = IMCC_INFO(interpreter)->bb_list[q[cur]]->succ_list;
                edge; edge = edge->succ_next) {
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
        for (i = 1; i < n; i++) {
            Set *s = set_copy (dominators[i]);

            for (edge=IMCC_INFO(interpreter)->bb_list[i]->pred_list;
                    edge; edge=edge->pred_next) {
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
    if (IMCC_INFO(interpreter)->debug & DEBUG_CFG)
        dump_dominators(interpreter);
#if USE_BFS
    free(q);
    set_free(visited);
#endif
}

static void
free_dominators(Parrot_Interp interpreter)
{
    int i;

    if (!IMCC_INFO(interpreter)->dominators)
        return;
    for (i=0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++) {
        set_free (IMCC_INFO(interpreter)->dominators[i]);
    }
    free(IMCC_INFO(interpreter)->dominators);
    IMCC_INFO(interpreter)->dominators = 0;
}


static void
sort_loops(Parrot_Interp interpreter)
{
    int i, j, changed;
    Loop_info *li;
    int n_loops = IMCC_INFO(interpreter)->n_loops;
    Loop_info ** loop_info = IMCC_INFO(interpreter)->loop_info;

    for (i = 0; i < n_loops; i++) {
        loop_info[i]->size = 0;
        for (j = 0; j < IMCC_INFO(interpreter)->n_basic_blocks; j++)
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
        for (j = 0; j < IMCC_INFO(interpreter)->n_basic_blocks; j++)
            if (set_contains(loop_info[i+1]->loop, j)) {
                if (first < 0)
                    first = j;
                last = j;
            }
        for (j = i + 1; j < n_loops; j++) {
            if (set_contains(loop_info[i]->loop, first) &&
                    !set_contains(loop_info[i]->loop, last)) {
                debug(interpreter, DEBUG_CFG, "sort_loops",
                        "loop %d contains first but not"
                        "last of outer loop %d\n", j, i);
            }
            if (set_contains(loop_info[i]->loop, last) &&
                    !set_contains(loop_info[i]->loop, first)) {
                debug(interpreter, DEBUG_CFG, "sort_loops",
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

void
find_loops (Parrot_Interp interpreter) {
    int i, succ_index;
    Set* dom;
    Edge* edge;

    info(interpreter, 2, "find_loops\n");
    for (i = 0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++) {
	dom = IMCC_INFO(interpreter)->dominators[i];

	for (edge=IMCC_INFO(interpreter)->bb_list[i]->succ_list;
                edge != NULL; edge=edge->succ_next) {
	    succ_index = edge->to->index;

	    if (set_contains(dom, succ_index) ) {
		mark_loop(interpreter, edge);
	    }
        }
    }

    sort_loops(interpreter);
    if (IMCC_INFO(interpreter)->debug & DEBUG_CFG)
        dump_loops(interpreter);
#if 0
    /* when a branch goes to the subroutine entry, this may happen
     * so its not an error
     */
    if (IMCC_INFO(interpreter)->bb_list[0]->loop_depth) {
        fatal(1, "find_loops", "basic_block 0 in loop\n");
    }
#endif
}

/* Incresases the loop_depth of all the nodes in a loop */

static void
mark_loop (Parrot_Interp interpreter, Edge* e){
    Set* loop;
    Basic_block *header, *footer, *enter;
    int i;
    Edge *edge;
    int n_loops;
    Loop_info ** loop_info;

    header =  e->to;
    footer =  e->from;
    enter = 0;
    /* look from where loop was entered */

    for (i = 0, edge=header->pred_list; edge; edge=edge->pred_next)
        if (footer != edge->from) {
            enter = edge->from;
            i++;
        }

    debug(interpreter, DEBUG_CFG, "loop from %d to %d, entered from %d\n",
            footer->index, header->index, enter ? enter->index : -1 );
    if (i != 1) {
        if (i==0) {
            if (header->index)
                debug(interpreter, DEBUG_CFG,"\tdead code\n");
            else
                debug(interpreter, DEBUG_CFG, "\tsub start\n");
        }
        else
            debug(interpreter, DEBUG_CFG,
                    "\tcan't determine loop entry block (%d found)\n" ,i);
    }

    loop = set_make(IMCC_INFO(interpreter)->n_basic_blocks);
    set_add(loop, footer->index);
    set_add(loop, header->index);

    footer->loop_depth++;

    if (header != footer) {
        header->loop_depth++;
        search_predecessors_not_in (footer, loop);
    }

    /* now 'loop' contains the set of nodes inside the loop.
    */
    n_loops = IMCC_INFO(interpreter)->n_loops;
    loop_info = IMCC_INFO(interpreter)->loop_info;
    loop_info = IMCC_INFO(interpreter)->loop_info =
        realloc(loop_info, (n_loops+1)*sizeof(Loop_info *));
    if (!loop_info)
        fatal(1, "mark_loop", "Out of mem\n");
    loop_info[n_loops] = malloc(sizeof(Loop_info));
    if (!loop_info[n_loops])
        fatal(1, "mark_loop", "Out of mem\n");
    loop_info[n_loops]->loop = loop;
    loop_info[n_loops]->depth = footer->loop_depth;
    loop_info[n_loops]->n_entries = i;
    loop_info[n_loops]->entry = enter ? enter->index : -1;
    IMCC_INFO(interpreter)->n_loops++;
}

static void
free_loops(Parrot_Interp interpreter)
{
    int i;
    for (i = 0; i < IMCC_INFO(interpreter)->n_loops; i++) {
        set_free(IMCC_INFO(interpreter)->loop_info[i]->loop);
        free(IMCC_INFO(interpreter)->loop_info[i]);
    }
    if (IMCC_INFO(interpreter)->loop_info)
        free(IMCC_INFO(interpreter)->loop_info);
    IMCC_INFO(interpreter)->n_loops = 0;
    IMCC_INFO(interpreter)->loop_info = 0;
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

static void
init_basic_blocks(Parrot_Interp interpreter) {

    if (IMCC_INFO(interpreter)->bb_list != NULL)
        clear_basic_blocks(interpreter);
    IMCC_INFO(interpreter)->bb_list =
        calloc(IMCC_INFO(interpreter)->bb_list_size = 256,
            sizeof(Basic_block*) );
    IMCC_INFO(interpreter)->n_basic_blocks = 0;
    IMCC_INFO(interpreter)->edge_list = 0;
}

void clear_basic_blocks(Parrot_Interp interpreter) {
    int i;
    if (IMCC_INFO(interpreter)->bb_list) {
        for (i=0; i < IMCC_INFO(interpreter)->n_basic_blocks; i++)
            free(IMCC_INFO(interpreter)->bb_list[i]);
        free(IMCC_INFO(interpreter)->bb_list);
        IMCC_INFO(interpreter)->bb_list = NULL;
    }
    free_edge(interpreter);
    free_dominators(interpreter);
    free_loops(interpreter);
}

Basic_block*
make_basic_block(Parrot_Interp interpreter, Instruction* ins) {
    Basic_block *bb;
    int n;

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
    n = IMCC_INFO(interpreter)->n_basic_blocks;
    ins->bbindex = bb->index = n;
    bb->loop_depth = 0;
    if (n == IMCC_INFO(interpreter)->bb_list_size) {
        IMCC_INFO(interpreter)->bb_list_size *= 2;
        IMCC_INFO(interpreter)->bb_list =
            realloc(IMCC_INFO(interpreter)->bb_list,
                IMCC_INFO(interpreter)->bb_list_size*sizeof(Basic_block*) );
        if (IMCC_INFO(interpreter)->bb_list == 0) {
            fatal(1, "make_basic_block","Out of mem\n");
        }
    }
    IMCC_INFO(interpreter)->bb_list[n] = bb;
    IMCC_INFO(interpreter)->n_basic_blocks++;

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
