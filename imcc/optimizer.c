/*
 * optimizer.c
 *
 * pre_optimizer  run before CFG
 * optimizer      after CFG is built
 * post_optimizer after register allocation
 *
 */
#include <string.h>
#include "imc.h"
#include "optimizer.h"


/*
 * pre_optimizer
 * -------------
 *
 * runs before CFG is built
 *
 * if_branch ... converts if/branch/label like so:
 * unused_label ... deletes them (as L1 above)
 * branch_branch ... jump optimization (jumps to jumps ...)
 * strength_reduce ... rewrites e.g add Ix, Ix, y => add Ix, y
 * subst_constants ... rewrite e.g. add_i_ic_ic
 *
 * optimizer
 * ---------
 *
 * runs with CFG and life info
 *
 * used_once ... deletes assignments, when LHS is unused
 * dead_code_remove ... deletes e.g. blocks that are not entered from
 *                      somewhere or ins after a branch, which aren't
 *                      reachable
 * loop_optimization ... pull invariants out of loops
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

static void if_branch(struct Parrot_Interp *, IMC_Unit *);

static int branch_branch(struct Parrot_Interp *interpreter, IMC_Unit *);
static int unused_label(struct Parrot_Interp *interpreter, IMC_Unit *);
static int dead_code_remove(struct Parrot_Interp *interpreter, IMC_Unit *);

static void strength_reduce(struct Parrot_Interp *interpreter, IMC_Unit *);
static void subst_constants_mix(struct Parrot_Interp *interpreter, IMC_Unit *);
static void subst_constants_umix(struct Parrot_Interp *interpreter, IMC_Unit *);
static void subst_constants(struct Parrot_Interp *interpreter, IMC_Unit *);
static void subst_constants_c(struct Parrot_Interp *interpreter, IMC_Unit *);
static void subst_constants_if (struct Parrot_Interp *interpreter, IMC_Unit *);

static int constant_propagation(struct Parrot_Interp *interpreter, IMC_Unit *);
static int used_once(struct Parrot_Interp *, IMC_Unit *);
#if DO_LOOP_OPTIMIZATION
static int loop_optimization(struct Parrot_Interp *, IMC_Unit *);
#endif
static int clone_remove(struct Parrot_Interp *, IMC_Unit *);

void
pre_optimize(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    if (optimizer_level & OPT_PRE) {
        info(interpreter, 2, "pre_optimize\n");
        subst_constants_mix(interpreter, unit);
        subst_constants_umix(interpreter, unit);
        subst_constants(interpreter, unit);
        subst_constants_c(interpreter, unit);
        subst_constants_if (interpreter, unit);
        strength_reduce(interpreter, unit);
        if (!dont_optimize)
            if_branch(interpreter, unit);
    }
}

int
cfg_optimize(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    UNUSED(interpreter);

    if (dont_optimize)
        return 0;
    if (optimizer_level & OPT_PRE) {
        info(interpreter, 2, "cfg_optimize\n");
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
optimize(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    int any = 0;
    if (optimizer_level & OPT_CFG) {
        info(interpreter, 2, "optimize\n");
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

/* get negated opterator for op */
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


/* if cond L1        => unless cond L2
 * branch L2            ---
 * L1:                  L2:
 */
