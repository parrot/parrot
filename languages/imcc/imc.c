/* Register allocator:
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
# define MAX_COLOR 8
#endif

static void make_stat(int *sets, int *cols);
static void imc_stat_init(void);
static void print_stat(void);

extern int pasm_file;
/* Globals: */

static IMCStack nodeStack;

/* allocate is the main loop of the allocation algorithm */
void allocate(struct Parrot_Interp *interpreter) {
    int to_spill;
    int todo, first;

    if (!instructions)
        return;
    if (!optimizer_level && pasm_file)
        return;

    init_tables(interpreter);
    allocated = 0;

    debug(DEBUG_IMC, "\n------------------------\n");
    debug(DEBUG_IMC, "processing sub %s\n", function);
    debug(DEBUG_IMC, "------------------------\n\n");
    if (IMCC_VERBOSE || (IMCC_DEBUG & DEBUG_IMC))
        imc_stat_init();

    /* consecutive labels, if_branch, unused_labels ... */
    pre_optimize(interpreter);
    if (optimizer_level == OPT_PRE && pasm_file)
        return;

    nodeStack = imcstack_new();
    n_spilled = 0;

    todo = first = 1;
    while (todo) {
        find_basic_blocks();
        build_cfg();

        if (first && (IMCC_DEBUG & DEBUG_CFG))
            dump_cfg();
        first = 0;
        todo = cfg_optimize(interpreter);
    }

    todo = first = 1;
    while (todo) {
        if (!first) {
            find_basic_blocks();
            build_cfg();
        }
        first = 0;

        compute_dominators();
        find_loops();

        build_reglist();
        life_analysis();
        /* optimize, as long as there is something to do */
        if (dont_optimize)
            todo = 0;
        else {
            todo = optimize(interpreter);
        }
    }
    todo = 1;
    while (todo) {
        build_interference_graph();
        compute_spilling_costs();
        /* simplify until no changes can be made */
        /* while (simplify()) {} */
        order_spilling();          /* put the remaining items on stack */

        to_spill = try_allocate();
        allocated = 1;

        if ( to_spill >= 0 ) {
            allocated = 0;
            spill(interpreter, to_spill);
            /*
             * build the new cfg/reglist on the fly in spill() and
             * do life analysis there for only the involved regs
             */
#if DOIT_AGAIN_SAM
            find_basic_blocks();
            build_cfg();
            build_reglist();
            life_analysis();
#endif
        }
        else {
            /* the process is finished */
            todo = 0;
        }
    }
    if (IMCC_DEBUG & DEBUG_IMC)
        dump_instructions();
    if (IMCC_VERBOSE  || (IMCC_DEBUG & DEBUG_IMC))
        print_stat();
    imcstack_free(nodeStack);
}

void free_reglist() {
    if (interference_graph) {
        free(interference_graph);
        interference_graph = 0;
    }
    if (reglist) {
        int i;
        for (i = 0; i < n_symbols; i++)
            free_life_info(reglist[i]);
        free(reglist);
        reglist = NULL;
        n_symbols = 0;
    }
}

/* some statistics about register usage
 * printed with --verbose --verbose
 */
static void make_stat(int *sets, int *cols)
{
    /* register usage summary */
    char type[] = "INSP";
    int i, j;
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next)
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
static void imc_stat_init() {
    imcsets[0] = imcsets[1] = imcsets[2] = imcsets[3] = 0;
    make_stat(imcsets, 0);
    memset(&ostat, 0, sizeof(ostat));
}

