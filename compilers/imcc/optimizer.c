/*
 * $Id$
 * Copyright (C) 2002-2010, Parrot Foundation.
 */

/*

=head1 NAME

compilers/imcc/optimizer.c

=head1 DESCRIPTION

Optimization occurs in three stages:
  1) pre_optimizer -- runs before control flow graph (CFG) is built
  2) optimizer     -- runs after CFG is built, but before register allocation
  3) post_optimizer -- runs after register allocation

pre_optimizer
-------------

During pre-optimization we perform optimizations which don't require
full knowledge of the control flow graph and the life ranges of each
variable. This phase is handled by two functions: pre_optimize() and
cfg_optimize().

pre_optimize() runs before the construction of the CFG begins. It calls
strength_reduce() to perform simple strength reduction, and if_branch()
to rewrite certain if/branch/label constructs (for details, see
if_branch() below).

[pre_optimize() may also be called later, during the main optimization
 phase, but this is not guaranteed.]

cfg_optimize() runs during the construction of the CFG. It calls
branch_branch() to perform jump optimization (i.e. branches to
branch statements or jumps to jumps are converted into single
branches/jumps to the final destination), unused_label() to remove
unused labels and dead_code_remove() to remove unreachable code
(e.g. basic blocks which are never entered or instructions after
 and unconditional branch which are never branched to).

cfg_optimize may be called multiple times during the construction of the
CFG depending on whether or not it finds anything to optimize.

subst_constants ... rewrite e.g. add_i_ic_ic

optimizer
---------

runs with CFG and life info

used_once ... deletes assignments, when LHS is unused

constant_propagation

post_optimizer: currently pcc_optimize in pcc.c
---------------

runs after register allocation

e.g. eliminate new Px .PerlUndef because Px where different before

=head2 Functions

=over 4

=cut

*/

#include <string.h>
#include "imc.h"
#include "pbc.h"
#include "optimizer.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: compilers/imcc/optimizer.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static int branch_branch(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static int branch_cond_loop(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
static int branch_cond_loop_swap(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Instruction *branch),
    ARGMOD(Instruction *start),
    ARGMOD(Instruction *cond))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*branch)
        FUNC_MODIFIES(*start)
        FUNC_MODIFIES(*cond);

