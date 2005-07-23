/*
 * reg_alloc.c
 *
 * Register allocator:
 *
 * This is a brute force register allocator. It uses a graph-coloring
 * algorithm, but the implementation is very kludgy.
 *
 * It is a partial implementation of a Briggs-style register allocator
 * The following parts are just missing:
 *
 * - Renumbering
 * - Coaelesceing
 *
 */

#include <string.h>
#include <assert.h>
#include "imc.h"
#include "optimizer.h"

/* recalculate CFG and register life for all syms, with this
 * set to 1, the old and slow routines are used
 * with 0, this info is recalced on the fly during spilling
 */
#define DOIT_AGAIN_SAM 0

#define SPILL_STRESS 0

#if SPILL_STRESS
# undef MAX_COLOR
# define MAX_COLOR 6
#endif

void graph_coloring_reg_alloc(Interp *interpreter, IMC_Unit * unit);
static void make_stat(IMC_Unit *, int *sets, int *cols);
static void imc_stat_init(IMC_Unit *);
static void print_stat(Parrot_Interp, IMC_Unit *);
static void allocate_wanted_regs(IMC_Unit *);
static void build_reglist(Parrot_Interp, IMC_Unit * unit, int first);
static void build_interference_graph(Parrot_Interp, IMC_Unit *);
static void compute_du_chain(IMC_Unit * unit);
static void compute_one_du_chain(SymReg * r, IMC_Unit * unit);
static int interferes(Interp *, IMC_Unit *, SymReg * r0, SymReg * r1);
static void map_colors(IMC_Unit *, int x, unsigned int * graph, char colors[], int typ);
#ifdef DO_SIMPLIFY
static int simplify (IMC_Unit *);
#endif
static void compute_spilling_costs (Parrot_Interp, IMC_Unit *);
static void order_spilling (IMC_Unit *);
static void spill (Interp *, IMC_Unit * unit, int);
static int try_allocate(Parrot_Interp, IMC_Unit *);
static void restore_interference_graph(Interp *, IMC_Unit *);
#if 0
static int neighbours(int node);
#endif

/* XXX FIXME: Globals: */

static IMCStack nodeStack;

static unsigned int* ig_get_word(int i, int j, int N, unsigned int* graph,
                                 int* bit_ofs)
{
    unsigned int bit = i * N + j;
    *bit_ofs = bit % sizeof(*graph);
    return &graph[bit / sizeof(*graph)];
}

static void ig_set(int i, int j, int N, unsigned int* graph)
{
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, graph, &bit_ofs);
    *word |= (1 << bit_ofs);
}

static void ig_clear(int i, int j, int N, unsigned int* graph)
{
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, graph, &bit_ofs);
    *word &= ~(1 << bit_ofs);
}

int ig_test(int i, int j, int N, unsigned int* graph);
int ig_test(int i, int j, int N, unsigned int* graph)
{
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, graph, &bit_ofs);
    return *word & (1 << bit_ofs);
}

static unsigned int* ig_allocate(int N)
{
    /* size is N*N bits, but we want don't want to allocate a partial
     * word, so round up to the nearest multiple of sizeof(int).
     */
    int need_bits = N * N;
    int num_words = (need_bits + sizeof(int) - 1) / sizeof(int);
    return (unsigned int*) mem_sys_allocate_zeroed(num_words * sizeof(int));
}

/* imc_reg_alloc is the main loop of the allocation algorithm. It operates
 * on a single compilation unit at a time.
 */
