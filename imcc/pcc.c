/*
 * pcc.c
 *
 * A specific calling convention implementation. Called by the generic
 * API for subs (see sub.c).
 *
 * FASTCALL convention can be enabled with:
 * .pragma fastcall
 * at the start of an IMC module.
 *
 * TODO enable default non/prototyped too with this pragma.
 *
 * This will allow library developers (or non-Perl languages) to turn
 * on very efficient optimizations and a lightweight calling convention.
 * It could also be used for internal libs that do not callout to PCC
 * routines, but present PCC entry points for the module itself.
 *
 * XXX FIXME: FASTCALL is not currently finished and may not be completely
 * compatible with PCC convention. (ie. you can't mix and match, for now at least)
 *
 * see: docs/pdds/pdd03_calling_conventions.pod
 *
 * PCC Implementation by Leopold Toetsch
 */

#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "imc.h"
#include "parser.h"


/* Local definitions and static data for PCC code emitter.
 * This is more for making the code self-documenting than
 * making it easily configurable.
 */

/* For PCC prototyped subs, the params go in registers
 * 5-15 for each set (P,I,N,S)
 */
#define FIRST_PARAM_REG 5
#define LAST_PARAM_REG 15

#define REG_PROTO_FLAG    0
#define REG_I_PARAM_COUNT 1
#define REG_S_PARAM_COUNT 2
#define REG_P_PARAM_COUNT 3
#define REG_N_PARAM_COUNT 4

#define REGSET_I 0
#define REGSET_S 1
#define REGSET_P 2
#define REGSET_N 3
#define REGSET_MAX 4

static const char regsets[] = "ISPN";

/* forward def */
static Instruction *
pcc_emit_flatten(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        SymReg *arg, int i, int *flatten, SymReg **last);



/*
 * Utility instruction routine. Creates and inserts an instruction
 * into the current block in one call.
 */
static Instruction *
insINS(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        char *name, SymReg **regs, int n)
{
    Instruction *tmp = INS(interp, unit, name, NULL, regs, n, 0, 0);
    insert_ins(unit, ins, tmp);
    return tmp;
}

/*
 * get or create the SymReg
 */
SymReg*
get_pasm_reg(Interp* interp, char *name)
{
    SymReg *r;

    if ((r = _get_sym(cur_unit->hash, name)))
        return r;
    return mk_pasm_reg(interp, str_dup(name));
}

SymReg*
get_const(Interp *interp, const char *name, int type)
{
    SymReg *r;

    if ((r = _get_sym(IMCC_INFO(interp)->ghash, name)) && r->set == type)
        return r;
    return mk_const(interp, str_dup(name), type);
}

static Instruction *
set_I_const(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
            int regno, int value)
{
    SymReg *ix, *regs[IMCC_MAX_REGS], *arg;
    char buf[128];

    sprintf(buf, "I%d", regno);
    ix = get_pasm_reg(interp, buf);
    sprintf(buf, "%d", value);
    arg = get_const(interp, buf, 'I');
    regs[0] = ix;
    regs[1] = arg;
    return insINS(interp, unit, ins, "set", regs, 2);
}

/*
 * get arguments or return results
 * used by expand_pcc_sub_call and expand_pcc_sub
 */
static Instruction*
pcc_get_args(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        struct pcc_sub_t *pcc_sub, int n, int proto, SymReg **args)
{
    int next[4], i, j, set;
    SymReg *p3, *regs[IMCC_MAX_REGS], *arg;
    char buf[128];

    p3 = NULL;
    UNUSED(pcc_sub);
    for (i = 0; i < REGSET_MAX; i++)
        next[i] = FIRST_PARAM_REG;
    /* insert params */
    for (i = 0; i < n; i++) {
        arg = args[i];
        for (j = 0; j < REGSET_MAX; j++) {
            set = j;
            /*
             * if this is non-prototyped, register set is always P
             */
            if (arg->set != regsets[set])
                continue;
            /*
             * non-prototyped reg sets don't match
             */
            if (!proto && arg->set != 'P') {
                /* we need a native type and get P
                 *
                 * set arg, $Pn
                 */
                set = REGSET_P;
                if (next[REGSET_P] > LAST_PARAM_REG)
                    goto overflow;
                regs[0] = arg;
                sprintf(buf, "P%d", next[set]++);
                regs[1] = get_pasm_reg(interp, buf);
                /* e.g. set $I0, I5 */
                ins = insINS(interp, unit, ins, "set", regs, 2);
                break;
            }
            if (next[set] > LAST_PARAM_REG) {
                goto overflow;
            }
            /*
             * if register number already matches - fine
             */
            if (arg->color == next[set]) {
                next[set]++;
                break;
            }
            /* assign register to that param
             *
             * if this subroutine calls another subroutine
             * new registers are assigned so that
             * they don't interfere with this sub's params
             *
             * And in a return sequence too, as the usage of
             * returns and args might conflict.
             */
            regs[0] = arg;
            sprintf(buf, "%c%d", arg->set, next[set]++);
            regs[1] = get_pasm_reg(interp, buf);
            arg->used = regs[1];
            /* e.g. set $I0, I5 */
            ins = insINS(interp, unit, ins, "set", regs, 2);
        }
        continue;
overflow:
        if (!p3)
            p3 = get_pasm_reg(interp, "P3");
        /* this uses register numbers (if any)
         * from the first prototyped pass
         */
        regs[0] = arg;
        regs[1] = p3;
        ins = insINS(interp, unit, ins, "shift", regs, 2);
    } /* n params */
    return ins;
}