PARROT_WARN_UNUSED_RESULT
static int branch_reorg(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static int constant_propagation(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static int dead_code_remove(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
static int eval_ins(PARROT_INTERP,
    ARGIN(const char *op),
    size_t ops,
    ARGIN(SymReg **r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

static int if_branch(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static int strength_reduce(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
static int unused_label(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

static int used_once(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

#define ASSERT_ARGS_branch_branch __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_branch_cond_loop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_branch_cond_loop_swap __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(branch) \
    , PARROT_ASSERT_ARG(start) \
    , PARROT_ASSERT_ARG(cond))
#define ASSERT_ARGS_branch_reorg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_constant_propagation __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_dead_code_remove __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_eval_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(op) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_if_branch __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_strength_reduce __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_unused_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_used_once __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<int pre_optimize(PARROT_INTERP, IMC_Unit *unit)>

Handles optimizations occuring before the construction of the CFG.

=cut

*/

int
pre_optimize(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(pre_optimize)
    int changed = 0;

    if (IMCC_INFO(interp)->optimizer_level & OPT_PRE) {
        IMCC_info(interp, 2, "pre_optimize\n");
        changed += strength_reduce(interp, unit);
        if (!IMCC_INFO(interp)->dont_optimize)
            changed += if_branch(interp, unit);
    }
    return changed;
}

/*

=item C<int cfg_optimize(PARROT_INTERP, IMC_Unit *unit)>

Handles optimizations occuring during the construction of the CFG.
Returns TRUE if any optimization was performed. Otherwise, returns
FALSE.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
cfg_optimize(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(cfg_optimize)
    if (IMCC_INFO(interp)->dont_optimize)
        return 0;
    if (IMCC_INFO(interp)->optimizer_level & OPT_PRE) {
        IMCC_info(interp, 2, "cfg_optimize\n");
        if (branch_branch(interp, unit))
            return 1;
        if (branch_cond_loop(interp, unit))
            return 1;
        if (branch_reorg(interp, unit))
            return 1;
        if (unused_label(interp, unit))
            return 1;
        if (dead_code_remove(interp, unit))
            return 1;
    }
    return 0;
}

/*

=item C<int optimize(PARROT_INTERP, IMC_Unit *unit)>

Runs after the CFG is built and handles constant propogation.

used_once ... deletes assignments, when LHS is unused

=cut

*/

int
optimize(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(optimize)
    int any = 0;
    if (IMCC_INFO(interp)->optimizer_level & OPT_CFG) {
        IMCC_info(interp, 2, "optimize\n");
        any = constant_propagation(interp, unit);
        if (used_once(interp, unit))
            return 1;
    }
    return any;
}

/*

=item C<const char * get_neg_op(const char *op, int *n)>

Get negated form of operator. If no negated form is known, return NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char *
get_neg_op(ARGIN(const char *op), ARGOUT(int *n))
{
    ASSERT_ARGS(get_neg_op)
    PARROT_OBSERVER static const struct br_pairs {
        PARROT_OBSERVER const char * const op;
        PARROT_OBSERVER const char * const nop;
        int n;
    } br_pairs[] = {
        { "if", "unless", 2 },
        { "eq", "ne", 3 },
        { "gt", "le", 3 },
        { "ge", "lt", 3 },
    };
    size_t i;
    for (i = 0; i < N_ELEMENTS(br_pairs); i++) {
        *n = br_pairs[i].n;
        if (STREQ(op, br_pairs[i].op))
            return br_pairs[i].nop;
        if (STREQ(op, br_pairs[i].nop))
            return br_pairs[i].op;
    }
    return NULL;
}

/*
*
 */
/*

=item C<static int if_branch(PARROT_INTERP, IMC_Unit *unit)>

Convert if/branch/label constructs of the form:

  if cond L1
  branch L2
  L1

to the simpler negated form:

  unless cond L2

=cut

*/

static int
if_branch(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(if_branch)
    Instruction *ins, *last;
    int reg, changed = 0;

    last = unit->instructions;
    if (!last->next)
        return changed;
    IMCC_info(interp, 2, "\tif_branch\n");
    for (ins = last->next; ins;) {
        if ((last->type & ITBRANCH) &&          /* if ...L1 */
                (ins->type & IF_goto) &&        /* branch L2*/
                STREQ(ins->opname, "branch") &&
                (reg = get_branch_regno(last)) >= 0) {
            SymReg * const br_dest = last->symregs[reg];
            if (ins->next &&
                    (ins->next->type & ITLABEL) &&    /* L1 */
                    ins->next->symregs[0] == br_dest) {
                const char * neg_op;
                SymReg * const go = get_branch_reg(ins);
                int args;

                IMCC_debug(interp, DEBUG_OPT1, "if_branch %s ... %s\n",
                        last->opname, br_dest->name);
                /* find the negated op (e.g if->unless, ne->eq ... */
                if ((neg_op = get_neg_op(last->opname, &args)) != NULL) {
                    Instruction * tmp;
                    last->symregs[reg] = go;
                    tmp = INS(interp, unit, neg_op, "",
                              last->symregs, args, 0, 0);
                    last->opnum = tmp->opnum;
                    last->opsize = tmp->opsize;
                    mem_sys_free(last->opname);
                    last->opname = mem_sys_strdup(tmp->opname);
                    free_ins(tmp);

                    /* delete branch */
                    unit->ostat.deleted_ins++;
                    ins = delete_ins(unit, ins);
                    unit->ostat.if_branch++;
                    changed = 1;
                }
            } /* label found */
        } /* branch detected */
        last = ins;
        ins = ins->next;
    }
    return changed;
}

/*

=item C<static int strength_reduce(PARROT_INTERP, IMC_Unit *unit)>

strength_reduce ... rewrites e.g add Ix, Ix, y => add Ix, y

These are run after constant simplification, so it is
guaranteed that one operand is non constant if opsize == 4

=cut

*/

static int
strength_reduce(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(strength_reduce)
    Instruction *ins, *tmp;
    SymReg *r;
    int changes = 0;
    FLOATVAL f;

    IMCC_info(interp, 2, "\tstrength_reduce\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        /*
         * add Ix, Ix, Iy => add Ix, Iy
         * add Ix, Iy, Ix => add Ix, Iy
         * sub Ix, Ix, Iy => sub Ix, Iy
         * mul Ix, Ix, Iy => sub Ix, Iy
         * mul Ix, Iy, Ix => sub Ix, Iy
         * div Ix, Ix, Iy => sub Ix, Iy
         * fdiv Ix, Ix, Iy => sub Ix, Iy
         * add Nx, Nx, Ny => add Nx, Ny
         * add Nx, Ny, Nx => add Nx, Ny
         * sub Nx, Nx, Ny => sub Nx, Ny
         * mul Nx, Nx, Ny => sub Nx, Ny
         * mul Nx, Ny, Nx => sub Nx, Ny
         * div Nx, Nx, Ny => sub Nx, Ny
         * fdiv Nx, Nx, Ny => sub Nx, Ny
         */
        if (((ins->opnum == PARROT_OP_sub_i_i_i ||
                ins->opnum == PARROT_OP_sub_i_i_ic ||
                ins->opnum == PARROT_OP_sub_i_ic_i ||
                ins->opnum == PARROT_OP_div_i_i_i ||
                ins->opnum == PARROT_OP_div_i_i_ic ||
                ins->opnum == PARROT_OP_div_i_ic_i ||
                ins->opnum == PARROT_OP_fdiv_i_i_i ||
                ins->opnum == PARROT_OP_fdiv_i_i_ic ||
                ins->opnum == PARROT_OP_fdiv_i_ic_i ||
                ins->opnum == PARROT_OP_sub_n_n_n ||
                ins->opnum == PARROT_OP_sub_n_n_nc ||
                ins->opnum == PARROT_OP_sub_n_nc_n ||
                ins->opnum == PARROT_OP_div_n_n_n ||
                ins->opnum == PARROT_OP_div_n_n_nc ||
                ins->opnum == PARROT_OP_div_n_nc_n ||
                ins->opnum == PARROT_OP_fdiv_n_n_n ||
                ins->opnum == PARROT_OP_fdiv_n_n_nc ||
                ins->opnum == PARROT_OP_fdiv_n_nc_n) &&
             ins->symregs[0] == ins->symregs[1])
          || ((ins->opnum == PARROT_OP_add_i_i_i ||
                ins->opnum == PARROT_OP_add_i_i_ic ||
                ins->opnum == PARROT_OP_add_i_ic_i ||
                ins->opnum == PARROT_OP_mul_i_i_i ||
                ins->opnum == PARROT_OP_mul_i_i_ic ||
                ins->opnum == PARROT_OP_mul_i_ic_i ||
                ins->opnum == PARROT_OP_add_n_n_n ||
                ins->opnum == PARROT_OP_add_n_n_nc ||
                ins->opnum == PARROT_OP_add_n_nc_n ||
                ins->opnum == PARROT_OP_mul_n_n_n ||
                ins->opnum == PARROT_OP_mul_n_n_nc ||
                ins->opnum == PARROT_OP_mul_n_nc_n) &&
             (ins->symregs[0] == ins->symregs[1] ||
              ins->symregs[0] == ins->symregs[2]))) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %d => ", ins);
            if (ins->symregs[0] == ins->symregs[1]) {
                ins->symregs[1] = ins->symregs[2];
            }
            tmp = INS(interp, unit, ins->opname, "", ins->symregs, 2, 0, 0);
            IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            changes = 1;
        }
        /*
         * add Ix, 0     => delete
         * sub Ix, 0     => delete
         * mul Ix, 1     => delete
         * div Ix, 1     => delete
         * fdiv Ix, 1    => delete
         * add Nx, 0     => delete
         * sub Nx, 0     => delete
         * mul Nx, 1     => delete
         * div Nx, 1     => delete
         * fdiv Nx, 1    => delete
         */
        if (((ins->opnum == PARROT_OP_add_i_ic ||
                ins->opnum == PARROT_OP_sub_i_ic) &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 0)
          || ((ins->opnum == PARROT_OP_mul_i_ic ||
                ins->opnum == PARROT_OP_div_i_ic ||
                ins->opnum == PARROT_OP_fdiv_i_ic) &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 1)
          || ((ins->opnum == PARROT_OP_add_n_nc ||
                ins->opnum == PARROT_OP_sub_n_nc) &&
                (f = atof(ins->symregs[1]->name), FLOAT_IS_ZERO(f)))
          || ((ins->opnum  == PARROT_OP_mul_n_nc  ||
                ins->opnum == PARROT_OP_div_n_nc ||
                ins->opnum == PARROT_OP_fdiv_n_nc) &&
                      atof(ins->symregs[1]->name) == 1.0)) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %d => ", ins);
            ins = delete_ins(unit, ins);
            if (ins)
                ins = ins->prev ? ins->prev : unit->instructions;
            else
                break;
            IMCC_debug(interp, DEBUG_OPT1, "deleted\n");
            changes = 1;
            continue;
        }
        /*
         * add Ix, 1     => inc Ix
         * add Nx, 1     => inc Nx
         * sub Ix, 1     => dec Ix
         * sub Nx, 1     => dec Nx
         */
        if (((ins->opnum == PARROT_OP_add_i_ic ||
                ins->opnum == PARROT_OP_sub_i_ic) &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 1)
          || ((ins->opnum == PARROT_OP_add_n_nc ||
                ins->opnum == PARROT_OP_sub_n_nc) &&
                      atof(ins->symregs[1]->name) == 1.0)) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %d => ", ins);
            --ins->symregs[1]->use_count;
            if (ins->opnum == PARROT_OP_add_i_ic ||
                ins->opnum == PARROT_OP_add_n_nc)
                tmp = INS(interp, unit, "inc", "", ins->symregs, 1, 0, 0);
            else
                tmp = INS(interp, unit, "dec", "", ins->symregs, 1, 0, 0);
            subst_ins(unit, ins, tmp, 1);
            IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
            ins = tmp;
            changes = 1;
            continue;
        }
        /*
         * add Ix, Iy, 0 => set Ix, Iy
         * add Ix, 0, Iy => set Ix, Iy
         * sub Ix, Iy, 0 => set Ix, Iy
         * mul Ix, Iy, 1 => set Ix, Iy
         * mul Ix, 1, Iy => set Ix, Iy
         * div Ix, Iy, 1 => set Ix, Iy
         * fdiv Ix, Iy, 1 => set Ix, Iy
         * add Nx, Ny, 0 => set Nx, Ny
         * add Nx, 0, Ny => set Nx, Ny
         * sub Nx, Ny, 0 => set Nx, Ny
         * mul Nx, Ny, 1 => set Nx, Ny
         * mul Nx, 1, Ny => set Nx, Ny
         * div Nx, Ny, 1 => set Nx, Ny
         * fdiv Nx, Ny, 1 => set Nx, Ny
         */
        if (((ins->opnum == PARROT_OP_add_i_i_ic ||
                ins->opnum == PARROT_OP_sub_i_i_ic) &&
                      IMCC_int_from_reg(interp, ins->symregs[2]) == 0)
          || (ins->opnum == PARROT_OP_add_i_ic_i &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 0)
          || ((ins->opnum == PARROT_OP_mul_i_i_ic ||
                ins->opnum == PARROT_OP_div_i_i_ic ||
                ins->opnum == PARROT_OP_fdiv_i_i_ic) &&
                      IMCC_int_from_reg(interp, ins->symregs[2]) == 1)
          || (ins->opnum == PARROT_OP_mul_i_ic_i &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 1)
          || ((ins->opnum == PARROT_OP_add_n_n_nc ||
                ins->opnum == PARROT_OP_sub_n_n_nc) &&
                (f = atof(ins->symregs[2]->name), FLOAT_IS_ZERO(f)))
          || (ins->opnum == PARROT_OP_add_n_nc_n &&
             (f = atof(ins->symregs[1]->name), FLOAT_IS_ZERO(f)))
          || ((ins->opnum == PARROT_OP_mul_n_n_nc ||
                ins->opnum == PARROT_OP_div_n_n_nc ||
                ins->opnum == PARROT_OP_fdiv_n_n_nc) &&
                      atof(ins->symregs[2]->name) == 1.0)
          || (ins->opnum == PARROT_OP_mul_n_nc_n &&
                      atof(ins->symregs[1]->name) == 1.0)) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %d => ", ins);
            if (ins->symregs[1]->type == VTCONST) {
                --ins->symregs[1]->use_count;
                ins->symregs[1] = ins->symregs[2];
            }
            else {
                --ins->symregs[2]->use_count;
            }
            tmp = INS(interp, unit, "set", "", ins->symregs, 2, 0, 0);
            IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            changes = 1;
            continue;
        }
        /*
         * mul Ix, Iy, 0 => set Ix, 0
         * mul Ix, 0, Iy => set Ix, 0
         * mul Ix, 0     => set Ix, 0
         */
        if ((ins->opnum == PARROT_OP_mul_i_i_ic &&
                      IMCC_int_from_reg(interp, ins->symregs[2]) == 0)
          || ((ins->opnum == PARROT_OP_mul_i_ic_i ||
                ins->opnum == PARROT_OP_mul_i_ic) &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 0)
          || (ins->opnum == PARROT_OP_mul_n_n_nc &&
             (f = atof(ins->symregs[2]->name), FLOAT_IS_ZERO(f)))
          || ((ins->opnum == PARROT_OP_mul_n_nc_n ||
                ins->opnum == PARROT_OP_mul_n_nc) &&
                (f = atof(ins->symregs[1]->name), FLOAT_IS_ZERO(f)))) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %d => ", ins);
            r = mk_const(interp, "0", ins->symregs[0]->set);
            --ins->symregs[1]->use_count;
            if (ins->opsize == 4)
                --ins->symregs[2]->use_count;
            ins->symregs[1] = r;
            tmp = INS(interp, unit, "set", "", ins->symregs, 2, 0, 0);
            IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            changes = 1;
        }
        /*
         * set Ix, 0     => null Ix
         * set Nx, 0     => null Nx
         */
        if ((ins->opnum == PARROT_OP_set_i_ic &&
                      IMCC_int_from_reg(interp, ins->symregs[1]) == 0)
          || (ins->opnum == PARROT_OP_set_n_nc &&
             (f = atof(ins->symregs[1]->name), FLOAT_IS_ZERO(f)) &&
              ins->symregs[1]->name[0] != '-')) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %d => ", ins);
            --ins->symregs[1]->use_count;
            tmp = INS(interp, unit, "null", "", ins->symregs, 1, 0, 0);
            subst_ins(unit, ins, tmp, 1);
            IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
            ins = tmp;
            changes = 1;
            continue;
        }
    }
    return changes;
}

/*

=item C<static int constant_propagation(PARROT_INTERP, IMC_Unit *unit)>

Does conservative constant propagation.
This code will not propagate constants past labels or saves,
even though sometimes it may be safe.

=cut

*/

static int
constant_propagation(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(constant_propagation)
    Instruction *ins;
    SymReg *c, *o;
    int any = 0;

    o = c = NULL; /* silence compiler uninit warning, but XXX better to handle flow well */

    IMCC_info(interp, 2, "\tconstant_propagation\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        int found = 0;
        if (STREQ(ins->opname, "set") &&
                ins->opsize == 3 &&             /* no keyed set */
                ins->symregs[1]->type == VTCONST &&
                ins->symregs[0]->set != 'P') {        /* no PMC consts */
            found = 1;
            c = ins->symregs[1];
            o = ins->symregs[0];
        } else if (STREQ(ins->opname, "null") && ins->symregs[0]->set == 'I') {
            found = 1;
            c = mk_const(interp, "0", 'I');
            o = ins->symregs[0];
        } /* this would be good because 'set I0, 0' is reduced to 'null I0'
               before it gets to us */

        if (found) {
            Instruction *ins2;

            IMCC_debug(interp, DEBUG_OPT2,
                    "propagating constant %d => \n", ins);
            for (ins2 = ins->next; ins2; ins2 = ins2->next) {
                int i;
                if (ins2->bbindex != ins->bbindex)
                    /* restrict to within a basic block */
                    goto next_constant;
                /* was opsize - 2, changed to n_r - 1
                 */
                for (i = ins2->symreg_count - 1; i >= 0; i--) {
                    if (STREQ(o->name, ins2->symregs[i]->name)) {
                        if (instruction_writes(ins2, ins2->symregs[i]))
                            goto next_constant;
                        else if (instruction_reads(ins2, ins2->symregs[i])) {
                            Instruction *tmp;
                            SymReg *old;

                            IMCC_debug(interp, DEBUG_OPT2,
                                    "\tpropagating into %d register %i",
                                    ins2, i);
                            old = ins2->symregs[i];
                            ins2->symregs[i] = c;
                /* first we try subst_constants for e.g. if 10 < 5 goto next*/
                            tmp = IMCC_subst_constants(interp,
                                unit, ins2->opname, ins2->symregs, ins2->opsize,
                                &found);
                            if (found) {
                                const Instruction * const prev = ins2->prev;
                                if (prev) {
                                    subst_ins(unit, ins2, tmp, 1);
                                    any = 1;
                                    IMCC_debug(interp, DEBUG_OPT2,
                                            " reduced to %d\n", tmp);
                                    ins2 = prev->next;
                                }
                            }
                            else {
                                char fullname[128];
                                const int op = check_op(interp, fullname, ins2->opname,
                                    ins2->symregs, ins2->symreg_count, ins2->keys);
                                if (op < 0) {
                                    ins2->symregs[i] = old;
                                    IMCC_debug(interp, DEBUG_OPT2,
                                            " - no %s\n", fullname);
                                }
                                else {
                                    --old->use_count;
                                    ins2->opnum = op;
                                    any = 1;
                                    IMCC_debug(interp, DEBUG_OPT2,
                                            " -> %d\n", ins2);
                                }
                            }
                        }
                    }

                }/* for (i ... )*/
            }/* for (ins2 ... )*/
        } /* if */
next_constant:;

    }/*for (ins ... )*/
    return any;
}

/*

=item C<Instruction * IMCC_subst_constants_umix(PARROT_INTERP, IMC_Unit *unit,
const char *name, SymReg **r, int n)>

rewrite e.g. add_n_ic => add_n_nc

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction *
IMCC_subst_constants_umix(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const char *name),
        ARGMOD(SymReg **r), int n)
{
    ASSERT_ARGS(IMCC_subst_constants_umix)
    Instruction *tmp;
    PARROT_OBSERVER const char * const ops[] = {
        "abs", "add", "div", "mul", "sub", "fdiv"
    };
    size_t i;
    char b[128];

    tmp = NULL;
    for (i = 0; i < N_ELEMENTS(ops); i++) {
        if (n == 3 &&
                r[0]->set == 'N' &&
                r[1]->type == VTCONST &&
                r[1]->set == 'I' &&
                STREQ(name, ops[i])) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %s_nc_ic => ", name);
            strcpy(b, r[1]->name);
            r[1] = mk_const(interp, b, 'N');
            tmp = INS(interp, unit, name, "", r, 2, 0, 0);
            IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
        }
    }
    return tmp;
}

/*

=item C<static int eval_ins(PARROT_INTERP, const char *op, size_t ops, SymReg
**r)>

Run one parrot instruction, registers are filled with the
according constants. If an exception occurs, return -1, aborting
this optimization: this lets the runtime handle any exceptions.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
eval_ins(PARROT_INTERP, ARGIN(const char *op), size_t ops, ARGIN(SymReg **r))
{
    ASSERT_ARGS(eval_ins)
    opcode_t eval[4], *pc;
    int opnum;
    int i;
    op_info_t *op_info;

    opnum = interp->op_lib->op_code(interp, op, 1);
    if (opnum < 0)
        IMCC_fatal(interp, 1, "eval_ins: op '%s' not found\n", op);
    op_info = interp->op_info_table + opnum;
    /* now fill registers */
    eval[0] = opnum;
    for (i = 0; i < op_info->op_count - 1; i++) {
        switch (op_info->types[i]) {
          case PARROT_ARG_IC:
            PARROT_ASSERT(i && ops == (unsigned int)i);
            /* set branch offset to zero */
            eval[i + 1] = 0;
            break;
          case PARROT_ARG_I:
          case PARROT_ARG_N:
          case PARROT_ARG_S:
            eval[i + 1] = i;        /* regs used are I0, I1, I2 */
            if (ops <= 2 || i) { /* fill source regs */
                SymReg *r_ = r[i]->type & VT_CONSTP ? r[i]->reg : r[i];
                switch (r[i]->set) {
                  case 'I':
                    REG_INT(interp, i) = IMCC_int_from_reg(interp, r_);
                    break;
                  case 'N':
                    {
                        STRING * const s = Parrot_str_new(interp, r_->name, 0);
                        REG_NUM(interp, i) = Parrot_str_to_num(interp, s);
                    }
                    break;
                  case 'S':
                    REG_STR(interp, i) = IMCC_string_from_reg(interp, r_);
                    break;
                  default:
                    break;
                }
            }
            break;
          default:
            IMCC_fatal(interp, 1, "eval_ins"
                    "invalid arg #%d for op '%s' not found\n",
                    i, op);
        }
    }

    /* eval the opcode */
    new_runloop_jump_point(interp);
    if (setjmp(interp->current_runloop->resume))
        return -1;

    pc = (interp->op_func_table[opnum]) (eval, interp);
    free_runloop_jump_point(interp);
    /* the returned pc is either incremented by op_count or is eval,
     * as the branch offset is 0 - return true if it branched
     */
    PARROT_ASSERT(pc == eval + op_info->op_count || pc == eval);
    return pc == eval;
}

/*

=item C<Instruction * IMCC_subst_constants(PARROT_INTERP, IMC_Unit *unit, const
char *name, SymReg **r, int n, int *ok)>

rewrite e.g. add_n_nc_nc => set_n_nc
             abs_i_ic    => set_i_ic
             eq_ic_ic_ic => branch_ic / delete
             if_ic_ic    => branch_ic / delete

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction *
IMCC_subst_constants(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const char *name),
        ARGMOD(SymReg **r), int n, ARGOUT(int *ok))
{
    ASSERT_ARGS(IMCC_subst_constants)
    Instruction *tmp;
    PARROT_OBSERVER const char * const ops[] = {
        "add", "sub", "mul", "div", "fdiv", "pow",
        "cmod", "mod", "atan",
        "shr", "shl", "lsr",
        "gcd", "lcm",
        "band", "bor", "bxor",
        "bands", "bors", "bxors",
        "and", "or", "xor",
        "iseq", "isne", "islt", "isle", "isgt", "isge", "cmp", "concat"
    };
    PARROT_OBSERVER const char * const ops2[] = {
        "abs", "neg", "not", "fact", "sqrt", "ceil", "floor"
        "acos", "asec", "asin",
        "atan", "cos", "cosh", "exp", "ln", "log10", "log2", "sec",
        "sech", "sin", "sinh", "tan", "tanh", "fact"
    };
    PARROT_OBSERVER const char * const ops3[] = {
        "eq", "ne", "gt", "ge", "lt", "le"
    };
    PARROT_OBSERVER const char * const ops4[] = {
        "if", "unless"
    };

    size_t i;
    const char *fmt;
    char op[20];
    const char *debug_fmt = NULL;   /* gcc -O uninit warn */
    int found, branched;

    /* construct a FLOATVAL_FMT with needed precision.
      TT #308  XXX Should use Configure.pl to figure these out,
      but it's not clear just what is needed.
      The value of '16' for NUMVAL_SIZE == 8 was one larger than the
      default FLOATVAL_FMT of '15' determined by Configure.pl.  The
      reason for this difference, if there is one, should be documented.
      The values of.18Lg and .31Lg are guesses.
    */
#if NUMVAL_SIZE == 8
    fmt = "%0.16g";
#elif NUMVAL_SIZE == 12
    fmt = "%0.18Lg";
#elif NUMVAL_SIZE == 16
    fmt = "%0.31Lg";
#else
    fmt = FLOATVAL_FMT;
    /* Since it's not clear why this is needed, it's not clear what to
       do if it's an unknown case.
    */
    IMCC_fatal(interp, 0,
       "IMCC_subst_constants:  unexpected NUMVAL_SIZE = %d\n",
       NUMVAL_SIZE);
#endif

    tmp = NULL;
    found = 0;
    for (i = 0; i < N_ELEMENTS(ops); i++) {
        if (n == 4 &&
                r[1]->type & (VTCONST|VT_CONSTP) &&
                r[2]->type & (VTCONST|VT_CONSTP) &&
                STREQ(name, ops[i])) {
            found = 4;
            /*
             * create instruction e.g. add_i_ic_ic => add_i_i_i
             */
            snprintf(op, sizeof (op), "%s_%c_%c_%c", name, tolower((unsigned char)r[0]->set),
                    tolower((unsigned char)r[1]->set), tolower((unsigned char)r[2]->set));
            debug_fmt = "opt %s_x_xc_xc => ";
            break;
        }
    }
    for (i = 0; !found && i < N_ELEMENTS(ops2); i++) {
        /*
         * abs_i_ic ...
         */
        if (n == 3) {
            PARROT_ASSERT(r[1]);
            if (r[1]->type & (VTCONST|VT_CONSTP) &&
                    STREQ(name, ops2[i])) {
                found = 3;
                snprintf(op, sizeof (op), "%s_%c_%c", name, tolower((unsigned char)r[0]->set),
                        tolower((unsigned char)r[1]->set));
                debug_fmt = "opt %s_x_xc => ";
                break;
            }
        }
    }
    for (i = 0; !found && i < N_ELEMENTS(ops3); i++) {
        /*
         * eq_xc_xc_labelc ...
         */
        if (n == 4 &&
                r[0]->type & (VTCONST|VT_CONSTP) &&
                r[1]->type & (VTCONST|VT_CONSTP)  &&
                STREQ(name, ops3[i])) {
            found = 2;
            snprintf(op, sizeof (op), "%s_%c_%c_ic", name, tolower((unsigned char)r[0]->set),
                    tolower((unsigned char)r[1]->set));
            debug_fmt = "opt %s_xc_xc_ic => ";
            break;
        }
    }
    for (i = 0; !found && i < N_ELEMENTS(ops4); i++) {
        /*
         * if_xc_labelc, unless
         */
        if (n == 3 &&
                r[0]->type & (VTCONST|VT_CONSTP) &&
                STREQ(name, ops4[i])) {
            found = 1;
            snprintf(op, sizeof (op), "%s_%c_ic", name, tolower((unsigned char)r[0]->set));
            debug_fmt = "opt %s_xc_ic => ";
            break;
        }
    }

    if (!found) {
        *ok = 0;
        return NULL;
    }

    /* XXX We can get to this point with debug_fmt = NULL */
    IMCC_debug(interp, DEBUG_OPT1, debug_fmt, name);
    /* we construct a parrot instruction
     * here and let parrot do the calculation in a
     * separate context and make a constant
     * from the result
     */
    branched = eval_ins(interp, op, found, r);
    if (branched == -1) {
         /* Don't set ok
          * (See http://rt.perl.org/rt3/Ticket/Display.html?id=43048 for info) */
         return NULL;
    }
    /*
     * for math ops result is in I0/N0
     * if it was a branch with constant args, the result is
     * the return value
     */
    if (found <= 2) {
        /*
         * create a branch or delete instruction
         */
        if (branched) {
            r[0] = r[found];
            tmp = INS(interp, unit, "branch", "", r, 1, 0, 0);
        }
        else {
            IMCC_debug(interp, DEBUG_OPT1, "deleted\n");
        }
    }
    else {
        /*
         * create set x, constant
         */
        char b[128];
        switch (r[0]->set) {
          case 'I':
            snprintf(b, sizeof (b), INTVAL_FMT, REG_INT(interp, 0));
            r[1] = mk_const(interp, b, r[0]->set);
            break;
          case 'N':
            snprintf(b, sizeof (b), fmt, REG_NUM(interp, 0));
            r[1] = mk_const(interp, b, r[0]->set);
            break;
          case 'S':
          {
            char * const name = Parrot_str_to_cstring(interp, REG_STR(interp, 0));

            r[1] = mk_const(interp, name, r[0]->set);

            snprintf(b, sizeof (b), "%p", REG_STR(interp, 0));
            Parrot_str_free_cstring(name);

            break;
          }
          default:
            break;
        }
        tmp = INS(interp, unit, "set", "", r, 2, 0, 0);
    }
    if (tmp) {
        IMCC_debug(interp, DEBUG_OPT1, "%d\n", tmp);
    }
    *ok = 1;
    return tmp;
}