void
imc_reg_alloc(Interp *interpreter, IMC_Unit * unit)
{
    int todo, first;
    int loop_counter;
    char *function;

    if (!unit)
        return;
    if (!(IMCC_INFO(interpreter)->optimizer_level &
                (OPT_PRE|OPT_CFG|OPT_PASM)) && unit->pasm_file)
        return;

    imcc_init_tables(interpreter);
    IMCC_INFO(interpreter)->allocated = 0;
    if (!unit->instructions)
        return;

#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: imc_reg_alloc\n");
    if (unit->instructions->r[1] && unit->instructions->r[1]->pcc_sub) {
        fprintf(stderr, "img_reg_alloc: pcc_sub (nargs = %d)\n",
            unit->instructions->r[1]->pcc_sub->nargs);
    }
#endif

    function = unit->instructions->r[0]->name;
    IMCC_debug(interpreter, DEBUG_IMC, "\n------------------------\n");
    IMCC_debug(interpreter, DEBUG_IMC, "processing sub %s\n", function);
    IMCC_debug(interpreter, DEBUG_IMC, "------------------------\n\n");
    if (IMCC_INFO(interpreter)->verbose ||
            (IMCC_INFO(interpreter)->debug & DEBUG_IMC))
        imc_stat_init(unit);

    /* consecutive labels, if_branch, unused_labels ... */
    pre_optimize(interpreter, unit);
    if (IMCC_INFO(interpreter)->optimizer_level == OPT_PRE && unit->pasm_file)
        return;

    nodeStack = imcstack_new();
    unit->n_spilled = 0;

    todo = first = 1;
    loop_counter = 0;
    while (todo) {
        loop_counter++;
        find_basic_blocks(interpreter, unit, first);
        build_cfg(interpreter, unit);

        first = 0;
        todo = cfg_optimize(interpreter, unit);
    }
    todo = first = 1;
    loop_counter = 0;
    while (todo) {
        loop_counter++;
        if (!first) {
            find_basic_blocks(interpreter, unit, 0);
            build_cfg(interpreter, unit);
        }
        first = 0;

        compute_dominators(interpreter, unit);
        find_loops(interpreter, unit);

        build_reglist(interpreter, unit, 1);
        life_analysis(interpreter, unit);
        /* optimize, as long as there is something to do */
        if (IMCC_INFO(interpreter)->dont_optimize)
            todo = 0;
        else {
            todo = optimize(interpreter, unit);
            if (todo)
                pre_optimize(interpreter, unit);
        }
    }

    graph_coloring_reg_alloc(interpreter, unit);

    if (IMCC_INFO(interpreter)->optimizer_level & OPT_SUB)
        sub_optimize(interpreter, unit);
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_instructions(interpreter, unit);
    if (IMCC_INFO(interpreter)->verbose  ||
            (IMCC_INFO(interpreter)->debug & DEBUG_IMC))
        print_stat(interpreter, unit);
    imcstack_free(nodeStack);
}

void
free_reglist(IMC_Unit * unit)
{
#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: free_reglist\n");
#endif
    if (unit->interference_graph) {
        free(unit->interference_graph);
        unit->interference_graph =  0;
    }
    if (unit->reglist) {
        int i;
        for (i = 0; i < unit->n_symbols; i++)
            free_life_info(unit, unit->reglist[i]);
        free(unit->reglist);
        unit->reglist = NULL;
        unit->n_symbols = 0;
    }
}

void
graph_coloring_reg_alloc(Interp *interpreter, IMC_Unit * unit)
{
    int to_spill, todo, loop_counter;

    todo = 1;
    loop_counter = 0;
#if !DOIT_AGAIN_SAM
    build_interference_graph(interpreter, unit);
#endif
    while (todo) {
        loop_counter++;
#if DOIT_AGAIN_SAM
        build_interference_graph(interpreter, unit);
#endif
        if (IMCC_INFO(interpreter)->optimizer_level & OPT_SUB)
            allocate_wanted_regs(unit);
        compute_spilling_costs(interpreter, unit);
#ifdef DO_SIMPLIFY
        /* simplify until no changes can be made */
        while (simplify(unit)) {}
#endif
        order_spilling(unit);          /* put the remaining items on stack */

        to_spill = try_allocate(interpreter, unit);
        IMCC_INFO(interpreter)->allocated = 1;

        if ( to_spill >= 0 ) {
            IMCC_INFO(interpreter)->allocated = 0;
            spill(interpreter, unit, to_spill);
            /*
             * build the new cfg/reglist on the fly in spill() and
             * do life analysis there for only the involved regs
             */
#if DOIT_AGAIN_SAM
            find_basic_blocks(interpreter, unit, 0);
            build_cfg(interpreter, unit);
            build_reglist(interpreter, unit, 1);
            life_analysis(interpreter);
#endif
        }
        else {
            /* the process is finished */
            todo = 0;
        }
    }
}

/* some statistics about register usage
 * printed with --verbose --verbose
 */
static void
make_stat(IMC_Unit * unit, int *sets, int *cols)
{
    /* register usage summary */
    char type[] = "INSP";
    int i, j;
    for (i = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
    	for (; r; r = r->next)
            for (j = 0; j < 4; j++)
                if (r->set == type[j] && (r->type & VTREGISTER)) {
                    sets[j]++;
                    if (cols)
                        if (r->color > cols[j])
                            cols[j] = r->color;
                }
    }
}
static int imcsets[4];
/* registes usage of .imc */
static void imc_stat_init(IMC_Unit * unit) {
    imcsets[0] = imcsets[1] = imcsets[2] = imcsets[3] = 0;
    make_stat(unit, imcsets, 0);
    memset(&ostat, 0, sizeof(ostat));
}