/*
 * put arguments or return results
 */
static Instruction*
pcc_put_args(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        struct pcc_sub_t *pcc_sub, int n, int proto, SymReg **args)
{
    int next[4], i, j, set;
    SymReg *p3, *regs[IMCC_MAX_REGS], *arg, *reg, *last;
    char buf[128];
    Instruction *tmp;
    int flatten;

    p3 = NULL;
    UNUSED(pcc_sub);
    flatten = 0;
    for (i = 0; i < REGSET_MAX; i++)
        next[i] = FIRST_PARAM_REG;
    for (i = 0; i < n; i++) {
        /*
         * If prototyped, first 11 I,S,N arguments go into registers
         */
        arg = args[i];
        for (j = 0; j < REGSET_MAX; j++) {
            set = j;
            /*
             * If this is non-prototyped, register set is always P
             */
            if (arg->set != regsets[set])
                continue;
            /*
             * Non-prototyped register sets don't match
             */
            if (!proto && arg->set != 'P') {
                set = REGSET_P;
                if (next[REGSET_P] > LAST_PARAM_REG)
                    goto overflow;
                /* Make a new P register and assign value */
                sprintf(buf, "P%d", next[set]++);
                reg = get_pasm_reg(interp, buf);
                tmp = iNEW(interp, unit, reg, str_dup("Undef"), NULL, 0);
                insert_ins(unit, ins, tmp);
                ins = tmp;
                regs[0] = reg;
                regs[1] = arg;
                ins = insINS(interp, unit, ins, "set", regs, 2);
                break;
            }
            if (next[REGSET_P] == LAST_PARAM_REG) {
                /* clear P3 */
                regs[0] = get_pasm_reg(interp, "P3");
                ins = insINS(interp, unit, ins, "null", regs, 1);
            }
            if (next[set] > LAST_PARAM_REG) {
                goto overflow;
            }
            /*
             * if register number already matches - fine
             */
            if (arg->color == next[set] && (arg->type & VTREGISTER)) {
                next[set]++;
                break;
            }
            if (arg->type & VTREGISTER) {
                if (set == REGSET_P &&
                        (flatten || (arg->type & VT_FLATTEN)))
                    goto flatten;
                /*
                 * a remark WRT want_regno
                 *
                 * It should eventually designate the register
                 * number used during calls and returns according
                 * to parrot calling conventions.
                 *
                 * Currently these assigned colors are used if
                 * allocate_wanted_regs() is turned on with -Oc.
                 *
                 * But with allocate regs a call that doesn't
                 * want return results breaks:
                 *
                 * P5 = arg1          # P5 is pre-assigned
                 * func1()
                 * func2(P5)
                 * ...
                 * func1:
                 *    .return(Px)     # P5
                 *
                 * The return sequence of func1 copies P5 and clobbers
                 * the caller's P5, because the caller thinks P5 is save
                 * to use over the call to func1()
                 *
                 * So currently want_regno isn't assigned at all.
                 */

                /* arg->want_regno = next[set]; */
            }
            sprintf(buf, "%c%d", arg->set, next[set]++);
            reg = get_pasm_reg(interp, buf);
            regs[0] = reg;
            regs[1] = arg;
            ins = insINS(interp, unit, ins, "set", regs, 2);
            /* remember register for life analysis */
            arg->used = reg;

            continue;
overflow:
            if (!p3) {
                p3 = get_pasm_reg(interp, "P3");
                tmp = iNEW(interp, unit, p3, str_dup("PerlArray"), NULL, 0);
                insert_ins(unit, ins, tmp);
                ins = tmp;
            }
            if (flatten || (arg->type & VT_FLATTEN))
                goto flatten;
            regs[0] = p3;
            regs[1] = arg;
            ins = insINS(interp, unit, ins, "push", regs, 2);
        }
        continue;
flatten:
        /* if we had a flattening arg, we must continue emitting
         * code to do all at runtime
         */
        ins = pcc_emit_flatten(interp, unit, ins, arg, i, &flatten,
                &last);
    } /* for i */

    /* set prototyped: I0  (1=prototyped, 0=non-prototyped) */
    ins = set_I_const(interp, unit, ins, REG_PROTO_FLAG, proto);

    /* Ireg param count in: I1 */
    ins = set_I_const(interp, unit, ins, REG_I_PARAM_COUNT,
            next[REGSET_I] - FIRST_PARAM_REG);

    /* Sreg param count in: I2 */
    ins = set_I_const(interp, unit, ins, REG_S_PARAM_COUNT,
            next[REGSET_S] - FIRST_PARAM_REG);

    /* set items in PRegs: I3 */
    if (flatten) {
        SymReg *i3;
        /* if I3 > 16 set it to 16 */
        i3 = get_pasm_reg(interp, "I3");;
        regs[0] = i3;
        regs[1] = mk_const(interp, str_dup("16"), 'I');
        regs[2] = last;
        ins = insINS(interp, unit, ins, "lt", regs, 3);
        ins = insINS(interp, unit, ins, "set", regs, 2);
        tmp = INS_LABEL(unit, last, 0);
        insert_ins(unit, ins, tmp);
        ins = tmp;
        /* finally subtract 5 */
        regs[0] = i3;
        regs[1] = mk_const(interp, str_dup("5"), 'I');
        ins = insINS(interp, unit, ins, "sub", regs, 2);
    }
    else
        ins = set_I_const(interp, unit, ins, REG_P_PARAM_COUNT,
                next[REGSET_P] - FIRST_PARAM_REG);

    /* Nreg param count in: I4 */
    ins = set_I_const(interp, unit, ins, REG_N_PARAM_COUNT,
            next[REGSET_N] - FIRST_PARAM_REG);
    return ins;
}