/* optimizations with CFG built */

/*

=item C<static int branch_branch(PARROT_INTERP, IMC_Unit *unit)>

if I0 goto L1  => if IO goto L2
...
L1:
branch L2

Returns TRUE if any optimizations were performed. Otherwise, returns
FALSE.

=cut

*/

static int
branch_branch(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(branch_branch)
    Instruction *ins;
    int changed = 0;

    IMCC_info(interp, 2, "\tbranch_branch\n");
    /* reset statistic globals */
    for (ins = unit->instructions; ins; ins = ins->next) {
        if (get_branch_regno(ins) >= 0) {
            SymReg * const r = get_sym(interp, get_branch_reg(ins)->name);

            if (r && (r->type & VTADDRESS) && r->first_ins) {
                Instruction * const next = r->first_ins->next;
                /*                if (!next ||
                                  STREQ(next->symregs[0]->name, get_branch_reg(ins)->name))
                                  break;*/
                if (next &&
                        (next->type & IF_goto) &&
                        STREQ(next->opname, "branch") &&
                        !STREQ(next->symregs[0]->name, get_branch_reg(ins)->name)) {
                    const int regno = get_branch_regno(ins);
                    IMCC_debug(interp, DEBUG_OPT1,
                            "found branch to branch '%s' %d\n",
                            r->first_ins->symregs[0]->name, next);
                    unit->ostat.branch_branch++;
                    if (regno < 0)
                        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                            "Register number determination failed in branch_branch()");

                    ins->symregs[regno] = next->symregs[0];
                    changed = 1;
                }
            }
        }
    }
    return changed;
}

