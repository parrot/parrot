/*
 * cfg.c
 *
 * A basic block is the longest sequence of instructions that we are
 * sure will be executed sequentally: no branches, no labels.
 *
 * The control-flow graph is a directed graph that reflects the
 * flow of execution between blocks.
 */


#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "optimizer.h"
#include "parrot/oplib/ops.h"

/* #define ALIAS */

static void add_instruct_reads(Interp *, Instruction *ins, SymReg *r0);
static void add_instruct_writes(Interp *, Instruction *ins, SymReg *r0);
static void propagate_need(Basic_block *bb, SymReg* r, int i);
static void bb_findadd_edge(Parrot_Interp, IMC_Unit *, Basic_block*, SymReg*);
static void mark_loop(Parrot_Interp, IMC_Unit *, Edge*);
static void init_basic_blocks(IMC_Unit *);
static void analyse_life_symbol(Parrot_Interp, IMC_Unit *, SymReg*);
static void analyse_life_block(Parrot_Interp, Basic_block*, SymReg*);
static void bb_add_edge(IMC_Unit *, Basic_block*, Basic_block*);
static Basic_block* make_basic_block(Interp *, IMC_Unit *, Instruction*);

/* Code: */

#define INVOKE_SUB_CALL 1
#define INVOKE_SUB_RET  2
#define INVOKE_SUB_LOOP 3
#define INVOKE_SUB_OTHER 4

static int
check_invoke_type(Interp *interp, IMC_Unit * unit, Instruction *ins)
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
    if (unit->instructions->r[1] && unit->instructions->r[1]->pcc_sub)
        return INVOKE_SUB_LOOP;
    /* 3) invoke P1 returns */
    if (ins->opsize == 2)
        return INVOKE_SUB_RET;
    /* 4) other usage */

    IMCC_INFO(interp)->dont_optimize = 1;  /* too complex, to follow */
    IMCC_INFO(interp)->optimizer_level &= ~OPT_PASM;
    return INVOKE_SUB_OTHER;
}