static void
if_branch(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *last;
    int reg;

    last = unit->instructions;
    if (!last->next)
        return;
    info(interpreter, 2, "\tif_branch\n");
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

                debug(interpreter, DEBUG_OPT1,"if_branch %s ... %s\n",
                        last->op, br_dest->name);
                /* find the negated op (e.g if->unless, ne->eq ... */
                if ((neg_op = get_neg_op(last->op, &args)) != 0) {
                    Instruction * tmp;
                    last->r[reg] = go;
                    tmp = INS(interpreter, unit, (char*)neg_op, "", last->r, args, 0, 0);
                    last->opnum = tmp->opnum;
                    last->opsize = tmp->opsize;
                    free(last->op);
                    last->op = str_dup(neg_op);
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

/* these are run after constant simplification, so it is
 * guaranteed, that one operand is non constant, if opsize == 4
 */
static void
strength_reduce(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    const char *ops[] = { "add", "sub", "mul", "div" };
    int i, found;
    SymReg *r;

    info(interpreter, 2, "\tstrength_reduce\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        /*
         * add Ix, Ix, Iy => add Ix, Iy
         * sub Ix, Ix, Iy => sub Ix, Iy
         * ...
         */
        found = 0;
        for (i = 0; i < 4; i++) {
            if (ins->opsize == 4 &&
                    ins->r[0] == ins->r[1] &&
                    (ins->r[0]->set == 'I' || ins->r[0]->set == 'N') &&
                    !strcmp(ins->op, ops[i])) {
                debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
                ins->r[1] = ins->r[2];
                tmp = INS(interpreter, unit, ins->op, "", ins->r, 2, 0, 0);
                debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
                subst_ins(unit, ins, tmp, 1);
                ins = tmp;
                found = 1;
                break;
            }
        }
        if (found)
            continue;
        /*
         * mul Ix, Iy, 0 => set Ix, 0
         * mul Ix, 0, Iy => set Ix, 0
         * mul Ix, 0     => set Ix, 0
         */
    if ( ( ( ins->opsize >= 3 &&
                    ins->r[1]->type == VTCONST &&
                    atof(ins->r[1]->name) == 0.0) ||
                    (ins->opsize == 4 &&
                     ins->r[2]->type == VTCONST &&
                     atof(ins->r[2]->name) == 0.0)) &&
                !strcmp(ins->op, "mul")) {
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            r = mk_const(str_dup("0"), ins->r[0]->set);
            --ins->r[1]->use_count;
            if (ins->opsize == 4)
                --ins->r[2]->use_count;
            ins->r[1] = r;
            tmp = INS(interpreter, unit, "set", "", ins->r, 2, 0, 0);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            continue;
        }
        /*
         * mul Ix, Iy, 1 => set Ix, Iy
         * mul Ix, 1, Iy => set Ix, Iy
         * mul Ix, 1     => delete
         */
        if ( ( ( ins->opsize >= 3 &&
                        ins->r[1]->type == VTCONST &&
                        atof(ins->r[1]->name) == 1.0) ||
                    (ins->opsize == 4 &&
                     ins->r[2]->type == VTCONST &&
                     atof(ins->r[2]->name) == 1.0)) &&
                !strcmp(ins->op, "mul")) {
set_it:
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            if (ins->opsize == 3) {
                /* mul Ix, 1 */
                ins = delete_ins(unit, ins, 1);
                ins = ins->prev ? ins->prev : unit->instructions;
                debug(interpreter, DEBUG_OPT1, "deleted\n");
                continue;
            }
            if (ins->r[1]->type == VTCONST) {
                --ins->r[1]->use_count;
                ins->r[1] = ins->r[2];
            }
            else {
                --ins->r[2]->use_count;
            }
            tmp = INS(interpreter, unit, "set", "", ins->r, 2, 0, 0);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
            continue;
        }
        /*
         * div Ix, Iy, 1 => set Ix, Iy
         * div Ix, 1     => delete
         */
        if ( ( ( ins->opsize == 3 &&
                        ins->r[1]->type == VTCONST &&
                        atof(ins->r[1]->name) == 1.0) ||
                    (ins->opsize == 4 &&
                     ins->r[2]->type == VTCONST &&
                     atof(ins->r[2]->name) == 1.0)) &&
                !strcmp(ins->op, "div")) {
            goto set_it;
        }
    }
}


/*
 * does conservative constant propogation
 * this code will not propogate constants past labels or saves
 * even though sometimes it may be safe
 */

static int
constant_propagation(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *ins2;
    int op;
    int i;
    char fullname[128];
    SymReg *c, *old, *o;
    int any = 0;

    info(interpreter, 2, "\tconstant_propagation\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        if (!strcmp(ins->op, "set") &&
                ins->opsize == 3 &&             /* no keyed set */
                ins->r[1]->type == VTCONST &&
                ins->r[0]->set != 'P') {        /* no PMC consts */
            c = ins->r[1];
            o = ins->r[0];

            debug(interpreter, DEBUG_OPT1,
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
                            debug(interpreter, DEBUG_OPT2,
                                    "\tpropagating into %I register %i",
                                    ins2, i);
                            old = ins2->r[i];
                            ins2->r[i] = c;
                            op = check_op(interpreter, fullname, ins2->op,
                                    ins2->r, ins2->opsize, ins2->keys);
                            if (op < 0) {
                                ins2->r[i] = old;
                                debug(interpreter, DEBUG_OPT2," - no %s\n", fullname);
                            }
                            else {
                                --old->use_count;
                                ins2->opnum = op;
                                any = 1;
                                debug(interpreter, DEBUG_OPT2," -> %I\n", ins2);
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
 * rewrite e.g. add_n_nc_ic => add_n_nc_nc
 */
static void
subst_constants_mix(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    const char *ops[] = {
        "add", "sub", "mul", "div", "pow", "atan"
    };
    size_t i;
    char b[128];
    SymReg *r;

    info(interpreter, 2, "\tsubst_constants_mix\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
            /* TODO compare ins->opnum with a list of instructions
             * containing add_n_nc_ic, ...
             */
            if (!strcmp(ins->op, ops[i]) && ins->opsize == 4 &&
                    ins->r[1]->type == VTCONST &&
                    ins->r[1]->set == 'N' &&
                    ins->r[2]->type == VTCONST &&
                    ins->r[2]->set == 'I') {
                debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
                strcpy(b, ins->r[2]->name);
                r = mk_const(str_dup(b), 'N');
                --ins->r[2]->use_count;
                ins->r[2] = r;
                tmp = INS(interpreter, unit, ins->op, "", ins->r, 3, 0, 0);
                debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
                subst_ins(unit, ins, tmp, 1);
                ins = tmp;
            }
        }
    }
}

/*
 * rewrite e.g. add_n_ic => add_n_nc
 */
static void
subst_constants_umix(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    const char *ops[] = {
        "add", "div", "mul", "sub"
    };
    size_t i;
    char b[128];
    SymReg *r;

    info(interpreter, 2, "\tsubst_constants_umix\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
            /* TODO compare ins->opnum with a list of instructions
             * containing add_n_ic, ...
             */
            if (ins->opsize == 3 &&
                    ins->r[0]->set == 'N' &&
                    ins->r[1]->type == VTCONST &&
                    ins->r[1]->set == 'I' &&
                    !strcmp(ins->op, ops[i])) {
                debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
                strcpy(b, ins->r[1]->name);
                r = mk_const(str_dup(b), 'N');
                --ins->r[1]->use_count;
                ins->r[1] = r;
                tmp = INS(interpreter, unit, ins->op, "", ins->r, 2, 0, 0);
                debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
                subst_ins(unit, ins, tmp, 1);
                ins = tmp;
            }
        }
    }
}

static void
eval_ins(struct Parrot_Interp *interpreter, Instruction *ins, size_t ops)
{
    opcode_t eval[4];
    char op[20];
    int opnum;
    size_t i;

    /*
     * find instruction e.g. add_i_ic_ic => add_i_i_i
     */
    if (ops == 4)
        sprintf(op, "%s_%c_%c_%c", ins->op, tolower(ins->r[0]->set),
                tolower(ins->r[1]->set), tolower(ins->r[2]->set));
    else
        sprintf(op, "%s_%c_%c", ins->op, tolower(ins->r[0]->set),
                tolower(ins->r[1]->set));
    opnum = interpreter->op_lib->op_code(op, 1);
    if (opnum < 0)
        fatal(1, "eval_ins", "op '%s' not found\n", op);
    /* now fill registers */
    for (i = 0; i < ops; i++) {
        switch (interpreter->op_info_table[opnum].types[i]) {
            case PARROT_ARG_OP:
                eval[i] = opnum;
                break;
            case PARROT_ARG_I:
            case PARROT_ARG_N:
                eval[i] = i - 1;        /* result in I0/N0 */
                if (i > 1) {    /* fill source regs */
                    switch (ins->r[i-1]->set) {
                        case 'I':
                            interpreter->int_reg.registers[i-1] =
                                (INTVAL)atoi(ins->r[i-1]->name);
                            break;
                        case 'N':
                            interpreter->num_reg.registers[i-1] =
                                (FLOATVAL)atof(ins->r[i-1]->name);
                            break;
                    }
                }
                break;
            default:
                fatal(1, "eval_ins", "invalid arg #%d for op '%s' not found\n",
                        i, op);
        }
    }

    /* eval the opcode */
    (interpreter->op_func_table[opnum]) (eval, interpreter);
}

/*
 * rewrite e.g. add_n_nc_nc => set_n_nc
 *          or  abs_i_ic => set_i_ic
 */
static void
subst_constants(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    const char *ops[] = {
        "add", "sub", "mul", "div", "cmod", "mod", "pow", "atan"
        "shr", "srl", "lsr",
        "band", "bor", "bxor",
        "and", "or", "xor"
    };
    const char *ops2[] = {
        "abs", "neg", "acos", "asec", "asin",
        "atan", "cos", "cosh", "exp", "ln", "log10", "log2", "sec",
        "sech", "sin", "sinh", "tan", "tanh", "fact"
    };
    size_t i;
    char b[128], fmt[64];
    SymReg *r;
    struct Parrot_Context *ctx;
    int found;

    /* save interpreter ctx */
    info(interpreter, 2, "\tsubst_constants\n");
    ctx = mem_sys_allocate(sizeof(struct Parrot_Context));
    mem_sys_memcopy(ctx, &interpreter->ctx, sizeof(struct Parrot_Context));
    /* construct a FLOATVAL_FMT with needed precision */
    switch (NUMVAL_SIZE) {
        case 8:
            strcpy(fmt, "%0.16g");
            break;
        case 12:
            strcpy(fmt, "%0.18Lg");
            break;
        default:
            warning(interpreter, "subs_constants", "used default FLOATVAL_FMT\n");
            strcpy(fmt, FLOATVAL_FMT);
            break;
    }

    for (ins = unit->instructions; ins; ins = ins->next) {
        found = 0;
        for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
            /* TODO compare ins->opnum with a list of instructions
             * containing add_i_ic_ic, add_n_nc_nc ...
             */
            if (ins->opsize == 4 &&
                    ins->r[1]->type == VTCONST &&
                    ins->r[2]->type == VTCONST &&
                    !strcmp(ins->op, ops[i])) {
                found = 1;
                break;
            }
        }
        for (i = 0; !found && i < sizeof(ops2)/sizeof(ops2[0]); i++) {
            if (ins->opsize == 3 &&
                    ins->r[1]->type == VTCONST &&
                    !strcmp(ins->op, ops2[i])) {
                found = 1;
                break;
            }
        }
        if (!found)
            continue;
        debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
        /* we construct a parrot instruction
         * here and let parrot do the calculation in a
         * separate context and make a constant
         * from the result
         */
        eval_ins(interpreter, ins, ins->opsize);
        /* result is in I0/N0 */
        switch (ins->r[0]->set) {
            case 'I':
                sprintf(b, INTVAL_FMT, interpreter->int_reg.registers[0]);
                break;
            case 'N':
                sprintf(b, fmt, interpreter->num_reg.registers[0]);
                break;
        }
        r = mk_const(str_dup(b), ins->r[0]->set);
        --ins->r[1]->use_count;
        if (ins->opsize == 4)
            --ins->r[2]->use_count;
        ins->r[1] = r;
        tmp = INS(interpreter, unit, "set", "", ins->r, 2, 0, 0);
        debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
        subst_ins(unit, ins, tmp, 1);
        ins = tmp;
    }
    mem_sys_memcopy(&interpreter->ctx, ctx, sizeof(struct Parrot_Context));
    mem_sys_free(ctx);
}

/*
 * rewrite e.g. eq_ic_ic_ic => branch_ic/nothing
 */
static void
subst_constants_c(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    const char *ops[] = { "eq", "ne", "gt", "ge", "lt", "le" };
    size_t i;
    int res;

    info(interpreter, 2, "\tsubst_constants_c\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
            /* TODO s. above */
            if (ins->opsize == 4 &&
                    ins->r[0]->type == VTCONST &&
                    ins->r[1]->type == VTCONST &&
                    !strcmp(ins->op, ops[i])) {
                debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
                switch (i) {
                    case 0:     /* eq */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = (atoi(ins->r[0]->name) ==
                                        atoi(ins->r[1]->name));
do_res:
                                --ins->r[0]->use_count;
                                --ins->r[1]->use_count;
                                if (res) {
                                    ins->r[0] = ins->r[2];
                                    tmp = INS(interpreter, unit, "branch", "", ins->r,
                                            1, 0, 0);
                                    debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
                                    subst_ins(unit, ins, tmp, 1);
                                    ins = tmp;
                                }
                                else {
                                    debug(interpreter, DEBUG_OPT1, "deleted\n");
                                    ins = delete_ins(unit, ins, 1);
                                    ins = ins->prev ? ins->prev : unit->instructions;
                                }
                                break;
                            case 'N':
                                res = (atof(ins->r[0]->name) ==
                                        atof(ins->r[1]->name));
                                goto do_res;
                            case 'S':
                                res = !strcmp(ins->r[0]->name,
                                        ins->r[1]->name);
                                goto do_res;
                        }
                        break;
                    case 1:     /* ne */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = (atoi(ins->r[0]->name) !=
                                        atoi(ins->r[1]->name));
                                goto do_res;
                            case 'N':
                                res = (atof(ins->r[0]->name) !=
                                        atof(ins->r[1]->name));
                                goto do_res;
                            case 'S':
                                res = strcmp(ins->r[0]->name,
                                        ins->r[1]->name);
                                goto do_res;
                        }
                        break;
                    case 2:     /* gt */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = (atoi(ins->r[0]->name) >
                                        atoi(ins->r[1]->name));
                                goto do_res;
                            case 'N':
                                res = (atof(ins->r[0]->name) >
                                        atof(ins->r[1]->name));
                                goto do_res;
                            case 'S':
                                res = strcmp(ins->r[0]->name,
                                        ins->r[1]->name) > 0;
                                goto do_res;
                        }
                        break;
                    case 3:     /* ge */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = (atoi(ins->r[0]->name) >=
                                        atoi(ins->r[1]->name));
                                goto do_res;
                            case 'N':
                                res = (atof(ins->r[0]->name) >=
                                        atof(ins->r[1]->name));
                                goto do_res;
                            case 'S':
                                res = strcmp(ins->r[0]->name,
                                        ins->r[1]->name) >= 0;
                                goto do_res;
                        }
                        break;
                    case 4:     /* lt */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = (atoi(ins->r[0]->name) <
                                        atoi(ins->r[1]->name));
                                goto do_res;
                            case 'N':
                                res = (atof(ins->r[0]->name) <
                                        atof(ins->r[1]->name));
                                goto do_res;
                            case 'S':
                                res = strcmp(ins->r[0]->name,
                                        ins->r[1]->name) < 0;
                                goto do_res;
                        }
                        break;
                    case 5:     /* le */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = (atoi(ins->r[0]->name) <=
                                        atoi(ins->r[1]->name));
                                goto do_res;
                            case 'N':
                                res = (atof(ins->r[0]->name) <=
                                        atof(ins->r[1]->name));
                                goto do_res;
                            case 'S':
                                res = strcmp(ins->r[0]->name,
                                        ins->r[1]->name) <= 0;
                                goto do_res;
                        }
                        break;
                }
            }
        }
    }
}