/*
 * Expand a PCC (Parrot Calling Convention) subroutine
 * by generating the appropriate prologue and epilogue
 * for parameter passing/returning.
 */
void
expand_pcc_sub(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub;
    int nargs;
    int proto, ps, pe;
    Instruction *tmp;
    SymReg *i0, *regs[IMCC_MAX_REGS], *label1, *label2;
    char buf[128];

    sub = ins->r[1];

    /* Don't generate any parameter checking code if there
     * are no named arguments.
     */
    if(sub->pcc_sub->nargs <= 0)
        goto NONAMEDPARAMS;

    i0 = NULL;
    label1 = label2 = NULL;
    ps = pe = sub->pcc_sub->pragma & P_PROTOTYPED;
    if (!pe && (sub->pcc_sub->pragma & P_NONE)) {
        int i, all_pmc;

        /* subroutine can handle both */
        ps = 0; pe = 1;
        /* check if PMC only */
        for (all_pmc = 1, i = 0; i < sub->pcc_sub->nargs; ++i)
            if (sub->pcc_sub->args[i]->set != 'P') {
                all_pmc = 0;
                break;
            }
        if (all_pmc) {
            ps = pe = 1;
        }
        else {
            /* and subroutine has mixed args */
            i0 = get_pasm_reg(interp, "I0");
            regs[0] = i0;
            sprintf(buf, "%csub_%s_p1", IMCC_INTERNAL_CHAR, sub->name);
            regs[1] = label1 =
                mk_address(interp, str_dup(buf), U_add_uniq_label);
            ins = insINS(interp, unit, ins, "if", regs, 2);
        }
    }
    for (proto = ps; proto <= pe; ++proto) {
        nargs = sub->pcc_sub->nargs;
        ins = pcc_get_args(interp, unit, ins, sub->pcc_sub, nargs,
                proto, sub->pcc_sub->args);
        if (ps != pe) {
            if (!proto) {
                /* branch to the end */
                sprintf(buf, "%csub_%s_p0", IMCC_INTERNAL_CHAR, sub->name);
                regs[0] = label2 =
                    mk_address(interp, str_dup(buf), U_add_uniq_label);
                ins = insINS(interp, unit, ins, "branch", regs, 1);
                tmp = INS_LABEL(unit, label1, 0);
                insert_ins(unit, ins, tmp);
                ins = tmp;
            }
            else {
                tmp = INS_LABEL(unit, label2, 0);
                insert_ins(unit, ins, tmp);
                ins = tmp;
            }
        }
    } /* proto */

NONAMEDPARAMS: /* If no named params, don't generate any param code */

    /*
     * if this sub references self, fetch it
     */
    if (unit->type & IMC_HAS_SELF) {
        regs[0] = get_sym("self");
        assert(regs[0]);

        sprintf(buf, "%d", CURRENT_OBJECT);
        regs[1] = get_const(interp, buf, 'I');
        ins = insINS(interp, unit, ins, "interpinfo", regs, 2);
    }
    /*
     * check if there is a return
     */

    if (unit->last_ins->type != (ITPCCSUB|ITLABEL) &&
            strcmp(unit->last_ins->op, "ret") &&
            strcmp(unit->last_ins->op, "exit") &&
            strcmp(unit->last_ins->op, "end")
       ) {
        if (sub->pcc_sub->pragma & P_MAIN) {
            tmp = INS(interp, unit, "end", NULL, regs, 0, 0, 0);
        }
        else {

            ins = unit->last_ins;
            regs[0] = get_pasm_reg(interp, "I0");  /* proto ret */
            ins = insINS(interp, unit, ins, "null", regs, 1);
            regs[0] = get_pasm_reg(interp, "I3");  /* no P regs */
            ins = insINS(interp, unit, ins, "null", regs, 1);
            tmp = INS(interp, unit, "returncc", NULL, regs, 0, 0, 0);
        }
        IMCC_debug(interp, DEBUG_IMC, "add sub ret - %I\n", tmp);
        insert_ins(unit, unit->last_ins, tmp);
    }
    /*
     * a coroutine (generator) needs a small hook that gets called
     * from the shift_pmc() vtable
     */
    if (sub->pcc_sub->calls_a_sub & ITPCCYIELD) {
        /*
         * set P0, P5
         * invokecc
         * end
         */
        ins = unit->last_ins;
        regs[0] = get_pasm_reg(interp, "P0");
        regs[1] = get_pasm_reg(interp, "P5");
        ins = insINS(interp, unit, ins, "set", regs, 2);
        ins = insINS(interp, unit, ins, "invokecc", regs, 0);
        ins = insINS(interp, unit, ins, "end", regs, 0);
    }

}


