/*
 * $Id$
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

/*
 * cfg.c
 *
 * A basic block is the longest sequence of instructions that we are
 * sure will be executed sequentially: no branches, no labels.
 *
 * The control-flow graph is a directed graph that reflects the
 * flow of execution between blocks.
 */


#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "optimizer.h"

/* HEADERIZER HFILE: compilers/imcc/cfg.h */

/* HEADERIZER BEGIN: static */

static void analyse_life_block( NOTNULL(Basic_block* bb), NOTNULL(SymReg* r) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void analyse_life_symbol(
    NOTNULL(const struct _IMC_Unit *unit),
    NOTNULL(SymReg* r) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void bb_add_edge(
    NOTNULL(IMC_Unit *unit),
    NOTNULL(Basic_block *from),
    NOTNULL(Basic_block *to) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void bb_check_set_addr( PARROT_INTERP,
    NOTNULL(IMC_Unit * unit),
    NOTNULL(Basic_block *bb),
    NOTNULL(SymReg *label) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void bb_findadd_edge( PARROT_INTERP,
    NOTNULL(IMC_Unit * unit),
    NOTNULL(Basic_block *from),
    NOTNULL(SymReg *label) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void bb_remove_edge( NOTNULL(IMC_Unit *unit), NOTNULL(Edge *edge) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static int check_invoke_type( PARROT_INTERP,
    NOTNULL(const IMC_Unit * unit),
    NOTNULL(const Instruction *ins) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void free_dominance_frontiers( NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1);

static void free_dominators( NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1);

static void free_edge( NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1);

static void free_loops( NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1);

static void init_basic_blocks( NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Basic_block* make_basic_block( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(Instruction* ins) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void mark_loop( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(const Edge *e) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void propagate_need(
    NOTNULL(Basic_block *bb),
    NOTNULL(SymReg* r),
    int i )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void sort_loops( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */

/* Code: */

#define INVOKE_SUB_CALL 1
#define INVOKE_SUB_RET  2
#define INVOKE_SUB_LOOP 3
#define INVOKE_SUB_OTHER 4

PARROT_WARN_UNUSED_RESULT
static int
check_invoke_type(PARROT_INTERP, NOTNULL(const IMC_Unit * unit), NOTNULL(const Instruction *ins))
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
    if (unit->instructions->r[0] && unit->instructions->r[0]->pcc_sub)
        return INVOKE_SUB_LOOP;
    /* 3) invoke P1 returns */
    if (ins->opsize == 2)
        return INVOKE_SUB_RET;
    /* 4) other usage */

    IMCC_INFO(interp)->dont_optimize = 1;  /* too complex to follow */
    IMCC_INFO(interp)->optimizer_level &= ~OPT_PASM;
    return INVOKE_SUB_OTHER;
}

void
find_basic_blocks(PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit), int first)
{
    Basic_block *bb;
    Instruction *ins;
    const SymHash * const hsh = &unit->hash;
    int nu = 0;
    int i;

    IMCC_info(interp, 2, "find_basic_blocks\n");
    init_basic_blocks(unit);

    for (i = 0; i < hsh->size; i++) {
        SymReg *r;
        for (r = hsh->data[i]; r; r = r->next) {
            if (r && (r->type & VTADDRESS)) {
                r->last_ins = NULL;
            }
        }
    }

    /* XXX FIXME: Now the way to check for a sub is unit->type */
    ins = unit->instructions;
    if (first && ins->type == ITLABEL && (ins->r[0]->type & VT_PCC_SUB)) {
        IMCC_debug(interp, DEBUG_CFG, "pcc_sub %s nparams %d\n",
                ins->r[0]->name, ins->r[0]->pcc_sub->nargs);
        expand_pcc_sub(interp, unit, ins);
    }
    ins->index = i = 0;

    bb = make_basic_block(interp, unit, ins);
    if (ins->type & ITBRANCH) {
        SymReg * const addr = get_branch_reg(bb->end);
        if (addr)
            addr->last_ins = ins;
    }
    for (ins = ins->next; ins; ins = ins->next) {
        ins->index = ++i;

        bb->end = ins;
        ins->bbindex = unit->n_basic_blocks - 1;

        if (ins->opnum == -1 && (ins->type & ITPCCSUB)) {
            if (first) {
                /* XXX FIXME: Now the way to check for a sub is unit->type */
                if (ins->type & ITLABEL) {
                    expand_pcc_sub_ret(interp, unit, ins);
                    ins->type &= ~ITLABEL;
                }
                else {
                    /* if this is a sub call expand it */
                    expand_pcc_sub_call(interp, unit, ins);
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
            bb = make_basic_block(interp, unit, ins);
        }
        /* a branch is the end of a basic block
         * so start a new one with the next instruction */
        if (ins->type & ITBRANCH) {
            SymReg * const addr = get_branch_reg(bb->end);

            if (addr)
                addr->last_ins = ins;
            /*
             * ignore set_addr - no new basic block
             */
            if (strcmp(ins->op, "set_addr") == 0)
                continue;
            if (ins->next)
                bb = make_basic_block(interp, unit, ins->next);
            nu = 1;
        }
    }

    if (IMCC_INFO(interp)->debug & DEBUG_CFG) {
        dump_instructions(interp, unit);
        dump_labels(unit);
    }
}

static void
bb_check_set_addr(PARROT_INTERP, NOTNULL(IMC_Unit * unit),
        NOTNULL(Basic_block *bb), NOTNULL(SymReg *label))
{
    const Instruction *ins;

    for (ins = unit->instructions; ins; ins = ins->next) {
        if ((ins->opnum == PARROT_OP_set_addr_p_ic) &&
                (strcmp(label->name, ins->r[1]->name) == 0)) {
            IMCC_debug(interp, DEBUG_CFG, "set_addr %s\n",
                    ins->r[1]->name);

            /*
             * connect this block with first and last block
             */
            bb_add_edge(unit, unit->bb_list[0], bb);
            bb_add_edge(unit, unit->bb_list[unit->n_basic_blocks - 1], bb);
            /* and mark the instruction as being kind of a branch */
            bb->start->type |= ITADDR;
            break;
        }
    }
}

/* Once the basic blocks have been computed, build_cfg computes
   the dependencies between them. */
void
build_cfg(PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit))
{
    int i, changes;
    SymReg * addr;
    Basic_block *last = NULL, *bb;
    Edge *pred;

    IMCC_info(interp, 2, "build_cfg\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        bb = unit->bb_list[i];

        /* if the block can fall-through */
        if (i > 0 && ! (last->end->type & IF_goto))
            bb_add_edge(unit, last, bb);
        /* check first ins, if label try to find a set_addr op */
        if (bb->start->type & ITLABEL) {
            bb_check_set_addr(interp, unit, bb, bb->start->r[0]);
        }
        /* look if last instruction is a branch */
        addr = get_branch_reg(bb->end);
        if (addr)
            bb_findadd_edge(interp, unit, bb, addr);
        else if ((strcmp(bb->start->op, "invoke") == 0) ||
                (strcmp(bb->start->op, "invokecc") == 0)) {
            if (check_invoke_type(interp, unit, bb->start) ==
                    INVOKE_SUB_LOOP)
                bb_add_edge(unit, bb, unit->bb_list[0]);
        }
        if (strcmp(bb->end->op, "ret") == 0) {
            Instruction * sub;
            IMCC_debug(interp, DEBUG_CFG, "found ret in bb %d\n", i);
            /* now go back, find labels and connect these with
             * bsrs
             */
            /* this doesn't work, if this is a local backward sub call
             * the bsr isn't chained yet so the pred_list is empty
             *
             * s. #25948
             */
            if (!bb->pred_list) {
                int j;

                for (j = i; j < unit->n_basic_blocks; j++) {
                    Basic_block * const b_bsr = unit->bb_list[j];

                    if (strcmp(b_bsr->end->op, "bsr") == 0) {
                        addr = get_branch_reg(b_bsr->end);
                        if (addr)
                            bb_findadd_edge(interp, unit, b_bsr, addr);
                    }
                }
            }
            /* end #25948 */

            for (pred = bb->pred_list; pred; pred = pred->next) {
                int found = 0;
                if (strcmp(pred->from->end->op, "bsr") == 0) {
                    SymReg * const r = pred->from->end->r[0];
                    int j;

                    sub = pred->to->start;
                    if ((sub->type & ITLABEL) &&
                            (strcmp(sub->r[0]->name, r->name) == 0))
                        found = 1;
invok:
                    j = pred->from->index;
                    if (found) {
                        int saves = 0;
                        IMCC_debug(interp, DEBUG_CFG,
                                "\tcalled from bb %d '%I'\n",
                                j, pred->from->end);
                        for (; sub && sub != bb->end; sub = sub->next) {
                            if (strcmp(sub->op, "saveall") == 0)
                                if (!(sub->type & ITSAVES))
                                    break;
                            unit->bb_list[sub->bbindex]->flag |= BB_IS_SUB;
                            if (strcmp(sub->op, "restoreall") == 0) {
                                sub->type |= ITSAVES;
                                saves = 1;
                            }
                        }
                        if (!saves)
                            bb_add_edge(unit, bb,
                                    unit->bb_list[j+1]);
                        IMCC_debug(interp, DEBUG_CFG,
                                   "\tand does saveall %s\n",
                                   saves ? "yes" : "no");
                    }
                }
                else if (strcmp(pred->from->end->op, "invoke") == 0) {
                    found = 1;
                    sub = pred->to->start;
                    goto invok;
                }
                if (!found)
                    IMCC_debug(interp, DEBUG_CFG,
                               "\tcalled from unknown!\n");
            }
        }

        last = bb;
    }

    /* Decouple unreachable blocks (not the first block, with no
     * predecessors) from the CFG
     */
    do {
        changes = 0;
        for (i = 1; i < unit->n_basic_blocks; i++) {
            bb = unit->bb_list[i];
            if (!bb->pred_list) {
                /* Remove all successor edges of block bb */
                while (bb->succ_list) {
                    bb_remove_edge(unit, bb->succ_list);
                    IMCC_debug(interp, DEBUG_CFG,
                            "remove edge from bb: %d\n", bb->index);
                    changes = 1;
                }
            }
        }
    } while (changes);

    if (IMCC_INFO(interp)->debug & DEBUG_CFG)
        dump_cfg(unit);
}


/* find the placement of the label, and link the two nodes */

static void
bb_findadd_edge(PARROT_INTERP, NOTNULL(IMC_Unit * unit),
        NOTNULL(Basic_block *from), NOTNULL(SymReg *label))
{
    Instruction *ins;
    const SymReg * const r = find_sym(interp, label->name);

    if (r && (r->type & VTADDRESS) && r->first_ins)
        bb_add_edge(unit, from,
                unit->bb_list[r->first_ins->bbindex]);
    else {
        IMCC_debug(interp, DEBUG_CFG, "register branch %I ",
                from->end);
        /* XXX is probably only ok, if the invoke is "near" the
         *     set_addr ins
         */
        for (ins = from->end; ins; ins = ins->prev) {
            if ((ins->type & ITBRANCH) && (strcmp(ins->op, "set_addr") == 0) &&
                    ins->r[1]->first_ins) {
                bb_add_edge(unit, from, unit->
                                bb_list[ins->r[1]->first_ins->bbindex]);
                IMCC_debug(interp, DEBUG_CFG, "(%s) ", ins->r[1]->name);
                break;
            }
        }
        IMCC_debug(interp, DEBUG_CFG, "\n");
    }
}


PARROT_WARN_UNUSED_RESULT
int
blocks_are_connected(NOTNULL(const Basic_block *from), NOTNULL(const Basic_block *to))
{
    const Edge *pred = to->pred_list;

    while (pred) {
        if (pred->from == from)
            return 1; /*already linked*/
        pred = pred->pred_next;
    }
    return 0;
}


static void
bb_add_edge(NOTNULL(IMC_Unit *unit), NOTNULL(Basic_block *from), NOTNULL(Basic_block *to))
{
    Edge *e;
    if (blocks_are_connected(from, to))
        return;

    /* we assume that the data is correct, and thus if the edge is not
       on the predecessors of 'from', it won't be on the successors
       of 'to'. */

    e             = mem_allocate_typed(Edge);

    e->succ_next  = from->succ_list;
    e->from       = from;

    e->pred_next  = to->pred_list;
    e->to         = to;

    to->pred_list = from->succ_list = e;

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
bb_remove_edge(NOTNULL(IMC_Unit *unit), NOTNULL(Edge *edge))
{
    if (edge->from->succ_list == edge) {
        edge->from->succ_list = edge->succ_next;
    }
    else {
        Edge *prev;

        for (prev = edge->from->succ_list; prev; prev = prev->succ_next) {
            if (prev->succ_next == edge) {
                prev->succ_next = edge->succ_next;
            }
        }
    }

    if (edge->to->pred_list == edge) {
        edge->to->pred_list = edge->pred_next;
    }
    else {
        Edge *prev;

        for (prev = edge->to->pred_list; prev; prev = prev->pred_next) {
            if (prev->pred_next == edge) {
                prev->pred_next = edge->pred_next;
            }
        }
    }

    if (unit->edge_list == edge) {
        unit->edge_list = edge->next;
        free(edge);
    }
    else {
        Edge *prev;
        for (prev = unit->edge_list; prev; prev = prev->next) {
            if (prev->next == edge) {
                prev->next = edge->next;
                free(edge);
                break;
            }
        }
    }
}

static void
free_edge(NOTNULL(IMC_Unit *unit))
{
    Edge *e;

    for (e = unit->edge_list; e;) {
        Edge * const next = e->next;
        free(e);
        e = next;
    }
    unit->edge_list = 0;
}

PARROT_WARN_UNUSED_RESULT
int
edge_count(NOTNULL(const struct _IMC_Unit *unit))
{
    Edge *e = unit->edge_list;
    int i = 0;

    while (e) {
        i++;
        e = e->next++;
    }
    return i;
}

void
life_analysis(PARROT_INTERP, NOTNULL(const struct _IMC_Unit *unit))
{
    int i;
    SymReg** const reglist = unit->reglist;

    IMCC_info(interp, 2, "life_analysis\n");
    for (i = 0; i < unit->n_symbols; i++)
        analyse_life_symbol(unit, reglist[i]);
}

static void
analyse_life_symbol(NOTNULL(const struct _IMC_Unit *unit),
        NOTNULL(SymReg* r))
{
    int i;

#if IMC_TRACE_HIGH
    fprintf(stderr, "cfg.c: analyse_life_symbol(%s)\n", r->name);
#endif

    if (r->life_info)
        free_life_info(unit, r);
    r->life_info = (Life_range **)mem_sys_allocate_zeroed(unit->n_basic_blocks *
            sizeof (Life_range *));

    /* First we make a pass to each block to gather the information
     * that can be obtained locally */

    for (i=0; i < unit->n_basic_blocks; i++) {
        analyse_life_block(unit->bb_list[i], r);
    }

    /* Now we need to consider the relations between blocks */

    for (i=0; i < unit->n_basic_blocks; i++) {
        if (r->life_info[i]->flags & LF_use) {
            const Instruction * const ins = unit->bb_list[i]->start;

            /*
             * if the previous instruction (the last of the previous block)
             * was a sub call, and the symbol is live/use here, it needs
             * allocation in the non-volatile register range
             */
            if (ins->prev) {
                const Instruction * const prev = ins->prev;

                if ((prev->type & (ITPCCSUB|ITPCCYIELD)) &&
                        prev->opnum != PARROT_OP_tailcall_p)
                    r->usage |= U_NON_VOLATILE;
                else if (prev->opnum == PARROT_OP_invoke_p_p ||
                         prev->opnum == PARROT_OP_invokecc_p)
                    r->usage |= U_NON_VOLATILE;
                else if (ins->type & ITADDR)
                    r->usage |= U_NON_VOLATILE;
            }

            /* This block uses r, so it must be live at
               the beginning */
            r->life_info[i]->flags |= LF_lv_in;

            /* propagate this info to every predecessor */
            propagate_need(unit->bb_list[i], r, i);
        }
    }
}

void
free_life_info(NOTNULL(const struct _IMC_Unit *unit), NOTNULL(SymReg *r))
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
analyse_life_block(NOTNULL(Basic_block* bb), NOTNULL(SymReg* r))
{
    Life_range* const l = make_life_range(r, bb->index);

    Instruction *special = NULL;
    Instruction *ins;

    for (ins = bb->start; ins ; ins = ins->next) {
        int is_alias;
        /*
         * if we have a setp_ind opcode, it may write all PMC
         * registers
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
            if (! (l->flags & LF_def)) {
                if (special) {
                    l->first_ins = special;
                    l->flags |= LF_def;
                    special = NULL;
                }
                else {
                    /* we read before having written before, so the var was
                     * live at the beginning of the block */
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

    /* l->last can later be extended if it turns out
     * that another block needs the value resulting from this
     * computation */

}


static void
propagate_need(NOTNULL(Basic_block *bb), NOTNULL(SymReg* r), int i)
{
    Edge *edge;
    Basic_block *pred;
    Life_range *l;

    l = r->life_info[bb->index]; /* XXX Will never get used */
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

            if (! (l->flags & LF_def)) {
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
                    IMCC_warning("propagate_need",
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
 * Basic block A dominates B, if each path to B passes through A
 *
 * s. gcc:flow.c compute_dominators
 */

void
compute_dominators(PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit))
{
#define USE_BFS 0

#if !USE_BFS
    int i, change, pred_index;
#else
    int i, cur, len, succ_index;
    int *q;
    Set *visited;
#endif
    int b, runner, wrong;
    Set** dominators;

    const int n = unit->n_basic_blocks;
    IMCC_info(interp, 2, "compute_dominators\n");

    dominators  = unit->dominators = (Set **)malloc(sizeof (Set*) * n);
    unit->idoms = (int *)malloc(sizeof (int) * n);

    dominators[0] = set_make(n);
    set_add(dominators[0], 0);

    for (i = 1; i < n; i++) {
        if (unit->bb_list[i]->pred_list) {
            dominators[i] = set_make_full(n);
        }
        else {
            dominators[i] = set_make(n);
            set_add(dominators[i], i);
        }
    }

#if USE_BFS
    q       = calloc(n, sizeof (int));
    visited = set_make(n);
    set_add(visited, 0);
    len     = 1;
    cur     = 0;

    while (cur < len) {
        Edge *edge;
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
            Set  *s = set_copy(dominators[i]);
            Edge *edge;

            for (edge = unit->bb_list[i]->pred_list;
                edge;
                edge = edge->pred_next) {
                pred_index = edge->from->index;
                set_intersec_inplace(s, dominators[pred_index]);
            }

            set_add(s, i);

            if (! set_equal(dominators[i], s)) {
                change = 1;
                set_free(dominators[i]);
                dominators[i] = s;
            }
            else
                set_free(s);
        }
    }
#endif

    /* calc idoms */
    unit->idoms[0] = unit->bb_list[0]->index;

    for (b = 1; b < n; b++) {
        unit->idoms[b] = 0;
        for (i = n - 1; i > 0; i--) {
            if (i != b && set_contains(dominators[b], i)) {
                wrong = 0;
                for (runner = 0; runner < n; runner++) {
                    if (runner != b && runner != i &&
                        set_contains(dominators[b], runner))
                    {
                        if (set_contains(dominators[runner], i)) {
                            wrong = 1;
                            break;
                        }
                    }
                }

                if (!wrong) {
                    unit->idoms[b] = unit->bb_list[i]->index;
                    break;
                }

            }
       }
   }

    if (IMCC_INFO(interp)->debug & DEBUG_CFG)
        dump_dominators(unit);
#if USE_BFS
    free(q);
    set_free(visited);
#endif
}

/* Algorithm to find dominance frontiers described in paper
 * "A Simple, Fast Dominance Algorithm", Cooper et al. (2001)
 */
void
compute_dominance_frontiers(PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit))
{
    int i, b;

    const int n = unit->n_basic_blocks;
    Set ** const dominance_frontiers = unit->dominance_frontiers =
        (Set **)malloc(sizeof (Set *) * n);

    IMCC_info(interp, 2, "compute_dominance_frontiers\n");

    dominance_frontiers[0] = set_make(n);
    for (i = 1; i < n; i++) {
        dominance_frontiers[i] = set_make(n);
    }

    /* for all nodes, b */
    for (b = 1; b < n; b++) {
        Edge *edge = unit->bb_list[b]->pred_list;
        /* if the number of predecessors of b >= 2 */
        if (edge && edge->pred_next) {
            /* for all predecessors, p, of b */
            for (; edge; edge = edge->pred_next) {
                /* runner = p */
                int runner = edge->from->index;
                /* while runner != idoms[b] */
                while (runner >= 0 && runner != unit->idoms[b]) {
                    /* add b to runner's dominance frontier set */
                    set_add(unit->dominance_frontiers[runner], b);
                    /* runner = idoms[runner] */
                    if (runner == 0)
                        runner = -1;
                    else
                        runner = unit->idoms[runner];
                }
            }
        }
    }

    if (IMCC_INFO(interp)->debug & DEBUG_CFG)
        dump_dominance_frontiers(unit);
}

static void
free_dominators(NOTNULL(IMC_Unit *unit))
{
    int i;

    if (!unit->dominators)
        return;
    for (i=0; i < unit->n_basic_blocks; i++) {
        set_free(unit->dominators[i]);
    }
    free(unit->dominators);
    unit->dominators = 0;
    free(unit->idoms);
}

static void
free_dominance_frontiers(NOTNULL(IMC_Unit *unit))
{
    int i;

    if (!unit->dominance_frontiers)
        return;
    for (i=0; i < unit->n_basic_blocks; i++) {
        set_free(unit->dominance_frontiers[i]);
    }
    free(unit->dominance_frontiers);
    unit->dominance_frontiers = 0;
}


static void
sort_loops(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
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
                IMCC_debug(interp, DEBUG_CFG, "sort_loops",
                        "loop %d contains first but not"
                        "last of outer loop %d\n", j, i);
            }
            if (set_contains(loop_info[i]->loop, last) &&
                    !set_contains(loop_info[i]->loop, first)) {
                IMCC_debug(interp, DEBUG_CFG, "sort_loops",
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
find_loops(PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit))
{
    int i;

    IMCC_info(interp, 2, "find_loops\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        const Set * const dom = unit->dominators[i];
        const Edge *edge;

        for (edge=unit->bb_list[i]->succ_list;
                edge != NULL; edge=edge->succ_next) {
            const int succ_index = edge->to->index;

            if (set_contains(dom, succ_index)) {
                mark_loop(interp, unit, edge);
            }
        }
    }

    sort_loops(interp, unit);
    if (IMCC_INFO(interp)->debug & DEBUG_CFG)
        dump_loops(unit);
}

/*
 * For loop_info, finds the natural preheader of the loop, if any, and returns
 * its index, otherwise returns -1.  A natural preheader exists if there is
 * only one predecessor to the loop header outside of the loop body, and if it
 * always transfers control directly to the header.
 */
PARROT_WARN_UNUSED_RESULT
int
natural_preheader(NOTNULL(const struct _IMC_Unit *unit), NOTNULL(const Loop_info* loop_info))
{
    int preheader = -1;
    Edge* edge;

    for (edge = unit->bb_list[loop_info->header]->pred_list;
         edge; edge = edge->pred_next) {
        if (!set_contains(loop_info->loop, edge->from->index)) {
            if (preheader == -1 &&
                unit->bb_list[edge->from->index]->succ_list->to->index
                == loop_info->header &&
                !unit->bb_list[edge->from->index]->succ_list->succ_next)
            {
                preheader = unit->bb_list[edge->from->index]->index;
                continue;
            }
            else {
                return -1;
            }
        }
    }
    return preheader;
}

/* Increases the loop_depth of all the nodes in a loop */

static void
mark_loop(PARROT_INTERP, NOTNULL(IMC_Unit *unit), NOTNULL(const Edge *e))
{
    Set* loop;
    Set* exits;
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

    IMCC_debug(interp, DEBUG_CFG, "loop from %d to %d, entered from %d\n",
            footer->index, header->index, enter ? enter->index : -1);
    if (i != 1) {
        if (i==0) {
            if (header->index)
                IMCC_debug(interp, DEBUG_CFG,"\tdead code\n");
            else
                IMCC_debug(interp, DEBUG_CFG, "\tsub start\n");
        }
        else
            IMCC_debug(interp, DEBUG_CFG,
                    "\tcan't determine loop entry block (%d found)\n" ,i);
    }

    loop = set_make(unit->n_basic_blocks);
    set_add(loop, footer->index);
    set_add(loop, header->index);

    footer->loop_depth++;

    if (header != footer) {
        header->loop_depth++;
        search_predecessors_not_in(footer, loop);
    }

    exits = set_make(unit->n_basic_blocks);
    for (i = 1; i < unit->n_basic_blocks; i++) {
        if (set_contains(loop, i)) {
            for (edge = unit->bb_list[i]->succ_list; edge;
                 edge = edge->succ_next)
            {
                if (!set_contains(loop, edge->to->index)) {
                    set_add(exits, i);
                }
            }
        }
    }

    /* now 'loop' contains the set of nodes inside the loop.  */
    n_loops  = unit->n_loops;
    loop_info = unit->loop_info;

    if (!loop_info)
        loop_info = unit->loop_info = (Loop_info **)mem_sys_allocate(
                (n_loops + 1) * sizeof (Loop_info *));
    else
        loop_info = unit->loop_info = (Loop_info **)mem_sys_realloc(loop_info,
                (n_loops + 1) * sizeof (Loop_info *));

    loop_info[n_loops]            = mem_allocate_typed(Loop_info);
    loop_info[n_loops]->loop      = loop;
    loop_info[n_loops]->exits     = exits;
    loop_info[n_loops]->depth     = footer->loop_depth;
    loop_info[n_loops]->n_entries = i;
    loop_info[n_loops]->header    = header->index;
    loop_info[n_loops]->preheader = natural_preheader(unit, loop_info[n_loops]);

    unit->n_loops++;
}

static void
free_loops(NOTNULL(IMC_Unit *unit))
{
    int i;
    for (i = 0; i < unit->n_loops; i++) {
        set_free(unit->loop_info[i]->loop);
        set_free(unit->loop_info[i]->exits);
        free(unit->loop_info[i]);
    }
    if (unit->loop_info)
        free(unit->loop_info);
    unit->n_loops = 0;
    unit->loop_info = 0;
}

void
search_predecessors_not_in(NOTNULL(const Basic_block *node), NOTNULL(Set* s))
{
   Edge *edge;

   for (edge = node->pred_list; edge != NULL; edge = edge->pred_next) {
        Basic_block * const pred = edge->from;

        if (! set_contains(s, pred->index)) {
           set_add(s, pred->index);
           pred->loop_depth++;
           search_predecessors_not_in(pred, s);
        }
   }

}

/*** Utility functions ***/

static void
init_basic_blocks(NOTNULL(IMC_Unit *unit))
{
    if (unit->bb_list != NULL)
        clear_basic_blocks(unit);

    unit->bb_list = (Basic_block **)calloc(unit->bb_list_size = 256,
            sizeof (Basic_block *));

    unit->n_basic_blocks = 0;
    unit->edge_list      = 0;
}

void
clear_basic_blocks(NOTNULL(struct _IMC_Unit *unit))
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
    free_dominance_frontiers(unit);
    free_loops(unit);
}

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Basic_block*
make_basic_block(PARROT_INTERP, NOTNULL(IMC_Unit *unit), NOTNULL(Instruction* ins))
{
    int n;
    Basic_block * const bb = mem_allocate_typed(Basic_block);

    if (ins == NULL) {
        PANIC(interp, "make_basic_block: called with NULL argument\n");
    }

    bb->start      = ins;
    bb->end        = ins;

    bb->pred_list  = NULL;
    bb->succ_list  = NULL;

    n              = unit->n_basic_blocks;
    ins->bbindex   = n;
    bb->index      = n;
    bb->loop_depth = 0;

    if (n == unit->bb_list_size) {
        unit->bb_list_size *= 2;
        unit->bb_list = (Basic_block **)mem_sys_realloc(unit->bb_list,
                unit->bb_list_size * sizeof (Basic_block *));
    }

    unit->bb_list[n] = bb;
    unit->n_basic_blocks++;

    return bb;
}

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Life_range *
make_life_range(NOTNULL(SymReg *r), int idx)
{
   Life_range * const l = mem_allocate_zeroed_typed(Life_range);
   r->life_info[idx]    = l;

   return l;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