/*

=item C<static int branch_reorg(PARROT_INTERP, IMC_Unit *unit)>

branch L2  => ...
L1:           branch L4
...           L1:
branch L3     ...
L2:           branch L3
...           L5:
branch L4
L5:

Returns TRUE if any optimizations were performed. Otherwise, returns
FALSE.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
branch_reorg(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(branch_reorg)
    unsigned int i;
    int changed = 0;

    IMCC_info(interp, 2, "\tbranch_reorg\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        Instruction *ins = unit->bb_list[i]->end;

        /* if basic block ends with unconditional jump */
        if ((ins->type & IF_goto) && STREQ(ins->opname, "branch")) {
            SymReg * const r = get_sym(interp, ins->symregs[0]->name);

            if (r && (r->type & VTADDRESS) && r->first_ins) {
                Edge               *edge;
                Instruction * const start = r->first_ins;
                int                 found = 0;

                for (edge = unit->bb_list[start->bbindex]->pred_list;
                     edge;
                     edge = edge->pred_next) {

                    if (edge->from->index == start->bbindex - 1) {
                        found = 1;
                        break;
                    }
                }

                /* if target block is not reached by falling into it
                 * from another block */
                if (!found) {
                    Instruction *end;
                    /* move target block and its positional successors
                     * to follow block with unconditional jump
                     * (this could actually be in another block) */
                    for (end = start; end->next; end = end->next) {
                        if ((end->type & IF_goto) &&
                                STREQ(end->opname, "branch")) {
                            break;
                        }
                    }

                    /* this was screwing up multi-block loops... */
                    if (end != ins && ins->next != NULL) {
                        ins->next->prev = end;
                        start->prev->next = end->next;
                        if (end->next)
                            end->next->prev = start->prev;

                        end->next   = ins->next;
                        ins->next   = start;
                        start->prev = ins;

                        IMCC_debug(interp, DEBUG_OPT1,
                                "found branch to reorganize '%s' %d\n",
                                r->first_ins->symregs[0]->name, ins);

                        /* unconditional jump can be eliminated */
                        unit->ostat.deleted_ins++;
                        ins = delete_ins(unit, ins);
                        return 1;
                    }
                }
            }
        }
    }

    return changed;
}

