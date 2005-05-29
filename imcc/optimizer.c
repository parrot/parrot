/*
 * optimizer.c
 *
 * Optimization occurs in three stages:
 *  1) pre_optimizer -- runs before control flow graph (CFG) is built
 *  2) optimizer     -- runs after CFG is built, but before register allocation
 *  3) post_optimizer -- runs after register allocation
 */
#include <string.h>
#include "imc.h"
#include "optimizer.h"
#include "parrot/oplib/ops.h"


/*
 * pre_optimizer
 * -------------
 *
 * During pre-optimization we perform optimizations which don't require
 * full knowledge of the control flow graph and the life ranges of each
 * variable. This phase is handled by two functions: pre_optimize() and
 * cfg_optimize().
 *
 * pre_optimize() runs before the construction of the CFG begins. It calls 
 * strength_reduce() to perform simple strength reduction, and if_branch() 
 * to rewrite certain if/branch/label constructs (for details, see 
 * if_branch() below).
 *
 * [pre_optimize() may also be called later, during the main optimization 
 *  phase, but this is not guaranteed.]
 *
 * cfg_optimize() runs during the construction of the CFG. It calls 
 * branch_branch() to perform jump optimization (i.e. branches to
 * branch statements or jumps to jumps are converted into single 
 * branches/jumps to the final destination), unused_label() to remove
 * unused labels and dead_code_remove() to remove unreachable code 
 * (e.g. basic blocks which are never entered or instructions after
 *  and unconditional branch which are never branched to).
 * 
 * cfg_optimize may be called multiple times during the construction of the
 * CFG depending on whether or not it finds anything to optimize.
 * 
 * XXX: subst_constants ... rewrite e.g. add_i_ic_ic -- where does this happen?
 *
 * optimizer
 * ---------
 *
 * runs with CFG and life info
 *
 * used_once ... deletes assignments, when LHS is unused
 * loop_optimization ... pulls invariants out of loops
 * TODO e.g. constant_propagation
 *
 * post_optimizer: currently pcc_optimize in pcc.c
 * ---------------
 *
 *  runs after register alloocation
 *
 *  e.g. eliminate new Px .PerlUndef
 *  because Px where different before
 *
 */

/* buggy - turned off */
#define  DO_LOOP_OPTIMIZATION 0

static void if_branch(Interp *, IMC_Unit *);

static int branch_branch(Interp *interpreter, IMC_Unit *);
static int unused_label(Interp *interpreter, IMC_Unit *);
static int dead_code_remove(Interp *interpreter, IMC_Unit *);

static void strength_reduce(Interp *interpreter, IMC_Unit *);

static int constant_propagation(Interp *interpreter, IMC_Unit *);
static int used_once(Interp *, IMC_Unit *);
#if DO_LOOP_OPTIMIZATION
static int loop_optimization(Interp *, IMC_Unit *);
#endif
static int clone_remove(Interp *, IMC_Unit *);

/*
 * Handles optimizations occuring before the construction of the CFG.
 */
void
pre_optimize(Interp *interpreter, IMC_Unit * unit)
{
    if (IMCC_INFO(interpreter)->optimizer_level & OPT_PRE) {
        IMCC_info(interpreter, 2, "pre_optimize\n");
        /* TODO integrate all in one pass */
        strength_reduce(interpreter, unit);
        if (!IMCC_INFO(interpreter)->dont_optimize)
            if_branch(interpreter, unit);
    }
}

/*
 * Handles optimizations occuring during the construction of the CFG.
 * Returns TRUE if any optimization was performed. Otherwise, returns
 * FALSE.
 */
int
cfg_optimize(Interp *interpreter, IMC_Unit * unit)
{
    if (IMCC_INFO(interpreter)->dont_optimize)
        return 0;
    if (IMCC_INFO(interpreter)->optimizer_level & OPT_PRE) {
        IMCC_info(interpreter, 2, "cfg_optimize\n");
        if (branch_branch(interpreter, unit))
            return 1;
        /* XXX cfg / loop detection breaks e.g. in t/compiler/5_3 */
        if (unused_label(interpreter, unit))
            return 1;
        if (dead_code_remove(interpreter, unit))
            return 1;
    }
    return 0;
}

int
optimize(Interp *interpreter, IMC_Unit * unit)
{
    int any = 0;
    if (IMCC_INFO(interpreter)->optimizer_level & OPT_CFG) {
        IMCC_info(interpreter, 2, "optimize\n");
        any = constant_propagation(interpreter, unit);
        if (0 && clone_remove(interpreter, unit))
            return 1;
        if (used_once(interpreter, unit))
            return 1;
#if DO_LOOP_OPTIMIZATION
        if (loop_optimization(interpreter, unit))
            return 1;
#endif
    }
    return any;
}

/* 
 * Get negated form of operator. If no negated form is known, return 0.
 */