/*
 * Expand a PCC sub return directive into its PASM instructions
 */
void
expand_pcc_sub_ret(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub, *regs[IMCC_MAX_REGS];
    int  n, is_yield;

    is_yield = ins->type & ITPCCYIELD;
    /* FIXME
     * fake prototyped
     * TODO implement return conventions
     */
    sub = ins->r[0];
    sub->pcc_sub->pragma = P_PROTOTYPED;
    n = sub->pcc_sub->nret;
    ins = pcc_put_args(interp, unit, ins, sub->pcc_sub, n,
                1, sub->pcc_sub->ret);

    /*
     * we have a pcc_begin_yield
     */
    if (is_yield) {
        char buf[16];
        /*
         * get current sub
         *
         */
        regs[0] = get_pasm_reg(interp, "P0");
        sprintf(buf, "%d", CURRENT_SUB);
        regs[1] = get_const(interp, buf, 'I');
        ins = insINS(interp, unit, ins, "interpinfo", regs, 2);
        ins = insINS(interp, unit, ins, "invoke", regs, 0);
    }
    else {
        /*
         * insert return invoke
         */
        ins = insINS(interp, unit, ins, "returncc", regs, 0);
    }
    /*
     * move the pcc_sub structure to the invoke
     */
    ins->r[0] = sub;

    /*
     * mark the invoke instruction's PCC sub type
     */
    ins->type |= is_yield ? ITPCCYIELD : (ITPCCRET|ITPCCSUB);
}

#define CREATE_TAIL_CALLS

#ifdef CREATE_TAIL_CALLS
/*
 * check for a sequence of
 *   .pcc_begin
 *   ... [1]
 *   .pcc_end
 *   .pcc_begin_return
 *   ... [2]
 *   .pcc_end_return
 *   <end>
 * with the results in [1] matching return values in [2]
 */
