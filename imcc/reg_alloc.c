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
# define MAX_COLOR 4
#endif

static void make_stat(IMC_Unit *, int *sets, int *cols);
static void imc_stat_init(IMC_Unit *);
static void print_stat(Parrot_Interp, IMC_Unit *);
static void allocate_wanted_regs(IMC_Unit *);
static void build_reglist(Parrot_Interp, IMC_Unit * unit);
static void build_interference_graph(Parrot_Interp, IMC_Unit *);
static void compute_du_chain(IMC_Unit * unit);
static void compute_one_du_chain(SymReg * r, IMC_Unit * unit);
static int interferes(IMC_Unit *, SymReg * r0, SymReg * r1);
static int map_colors(int x, SymReg ** graph, int colors[], int typ);
#ifdef DO_SIMPLIFY
static int simplify (IMC_Unit *);
#endif
static void compute_spilling_costs (Parrot_Interp, IMC_Unit *);
static void order_spilling (IMC_Unit *);
static void spill (struct Parrot_Interp *, IMC_Unit * unit, int);
static int try_allocate(Parrot_Interp, IMC_Unit *);
static void restore_interference_graph(IMC_Unit *);
static int neighbours(int node);

extern int pasm_file;
/* XXX FIXME: Globals: */

static IMCStack nodeStack;
static SymReg** interference_graph;
/*
static SymReg** reglist;
*/
static int n_symbols;

/* imc_reg_alloc is the main loop of the allocation algorithm. It operates
 * on a single compilation unit at a time.
 */