const char *
get_neg_op(char *op, int *n)
{
    static struct br_pairs {
        const char *op;
        const char *nop;
        int n;
    } br_pairs[] = {
    { "if", "unless", 2 },
    { "eq", "ne", 3 },
    { "gt", "le", 3 },
    { "ge", "lt", 3 },
    };
    unsigned int i;
    for (i = 0; i < sizeof(br_pairs)/sizeof(br_pairs[0]); i++) {
        *n= br_pairs[i].n;
        if (strcmp(op, br_pairs[i].op) == 0)
            return br_pairs[i].nop;
        if (strcmp(op, br_pairs[i].nop) == 0)
            return br_pairs[i].op;
    }
    return 0;
}

/*
 * Convert if/branch/label constructs of the form:
 * 
 *   if cond L1
 *   branch L2
 *   L1
 *
 * to the simpler negated form:
 *
 *   unless cond L2
 *
 */
static void
if_branch(Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *last;
    int reg;

    last = unit->instructions;
    if (!last->next)
        return;
    IMCC_info(interpreter, 2, "\tif_branch\n");
    for (ins = last->next; ins; ) {
        if ((last->type & ITBRANCH) &&          /* if ...L1 */
                (ins->type & IF_goto) &&        /* branch L2*/
                !strcmp(ins->op, "branch") &&
                (reg = get_branch_regno(last)) >= 0) {
            SymReg * br_dest = last->r[reg];
            if (ins->next &&
                    (ins->next->type & ITLABEL) &&    /* L1 */
                    ins->next->r[0] == br_dest) {
                const char * neg_op;
                SymReg * go = get_branch_reg(ins);
                int args;

                IMCC_debug(interpreter, DEBUG_OPT1,"if_branch %s ... %s\n",
                        last->op, br_dest->name);
                /* find the negated op (e.g if->unless, ne->eq ... */
                if ((neg_op = get_neg_op(last->op, &args)) != 0) {
                    Instruction * tmp;
                    last->r[reg] = go;
                    tmp = INS(interpreter, unit, (char*)neg_op, "", last->r, args, 0, 0);
                    last->opnum = tmp->opnum;
                    last->opsize = tmp->opsize;
                    free(last->op);
                    last->op = str_dup(tmp->op);
                    free_ins(tmp);

                    /* delete branch */
                    ostat.deleted_ins++;
                    ins = delete_ins(unit, ins, 1);
                    ostat.if_branch++;
                }
            } /* label found */
        } /* branch detected */
        last = ins;
        ins = ins->next;
    }
}

/* 
 * strength_reduce ... rewrites e.g add Ix, Ix, y => add Ix, y 
 *
 * These are run after constant simplification, so it is
 * guaranteed that one operand is non constant if opsize == 4
 */