/*

=item C<static int branch_cond_loop_swap(PARROT_INTERP, IMC_Unit *unit,
Instruction *branch, Instruction *start, Instruction *cond)>

Converts conditional loops to post-test

Returns TRUE if any optimizations were performed. Otherwise, returns
FALSE.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
branch_cond_loop_swap(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGMOD(Instruction *branch),
        ARGMOD(Instruction *start), ARGMOD(Instruction *cond))
{
    ASSERT_ARGS(branch_cond_loop_swap)
    int changed = 0;
    int args;
    const char * const neg_op = get_neg_op(cond->opname, &args);
    if (neg_op) {
        const size_t size  = strlen(branch->symregs[0]->name) + 10; /* + '_post999' */
        char * const label = (char *)mem_sys_allocate(size);
        int count;
        int found = 0;

        for (count = 1; count != 999; ++count) {
            snprintf(label, size, "%s_post%d", branch->symregs[0]->name, count);
            if (get_sym(interp, label) == NULL) {
                found = 1;
                break;
            }
        }

        if (found) {
            Instruction *tmp;
            SymReg *regs[3], *r;
            int reg_index;

            /* cond_op has 2 or 3 args */
            PARROT_ASSERT(args <= 3);

            r = mk_local_label(interp, label);
            tmp = INS_LABEL(interp, unit, r, 0);
            insert_ins(unit, cond, tmp);

            for (start = start->next; start != cond; start = start->next) {
                if (!(start->type & ITLABEL)) {
                    tmp = INS(interp, unit, start->opname, "",
                        start->symregs, start->symreg_count, start->keys, 0);
                    prepend_ins(unit, branch, tmp);
                }
            }

            for (count = 0; count != args; ++count) {
                regs[count] = cond->symregs[count];
            }

            reg_index = get_branch_regno(cond);
            if (reg_index < 0)
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "Negative branch register address detected");

            regs[reg_index] = mk_label_address(interp, label);
            tmp = INS(interp, unit, (const char*)neg_op, "", regs, args, 0, 0);

            IMCC_debug(interp, DEBUG_OPT1,
                "loop %s -> %s converted to post-test, added label %s\n",
                branch->symregs[0]->name, get_branch_reg(cond)->name, label);

            subst_ins(unit, branch, tmp, 1);
            unit->ostat.branch_cond_loop++;
            changed = 1;
        }

        mem_sys_free(label);
    }

    return changed;
}

