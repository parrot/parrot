/*
 * pcc.c
 *
 * A specific call convention implementation. Called by the generic
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
pcc_emit_flatten(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        SymReg *arg, int i, int *flatten);



/*
 * Utilty instruction routine. Creates and inserts an instruction
 * into the current block in one call.
 */
static Instruction *
insINS(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        char *name, SymReg **regs, int n)
{
    Instruction *tmp = INS(interpreter, unit, name, NULL, regs, n, 0, 0);
    insert_ins(unit, ins, tmp);
    return tmp;
}

/*
 * get or create the SymReg
 */
static SymReg*
get_pasm_reg(char *name)
{
    SymReg *r;

    if ((r = _get_sym(cur_unit->hash, name)))
        return r;
    return mk_pasm_reg(str_dup(name));
}

static SymReg*
get_const(char *name, int type)
{
    SymReg *r;

    if ((r = _get_sym(ghash, name)) && r->set == type)
        return r;
    return mk_const(str_dup(name), type);
}

static Instruction *
set_I_const(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
            int regno, int value)
{
    SymReg *ix, *regs[IMCC_MAX_REGS], *arg;
    char buf[128];

    sprintf(buf, "I%d", regno);
    ix = get_pasm_reg(buf);
    sprintf(buf, "%d", value);
    arg = get_const(buf, 'I');
    regs[0] = ix;
    regs[1] = arg;
    return insINS(interpreter, unit, ins, "set", regs, 2);
}

/*
 * get arguments or return results
 * used by expand_pcc_sub_call and expand_pcc_sub
 */
static Instruction*
pcc_get_args(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        struct pcc_sub_t *pcc_sub, int n, int proto, SymReg **args, int call)
{
    int next[4], i, j, set;
    SymReg *p3, *regs[IMCC_MAX_REGS], *arg;
    char buf[128];

    p3 = NULL;
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
                regs[1] = get_pasm_reg(buf);
                /* e.g. set $I0, I5 */
                ins = insINS(interpreter, unit, ins, "set", regs, 2);
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
             * they don't interfer with this sub's params
             */
            if (call) {
                if (pcc_sub->calls_a_sub) {
move_reg:
                    regs[0] = arg;
                    arg->reg->want_regno = next[set];
                    sprintf(buf, "%c%d", arg->set, next[set]++);
                    regs[1] = get_pasm_reg(buf);
                    arg->used = regs[1];
                    /* e.g. set $I0, I5 */
                    ins = insINS(interpreter, unit, ins, "set", regs, 2);
                }
                else {
                    /*
                     * if no sub is called from here
                     * just use the passed register numbers
                     */
                    arg->reg->color = next[set]++;
                }
            }
            else
                goto move_reg;
        }
        continue;
overflow:
        if (!p3)
            p3 = get_pasm_reg("P3");
        /* this uses register numbers (if any)
         * from the first prototyped pass
         */
        regs[0] = arg;
        regs[1] = p3;
        ins = insINS(interpreter, unit, ins, "shift", regs, 2);
    } /* n params */
    return ins;
}

/*
 * put arguments or return results
 */
