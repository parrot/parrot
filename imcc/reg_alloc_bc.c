/*
 * reg_alloc.c - by Bill Coffman
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
 * Currently fails 2 tests:
 *
 * Failed 1/151 test scripts, 99.34% okay. 2/2527 subtests failed, 99.92% okay.
 * t/library/streams.t    2   512    20    2  10.00%  13 16
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


static void make_stat(IMC_Unit *, int *sets, int *cols);
static void imc_stat_init(IMC_Unit *);
static void print_stat(Parrot_Interp, IMC_Unit *);
static void allocate_wanted_regs(IMC_Unit *);
static void build_reglist(Parrot_Interp, IMC_Unit * unit, int);
static void compute_du_chain(IMC_Unit * unit);
static void compute_one_du_chain(SymReg * r, IMC_Unit * unit);
static int interferes(Interp*, IMC_Unit *, SymReg * r0, SymReg * r1);
static void compute_spilling_costs (Parrot_Interp, IMC_Unit *);

/***************** New graph algorithm stuff *********************/
typedef struct {
    int deg;     /* degree of node (# neighbors) */
    int col;     /* color assigned to this node */
    int id;      /* original index */
    char in;     /* boolean, indicating if removed yet */
} node;
typedef struct {
    int n;       /* number of nodes */
    int k;       /* maximum color used in graph (0 means uncolored) */
    node* V;     /* array of nodes */
    unsigned* E; /* edge data, adjacency matrix */
} graph;
static void build_interference_graph(Parrot_Interp, IMC_Unit*, graph* G);
static void ig_color_graph(Interp* interpreter, IMC_Unit*, graph*);
static void apply_coloring(Interp* interpreter, IMC_Unit*, graph*);
static void ig_precolor(Interp* interpreter, IMC_Unit*, graph*);
static int ig_init_graph(Interp* interpreter, IMC_Unit*, graph*);
static void ig_clear_graph(IMC_Unit*, graph*);
static int spill_registers(Interp *, IMC_Unit *, graph*);
/******************************************************************/

/*providing input of 0 forces the below dynamic function to kick in.*/
#ifndef BITS_PER_INT
#define BITS_PER_INT (sizeof(int)*8)
#endif
#define Bits_per_int() ((BITS_PER_INT) ? BITS_PER_INT : bits_per_int())
/*#define VALIDATE_COLORING*/

static unsigned int bits_per_int(void)
{
    unsigned int x = ~0;
    unsigned int j=0;
    while (x) { j++; x >>= 1; }
    return j;
}

static unsigned int* ig_get_word(int i, int j, int N, unsigned int* edgebits,
                                 int* bit_ofs)
{
    unsigned int bit = i * N + j;
    static unsigned int sizeofint = 0;   /* threadsafe */
    if (!sizeofint) sizeofint = Bits_per_int();
    *bit_ofs = bit % sizeofint;
    return &edgebits[bit / sizeofint];
}

static void ig_set(int i, int j, int N, unsigned int* edgebits)
{
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, edgebits, &bit_ofs);
    *word |= (1 << bit_ofs);
}

/* currently unused.
static void ig_clear(int i, int j, int N, unsigned int* edgebits)
{
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, edgebits, &bit_ofs);
    *word &= ~(1 << bit_ofs);
}
*/

int ig_test(int i, int j, int N, unsigned int* edgebits);
int ig_test(int i, int j, int N, unsigned int* edgebits)
{
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, edgebits, &bit_ofs);
    return *word & (1 << bit_ofs);
}

static unsigned int* ig_allocate(int N)
{
    /* size is N*N bits, but we want don't want to allocate a partial
     * word, so round up to the nearest multiple of sizeof(int).
     */
    int need_bits = N * N;
    int sizeofint = Bits_per_int();
    int num_words = (need_bits + sizeofint - 1) / sizeofint;
    return (unsigned int*) mem_sys_allocate_zeroed(num_words * sizeof(int));
}