void
find_basic_blocks (Parrot_Interp interpreter, IMC_Unit * unit, int first)
{
    Basic_block *bb;
    Instruction *ins;
    int nu = 0;
    int i;

    IMCC_info(interpreter, 2, "find_basic_blocks\n");
    init_basic_blocks(unit);
    for (i = 0; i < HASH_SIZE; i++) {
        SymReg * r;
        for (r = unit->hash[i]; r; r = r->next) {
            if (r && (r->type & VTADDRESS)) {
                r->last_ins = NULL;
            }
        }
    }

    /* XXX FIXME: Now the way to check for a sub is unit->type */
    ins = unit->instructions;
    if (first && ins->type == ITLABEL && ins->r[1]) {
        IMCC_debug(interpreter, DEBUG_CFG, "pcc_sub %s nparams %d\n",
                ins->r[0]->name, ins->r[1]->pcc_sub->nargs);
        expand_sub(interpreter, unit, ins);
    }
    ins->index = i = 0;

    bb = make_basic_block(interpreter, unit, ins);
    if (ins->type & ITBRANCH) {
        SymReg * addr = get_branch_reg(bb->end);
        if (addr)
            addr->last_ins = ins;
    }
    for (ins = ins->next; ins; ins = ins->next) {
        ins->index = ++i;

        bb->end = ins;
        ins->bbindex = unit->n_basic_blocks - 1;
        /* invoke and newsub have implicit args (P0, P1) so mark it as doing so
         * XXX Needs to be done in the parser or instruction creation api
         */
        if ( !strcmp(ins->op, "invoke") || !strcmp(ins->op, "invokecc")) {
            if (ins->opsize == 1) {
                SymReg * p0 = get_pasm_reg(interpreter, "P0");
                add_instruct_reads(interpreter, ins, p0);
                check_invoke_type(interpreter, unit, ins);
                p0->use_count++;
            }
            ins->type |= IF_r0_branch | ITBRANCH;
        }
        else if ( !strcmp(ins->op, "newsub") && ins->opsize == 5) {
            SymReg * p0 = get_pasm_reg(interpreter, "P0");
            SymReg * p1 = get_pasm_reg(interpreter, "P1");
            add_instruct_writes(interpreter, ins, p0);
            add_instruct_writes(interpreter, ins, p1);
        }

        if (ins->opnum == -1 && (ins->type & ITPCCSUB)) {
            if (first) {
                /* XXX FIXME: Now the way to check for a sub is unit->type */
                if (ins->type & ITLABEL) {
                    expand_sub_ret(interpreter, unit, ins);
                    ins->type &= ~ITLABEL;
                }
                else {
                    /* if this is a sub call expand it */
                    expand_sub_call(interpreter, unit, ins);
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
            bb = make_basic_block(interpreter, unit, ins);
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
                    IMCC_debug(interpreter, DEBUG_CFG, "bsr %s local:%s\n",
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
                                    IMCC_debug(interpreter, DEBUG_CFG, "\ttype saveall\n");
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
                    bb = make_basic_block(interpreter, unit, ins->next);
                nu = 1;
            }
        }
    }

    if (interpreter->imc_info->debug & DEBUG_CFG) {
        dump_instructions(interpreter, unit);
        dump_labels(unit);
    }
}

/* Once the basic blocks have been computed, build_cfg computes
   the dependences between them. */

void
build_cfg(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int i, j;
    SymReg * addr;
    Basic_block *last = NULL, *bb;
    Edge *pred;

    IMCC_info(interpreter, 2, "build_cfg\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        bb = unit->bb_list[i];

        /* if the block can fall-through */
        if (i > 0 && ! (last->end->type & IF_goto) )
            bb_add_edge(unit, last, bb);
        /* look if instruction is a branch */
        addr = get_branch_reg(bb->end);
        if (addr)
            bb_findadd_edge(interpreter, unit, bb, addr);
        else if (!strcmp(bb->start->op, "invoke") ||
                !strcmp(bb->start->op, "invokecc")) {
            if (check_invoke_type(interpreter, unit, bb->start) ==
                    INVOKE_SUB_LOOP)
                bb_add_edge(unit, bb, unit->bb_list[0]);
        }
        if (!strcmp(bb->end->op, "ret")) {
            Instruction * sub;
            IMCC_debug(interpreter, DEBUG_CFG, "found ret in bb %d\n", i);
            /* now go back, find labels and connect these with
             * bsrs
             */
            /* this doesn't work, if this is a local backward sub call
             * the bsr isn't chained yet so the pred_list is empty
             *
             * s. #25948
             */
            if (!bb->pred_list) {
                for (j = i; j < unit->n_basic_blocks; j++) {
                    Basic_block * b_bsr = unit->bb_list[j];
                    if (!strcmp(b_bsr->end->op, "bsr")) {
                        addr = get_branch_reg(b_bsr->end);
                        if (addr)
                            bb_findadd_edge(interpreter, unit, b_bsr, addr);
                    }
                }
            }
            /* end #25948 */

            for (pred = bb->pred_list; pred; pred = pred->next) {
                int found = 0;
                SymReg *r;
                if (!strcmp(pred->from->end->op, "bsr")) {

                    r = pred->from->end->r[0];

                    sub = pred->to->start;
                    if ((sub->type & ITLABEL) &&
                            (!strcmp(sub->r[0]->name, r->name)))
                        found = 1;
invok:
                    j = pred->from->index;
                    if (found) {
                        int saves = 0;
                        IMCC_debug(interpreter, DEBUG_CFG,
                                "\tcalled from bb %d '%I'\n",
                                j, pred->from->end);
                        for (; sub && sub != bb->end; sub = sub->next) {
                            if (!strcmp(sub->op, "saveall"))
                                if (!(sub->type & ITSAVES)) {
                                    break;
                                }
                            unit->bb_list[sub->bbindex]->
                                flag |= BB_IS_SUB;
                            if (!strcmp(sub->op, "restoreall")) {
                                sub->type |= ITSAVES;
                                saves = 1;
                            }
                        }
                        if (!saves)
                            bb_add_edge(unit, bb,
                                    unit->bb_list[j+1]);
                        IMCC_debug(interpreter, DEBUG_CFG, "\tand does saveall %s\n",
                                saves ? "yes" : "no");
                    }
                }
                else if (!strcmp(pred->from->end->op, "invoke")) {
                    found = 1;
                    sub = pred->to->start;
                    goto invok;
                }
                if (!found)
                    IMCC_debug(interpreter, DEBUG_CFG, "\tcalled from unknown!\n");
            }
        }

        last = bb;
    }
}


/* find the placement of the label, and link the two nodes */

static void
bb_findadd_edge(Parrot_Interp interpreter, IMC_Unit * unit, Basic_block *from, SymReg *label)
{
    Instruction *ins;
    SymReg *r = find_sym(interpreter, label->name);

    if (r && (r->type & VTADDRESS) && r->first_ins)
        bb_add_edge(unit, from,
                unit->bb_list[r->first_ins->bbindex]);
    else {
        IMCC_debug(interpreter, DEBUG_CFG, "register branch %I ",
                from->end);
        /* XXX is probably only ok, if the invoke is "near" the
         *     set_addr ins
         */
        for (ins = from->end; ins; ins = ins->prev) {
            if ((ins->type & ITBRANCH) && !strcmp(ins->op, "set_addr") &&
                    ins->r[1]->first_ins) {
                bb_add_edge(unit, from, unit->
                                bb_list[ins->r[1]->first_ins->bbindex]);
                IMCC_debug(interpreter, DEBUG_CFG, "(%s) ", ins->r[1]->name);
                break;
            }
        }
        IMCC_debug(interpreter, DEBUG_CFG, "\n");
    }
}


int
blocks_are_connected(Basic_block *from, Basic_block *to)
{
    Edge *pred;
    for (pred = to->pred_list; pred != NULL; pred=pred->pred_next) {
	if (pred->from == from)
	    return 1; /*already linked*/
    }
    return 0;
}


static void
bb_add_edge(IMC_Unit * unit, Basic_block *from, Basic_block *to)
{
    Edge *e;
    if (blocks_are_connected(from, to))
	return;

    /* we assume that the data is correct, and thus if the edge is not
       on the predecessors of 'from', it won't be on the successors
       of 'to'. */

    e = mem_sys_allocate(sizeof(Edge));

    e->succ_next = from->succ_list;
    e->from = from;

    e->pred_next = to->pred_list;
    e->to = to;

    from->succ_list = to->pred_list = e;

    /* memory housekeeping */
    e->next = 0;
    if (unit->edge_list == 0)
	unit->edge_list = e;
    else {
	e->next = unit->edge_list;
	unit->edge_list = e;
    }
}

static void
free_edge(IMC_Unit * unit)
{
    Edge *e, *next;
    for (e = unit->edge_list; e; ) {
	next = e->next;
	free(e);
	e = next;
    }
    unit->edge_list = 0;
}

int
edge_count(IMC_Unit * unit)
{
    Edge *e;
    int i;
    for (i=0, e = unit->edge_list; e; e = e->next, i++)
        {}
    return i;
}

static void
add_instruct_reads(Interp *interp, Instruction *ins, SymReg *r0)
{
    int i;
    for (i = 0; i < IMCC_MAX_REGS && ins->r[i]; i++)
        if (r0 == ins->r[i])
            return;
    if (i == IMCC_MAX_REGS) {
        IMCC_fatal(interp, 1,
                "add_instruct_reads: out of registers with %s\n", r0->name);
    }
    /* append reg */
    ins->r[i] = r0;
    /* this gets read */
    ins->flags |= (1<<i);
}

static void
add_instruct_writes(Interp *interp, Instruction *ins, SymReg *r0)
{
    int i;
    for (i = 0; i < IMCC_MAX_REGS && ins->r[i]; i++)
        if (r0 == ins->r[i])
            return;
    if (i == IMCC_MAX_REGS) {
        IMCC_fatal(interp, 1,
        "add_instruct_writes: out of registers with %s\n", r0->name);
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

static void
propagate_alias(Parrot_Interp interpreter)
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
		for (ins = ins->next ; ins; ins = ins->next)
		    if (instruction_writes(ins, r0))
			break;
		    else if (instruction_reads(ins, r0) &&
			   !instruction_reads(ins, r1)) {
			add_instruct_reads(interpreter, ins, r1);
                        any = 1;
		    }
		    else if (instruction_reads(ins, r1) &&
			   !instruction_reads(ins, r0)) {
			add_instruct_reads(interpreter, ins, r0);
                        any = 1;
		    }
		ins = curr;
	    }
	}
    }
    if (any && (interpreter->imc_info->debug & DEBUG_CFG)) {
	IMCC_debug(interpreter, DEBUG_CFG, "\nAfter propagate_alias\n");
	dump_instructions(interpreter, unit);
    }
}
#endif