/* and final */
static void print_stat(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int sets[4] = {0,0,0,0};
    int cols[4] = {-1,-1,-1,-1};
    char *function = unit->instructions->r[0]->name;

    make_stat(unit, sets, cols);
    IMCC_info(interpreter, 1, "sub %s:\n\tregisters in .imc:\t I%d, N%d, S%d, P%d\n",
            function, imcsets[0], imcsets[1], imcsets[2], imcsets[3]);
    IMCC_info(interpreter, 1, "\t%d labels, %d lines deleted, %d if_branch, %d branch_branch\n",
            ostat.deleted_labels, ostat.deleted_ins, ostat.if_branch,
            ostat.branch_branch);
    IMCC_info(interpreter, 1, "\t%d used once deleted\n",
            ostat.used_once);
    IMCC_info(interpreter, 1, "\t%d invariants_moved\n", ostat.invariants_moved);
    IMCC_info(interpreter, 1, "\tregisters needed:\t I%d, N%d, S%d, P%d\n",
            sets[0], sets[1], sets[2], sets[3]);
    IMCC_info(interpreter, 1, "\tregisters in .pasm:\t I%d, N%d, S%d, P%d - %d spilled\n",
            cols[0]+1, cols[1]+1, cols[2]+1, cols[3]+1,
            unit->n_spilled);
    IMCC_info(interpreter, 1, "\t%d basic_blocks, %d edges\n",
            unit->n_basic_blocks, edge_count(unit));

}

/* sort list by line  nr */
static int
reg_sort_f(const void *a, const void *b)
{
    SymReg *ra = *(SymReg**) a;
    SymReg *rb = *(SymReg**) b;
    if (ra->first_ins->index < rb->first_ins->index) {
	return -1;
    }
    else if (ra->first_ins->index == rb->first_ins->index) {
        return 0;
    }
    else {
	return 1;
    }
}

static void
sort_reglist(IMC_Unit *unit)
{
    qsort(unit->reglist, unit->n_symbols, sizeof(SymReg*), reg_sort_f);
}

/*
 * Registers are now sorted according to the line on which their usage
 * starts, which means that they are sorted by basic block numbers too.
 *
 * Run through them and allocate all that don't overlap in one bunch.
 *
 * Registers 28-30 are reserved for short range temps, which
 * get allocated immediately
 */

#define ALLOCATE_HACK

#ifdef ALLOCATE_HACK

static void
allocate_non_interfering(Parrot_Interp interpreter, IMC_Unit *unit, int n)
{
    int i, t;
    int first_color, last_line, b, first_reg;
    SymReg *r = NULL;   /* uninit gcc warning */
    SymReg ** reglist = unit->reglist;

    for (t = 0; t < 4; t++) {
        int typ = "INSP"[t];
        i = 0;
        for (b = 0; b < unit->n_basic_blocks; b++) {
            first_color = 30;
            last_line = -1;
            first_reg = -1;
            while (first_color >= 28) {  /* 28..30 for 3 temps */
                for (; i < n; ++i) {
                    r = reglist[i];
                    /*
                     * if we didn't reach this basic block, continue
                     */
                    if (r->first_ins->bbindex < b)
                        continue;
                    /* remember first register in this block */
                    if (first_reg == -1)
                        first_reg = i;
                    /*
                     * register set must match and not already allocated
                     */
                    if (r->set != typ ||
                            r->want_regno >= 0 || r->color >= 0)
                        continue;
                    if (r->color == first_color) {
                        IMCC_warning(interpreter, "allocate_non_interfering"
                                "color %d for register type %c in use",
                                first_color, typ);
                        goto next_color;
                    }
                    /* at end of block start over, try next color */
                    if (r->first_ins->bbindex > b)
                        goto next_color;
                    /* if this register spans more then one block
                     * try next one
                     */
                    if (r->last_ins->bbindex > b)
                        continue;
                    /*
                     * if it interfers with the previous allocated reg
                     * try next one
                     */
                    if (r->first_ins->index <= last_line)
                        continue;
                    assert(r->first_ins->bbindex == r->last_ins->bbindex);
                    break;
                }
                if (i == n)
                    goto next_block;
                last_line = r->last_ins->index;
                r->color = first_color;
                r->type = VTPASM;
                IMCC_debug(interpreter, DEBUG_IMC, "block %d coloring '%s' %d\n",
                        b, r->name, r->color);
                continue;
next_color:
                if (first_reg >= 0)
                    i = first_reg;
                else
                    i = 0;
                /* reset, color is decremented, so no interfernce */
                last_line = -1;
                --first_color;
            }
next_block:
            ;
        } /* for b */
    } /* for t */
}
#endif

/* make a linear list of IDENTs and VARs, set n_symbols
 * TODO
 *   split the whole life analysis into 4, one per register kind
 *   registers of different kind never interfere, but the reglist
 *   has them all
 */