/* and final */
static void print_stat()
{
    int sets[4] = {0,0,0,0};
    int cols[4] = {-1,-1,-1,-1};

    make_stat(sets, cols);
    info(1, "sub %s:\n\tregisters in .imc:\t I%d, N%d, S%d, P%d\n",
            function, imcsets[0], imcsets[1], imcsets[2], imcsets[3]);
    info(1, "\t%d labels, %d lines deleted, %d if_branch, %d branch_branch\n",
            ostat.deleted_labels, ostat.deleted_ins, ostat.if_branch,
            ostat.branch_branch);
    info(1, "\t%d used once deleted\n",
            ostat.used_once);
    info(1, "\t%d invariants_moved\n", ostat.invariants_moved);
    info(1, "\tregisters needed:\t I%d, N%d, S%d, P%d\n",
            sets[0], sets[1], sets[2], sets[3]);
    info(1, "\tregisters in .pasm:\t I%d, N%d, S%d, P%d - %d spilled\n",
            cols[0]+1, cols[1]+1, cols[2]+1, cols[3]+1, n_spilled);
    info(1, "\t%d basic_blocks, %d edges\n",
            n_basic_blocks, edge_count());

}

/* sort list by line  nr */
static int reg_sort_f(const void *a, const void *b) {
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

static void sort_reglist(void)
{
    qsort(reglist, n_symbols, sizeof(SymReg*), reg_sort_f);
}
/* make a linear list of IDENTs and VARs, set n_symbols */

void build_reglist(void) {
    int i, count, unused;

    info(2, "build_reglist\n");
    /* count symbols */
    if (reglist)
        free_reglist();
    for(i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
        for(; r; r = r->next)
            if(r->type & VTREGISTER)
                count++;
    }
    n_symbols = count;
    if (count == 0)
        return;
    if (n_symbols >= HASH_SIZE)
        warning("build_reglist", "probably too small HASH_SIZE"
                " (%d symbols)\n");
    reglist = calloc(n_symbols, sizeof(SymReg*));
    if (reglist == NULL) {
        fatal(1, "build_reglist","Out of mem\n");
    }

    for(i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
        /* Add each symbol to reglist  */
        for(; r; r = r->next) {
            if(r->type & VTREGISTER) {
                if (r->type & VT_REGP)
                    reglist[count++] = r->reg;
                else
                    reglist[count++] = r;
                /* rearange I/N registers
                 * XXX not here, do it, when reading the source
                 * .nciarg, ... !!!1 */
                if ((optimizer_level & OPT_PASM) && pasm_file &&
                        (reglist[count-1]->set == 'I' ||
                        reglist[count-1]->set == 'N'))
                    reglist[count-1]->color = -1;
            }
        }
    }
    compute_du_chain();
    /* we might have unused symbols here, from spilling */
    for (i = count = unused = 0; i < n_symbols; i++) {
        if (!reglist[i]->first_ins)
            unused++;
        else if (i == count)
            count++;
        else
            reglist[count++] = reglist[i];
    }
    n_symbols -= unused;
    sort_reglist();
}

/* creates the interference graph between the variables.
 *
 * two variables interfere when they are alive at the
 * same time
 */

void
build_interference_graph()
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

    /* Calculate interferences between each chain and populate the the Y-axis */
    for (x = 0; x < n_symbols; x++) {
        if (!reglist[x]->first_ins)
            continue;
        for (y = x + 1; y < n_symbols; y++) {
            if (!reglist[y]->first_ins)
                continue;
            if (interferes(reglist[x], reglist[y])) {
                interference_graph[x*n_symbols+y] = reglist[y];
                interference_graph[y*n_symbols+x] = reglist[x];
            }
        }
    }

    if (IMCC_DEBUG & DEBUG_IMC) {
        dump_interference_graph();
    }
}


static void compute_one_du_chain(SymReg * r);
/* Compute a DU-chain for each symbolic
 */
void compute_du_chain() {
    Instruction * ins, *lastbranch;
    int i;

    lastbranch = 0;

    /* Compute last branch in this procedure, update instruction index */
    for(i = 0, ins = instructions; ins; ins = ins->next) {
        ins->index = i++;
        if(ins->type == ITBRANCH)
            lastbranch = ins;
    }

    /* Compute du-chains for all symbolics */
    for(i = 0; i < n_symbols; i++) {
        SymReg * r = reglist[i];
        compute_one_du_chain(r);
        /* what is this used for? -lt */
        if(r->type == VTIDENTIFIER
                && lastbranch
                && r->last_ins
                && r->last_ins->index < lastbranch->index)
            r->last_ins = lastbranch;
    }
}

