/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 * $Id$
 */

/*

=head1 NAME

compilers/imcc/cfg.c

=head1 DESCRIPTION

A basic block is the longest sequence of instructions that we are sure will be
executed sequentially: no branches, no labels.

The control-flow graph is a directed graph that reflects the flow of execution
between blocks.

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "optimizer.h"

/* HEADERIZER HFILE: compilers/imcc/cfg.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void bb_add_edge(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(Basic_block *from),
    ARGMOD(Basic_block *to))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*to);

static void bb_check_set_addr(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Basic_block *bb),
    ARGIN(const SymReg *label))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*bb);

static void bb_findadd_edge(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(Basic_block *from),
    ARGIN(const SymReg *label))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit);

static void bb_remove_edge(ARGMOD(IMC_Unit *unit), ARGMOD(Edge *edge))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*edge);

PARROT_WARN_UNUSED_RESULT
static int check_invoke_type(PARROT_INTERP,
    ARGIN(const IMC_Unit *unit),
    ARGIN(const Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void free_dominance_frontiers(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static void free_dominators(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static void free_edge(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static void free_loops(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static void init_basic_blocks(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Basic_block* make_basic_block(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins);

static void mark_loop(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const Edge *e))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit);

static void sort_loops(PARROT_INTERP, ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_bb_add_edge __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(from) \
    , PARROT_ASSERT_ARG(to))
#define ASSERT_ARGS_bb_check_set_addr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(bb) \
    , PARROT_ASSERT_ARG(label))
#define ASSERT_ARGS_bb_findadd_edge __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(from) \
    , PARROT_ASSERT_ARG(label))
#define ASSERT_ARGS_bb_remove_edge __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(edge))
#define ASSERT_ARGS_check_invoke_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_free_dominance_frontiers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_free_dominators __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_free_edge __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_free_loops __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_init_basic_blocks __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_make_basic_block __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_mark_loop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(e))
#define ASSERT_ARGS_sort_loops __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Code: */

#define INVOKE_SUB_CALL 1
#define INVOKE_SUB_RET  2
#define INVOKE_SUB_LOOP 3
#define INVOKE_SUB_OTHER 4

/*

=item C<static int check_invoke_type(PARROT_INTERP, const IMC_Unit *unit, const
Instruction *ins)>

Given an invoke-type instruction, returns the type of the invocation.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
check_invoke_type(PARROT_INTERP, ARGIN(const IMC_Unit    *unit),
                                 ARGIN(const Instruction *ins))
{
    ASSERT_ARGS(check_invoke_type)
    /* 1) pcc sub call or yield */
    if (ins->type & (ITPCCSUB | ITPCCYIELD))
        return INVOKE_SUB_CALL;

    /*
     * inside another pcc_sub
     * 2) invoke = loop to begin
     */
    if (unit->instructions->symregs[0]
    &&  unit->instructions->symregs[0]->pcc_sub)
        return INVOKE_SUB_LOOP;

    /* 3) invoke P1 returns */
    if (ins->opsize == 2)
        return INVOKE_SUB_RET;

    /* 4) other usage, too complex to follow */
    IMCC_INFO(interp)->dont_optimize    = 1;
    IMCC_INFO(interp)->optimizer_level &= ~OPT_PASM;

    return INVOKE_SUB_OTHER;
}


/*

=item C<void find_basic_blocks(PARROT_INTERP, IMC_Unit *unit, int first)>

Finds all basic blocks in the given IMC_Unit, expanding PCC calls if first is
true.

=cut

*/