/*
 * rewrite e.g. if_ic_ic => branch_ic/nothing
 */
static void
subst_constants_if (struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    const char *ops[] = { "if", "unless" };
    size_t i;
    int res;

    info(interpreter, 2, "\tsubst_constants_if\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        for (i = 0; i < sizeof(ops)/sizeof(ops[0]); i++) {
            /* TODO s. above */
            if (ins->opsize == 3 &&
                    ins->r[0]->type == VTCONST &&
                    !strcmp(ins->op, ops[i])) {
                debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
                switch (i) {
                    case 0:     /* if */
                    case 1:     /* unless */
                        switch (ins->r[0]->set) {
                            case 'I':
                                res = atoi(ins->r[0]->name);
do_res:
                                --ins->r[0]->use_count;
                                if (i)
                                    res = !res;
                                if (res) {
                                    ins->r[0] = ins->r[1];
                                    tmp = INS(interpreter, unit, "branch", "", ins->r,
                                            1, 0, 0);
                                    debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
                                    subst_ins(unit, ins, tmp, 1);
                                    ins = tmp;
                                }
                                else {
                                    debug(interpreter, DEBUG_OPT1, "deleted\n");
                                    ins = delete_ins(unit, ins, 1);
                                    ins = ins->prev ? ins->prev : unit->instructions;
                                }
                                break;
                            case 'N':
                                res = atof(ins->r[1]->name) != 0.0;
                                goto do_res;
                            case 'S':
                                break;
#if 0
  /* UNREACHABLE */
                                /* TODO strings have quote marks around them,
                                 * strip these in lexer
                                 */
                                s = ins->r[0]->name;
                                res = *s && (*s != '0' || s[1]);
                                goto do_res;
#endif
                        }
                        break;
                }
            }
        }
    }
}