void
imc_reg_alloc(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    int to_spill;
    int todo, first;

    if (!unit)
        return;
    if (!optimizer_level && pasm_file)
        return;

    init_tables(interpreter);
    allocated = 0;

#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: imc_reg_alloc\n");
    if (unit->instructions->r[1] && unit->instructions->r[1]->pcc_sub) {
        fprintf(stderr, "img_reg_alloc: pcc_sub (nargs = %d)\n",
            unit->instructions->r[1]->pcc_sub->nargs);
    }
#endif

    debug(interpreter, DEBUG_IMC, "\n------------------------\n");
    debug(interpreter, DEBUG_IMC, "processing sub %s\n", function);
    debug(interpreter, DEBUG_IMC, "------------------------\n\n");
    if (IMCC_INFO(interpreter)->verbose ||
            (IMCC_INFO(interpreter)->debug & DEBUG_IMC))
        imc_stat_init(unit);

    /* consecutive labels, if_branch, unused_labels ... */
    pre_optimize(interpreter, unit);
    if (optimizer_level == OPT_PRE && pasm_file)
        return;

    nodeStack = imcstack_new();
    unit->n_spilled = 0;

    todo = first = 1;
    while (todo) {
        find_basic_blocks(interpreter, unit, first);
        build_cfg(interpreter, unit);

        if (first && (IMCC_INFO(interpreter)->debug & DEBUG_CFG))
            dump_cfg(unit);
        first = 0;
        todo = cfg_optimize(interpreter, unit);
    }

    todo = first = 1;
    while (todo) {
        if (!first) {
            find_basic_blocks(interpreter, unit, 0);
            build_cfg(interpreter, unit);
        }
        first = 0;

        compute_dominators(interpreter, unit);
        find_loops(interpreter, unit);

        build_reglist(interpreter, unit);
        life_analysis(interpreter, unit);
        /* optimize, as long as there is something to do */
        if (dont_optimize)
            todo = 0;
        else {
            todo = optimize(interpreter, unit);
            if (todo)
                pre_optimize(interpreter, unit);
        }
    }
    todo = 1;
#if !DOIT_AGAIN_SAM
    build_interference_graph(interpreter, unit);
#endif
    while (todo) {
#if DOIT_AGAIN_SAM
        build_interference_graph(interpreter, unit);
#endif
        if (optimizer_level & OPT_SUB)
            allocate_wanted_regs(unit);
        compute_spilling_costs(interpreter, unit);
#ifdef DO_SIMPLIFY
        /* simplify until no changes can be made */
        while (simplify(unit)) {}
#endif
        order_spilling(unit);          /* put the remaining items on stack */

        to_spill = try_allocate(interpreter, unit);
        allocated = 1;

        if ( to_spill >= 0 ) {
            allocated = 0;
            spill(interpreter, unit, to_spill);
            /*
             * build the new cfg/reglist on the fly in spill() and
             * do life analysis there for only the involved regs
             */
#if DOIT_AGAIN_SAM
            find_basic_blocks(interpreter, unit, 0);
            build_cfg(interpreter, unit);
            build_reglist(interpreter, unit);
            life_analysis(interpreter);
#endif
        }
        else {
            /* the process is finished */
            todo = 0;
        }
    }
    if (optimizer_level & OPT_SUB)
        sub_optimize(interpreter, unit);
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_instructions(unit);
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
    if (interference_graph) {
        free(interference_graph);
        unit->interference_graph = interference_graph = 0;
    }
    if (unit->reglist) {
        int i;
        for (i = 0; i < n_symbols; i++)
            free_life_info(unit, unit->reglist[i]);
        free(unit->reglist);
        unit->reglist = NULL;
        unit->n_symbols = n_symbols = 0;
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

    make_stat(unit, sets, cols);
    info(interpreter, 1, "sub %s:\n\tregisters in .imc:\t I%d, N%d, S%d, P%d\n",
            function, imcsets[0], imcsets[1], imcsets[2], imcsets[3]);
    info(interpreter, 1, "\t%d labels, %d lines deleted, %d if_branch, %d branch_branch\n",
            ostat.deleted_labels, ostat.deleted_ins, ostat.if_branch,
            ostat.branch_branch);
    info(interpreter, 1, "\t%d used once deleted\n",
            ostat.used_once);
    info(interpreter, 1, "\t%d invariants_moved\n", ostat.invariants_moved);
    info(interpreter, 1, "\tregisters needed:\t I%d, N%d, S%d, P%d\n",
            sets[0], sets[1], sets[2], sets[3]);
    info(interpreter, 1, "\tregisters in .pasm:\t I%d, N%d, S%d, P%d - %d spilled\n",
            cols[0]+1, cols[1]+1, cols[2]+1, cols[3]+1,
            unit->n_spilled);
    info(interpreter, 1, "\t%d basic_blocks, %d edges\n",
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
sort_reglist(SymReg ** reglist)
{
    qsort(reglist, n_symbols, sizeof(SymReg*), reg_sort_f);
}

/* make a linear list of IDENTs and VARs, set n_symbols */

static void
build_reglist(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int i, count, unused;

    info(interpreter, 2, "build_reglist\n");
    /* count symbols */
    if (unit->reglist)
        free_reglist(unit);
    for (i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
        for (; r; r = r->next)
            if (r->type & VTREGISTER)
                count++;
    }
    n_symbols = count;
    if (count == 0)
        return;
    if (n_symbols >= HASH_SIZE)
        warning(interpreter, "build_reglist", "probably too small HASH_SIZE"
                " (%d symbols)\n");
    unit->reglist = calloc(n_symbols, sizeof(SymReg*));
    if (unit->reglist == NULL) {
        fatal(1, "build_reglist","Out of mem\n");
    }

    for (i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
        /* Add each symbol to reglist  */
        for (; r; r = r->next) {
            if (r->type & VTREGISTER) {
                if (r->type & VT_REGP)
                    unit->reglist[count++] = r->reg;
                else
                    unit->reglist[count++] = r;
                /* rearange I/N registers
                 * XXX not here, do it, when reading the source
                 * .nciarg, ... !!!1 */
                if ((optimizer_level & OPT_PASM) && pasm_file &&
                        (unit->reglist[count-1]->set == 'I' ||
                        unit->reglist[count-1]->set == 'N'))
                    unit->reglist[count-1]->color = -1;
            }
        }
    }
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
    sort_reglist(unit->reglist);
}

/* creates the interference graph between the variables.
 *
 * two variables interfere when they are alive at the
 * same time
 */

static void
build_interference_graph(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int x, y;

    if (!n_symbols)
        return;

    /* Construct a graph N x N where N = number of symbolics.
     * This piece can be rewritten without the N x N array
     */
    interference_graph = calloc(n_symbols * n_symbols, sizeof(SymReg*));
    if (interference_graph == NULL)
        fatal(1, "build_interference_graph","Out of mem\n");
    unit->interference_graph = interference_graph;

    /* Calculate interferences between each chain and populate the the Y-axis */
    for (x = 0; x < n_symbols; x++) {
        /* If symbol was never used in a statment, it can't interfere */
        if (!unit->reglist[x]->first_ins)
            continue;
        for (y = x + 1; y < n_symbols; y++) {
            if (!unit->reglist[y]->first_ins)
                continue;
            if (interferes(unit, unit->reglist[x], unit->reglist[y])) {
                interference_graph[x*n_symbols+y] = unit->reglist[y];
                interference_graph[y*n_symbols+x] = unit->reglist[x];
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
    for (i = 0; i < n_symbols; i++) {
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

    for (i = 0; i < n_symbols; i++) {
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
interferes(IMC_Unit * unit, SymReg * r0, SymReg * r1)
{

    int i;

    /* Register doesn't interfere with itself
    */
    if (r0 == r1)
        return 0;

    /* different register sets don't interfer */
    if (r0->set != r1->set)
        return 0;
    /* if the first time r0 appears is after (or in the same instruction)
     * than the last appearance of r1, then they can't interfere.
     *
     * even if r0 and r1 are called in the same instruction, and even
     * if this instrucion does modify r0, if it's value is never used
     * later, then they can share the same register
     */

    /* Now: */

    if (r0->life_info == NULL || r1->life_info == NULL) {
        fatal(1, "interferes", "INTERNAL ERROR: Life range is NULL\n");
    }

    for (i=0; i < unit->n_basic_blocks; i++) {
        Life_range *l0, *l1;

        l0 = r0->life_info[i];
        l1 = r1->life_info[i];

        /* one or both are not alive in this block, so we have
         * no conflict
         */
        if (!l0->first_ins || !l1->first_ins)
            continue;

        /* if the registers don't overlap, i.e first_x > last_y
         * then no interference
         */
        if (l0->first_ins->index > l1->last_ins->index)
            continue;
        if (l1->first_ins->index > l0->last_ins->index)
            continue;

#if 1
        /* if they only overlap one instruction and one is used RHS only
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
            debug(interpreter, DEBUG_IMC, "#simplifying [%s]\n", g[x]->name);

	    imcstack_push(nodeStack, x);

	    g[x]->simplified = 1;
	    changes = 1;
	    break;
	}
    }

    return changes;
}
#endif

/* Puts the remaining nodes on the stack, on the correct order.
 *
 * We count how many times does a symbol appear (weighted by the probability
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

        for (x = 0; x < n_symbols; x++) {

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
	        total_score = unit->reglist[x]->score - neighbours(x);

                if ( (min_node == -1) || (min_score > total_score) )  {
    	           min_node  = x;
	           min_score = total_score;
	        }
	    }
        }

	if (min_node == -1) return; /* We are finished */

	imcstack_push(nodeStack, min_node);
	unit->reglist[min_node]->simplified = 1;
    }
}


static void
restore_interference_graph(IMC_Unit * unit)
{
    int i;
    for (i=0; i < n_symbols; i++) {
        if ((unit->reglist[i]->type & VTPASM) && !(optimizer_level & OPT_PASM))
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
    int i, y, interf;
    SymReg *r, *s;
    SymReg ** graph = interference_graph;

    for (i = 0; i < n_symbols; i++) {
        r = unit->reglist[i];
        if (r->color >= 0 || r->want_regno == -1)
            continue;
        interf = 0;
        for (y = 0; y < n_symbols; y++) {
            if ((s = graph[i*n_symbols+y])
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
 * Color the graph assigning registers to each symbol:
 *
 * We just proceed poping items from the stack, and assigning
 * a free color to the them.
 *
 * If we run out of colors, then we need to spill the top node.
 */

static int
try_allocate(Parrot_Interp interpreter, IMC_Unit * unit)
{
    int x = 0;
    int color, colors[MAX_COLOR];
    int free_colors, t;
    SymReg ** graph = interference_graph;
    SymReg ** reglist = unit->reglist;

    while ((imcstack_depth(nodeStack) > 0) ) {
	x=imcstack_pop(nodeStack);

	for (t = 0; t < 4; t++) {
	    int typ = "INSP"[t];
	    memset(colors, 0, sizeof(colors));
	    if (reglist[x]->set == typ && reglist[x]->color == -1) {
		free_colors = map_colors(x, graph, colors, typ);
		if (free_colors > 0) {
		    for (color = 0; color < MAX_COLOR; color++) {
                        int c = (color + 16) % 32;
			if (!colors[c]) {
			    reglist[x]->color = c;

                            debug(interpreter, DEBUG_IMC,
                                    "#[%s] provisionally gets color [%d]"
                                     "(%d free colors, score %d)\n",
					reglist[x]->name, c,
                                        free_colors, reglist[x]->score);
			    break;
			}
		    }
		}

		if (reglist[x]->color == -1) {
                    debug(interpreter, DEBUG_IMC, "# no more colors free = %d\n", free_colors);

		    /* It has been impossible to assign a color
                     * to this node, return it so it gets spilled
                     */

		    restore_interference_graph(unit);
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
static int
map_colors(int x, SymReg ** graph, int colors[], int typ)
{
    int y = 0;
    SymReg * r;
    int color, free_colors;
    memset(colors, 0, sizeof(colors[0]) * MAX_COLOR);
    /* reserved for spilling */
    if (typ == 'P')
        colors[31] = 1;
    for (y = 0; y < n_symbols; y++) {
        if ((r = graph[x*n_symbols+y])
    	    && r->color != -1
	    && r->set == typ) {
    	    colors[r->color] = 1;
    	}
    }
    for (color = free_colors = 0; color < MAX_COLOR; color++)
	if (!colors[color])
	    free_colors++;
    return free_colors;
}

#if ! DOIT_AGAIN_SAM
/* update bb and life_info after spilling
 * this saves 4 costy routines
 * NOTE {lhs_,}use_count are not set again, this is save, when no
 *      further optimization pass follows
 *
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
        unit->reglist = realloc(unit->reglist, (n_symbols + 1) * sizeof(SymReg *));
        unit->reglist[n_symbols++] = r;
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
        dump_instructions(unit);
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
    int x, y;
    SymReg ** reglist = unit->reglist;
    if (old != new) {
        /* n_symbols is already increased */
        SymReg ** new_graph = calloc(n_symbols * n_symbols, sizeof(SymReg*));
        /* old symbols count of previous graph */
        int o = n_symbols - 1;
        for (x = 0; x < o; x++) {
            for (y = x + 1; y < o; y++) {
                new_graph[x*n_symbols+y] = interference_graph[x*o+y];
                new_graph[y*n_symbols+x] = interference_graph[y*o+x];
            }
        }
        free(interference_graph);
        interference_graph = new_graph;
    }
    for (x = 0; x < n_symbols; x++) {
        for (y = x + 1; y < n_symbols; y++) {
            if (reglist[x] == old || reglist[x] == new ||
                    reglist[y] == old || reglist[y] == new) {
                if (interferes(unit, reglist[x], reglist[y])) {
                    interference_graph[x*n_symbols+y] = reglist[y];
                    interference_graph[y*n_symbols+x] = reglist[x];
                }
                else {
                    interference_graph[x*n_symbols+y] = NULL;
                    interference_graph[y*n_symbols+x] = NULL;
                }
            }
        }
    }
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC) {
        dump_interference_graph(unit);
    }
}
#endif

/* Rewrites the unit instructions, inserting spill code in every ocurrence
 * of the symbol.
 */

static void
spill(struct Parrot_Interp *interpreter, IMC_Unit * unit, int spilled)
{
    Instruction * tmp, *ins;
    int i, n, dl;
    int needs_fetch, needs_store;
    SymReg * old_sym, *p31, *new_sym;
    char * buf;
    SymReg *regs[IMCC_MAX_REGS];
    SymReg **reglist = unit->reglist;

    buf = malloc(256 * sizeof(char));
    if (buf == NULL) {
	fatal(1, "spill","Out of mem\n");
    }

    debug(interpreter, DEBUG_IMC, "#Spilling [%s]:\n", reglist[spilled]->name);

    new_sym = old_sym = reglist[spilled];
    if (old_sym->usage & U_SPILL)
        fatal(1, "spill", "double spill - program too complex\n");
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

        p31 = unit->p31 = mk_pasm_reg(str_dup("P31"));
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
            regs[2] = mk_const(str_dup(buf), 'I');
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
            regs[1] = mk_const(str_dup(buf), 'I');
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
             * It would be nice, to detect, when changing the symbol
             * is necessary.
             */
            sprintf(buf, "%s_%d", old_sym->name, n++);
            new_sym = mk_symreg(str_dup(buf), old_sym->set);
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
        dump_instructions(unit);

}

static int
neighbours(int node)
{
    int y, cnt;
    SymReg *r;

    cnt = 0;
    for (y = 0; y < n_symbols; y++) {

	if ( (r = interference_graph[node*n_symbols + y] ) &&
			(!r->simplified) ) {
	     cnt++;
	}
    }

    return cnt;
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