void
find_basic_blocks(PARROT_INTERP, ARGMOD(IMC_Unit *unit), int first)
{
    ASSERT_ARGS(find_basic_blocks)
    Basic_block          *bb;
    Instruction          *ins;
    const SymHash * const hsh = &unit->hash;
    int                   nu  = 0;
    unsigned int          i;

    IMCC_info(interp, 2, "find_basic_blocks\n");
    init_basic_blocks(interp, unit);

    for (i = 0; i < hsh->size; i++) {
        SymReg *r;

        for (r = hsh->data[i]; r; r = r->next) {
            if (r->type & VTADDRESS)
                r->last_ins = NULL;
        }
    }

    ins = unit->instructions;

    if (unit->type & IMC_PCCSUB) {
        IMCC_debug(interp, DEBUG_CFG, "pcc_sub %s nparams %d\n",
                ins->symregs[0]->name, ins->symregs[0]->pcc_sub->nargs);
        expand_pcc_sub(interp, unit, ins);
    }

    ins->index = i = 0;

    bb         = make_basic_block(interp, unit, ins);

    if (ins->type & ITBRANCH) {
        SymReg * const addr = get_branch_reg(bb->end);
        if (addr)
            addr->last_ins = ins;
    }

    for (ins = ins->next; ins; ins = ins->next) {
        bb->end      = ins;
        ins->index   = ++i;
        ins->bbindex = unit->n_basic_blocks - 1;

        if (ins->opnum == -1 && (ins->type & ITPCCSUB)) {
            if (first) {
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
            ins->symregs[0]->first_ins = ins;
        }

        /* a LABEL starts a new basic block, but not, if we already have
         * a new one (last was a branch) */
        if (nu)
            nu = 0;
        else if (ins->type & ITLABEL) {
            bb->end = ins->prev;
            bb      = make_basic_block(interp, unit, ins);
        }

        /* a branch is the end of a basic block
         * so start a new one with the next instruction */
        if (ins->type & ITBRANCH) {
            SymReg * const addr = get_branch_reg(bb->end);

            if (addr)
                addr->last_ins = ins;

            /* ignore set_addr - no new basic block */
            if (STREQ(ins->opname, "set_addr"))
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


/*

=item C<static void bb_check_set_addr(PARROT_INTERP, IMC_Unit *unit, Basic_block
*bb, const SymReg *label)>

Looks for a C<set_addr> op in the current unit referring to the given label.

=cut

*/

static void
bb_check_set_addr(PARROT_INTERP, ARGMOD(IMC_Unit *unit),
        ARGMOD(Basic_block *bb), ARGIN(const SymReg *label))
{
    ASSERT_ARGS(bb_check_set_addr)
    const Instruction *ins;

    for (ins = unit->instructions; ins; ins = ins->next) {
        if ((ins->opnum == PARROT_OP_set_addr_p_ic)
        &&   STREQ(label->name, ins->symregs[1]->name)) {
            IMCC_debug(interp, DEBUG_CFG, "set_addr %s\n",
                    ins->symregs[1]->name);

            /* connect this block with first and last block */
            bb_add_edge(interp, unit, unit->bb_list[0], bb);
            bb_add_edge(interp, unit, unit->bb_list[unit->n_basic_blocks - 1], bb);

            /* and mark the instruction as being kind of a branch */
            bb->start->type |= ITADDR;

            break;
        }
    }
}


/*

=item C<void build_cfg(PARROT_INTERP, IMC_Unit *unit)>

Once the basic blocks have been computed, build_cfg computes the dependencies
between them.

=cut

*/

void
build_cfg(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(build_cfg)
    Basic_block *last = NULL;
    unsigned int i;
    int changes;

    IMCC_info(interp, 2, "build_cfg\n");

    for (i = 0; i < unit->n_basic_blocks; i++) {
        Basic_block * const bb = unit->bb_list[i];
        SymReg             *addr;

        /* if the block can fall-through */
        if (i > 0 && ! (last->end->type & IF_goto))
            bb_add_edge(interp, unit, last, bb);

        /* check first ins, if label try to find a set_addr op */
        if (bb->start->type & ITLABEL)
            bb_check_set_addr(interp, unit, bb, bb->start->symregs[0]);

        /* look if last instruction is a branch */
        addr = get_branch_reg(bb->end);

        if (addr)
            bb_findadd_edge(interp, unit, bb, addr);
        else if (STREQ(bb->start->opname, "invoke")
             ||  STREQ(bb->start->opname, "invokecc")) {
            if (check_invoke_type(interp, unit, bb->start) == INVOKE_SUB_LOOP)
                bb_add_edge(interp, unit, bb, unit->bb_list[0]);
        }

        last = bb;
    }

    /* Decouple unreachable blocks (not the first block, with no predecessors)
     * from the CFG */
    do {
        unsigned int i;
        changes = 0;

        for (i = 1; i < unit->n_basic_blocks; i++) {
            Basic_block * const bb = unit->bb_list[i];

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


/*

=item C<static void bb_findadd_edge(PARROT_INTERP, IMC_Unit *unit, Basic_block
*from, const SymReg *label)>

Finds the placement of the given label and links its containing block to the
given basic block.

=cut

*/

static void
bb_findadd_edge(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(Basic_block *from),
        ARGIN(const SymReg *label))
{
    ASSERT_ARGS(bb_findadd_edge)
    Instruction         *ins;
    const SymReg * const r = find_sym(interp, label->name);

    if (r && (r->type & VTADDRESS) && r->first_ins)
        bb_add_edge(interp, unit, from, unit->bb_list[r->first_ins->bbindex]);
    else {
        IMCC_debug(interp, DEBUG_CFG, "register branch %d ", from->end);
        for (ins = from->end; ins; ins = ins->prev) {
            if ((ins->type & ITBRANCH)
            &&   STREQ(ins->opname, "set_addr")
            &&   ins->symregs[1]->first_ins) {
                bb_add_edge(interp, unit, from,
                    unit-> bb_list[ins->symregs[1]->first_ins->bbindex]);
                IMCC_debug(interp, DEBUG_CFG, "(%s) ", ins->symregs[1]->name);
                break;
            }
        }

        IMCC_debug(interp, DEBUG_CFG, "\n");
    }
}


/*

=item C<int blocks_are_connected(const Basic_block *from, const Basic_block
*to)>

Returns true or false whether the given blocks are linked.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
blocks_are_connected(ARGIN(const Basic_block *from),
                     ARGIN(const Basic_block *to))
{
    ASSERT_ARGS(blocks_are_connected)
    const Edge *pred = to->pred_list;

    while (pred) {
        /*already linked*/
        if (pred->from == from)
            return 1;

        pred = pred->pred_next;
    }

    return 0;
}


/*

=item C<static void bb_add_edge(PARROT_INTERP, IMC_Unit *unit, Basic_block
*from, Basic_block *to)>

Adds an edge between the two given blocks.

=cut

*/

static void
bb_add_edge(PARROT_INTERP,
        ARGMOD(IMC_Unit *unit),
        ARGIN(Basic_block  *from),
        ARGMOD(Basic_block *to))
{
    ASSERT_ARGS(bb_add_edge)
    Edge *e;
    if (blocks_are_connected(from, to))
        return;

    /* we assume that the data is correct, and thus if the edge is not
     * on the predecessors of 'from', it won't be on the successors of 'to' */
    e             = mem_gc_allocate_typed(interp, Edge);

    e->succ_next  = from->succ_list;
    e->from       = from;

    e->pred_next  = to->pred_list;
    e->to         = to;

    to->pred_list = from->succ_list = e;

    /* memory housekeeping */
    e->next = NULL;

    if (unit->edge_list == NULL)
        unit->edge_list = e;
    else {
        e->next         = unit->edge_list;
        unit->edge_list = e;
    }
}


/*

=item C<static void bb_remove_edge(IMC_Unit *unit, Edge *edge)>

Removes the given edge from the graph.

=cut

*/

static void
bb_remove_edge(ARGMOD(IMC_Unit *unit), ARGMOD(Edge *edge))
{
    ASSERT_ARGS(bb_remove_edge)
    if (edge->from->succ_list == edge) {
        edge->from->succ_list = edge->succ_next;
    }
    else {
        Edge *prev;

        for (prev = edge->from->succ_list; prev; prev = prev->succ_next) {
            if (prev->succ_next == edge)
                prev->succ_next = edge->succ_next;
        }
    }

    if (edge->to->pred_list == edge) {
        edge->to->pred_list = edge->pred_next;
    }
    else {
        Edge *prev;

        for (prev = edge->to->pred_list; prev; prev = prev->pred_next) {
            if (prev->pred_next == edge)
                prev->pred_next = edge->pred_next;
        }
    }

    if (unit->edge_list == edge) {
        unit->edge_list = edge->next;
        mem_sys_free(edge);
    }
    else {
        Edge *prev;
        for (prev = unit->edge_list; prev; prev = prev->next) {
            if (prev->next == edge) {
                prev->next = edge->next;
                mem_sys_free(edge);
                break;
            }
        }
    }
}


/*

=item C<static void free_edge(IMC_Unit *unit)>

Frees the memory of an IMC_Unit's edge list.

=cut

*/

static void
free_edge(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(free_edge)
    Edge *e;

    for (e = unit->edge_list; e;) {
        Edge * const next = e->next;
        mem_sys_free(e);
        e = next;
    }

    unit->edge_list = NULL;
}


/*

=item C<int edge_count(const IMC_Unit *unit)>

Counts and returns the number of edges in the specified IMC_Unit.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
edge_count(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(edge_count)
    Edge *e = unit->edge_list;
    int   i = 0;
    while (e) {
        i++;
        e = e->next;
    }

    return i;
}


/*

=item C<void compute_dominators(PARROT_INTERP, IMC_Unit *unit)>

Computes the dominators tree of the CFG.  Basic block A dominates B if each
path to B passes through A

See gcc:flow.c compute_dominators

=cut

*/

void
compute_dominators(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(compute_dominators)
#define USE_BFS 0

#if !USE_BFS
    int i, change, pred_index;
#else
    int i, cur, len, succ_index;
    int *q;
    Set *visited;
#endif
    int b, runner, wrong;
    Set **dominators;

    const unsigned int n = unit->n_basic_blocks;
    IMCC_info(interp, 2, "compute_dominators\n");

    unit->idoms          = mem_gc_allocate_n_zeroed_typed(interp, n, int);
    dominators           = mem_gc_allocate_n_zeroed_typed(interp, n, Set *);
    unit->dominators     = dominators;

    dominators[0]        = set_make(interp, n);
    set_add(dominators[0], 0);

    for (i = n - 1; i; --i) {
        if (unit->bb_list[i]->pred_list) {
            dominators[i] = set_make_full(interp, n);
        }
        else {
            dominators[i] = set_make(interp, n);
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
            set_add(dominators[succ_index], succ_index);

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
        unsigned int i;
        change = 0;

        /* TODO: This 'for' should be a breadth-first search for speed */
        for (i = 1; i < n; i++) {
            Set  * const s = set_copy(interp, dominators[i]);
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

    for (b = n - 1; b; --b) {
        unit->idoms[b] = 0;
        for (i = n - 1; i > 0; i--) {
            if (i != b && set_contains(dominators[b], i)) {
                wrong = 0;
                for (runner = n - 1; runner >= 0; --runner) {
                    if (runner != b && runner != i
                    &&  set_contains(dominators[b], runner))
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
    mem_sys_free(q);
    set_free(visited);
#endif
}


/*

=item C<void compute_dominance_frontiers(PARROT_INTERP, IMC_Unit *unit)>

Algorithm to find dominance frontiers described in paper "A Simple, Fast
Dominance Algorithm", Cooper et al. (2001)

=cut

*/

void
compute_dominance_frontiers(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(compute_dominance_frontiers)
    int i, b;

    const int    n                   = unit->n_basic_blocks;
    Set ** const dominance_frontiers = unit->dominance_frontiers =
            mem_gc_allocate_n_typed(interp, n, Set *);

    IMCC_info(interp, 2, "compute_dominance_frontiers\n");

    for (i = 0; i < n; i++) {
        dominance_frontiers[i] = set_make(interp, n);
    }

    /* for all nodes, b */
    for (b = 1; b < n; b++) {
        const Edge *edge = unit->bb_list[b]->pred_list;

        /* if the number of predecessors of b >= 2 */
        if (edge && edge->pred_next) {

            /* for all predecessors, p, of b */
            for (; edge; edge = edge->pred_next) {
                /* runner = p */
                int runner = edge->from->index;

                /* while runner != idoms[b] */
                while (runner >= 0 && runner != unit->idoms[b]) {
                    if (set_contains(unit->dominance_frontiers[runner], b))
                        /* we've already gone down this path once before */
                        runner = 0;
                    else
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


/*

=item C<static void free_dominators(IMC_Unit *unit)>

Frees the memory in the given unit related to all dominators.

=cut

*/

static void
free_dominators(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(free_dominators)
    if (unit->dominators) {
        unsigned int i;

        for (i = 0; i < unit->n_basic_blocks; i++) {
            set_free(unit->dominators[i]);
        }

        mem_sys_free(unit->dominators);
        unit->dominators = NULL;
        mem_sys_free(unit->idoms);
    }
}


/*

=item C<static void free_dominance_frontiers(IMC_Unit *unit)>

Frees the memory in the given unit related to all dominance frontiers.

=cut

*/

static void
free_dominance_frontiers(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(free_dominance_frontiers)
    if (unit->dominance_frontiers) {
        unsigned int i;

        for (i = 0; i < unit->n_basic_blocks; i++) {
            set_free(unit->dominance_frontiers[i]);
        }

        mem_sys_free(unit->dominance_frontiers);
        unit->dominance_frontiers = NULL;
    }
}


/*

=item C<static void sort_loops(PARROT_INTERP, IMC_Unit *unit)>

Sorts the loops found in the CFG of the current unit.

=cut

*/

static void
sort_loops(PARROT_INTERP, ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(sort_loops)

    Loop_info   *li;
    Loop_info  **loop_info = unit->loop_info;
    int          n_loops   = (int)unit->n_loops;
    int          i, k, changed;
    unsigned int j;

    for (i = 0; i < n_loops; i++) {
        loop_info[i]->size = 0;

        for (j = 0; j < unit->n_basic_blocks; j++)
            if (set_contains(loop_info[i]->loop, j))
                loop_info[i]->size++;
    }

    changed = 1;

    while (changed) {
        changed = 0;

        for (i = 0; n_loops && i < n_loops - 1; i++)
            if (loop_info[i]->size < loop_info[i + 1]->size) {
                li             = loop_info[i];
                loop_info[i]   = loop_info[i + 1];
                loop_info[i+1] = li;
                changed        = 1;
            }
    }

    /* set depth was incorrect until now, as it depended on the order of
     * finding loops */
    for (i = 0; n_loops && i < n_loops - 1; i++) {
        int first           = -1;
        int last            = 0;
        loop_info[i]->depth = 1;

        /* we could also take the depth of the first contained block, but below
         * is a check, that a inner loop is fully contained in a outer loop */
        for (j = 0; j < unit->n_basic_blocks; j++)
            if (set_contains(loop_info[i+1]->loop, j)) {
                if (first < 0)
                    first = j;
                last = j;
            }

        for (k = i + 1; k < n_loops; k++) {
            if (set_contains(loop_info[i]->loop, first)
            && !set_contains(loop_info[i]->loop, last)) {
                IMCC_debug(interp, DEBUG_CFG, "sort_loops",
                        "loop %d contains first but not"
                        "last of outer loop %d\n", k, i);
            }

            if (set_contains(loop_info[i]->loop, last)
            && !set_contains(loop_info[i]->loop, first)) {
                IMCC_debug(interp, DEBUG_CFG, "sort_loops",
                        "loop %d contains last but not"
                        "first of outer loop %d\n", k, i);
            }

            loop_info[k]->depth = loop_info[i]->depth + 1;
        }
    }
}


/*

=item C<void find_loops(PARROT_INTERP, IMC_Unit *unit)>

Searches for loops in the CFG. We search for edges that go from a node to one
of its dominators.

=cut

*/

void
find_loops(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(find_loops)
    unsigned int i;

    IMCC_info(interp, 2, "find_loops\n");

    for (i = 0; i < unit->n_basic_blocks; i++) {
        const Set * const dom = unit->dominators[i];
        const Edge       *edge;

        for (edge = unit->bb_list[i]->succ_list; edge; edge = edge->succ_next) {
            if (set_contains(dom, edge->to->index))
                mark_loop(interp, unit, edge);
        }
    }

    sort_loops(interp, unit);
    if (IMCC_INFO(interp)->debug & DEBUG_CFG)
        dump_loops(unit);
}


/*

=item C<int natural_preheader(const IMC_Unit *unit, const Loop_info *loop_info)>

For loop_info, finds the natural preheader of the loop, if any, and returns its
index, otherwise returns -1.  A natural preheader exists if there is only one
predecessor to the loop header outside of the loop body, and if it always
transfers control directly to the header.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
natural_preheader(ARGIN(const IMC_Unit *unit), ARGIN(const Loop_info *loop_info))
{
    ASSERT_ARGS(natural_preheader)
    Edge *edge;
    int   preheader = -1;

    for (edge = unit->bb_list[loop_info->header]->pred_list;
         edge;
         edge = edge->pred_next) {
        if (!set_contains(loop_info->loop, edge->from->index)) {
            if (preheader == -1
            &&  unit->bb_list[edge->from->index]->succ_list->to->index
                == loop_info->header
            && !unit->bb_list[edge->from->index]->succ_list->succ_next)
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


/*

=item C<static void mark_loop(PARROT_INTERP, IMC_Unit *unit, const Edge *e)>

Increases the loop_depth of all the nodes in a loop.

=cut

*/

static void
mark_loop(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const Edge *e))
{
    ASSERT_ARGS(mark_loop)
    Set         *loop;
    Set         *exits;
    Edge        *edge;
    Loop_info  **loop_info;
    Basic_block *header = e->to;
    Basic_block *footer = e->from;
    Basic_block *enter  = 0;

    unsigned int i;
    int n_loops;

    /* look from where loop was entered */
    for (i = 0, edge=header->pred_list; edge; edge=edge->pred_next)
        if (footer != edge->from) {
            enter = edge->from;
            i++;
        }

    IMCC_debug(interp, DEBUG_CFG, "loop from %d to %d, entered from %d\n",
            footer->index, header->index, enter ? (int)enter->index : -1);

    if (i == 0) {
        if (header->index)
            IMCC_debug(interp, DEBUG_CFG, "\tdead code\n");
        else
            IMCC_debug(interp, DEBUG_CFG, "\tsub start\n");
    }
    else if (i != 1) {
        IMCC_debug(interp, DEBUG_CFG,
                "\tcan't determine loop entry block (%d found)\n" , i);
    }

    loop = set_make(interp, unit->n_basic_blocks);
    set_add(loop, footer->index);
    set_add(loop, header->index);

    footer->loop_depth++;

    if (header != footer) {
        header->loop_depth++;
        search_predecessors_not_in(footer, loop);
    }

    exits = set_make(interp, unit->n_basic_blocks);

    for (i = 1; i < unit->n_basic_blocks; i++) {
        if (set_contains(loop, i)) {
            for (edge = unit->bb_list[i]->succ_list;
                 edge;
                 edge = edge->succ_next)
            {
                if (!set_contains(loop, edge->to->index))
                    set_add(exits, i);
            }
        }
    }

    /* now 'loop' contains the set of nodes inside the loop.  */
    n_loops                       = unit->n_loops;
    loop_info                     = mem_gc_realloc_n_typed(interp,
                                            unit->loop_info,
                                            n_loops + 1, Loop_info *);
    loop_info[n_loops]            = mem_gc_allocate_typed(interp, Loop_info);
    loop_info[n_loops]->loop      = loop;
    loop_info[n_loops]->exits     = exits;
    loop_info[n_loops]->depth     = footer->loop_depth;
    loop_info[n_loops]->n_entries = i;
    loop_info[n_loops]->header    = header->index;
    loop_info[n_loops]->preheader = natural_preheader(unit, loop_info[n_loops]);

    unit->loop_info = loop_info;

    unit->n_loops++;
}


/*

=item C<static void free_loops(IMC_Unit *unit)>

Frees the memory associated with the loops in this unit.

=cut

*/

static void
free_loops(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(free_loops)
    int i;

    for (i = 0; i < unit->n_loops; i++) {
        set_free(unit->loop_info[i]->loop);
        set_free(unit->loop_info[i]->exits);
        mem_sys_free(unit->loop_info[i]);
    }

    mem_sys_free(unit->loop_info);

    unit->n_loops   = 0;
    unit->loop_info = NULL;
}


/*

=item C<void search_predecessors_not_in(const Basic_block *node, Set *s)>

Searches for predecessor edges for this node not in the given set (and adds
them).

=cut

*/

void
search_predecessors_not_in(ARGIN(const Basic_block *node), ARGMOD(Set *s))
{
    ASSERT_ARGS(search_predecessors_not_in)
    Edge *edge;

    for (edge = node->pred_list; edge; edge = edge->pred_next) {
        Basic_block * const pred = edge->from;

        if (!set_contains(s, pred->index)) {
           set_add(s, pred->index);
           pred->loop_depth++;
           search_predecessors_not_in(pred, s);
        }
    }
}

/*** Utility functions ***/

/*

=item C<static void init_basic_blocks(PARROT_INTERP, IMC_Unit *unit)>

Initializes the basic blocks memory for this unit.

=cut

*/

static void
init_basic_blocks(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(init_basic_blocks)

    if (!unit->bb_list)
        clear_basic_blocks(unit);

    unit->n_basic_blocks = 0;
    unit->edge_list      = NULL;
    unit->bb_list_size   = 256;
    unit->bb_list        = mem_gc_allocate_n_zeroed_typed(interp,
                                    unit->bb_list_size, Basic_block *);
}


/*

=item C<void clear_basic_blocks(IMC_Unit *unit)>

Frees all of the blocks and CFG memory allocated for this unit.

=cut

*/

void
clear_basic_blocks(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(clear_basic_blocks)

    if (unit->bb_list) {
        unsigned int i;

        for (i = 0; i < unit->n_basic_blocks; i++)
            mem_sys_free(unit->bb_list[i]);

        mem_sys_free(unit->bb_list);
        unit->bb_list = NULL;
    }

    free_edge(unit);
    free_dominators(unit);
    free_dominance_frontiers(unit);
    free_loops(unit);
}


/*

=item C<static Basic_block* make_basic_block(PARROT_INTERP, IMC_Unit *unit,
Instruction *ins)>

Creates, initializes, and returns a new Basic_block.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Basic_block*
make_basic_block(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGMOD(Instruction *ins))
{
    ASSERT_ARGS(make_basic_block)
    Basic_block * const bb = mem_gc_allocate_typed(interp, Basic_block);
    int                 n  = unit->n_basic_blocks;

    bb->start      = ins;
    bb->end        = ins;

    bb->pred_list  = NULL;
    bb->succ_list  = NULL;

    ins->bbindex   = n;
    bb->index      = n;
    bb->loop_depth = 0;

    if (n == unit->bb_list_size) {
        unit->bb_list_size *= 2;
        unit->bb_list = mem_gc_realloc_n_typed(interp, unit->bb_list,
                    unit->bb_list_size, Basic_block *);
    }

    unit->bb_list[n] = bb;
    unit->n_basic_blocks++;

    return bb;
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