/*

=item C<static int branch_cond_loop(PARROT_INTERP, IMC_Unit *unit)>

start:           => start:
if cond goto end    if cond goto end
...
branch start        start_post1:
end:                ...
                    unless cond goto start_post562
                    end:

The basic premise is "branch (A) to conditional (B), where B goes to
just after A."

Returns TRUE if any optimizations were performed. Otherwise, returns
FALSE.

=cut

*/

static int
branch_cond_loop(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(branch_cond_loop)
    Instruction *ins, *cond, *start, *prev;
    int changed = 0, found;

    IMCC_info(interp, 2, "\tbranch_cond_loop\n");
    /* reset statistic globals */

    for (ins = unit->instructions; ins; ins = ins->next) {
        if ((ins->type & IF_goto) && STREQ(ins->opname, "branch")) {
            /* get `end` label */
            Instruction * const end = ins->next;
            /* get `start` label */
            SymReg * const r = get_sym(interp, ins->symregs[0]->name);

            if (end && (end->type & ITLABEL) &&
                r && (r->type & VTADDRESS) && r->first_ins) {

                start = r->first_ins;
                found = 0;

                for (cond = start->next; cond; cond = cond->next) {
                    /* no good if it's an unconditional branch*/
                    if (cond->type & IF_goto && STREQ(cond->opname, "branch")) {
                        break;
                    } else if (cond->type & ITPCCRET || cond->type & ITPCCSUB
                            || cond->type & ITCALL) {
                        break;
                        /* just until we can copy set_args et al */
                    } else if (cond->type & ITBRANCH &&
                               get_branch_regno(cond) >= 0) {
                        found = 1;
                        break;
                    }
                }

                if (found) {
                    const char * const lbl = get_branch_reg(cond)->name;
                    const SymReg * const r = get_sym(interp, lbl);
                    if (r && (r->type & VTADDRESS) && r->first_ins == end) {
                        /* the current ins is replaced - remember prev
                         * and set ins again after the changes
                         */
                        prev = ins->prev;
                        if (!prev)
                            continue;
                        changed |= branch_cond_loop_swap(interp,
                                unit, ins, start, cond);
                        ins = prev->next;
                    }
                }
            }
        }
    }
    return changed;
}