static Instruction*
pcc_put_args(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        struct pcc_sub_t *pcc_sub, int n, int proto, SymReg **args)
{
    int next[4], i, j, set;
    SymReg *p3, *regs[IMCC_MAX_REGS], *arg, *arg_reg, *reg;
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
         * if prototyped, first 11 I,S,N go into regs
         */
        arg = args[i];
#if IMC_TRACE
        PIO_eprintf(NULL, "    arg(%c%s)%s\n", arg->set,
                (arg->type & (VTCONST|VT_CONSTP)) ? "c":"", arg->name);
#endif
        arg_reg = arg->reg;
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
            if (!proto && arg_reg->set != 'P') {
                set = REGSET_P;
                if (next[REGSET_P] > LAST_PARAM_REG)
                    goto overflow;
                /* make a new P reg and assign value */
                sprintf(buf, "P%d", next[set]++);
                reg = get_pasm_reg(buf);
                tmp = iNEW(interpreter, unit, reg, str_dup("PerlUndef"),
                        NULL, 0);
                insert_ins(unit, ins, tmp);
                ins = tmp;
                regs[0] = reg;
                regs[1] = arg_reg;
                ins = insINS(interpreter, unit, ins, "set", regs, 2);
                break;
            }
            if (next[set] > LAST_PARAM_REG) {
                goto overflow;
            }
            /*
             * if register number already matches - fine
             */
            if (arg->color == next[set] && arg->type & VTREGISTER) {
                next[set]++;
                break;
            }
            if (arg->type & VTREGISTER) {
                if (set == REGSET_P &&
                        (flatten || (arg_reg->type & VT_FLATTEN)))
                    goto flatten;
                arg_reg->want_regno = next[set];
            }
            sprintf(buf, "%c%d", arg_reg->set, next[set]++);
            reg = mk_pasm_reg(str_dup(buf));
            regs[0] = reg;
            regs[1] = arg_reg;
            ins = insINS(interpreter, unit, ins, "set", regs, 2);
            /* remember reg for life analysis */
            arg->used = reg;

            continue;
overflow:
            if (!p3) {
                p3 = mk_pasm_reg(str_dup("P3"));
                tmp = iNEW(interpreter, unit, p3, str_dup("PerlArray"), NULL, 0);
                insert_ins(unit, ins, tmp);
                ins = tmp;
            }
            if (flatten || (arg_reg->type & VT_FLATTEN))
                goto flatten;
#if IMC_TRACE_HIGH
            PIO_eprintf(NULL, "expand_pcc_sub_call: overflow (%c%s)%s\n",
                    arg->set,
                    (arg->type & (VTCONST|VT_CONSTP)) ? "c":"",  arg->name);
#endif
            regs[0] = p3;
            regs[1] = arg_reg;
            ins = insINS(interpreter, unit, ins, "push", regs, 2);
        }
        continue;
flatten:
        /* if we had a flattening arg, we must continue emitting
         * code to do all at runtime
         */
        ins = pcc_emit_flatten(interpreter, unit, ins, arg_reg, i, &flatten);
    } /* for i */

    /* set prototyped: I0  (1=prototyped, 0=non-prototyped) */
    ins = set_I_const(interpreter, unit, ins, REG_PROTO_FLAG, proto);

    /* Ireg param count in: I1 */
    ins = set_I_const(interpreter, unit, ins, REG_I_PARAM_COUNT,
            next[REGSET_I] - FIRST_PARAM_REG);

    /* Sreg param count in: I2 */
    ins = set_I_const(interpreter, unit, ins, REG_S_PARAM_COUNT,
            next[REGSET_S] - FIRST_PARAM_REG);

    /* set items in PRegs: I3 */
    if (flatten) {
        regs[0] = mk_pasm_reg(str_dup("I3"));;
        regs[1] = mk_const(str_dup("5"), 'I');
        ins = insINS(interpreter, unit, ins, "sub", regs, 2);
    }
    else
        ins = set_I_const(interpreter, unit, ins, 3, next[2] - FIRST_PARAM_REG);

    /* Nreg param count in: I4 */
    ins = set_I_const(interpreter, unit, ins, REG_N_PARAM_COUNT,
            next[REGSET_N] - FIRST_PARAM_REG);
    return ins;
}

/*
 * Expand a PCC (Parrot Calling Convention) subroutine
 * by generating the appropriate prologue and epilogue
 * for parameter passing/returning.
 */