static void
strength_reduce(Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    SymReg *r;

    IMCC_info(interpreter, 2, "\tstrength_reduce\n");
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
        if ( ( (ins->opnum == PARROT_OP_add_i_i_i ||
                ins->opnum == PARROT_OP_sub_i_i_i ||
                ins->opnum == PARROT_OP_mul_i_i_i ||
                ins->opnum == PARROT_OP_div_i_i_i ||
                ins->opnum == PARROT_OP_fdiv_i_i_i ||
                ins->opnum == PARROT_OP_add_n_n_n ||
                ins->opnum == PARROT_OP_sub_n_n_n ||
                ins->opnum == PARROT_OP_mul_n_n_n ||
                ins->opnum == PARROT_OP_div_n_n_n ||
                ins->opnum == PARROT_OP_fdiv_n_n_n) &&
             ins->r[0] == ins->r[1])
          || ( (ins->opnum == PARROT_OP_add_i_i_i ||
                ins->opnum == PARROT_OP_mul_i_i_i ||
                ins->opnum == PARROT_OP_add_n_n_n ||
                ins->opnum == PARROT_OP_mul_n_n_n) &&
             (ins->r[0] == ins->r[1] || ins->r[0] == ins->r[2]))) {
            IMCC_debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            if(ins->r[0] == ins->r[1]) {
                ins->r[1] = ins->r[2];
            }
            tmp = INS(interpreter, unit, ins->op, "", ins->r, 2, 0, 0);
            IMCC_debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            continue;
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
        if ( ( (ins->opnum == PARROT_OP_add_i_ic ||
                ins->opnum == PARROT_OP_sub_i_ic) &&
                      IMCC_int_from_reg(interpreter, ins->r[1]) == 0)
          || ( (ins->opnum == PARROT_OP_mul_i_ic ||
                ins->opnum == PARROT_OP_div_i_ic ||
                ins->opnum == PARROT_OP_fdiv_i_ic) &&
                      IMCC_int_from_reg(interpreter, ins->r[1]) == 1)
          || ( (ins->opnum == PARROT_OP_add_n_nc ||
                ins->opnum == PARROT_OP_sub_n_nc) &&
                      atof(ins->r[2]->name) == 0.0) 
          || ( (ins->opnum == PARROT_OP_mul_n_nc ||
                ins->opnum == PARROT_OP_div_n_nc ||
                ins->opnum == PARROT_OP_fdiv_n_nc) &&
                      atof(ins->r[2]->name) == 1.0) ) {
            IMCC_debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            ins = delete_ins(unit, ins, 1);
            ins = ins->prev ? ins->prev : unit->instructions;
            IMCC_debug(interpreter, DEBUG_OPT1, "deleted\n");
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
        if ( ( (ins->opnum == PARROT_OP_add_i_i_ic ||
                ins->opnum == PARROT_OP_sub_i_i_ic) &&
                      IMCC_int_from_reg(interpreter, ins->r[2]) == 0)
          || (  ins->opnum == PARROT_OP_add_i_ic_i &&
                      IMCC_int_from_reg(interpreter, ins->r[1]) == 0)
          || ( (ins->opnum == PARROT_OP_mul_i_i_ic ||
                ins->opnum == PARROT_OP_div_i_i_ic ||
                ins->opnum == PARROT_OP_fdiv_i_i_ic) &&
                      IMCC_int_from_reg(interpreter, ins->r[2]) == 1)
          || (  ins->opnum == PARROT_OP_mul_i_ic_i &&
                      IMCC_int_from_reg(interpreter, ins->r[1]) == 1)
          || ( (ins->opnum == PARROT_OP_add_n_n_nc ||
                ins->opnum == PARROT_OP_sub_n_n_nc) &&
                      atof(ins->r[2]->name) == 0.0)
          || (  ins->opnum == PARROT_OP_add_n_nc_n &&
                      atof(ins->r[1]->name) == 0.0)
          || ( (ins->opnum == PARROT_OP_mul_n_n_nc ||
                ins->opnum == PARROT_OP_div_n_n_nc ||
                ins->opnum == PARROT_OP_fdiv_n_n_nc) &&
                      atof(ins->r[2]->name) == 1.0)
          || (  ins->opnum == PARROT_OP_mul_n_nc_n &&
                      atof(ins->r[1]->name) == 1.0)) {
            IMCC_debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            if (ins->r[1]->type == VTCONST) {
                --ins->r[1]->use_count;
                ins->r[1] = ins->r[2];
            }
            else {
                --ins->r[2]->use_count;
            }
            tmp = INS(interpreter, unit, "set", "", ins->r, 2, 0, 0);
            IMCC_debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            continue;
        }
        /*
         * mul Ix, Iy, 0 => set Ix, 0
         * mul Ix, 0, Iy => set Ix, 0
         * mul Ix, 0     => set Ix, 0
         */
        if ( (ins->opnum == PARROT_OP_mul_i_i_ic &&
                      IMCC_int_from_reg(interpreter, ins->r[2]) == 0)
          || ( (ins->opnum == PARROT_OP_mul_i_ic_i ||
                ins->opnum == PARROT_OP_mul_i_ic) &&
                      IMCC_int_from_reg(interpreter, ins->r[1]) == 0)
          || (ins->opnum == PARROT_OP_mul_n_n_nc &&
                      atof(ins->r[2]->name) == 0.0)
          || ( (ins->opnum == PARROT_OP_mul_n_nc_n ||
                ins->opnum == PARROT_OP_mul_n_nc) &&
                      atof(ins->r[1]->name) == 0.0)) {
            IMCC_debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            r = mk_const(interpreter, str_dup("0"), ins->r[0]->set);
            --ins->r[1]->use_count;
            if (ins->opsize == 4)
                --ins->r[2]->use_count;
            ins->r[1] = r;
            tmp = INS(interpreter, unit, "set", "", ins->r, 2, 0, 0);
            IMCC_debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            continue;
        }
    }
}


/*
 * Does conservative constant propagation.
 * This code will not propagate constants past labels or saves,
 * even though sometimes it may be safe.
 */

static int
constant_propagation(Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *ins2;
    int op;
    int i;
    char fullname[128];
    SymReg *c, *old, *o;
    int any = 0;

    IMCC_info(interpreter, 2, "\tconstant_propagation\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        if (!strcmp(ins->op, "set") &&
                ins->opsize == 3 &&             /* no keyed set */
                ins->r[1]->type == VTCONST &&
                ins->r[0]->set != 'P') {        /* no PMC consts */
            c = ins->r[1];
            o = ins->r[0];

            IMCC_debug(interpreter, DEBUG_OPT1,
                    "propagating constant %I => \n", ins);
            for (ins2 = ins->next; ins2; ins2 = ins2->next) {
                if (ins2->type & ITSAVES ||
                    /* restrict to within a basic block */
                    ins2->bbindex != ins->bbindex)
                    goto next_constant;
                /* parrot opsize has opcode too, so argument count is
                 * opsize - 1
                 */
                for (i = ins2->opsize - 2; i >= 0; i--) {
                    if (!strcmp(o->name, ins2->r[i]->name)) {
                        if (instruction_writes(ins2,ins2->r[i]))
                            goto next_constant;
                        else if (instruction_reads(ins2,ins2->r[i])) {
                            IMCC_debug(interpreter, DEBUG_OPT2,
                                    "\tpropagating into %I register %i",
                                    ins2, i);
                            old = ins2->r[i];
                            ins2->r[i] = c;
                            op = check_op(interpreter, fullname, ins2->op,
                                    ins2->r, ins2->opsize, ins2->keys);
                            if (op < 0) {
                                ins2->r[i] = old;
                                IMCC_debug(interpreter, DEBUG_OPT2," - no %s\n", fullname);
                            }
                            else {
                                --old->use_count;
                                ins2->opnum = op;
                                any = 1;
                                IMCC_debug(interpreter, DEBUG_OPT2," -> %I\n", ins2);
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
 * rewrite e.g. add_n_ic => add_n_nc
 */
Instruction *
IMCC_subst_constants_umix(Interp *interpreter, IMC_Unit * unit, char *name,
        SymReg **r, int n)
{
    Instruction *tmp;
    const char *ops[] = {
        "abs", "add", "div", "mul", "sub", "fdiv"
    };
    size_t i;
    char b[128];

    tmp = NULL;
    for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
        if (n == 3 &&
                r[0]->set == 'N' &&
                r[1]->type == VTCONST &&
                r[1]->set == 'I' &&
                !strcmp(name, ops[i])) {
            IMCC_debug(interpreter, DEBUG_OPT1, "opt1 %s_nc_ic => ", name);
            strcpy(b, r[1]->name);
            r[1] = mk_const(interpreter, str_dup(b), 'N');
            tmp = INS(interpreter, unit, name, "", r, 2, 0, 0);
            IMCC_debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
        }
    }
    return tmp;
}

/*
 * Run one parrot instruction, registers are filled with the
 * according constants. Thus the result is always ok as the function
 * core evaluates the constants.
 */
static int
eval_ins(Interp *interpreter, char *op, size_t ops, SymReg **r)
{
    opcode_t eval[4], *pc;
    int opnum;
    int i;
    STRING *s;
    op_info_t *op_info;

    opnum = interpreter->op_lib->op_code(op, 1);
    if (opnum < 0)
        IMCC_fatal(interpreter, 1, "eval_ins: op '%s' not found\n", op);
    op_info = interpreter->op_info_table + opnum;
    /* now fill registers */
    for (i = 0; i < op_info->arg_count; i++) {
        switch (op_info->types[i]) {
            case PARROT_ARG_OP:
                eval[i] = opnum;
                break;
            case PARROT_ARG_IC:
                assert((i == 3 && ops == 2) || (i == 2 && ops == 1));
                /* set branch offset to zero */
                eval[i] = 0;
                break;
            case PARROT_ARG_I:
            case PARROT_ARG_N:
            case PARROT_ARG_S:
                eval[i] = i - 1;        /* regs used are I0, I1, I2 */
                if (ops <= 2 || i > 1) { /* fill source regs */
                    switch (r[i-1]->set) {
                        case 'I':
                            REG_INT(i-1) =
                                IMCC_int_from_reg(interpreter, r[i-1]);
                            break;
                        case 'N':
                            s = string_from_cstring(interpreter,
                                    r[i-1]->name, 0);
                            REG_NUM(i-1) =
                                string_to_num(interpreter, s);
                            break;
                        case 'S':
                            REG_STR(i-1) =
                                IMCC_string_from_reg(interpreter, r[i-1]);
                            break;
                    }
                }
                break;
            default:
                IMCC_fatal(interpreter, 1, "eval_ins"
                        "invalid arg #%d for op '%s' not found\n",
                        i, op);
        }
    }

    /* eval the opcode */
    pc = (interpreter->op_func_table[opnum]) (eval, interpreter);
    /* the returned pc is either incremented by arg_count or is eval,
     * as the branch offset is 0 - return true if it branched
     */
    assert(pc == eval + op_info->arg_count || pc == eval);
    return pc == eval;
}

/*
 * rewrite e.g. add_n_nc_nc => set_n_nc
 *              abs_i_ic    => set_i_ic
 *              eq_ic_ic_ic => branch_ic / delete
 *              if_ic_ic    => branch_ic / delete
 */

Instruction *
IMCC_subst_constants(Interp *interpreter, IMC_Unit * unit, char *name,
        SymReg **r, int n, int *ok)
{
    Instruction *tmp;
    const char *ops[] = {
        "add", "sub", "mul", "div", "fdiv", "pow",
        "cmod", "mod", "atan",
        "shr", "shl", "lsr",
        "gcd", "lcm",
        "band", "bor", "bxor",
        "bands", "bors", "bxors",
        "and", "or", "xor",
        "iseq", "isne", "islt", "isle", "isgt", "isge", "cmp"
    };
    const char *ops2[] = {
        "abs", "neg", "not", "fact", "sqrt",
        "acos", "asec", "asin",
        "atan", "cos", "cosh", "exp", "ln", "log10", "log2", "sec",
        "sech", "sin", "sinh", "tan", "tanh", "fact"
    };
    const char *ops3[] = {
        "eq", "ne", "gt", "ge", "lt", "le"
    };
    const char *ops4[] = {
        "if", "unless"
    };

    size_t i;
    char b[128], fmt[64], op[20];
    const char *debug_fmt;
    int found, branched;
    struct parrot_regs_t *bp;
    Stack_Chunk_t *stack_p, *reg_stack;


    /* construct a FLOATVAL_FMT with needed precision */
    switch (NUMVAL_SIZE) {
        case 8:
            strcpy(fmt, "%0.16g");
            break;
        case 12:
            strcpy(fmt, "%0.18Lg");
            break;
        default:
            IMCC_warning(interpreter, "subs_constants",
                    "used default FLOATVAL_FMT\n");
            strcpy(fmt, FLOATVAL_FMT);
            break;
    }

    tmp = NULL;
    found = 0;
    for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
        if (n == 4 &&
                r[1]->type & (VTCONST|VT_CONSTP) &&
                r[2]->type & (VTCONST|VT_CONSTP) &&
                !strcmp(name, ops[i])) {
            found = 4;
            /*
             * create instruction e.g. add_i_ic_ic => add_i_i_i
             */
            sprintf(op, "%s_%c_%c_%c", name, tolower(r[0]->set),
                    tolower(r[1]->set), tolower(r[2]->set));
            debug_fmt = "opt %s_x_xc_xc => ";
            break;
        }
    }
    for (i = 0; !found && i < sizeof(ops2)/sizeof(ops2[0]); i++) {
        /*
         * abs_i_ic ...
         */
        if (n == 3 &&
                r[1]->type & (VTCONST|VT_CONSTP) &&
                !strcmp(name, ops2[i])) {
            found = 3;
            sprintf(op, "%s_%c_%c", name, tolower(r[0]->set),
                    tolower(r[1]->set));
            debug_fmt = "opt %s_x_xc => ";
            break;
        }
    }
    for (i = 0; !found && i < sizeof(ops3)/sizeof(ops3[0]); i++) {
        /*
         * eq_xc_xc_labelc ...
         */
        if (n == 4 &&
                r[0]->type & (VTCONST|VT_CONSTP) &&
                r[1]->type & (VTCONST|VT_CONSTP)  &&
                !strcmp(name, ops3[i])) {
            found = 2;
            sprintf(op, "%s_%c_%c_ic", name, tolower(r[0]->set),
                    tolower(r[1]->set));
            debug_fmt = "opt %s_xc_xc_ic => ";
            break;
        }
    }
    for (i = 0; !found && i < sizeof(ops4)/sizeof(ops4[0]); i++) {
        /*
         * if_xc_labelc, unless
         */
        if (n == 3 &&
                r[0]->type & (VTCONST|VT_CONSTP) &&
                !strcmp(name, ops4[i])) {
            found = 1;
            sprintf(op, "%s_%c_ic", name, tolower(r[0]->set));
            debug_fmt = "opt %s_xc_ic => ";
            break;
        }
    }

    if (!found) {
        *ok = 0;
        return NULL;
    }
    /* preserve registers */
    bp = interpreter->ctx.bp;
    reg_stack = interpreter->ctx.reg_stack;
    interpreter->ctx.bp = new_register_frame(interpreter,
            &interpreter->ctx.reg_stack);

    IMCC_debug(interpreter, DEBUG_OPT1, debug_fmt, name);
    /* we construct a parrot instruction
     * here and let parrot do the calculation in a
     * separate context and make a constant
     * from the result
     */
    branched = eval_ins(interpreter, op, found, r);
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
            tmp = INS(interpreter, unit, "branch", "", r,
                    1, 0, 0);
        }
        else {
            IMCC_debug(interpreter, DEBUG_OPT1, "deleted\n");
        }
    }
    else {
        /*
         * create set x, constant
         */
        switch (r[0]->set) {
            case 'I':
                sprintf(b, INTVAL_FMT, REG_INT(0));
                break;
            case 'N':
                sprintf(b, fmt, REG_NUM(0));
                break;
        }
        r[1] = mk_const(interpreter, str_dup(b), r[0]->set);
        tmp = INS(interpreter, unit, "set", "", r,
                    2, 0, 0);
    }
    if (tmp) {
        IMCC_debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
    }
    *ok = 1;
    /*
     * restore and recycle register frame
     */
    stack_p = interpreter->ctx.reg_stack;
    interpreter->ctx.bp = bp;
    interpreter->ctx.reg_stack = reg_stack;
    add_to_fp_cache(interpreter, stack_p);
    return tmp;
}


/* optimizations with CFG built */

/*
 * branch L1  => branch L2
 * ...
 * L1:
 * branch L2
 *
 * Returns TRUE if any optimizations were performed. Otherwise, returns
 * FALSE.
 */
static int
branch_branch(Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *next;
    SymReg * r;
    int changed = 0;

    IMCC_info(interpreter, 2, "\tbranch_branch\n");
    /* reset statistic globals */
    for (ins = unit->instructions; ins; ins = ins->next) {
        if ((ins->type & IF_goto) && !strcmp(ins->op, "branch")) {
            r = get_sym(ins->r[0]->name);

            if (r && (r->type & VTADDRESS) && r->first_ins) {
                next = r->first_ins->next;
                if (!next)
                    break;
                if ((next->type & IF_goto) &&
                        !strcmp(next->op, "branch")) {
                    IMCC_debug(interpreter, DEBUG_OPT1,
                            "found branch to branch '%s' %I\n",
                            r->first_ins->r[0]->name, next);
                    ostat.branch_branch++;
                    ins->r[0] = next->r[0];
                    changed = 1;
                }
            }
        }
    }
    return changed;
}

/*
 * Removes unused labels. A label is unused if ... [XXX: finish this].
 *
 * Returns TRUE if any optimizations were performed. Otherwise, returns
 * FALSE.
 */
static int
unused_label(Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins;
    int used;
    int i;
    int changed = 0;

    IMCC_info(interpreter, 2, "\tunused_label\n");
    for (i=1; i < unit->n_basic_blocks; i++) {
	ins = unit->bb_list[i]->start;
        if ((ins->type & ITLABEL) && *ins->r[0]->name != '_') {
            SymReg * lab = ins->r[0];
            used = 0;
            if (IMCC_INFO(interpreter)->has_compile)
                used = 1;
            if (!lab->first_ins)
                continue;
#if 1
            else if (lab->last_ins)
                used = 1;
#else
            else {
                Instruction *ins2;
                int j;
                SymReg * addr;
                for (j=0; unit->bb_list[j]; j++) {
                    /* a branch can be the first ins in a block
                     * (if prev ins was a label)
                     * or the last ins in a block
                     */
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
                ostat.deleted_labels++;
                IMCC_debug(interpreter, DEBUG_OPT1, "block %d label %s deleted\n", i, lab->name);
                ostat.deleted_ins++;
                ins = delete_ins(unit, ins, 1);
                changed = 1;
            }

        }
    }
    return changed;
}

static int
dead_code_remove(Interp *interpreter, IMC_Unit * unit)
{
    Basic_block *bb;
    int i;
    int changed = 0;
    Instruction *ins, *last;

    /* this could be a separate level, now it's done with -O1 */
    if (!(IMCC_INFO(interpreter)->optimizer_level & OPT_PRE))
        return 0;
    IMCC_info(interpreter, 2, "\tdead_code_remove\n");

    /* Unreachable blocks */

    for (i=1; i < unit->n_basic_blocks; i++) {
	bb = unit->bb_list[i];
        if ((bb->start->type & ITLABEL) && *bb->start->r[0]->name == '_')
            continue;
        /* this block isn't entered from anywhere */
        if (!bb->pred_list) {
            int bbi = bb->index;
            IMCC_debug(interpreter, DEBUG_OPT1, "found dead block %d\n", bb->index);
            for (ins = bb->start; ins && ins->bbindex == bbi; ) {
                IMCC_debug(interpreter, DEBUG_OPT1,
                        "\tins deleted (dead block) %I\n", ins);
                ins = delete_ins(unit, ins, 1);
                ostat.deleted_ins++;
                changed++;
            }
        }
    }

    /* Unreachable instructions */

    for (last = unit->instructions, ins=last->next; last && ins; ins = ins->next) {
        if ((last->type & IF_goto) && !(ins->type & ITLABEL) &&
                !strcmp(last->op, "branch")) {
            IMCC_debug(interpreter, DEBUG_OPT1,
                    "unreachable ins deleted (after branch) %I\n", ins);
            ins = delete_ins(unit, ins, 1);
            ostat.deleted_ins++;
            changed++;
        }
        /*
         *   branch L1     => --
         * L1: ...            L1:
         */
        if (ins && last && (last->type & IF_goto) && (ins->type & ITLABEL) &&
                !strcmp(last->op, "branch") &&
                !strcmp(last->r[0]->name, ins->r[0]->name)) {
            IMCC_debug(interpreter, DEBUG_OPT1, "dead branch deleted %I\n", ins);
            ins = delete_ins(unit, last, 1);
            ostat.deleted_ins++;
            changed++;
        }
        last = ins;
        if (!ins)
            break;
    }
    return changed;
}

/* optimizations with CFG & life info built */
static int
used_once(Parrot_Interp interpreter, IMC_Unit * unit)
{
    Instruction *ins;
    SymReg * r;
    int opt = 0;

    for (ins = unit->instructions; ins; ins = ins->next) {
        if (!ins->r)
            continue;
        r = ins->r[0];
        if (!r)
            continue;
        if (r->use_count == 1 && r->lhs_use_count == 1) {
            IMCC_debug(interpreter, DEBUG_OPT2, "used once '%I' deleted\n", ins);
            ins = delete_ins(unit, ins, 1);
            ins = ins->prev ? ins->prev : unit->instructions;
            ostat.deleted_ins++;
            ostat.used_once++;
            opt++;
        }
    }
    return opt;
}


static int reason;
enum check_t { CHK_INV_NEW, CHK_INV_SET, CHK_CLONE };

static int
_is_ins_save(IMC_Unit * unit, Instruction *check_ins,
        SymReg *r, int what)
{
    Instruction *ins;
    int bb;
    int use_count, lhs_use_count;
    int i, in_use;
    int new_bl=-1, set_bl=-1;

    /* now check all instructions where r is used */

    /* we give up fast ;-) */
    switch (what) {
        case CHK_INV_NEW:
        case CHK_INV_SET:
            if (r->set == 'P' && r->lhs_use_count != 2)
                return reason=1,0;
            if (r->set != 'P' && r->lhs_use_count != 1)
                return reason=2,0;
            break;
        case CHK_CLONE:
            if (r->set == 'P' && r->lhs_use_count != 2)
                return reason=1,0;
            break;
    }

    use_count = r->use_count;
    lhs_use_count = r->lhs_use_count;
    for (bb = 0; bb < unit->n_basic_blocks; bb++) {
        Life_range *lr = r->life_info[bb];

        for (ins = lr->first_ins; ins; ins = ins->next) {
            int nregs;
            /* finished with this range */
            if (!lr->last_ins->next || ins == lr->last_ins->next)
                break;
            for (i = in_use = 0; ins->r[i]; i++)
                if (ins->r[i] == r) {
                    in_use++;
                }
            nregs = i;
            if (!in_use)
                continue;

            /* var is in use in this ins */
            use_count--;
            if (instruction_writes(ins, r)) {
                lhs_use_count--;
                if (!strcmp(ins->op, "new"))
                    new_bl=bb;
                if (!strcmp(ins->op, ""))
                    set_bl=bb;
            }
            /* this is the instruction, to check, it's safe */
            if (check_ins == ins)
                continue;

            /* now look for dangerous ops */
            if (!strcmp(ins->op, "find_global"))
                return reason=4,0;
            if (!strcmp(ins->op, "store_global"))
                return reason=4,0;
            if (!strcmp(ins->op, "push"))
                return reason=4,0;
            if (!strcmp(ins->op, "pop"))
                return reason=4,0;
            if (!strcmp(ins->op, "clone"))
                return reason=4,0;
            /* indexed set/get ??? XXX, as index is ok */
            if (0 && ! strcmp(ins->op, "set") && nregs != 2)
                return reason=5,0;
            /*
             * set P, P  - dangerous?
             */
            if (ins->type & ITALIAS)
                return reason=6,0;
            /* we saw all occurencies of reg, so fine */
            if (lhs_use_count == 0 && use_count == 0) {
                if (what == CHK_INV_SET && new_bl != set_bl)
                    return 0;
                return 1;
            }
        }
        /* we have finished this life range */
    } /* for bb */
    return what == CHK_CLONE ? 1 : (reason=10,0);
}

static int
is_ins_save(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins, SymReg *r, int what)
{
    int save;

    reason = 0;
    save = _is_ins_save(unit, ins, r, what);
    if (!save && reason)
        IMCC_debug(interpreter, DEBUG_OPT2, "ins not save var %s reason %d %I\n",
                r->name, reason, ins);
    return save;
}

#if DO_LOOP_OPTIMIZATION
static int
max_loop_depth(IMC_Unit * unit)
{
    int i, d;
    d = 0;
    for (i = 0; i < unit->n_basic_blocks; i++)
        if (unit->bb_list[i]->loop_depth > d)
            d = unit->bb_list[i]->loop_depth;
    return d;
}

static int
is_invariant(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins)
{
    int ok = 0;
    int what = 0;
    if (! strcmp(ins->op, "new") &&
            !strcmp(ins->r[1]->name, "PerlUndef")) {
        ok = 1;
        what = CHK_INV_NEW;
    }
    /* only, if once assigned and not changed */
    else if (! strcmp(ins->op, "set") &&
            !(ins->r[0]->usage & U_KEYED) &&
            ins->r[1]->type & VTCONST) {
        ok = 1;
        what = CHK_INV_SET;
    }
    if (ok)
        return is_ins_save(interpreter, unit, ins, ins->r[0], what);
    return 0;
}

#define MOVE_INS_1_BL
#ifdef MOVE_INS_1_BL
static Basic_block *
find_outer(IMC_Unit * unit, Basic_block * blk)
{
    int bb = blk->index;
    int i;
    int n_loops = unit->n_loops;
    Loop_info ** loop_info = unit->loop_info;

    /* loops are sorted depth last */
    for (i = n_loops-1; i >= 0; i--)
        if (set_contains(loop_info[i]->loop, bb))
            if (loop_info[i]->entry >= 0)
                return unit->bb_list[loop_info[i]->entry];
    return 0;
}
#endif

/* move the instruction ins before loop in bb */
static int
move_ins_out(Interp *interpreter, IMC_Unit * unit,
                     Instruction **ins, Basic_block *bb)
{
    Basic_block *pred;
    Instruction * next, *out;

    /* check loop_info, where this loop started
     * actually, this moves instruction to block 0 */
#ifdef MOVE_INS_1_BL
    pred = find_outer(unit, bb);
#else
    UNUSED(bb);
    pred = unit->bb_list[0];
#endif
    if (!pred) {
        IMCC_debug(interpreter, DEBUG_OPT2, "outer loop not found (CFG?)\n");
        return 0;
    }
    out = pred->end;
    next = (*ins)->next;
    (*ins)->bbindex = pred->index;
    IMCC_debug(interpreter, DEBUG_OPT2, "inserting it in blk %d after %I\n",
            pred->index, out);
    *ins = move_ins(unit, *ins, out);
    if (0 && (DEBUG_OPT2 & IMCC_INFO(interpreter)->debug)) {
        char buf[256];
        SymReg * regs[IMCC_MAX_REGS];
        Instruction * tmp;

        regs[0] = 0;
        sprintf(buf, "# Invar moved: %s",out->next->op);
        tmp = INS(interpreter, unit, "", buf, regs, 0, 0, 0);
        insert_ins(unit, (*ins)->prev, tmp);
    }
    ostat.invariants_moved++;
    /* XXX CFG is changed here, which also means
     * that the life_info is wrong now
     * so, currently we calc CFG and life again */
    return 1;
}

static int
loop_one(Interp *interpreter, IMC_Unit * unit, int bnr)
{
    Basic_block *bb = unit->bb_list[bnr];
    Instruction *ins;
    int changed = 0;

    if (bnr == 0) {
        IMCC_warning(interpreter, "loop_one", "wrong loop depth in block 0\n");
        return 0;
    }
    IMCC_debug(interpreter, DEBUG_OPT2, "loop_one blk %d\n", bnr);
    for (ins = bb->start ; ins ; ins = ins->next) {
        reason = 0;
        if (is_invariant(interpreter, unit, ins)) {
            IMCC_debug(interpreter, DEBUG_OPT2, "found invariant %I\n", ins);
            if (move_ins_out(interpreter, unit, &ins, bb)) {
                changed++;
                ins = ins->prev;
            }
        }
        if (ins == bb->end)
            break;
    }
    return changed;

}

static int
loop_optimization(Interp *interpreter, IMC_Unit * unit)
{
    int l, bb, loop_depth;
    int changed = 0;
    static int prev_depth;

    loop_depth = prev_depth ? prev_depth : max_loop_depth(unit);
    /* work from inside out */
    IMCC_debug(interpreter, DEBUG_OPT2, "loop_optimization\n");
    for (l = loop_depth; l > 0; l--) {
        IMCC_debug(interpreter, DEBUG_OPT2, "loop_depth %d\n", l);
        for (bb = 0; bb < unit->n_basic_blocks; bb++)
            if (unit->bb_list[bb]->loop_depth == l) {
                changed |= loop_one(interpreter, unit, bb);
            }
        /* currently e.g. mandel.p6 breaks, if not only the most
         * inner loop is changed, but outer loops too */
        if (changed) {
            prev_depth = l-1;
            IMCC_debug(interpreter, DEBUG_OPT2,"after loop_opt\n");
            if (IMCC_INFO(interpreter)->debug>1)
                dump_instructions(interpreter, unit);
            return changed;
        }
    }
    prev_depth = 0;
    return 0;
}
#endif

static int
check_clone(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins)
{
    SymReg * rl = ins->r[0];
    SymReg * rr = ins->r[1];
    if (0 && is_ins_save(interpreter, unit, ins, rl, CHK_CLONE) &&
        is_ins_save(interpreter, unit, ins, rr, CHK_CLONE)) {
        IMCC_debug(interpreter, DEBUG_OPT2, "clone %I removed\n", ins);
        free(ins->op);
        ins->op = str_dup("set");
        return 1;
    }
    return 0;
}

static int
clone_remove(Parrot_Interp interpreter, IMC_Unit * unit)
{
    Instruction *ins;
    int changes = 0;
    IMCC_debug(interpreter, DEBUG_OPT2, "clone_remove\n");
    for (ins = unit->instructions; ins; ins = ins->next)
        if (!strcmp(ins->op, "clone"))
            changes |= check_clone(interpreter, unit, ins);
    return changes;
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
