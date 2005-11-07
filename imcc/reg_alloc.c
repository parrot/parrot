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
static void compute_spilling_costs (Parrot_Interp, IMC_Unit *);
static void order_spilling (IMC_Unit *);
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
    int first;
    char *function;

    if (!unit)
        return;
    if (!unit->instructions)
        return;
    imc_stat_init(unit);
    if (!(IMCC_INFO(interpreter)->optimizer_level &
                (OPT_PRE|OPT_CFG|OPT_PASM)) && unit->pasm_file)
        goto done;

    imcc_init_tables(interpreter);
    IMCC_INFO(interpreter)->allocated = 0;

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

    if (IMCC_INFO(interpreter)->optimizer_level == OPT_PRE &&
            unit->pasm_file) {
        while (pre_optimize(interpreter, unit))
            ;
        goto done;
    }

    nodeStack = imcstack_new();

    /* build CFG and life info, and optimize iteratively */
    do {
        first = 1;
        do {
            while (pre_optimize(interpreter, unit));

            find_basic_blocks(interpreter, unit, first);
            build_cfg(interpreter, unit);
            first = 0;
        } while (cfg_optimize(interpreter, unit));

        compute_dominators(interpreter, unit);
        compute_dominance_frontiers(interpreter, unit);
        find_loops(interpreter, unit);

        build_reglist(interpreter, unit, 1);
        life_analysis(interpreter, unit);
    } while (!IMCC_INFO(interpreter)->dont_optimize &&
            optimize(interpreter, unit));

    graph_coloring_reg_alloc(interpreter, unit);

    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_instructions(interpreter, unit);
    imcstack_free(nodeStack);
done:
    if (IMCC_INFO(interpreter)->verbose  ||
            (IMCC_INFO(interpreter)->debug & DEBUG_IMC)) {
        print_stat(interpreter, unit);
    }
    else {
        make_stat(unit, NULL, unit->n_regs_used);
    }
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

    build_interference_graph(interpreter, unit);
    if (IMCC_INFO(interpreter)->optimizer_level & OPT_SUB)
        allocate_wanted_regs(unit);
    compute_spilling_costs(interpreter, unit);
    order_spilling(unit);          /* put the remaining items on stack */

    try_allocate(interpreter, unit);
    IMCC_INFO(interpreter)->allocated = 1;
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
    SymHash *hsh = &unit->hash;
    SymReg * r;

    for (i = 0; i < hsh->size; i++) {
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->color > unit->max_color)
                unit->max_color = r->color;
            for (j = 0; j < 4; j++)
                if (r->set == type[j] && (r->type & VTREGISTER)) {
                    if (sets)
                        sets[j]++;
                    if (cols)
                        if (r->color > cols[j])
                            cols[j] = r->color;
                }
        }
    }
    if (cols) {
        for (j = 0; j < 4; j++)
            ++cols[j];
    }
}

/* registes usage of .imc */
static void
imc_stat_init(IMC_Unit * unit)
{
    int j;

    make_stat(unit, unit->n_vars_used, NULL);
    for (j = 0; j < 4; j++)
        unit->n_regs_used[j] = -1;
    /*
     * TODO move statistic into unit
     */
    memset(&ostat, 0, sizeof(ostat));
}

/* and final */
static void
print_stat(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int sets[4] = {0,0,0,0};

    char *function = unit->instructions->r[0]->name;

    make_stat(unit, sets, unit->n_regs_used);
    IMCC_info(interpreter, 1,
            "sub %s:\n\tregisters in .imc:\t I%d, N%d, S%d, P%d\n",
            function,
            unit->n_vars_used[0], unit->n_vars_used[1],
            unit->n_vars_used[2], unit->n_vars_used[3]);
    IMCC_info(interpreter, 1,
            "\t%d labels, %d lines deleted, "
            "%d if_branch, %d branch_branch\n",
            ostat.deleted_labels, ostat.deleted_ins, ostat.if_branch,
            ostat.branch_branch);
    IMCC_info(interpreter, 1, "\t%d used once deleted\n",
            ostat.used_once);
    IMCC_info(interpreter, 1, "\t%d invariants_moved\n",
            ostat.invariants_moved);
    IMCC_info(interpreter, 1, "\tregisters needed:\t I%d, N%d, S%d, P%d\n",
            sets[0], sets[1], sets[2], sets[3]);
    IMCC_info(interpreter, 1,
            "\tregisters in .pasm:\t I%d, N%d, S%d, P%d - %d\n",
            unit->n_regs_used[0], unit->n_regs_used[1],
            unit->n_regs_used[2], unit->n_regs_used[3]);
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
 *
 */

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
    SymHash *hsh = &unit->hash;
    SymReg * r;

    UNUSED(first);
    IMCC_info(interpreter, 2, "build_reglist\n");
    /* count symbols */
    if (unit->reglist)
        free_reglist(unit);
    count = unit->hash.entries;
    if (count == 0)
        return;
    unit->reglist = mem_sys_allocate(count * sizeof(SymReg*));

    for (i = count = 0; i < hsh->size; i++) {
        for (r = hsh->data[i]; r; r = r->next) {
            /* Add each symbol to reglist  */
            if (r->type & VTREGISTER) {
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
                for (k = 0; k < ins->n_r; k++)
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

#if 0
        /* If they only overlap one instruction and one is used RHS only
         * and the other LHS, then that's ok
         * same if both are LHS
         *
         * XXX While the idea is ok, the following tests are wrong
         * see imcc/t/reg/alloc_2
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
    int c;

    UNUSED(interpreter);
    UNUSED(x);
    for (c = 1; c <= unit->n_symbols; c++)
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
    char *avail;
    int t, n;
    unsigned int *graph = unit->interference_graph;
    SymReg ** reglist = unit->reglist;

    /*
     * unit->n_symbols should be an upper limit of needed colors
     */
    n = unit->n_symbols;
    if (unit->max_color > n)
        n = unit->max_color;
    avail = mem_sys_allocate(n + 1);

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
                    mem_sys_free(avail);
                    return x;
                }
            }
        }
    }

    mem_sys_free(avail);
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
    memset(avail, 1, n_symbols + 1);
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

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
