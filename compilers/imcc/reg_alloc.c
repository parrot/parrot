/*
 * $Id$
 * Copyright (C) 2003-2009, Parrot Foundation.
*/

/*

=head1 NAME

compilers/imcc/reg_alloc.c

=head1 DESCRIPTION

Register allocator:

This is a brute force register allocator. It uses a graph-coloring
algorithm, but the implementation is very kludgy.

It is a partial implementation of a Briggs-style register allocator
The following parts are just missing:

 - Renumbering
 - Coalescing

=head2 Functions

=over 4

=cut

*/

#include <string.h>
#include "imc.h"
#include "optimizer.h"

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void allocate_lexicals(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static void allocate_non_volatile(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static void allocate_uniq(PARROT_INTERP, ARGMOD(IMC_Unit *unit), int usage)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static void build_interference_graph(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static void build_reglist(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static void compute_du_chain(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static void compute_one_du_chain(ARGMOD(SymReg *r), ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
static unsigned int first_avail(PARROT_INTERP,
    ARGIN(const IMC_Unit *unit),
    int reg_set,
    ARGOUT_NULLOK(Set **avail))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*avail);

PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static unsigned int* ig_allocate(int N);

PARROT_WARN_UNUSED_RESULT
static int ig_find_color(
    ARGIN(const IMC_Unit *unit),
    ARGIN(const char *avail))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static unsigned int* ig_get_word(
    int i,
    int j,
    int N,
    ARGIN(unsigned int *graph),
    ARGMOD(int *bit_ofs))
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*bit_ofs);

static void ig_set(int i, int j, int N, ARGIN(unsigned int *graph))
        __attribute__nonnull__(4);

static void imc_stat_init(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static int interferes(PARROT_INTERP,
    ARGIN(const IMC_Unit *unit),
    ARGIN(const SymReg *r0),
    ARGIN(const SymReg *r1))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void make_stat(
    ARGMOD(IMC_Unit *unit),
    ARGMOD_NULLOK(int *sets),
    ARGMOD_NULLOK(int *cols))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*sets)
        FUNC_MODIFIES(*cols);

static void map_colors(
    ARGIN(const IMC_Unit* unit),
    int x,
    ARGIN(unsigned int *graph),
    ARGMOD(char *avail),
    int typ,
    int already_allocated)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*avail);

static void print_stat(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static void rebuild_reglist(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
static int reg_sort_f(ARGIN(const void *a), ARGIN(const void *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void sort_reglist(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

static void try_allocate(PARROT_INTERP, ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void vanilla_reg_alloc(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

#define ASSERT_ARGS_allocate_lexicals __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_allocate_non_volatile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_allocate_uniq __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_build_interference_graph __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_build_reglist __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_compute_du_chain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_compute_one_du_chain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_first_avail __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_ig_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_ig_find_color __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(avail))
#define ASSERT_ARGS_ig_get_word __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(graph) \
    , PARROT_ASSERT_ARG(bit_ofs))
#define ASSERT_ARGS_ig_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(graph))
#define ASSERT_ARGS_imc_stat_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_interferes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(r0) \
    , PARROT_ASSERT_ARG(r1))
#define ASSERT_ARGS_make_stat __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_map_colors __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(graph) \
    , PARROT_ASSERT_ARG(avail))
#define ASSERT_ARGS_print_stat __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_rebuild_reglist __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_reg_sort_f __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_sort_reglist __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_try_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_vanilla_reg_alloc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static unsigned int* ig_get_word(int i, int j, int N, unsigned int
*graph, int *bit_ofs)>

=cut

*/

PARROT_CANNOT_RETURN_NULL
static unsigned int*
ig_get_word(int i, int j, int N, ARGIN(unsigned int *graph),
            ARGMOD(int *bit_ofs))
{
    ASSERT_ARGS(ig_get_word)
    const unsigned int bit = i * N + j;
    *bit_ofs        = bit % sizeof (*graph);

    return &graph[bit / sizeof (*graph)];
}

/*

=item C<static void ig_set(int i, int j, int N, unsigned int *graph)>

=cut

*/

static void
ig_set(int i, int j, int N, ARGIN(unsigned int *graph))
{
    ASSERT_ARGS(ig_set)
    int bit_ofs;
    unsigned int * const word = ig_get_word(i, j, N, graph, &bit_ofs);
    *word |= (1 << bit_ofs);
}

/*

=item C<unsigned int ig_test(int i, int j, int N, unsigned int *graph)>

=cut

*/

PARROT_WARN_UNUSED_RESULT
unsigned int
ig_test(int i, int j, int N, ARGIN(unsigned int *graph))
{
    ASSERT_ARGS(ig_test)
    int bit_ofs;
    unsigned int* word = ig_get_word(i, j, N, graph, &bit_ofs);
    return *word & (1 << bit_ofs);
}

/*

=item C<static unsigned int* ig_allocate(int N)>

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static unsigned int*
ig_allocate(int N)
{
    ASSERT_ARGS(ig_allocate)
    /* size is N*N bits, but we want don't want to allocate a partial
     * word, so round up to the nearest multiple of sizeof (int).
     */
    const int need_bits = N * N;
    const int num_words = (need_bits + sizeof (int) - 1) / sizeof (int);
    return (unsigned int *)mem_sys_allocate_zeroed(num_words * sizeof (int));
}

/*

=item C<void imc_reg_alloc(PARROT_INTERP, IMC_Unit *unit)>

imc_reg_alloc is the main loop of the allocation algorithm. It operates
on a single compilation unit at a time.

=cut

*/

void
imc_reg_alloc(PARROT_INTERP, ARGIN_NULLOK(IMC_Unit *unit))
{
    ASSERT_ARGS(imc_reg_alloc)
    const char *function;

    if (!unit)
        return;

    if (!unit->instructions)
        return;

    imc_stat_init(unit);
    if (!(IMCC_INFO(interp)->optimizer_level &
                (OPT_PRE|OPT_CFG|OPT_PASM)) && unit->pasm_file)
        goto done;

    imcc_init_tables(interp);
    IMCC_INFO(interp)->allocated = 0;

#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: imc_reg_alloc\n");
    if (unit->instructions->r[1] && unit->instructions->r[1]->pcc_sub) {
        fprintf(stderr, "img_reg_alloc: pcc_sub (nargs = %d)\n",
            unit->instructions->r[1]->pcc_sub->nargs);
    }
#endif

    if (unit->instructions->symreg_count)
      function = unit->instructions->symregs[0]->name;
    else
      function = "(not a sub)";

    IMCC_debug(interp, DEBUG_IMC, "\n------------------------\n");
    IMCC_debug(interp, DEBUG_IMC, "processing sub %s\n", function);
    IMCC_debug(interp, DEBUG_IMC, "------------------------\n\n");

    if (IMCC_INFO(interp)->optimizer_level == OPT_PRE && unit->pasm_file) {
        while (pre_optimize(interp, unit))
            ;
        goto done;
    }

    /* all lexicals get a unique register */
    allocate_lexicals(interp, unit);

    /* build CFG and life info, and optimize iteratively */
    do {
        int first = 1;
        do {
            while (pre_optimize(interp, unit)) { };

            find_basic_blocks(interp, unit, first);
            build_cfg(interp, unit);
            first = 0;
        } while (cfg_optimize(interp, unit));

        compute_dominators(interp, unit);
        find_loops(interp, unit);

        if (IMCC_INFO(interp)->optimizer_level)
            compute_dominance_frontiers(interp, unit);

        build_reglist(interp, unit);

        if (IMCC_INFO(interp)->allocator == IMCC_GRAPH_ALLOCATOR)
            life_analysis(interp, unit);

        allocate_non_volatile(interp, unit);
    } while (!IMCC_INFO(interp)->dont_optimize && optimize(interp, unit));

    if (IMCC_INFO(interp)->debug & DEBUG_IMC)
        dump_symreg(unit);

    rebuild_reglist(unit);

    /*
     * TT #1281 - graph coloring reg allocator ignores local_branch/local_return
    if (IMCC_INFO(interp)->allocator == IMCC_VANILLA_ALLOCATOR)
    */
        vanilla_reg_alloc(interp, unit);
    /*
    else
        graph_coloring_reg_alloc(interp, unit);
    */

    if (IMCC_INFO(interp)->debug & DEBUG_IMC)
        dump_instructions(interp, unit);

  done:
    if (IMCC_INFO(interp)->verbose  || (IMCC_INFO(interp)->debug & DEBUG_IMC))
        print_stat(interp, unit);
    else
        make_stat(unit, NULL, unit->n_regs_used);
}

/*

=item C<void free_reglist(IMC_Unit *unit)>

=cut

*/

void
free_reglist(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(free_reglist)
#if IMC_TRACE
    fprintf(stderr, "reg_alloc.c: free_reglist\n");
#endif
    if (unit->interference_graph) {
        mem_sys_free(unit->interference_graph);
        unit->interference_graph = NULL;
    }

    if (unit->reglist) {
        unsigned int i;

        for (i = 0; i < unit->n_symbols; i++)
            free_life_info(unit, unit->reglist[i]);

        mem_sys_free(unit->reglist);
        unit->reglist   = NULL;
        unit->n_symbols = 0;
    }
}

/*

=item C<void graph_coloring_reg_alloc(PARROT_INTERP, IMC_Unit *unit)>

=cut

*/

void
graph_coloring_reg_alloc(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(graph_coloring_reg_alloc)
    build_interference_graph(interp, unit);

    try_allocate(interp, unit);
    IMCC_INFO(interp)->allocated = 1;
}

/*

=item C<static void make_stat(IMC_Unit *unit, int *sets, int *cols)>

some statistics about register usage
printed with --verbose --verbose

=cut

*/

static void
make_stat(ARGMOD(IMC_Unit *unit), ARGMOD_NULLOK(int *sets), ARGMOD_NULLOK(int *cols))
{
    ASSERT_ARGS(make_stat)
    /* register usage summary */
    SymHash * const hsh = &unit->hash;
    unsigned int    i;

    for (i = 0; i < hsh->size; i++) {
        SymReg *r;

        for (r = hsh->data[i]; r; r = r->next) {
            /* should be fine uninitialized, but analysis tools get confused */
            int j = 0;

            if (r->color > unit->max_color)
                unit->max_color = r->color;

            switch (r->set) {
                case 'I': j = 0; break;
                case 'N': j = 1; break;
                case 'S': j = 2; break;
                case 'P': j = 3; break;
                default :        continue;
            }

            if (REG_NEEDS_ALLOC(r)) {
                if (sets)
                    sets[j]++;

                if (cols)
                    if (r->color > cols[j])
                        cols[j] = r->color;
            }
        }
    }

    if (cols) {
        int j;
        for (j = 0; j < 4; j++)
            ++cols[j];
    }
}

/*

=item C<static void imc_stat_init(IMC_Unit *unit)>

registes usage of .pir

=cut

*/

static void
imc_stat_init(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(imc_stat_init)
    int j;

    make_stat(unit, unit->n_vars_used, NULL);

    for (j = 0; j < 4; j++) {
        unit->n_regs_used[j] = -1;
        unit->first_avail[j] =  0;
    }

    memset(&(unit->ostat), 0, sizeof (unit->ostat));
}

/*

=item C<static void print_stat(PARROT_INTERP, IMC_Unit *unit)>

and final

=cut

*/

static void
print_stat(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(print_stat)
    int sets[4] = {0, 0, 0, 0};

    const char * const function =
        unit->instructions->symreg_count
            ? unit->instructions->symregs[0]->name
            : "(not a function)";

    make_stat(unit, sets, unit->n_regs_used);
    IMCC_info(interp, 1,
            "sub %s:\n\tregisters in .pir:\t I%d, N%d, S%d, P%d\n",
            function,
            unit->n_vars_used[0], unit->n_vars_used[1],
            unit->n_vars_used[2], unit->n_vars_used[3]);
    IMCC_info(interp, 1,
              "\t%d labels, %d lines deleted, "
              "%d if_branch, %d branch_branch\n",
              unit->ostat.deleted_labels, unit->ostat.deleted_ins,
              unit->ostat.if_branch, unit->ostat.branch_branch);
    IMCC_info(interp, 1, "\t%d branch_cond_loop\n",
              unit->ostat.branch_cond_loop);
    IMCC_info(interp, 1, "\t%d used once deleted\n",
              unit->ostat.used_once);
    IMCC_info(interp, 1, "\t%d invariants_moved\n",
              unit->ostat.invariants_moved);
    IMCC_info(interp, 1, "\tregisters needed:\t I%d, N%d, S%d, P%d\n",
            sets[0], sets[1], sets[2], sets[3]);
    IMCC_info(interp, 1,
            "\tregisters in .pasm:\t I%d, N%d, S%d, P%d - %d\n",
            unit->n_regs_used[0], unit->n_regs_used[1],
            unit->n_regs_used[2], unit->n_regs_used[3]);
    IMCC_info(interp, 1, "\t%d basic_blocks, %d edges\n",
            unit->n_basic_blocks, edge_count(unit));
}

/*

=item C<static int reg_sort_f(const void *a, const void *b)>

sort list by line  nr

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
reg_sort_f(ARGIN(const void *a), ARGIN(const void *b))
{
    ASSERT_ARGS(reg_sort_f)
    const SymReg * const ra = *(const SymReg * const *)a;
    const SymReg * const rb = *(const SymReg * const *)b;

    if (ra->first_ins->index < rb->first_ins->index)
        return -1;

    if (ra->first_ins->index == rb->first_ins->index)
        return 0;

    return 1;
}

/*

=item C<static void sort_reglist(IMC_Unit *unit)>

=cut

*/

static void
sort_reglist(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(sort_reglist)
    qsort(unit->reglist, unit->n_symbols, sizeof (SymReg *), reg_sort_f);
}

/*

=item C<static void build_reglist(PARROT_INTERP, IMC_Unit *unit)>

make a linear list of IDENTs and VARs, set n_symbols
TODO
  split the whole life analysis into 4, one per register kind
  registers of different kind never interfere, but the reglist
  has them all

Registers are now sorted according to the line on which their usage
starts, which means that they are sorted by basic block numbers too.

Run through them and allocate all that don't overlap in one bunch.

=cut

*/

static void
build_reglist(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(build_reglist)
    SymHash  const *hsh = &unit->hash;
    unsigned int    i, count, unused, n_symbols;

    IMCC_info(interp, 2, "build_reglist\n");

    /* count symbols */
    if (unit->reglist)
        free_reglist(unit);

    count = unit->hash.entries;
    if (count == 0)
        return;

    unit->reglist = mem_gc_allocate_n_typed(interp, count, SymReg *);

    for (i = count = 0; i < hsh->size; i++) {
        SymReg *r;
        for (r = hsh->data[i]; r; r = r->next) {
            /* Add each symbol to reglist  */
            if (REG_NEEDS_ALLOC(r))
                unit->reglist[count++] = r;
        }
    }

    unit->n_symbols = n_symbols = count;

    if (IMCC_INFO(interp)->debug & DEBUG_IMC)
        dump_symreg(unit);

    compute_du_chain(unit);

    /* we might have unused symbols here, from optimizations */
    for (i = count = unused = 0; i < n_symbols; i++) {
        if (!unit->reglist[i]->first_ins)
            unused++;
        else if (i == count)
            count++;
        else
            unit->reglist[count++] = unit->reglist[i];
    }

    n_symbols      -= unused;
    unit->n_symbols = n_symbols;

    sort_reglist(unit);
}

/*

=item C<static void rebuild_reglist(IMC_Unit *unit)>

Exclude all already allocated registers (< first_avail)
from reglist. This reduced the size of the interference graph
significantly

=cut

*/

static void
rebuild_reglist(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(rebuild_reglist)
    unsigned int i, count, unused;
    static const char types[] = "INSP";

    for (i = count = unused = 0; i < unit->n_symbols; i++) {
        SymReg * const r = unit->reglist[i];
        const char *p;
        int reg_set;

        if (r->color == -1)
            goto use_it;

        p = strchr(types, r->set);

        if (!p)
            goto use_it;

        reg_set = p - types;
        if (r->color < unit->first_avail[reg_set]) {
            unused++;
            continue;
        }

  use_it:
        if (i == count)
            count++;
        else
            unit->reglist[count++] = unit->reglist[i];
    }

    unit->n_symbols -= unused;
}

/*

=item C<static void build_interference_graph(PARROT_INTERP, IMC_Unit *unit)>

Creates the interference graph between the variables.

Data structure is a 2-d array 'interference_graph' bitmap where
row/column indices represent the same index in the list of all
symbols (unit->reglist) in the current compilation unit.

Two variables interfere when they are alive at the same time.

=cut

*/

static void
build_interference_graph(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(build_interference_graph)
    int x;
    unsigned int *interference_graph;

    const int n_symbols = unit->n_symbols;

    if (!n_symbols)
        return;

    /* Construct a graph N x N where N = number of symbolics.
     * This piece can be rewritten without the N x N array */
    interference_graph       = ig_allocate(n_symbols);
    unit->interference_graph = interference_graph;

    /* Calculate interferences between each chain and populate the the Y-axis */
    for (x = 0; x < n_symbols; x++) {
        /* If symbol was never used in a statement, it can't interfere */
        int y;
        if (!unit->reglist[x]->first_ins)
            continue;
        for (y = x + 1; y < n_symbols; y++) {
            if (!unit->reglist[y]->first_ins)
                continue;
            if (interferes(interp, unit,
                        unit->reglist[x], unit->reglist[y])) {
                ig_set(x, y, n_symbols, interference_graph);
                ig_set(y, x, n_symbols, interference_graph);
            }
        }
    }

    if (IMCC_INFO(interp)->debug & DEBUG_IMC)
        dump_interference_graph(unit);
}


/*

=item C<static void compute_du_chain(IMC_Unit *unit)>

Compute a DU-chain for each symbolic in a compilation unit

=cut

*/

static void
compute_du_chain(ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(compute_du_chain)
    Instruction *ins = unit->instructions;
    Instruction *lastbranch = NULL;
    unsigned int i;

    /* Compute last branch in this procedure, update instruction index */
    for (i = 0; ins; ins = ins->next) {
        ins->index = i++;
        if (ins->type == ITBRANCH)
            lastbranch = ins;
    }

    /* Compute du-chains for all symbolics */
    for (i = 0; i < unit->n_symbols; i++) {
        SymReg * const r = unit->reglist[i];
        compute_one_du_chain(r, unit);

        /* what is this used for? -lt */
        if (r->type == VTIDENTIFIER
        &&  lastbranch
        &&  r->last_ins
        &&  r->last_ins->index < lastbranch->index)
            r->last_ins = lastbranch;
    }
}

/*

=item C<static void compute_one_du_chain(SymReg *r, IMC_Unit *unit)>

=cut

*/

static void
compute_one_du_chain(ARGMOD(SymReg *r), ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(compute_one_du_chain)
    Instruction * ins;

    /* We cannot rely on computing the value of r->first when parsing,
     * since the situation can be changed at any time by the register
     * allocation algorithm */
    r->first_ins     = NULL;
    r->use_count     = 0;
    r->lhs_use_count = 0;

    for (ins = unit->instructions; ins; ins = ins->next) {
        const int rw = instruction_writes(ins, r);

        if (rw || instruction_reads(ins, r)) {
            if (!r->first_ins)
                r->first_ins = ins;

            r->last_ins = ins;

            if (rw)
                r->lhs_use_count++;

            r->use_count++;

            /* if this symbol is used in a different scope
             * assume usage */
            if (r->reg) {
                r->lhs_use_count++;
                r->use_count++;
            }
        }
    }
}

/*

=item C<static int interferes(PARROT_INTERP, const IMC_Unit *unit, const SymReg
*r0, const SymReg *r1)>

See if r0's chain interferes with r1.

We currently decide that two vars interfere if they are both alive
at any point. This could be improved, requiring that one is alive
at the point of _definition_ of the other.

=cut

*/

static int
interferes(PARROT_INTERP, ARGIN(const IMC_Unit *unit),
        ARGIN(const SymReg *r0), ARGIN(const SymReg *r1))
{
    ASSERT_ARGS(interferes)
    unsigned int i;

    /* Registers don't interfere with themselves */
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
     * if this instruction does modify r0, if its value is never used
     * later, then they can share the same register.
     */
#if 1
    /* If they only overlap one instruction and one is used RHS only
     * and the other LHS, then that's ok
     *
     * But only, if that isn't inside a loop, tested via loop_depth
     * see also imcc/t/reg/alloc_2
     *
     * TODO no interferences, if the life range ends in this
     *      basic block, because it's end is e.g. a returncc
     */
    if (r0->first_ins->index == r1->last_ins->index
    &&  instruction_writes(r0->first_ins, r0)
    &&  instruction_reads(r1->last_ins, r1)
    && !instruction_reads(r0->first_ins, r0)) {
        const Basic_block * const bb = unit->bb_list[r0->first_ins->bbindex];
        if (bb->loop_depth == 0)
            return 0;
    }

    if (r1->first_ins->index == r0->last_ins->index
    &&  instruction_writes(r1->first_ins, r1)
    &&  instruction_reads(r0->last_ins, r0)
    && !instruction_reads(r1->first_ins, r1)) {
        const Basic_block * const bb = unit->bb_list[r1->first_ins->bbindex];
        if (bb->loop_depth == 0)
            return 0;
    }

#endif

    /* Now: */

    if (! r0->life_info || ! r1->life_info)
        PANIC(interp, "interferes: INTERNAL ERROR: Life range is NULL\n");

    for (i = 0; i < unit->n_basic_blocks; i++) {
        const Life_range * const l0 = r0->life_info[i];
        const Life_range * const l1 = r1->life_info[i];

        /* One or both are not alive in this block, so we have no conflict */
        if (!l0->first_ins || !l1->first_ins)
            continue;

        /* If the registers don't overlap, i.e first_x > last_y
         * then no interference */
        if (l0->first_ins->index > l1->last_ins->index)
            continue;

        if (l1->first_ins->index > l0->last_ins->index)
            continue;

        return 1;
    }

    return 0;
}

/*

=item C<static int ig_find_color(const IMC_Unit *unit, const char *avail)>

find available color for register #x in available colors

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
ig_find_color(ARGIN(const IMC_Unit *unit), ARGIN(const char *avail))
{
    ASSERT_ARGS(ig_find_color)
    unsigned int c;

    for (c = 0; c < unit->n_symbols; c++)
        if (avail[c])
            return c;

    return -1;
}

/*

=item C<static void try_allocate(PARROT_INTERP, IMC_Unit *unit)>

Color the graph, assigning registers to each symbol:

We just proceed popping items from the stack and assigning
a free color to them.

If we run out of colors, then we need to spill the top node.

=cut

*/

static void
try_allocate(PARROT_INTERP, ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(try_allocate)
    unsigned int    i;
    char           *avail;
    unsigned int   *graph   = unit->interference_graph;
    SymReg ** const reglist = unit->reglist;

    /* unit->n_symbols should be an upper limit of needed colors */
    unsigned int n = unit->n_symbols;

    if (unit->max_color >= (int)n)
        n = unit->max_color + 1;

    if (!n)
        return;

    avail = mem_gc_allocate_n_typed(interp, n, char);

    for (i = 0; i < unit->n_symbols; ++i) {
        int     already_allocated, color;
        SymReg * const r = reglist[i];
        int     t = -1;

        if (r->color >= 0)
            continue;

        switch (r->set) {
            case 'I': t = 0; break;
            case 'N': t = 1; break;
            case 'S': t = 2; break;
            case 'P': t = 3; break;
            default :        break;
        }

        if (t == -1)
            continue;

        already_allocated = unit->first_avail[t];

        /* don't even consider these regs */
        memset(avail, 1, n);
        map_colors(unit, i, graph, avail, r->set, already_allocated);
        color = ig_find_color(unit, avail);

        if (color == -1) {
            mem_sys_free(avail);
            IMCC_fatal(interp, DEBUG_IMC,
                    "# no more colors - this should not happen\n");
        }

        color   += already_allocated;
        r->color = color;

        IMCC_debug(interp, DEBUG_IMC, "#[%s] gets color [%d]\n",
            r->name, color);
    }

    mem_sys_free(avail);
    /* we are totally finished */
}

/*

=item C<static void map_colors(const IMC_Unit* unit, int x, unsigned int *graph,
char *avail, int typ, int already_allocated)>

map_colors: calculates what colors can be assigned to the x-th symbol.

=cut

*/

static void
map_colors(ARGIN(const IMC_Unit* unit), int x, ARGIN(unsigned int *graph),
        ARGMOD(char *avail), int typ, int already_allocated)
{
    ASSERT_ARGS(map_colors)
    const int n_symbols = unit->n_symbols;
    int       y;

    for (y = 0; y < n_symbols; y++) {
        if (ig_test(x, y, n_symbols, graph)) {
            const SymReg * const r = unit->reglist[y];
            if (r
            &&  r->color != -1
            &&  r->set   == typ) {
                PARROT_ASSERT(r->color - already_allocated >= 0);
                avail[r->color - already_allocated] = 0;
            }
        }
    }
}

/*

=item C<static unsigned int first_avail(PARROT_INTERP, const IMC_Unit *unit, int
reg_set, Set **avail)>

find first available register of the given reg_set

=cut

*/

PARROT_WARN_UNUSED_RESULT
static unsigned int
first_avail(PARROT_INTERP,
        ARGIN(const IMC_Unit *unit), int reg_set,
        ARGOUT_NULLOK(Set **avail))
{
    ASSERT_ARGS(first_avail)
    int n                     = (int)unit->n_symbols > unit->max_color
                              ? (int)unit->n_symbols
                              : unit->max_color;
    Set         *allocated    = set_make(interp, (unsigned int)n + 1);

    const SymHash * const hsh = &unit->hash;

    unsigned int i, first;

    /* find allocated registers */
    for (i = 0; i < hsh->size; i++) {
        SymReg *r;
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->set == reg_set)
                if (REG_NEEDS_ALLOC(r))
                    if (r->color >= (int)0)
                        set_add(allocated, (unsigned int)r->color);
        }
    }

    first = set_first_zero(allocated);

    if (avail)
        *avail = allocated;
    else
        set_free(allocated);

    return first;
}


/*

=item C<static void allocate_uniq(PARROT_INTERP, IMC_Unit *unit, int usage)>

allocate lexicals or non-volatile in ascending order

=cut

*/

static void
allocate_uniq(PARROT_INTERP, ARGMOD(IMC_Unit *unit), int usage)
{
    ASSERT_ARGS(allocate_uniq)
    SymHash     *hsh     = &unit->hash;
    Set         *sets[4] = { NULL, NULL, NULL, NULL };
    SymReg      *r;
    unsigned int i;

    for (i = 0; i < hsh->size; i++) {
        for (r = hsh->data[i]; r; r = r->next) {
            int j = -1;

            switch (r->set) {
                case 'I': j = 0; break;
                case 'N': j = 1; break;
                case 'S': j = 2; break;
                case 'P': j = 3; break;
                default :        continue;
            }

            if (REG_NEEDS_ALLOC(r)
            &&  r->color == -1
            && (r->usage & usage)
            && r->use_count) {
                Set         *avail     = sets[j];
                unsigned int first_reg = avail
                                       ? set_first_zero(avail)
                                       : first_avail(interp, unit, (int)r->set, &avail);
                set_add(avail, first_reg);
                r->color = first_reg++;

                IMCC_debug(interp, DEBUG_IMC,
                        "allocate %s sym %c '%s'  color %d\n",
                        usage & U_LEXICAL ? "Lexical" : "Non-vol",
                        (int)r->set, r->name, r->color);

                unit->first_avail[j] = first_reg;

                /* don't lose this set; we must free it */
                if (!sets[j])
                    sets[j] = avail;
            }
        }
    }

    for (i = 0; i < 4; ++i) {
        if (sets[i])
            set_free(sets[i]);
    }

    /*
     * TODO create allocation_threshold
     *      if there are less registers than threshold
     *      just allocate all and be done with it
     */
}

/*

=item C<static void vanilla_reg_alloc(PARROT_INTERP, IMC_Unit *unit)>

=cut

*/

static void
vanilla_reg_alloc(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(vanilla_reg_alloc)
    const char   type[] = "INSP";
    SymHash     *hsh    = &unit->hash;
    Set         *avail;
    unsigned int i, j;
    int          reg_set, first_reg;

    /* Clear the pre-assigned colors. */
    for (i = 0; i < hsh->size; i++) {
        SymReg *r;
        for (r = hsh->data[i]; r; r = r->next) {
            /* TODO Ignore non-volatiles */
            if (REG_NEEDS_ALLOC(r) && r->use_count)
                r->color = -1;
        }
    }

    /* Assign new colors. */
    for (j = 0; j < 4; j++) {
        reg_set   = type[j];
        first_reg = first_avail(interp, unit, reg_set, &avail);

        /* XXX Use a different loop variable that doesn't shadow outer i */
        for (i = 0; i < hsh->size; i++) {
            SymReg *r;
            for (r = hsh->data[i]; r; r = r->next) {
                if (r->set != reg_set)
                    continue;
                if (REG_NEEDS_ALLOC(r) && (r->color == -1) && r->use_count) {
                    if (set_contains(avail, first_reg))
                        first_reg = first_avail(interp, unit, reg_set, NULL);

                    set_add(avail, first_reg);
                    r->color = first_reg++;
                }
            }
        }

        set_free(avail);
        unit->first_avail[j] = first_reg;
    }
}

/*

=item C<static void allocate_lexicals(PARROT_INTERP, IMC_Unit *unit)>

=cut

*/

static void
allocate_lexicals(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(allocate_lexicals)
    IMCC_debug(interp, DEBUG_IMC, "allocate lexicals\n");
    allocate_uniq(interp, unit, U_LEXICAL);
}

/*

=item C<static void allocate_non_volatile(PARROT_INTERP, IMC_Unit *unit)>

=cut

*/

static void
allocate_non_volatile(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(allocate_non_volatile)
    IMCC_debug(interp, DEBUG_IMC, "allocate non_volatile\n");
    allocate_uniq(interp, unit, U_NON_VOLATILE);
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