static void
build_reglist(Parrot_Interp interpreter, IMC_Unit * unit, int first)
{
    int i, count, unused, n_symbols;

    IMCC_info(interpreter, 2, "build_reglist\n");
    /* count symbols */
    if (unit->reglist)
        free_reglist(unit);
    for (i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
        for (; r; r = r->next) {
#ifdef ALLOCATE_HACK
            if (r->color >= 28)
                continue;
#endif
            if (r->type & VTREGISTER)
                count++;
        }
    }
    if (count == 0)
        return;
    if (count >= HASH_SIZE)
        IMCC_warning(interpreter, "build_reglist: probably too small HASH_SIZE"
                " (%d symbols)\n", count);
    unit->reglist = mem_sys_allocate(count * sizeof(SymReg*));

    for (i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
        /* Add each symbol to reglist  */
        for (; r; r = r->next) {
            if (r->type & VTREGISTER) {
#ifdef ALLOCATE_HACK
                if (r->color < 28)
#endif
                    unit->reglist[count++] = r;
            }
        }
    }
    unit->n_symbols = n_symbols = count;
    compute_du_chain(unit);
    /* we might have unused symbols here, from spilling */
    for (i = count = unused = 0; i < n_symbols; i++) {
        if (!unit->reglist[i]->first_ins)
            unused++;
        else if (i == count)
            count++;
        else
            unit->reglist[count++] = unit->reglist[i];
    }
    n_symbols -= unused;
    unit->n_symbols = n_symbols;
    sort_reglist(unit);
    if (first) {
#ifdef ALLOCATE_HACK
        IMCC_info(interpreter, 1, "build_reglist: %d symbols\n", n_symbols);
        allocate_non_interfering(interpreter, unit, n_symbols);
        build_reglist(interpreter, unit, 0);
        IMCC_info(interpreter, 1, "allocate_non_interfering, now: %d symbols\n",
                unit->n_symbols);
#endif
    }
}

/* Creates the interference graph between the variables.
 *
 * Data structure is a 2-d array 'interference_graph' bitmap where
 * row/column indices represent the same index in the list of all
 * symbols (unit->reglist) in the current compilation unit.
 *
 * Two variables interfere when they are alive at the same time.
 */

static void
build_interference_graph(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int x, y, n_symbols;
    unsigned int* interference_graph;

    n_symbols = unit->n_symbols;
    if (!n_symbols)
        return;

    /* Construct a graph N x N where N = number of symbolics.
     * This piece can be rewritten without the N x N array
     */
    interference_graph = ig_allocate(n_symbols);
    unit->interference_graph = interference_graph;

    /* Calculate interferences between each chain and populate the the Y-axis */
    for (x = 0; x < n_symbols; x++) {
        /* If symbol was never used in a statment, it can't interfere */
        if (!unit->reglist[x]->first_ins)
            continue;
        for (y = x + 1; y < n_symbols; y++) {
            if (!unit->reglist[y]->first_ins)
                continue;
            if (interferes(interpreter, unit,
                        unit->reglist[x], unit->reglist[y])) {
                ig_set(x, y, n_symbols, interference_graph);
                ig_set(y, x, n_symbols, interference_graph);
            }
        }
    }

    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_interference_graph(unit);
}


/* Compute a DU-chain for each symbolic in a compilation unit
 */
static void
compute_du_chain(IMC_Unit * unit)
{
    Instruction * ins, *lastbranch;
    int i;

    lastbranch = 0;

    /* Compute last branch in this procedure, update instruction index */
    for (i = 0, ins = unit->instructions; ins; ins = ins->next) {
        ins->index = i++;
        if (ins->type == ITBRANCH)
            lastbranch = ins;
    }

    /* Compute du-chains for all symbolics */
    for (i = 0; i < unit->n_symbols; i++) {
        SymReg * r = unit->reglist[i];
        compute_one_du_chain(r, unit);
        /* what is this used for? -lt */
        if (r->type == VTIDENTIFIER
                && lastbranch
                && r->last_ins
                && r->last_ins->index < lastbranch->index)
            r->last_ins = lastbranch;
    }
}

static void
compute_one_du_chain(SymReg * r, IMC_Unit * unit)
{
    Instruction * ins;

    /* We cannot rely on computing the value of r->first when parsing,
     * since the situation can be changed at any time by the register
     * allocation algorithm
     */

    r->first_ins = 0;
    r->use_count = r->lhs_use_count = 0;
    for (ins = unit->instructions; ins; ins = ins->next) {
        int ro, rw;
        ro = instruction_reads(ins, r);
        rw = instruction_writes(ins, r);
        if (ro || rw) {
            if (!r->first_ins) {
                r->first_ins = ins;
            }
            r->last_ins = ins;
            if (rw)
                r->lhs_use_count++;
            r->use_count++;
            /* if this symbol is used in a different scope
             * assume usage
             */
            if (r->reg) {
                r->lhs_use_count++;
                r->use_count++;
            }
        }
    }
}

/* Computes the cost of spilling each symbol. This is estimated by the number
 * of times the symbol appears, weighted by X*loop_depth */