/*

=item C<static int unused_label(PARROT_INTERP, IMC_Unit *unit)>

Removes unused labels.

Returns TRUE if any optimizations were performed. Otherwise, returns
FALSE.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
unused_label(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(unused_label)
    unsigned int i;
    int used;
    int changed = 0;

    IMCC_info(interp, 2, "\tunused_label\n");
    for (i = 1; i < unit->n_basic_blocks; i++) {
        Instruction *ins = unit->bb_list[i]->start;
        if ((ins->type & ITLABEL) && *ins->symregs[0]->name != '_') {
            const SymReg * const lab = ins->symregs[0];
            used = 0;

            if (!lab->first_ins)
                continue;
#if 1
            else if (lab->last_ins)
                used = 1;
#else
            else {
                int j;
                for (j=0; unit->bb_list[j]; j++) {
                    /* a branch can be the first ins in a block
                     * (if prev ins was a label)
                     * or the last ins in a block */
                    Instruction *ins2;
                    SymReg      *addr;

                    ins2 = unit->bb_list[j]->start;
                    if ((ins2->type & ITBRANCH) &&
                            (addr = get_branch_reg(ins2)) != 0) {
                        if (addr == lab && addr->type == VTADDRESS) {
                            used = 1;
                            break;
                        }
                    }
                    ins2 = unit->bb_list[j]->end;
                    if ((ins2->type & ITBRANCH) &&
                            (addr = get_branch_reg(ins2)) != 0) {
                        if (addr == lab && addr->type == VTADDRESS) {
                            used = 1;
                            break;
                        }
                    }
                }
            }