/* imc_reg_alloc is the main loop of the allocation algorithm. It operates
 * on a single compilation unit at a time.
 */
void
imc_reg_alloc(Interp *interpreter, IMC_Unit * unit)
{
    int todo, first, loop_counter;
    graph G={0,0,NULL,NULL};
    char *function;

    if (!unit)
        return;
    if (!(IMCC_INFO(interpreter)->optimizer_level &
                    (OPT_PRE|OPT_CFG|OPT_PASM)) && unit->pasm_file)
        return;

    imcc_init_tables(interpreter);
    IMCC_INFO(interpreter)->allocated = 0;  /*global*/
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

    unit->n_spilled = 0;

    todo = first = 1;
    loop_counter = 0;
    while (todo) {
        loop_counter++;
        find_basic_blocks(interpreter, unit, first);
        build_cfg(interpreter, unit);

        if (first && (IMCC_INFO(interpreter)->debug & DEBUG_CFG))
            dump_cfg(unit);
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
        if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
            dump_symreg(unit);
        /* optimize, as long as there is something to do */
        if (IMCC_INFO(interpreter)->dont_optimize)
            todo = 0;
        else {
            todo = optimize(interpreter, unit);
            if (todo)
                pre_optimize(interpreter, unit);
        }
    }
    todo = 1;
    loop_counter = 0;

    if (!unit->n_symbols)
        return;
    build_interference_graph(interpreter, unit, &G);

#ifdef VALIDATE_COLORING
    {
        int x,y;
        for (x = 0; x < unit->n_symbols; x++) {
            SymReg* r = unit->reglist[x];
            for (y = 0; y < unit->n_symbols; y++) {
                if (ig_test(x, y, unit->n_symbols, unit->interference_graph)) {
                    if(r->color!=-1 && r->color == unit->reglist[y]->color)
                        fprintf(stderr,"node %d = %s(%c) is colored %d and "
                                "neighbor %d = %s(%c) is colored %d\n",
                                x,r->name,r->set,r->color,
                                y,unit->reglist[y]->name,unit->reglist[y]->set,
                                unit->reglist[y]->color);
                    assert(r->color==-1 || r->color != unit->reglist[y]->color);
                }
            }
        }
    }
#endif

    if (IMCC_INFO(interpreter)->optimizer_level & OPT_SUB)
        allocate_wanted_regs(unit);

    ig_precolor(interpreter, unit, &G);
    ig_color_graph(interpreter, unit, &G);

    /*
     * Use colors from G to allocate registers and spill the high colors.
     */
    while (G.k > MAX_COLOR) {  /* inside this loop, we must spill */
        IMCC_debug(interpreter, DEBUG_SPILL, "Spilling symbols: at least %d\n",
                G.k-MAX_COLOR);
        /*compute_spill_benefit(interpreter, unit, &G);*/
        spill_registers(interpreter, unit, &G);

        ig_clear_graph(unit, &G);  /* reclaim used memory for G */
        build_interference_graph(interpreter, unit, &G);
        if (IMCC_INFO(interpreter)->optimizer_level & OPT_SUB) {
            compute_spilling_costs(interpreter, unit); /* will eventually use */
            allocate_wanted_regs(unit);
        }
        ig_precolor(interpreter, unit, &G);
        ig_color_graph(interpreter, unit, &G);
    }
    apply_coloring(interpreter, unit, &G);
    IMCC_INFO(interpreter)->allocated = 1;

    ig_clear_graph(unit, &G);  /* reclaim used memory */

    if (IMCC_INFO(interpreter)->optimizer_level & OPT_SUB)
        sub_optimize(interpreter, unit);
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_instructions(interpreter, unit);
    if (IMCC_INFO(interpreter)->verbose  ||
            (IMCC_INFO(interpreter)->debug & DEBUG_IMC))
        print_stat(interpreter, unit);
}