static void compute_one_du_chain(SymReg * r) {
    Instruction * ins;

    /* We cannot rely on computing the value of r->first when parsing,
     * since the situation can be changed at any time by the register
     * allocation algorithm
     */

    r->first_ins = 0;
    r->use_count = r->lhs_use_count = 0;
    for(ins = instructions; ins; ins = ins->next) {
        int ro, rw;
        ro = instruction_reads(ins, r);
        rw = instruction_writes(ins, r);
        if(ro || rw) {
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

void compute_spilling_costs () {
    int depth, i, j, k, max_depth;
    SymReg *r;
    Instruction * ins;

    for(i = 0; i < n_symbols; i++) {
        r = reglist[i];
        r->score = r->use_count + (r->lhs_use_count << 2);
        /* TODO score high if -Oj and register is used in
         * JITtable instruction
         */
        /* r->score *= (r->jit_usage - r->use_count + 1) */
        /* TODO rewrite this O(n_ins * n_reg) alg:
         * - store max_depth in reg
         * - store a flag, when this reg was already spilled
         */
        for (j = max_depth = 0; j < n_basic_blocks; j++) {
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
                depth = bb_list[j]->loop_depth;
                if (depth > max_depth)
                    max_depth = depth;
            }
        }
        r->score += 1000 * max_depth;
done:
    }

    if (IMCC_DEBUG & DEBUG_IMC)
        dump_symreg();

}
/* See if r0's chain interferes with r1. */
/* We currently decide that two vars interfere if they are both alive
 * at any point. This could be improved, requiring that one is alive
 * at the point of _definition_ of the other.
 */

int interferes(SymReg * r0, SymReg * r1) {

    int i;

    /* Register doesn't interfere with itself, and register sets
     * don't interfere with each other.
     */
    if(r0 == r1) return 0;
    else if(r0->set != r1->set) return 0;

    /* if the first time r0 appears is after (or in the same instruction)
     * than the last appearance of r1, then they can't interfere.
     *
     * even if r0 and r1 are called in the same instruction, and even
     * if this instrucion does modify r0, if it's value is never used
     * later, then they can share the same register
     */

    /* If symbol was never used in a statment, it can't interfere */
    if(!r0->first_ins || !r1->first_ins)
	return 0;

    /* Now: */

    if (r0->life_info == NULL || r1->life_info == NULL) {
	fatal(1, "interferes", "INTERNAL ERROR: Life range is NULL\n");
    }

    for (i=0; i < n_basic_blocks; i++) {
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

int simplify (){
    int changes = 0;
    int x;
    SymReg **g;

    g = reglist;

    for(x = 0; x < n_symbols; x++) {
        if (g[x]->color >= 0)   /* VTPASM */
            g[x]->simplified = 1;
    }
    for(x = 0; x < n_symbols; x++) {
	if (g[x]->simplified) {
            break;
	}

	if ( neighbours(x) < MAX_COLOR) {
            debug(DEBUG_IMC, "#simplifying [%s]\n", g[x]->name);

	    imcstack_push(nodeStack, x);

	    g[x]->simplified = 1;
	    changes = 1;
	    break;
	}
    }

    return changes;
}

/* Puts the remaining nodes on the stack, on the correct order.
 *
 * We count how many times does a symbol appear (weighted by the probability
 * that this particular point of code will be reached) and choose the symbol
 * with the lower score until all are in the stack.
 *
 */

void order_spilling () {
    int min_score = 0, total_score;
    int min_node;
    int x;

    while (1) {

	min_node = -1;

        for(x = 0; x < n_symbols; x++) {

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
	    if (!(reglist[x]->simplified)) {
	        total_score = reglist[x]->score - neighbours(x);

                if ( (min_node == -1) || (min_score > total_score) )  {
    	           min_node  = x;
	           min_score = total_score;
	        }
	    }
        }

	if (min_node == -1) return; /* We are finished */

	imcstack_push(nodeStack, min_node);
	reglist[min_node]->simplified = 1;
    }
}


void restore_interference_graph() {
    int i;
    for (i=0; i < n_symbols; i++) {
        if ((reglist[i]->type & VTPASM) && !(optimizer_level & OPT_PASM))
            continue;
	reglist[i]->color = -1;
	reglist[i]->simplified = 0;
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

int try_allocate() {
    int x = 0;
    int color, colors[MAX_COLOR];
    int free_colors, t;
    SymReg ** graph = interference_graph;

    while ((imcstack_depth(nodeStack) > 0) ) {
	x=imcstack_pop(nodeStack);

	for(t = 0; t < 4; t++) {
	    int typ = "INSP"[t];
	    memset(colors, 0, sizeof(colors));
	    if (reglist[x]->set == typ && reglist[x]->color == -1) {
		free_colors = map_colors(x, graph, colors, typ);
		if (free_colors > 0) {
		    for(color = 0; color < MAX_COLOR - (typ=='P'); color++) {
			if(!colors[color]) {
			    reglist[x]->color = color;

                            debug(DEBUG_IMC, "#[%s] provisionally gets color [%d]"
                                     "(%d free colors, score %d)\n",
					reglist[x]->name, color,
                                        free_colors, reglist[x]->score);
			    break;
			}
		    }
		}

		if (reglist[x]->color == -1) {
                    debug(DEBUG_IMC, "# no more colors free = %d\n", free_colors);

		    /* It has been impossible to assign a color
                     * to this node, return it so it gets spilled
                     */

		    restore_interference_graph();
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
int map_colors(int x, SymReg ** graph, int colors[], int typ) {
    int y = 0;
    SymReg * r;
    int color, free_colors;
    memset(colors, 0, sizeof(colors[0]) * MAX_COLOR);
    for(y = 0; y < n_symbols; y++) {
        if((r = graph[x*n_symbols+y])
    	    && r->color != -1
	    && r->set == typ) {
    	    colors[r->color] = 1;
    	}
    }
    for(color = free_colors = 0; color < MAX_COLOR - (typ=='P'); color++)
	if(!colors[color])
	    free_colors++;
    return free_colors;
}

#if ! DOIT_AGAIN_SAM
/* update bb and life_info after spilling
 * this saves 4 costy routines
 * NOTE {lhs_,}use_count are not set again, this is save, when no
 *      further optimization pass follows
 */
static void
update_life(Instruction *ins, SymReg *r, int needs_fetch, int needs_store,
        int add)
{
    Life_range *l;
    int i;

    /* add this sym to reglist, if not there */
    if (add) {
        reglist = realloc(reglist, (n_symbols + 1) * sizeof(SymReg *));
        reglist[n_symbols++] = r;
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
    free_life_info(r);
    r->life_info = calloc(n_basic_blocks, sizeof(Life_range*));
    for (i=0; i < n_basic_blocks; i++)
        make_life_range(r, i);
    l = r->life_info[ins->bbindex];
    l->first_ins = r->first_ins;
    l->last_ins = r->last_ins;
}
#endif

/* Rewrites the instructions list, inserting spill code in every ocurrence
 * of the symbol.
 */

void spill(struct Parrot_Interp *interpreter, int spilled) {

    Instruction * tmp, *ins;
    int i, n, dl;
    int needs_fetch, needs_store;
    SymReg * old_symbol, *p31, *new_symbol;
    char * buf;
    SymReg *regs[IMCC_MAX_REGS];

    buf = malloc(256 * sizeof(char));
    if (buf == NULL) {
	fatal(1, "spill","Out of mem\n");
    }

    debug(DEBUG_IMC, "#Spilling [%s]:\n", reglist[spilled]->name);

    new_symbol = old_symbol = reglist[spilled];
    if (old_symbol->usage & U_SPILL)
        fatal(1, "spill", "double spill - program too complex\n");
    new_symbol->usage |= U_SPILL;
    p31 = mk_pasm_reg(str_dup("P31"));

    n_spilled++;
    n = 0;
    dl = 0;     /* line corr */
    tmp = NULL;

    for(ins = instructions; ins; ins = ins->next) {

	needs_store = 0;
	needs_fetch = 0;

	if (instruction_reads (ins, old_symbol) && !(ins->flags & ITSPILL))
	    needs_fetch = 1;

	if (instruction_writes (ins, old_symbol) && !(ins->flags & ITSPILL))
	    needs_store = 1;
        if (dl)
            ins->index += dl;

	if (needs_fetch) {
	    regs[0] = new_symbol;
            regs[1] = p31;
            sprintf(buf, "%d", n_spilled);
            regs[2] = mk_const(str_dup(buf), 'I');
	    sprintf(buf, "%%s, %%s[%%s] #FETCH %s", old_symbol->name);
	    tmp = INS(interpreter, "set", buf, regs, 3, 4, 0);
	    tmp->bbindex = ins->bbindex;
            tmp->flags |= ITSPILL;
            tmp->index = ins->index;
            ins->index++;
            /* insert tmp before actual ins */
            insert_ins(ins->prev, tmp);
            dl++;
	}
        /* change all occurance of old_symbol to new */
        for (i = 0; old_symbol != new_symbol && ins->r[i] &&
                i < IMCC_MAX_REGS; i++)
            if (ins->r[i] == old_symbol)
                ins->r[i] = new_symbol;
	if (needs_store) {
            regs[0] = p31;
            sprintf(buf, "%d", n_spilled);
            regs[1] = mk_const(str_dup(buf), 'I');
	    regs[2] = new_symbol;
	    sprintf(buf, "%%s[%%s], %%s #STORE %s", old_symbol->name);
	    tmp = INS(interpreter, "set", buf, regs, 3, 2, 0);
	    tmp->bbindex = ins->bbindex;
            tmp->flags |= ITSPILL;
            /* insert tmp after ins */
            insert_ins(ins, tmp);
            tmp->index = ins->index + 1;
            dl++;
	}
        /* if all symbols are in one basic_block, we need a new
         * symbol, so that the life_ranges are minimal
         * It would be nice, to detect, when changing the symbol
         * is necessary.
         */
        if (needs_fetch || needs_store) {
#if ! DOIT_AGAIN_SAM
            /* update life info of prev sym */
            update_life(ins, new_symbol, needs_fetch, needs_store,
                    old_symbol != new_symbol);
#endif
            sprintf(buf, "%s_%d", old_symbol->name, n++);
            new_symbol = mk_symreg(str_dup(buf), old_symbol->set);
            new_symbol->usage |= U_SPILL;
            if (needs_store)    /* advance past store */
                ins = tmp;
        }
    }

    free(buf);

#if DOIT_AGAIN_SAM
    /* update index */
    for(i = 0, ins = instructions; ins; ins = ins->next) {
	ins->index = i++;
    }
#endif
    if (IMCC_DEBUG & DEBUG_IMC)
        dump_instructions();

}

int neighbours(int node) {
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
 * Utility functions
 */


char * str_dup(const char * old) {
    char * copy = (char *)malloc(strlen(old) + 1);
    if (copy == NULL) {
        fatal(1, "str_dup", "Out of mem\n");
    }
    strcpy(copy, old);
#ifdef MEMDEBUG
    debug(1,"line %d str_dup %s [%x]\n", line, old, copy);
#endif
    return copy;
}

char * str_cat(const char * s1, const char * s2) {
    int len = strlen(s1) + strlen(s2) + 1;
    char * s3 = malloc(len);
    if (s3 == NULL) {
        fatal(1, "str_cat", "Out of mem\n");
    }
    strcpy(s3, s1);
    strcat(s3, s2);
    return s3;
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