static void
compute_spilling_costs (Parrot_Interp interpreter, IMC_Unit * unit)
{
    int depth, i, j, k, max_depth;
    SymReg *r;
    Instruction * ins;

    for (i = 0; i < unit->n_symbols; i++) {
        r = unit->reglist[i];
        r->score = r->use_count + (r->lhs_use_count << 2);
        /* TODO score high if -Oj and register is used in
         * JITtable instruction
         */
        /* r->score *= (r->jit_usage - r->use_count + 1) */
        /* TODO rewrite this O(n_ins * n_reg) alg:
         * - store max_depth in reg
         * - store a flag, when this reg was already spilled
         */
        for (j = max_depth = 0; j < unit->n_basic_blocks;
                j++) {
            Life_range *l;
            int used = 0;

            l = r->life_info[j];
            if (!l->first_ins)
                continue;
            for (ins = l->first_ins ; ins; ins = ins->next) {
                for (k = 0; k < IMCC_MAX_REGS && ins->r[k]; k++)
                    if (ins->r[k] == r) {
                        used = 1;
                        break;
                    }
                if (used && r->usage & U_SPILL) {
                    r->score = 100000;
                    goto done;
                }
                if (ins == l->last_ins)
                    break;
            }

            if (used) {
                depth = unit->bb_list[j]->loop_depth;
                if (depth > max_depth)
                    max_depth = depth;
            }
        }
        r->score += 1000 * max_depth;
done:
        ; /* for MSVC 5 */
    }

    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_symreg(unit);

}
/* See if r0's chain interferes with r1. */
/* We currently decide that two vars interfere if they are both alive
 * at any point. This could be improved, requiring that one is alive
 * at the point of _definition_ of the other.
 */

static int
interferes(Interp *interpreter, IMC_Unit * unit, SymReg * r0, SymReg * r1)
{

    int i;

    /* Registers don't interfere with themselves
    */
    if (r0 == r1)
        return 0;

    /* Different register sets don't interfere with each other */
    if (r0->set != r1->set)
        return 0;
    /* If the first time r0 appears is in the same instruction as the
     * last appearance of r1, or after its last appearance, then they
     * can't interfere.
     *
     * Even if r0 and r1 are called in the same instruction, and even
     * if this instrucion does modify r0, if its value is never used
     * later, then they can share the same register.
     */

    /* Now: */

    if (r0->life_info == NULL || r1->life_info == NULL) {
        PANIC("interferes: INTERNAL ERROR: Life range is NULL\n");
    }

    for (i=0; i < unit->n_basic_blocks; i++) {
        Life_range *l0, *l1;

        l0 = r0->life_info[i];
        l1 = r1->life_info[i];

        /* One or both are not alive in this block, so we have
         * no conflict
         */
        if (!l0->first_ins || !l1->first_ins)
            continue;

        /* If the registers don't overlap, i.e first_x > last_y
         * then no interference
         */
        if (l0->first_ins->index > l1->last_ins->index)
            continue;
        if (l1->first_ins->index > l0->last_ins->index)
            continue;

#if 1
        /* If they only overlap one instruction and one is used RHS only
         * and the other LHS, then that's ok
         * same if both are LHS
         */
        if (l0->first_ins->index == l1->last_ins->index &&
                instruction_writes(l0->first_ins, r0) &&
                instruction_reads(l1->last_ins, r1) &&
                !instruction_reads(l0->first_ins, r0))
            continue;
        if (l1->first_ins->index == l0->last_ins->index &&
                instruction_writes(l1->first_ins, r1) &&
                instruction_reads(l0->last_ins, r0) &&
                !instruction_reads(l1->first_ins, r1))
            continue;
#endif

        return 1;
    }

    return 0;
}

/*
 * Simplify deletes all the nodes from the interference graph
 * that have arity lower than MAX_COLOR
 *
 * Returns if it has been able to delete at least one node
 * and 0 otherwise.
 *
 * XXX: this doesn't look at score, so I think this is bogus
 *      - currently disabled
 *
 */
#ifdef DO_SIMPLIFY
static int
simplify (IMC_Unit * unit)
{
    int changes = 0;
    int x;
    SymReg **g;

    g = unit->reglist;

    for (x = 0; x < n_symbols; x++) {
        if (g[x]->color >= 0)   /* VTPASM */
            g[x]->simplified = 1;
    }
    for (x = 0; x < n_symbols; x++) {
	if (g[x]->simplified) {
            break;
	}

	if ( neighbours(x) < MAX_COLOR) {
            IMCC_debug(interpreter, DEBUG_IMC, "#simplifying [%s]\n", g[x]->name);

	    imcstack_push(nodeStack, x);

	    g[x]->simplified = 1;
	    changes = 1;
	    break;
	}
    }

    return changes;
}
#endif

/* Puts the remaining nodes on the stack, in the correct order.
 *
 * We count how many times a symbol appears (weighted by the probability
 * that this particular point of code will be reached) and choose the symbol
 * with the lower score until all are in the stack.
 *
 */