void
free_reglist(IMC_Unit * unit)
{
#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: free_reglist\n");
#endif
    /*ig_clear_graph(unit, G)*/
    if (unit->reglist) {
        int i;
        for (i = 0; i < unit->n_symbols; i++)
            free_life_info(unit, unit->reglist[i]);
        mem_sys_free(unit->reglist);
        unit->reglist = NULL;
        unit->n_symbols = 0;
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
static int imcsets[4]; /*FIXME global*/
/* register usage of .imc */
static void
imc_stat_init(IMC_Unit * unit) {
    imcsets[0] = imcsets[1] = imcsets[2] = imcsets[3] = 0;
    make_stat(unit, imcsets, 0);
    memset(&ostat, 0, sizeof(ostat));
}

/* and final */
static void
print_stat(Parrot_Interp interpreter, IMC_Unit * unit)
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


/* make a linear list of IDENTs and VARs, set n_symbols
 * TODO
 *   split the whole life analysis into 4, one per register kind
 *   registers of different kind never interfer, but the reglist
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
            if (r->set != 'K' && r->type & VTREGISTER)
                count++;
        }
    }
    if (count == 0)
        return;
    if (count >= HASH_SIZE)
        IMCC_warning(interpreter, "build_reglist", "probably too small HASH_SIZE"
                " (%d symbols)\n", count);
    unit->reglist = mem_sys_allocate_zeroed(count*sizeof(SymReg*));

    for (i = count = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
        /* Add each symbol to reglist  */
        for (; r; r = r->next) {
            if (r->set != 'K' && (r->type & VTREGISTER)) {
                unit->reglist[count++] = r;
                /* rearange I/N registers
                 * XXX not here, do it, when reading the source
                 * .nciarg, ... !!!1 */
                if ((IMCC_INFO(interpreter)->optimizer_level & OPT_PASM) &&
                        unit->pasm_file &&
                        (unit->reglist[count-1]->set == 'I' ||
                        unit->reglist[count-1]->set == 'N'))
                    unit->reglist[count-1]->color = -1;
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
    if (first) {}
}

/* creates the interference graph between the variables.
 *
 * data structure is a 2-d array 'interference_graph' bitmap where
 * row/column indices represent the same index in the list of all
 * symbols (unit->reglist) in the current compilation unit.
 *
 * two variables interfere when they are alive at the
 * same time
 */

static void
build_interference_graph(Parrot_Interp interpreter, IMC_Unit* unit, graph* G)
{
    int x, y, n_symbols;
    unsigned int* interference_graph;

    n_symbols = unit->n_symbols;
    if (!n_symbols)
        return;

    /* Construct a graph N x N where N = number of symbols.
     * This piece can be rewritten without the N x N array
     */
    interference_graph = ig_allocate(n_symbols);
    if (interference_graph == NULL)
        IMCC_fatal(interpreter, 1, "build_interference_graph","Out of mem\n");
    unit->interference_graph = interference_graph;

    /* Calculate interferences between each chain and populate the the Y-axis */
    for (x = 0; x < n_symbols; x++) {
        /* If symbol was never used in a statment, it can't interfere */
        if (!unit->reglist[x]->first_ins)
            continue;
        for (y = x + 1; y < n_symbols; y++) {
            if (!unit->reglist[y]->first_ins)
                continue;
            if (interferes(interpreter, unit, unit->reglist[x],
                        unit->reglist[y])) {
                ig_set(x, y, n_symbols, interference_graph);
                ig_set(y, x, n_symbols, interference_graph);
            }
        }
    }
    ig_init_graph(interpreter, unit, G);

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
        IMCC_fatal(interpreter, 1, "interferes",
                "INTERNAL ERROR: Life range is NULL\n");
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
 * try to allocate as much as possible, an optimization ...
 */
static void
allocate_wanted_regs(IMC_Unit * unit)
{
    int i, y, interf, n_symbols;
    SymReg *r;

    n_symbols = unit->n_symbols;
    for (i = 0; i < n_symbols; i++) {
        r = unit->reglist[i];
        if (r->color >= 0 || r->want_regno == -1 || strchr("ISPN", r->set) == 0)
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
    r->life_info = mem_sys_allocate_zeroed(unit->n_basic_blocks*sizeof(Life_range*));
    for (i=0; i < unit->n_basic_blocks; i++)
        make_life_range(r, i);
    l = r->life_info[ins->bbindex];
    l->first_ins = r->first_ins;
    l->last_ins = r->last_ins;
    if (IMCC_INFO(interpreter)->debug & DEBUG_REG2) {
        dump_instructions(interpreter, unit);
        dump_symreg(unit);
    }
}



/* Rewrites the unit instructions, inserting spill code in every ocurrence
 * of the symbol.  XXX this has tremendous potential for optimization.
 * Spilling multiple variables would help tremendously.
 */

#ifdef HAS_INLINE
inline
#endif
static void
spill(Interp *interpreter, IMC_Unit * unit, int spilled)
{
    Instruction * tmp, *ins;
    int i, n, dl;
    int needs_fetch, needs_store;
    SymReg * old_sym, *p31, *new_sym;
    char buf[256];
    SymReg *regs[IMCC_MAX_REGS];
    SymReg **reglist = unit->reglist;

    IMCC_debug(interpreter, DEBUG_IMC|DEBUG_SPILL,
            "#Spilling [%s]:\n", reglist[spilled]->name);

    new_sym = old_sym = reglist[spilled];
    if (old_sym->usage & U_SPILL)
        IMCC_fatal(interpreter, 1, "spill",
                "double spill - program too complex\n");
    new_sym->usage |= U_SPILL;

    unit->n_spilled++;
    n = 0;
    dl = 0;     /* line corr */
    tmp = NULL;


    if (!unit->p31)
        IMCC_fatal(interpreter, 1,"spill","unitialized spill array");
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
            /* update life info of prev sym */
            update_life(interpreter, unit, ins, new_sym, needs_fetch, needs_store,
                    old_sym != new_sym);
            /* if all symbols are in one basic_block, we need a new
             * symbol, so that the life_ranges are minimal
             * It would be nice, to detect, when changing the symbol
             * is necessary.
             */
            sprintf(buf, "%s_%d", old_sym->name, n++);
            new_sym = mk_symreg(interpreter, str_dup(buf), old_sym->set);
            new_sym->usage |= U_SPILL;
            if (needs_store)    /* advance past store */
                ins = tmp;
        }
    }
}

/*
 * Use colors from G to allocate registers and spill the high colors.
 */
static int
spill_registers(Parrot_Interp interpreter, IMC_Unit* unit, graph* G)
{
    int spilled=0, j;
    Instruction *spill_ins, *ins;

    IMCC_debug(interpreter, DEBUG_REG, "spill_registers: spilling at least %d symbols\n",
            G->k-MAX_COLOR);

    /* first instruction should be ".sub" -- make sure we allocate P31
     * _after_ subroutine entry.  And after the "saveall", or any
     * other assortment of pushes. */
    if (!unit->p31) {
        unit->p31 = mk_pasm_reg(interpreter, str_dup("P31"));
        ins = unit->instructions;
        while (ins
                && (strncmp(ins->fmt, "push", 4) == 0
                    || strcmp(ins->fmt, "saveall") == 0)) {
            ins = ins->next;
        }
        spill_ins = iNEW(interpreter, unit, unit->p31,
                str_dup("PerlArray"), NULL, 0);
        insert_ins(unit, ins, spill_ins);
    }

    for (j = 0; j < G->n; j++) {
        int x = G->V[j].id;
        int maxcol = MAX_COLOR;
        if (unit->reglist[x]->set == 'P') maxcol--; /* for spilling into P31 */
        if (G->V[j].col > maxcol) {
            IMCC_debug(interpreter, DEBUG_REG,
                    "SPILL_REGISTERS node %d, spilling ... regcol=%d\n",
                    x, G->V[j].col);
            spill(interpreter, unit, x);
            /* new spill symbols are always added to end of list >n,
             * so that's how we can get away with this little hack. */
            IMCC_debug(interpreter, DEBUG_REG,
                    "SPILL_REGISTERS spilled node %d\n", x);
            spilled++;
	}
    }
    if (IMCC_INFO(interpreter)->debug & DEBUG_IMC)
        dump_instructions(interpreter, unit);
    return spilled;
}

/* Computes the cost of spilling each symbol. This is estimated by the number
 * of times the symbol appears, weighted by X*loop_depth */
#if 0
static void
compute_spill_benefit (Parrot_Interp interpreter, IMC_Unit * unit, graph* G)
{
    int depth, i, j, k, max_depth;
    SymReg *r;
    Instruction * ins;
    char avail[1000];  /* XXX - lazily use bytes for avail colors */
    if (G->k >= 1000) IMCC_fatal(interpreter, 1,"ig_color_node",
            "more than 1000 colors required");
    memset(avail,1,G->k+1);

    for (j = 0; j < G->n; j++) {
        int x = G->V[j].id;
        int maxcol = MAX_COLOR;
        int reg_pressure = 0;
        if (unit->reglist[x]->set == 'P') maxcol--; /* for spilling into P31 */
        memset(avail,1,G->k+1);

        r = unit->reglist[x];
        r->score = 0;

        for (k = 0; k < G->n; k++) {
            int y=G->V[k].id;
            if (ig_test(x, y, G->n, G->E)) {
                if (avail[G->V[k].col]) {
                    avail[G->V[k].col] = 0;
                    reg_pressure++;
                }
            }
        }
        if (reg_pressure < maxcol)
            continue;

        r->score = r->use_count + (r->lhs_use_count << 2);


        breadth / (r->use_count + r->lhs_use_count);

        (reg_pressure - maxcol + 1) * r->use_count
            *

        if (G->V[j].col > maxcol) {
            IMCC_debug(interpreter, DEBUG_REG,
                    "SPILL_REGISTERS node %d, spilling ... regcol=%d\n",
                    x, G->V[j].col);
            /* new spill symbols are always added to end of list >n,
             * so that's how we can get away with this little hack. */
            IMCC_debug(interpreter, DEBUG_REG,
                    "SPILL_REGISTERS spilled node %d\n", x);
            spilled++;
	}
    }

    for (i = 0; i < unit->n_symbols; i++) {
        int max_depth = 0;
        r = unit->reglist[i];
        for (j = 0; j < unit->n_basic_blocks; j++) {
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
    }
}
#endif

/*
 * Use colors from G to allocate registers and spill the high colors.
 */
static void
apply_coloring(Interp* interpreter, IMC_Unit* unit, graph* G)
{
    int j,x=0;
    SymReg ** reglist = unit->reglist;
    int maxcol = MAX_COLOR;
    IMCC_debug(interpreter, DEBUG_REG,"apply_coloring n=%d\n", G->n);

    /*
     * apply coloring backwards
     */
    for (j = G->n-1; j >=0; j--) {
        x = G->V[j].id;
        IMCC_debug(interpreter, DEBUG_REG2,"APPLY_COLORING to %snode %d\n",
                (unit->reglist[x]->usage & U_SPILL?"spilled ":""), x);
        if (G->V[j].col <= maxcol) {
            reglist[x]->color = G->V[j].col - 1;
            IMCC_debug(interpreter, DEBUG_REG2,"APPLY node %d, reg=%ld\n",
                    x, reglist[x]->color);
        } else {
            IMCC_fatal(interpreter, 1,"apply_coloring",
                    "wants to use too high reg num");
        }
    }

#ifdef VALIDATE_COLORING
    {
        for (j = 0; j < G->n; j++) {
            int k;
            int x = G->V[j].id;
            assert(reglist[x]->color >= 0);
            assert(reglist[x]->color < MAX_COLOR);
            assert(reglist[x]->color == G->V[j].col-1);
            IMCC_debug(interpreter, DEBUG_REG,"%d (reg==%ld):", x, reglist[x]->color);
            for (k = 0; k < G->n; k++) {
                int y=G->V[k].id;
                if (ig_test(x, y, G->n, G->E)) {
                    IMCC_debug(interpreter, DEBUG_REG," %d(c=%ld)",y, reglist[y]->color);
                    assert(reglist[x]->color != reglist[y]->color);
                }
            }
            IMCC_debug(interpreter, DEBUG_REG, "\n");
        }
        IMCC_debug(interpreter, DEBUG_REG, "\ncoloring applied and verified, for %d "
                "node graph (Chi==%d).\n\n", G->n, G->k);
    }
#endif
}

/*static int degree_comparator(const void * x, const void * y) {
    return G.V[*(int*)x].deg < G.V[*(int*)y].deg ? -1 :
           G.V[*(int*)x].deg == G.V[*(int*)y].deg ? 0 : 1;
}*/

static int degree_comparator(const void * u, const void * v) {
    return ((node*)u)->deg - ((node*)v)->deg;
}

static int
ig_init_graph(Interp* interpreter, IMC_Unit* unit, graph* G) {
    int x,y;
    int num_nodes = unit->n_symbols;

    G->k = 0;
    G->n = num_nodes;
    G->E = unit->interference_graph;
    G->V = (node*)mem_sys_allocate_zeroed(G->n * sizeof(node));
    if (!G->V)
        IMCC_fatal(interpreter, 1,"ig_init_graph",
                "cannot allocate memory for coloring registers");

    for (x = 0; x < num_nodes; x++) {
        G->V[x].id = x;
        G->V[x].col = 0;  /* start uncolored */
        G->V[x].deg = 0;
        G->V[x].in = 1;   /* Indicates the node is "in" the graph, not removed. */
        for (y = 0; y < num_nodes; y++)
            if (ig_test(x, y, num_nodes, G->E))
                G->V[x].deg++;    /* another neighbor of x is recorded */
        assert(G->V[x].deg>=0 && G->V[x].deg<G->n);
    }
    qsort(G->V, G->n, sizeof(node), degree_comparator);
#ifndef NDEBUG
    if (IMCC_INFO(interpreter)->debug & DEBUG_REG)
    {
        int j;
        printf("ig_init_graph  nodes == %d\n", num_nodes);
        for (j = 0; j < num_nodes; j++) {
            node* u = &G->V[j];
            int k;
            printf( "node %d/%d d(%d):", j, u->id, u->deg);
            for (k = 0; k < G->n; k++) {
                if (G->V[k].in && ig_test(x, G->V[k].id, G->n, G->E)) {
                    printf( " %d/%d", k, G->V[k].id);
                }
            }
            printf( "\n");
        }
    }
#endif
    return 1;
}


static void
ig_clear_graph(IMC_Unit* unit, graph* G)
{
    if (G->V)
        mem_sys_free(G->V);
    if (G->E)
        mem_sys_free(G->E);
    G->n=G->k=0;
    G->E=NULL; G->V=NULL;
    unit->interference_graph=G->E;
}

/*
 * Set colors in G to pre-allocated values, from allocate_wanted_regs
 */
static void
ig_precolor(Interp* interpreter, IMC_Unit* unit, graph* G)
{
    int j,x;
    SymReg ** reglist = unit->reglist;
    IMCC_debug(interpreter, DEBUG_REG, "PRECOLORING GRAPH n=%d *****\n", G->n);
    for (j = 0; j < G->n; j++) {
        node* u = &G->V[j];
        x=u->id;
        u->col = 1 + reglist[x]->color;
        if (unit->reglist[x]->usage & U_SPILL) {
            int c=1+MAX_COLOR/2, k=0;  /* precolor spilled symbols */
            assert(!u->col);
            while(k < G->n) {
                for (k = 0; k < G->n; k++)
                    if (ig_test(x, G->V[k].id, G->n, G->E))
                        if (c == G->V[k].col) {c++; break;}
                if (c>=MAX_COLOR)
                    IMCC_fatal(interpreter, 1, "ig_precolor",
                            "cannot precolor spilled symbol");
            }
            u->col=c;
            IMCC_debug(interpreter, DEBUG_REG, "PRECOLORing spilled node %d, %s, "
                    "as color %d\n", x,unit->reglist[x]->name,c);
        }
        assert(0<=u->col && u->col<=MAX_COLOR); /*uncolored is okay*/
        if (u->col>G->k)
            G->k = u->col;
        if(u->col)
            IMCC_debug(interpreter, DEBUG_REG, "PRECOL node %d %s, col=%d\n",
                    x, unit->reglist[x]->name, G->V[j].col);
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
        /* 0) 5-15 volatile range */
        for (c = 6; c <= 16; c++)
            if (avail[c])
                return c;
    }
    /* 1) try upper non-volatiles, 16...31 */
    for (c = 17; c <= 32; c++)
        if (avail[c])
            return c;
    /* some lower regs are preserved too 0...4 */
    for (c = 1; c <= 5; c++)
        if (avail[c] && assignable[t][c - 1])
            return c;
    /* no chance, force high range with possible spilling */
    for (c = 33; ; c++)
        if (avail[c])
            return c;
    assert(0);
    return 0;
}

/* select first available color, over 17 */
static int
ig_color_node(Interp* interpreter, IMC_Unit* unit, graph* G, int j)
{
    int c,k;
    node* u = &G->V[j];
    int x = u->id;
    /*
     * TODO for higher optimization level:
     * Nodes that get colored too high (ie spill) should look at each
     * neighboring colored node's score.  If some neighboring color has a
     * lower spill cost and can change their color or spill, then the more
     * expensive node can have it's color.  The cost of swapping out a color
     * can be recorded in the below array, making it easier to find the switch
     * color.  This scheme should then reduce the cost of spilling overall.
     *
     * Actually, this might be a good idea anyway, since spilling is even
     * expensive to do!  Lot's of substitutions, and it looks like having
     * to redo the whole graph?
     */
    char avail[1000];  /* XXX - lazily use bytes for avail colors */
    if (G->k >= 1000)
        IMCC_fatal(interpreter, 1,"ig_color_node",
                "more than 1000 colors required");
    memset(avail,1,G->k+41);

    if (unit->reglist[x]->set == 'P')
        avail[32] = 0; /*reserve spot for spill reg, p31 */
    if (u->col)
        IMCC_debug(interpreter, DEBUG_REG2,
                "ig_color_node color node %d = %s,  precolored col=%d\n",
                u->id, unit->reglist[G->V[j].id]->name, u->col);
    for (k = 0; k < G->n; k++)
        if (ig_test(u->id, G->V[k].id, G->n, G->E)) {
            IMCC_debug(interpreter, DEBUG_REG2,
                    "ig_color_node k=%d, node %d, col=%d\n",
                    G->k, G->V[k].id, G->V[k].col);
            assert(0<=G->V[k].col && G->V[k].col<=G->k); /*uncolored is okay*/
            avail[G->V[k].col] = 0;  /* color no longer available. */
        }
    if (u->col && avail[u->col]) {
        c = u->col;
        assert(avail[u->col]);   /* verify no conflict */
    } else {
        if (u->col)
            IMCC_debug(interpreter, DEBUG_REG,
                    "WARNING - ig_color_node: cannot give requested color to "
                    "node %d, (%d)\n", u->id, u->col-1);
        c = ig_find_color(interpreter, unit, x, avail);
        u->col = c;
    }
    if (G->k < c) G->k = c;
    IMCC_debug(interpreter, DEBUG_REG2, "ig_color_node:  node %d, receives col=%d\n",
            u->id, u->col);
    return c;
}

static void
ig_remove_node(Interp* interpreter, IMC_Unit *unit, graph* G, int j) {
    int i,k;
    node* u = &G->V[j], tmpnode;
    int x = u->id;

    assert(u->deg>=0 && u->deg < G->n);
    u->in = 0;             /* node u is no longer "in" the graph */
    assert(j==0 || !G->V[j-1].in);

#ifdef NDEBUG
    u->deg=0;
#else
    IMCC_debug(interpreter, DEBUG_REG, "del %d/%d %s (%d):",
            j, x, unit->reglist[x]->name, u->deg);
    for (k = 0; k < G->n; k++) {
        if (G->V[k].in && ig_test(x, G->V[k].id, G->n, G->E)) {
            IMCC_debug(interpreter, DEBUG_REG, " %d/%d", k, G->V[k].id);
            u->deg--;      /*countdown degree*/
        }
    }
    IMCC_debug(interpreter, DEBUG_REG, "\n");
    assert(u->deg==0);
#endif

    for (k = 0; k < G->n; k++) {
        /*undeleted neighbor*/
        if (G->V[k].in && ig_test(x, G->V[k].id, G->n, G->E)) {
            int dy = G->V[k].deg--;
            if (k == 0 || G->V[k-1].deg < dy)
                continue;
            i = k;
            while (i > 0 && G->V[i-1].in && G->V[i-1].deg == dy)
                i--;
            tmpnode = G->V[i];
            G->V[i] = G->V[k];
            G->V[k] = tmpnode;
            assert(G->V[k].deg >= G->V[i].deg);
            assert(k == 0 || G->V[k].deg >= G->V[k-1].deg);
            assert(k == G->n - 1 || G->V[k].deg <= G->V[k+1].deg);
        }
    }
}

/* The Matula Maximum Minimum Degree coloring algorithm (Degeneracy Coloring).
 *
 * Sort by degrees, remove lowest degree nodes, adjust other degrees, iterate.
 * This algorithm for coloring, was adapted by Chaitin for register allocation.
 * Briggs later made more modifications.  The interesting part is spilling,
 * which really has nothing to do with theoretical graph coloring.  Stay tuned
 * to this channel as the saga continues ...
 */

static void
ig_color_graph(Interp* interpreter, IMC_Unit* unit, graph* G) {
    int j;

    IMCC_debug(interpreter, DEBUG_REG, "ig_color_graph n=%d\n", G->n);
    for (j = 0; j < G->n; j++) {
        ig_remove_node(interpreter, unit, G, j);
    }

    for (j = G->n - 1; j >= 0; j--) {
        IMCC_debug(interpreter, DEBUG_REG,
                "ig_color_graph: color node %d = %s, old col is %d\n",
                G->V[j].id, unit->reglist[G->V[j].id]->name, G->V[j].col);
        if (!G->V[j].col)
            ig_color_node(interpreter, unit, G, j);

        IMCC_debug(interpreter, DEBUG_REG2, "node %d, col=%d\n",
                G->V[j].id, G->V[j].col);
#ifdef VALIDATE_COLORING
        {
            int k;
            for (k = 0; k < G->n; k++) {
                if (ig_test(G->V[j].id, G->V[k].id, G->n, G->E)) {
                    assert(G->V[j].col != G->V[k].col);
                }
            }
            assert(G->V[j].deg == 0);
        }
#endif
    }
    IMCC_debug(interpreter, DEBUG_REG, "finished coloring, k=%d\n", G->k);
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