void
life_analysis(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int i;
    SymReg** reglist = unit->reglist;

    IMCC_info(interpreter, 2, "life_analysis\n");
#ifdef ALIAS
    propagate_alias(interpreter);
#endif
    for (i = 0; i < unit->n_symbols; i++)
        analyse_life_symbol(interpreter, unit, reglist[i]);
}

static void
analyse_life_symbol(Parrot_Interp interpreter, IMC_Unit * unit, SymReg* r)
{
    int i;

#if IMC_TRACE_HIGH
    fprintf(stderr, "cfg.c: analyse_life_symbol(%s)\n", r->name);
#endif

    if (r->life_info)
        free_life_info(unit, r);
    r->life_info = mem_sys_allocate_zeroed(unit->n_basic_blocks *
            sizeof(Life_range*));

    /* First we make a pass to each block to gather the information
     * that can be obtained locally */

    for (i=0; i < unit->n_basic_blocks; i++) {
	analyse_life_block(interpreter, unit->bb_list[i], r);
    }

    /* Now we need to consider the relations between blocks */

    for (i=0; i < unit->n_basic_blocks; i++) {
	if (r->life_info[i]->flags & LF_use) {
            Instruction *ins;

            ins = unit->bb_list[i]->start;

            /*
             * if the previous instruction (the last of the previous block)
             * was a sub call, and the symbol is live/use here, it needs
             * allocation in the non-volatile register range
             */
            if (ins->prev && (ins->prev->type & (ITPCCSUB|ITPCCYIELD)))
                r->usage |= U_NON_VOLATILE;

	    /* This block uses r, so it must be live at
	       the beggining */
	    r->life_info[i]->flags |= LF_lv_in;

	    /* propagate this info to every predecessor */
	    propagate_need (unit->bb_list[i], r, i);
	}
    }
}