static void
order_spilling (IMC_Unit * unit)
{
    int min_score = 0, total_score;
    int min_node;
    int x;

    while (1) {

	min_node = -1;

        for (x = 0; x < unit->n_symbols; x++) {
            /* if its spilled skip it */
            if (unit->reglist[x]->usage & U_SPILL)
                continue;

            /* for now, our score function only
	       takes in account how many times a symbols
	       has appeared + the loop_depth */

	     /* we have to combine somehow the rank of the node
	      * with the cost of spilling it
	      *
	      * our current function to maximize is:
	      *      rank - spill_cost
	      *
	      * I have no clue of how good it is
 	     */
	    if (!(unit->reglist[x]->simplified)) {
	        total_score = unit->reglist[x]->score /* - neighbours(x) */;

                if ( (min_node == -1) || (min_score > total_score) )  {
    	           min_node  = x;
	           min_score = total_score;
	        }
	    }
        }

	if (min_node == -1)
            break;       /* We are finished */

	imcstack_push(nodeStack, min_node);
	unit->reglist[min_node]->simplified = 1;
    }
    /*
     * now put all spilled regs on top of stack so that they
     * get their register first
     */
    for (x = 0; x < unit->n_symbols; x++) {
        if (unit->reglist[x]->usage & U_SPILL)
            imcstack_push(nodeStack, x);
    }
}


static void
restore_interference_graph(Interp *interpreter, IMC_Unit * unit)
{
    int i;
    for (i=0; i < unit->n_symbols; i++) {
        if ((unit->reglist[i]->type & VTPASM) &&
                !(IMCC_INFO(interpreter)->optimizer_level & OPT_PASM))
            continue;
	unit->reglist[i]->color = -1;
	unit->reglist[i]->simplified = 0;
    }
}

/*
 * try to allocate as much as possible
 */
static void
allocate_wanted_regs(IMC_Unit * unit)
{
    int i, y, interf, n_symbols;
    SymReg *r;

    n_symbols = unit->n_symbols;
    for (i = 0; i < n_symbols; i++) {
        r = unit->reglist[i];
        if (r->color >= 0 || r->want_regno == -1 || strchr("ISPN", r->set == 0))
            continue;
        interf = 0;
        for (y = 0; y < n_symbols; y++) {
            SymReg *s;
            if (! ig_test(i, y, n_symbols, unit->interference_graph))
                continue;
            s = unit->reglist[y];
            if (   s
                && s->color == r->want_regno
                && s->set == r->set) {
                interf = 1;
            }
        }
        if (!interf)
            r->color = r->want_regno;
    }
}
/*
 * find available color for register #x in available colors
 */
static int
ig_find_color(Interp* interpreter, IMC_Unit *unit, int x, char *avail)
{
    int c, t;
    SymReg *r;
    static const char types[] = "ISPN";

    static const char assignable[4][5] = {
       /* 0  1  2  3  4  */
        { 0, 0, 0, 0, 0, },     /* I */
        { 0, 0, 1, 1, 1, },     /* S */
        { 0, 0, 0, 1, 1, },     /* P */
        { 1, 1, 1, 1, 1, },     /* N */
    };


    UNUSED(interpreter);
    r = unit->reglist[x];
    t = strchr(types, r->set) - types;

    /* please note: c is starting at 1 for R0 */
    if (!(r->usage & U_NON_VOLATILE)) {
        /* 1) 5-15 volatile range
         * XXX allocate down to work around continuation bug
         * */
        for (c = 16; c >= 6; c--)
            if (avail[c])
                return c;
        /* some lower regs are usable too 0...4 */
        for (c = 1; c <= 5; c++)
            if (avail[c] && assignable[t][c - 1])
                return c;
    }
    /* 2) try upper non-volatiles, 16...NUM_REGISTERS-1 */
    for (c = 17; c <= NUM_REGISTERS; c++)
        if (avail[c])
            return c;
    return 0;
}
/*
 * Color the graph, assigning registers to each symbol:
 *
 * We just proceed popping items from the stack and assigning
 * a free color to them.
 *
 * If we run out of colors, then we need to spill the top node.
 */

static int
try_allocate(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int x = 0;
    int color;
    char avail[MAX_COLOR + 1];
    int t;
    unsigned int *graph = unit->interference_graph;
    SymReg ** reglist = unit->reglist;

    while ((imcstack_depth(nodeStack) > 0) ) {
	x=imcstack_pop(nodeStack);

	for (t = 0; t < 4; t++) {
	    int typ = "INSP"[t];
	    if (reglist[x]->set == typ && reglist[x]->color == -1) {
                map_colors(unit, x, graph, avail, typ);
                color = ig_find_color(interpreter, unit, x, avail);
                if (color) {
                    reglist[x]->color = color - 1;

                    IMCC_debug(interpreter, DEBUG_IMC,
                            "#[%s] provisionally gets color [%d]"
                            "(score %d)\n",
                            reglist[x]->name, color - 1,
                            reglist[x]->score);
                    break;
		}

		if (reglist[x]->color == -1) {
                    IMCC_debug(interpreter, DEBUG_IMC,
                            "# no more colors\n");

		    /* It has been impossible to assign a color
                     * to this node, return it so it gets spilled
                     */

		    restore_interference_graph(interpreter, unit);
		    /* clean stack */
		    while ((imcstack_depth(nodeStack) > 0) )
			imcstack_pop(nodeStack);
		    return x;
		}
	    }
	}
    }

    return -1; /* we are totally finished */
}