/* optimizations with CFG built */

/*
 * branch L1  => branch L2
 * ...
 * L1:
 * branch L2
 *
 */
static int
branch_branch(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins, *next;
    SymReg * r;
    int changed = 0;

    info(interpreter, 2, "\tbranch_branch\n");
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
                    debug(interpreter, DEBUG_OPT1,
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

static int
unused_label(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Instruction *ins;
    int used;
    int i;
    int changed = 0;

    info(interpreter, 2, "\tunused_label\n");
    for (i=1; i < unit->n_basic_blocks; i++) {
	ins = unit->bb_list[i]->start;
        if ((ins->type & ITLABEL) && *ins->r[0]->name != '_') {
            SymReg * lab = ins->r[0];
            used = 0;
            if (has_compile)
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
                debug(interpreter, DEBUG_OPT1, "block %d label %s deleted\n", i, lab->name);
                ostat.deleted_ins++;
                ins = delete_ins(unit, ins, 1);
                changed = 1;
            }

        }
    }
    return changed;
}

static int
dead_code_remove(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    Basic_block *bb;
    int i;
    int changed = 0;
    Instruction *ins, *last;

    /* this could be a separate level, now it's done with -O1 */
    if (!(optimizer_level & OPT_PRE))
        return 0;
    info(interpreter, 2, "\tdead_code_remove\n");
    for (i=1; i < unit->n_basic_blocks; i++) {
	bb = unit->bb_list[i];
        if ((bb->start->type & ITLABEL) && *bb->start->r[0]->name == '_')
            continue;
        /* this block isn't entered from anywhere */
        if (!bb->pred_list) {
            int bbi = bb->index;
            debug(interpreter, DEBUG_OPT1, "found dead block %d\n", bb->index);
            for (ins = bb->start; ins && ins->bbindex == bbi; ) {
                debug(interpreter, DEBUG_OPT1,
                        "\tins deleted (dead block) %I\n", ins);
                ins = delete_ins(unit, ins, 1);
                ostat.deleted_ins++;
                changed++;
            }
        }
    }
    for (last = unit->instructions, ins=last->next; last && ins; ins = ins->next) {
        if ((last->type & IF_goto) && !(ins->type & ITLABEL) &&
                !strcmp(last->op, "branch")) {
            debug(interpreter, DEBUG_OPT1,
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
            debug(interpreter, DEBUG_OPT1, "dead branch deleted %I\n", ins);
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
            debug(interpreter, DEBUG_OPT2, "used once '%I' deleted\n", ins);
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
            /* this is the instruction, to check, it's save */
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
        debug(interpreter, DEBUG_OPT2, "ins not save var %s reason %d %I\n",
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
move_ins_out(struct Parrot_Interp *interpreter, IMC_Unit * unit,
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
        debug(interpreter, DEBUG_OPT2, "outer loop not found (CFG?)\n");
        return 0;
    }
    out = pred->end;
    next = (*ins)->next;
    (*ins)->bbindex = pred->index;
    debug(interpreter, DEBUG_OPT2, "inserting it in blk %d after %I\n",
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
loop_one(struct Parrot_Interp *interpreter, IMC_Unit * unit, int bnr)
{
    Basic_block *bb = unit->bb_list[bnr];
    Instruction *ins;
    int changed = 0;

    if (bnr == 0) {
        warning(interpreter, "loop_one", "wrong loop depth in block 0\n");
        return 0;
    }
    debug(interpreter, DEBUG_OPT2, "loop_one blk %d\n", bnr);
    for (ins = bb->start ; ins ; ins = ins->next) {
        reason = 0;
        if (is_invariant(interpreter, unit, ins)) {
            debug(interpreter, DEBUG_OPT2, "found invariant %I\n", ins);
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
loop_optimization(struct Parrot_Interp *interpreter, IMC_Unit * unit)
{
    int l, bb, loop_depth;
    int changed = 0;
    static int prev_depth;

    loop_depth = prev_depth ? prev_depth : max_loop_depth(unit);
    /* work from inside out */
    debug(interpreter, DEBUG_OPT2, "loop_optimization\n");
    for (l = loop_depth; l > 0; l--) {
        debug(interpreter, DEBUG_OPT2, "loop_depth %d\n", l);
        for (bb = 0; bb < unit->n_basic_blocks; bb++)
            if (unit->bb_list[bb]->loop_depth == l) {
                changed |= loop_one(interpreter, unit, bb);
            }
        /* currently e.g. mandel.p6 breaks, if not only the most
         * inner loop is changed, but outer loops too */
        if (changed) {
            prev_depth = l-1;
            debug(interpreter, DEBUG_OPT2,"after loop_opt\n");
            if (IMCC_INFO(interpreter)->debug>1)
                dump_instructions(unit);
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
        debug(interpreter, DEBUG_OPT2, "clone %I removed\n", ins);
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
    debug(interpreter, DEBUG_OPT2, "clone_remove\n");
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