static int
check_tail_call(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    Instruction *tmp, *ret_ins;
    int i, j, matching, nrets;
    struct pcc_sub_t *call, *ret;
    UNUSED(unit);
    /*
     * currently only with -Oc
     */
    if (!(IMCC_INFO(interp)->optimizer_level & OPT_SUB))
        return 0;
    if (!ins->type & ITPCCSUB)
        return 0;
    ret_ins = NULL;
    tmp = ins->next;
    if (!tmp)
        return 0;
    if (tmp->opnum == -1 && (tmp->type & ITPCCSUB) &&
            (tmp->type & ITLABEL)) {
        ret_ins = tmp;
        IMCC_debug(interp, DEBUG_OPT1, "check tail call %I \n", ins);
    }
    /*
     * when a sub ends w/o any return sequence, the code
     * null I0 / null I3 / invoke Px
     * is already inserted, check for this sequence
     */
    else if (!strcmp(tmp->op, "null") &&
            tmp->r[0]->set == 'I' &&
            tmp->r[0]->color == 0) {
        tmp = tmp->next;
        if (!tmp)
            return 0;

        if (!strcmp(tmp->op, "null") &&
                tmp->r[0]->set == 'I' &&
                tmp->r[0]->color == 3) {
            tmp = tmp->next;
            if (!tmp)
                return 0;
        }
        else
            return 0;
        if (strcmp(tmp->op, "returncc"))
            return 0;
        IMCC_debug(interp, DEBUG_OPT1, "check tail call %I \n", tmp);
        nrets = 0;
        goto ok;
    }
    else
        return 0;
    /*
     * now check results vs returns
     */
    ret = ret_ins->r[0]->pcc_sub;
    nrets = ret->nret;
ok:

    call = ins->r[0]->pcc_sub;
    if (!(call->pragma & P_PROTOTYPED))
        return 0;
    IMCC_debug(interp, DEBUG_OPT1, "\tcall call retvals %d retvals %d\n",
            call->nret, nrets);
    if (call->nret != nrets)
        return 0;
    for (matching = i = 0; i < call->nret; i++) {
        SymReg *c, *r;
        c = call->ret[i];
        for (j = 0; j < nrets; j++) {
            r = ret->ret[i];
            if (!strcmp(c->name, r->name) &&
                    c->set == r->set)
                ++matching;
        }
    }
    if (matching != call->nret)
        return 0;
    /*
     * suppress code generation for return sequence
     */
    if (ret_ins)
        ret_ins->type = 0;
    return 1;
}

static void
insert_tail_call(Parrot_Interp interp, IMC_Unit * unit,
        Instruction *ins, SymReg *sub, int meth_call, SymReg *s0)
{
    SymReg *regs[IMCC_MAX_REGS];

    if (meth_call) {
        s0 = s0 ? s0 : get_pasm_reg(interp, "S0");
        regs[0] = s0;
        ins = insINS(interp, unit, ins, "tailcallmethod", regs, 1);
    }
    else {
        regs[0] = get_pasm_reg(interp, "P0");
        ins = insINS(interp, unit, ins, "tailcall", regs, 1);
    }
    ins->type |= ITPCCSUB;
    ins->r[0]->pcc_sub = sub->pcc_sub;
    sub->pcc_sub = NULL;
}

#endif