/*
 * map_colors: calculates what colors can be assigned to the x-th symbol.
 */
static void
map_colors(IMC_Unit* unit, int x, unsigned int *graph, char avail[], int typ)
{
    int y = 0, n_symbols;
    SymReg * r;

    n_symbols = unit->n_symbols;
    memset(avail, 1, MAX_COLOR + 1);
    /* reserved for spilling */
    if (typ == 'P')
        avail[31+1] = 0;
#ifdef ALLOCATE_HACK
    avail[28+1] = 0;     /* for immediate allocation */
    avail[29+1] = 0;     /* for immediate allocation */
    avail[30+1] = 0;     /* for immediate allocation */
#endif
    for (y = 0; y < n_symbols; y++) {
        if (! ig_test(x, y, n_symbols, graph))
            continue;
        r = unit->reglist[y];
        if (   r
    	    && r->color != -1
	    && r->set == typ) {
    	    avail[r->color+1] = 0;
    	}
    }
}

#if ! DOIT_AGAIN_SAM
/* update bb and life_info after spilling
 * this saves 4 costly routines
 * NOTE {lhs_,}use_count are not set again. This is safe as long as
 *      no further optimization pass follows
 */
static void
update_life(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        SymReg *r, int needs_fetch, int needs_store, int add)
{
    Life_range *l;
    int i;
    Instruction *ins2;
    Basic_block **bb_list = unit->bb_list;

#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: update_life(%s)\n", r->name);
#endif

    for (i = 0, ins2 = unit->instructions; ins2; ins2 = ins2->next) {
        ins2->index = i++;
    }
    /* add this sym to reglist, if not there */
    if (add) {
        unit->reglist = realloc(unit->reglist, (unit->n_symbols + 1) *
                sizeof(SymReg *));
        unit->reglist[unit->n_symbols++] = r;
    }

    r->first_ins = r->last_ins = ins;
    if (needs_fetch) {
        /* prev instructions is a fetch then and the first usage of this reg */
        r->first_ins = ins->prev;
        /* if this ins was the first of a BB, then the fetch is the
         * first ins then
         */
        if (ins == bb_list[ins->bbindex]->start)
            bb_list[ins->bbindex]->start = ins->prev;
    }
    if (needs_store) {
        /* next ins is a store then, and ends life of this reg */
        r->last_ins = ins->next;
        if (ins == bb_list[ins->bbindex]->end)
            bb_list[ins->bbindex]->end = ins->next;
    }
    /* now set life_info */
    free_life_info(unit, r);
    r->life_info = calloc(unit->n_basic_blocks,
            sizeof(Life_range*));
    for (i=0; i < unit->n_basic_blocks; i++)
        make_life_range(r, i);
    l = r->life_info[ins->bbindex];
    l->first_ins = r->first_ins;
    l->last_ins = r->last_ins;
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC) {
        dump_instructions(interpreter, unit);
        dump_symreg(unit);
    }
}
/*
 * update the interference_graph too and don't call
 *      build_interference_graph again
 */

static void
update_interference(Parrot_Interp interpreter, IMC_Unit * unit,
        SymReg *old, SymReg *new)
{
    int x, y, n_symbols;
    SymReg ** reglist = unit->reglist;
    unsigned int *interference_graph = unit->interference_graph;

    n_symbols = unit->n_symbols;
    if (old != new) {
        /* n_symbols is already increased */
        unsigned int *new_graph = ig_allocate(n_symbols);
        /* old symbols count of previous graph */
        int o = n_symbols - 1;
        for (x = 0; x < o; x++) {
            for (y = x + 1; y < o; y++) {
                if (ig_test(x, y, o, interference_graph)) {
                    ig_set(x, y, n_symbols, new_graph);
                    ig_set(y, x, n_symbols, new_graph);
                }
            }
        }
        free(interference_graph);
        unit->interference_graph = interference_graph = new_graph;
    }
    for (x = 0; x < n_symbols; x++) {
        for (y = x + 1; y < n_symbols; y++) {
            if (reglist[x] == old || reglist[x] == new ||
                    reglist[y] == old || reglist[y] == new) {
                if (interferes(interpreter, unit, reglist[x], reglist[y])) {
                    ig_set(x, y, n_symbols, interference_graph);
                    ig_set(y, x, n_symbols, interference_graph);
                }
                else {
                    ig_clear(x, y, n_symbols, interference_graph);
                    ig_clear(y, x, n_symbols, interference_graph);
                }
            }
        }
    }
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC) {
        fprintf(stderr, "old_sym %s\n", old->name);
        fprintf(stderr, "new_sym %s\n", new->name);
        dump_interference_graph(unit);
    }
}
#endif