#endif
            if (!used) {
                unit->ostat.deleted_labels++;
                IMCC_debug(interp, DEBUG_OPT1,
                           "block %d label %s deleted\n", i, lab->name);
                unit->ostat.deleted_ins++;
                ins = delete_ins(unit, ins);
                changed = 1;
            }

        }
    }
    return changed;
}

/*

=item C<static int dead_code_remove(PARROT_INTERP, IMC_Unit *unit)>

dead code elimination
... unreachable blocks
... unreachable instructions

=cut

*/

static int
dead_code_remove(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(dead_code_remove)
    unsigned int i;
    int changed = 0;
    Instruction *ins, *last;

    /* this could be a separate level, now it's done with -O1 */
    if (!(IMCC_INFO(interp)->optimizer_level & OPT_PRE))
        return 0;
    IMCC_info(interp, 2, "\tdead_code_remove\n");

    /* Unreachable blocks */

    for (i = 1; i < unit->n_basic_blocks; i++) {
        Basic_block * const bb = unit->bb_list[i];

        if ((bb->start->type & ITLABEL) && *bb->start->symregs[0]->name == '_')
            continue;
        /* this block isn't entered from anywhere */
        if (!bb->pred_list) {
            const unsigned int bbi = bb->index;
            IMCC_debug(interp, DEBUG_OPT1,
                       "found dead block %d\n", bb->index);

            for (ins = bb->start; ins && ins->bbindex == bbi;) {
                IMCC_debug(interp, DEBUG_OPT1,
                        "\tins deleted (dead block) %d\n", ins);
                ins = delete_ins(unit, ins);
                unit->ostat.deleted_ins++;
                changed++;
            }
        }
    }


    /* Unreachable instructions */

    for (last = unit->instructions, ins = last->next;
         last && ins;
         ins = ins->next) {

        if ((last->type & IF_goto) && !(ins->type & ITLABEL) &&
            STREQ(last->opname, "branch")) {
            IMCC_debug(interp, DEBUG_OPT1,
                    "unreachable ins deleted (after branch) %d\n", ins);
            ins = delete_ins(unit, ins);
            unit->ostat.deleted_ins++;
            changed++;
        }

        /*
         *   branch L1     => --
         * L1: ...            L1:
         */
        if (ins && last && (last->type & IF_goto) && (ins->type & ITLABEL) &&
                STREQ(last->opname, "branch") &&
                STREQ(last->symregs[0]->name, ins->symregs[0]->name)) {
            IMCC_debug(interp, DEBUG_OPT1, "dead branch deleted %d\n", ins);
            ins = delete_ins(unit, last);
            unit->ostat.deleted_ins++;
            changed++;
        }
        last = ins;
        if (!ins)
            break;
    }
    return changed;
}

/* optimizations with CFG & life info built */
/*

=item C<static int used_once(PARROT_INTERP, IMC_Unit *unit)>

used_once ... deletes assignments, when LHS is unused

=cut

*/

static int
used_once(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(used_once)
    Instruction *ins;
    int opt = 0;

    for (ins = unit->instructions; ins; ins = ins->next) {
        if (ins->symregs) {
            SymReg * const r = ins->symregs[0];
            if (r && (r->use_count == 1 && r->lhs_use_count == 1)) {
                IMCC_debug(interp, DEBUG_OPT2, "used once '%d' deleted\n", ins);
                ins = delete_ins(unit, ins);

                /* find previous instruction or first instruction of this CU
                 * ... but only the latter if it wasn't deleted */
                ins = ins->prev
                    ? ins->prev
                    : opt ? unit->instructions : NULL;

                unit->ostat.deleted_ins++;
                unit->ostat.used_once++;
                opt++;
            }
        }
    }
    return opt;
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