static Instruction *
pcc_emit_flatten(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        SymReg *arg, int i, int *flatten, SymReg **last)
{

    SymReg *regs[IMCC_MAX_REGS];
    SymReg *i0, *i1, *i3, *py, *p3, *ic16;
    SymReg *loop, *next, *over, *over1;
    Instruction *tmp;
    static int lin;
    char buf[128];
    char * s;
    /*
     * emitted code is
     *   $I2 = i+5    # once
     *   ============
     *   $I0 = 0
     *   $I1 = arg
     * arg_loop_N:
     *   if $I0 >= $I1 goto next_arg_N
     *   PY = arg[$I0]
     *   inc $I0
     *   if $I2 == 16  goto over_flow_1_N
     *   if $I2 > 16  goto over_flow_N
     *   setp_ind $I2, Py
     *   inc $I2
     *   goto _arg_loop_N
     * over_flow_1_N:
     *   new P3, .PerlArray
     * over_flow_N:
     *   push P3, $P0
     *   goto _arg_loop_N
     * next_arg_N:
     *
     * if there was a flattening before, next regs are handled with:
     *
     *   if $I2 == 16  goto over_flow_1_N
     *   if $I2 > 16  goto over_flow_N
     *   setp_ind $I2, arg
     *   inc $I2
     *   goto next_arg_N
     * over_flow_1_N:
     *   new P3, .PerlArray
     * over_flow_N:
     *   push P3, arg
     * next_arg_N:
     *
     */

    s = str_dup("?i0");
    s[0] = IMCC_INTERNAL_CHAR;
    i0 = mk_symreg(interp, s, 'I');        /* TODO cache syms */

    s = str_dup("?i1");
    s[0] = IMCC_INTERNAL_CHAR;
    i1 = mk_symreg(interp, s, 'I');

    s = str_dup("?i0");
    s[0] = IMCC_INTERNAL_CHAR;

    i3 = get_pasm_reg(interp, "I3");
    s = str_dup("?py");
    s[0] = IMCC_INTERNAL_CHAR;
    py = mk_symreg(interp, s, 'P');

    p3 = get_pasm_reg(interp, "P3");
    /* first time */
    if (!(*flatten)++) {
        regs[0] = i3;
        sprintf(buf, "%d", i+5);
        regs[1] = mk_const(interp, str_dup(buf), 'I');
        ins = insINS(interp, unit, ins, "set", regs, 2);
    }
    ++lin;
    sprintf(buf, "%carg_loop_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    loop = mk_address(interp, str_dup(buf), U_add_uniq_label);
    sprintf(buf, "%cnext_arg_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    next = mk_address(interp, str_dup(buf), U_add_uniq_label);
    sprintf(buf, "%cover_flow_%d_1_%d", IMCC_INTERNAL_CHAR, lin, i);
    over1 = mk_address(interp, str_dup(buf), U_add_uniq_label);
    sprintf(buf, "%cover_flow_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    over = mk_address(interp, str_dup(buf), U_add_uniq_label);
    sprintf(buf, "%carg_last_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    *last = mk_address(interp, str_dup(buf), U_add_uniq_label);

    if (arg->type & VT_FLATTEN) {
        regs[0] = i0;
        ins = insINS(interp, unit, ins, "null", regs, 1);
        regs[0] = i1;
        regs[1] = arg;
        ins = insINS(interp, unit, ins, "set", regs, 2);
        tmp = INS_LABEL(unit, loop, 0);
        insert_ins(unit, ins, tmp);
        ins = tmp;
        regs[0] = i0;
        regs[1] = i1;
        regs[2] = next;
        ins = insINS(interp, unit, ins, "ge", regs, 3);
        regs[0] = py;
        regs[1] = arg;
        regs[2] = i0;
        tmp = INS(interp, unit, "set", NULL, regs, 3, KEY_BIT(2), 0);
        insert_ins(unit, ins, tmp);
        ins = tmp;
        regs[0] = i0;
        ins = insINS(interp, unit, ins, "inc", regs, 1);
    }
    else
        py = arg;
    regs[0] = i3;
    regs[1] = ic16 = mk_const(interp, str_dup("16"), 'I');
    regs[2] = over1;
    ins = insINS(interp, unit, ins, "eq", regs, 3);
    regs[0] = ic16;
    regs[1] = i3;
    regs[2] = over;
    ins = insINS(interp, unit, ins, "lt", regs, 3);
    regs[0] = i3;
    regs[1] = py;
    ins = insINS(interp, unit, ins, "setp_ind", regs, 2);
    regs[0] = i3;
    ins = insINS(interp, unit, ins, "inc", regs, 1);

    regs[0] = (arg->type & VT_FLATTEN) ? loop : next;
    ins = insINS(interp, unit, ins, "branch", regs, 1);
    tmp = INS_LABEL(unit, over1, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    p3 = get_pasm_reg(interp, "P3");
    tmp = iNEW(interp, unit, p3, str_dup("PerlArray"), NULL, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    tmp = INS_LABEL(unit, over, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    regs[0] = p3;
    regs[1] = py;
    ins = insINS(interp, unit, ins, "push", regs, 2);
    regs[0] = i3;
    ins = insINS(interp, unit, ins, "inc", regs, 1);
    regs[0] = (arg->type & VT_FLATTEN) ? loop : next;
    ins = insINS(interp, unit, ins, "branch", regs, 1);
    tmp = INS_LABEL(unit, next, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    return ins;
}


static Instruction*
pcc_insert_signature(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        struct pcc_sub_t *pcc_sub)
{
    int i, n, m;
    SymReg *regs[IMCC_MAX_REGS];
    char buffer[20];    /* TODO is there a limit? */

    n = pcc_sub->nargs;
    buffer[0] = '"';
    if (pcc_sub->object) {
        buffer[1] = 'O';
        m = 2;
    }
    else
        m = 1;
    for (i = 0; i < n && i < 15; ++i) {
        buffer[m++] = pcc_sub->args[i]->set;
    }
    buffer[m++] = '"';
    buffer[m] = '\0';
    regs[0] = get_pasm_reg(interp, "S1");
    regs[1] = mk_const(interp, str_dup(buffer), 'S');
    ins = insINS(interp, unit, ins, "set", regs, 2);
    return ins;
}

/*
 * Expand a PCC subroutine call (IMC) into its PASM instructions
 * This is the nuts and bolts of pdd03 routine call style
 *
 */
void
expand_pcc_sub_call(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS];
    int  n;
    int need_cc;
    int tail_call;
    int proto;
    int meth_call = 0;
    SymReg *s0 = NULL;
    Instruction *get_name;

    tail_call = 0;
#ifdef CREATE_TAIL_CALLS
    tail_call = check_tail_call(interp, unit, ins);
    if (tail_call)
        IMCC_debug(interp, DEBUG_OPT1, "found tail call %I \n", ins);
#endif
    sub = ins->r[0];

    if (sub->pcc_sub->object)
        meth_call = 1;

    /*
     * See if we need to create a temporary sub object for the short
     * function call syntax _f()
     */
    get_name = NULL;
    if (ins->type & ITCALL) {
        SymReg * the_sub = sub->pcc_sub->sub;
        if (!meth_call && the_sub->type == VTADDRESS) {
            /*
             * sub->pcc_sub->sub is an actual subroutine name,
             * not a variable.
             */
            reg = get_pasm_reg(interp, "P0");
            add_pcc_sub(sub, reg);
            /*
             * insert set_p_pc with the sub as constant
             */
            the_sub = dup_sym(the_sub);
            the_sub->set = 'p';
            the_sub->usage = U_FIXUP;
            the_sub->type = VTCONST;
            regs[0] = reg;
            regs[1] = the_sub;
            /*
             * set_p_pc gets replaced in imcc/pbc.c, if the
             * function can't located in the current namespace
             */
            get_name = INS(interp, unit, "set_p_pc", "", regs, 2, 0, 0);

            ins->type &= ~ITCALL;
        }
        else
            add_pcc_sub(sub, the_sub);
    }


    /*
     * insert arguments
     */
    n = sub->pcc_sub->nargs;
    proto = sub->pcc_sub->pragma & P_PROTOTYPED;
    ins = pcc_put_args(interp, unit, ins, sub->pcc_sub, n,
                proto, sub->pcc_sub->args);
    /*
     * insert get_name after args have been setup, so that
     * a possible MMD call can inspect the passed arguments
     */
    if (get_name) {
        /* for now, put a call signature in S1 */
        ins = pcc_insert_signature(interp, unit, ins, sub->pcc_sub);
        insert_ins(unit, ins, get_name);
        ins = get_name;
    }
    else
        ins = pcc_insert_signature(interp, unit, ins, sub->pcc_sub);


    /*
     * setup P0, and P2, S0 if method
     *
     * Due to implicit call arguments (call opcodes that
     * either take a Sub/P0, method/S2, return continuation/P1,
     * object/P2 or not)
     * this is really a mess
     */
    arg = sub->pcc_sub->sub;
    if (meth_call) {
        /* set S0, meth */
        regs[0] = get_pasm_reg(interp, "S0");;
        if (arg->set != 'P') {
            if ( (arg->type == VTIDENTIFIER ||
                        arg->type == VTPASM ||
                        arg->type == VTREG))
                s0 = arg;
            else
                s0 = mk_const(interp, str_dup(arg->name), 'S');
        }

        /* set P2, obj */
        if (sub->pcc_sub->object->color != 2) {
            regs[0] = get_pasm_reg(interp, "P2");
            regs[1] = sub->pcc_sub->object;
            if (regs[1]->set == 'S')
                ins = insINS(interp, unit, ins, "getclass", regs, 2);
            else
                ins = insINS(interp, unit, ins, "set", regs, 2);
        }
        if (sub->pcc_sub->nci && (!meth_call || arg->set == 'P'))
            goto move_sub;
    }
    else {
move_sub:
        /* plain sub call */
        if (arg->color != 0) {
            reg = get_pasm_reg(interp, "P0");
            if (reg != arg) {
                regs[0] = reg;
                regs[1] = arg;
                arg->want_regno = 0;
                ins = insINS(interp, unit, ins, "set", regs, 2);
            }
        }
    }

#ifdef CREATE_TAIL_CALLS
    /*
     * if we have a tail call then
     * insert a tailcall opcode
     */
    if (tail_call) {
        if (!(meth_call && strcmp(s0->name, "\"instantiate\"") == 0)) {
            insert_tail_call(interp, unit, ins, sub, meth_call, s0);
            return;
        }
    }
#endif
    /*
     * if an explicit return continuation is passed, set it to P1
     */
    arg = sub->pcc_sub->cc;
    need_cc = 0;
    if (arg) {
        if (arg->color != 1) {
            reg = get_pasm_reg(interp, "P1");
            regs[0] = reg;
            regs[1] = arg;
            ins = insINS(interp, unit, ins, "set", regs, 2);
        }
    }
    else if (!sub->pcc_sub->nci)
        need_cc = 1;

#if 0
    /* meth hash value: I4 */
    ins = set_I_const(interp, unit, ins, 4, 0);
#endif

    /*
     * special case - instantiate looks like a method call
     * but is actually the instantiate object constructor opcode that
     * takes method-like arguments according to pdd03
     *
     * so convert to opcode and await the returned PMC as P5
     */
    if (meth_call && s0 && strcmp(s0->name, "\"instantiate\"") == 0) {
        SymReg *p5 = get_pasm_reg(interp, "P5");
        regs[0] = p5;
        ins = insINS(interp, unit, ins, "instantiate", regs, 1);
    }
    else {
        /*
         * if we reuse the continuation, update it
         */
        if (!sub->pcc_sub->nci)
            if (!need_cc)
                ins = insINS(interp, unit, ins, "updatecc", regs, 0);
        /* insert the call */
        if (meth_call && sub->pcc_sub->sub->set != 'P') {
            regs[0] = s0;
            n = 0;
            if (s0)
                n = 1;
            ins = insINS(interp, unit, ins,
                    need_cc ? "callmethodcc" : "callmethod", regs, n);
        }
        else
            ins = insINS(interp, unit, ins,
                    need_cc ? "invokecc" : "invoke", regs, 0);
        ins->type |= ITPCCSUB;
        /*
         * move the pcc_sub structure to the invoke
         */
        ins->r[0] = meth_call ? s0 ? s0 : get_pasm_reg(interp, "S0") :
            get_pasm_reg(interp, "P0");
        ins->r[0]->pcc_sub = sub->pcc_sub;
        sub->pcc_sub = NULL;
        sub = ins->r[0];
        /*
         * locate return label, if there is one skip it
         */
        if (sub->pcc_sub->label && ins->next->type == ITLABEL) {
            ins = ins->next;
        }
    }
    /*
     * handle return results
     */
    n = sub->pcc_sub->nret;
    proto = 1;  /* XXX how to specify return proto or not */
    ins = pcc_get_args(interp, unit, ins, sub->pcc_sub, n,
                proto, sub->pcc_sub->ret);
}


/*
 * special peephole optimizer for code generated mainly by
 * above functions
 */
void
pcc_sub_optimize(Parrot_Interp interp, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    IMCC_info(interp, 2, "\tpcc_sub_optimize\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        if (ins->opsize == 3 &&
                ins->r[1]->type == VTCONST &&
                (ins->r[0]->set == 'I' || ins->r[0]->set == 'N') &&
                ins->r[1]->name[1] != 'b' &&
                ins->r[1]->name[1] != 'B' &&
                ins->r[1]->name[1] != 'x' &&
                ins->r[1]->name[1] != 'X' &&
                atof(ins->r[1]->name) == 0.0 &&
                !strcmp(ins->op, "set")) {
            IMCC_debug(interp, DEBUG_OPT1, "opt1 %I => ", ins);
            tmp = INS(interp, unit,"null", NULL, ins->r, 1, 0, 0);
            IMCC_debug(interp, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
        }
        else if (ins->opsize == 3 &&
                !strcmp(ins->op, "set")) {
            SymReg *r0 = ins->r[0];
            SymReg *r1 = ins->r[1];
            if (r0->set == r1->set && r0->color == r1->color &&
                    r0->type == r1->type) {
                IMCC_debug(interp, DEBUG_OPT1, "opt1 %I => ", ins);
                ins = delete_ins(unit, ins, 1);
                ins = ins->prev ? ins->prev : unit->instructions;
                IMCC_debug(interp, DEBUG_OPT1, "deleted\n");
                ostat.deleted_ins++;
            }
        }
    }
}

/*
 * Check argument symbols of a sub and see which are used
 * Return 0 if none are used, 1 if at least 1 symbol is used.
 */
static int
pcc_args(Instruction* ins, SymReg* r)
{
    int i;
    SymReg * sub;
    struct pcc_sub_t * pcc;

    sub = ins->r[0];
    assert(sub && sub->pcc_sub);
    pcc = sub->pcc_sub;
    for (i = 0; i < pcc->nargs; i++)
        if (r == pcc->args[i]->used)
            return 1;
    return 0;
}

/*
 * Check return symbols of a sub and see which are used
 * Return 0 if none are used, 1 if at least 1 symbol is used.
 *
 * TODO this is likely unneeded - all registers in the volatile
 *      range are possible return results and clobbered, so we
 *      can't assign registers in that range
 */
static int
pcc_ret(Instruction* ins, SymReg* r)
{
    int i;
    SymReg * sub;
    struct pcc_sub_t * pcc;

    sub = ins->r[0];
    assert(sub && sub->pcc_sub);
    pcc = sub->pcc_sub;
    for (i = 0; i < pcc->nret; i++)
        if (r == pcc->ret[i]->used)
            return 1;
    return 0;
}

/*
 * See if the sub writes to the symbol, checks args and returns
 */
int
pcc_sub_writes(Instruction* ins, SymReg* r)
{
    if (ins->type & ITPCCRET)
        return 0;
    return pcc_ret(ins, r) || pcc_args(ins, r);
}

/*
 * See if the sub reads the symbol, checks args and returns
 */
int
pcc_sub_reads(Instruction* ins, SymReg* r)
{
    SymReg * sub, *arg;
    struct pcc_sub_t * pcc;

    sub = ins->r[0];
    assert(sub && sub->pcc_sub);
    pcc = sub->pcc_sub;
    if ( (arg = pcc->cc) )
        if (arg == r)
            return 1;
    if (r->set == 'I' && r->color <= 4 && r->color >= 0)
        return 1;
    if (r->set == 'P' && r->color <= 3 && r->color >= 0)
        return 1;
    if (ins->type & ITPCCRET)
        return pcc_ret(ins, r);
    return pcc_args(ins, r);
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