void
free_life_info(IMC_Unit * unit, SymReg *r)
{
    int i;
#if IMC_TRACE_HIGH
    fprintf(stderr, "free_life_into(%s)\n", r->name);
#endif
    if (r->life_info) {
        for (i=0; i < unit->n_basic_blocks; i++) {
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

static void
analyse_life_block(Parrot_Interp interpreter, Basic_block* bb, SymReg* r)
{
    Instruction* ins, *special;
    Life_range* l;
    int is_alias;

    UNUSED(interpreter);
    l = make_life_range(r, bb->index);

    special = NULL;
    for (ins = bb->start; ins ; ins = ins->next) {
        if (ins==NULL) {
            IMCC_fatal(interpreter, 1,"analyse_life_block: "
                    "Index %i of %i has NULL instruction\n",
                    ins->index, bb->end->index);
        }
        if (ins->opnum == -1) {
            if (ins == bb->end)
                break;
            continue;
        }
        /*
         * if we have a setp_ind opcode, it may write all PMC
         * registers from 5..15
         */
        if (ins->opnum == PARROT_OP_setp_ind_i_p && r->set == 'P') {
            r->usage |= U_NON_VOLATILE;
        }

        /* restoreall and such */
        if (ins_writes2(ins, r->set))
            special = ins;

        /*
         * set p,p is basically a read - both are LF_use
         *
         * TODO live range coalescing
         */
        is_alias = (ins->type & ITALIAS) && ins->r[0] == r;

        if (instruction_reads(ins, r) || is_alias) {
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

        if (!is_alias && instruction_writes(ins, r)) {

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
propagate_need(Basic_block *bb, SymReg* r, int i)
{
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
compute_dominators (Parrot_Interp interpreter, IMC_Unit * unit)
{
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

    n = unit->n_basic_blocks;
    IMCC_info(interpreter, 2, "compute_dominators\n");
    dominators = unit->dominators = malloc(sizeof(Set*) * n);


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

    while (cur < len) {
        for (edge = unit->bb_list[q[cur]]->succ_list;
                edge; edge = edge->succ_next) {
            succ_index = edge->to->index;
            set_intersec_inplace(dominators[succ_index], dominators[q[cur]]);
            set_add(dominators[succ_index],succ_index);

            if (!set_contains(visited, succ_index)) {
                set_add(visited, succ_index);
                q[len++] = succ_index;
            }
        }
        cur++;
    }
#else
    change = 1;
    while (change) {
        change = 0;

        /* TODO: This 'for' should be a breadth-first search for speed */
        for (i = 1; i < n; i++) {
            Set *s = set_copy (dominators[i]);

            for (edge=unit->bb_list[i]->pred_list;
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
    if (interpreter->imc_info->debug & DEBUG_CFG)
        dump_dominators(unit);
#if USE_BFS
    free(q);
    set_free(visited);
#endif
}

static void
free_dominators(IMC_Unit * unit)
{
    int i;

    if (!unit->dominators)
        return;
    for (i=0; i < unit->n_basic_blocks; i++) {
        set_free (unit->dominators[i]);
    }
    free(unit->dominators);
    unit->dominators = 0;
}


static void
sort_loops(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int i, j, changed;
    Loop_info *li;
    int n_loops = unit->n_loops;
    Loop_info ** loop_info = unit->loop_info;

    for (i = 0; i < n_loops; i++) {
        loop_info[i]->size = 0;
        for (j = 0; j < unit->n_basic_blocks; j++)
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
        for (j = 0; j < unit->n_basic_blocks; j++)
            if (set_contains(loop_info[i+1]->loop, j)) {
                if (first < 0)
                    first = j;
                last = j;
            }
        for (j = i + 1; j < n_loops; j++) {
            if (set_contains(loop_info[i]->loop, first) &&
                    !set_contains(loop_info[i]->loop, last)) {
                IMCC_debug(interpreter, DEBUG_CFG, "sort_loops",
                        "loop %d contains first but not"
                        "last of outer loop %d\n", j, i);
            }
            if (set_contains(loop_info[i]->loop, last) &&
                    !set_contains(loop_info[i]->loop, first)) {
                IMCC_debug(interpreter, DEBUG_CFG, "sort_loops",
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
find_loops (Parrot_Interp interpreter, IMC_Unit * unit)
{
    int i, succ_index;
    Set* dom;
    Edge* edge;

    IMCC_info(interpreter, 2, "find_loops\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
	dom = unit->dominators[i];

	for (edge=unit->bb_list[i]->succ_list;
                edge != NULL; edge=edge->succ_next) {
	    succ_index = edge->to->index;

	    if (set_contains(dom, succ_index) ) {
		mark_loop(interpreter, unit, edge);
	    }
        }
    }

    sort_loops(interpreter, unit);
    if (interpreter->imc_info->debug & DEBUG_CFG)
        dump_loops(unit);
}

/* Incresases the loop_depth of all the nodes in a loop */

static void
mark_loop (Parrot_Interp interpreter, IMC_Unit * unit, Edge* e)
{
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

    IMCC_debug(interpreter, DEBUG_CFG, "loop from %d to %d, entered from %d\n",
            footer->index, header->index, enter ? enter->index : -1 );
    if (i != 1) {
        if (i==0) {
            if (header->index)
                IMCC_debug(interpreter, DEBUG_CFG,"\tdead code\n");
            else
                IMCC_debug(interpreter, DEBUG_CFG, "\tsub start\n");
        }
        else
            IMCC_debug(interpreter, DEBUG_CFG,
                    "\tcan't determine loop entry block (%d found)\n" ,i);
    }

    loop = set_make(unit->n_basic_blocks);
    set_add(loop, footer->index);
    set_add(loop, header->index);

    footer->loop_depth++;

    if (header != footer) {
        header->loop_depth++;
        search_predecessors_not_in (footer, loop);
    }

    /* now 'loop' contains the set of nodes inside the loop.
    */
    n_loops = unit->n_loops;
    loop_info = unit->loop_info;
    if (!loop_info)
        loop_info = unit->loop_info = mem_sys_allocate(
                (n_loops+1)*sizeof(Loop_info *));
    else
        loop_info = unit->loop_info = mem_sys_realloc(loop_info,
                (n_loops+1)*sizeof(Loop_info *));
    loop_info[n_loops] = mem_sys_allocate(sizeof(Loop_info));
    loop_info[n_loops]->loop = loop;
    loop_info[n_loops]->depth = footer->loop_depth;
    loop_info[n_loops]->n_entries = i;
    loop_info[n_loops]->entry = enter ? enter->index : -1;
    unit->n_loops++;
}

static void
free_loops(IMC_Unit * unit)
{
    int i;
    for (i = 0; i < unit->n_loops; i++) {
        set_free(unit->loop_info[i]->loop);
        free(unit->loop_info[i]);
    }
    if (unit->loop_info)
        free(unit->loop_info);
    unit->n_loops = 0;
    unit->loop_info = 0;
}

void
search_predecessors_not_in(Basic_block *node, Set* s)
{
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
init_basic_blocks(IMC_Unit * unit)
{
    if (unit->bb_list != NULL)
        clear_basic_blocks(unit);
    unit->bb_list =
        calloc(unit->bb_list_size = 256,
            sizeof(Basic_block*) );
    unit->n_basic_blocks = 0;
    unit->edge_list = 0;
}

void
clear_basic_blocks(IMC_Unit * unit)
{
    int i;
    if (unit->bb_list) {
        for (i=0; i < unit->n_basic_blocks; i++)
            free(unit->bb_list[i]);
        free(unit->bb_list);
        unit->bb_list = NULL;
    }
    free_edge(unit);
    free_dominators(unit);
    free_loops(unit);
}

static Basic_block*
make_basic_block(Interp *interpreter, IMC_Unit * unit, Instruction* ins)
{
    Basic_block *bb;
    int n;

    if (ins == NULL) {
        PANIC("make_basic_block: called with NULL argument\n");
    }

    bb = mem_sys_allocate(sizeof(Basic_block));

    bb->start = ins;
    bb->end = ins;

    bb->pred_list = NULL;
    bb->succ_list = NULL;
    n = unit->n_basic_blocks;
    ins->bbindex = bb->index = n;
    bb->loop_depth = 0;
    if (n == unit->bb_list_size) {
        unit->bb_list_size *= 2;
        unit->bb_list =
            mem_sys_realloc(unit->bb_list,
                unit->bb_list_size*sizeof(Basic_block*) );
    }
    unit->bb_list[n] = bb;
    unit->n_basic_blocks++;

    return bb;
}

Life_range *
make_life_range(SymReg *r, int idx)
{
   Life_range *l;

   l = mem_sys_allocate_zeroed(sizeof(Life_range));
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