/* Rewrites the unit instructions, inserting spill code in every ocurrence
 * of the symbol.
 */

static void
spill(Interp *interpreter, IMC_Unit * unit, int spilled)
{
    Instruction * tmp, *ins;
    int i, n, dl;
    int needs_fetch, needs_store;
    SymReg * old_sym, *p31, *new_sym;
    char * buf;
    SymReg *regs[IMCC_MAX_REGS];
    SymReg **reglist = unit->reglist;

    buf = mem_sys_allocate(256 * sizeof(char));

    IMCC_debug(interpreter, DEBUG_IMC, "#Spilling [%s]:\n", reglist[spilled]->name);

    new_sym = old_sym = reglist[spilled];
    if (old_sym->usage & U_SPILL)
        IMCC_fatal(interpreter, 1,
                "spill: double spill - program too complex\n");
    new_sym->usage |= U_SPILL;

    unit->n_spilled++;
    n = 0;
    dl = 0;     /* line corr */
    tmp = NULL;


    /* first instruction should be ".sub" -- make sure we allocate P31
     * _after_ subroutine entry.  And after the "saveall", or any
     * other assortment of pushes. */

    if (!unit->p31) {
        Instruction *spill_ins;

        p31 = unit->p31 = mk_pasm_reg(interpreter, str_dup("P31"));
        ins = unit->instructions;
        while (ins
                && (strncmp(ins->fmt, "push", 4) == 0
                    || strcmp(ins->fmt, "saveall") == 0)) {
            ins = ins->next;
        }
        spill_ins = iNEW(interpreter, unit, p31, str_dup("PerlArray"), NULL, 0);
        insert_ins(unit, ins, spill_ins);
    }
    else
        p31 = unit->p31;

    for (ins = unit->instructions; ins; ins = ins->next) {
	needs_store = 0;
	needs_fetch = 0;

	if (instruction_reads (ins, old_sym) && !(ins->flags & ITSPILL))
	    needs_fetch = 1;

	if (instruction_writes (ins, old_sym) && !(ins->flags & ITSPILL))
	    needs_store = 1;
        if (dl)
            ins->index += dl;

	if (needs_fetch) {
	    regs[0] = new_sym;
            regs[1] = p31;
            sprintf(buf, "%d", unit->n_spilled);
            regs[2] = mk_const(interpreter, str_dup(buf), 'I');
	    sprintf(buf, "%%s, %%s[%%s]   #FETCH %s", old_sym->name);
	    tmp = INS(interpreter, unit, "set", buf, regs, 3, 4, 0);
	    tmp->bbindex = ins->bbindex;
            tmp->flags |= ITSPILL;
            tmp->index = ins->index;
            ins->index++;
            /* insert tmp before actual ins */
            insert_ins(unit, ins->prev, tmp);
            dl++;
	}
        /* change all occurance of old_sym to new */
        for (i = 0; old_sym != new_sym && ins->r[i] &&
                i < IMCC_MAX_REGS; i++)
            if (ins->r[i] == old_sym)
                ins->r[i] = new_sym;
	if (needs_store) {
            regs[0] = p31;
            sprintf(buf, "%d", unit->n_spilled);
            regs[1] = mk_const(interpreter, str_dup(buf), 'I');
	    regs[2] = new_sym;
	    sprintf(buf, "%%s[%%s], %%s   #SPILL %s", old_sym->name);
	    tmp = INS(interpreter, unit, "set", buf, regs, 3, 2, 0);
	    tmp->bbindex = ins->bbindex;
            tmp->flags |= ITSPILL;
            /* insert tmp after ins */
            insert_ins(unit, ins, tmp);
            tmp->index = ins->index + 1;
            dl++;
	}
        if (needs_fetch || needs_store) {
#if ! DOIT_AGAIN_SAM
            /* update life info of prev sym */
            update_life(interpreter, unit, ins, new_sym, needs_fetch, needs_store,
                    old_sym != new_sym);
            /* and interference of both */
            update_interference(interpreter, unit, old_sym, new_sym);
#endif
            /* if all symbols are in one basic_block, we need a new
             * symbol, so that the life_ranges are minimal
             * It would be nice to detect when changing the symbol
             * is necessary.
             */
            sprintf(buf, "%s_%d", old_sym->name, n++);
            new_sym = mk_symreg(interpreter, str_dup(buf), old_sym->set);
            new_sym->usage |= U_SPILL;
            if (needs_store)    /* advance past store */
                ins = tmp;
        }
    }

    free(buf);

#if DOIT_AGAIN_SAM
    /* update index */
    for (i = 0, ins = unit; ins; ins = ins->next) {
	ins->index = i++;
    }
#endif
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_instructions(interpreter, unit);

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