void
expand_pcc_sub(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub;
    int nargs;
    int proto, ps, pe;
    Instruction *tmp;
    SymReg *i0, *regs[IMCC_MAX_REGS], *label1, *label2;
    char buf[128];

#if IMC_TRACE
    PIO_eprintf(NULL, "expand_pcc_sub\n");
#endif

    sub = ins->r[1];

    /* Don't generate any parameter checking code if there
     * are no named arguments.
     */
    if(sub->pcc_sub->nargs <= 0)
        goto NONAMEDPARAMS;

    i0 = NULL;
    label1 = label2 = NULL;
    ps = pe = sub->pcc_sub->pragma & P_PROTOTYPED;
    if (sub->pcc_sub->pragma & P_NONE) {
        ps = 0; pe = 1;
        /* subroutine can handle both */
        i0 = get_pasm_reg("I0");
        regs[0] = i0;
        sprintf(buf, "_%csub_%s_p1", IMCC_INTERNAL_CHAR, sub->name);
        regs[1] = label1 = mk_address(str_dup(buf), U_add_uniq_label);
        ins = insINS(interpreter, unit, ins, "if", regs, 2);

    }
    for (proto = ps; proto <= pe; ++proto) {
        nargs = sub->pcc_sub->nargs;
        ins = pcc_get_args(interpreter, unit, ins, sub->pcc_sub, nargs,
                proto, sub->pcc_sub->args, 1);
        if (ps != pe) {
            if (!proto) {
                /* branch to the end */
                sprintf(buf, "_%csub_%s_p0", IMCC_INTERNAL_CHAR, sub->name);
                regs[0] = label2 = mk_address(str_dup(buf), U_add_uniq_label);
                ins = insINS(interpreter, unit, ins, "branch", regs, 1);
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
     * if we call out, the return cc in P1 must be saved
     */
    if (sub->pcc_sub->calls_a_sub) {
        regs[0] = sub->pcc_sub->cc_sym = mk_temp_reg('P');
        regs[1] = get_pasm_reg("P1");
        insINS(interpreter, unit, ins, "set", regs, 2);
        if (sub->pcc_sub->pragma & P_METHOD) {
            regs[0] = sub->pcc_sub->p2_sym = mk_temp_reg('P');
            regs[1] = get_pasm_reg("P2");
            insINS(interpreter, unit, ins, "set", regs, 2);
        }
    }
    /*
     * check if there is a return
     */

    if (unit->last_ins->type != (ITPCCSUB|ITLABEL) &&
            strcmp(unit->last_ins->op, "ret") &&
            strcmp(unit->last_ins->op, "exit") &&
            strcmp(unit->last_ins->op, "end")
       ) {

        if (sub->pcc_sub->cc_sym)
            regs[0] = sub->pcc_sub->cc_sym;
        else
            regs[0] = mk_pasm_reg(str_dup("P1"));
        tmp = INS(interpreter, unit, "invoke", NULL, regs, 1, 0, 0);
        debug(interpreter, DEBUG_IMC, "add sub ret - invoke %s\n",
                regs[0]->name);
        /*
         * TODO insert minimal PCC information - I0=I3=0
         */
        insert_ins(unit, unit->last_ins, tmp);
    }
}


/*
 * Expand a PCC sub return directive into its PASM instructions
 */
void
expand_pcc_sub_ret(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub, *reg, *regs[IMCC_MAX_REGS];
    int  n, arg_count;
    Instruction *tmp;

#if IMC_TRACE
    PIO_eprintf(NULL, "expand_pcc_sub_ret\n");
#endif

    arg_count = ins->type & ITPCCYIELD ? 0 : 1;
    tmp = NULL;
    /*
     * if we have preserved the return continuation
     * restore it
     */
    sub = unit->instructions->r[1];
    if (sub->pcc_sub->cc_sym) {
        regs[0] = get_pasm_reg("P1");
        regs[1] = sub->pcc_sub->cc_sym;
        tmp = insINS(interpreter, unit, ins, "set", regs, 2);
    }
    /* FIXME
     * fake prototyped
     * TODO implement return conventions
     */
    sub = ins->r[0];
    /*
     * past the eventually inserted return cc restore
     */
    if (tmp)
        ins = tmp;
    sub->pcc_sub->pragma = P_PROTOTYPED;
    n = sub->pcc_sub->nret;
    ins = pcc_put_args(interpreter, unit, ins, sub->pcc_sub, n,
                1, sub->pcc_sub->ret);

    /*
     * we have a pcc_begin_yield
     */
    if (arg_count == 0) {
        /*
         * preserve registers over coroutine invoke
         *
         * TODO optimize this later
         */
        ins = insINS(interpreter, unit, ins, "savetop", regs, 0);
    }
    /*
     * insert return invoke
     */
    reg = mk_pasm_reg(str_dup("P1"));
    regs[0] = reg;
    ins = insINS(interpreter, unit, ins, "invoke", regs, arg_count);
    /*
     * move the pcc_sub structure to the invoke
     */
    if (arg_count == 0)
        ins->r[0] = reg;
    reg->pcc_sub = sub->pcc_sub;
    sub->pcc_sub = NULL;

    /*
     * mark the invoke instruction's PCC sub type
     */
    ins->type |= arg_count == 0 ? ITPCCYIELD : (ITPCCRET|ITPCCSUB);
    if (arg_count == 0) {
        /* optimize this later */
        ins = insINS(interpreter, unit, ins, "restoretop", regs, 0);
    }
}

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
check_tail_call(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins)
{
    Instruction *tmp, *ret_ins;
    int call_found, ret_found;
    int i, j, matching;
    struct pcc_sub_t *call, *ret;
    UNUSED(unit);
    /*
     * currently only with -Oc
     */
    if (!(optimizer_level & OPT_SUB))
        return 0;
    ret_ins = 0;
    for (i = call_found = ret_found = 0, tmp = ins; tmp && i < 4;
            tmp = tmp->next) {
        ++i;    /* ins count */
        if (tmp->opnum == -1 && (tmp->type & ITPCCSUB)) {
            if (tmp->type & ITLABEL) {
                ++ret_found;
                ret_ins = tmp;
            }
            else
                ++call_found;

        }
    }
    if (i == 3 && call_found == 1 && ret_found == 1 && !tmp) {
        debug(interpreter, DEBUG_OPT1, "check tail call %I \n", ins);
    }
    else
        return 0;
    /*
     * now check results vs returns
     */
    call = ins->r[0]->pcc_sub;
    ret = ret_ins->r[0]->pcc_sub;
    debug(interpreter, DEBUG_OPT1, "\tcall results %d retvals %d\n", call->nret, ret->nret);
    if (call->nret != ret->nret)
        return 0;
    for (matching = i = 0; i < call->nret; i++) {
        SymReg *c, *r;
        c = call->ret[i];
        for (j = 0; j < ret->nret; j++) {
            r = ret->ret[i];
            if (!strcmp(c->name, r->name) &&
                    c->set == r->set)
                ++matching;
        }
    }
    if (matching != call->nret)
        return 0;
    /*
     * deactivate the return sequence
     */
    ret_ins->type = 0;

    return 1;
}

static void
insert_tail_call(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins, SymReg *sub)
{
    SymReg *iaddr = mk_temp_reg('I');
    SymReg *regs[IMCC_MAX_REGS];

    regs[0] = iaddr;
    regs[1] = sub->pcc_sub->sub;
    ins = insINS(interpreter, unit, ins, "set", regs, 2);
    ins = insINS(interpreter, unit, ins, "jump", regs, 1);
}

static Instruction *
pcc_emit_flatten(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        SymReg *arg, int i, int *flatten)
{

    SymReg *regs[IMCC_MAX_REGS];
    SymReg *i0, *i1, *i2, *py, *p3, *ic16;
    SymReg *loop, *next, *over, *over1;
    Instruction *tmp;
    static int lin;
    char buf[128];
    char * s;
    /*
     * emited code is
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
    i0 = mk_symreg(s, 'I');        /* TODO cache syms */

    s = str_dup("?i1");
    s[0] = IMCC_INTERNAL_CHAR;
    i1 = mk_symreg(s, 'I');

    s = str_dup("?i0");
    s[0] = IMCC_INTERNAL_CHAR;

    i2 = mk_pasm_reg(str_dup("I3"));
/*
    i2 = mk_pasm_reg(str_dup("I2"));
*/
    s = str_dup("?py");
    s[0] = IMCC_INTERNAL_CHAR;
    py = mk_symreg(s, 'P');

    p3 = mk_pasm_reg(str_dup("P3"));
    /* first time */
    if (!(*flatten)++) {
        regs[0] = i2;
        sprintf(buf, "%d", i+5);
        regs[1] = mk_const(str_dup(buf), 'I');
        ins = insINS(interpreter, unit, ins, "set", regs, 2);
    }
    ++lin;
    sprintf(buf, "_%carg_loop_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    loop = mk_address(str_dup(buf), U_add_uniq_label);
    sprintf(buf, "_%cnext_arg_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    next = mk_address(str_dup(buf), U_add_uniq_label);
    sprintf(buf, "_%cover_flow_%d_1_%d", IMCC_INTERNAL_CHAR, lin, i);
    over1 = mk_address(str_dup(buf), U_add_uniq_label);
    sprintf(buf, "_%cover_flow_%d_%d", IMCC_INTERNAL_CHAR, lin, i);
    over = mk_address(str_dup(buf), U_add_uniq_label);

    if (arg->type & VT_FLATTEN) {
        regs[0] = i0;
        ins = insINS(interpreter, unit, ins, "null", regs, 1);
        regs[0] = i1;
        regs[1] = arg;
        ins = insINS(interpreter, unit, ins, "set", regs, 2);
        tmp = INS_LABEL(unit, loop, 0);
        insert_ins(unit, ins, tmp);
        ins = tmp;
        regs[0] = i0;
        regs[1] = i1;
        regs[2] = next;
        ins = insINS(interpreter, unit, ins, "ge", regs, 3);
        regs[0] = py;
        regs[1] = arg;
        regs[2] = i0;
        tmp = INS(interpreter, unit, "set", NULL, regs, 3, KEY_BIT(2), 0);
        insert_ins(unit, ins, tmp);
        ins = tmp;
        regs[0] = i0;
        ins = insINS(interpreter, unit, ins, "inc", regs, 1);
    }
    else
        py = arg;
    regs[0] = i2;
    regs[1] = ic16 = mk_const(str_dup("16"), 'I');
    regs[2] = over1;
    ins = insINS(interpreter, unit, ins, "eq", regs, 3);
    regs[0] = i2;
    regs[1] = ic16;
    regs[2] = over;
    ins = insINS(interpreter, unit, ins, "gt", regs, 3);
    regs[0] = i2;
    regs[1] = py;
    ins = insINS(interpreter, unit, ins, "setp_ind", regs, 2);
    regs[0] = i2;
    ins = insINS(interpreter, unit, ins, "inc", regs, 1);

    regs[0] = (arg->type & VT_FLATTEN) ? loop : next;
    ins = insINS(interpreter, unit, ins, "branch", regs, 1);
    tmp = INS_LABEL(unit, over1, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    p3 = mk_pasm_reg(str_dup("P3"));
    tmp = iNEW(interpreter, unit, p3, str_dup("PerlArray"), NULL, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    tmp = INS_LABEL(unit, over, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    regs[0] = p3;
    regs[1] = py;
    ins = insINS(interpreter, unit, ins, "push", regs, 2);
    regs[0] = i2;
    ins = insINS(interpreter, unit, ins, "inc", regs, 1);
    regs[0] = (arg->type & VT_FLATTEN) ? loop : next;
    ins = insINS(interpreter, unit, ins, "branch", regs, 1);
    tmp = INS_LABEL(unit, next, 0);
    insert_ins(unit, ins, tmp);
    ins = tmp;
    return ins;
}


/*
 * Expand a PCC subroutine call (IMC) into its PASM instructions
 * This is the nuts and bolts of Perl6/Parrot routine call style
 *
 * XXX FIXME: VTCONST and VT_CONSTP, VTREG and VT_REGP are
 * mixed and matched here. There should only be pointer types
 * in sub->args. Trim out non-pointer type checks and verify
 * correctness. (see symreg.c: add_pcc_arg())
 * This potentially applies to much of the flow analysis code
 * that is currently lazy and checks for too many things, which
 * is fine but it was the source of a really nasty bug when add_pcc_arg()
 * was not setting arg->type correctly.
 * And THAT is the reason for all this nasty TRACE code. -Mel
 */
void
expand_pcc_sub_call(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS];
    int  n;
    Instruction *tmp;
    int need_cc;
    int tail_call;
    int proto;
    int meth_call = 0;
    SymReg * p2 = NULL;

    /*
     * we must preserve P2 too
     */
    reg = unit->instructions->r[1];   /* the  sub we are in */
    p2 = reg->pcc_sub->p2_sym;

#if IMC_TRACE
    PIO_eprintf(NULL, "expand_pcc_sub_call\n");
#endif

    tail_call = check_tail_call(interp, unit, ins);
    if (tail_call)
        debug(interp, DEBUG_OPT1, "found tail call %I \n", ins);
    sub = ins->r[0];

    /*
     * See if we need to create a temporary sub object
     */
    if (ins->type & ITCALL) {
        if (sub->pcc_sub->object) {
            add_pcc_sub(sub, sub->pcc_sub->sub);
            meth_call = 1;
        }
        else if (sub->pcc_sub->sub->type == VTADDRESS) {
#if IMC_TRACE
            fprintf(stderr, "generating sub object [sub->name = %s]\n",
                    sub->pcc_sub->sub->name);
#endif
            /*
             * sub->pcc_sub->sub is an actual subroutine name,
             * not a variable.
             */
            reg = mk_temp_reg('P');
            tmp = iNEWSUB(interp, unit, reg, NEWSUB, sub->pcc_sub->sub, NULL, 0);
            add_pcc_sub(sub, reg);
            ins->type &= ~ITCALL;
            prepend_ins(unit, ins, tmp);

            expand_pcc_sub_call(interp, unit, ins);
            return;
        }
        else
            add_pcc_sub(sub, sub->pcc_sub->sub);
    }

    /*
     * insert arguments
     */
#if IMC_TRACE_HIGH
    PIO_eprintf(NULL, "expand_pcc_sub_call: nargs = %d\n", sub->pcc_sub->nargs);
    PIO_eprintf(NULL, "args (");
    for(i = 0; i < sub->pcc_sub->nargs; i++) {
       arg = sub->pcc_sub->args[i];
       PIO_eprintf(NULL, " (%c%s)%s", arg->set,
                          (arg->type & (VTCONST|VT_CONSTP)) ? "c":"", arg->name);
    }
    PIO_eprintf(NULL, ")\n");
#endif
    n = sub->pcc_sub->nargs;
    proto = sub->pcc_sub->pragma & P_PROTOTYPED;
    ins = pcc_put_args(interp, unit, ins, sub->pcc_sub, n,
                proto, sub->pcc_sub->args);

    /*
     * if we have a tail call then
     * insert a jump
     */
    if (tail_call) {
        insert_tail_call(interp, unit, ins, sub);
        return;
    }

    /*
     * setup P0, P1
     */
    arg = sub->pcc_sub->sub;
    if (meth_call) {
        /* set S0, meth */
        regs[0] = get_pasm_reg("S0");;
        if ((arg->type & VT_REGP) &&
                (arg->reg->type == VTIDENTIFIER ||
                 arg->reg->type == VTPASM ||
                 arg->reg->type == VTREG))
            regs[1] = arg->reg;
        else
            regs[1] = mk_const(str_dup(arg->name), 'S');
        ins = insINS(interp, unit, ins, "set", regs, 2);
        /* set P2, obj */
        if (sub->pcc_sub->object->color != 2) {
            regs[0] = get_pasm_reg("P2");
            regs[1] = sub->pcc_sub->object;
            ins = insINS(interp, unit, ins, "set", regs, 2);
        }
    }
    else {
        /* plain sub call */
        if (arg->reg->type & VTPASM) {
move_sub:
            if (arg->reg->color != 0) {
                reg = get_pasm_reg("P0");
                regs[0] = reg;
                regs[1] = arg;
                arg->reg->want_regno = 0;
                ins = insINS(interp, unit, ins, "set", regs, 2);
            }
        }
        else {
            /* TODO no move if possible */
            goto move_sub;
        }
    }

    arg = sub->pcc_sub->cc;
    need_cc = 0;
    if (arg) {
        if (arg->reg->type & VTPASM) {
move_cc:
            if (arg->reg->color != 1) {
                reg = get_pasm_reg("P1");
                regs[0] = reg;
                regs[1] = arg;
                arg->reg->want_regno = 1;
                ins = insINS(interp, unit, ins, "set", regs, 2);
            }
        }
        else {
            /* TODO no move */
            goto move_cc;
        }
    }
    else if (!sub->pcc_sub->nci)
        need_cc = 1;


#if 0
    /* meth hash value: I4 */
    ins = set_I_const(interp, unit, ins, 4, 0);
#endif
    /*
     * if we reuse the continuation, update it
     */
    if (!sub->pcc_sub->nci)
        if (!need_cc)
            ins = insINS(interp, unit, ins, "updatecc", regs, 0);
    /*
     * emit a savetop for now
     */
    /* restore self */
    ins = insINS(interp, unit, ins, "savetop", regs, 0);
    if (meth_call)
        ins = insINS(interp, unit, ins,
                need_cc ? "callmethodcc" : "callmethod", regs, 0);
    else
        ins = insINS(interp, unit, ins,
                need_cc ? "invokecc" : "invoke", regs, 0);
    ins->type |= ITPCCSUB;
    /*
     * move the pcc_sub structure to the invoke
     */
    ins->r[0] = get_pasm_reg("P0");  /* XXX or P2 */
    ins->r[0]->pcc_sub = sub->pcc_sub;
    sub->pcc_sub = NULL;
    sub = ins->r[0];
    /*
     * locate return label,
     * we must have one or the parser would have failed
     */
    if (sub->pcc_sub->label && ins->next->type == ITLABEL) {
        ins = ins->next;
    }
    ins = insINS(interp, unit, ins, "restoretop", regs, 0);
    if (p2) {
        regs[0] = get_pasm_reg("P2");
        regs[1] = p2;
        ins = insINS(interp, unit, ins, "set", regs, 2);
    }
    /*
     * handle return results
     */
    n = sub->pcc_sub->nret;
    proto = 1;  /* XXX how to specify return proto or not */
    ins = pcc_get_args(interp, unit, ins, sub->pcc_sub, n,
                proto, sub->pcc_sub->ret, 0);
}

/*
 * optimize register save op (savetop/restoretop)
 * for PCC
 * TODO saveall
 */
static void
optc_savetop(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins)
{
    char types[] = "ISPN";
    Instruction *tmp;
    SymReg * regs[IMCC_MAX_REGS], *r;
    SymReg** reglist = unit->reglist;
    char *new_save[] = {
        "pushtopi",
        "pushtops",
        "pushtopp",
        "pushtopn"
    };
    char *new_restore[] = {
        "poptopi",
        "poptops",
        "poptopp",
        "poptopn"
    };
    int needs_save[4], nsave;
    int i, t;

    for (i = 0; i < 4; i++)
        needs_save[i] = 0;
    for (i = 0; i < unit->n_symbols; i++) {
        r = reglist[i];
        if ((r->type & VTREGISTER) && r->color >= 16) {
            t = strchr(types, r->set) - types;
            needs_save[t] = 1;
        }
    }

    for (nsave = i = 0; i < 4; i++)
        nsave += needs_save[i];
    switch (nsave) {
        case 0:
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            ins = delete_ins(unit, ins, 1);
            debug(interpreter, DEBUG_OPT1, "deleted\n");
            ostat.deleted_ins++;
            for (; ins ; ins = ins->next)
                if (!strcmp(ins->op, "restoretop"))
                    break;
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            ins = delete_ins(unit, ins, 1);
            debug(interpreter, DEBUG_OPT1, "deleted\n");
            ostat.deleted_ins++;
            break;
        case 1:
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            for (i = 0; i < 4; i++)
                if (needs_save[i])
                    break;
            tmp = INS(interpreter, unit, new_save[i], NULL, regs, 0, 0, 0);
            subst_ins(unit, ins, tmp, 1);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            for (ins = tmp; ins ; ins = ins->next)
                if (!strcmp(ins->op, "restoretop"))
                    break;
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            tmp = INS(interpreter, unit, new_restore[i], NULL, regs, 0, 0, 0);
            subst_ins(unit, ins, tmp, 1);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            break;
    }
}

/*
 * special peephole optimizer for code generated mainly by
 * above functions
 */
void
pcc_sub_optimize(Parrot_Interp interpreter, IMC_Unit * unit)
{
    Instruction *ins, *tmp;
    info(interpreter, 2, "\tpcc_sub_optimize\n");
    for (ins = unit->instructions; ins; ins = ins->next) {
        if (ins->opsize == 3 &&
                ins->r[1]->type == VTCONST &&
                (ins->r[0]->set == 'I' || ins->r[0]->set == 'N') &&
                atof(ins->r[1]->name) == 0.0 &&
                !strcmp(ins->op, "set")) {
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            tmp = INS(interpreter, unit,"null", NULL, ins->r, 1, 0, 0);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(unit, ins, tmp, 1);
            ins = tmp;
        }
        else if (ins->opsize == 3 &&
                !strcmp(ins->op, "set")) {
            SymReg *r0 = ins->r[0];
            SymReg *r1 = ins->r[1];
            if (r0->type & VT_REGP)
                r0 = r0->reg;
            if (r1->type & VT_REGP)
                r1 = r1->reg;
            if (r0->set == r1->set && r0->color == r1->color) {
                debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
                ins = delete_ins(unit, ins, 1);
                ins = ins->prev ? ins->prev : unit->instructions;
                debug(interpreter, DEBUG_OPT1, "deleted\n");
                ostat.deleted_ins++;
            }
        }
        else if (ins->type & ITPCCSUB) {
            tmp = ins;
            tmp = tmp->prev;
            if (!strcmp(tmp->op, "savetop"))
                optc_savetop(interpreter, unit, tmp);
            else {
                tmp = tmp->prev;
                if (!strcmp(tmp->op, "savetop"))
                    optc_savetop(interpreter, unit, tmp);
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
        if (arg->reg == r)
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
