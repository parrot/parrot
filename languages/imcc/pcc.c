#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "imc.h"
#include "parser.h"

/*
 * pcc.c - parrot calling conventions stuff
 *
 * s. docs/pdds/pdd03_calling_conventions.pod
 *
 */

static Instruction *
insINS(struct Parrot_Interp *interpreter, Instruction *ins,
        char *name, SymReg **regs, int n)
{
    Instruction *tmp = INS(interpreter, name, NULL, regs, n, 0, 0);
    insert_ins(ins, tmp);
    return tmp;
}

static Instruction *
set_I_const(struct Parrot_Interp *interpreter, Instruction *ins,
            int regno, int value)
{
    SymReg *ix, *regs[IMCC_MAX_REGS], *arg;
    char buf[128];

    sprintf(buf, "I%d", regno);
    ix = mk_pasm_reg(str_dup(buf));
    sprintf(buf, "%d", value);
    arg = mk_const(str_dup(buf), 'I');
    regs[0] = ix;
    regs[1] = arg;
    return insINS(interpreter, ins, "set", regs, 2);
}

static void
pcc_emit_err(Parrot_Interp interpreter, SymReg *err, const char *msg)
{
    SymReg *p0;
    SymReg *regs[IMCC_MAX_REGS];

    /* err_label:
     *   new $P0, .Exception
     *   set $P0["_message"], msg
     *   throw $P0
     *   ret
     */
    INS_LABEL(err, 1);
    p0 = mk_symreg(str_dup("$P0"), 'P');
    iNEW(interpreter, p0, str_dup("Exception"), NULL, 1);
    regs[0] = p0;
    regs[1] = mk_const(str_dup("\"_message\""), 'S');
    regs[2] = mk_const(str_dup(msg), 'S');
    INS(interpreter, "set", NULL, regs, 3, 2, 1);
    INS(interpreter, "throw", NULL, regs, 1, 0, 1);
    INS(interpreter, "ret", NULL, regs, 0, 0, 1);
}

static Instruction *
pcc_emit_check_param(Parrot_Interp interpreter, Instruction *ins,
        SymReg *sub, SymReg *i0, SymReg *p3, int first, int type)
{
    SymReg *check_sub, *regs[IMCC_MAX_REGS], *check_type, *what, *check_pmc;
    char buf[128];
    SymReg *err_nparam, *err_type;

    /*
     * generate check subroutine if not done yet
     */
    what = mk_symreg(str_dup("#what"), 'I');
    strcpy(buf, "_#check_params");
    check_sub = _get_sym(ghash, buf);
    if (!check_sub) {

        check_sub = mk_address(str_dup(buf), U_add_uniq_label);
        /* we just append to the current ins stream */
        INS_LABEL(check_sub, 1);
        /*
         * first time check: amount of params, elements in P3
         * we can globber I0
         */
        err_nparam = mk_address(str_dup("#check_err_nparam"), U_add_uniq_label);
        if (p3) {
            if (!i0)
                i0 = mk_pasm_reg(str_dup("I0"));
            regs[0] = i0;
            regs[1] = p3;
            /* set I0, P3 */
            INS(interpreter, "set", NULL, regs, 2, 0, 1);
            /* lt I0, nparam, check_err_nparam */
            /* the param count in passed by the sub in what
            */
            regs[0] = i0;
        }
        else {
            SymReg *i2 = mk_pasm_reg(str_dup("I2"));
            regs[0] = i2;
        }

        regs[1] = what;
        regs[2] = err_nparam;
        INS(interpreter, "lt", NULL, regs, 3, 0, 1);
        INS(interpreter, "ret", NULL, regs, 0, 0, 1);
        /* emit err handler routines
         * param count
         */
        pcc_emit_err(interpreter, err_nparam, "\"wrong param count\"");
    }

    strcpy(buf, "_#check_param_type");
    check_type = _get_sym(ghash, buf);
    if (!check_type && type) {
        /*
         * type check entry to check sub
         */
        check_type = mk_address(str_dup(buf), U_add_uniq_label);
        INS_LABEL(check_type, 1);
        /*
         * param type check, we get the entry type in what
         */
        /* typeof I0, P3[0] */
        regs[0] = i0;
        regs[1] = p3;
        regs[2] = mk_const(str_dup("0"), 'I');
        INS(interpreter, "typeof", NULL, regs, 3, 4, 1);
        err_type = mk_address(str_dup("#check_err_type"), U_add_uniq_label);
        regs[0] = i0;
        regs[1] = what;
        regs[2] = err_type;
        INS(interpreter, "ne", NULL, regs, 3, 0, 1);
        INS(interpreter, "ret", NULL, regs, 0, 0, 1);

        /*
         * PMC type check entry to check sub
         */
        check_pmc = mk_address(str_dup("_#check_param_type_pmc"),
                U_add_uniq_label);
        INS_LABEL(check_pmc, 1);
        /*
         * either type = enum_type_PMC || > 0
         */
        /* typeof I0, P3[0] */
        regs[0] = i0;
        regs[1] = p3;
        regs[2] = mk_const(str_dup("0"), 'I');
        INS(interpreter, "typeof", NULL, regs, 3, 4, 1);
        regs[0] = i0;
        regs[1] = mk_const(str_dup("0"), 'I');
        regs[2] = check_type;
        INS(interpreter, "lt", NULL, regs, 3, 0, 1);
        INS(interpreter, "ret", NULL, regs, 0, 0, 1);
        /*
         * param type
         */
        pcc_emit_err(interpreter, err_type, "\"wrong param type\"");
    }
    if (first) {
        /* emit first time check
         * what is param count
         */
        regs[0] = what;
        sprintf(buf, "%d", sub->pcc_sub->nargs);
        regs[1] = mk_const(str_dup(buf), 'I');
        ins = insINS(interpreter, ins, "set", regs, 2);
        regs[0] = check_sub;
        ins = insINS(interpreter, ins, "bsr", regs, 1);
    }
    if (!type)
        return ins;
    /* emit type check what is type */
    regs[0] = what;
    sprintf(buf, "%d", type);
    regs[1] = mk_const(str_dup(buf), 'I');
    ins = insINS(interpreter, ins, "set", regs, 2);
    strcpy(buf, enum_type_PMC == type ?
            "_#check_param_type_pmc" : "_#check_param_type");
    check_type = _get_sym(ghash, buf);
    regs[0] = check_type;
    ins = insINS(interpreter, ins, "bsr", regs, 1);
    return ins;
}

void
expand_pcc_sub(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub;
    int next[4], i, j, n;
    char types[] = "ISPN";
    int proto, ps, pe;
    Instruction *tmp;
    SymReg *p3, *i0, *regs[IMCC_MAX_REGS], *label1, *label2;
    char buf[128];

    sub = ins->r[1];
    p3 = i0 = NULL;
    label1 = label2 = NULL;
    ps = pe = sub->pcc_sub->prototyped;
    if (ps == -1) {
	ps = 0; pe = 1;
	/* subroutine can handle both */
	i0 = mk_pasm_reg(str_dup("I0"));
	regs[0] = i0;
	sprintf(buf, "#sub_%s_p1", sub->name);
        regs[1] = label1 = mk_address(str_dup(buf), U_add_uniq_label);
	ins = insINS(interpreter, ins, "if", regs, 2);

    }
    for (proto = ps; proto <= pe; ++proto) {
	for (i = 0; i < 4; i++)
	    next[i] = 5;
	/* insert params */
	n = sub->pcc_sub->nargs;
	for (i = 0; i < n; i++) {
	    arg = sub->pcc_sub->args[i];
	    if (proto == 1 ||
		    (arg->set == 'P' && next[2] < 16)) {
		for (j = 0; j < 4; j++) {
		    if (arg->set == types[j]) {
			if (next[j] == 16)
			    goto overflow;
			if (arg->color == next[j]) {
			    next[j]++;
			    break;
			}
                        /* if unprototyped check param count */
                        if (ps != pe && !proto)
                            ins = pcc_emit_check_param(interpreter,
                                    ins, sub, i0, NULL, i == 0, 0);
			/* assign register to that param
                         *
                         * if this subroutine calls another one,
                         * new registers are ssigned, so that
                         * they don't interfer with this subs params
                         */
                        if (sub->pcc_sub->calls_a_sub) {
                            regs[0] = arg;
                            arg->reg->want_regno = next[j];
                            sprintf(buf, "%c%d", arg->set, next[j]++);
                            regs[1] = mk_pasm_reg(str_dup(buf));
                            /* e.g. set $I0, I5 */
                            ins = insINS(interpreter, ins, "set", regs, 2);
                        }
                        else {
                            /*
                             * if no sub is called from here
                             * just use the passed register numbers
                             */
                            arg->reg->color = next[j]++;
                        }
			break;
		    }
		}
	    }
	    else {
                int type;
                /*
                 * TODO overflow tests
                 */
overflow:
		if (!p3)
		    p3 = mk_pasm_reg(str_dup("P3"));
                switch (sub->pcc_sub->args[i]->set) {
                    case 'I': type = enum_type_INTVAL; break;
                    case 'S': type = enum_type_STRING; break;
                    case 'N': type = enum_type_FLOATVAL; break;
                    case 'P': type = enum_type_PMC; break;
                    default: type = -1;
                }
                /*
                 * emit code to inspect the argument type
                 * if something is wrong, an exception gets thrown
                 */
                ins = pcc_emit_check_param(interpreter, ins, sub, i0, p3,
                        i == 0, type);
                /* this uses register numbers (if any)
                 * from the first prototyped pass
                 */
		regs[0] = sub->pcc_sub->args[i];
		regs[1] = p3;
		ins = insINS(interpreter, ins, "shift", regs, 2);
	    }
	} /* n params */
        if (ps != pe) {
            if (!proto) {
                /* branch to the end */
                sprintf(buf, "#sub_%s_p0", sub->name);
                regs[0] = label2 = mk_address(str_dup(buf), U_add_uniq_label);
                ins = insINS(interpreter, ins, "branch", regs, 1);
                tmp = INS_LABEL(label1, 0);
                insert_ins(ins, tmp);
                ins = tmp;
            }
            else {
                tmp = INS_LABEL(label2, 0);
                insert_ins(ins, tmp);
                ins = tmp;
            }
        }
    } /* proto */

    /*
     * if we call out, the return cc in P1 must be saved
     */
    if (sub->pcc_sub->calls_a_sub) {
        regs[0] = sub->pcc_sub->cc_sym = mk_temp_reg('P');
        regs[1] = mk_pasm_reg(str_dup("P1"));
        insINS(interpreter, ins, "set", regs, 2);
    }
}

void
expand_pcc_sub_ret(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS], *p3;
    int next[4], i, j, n, arg_count;
    char types[] = "ISPN";
    Instruction *tmp;
    char buf[128];
    int n_p3;

    arg_count = ins->type & ITPCCYIELD ? 0 : 1;
    for (i = 0; i < 4; i++)
        next[i] = 5;
    p3 = NULL;
    n_p3 = 0;
    tmp = NULL;
    /*
     * if we have preserved the return continuation
     * restore it
     */
    sub = instructions->r[1];
    if (sub->pcc_sub->cc_sym) {
        regs[0] = mk_pasm_reg(str_dup("P1"));
        regs[1] = sub->pcc_sub->cc_sym;
        tmp = insINS(interpreter, ins, "set", regs, 2);
    }
    /* FIXME
     * fake prototyped
     * return conventions need more spec in pdd
     */
    sub = ins->r[0];
    /*
     * past the eventually inserted return cc restore
     */
    if (tmp)
        ins = tmp;
    sub->pcc_sub->prototyped = 1;
    n = sub->pcc_sub->nret;
    for (i = 0; i < n; i++) {
        arg = sub->pcc_sub->ret[i];
        if (sub->pcc_sub->prototyped ||
                (arg->set == 'P' && next[2] < 16)) {
            /*
             * prototyped
             */
            /* if arg is constant, set register */
            switch (arg->type) {
                case VT_CONSTP:
                    arg = arg->reg;
                    /* goon */
                case VTCONST:
lazy:
                    for (j = 0; j < 4; j++) {
                        if (arg->set == types[j]) {
                            if (next[j] == 16)
                                goto overflow;
                            if (arg->color == next[j]) {
                                next[j]++;
                                break;
                            }
                            sprintf(buf, "%c%d", arg->set, next[j]++);
                            reg = mk_pasm_reg(str_dup(buf));
                            regs[0] = reg;
                            regs[1] = arg;
                            ins = insINS(interpreter, ins, "set", regs, 2);
                            sub->pcc_sub->ret[i]->used = reg;
                            break;
                        }
                    }
                    break;
                default:
                    if (arg->type & VTREGISTER) {
                        for (j = 0; j < 4; j++)
                            if (arg->set == types[j]) {
                                arg->reg->want_regno = next[j];
                                sub->pcc_sub->ret[i]->used = arg->reg;
                                break;
                            }
                            /* TODO for now just emit a register move */
                            goto lazy;
                    }
            }
        }
        else {
            /* non prototyped or overflow */
overflow:
            if (!p3) {
                p3 = mk_pasm_reg(str_dup("P3"));
                tmp = iNEW(interpreter, p3, str_dup("SArray"), NULL, 0);
                insert_ins(ins, tmp);
                ins = tmp;
                sprintf(buf, "%d", n);
                regs[0] = p3;
                regs[1] = mk_const(str_dup(buf), 'I');
                ins = insINS(interpreter, ins, "set", regs, 2);
            }
            regs[0] = p3;
            regs[1] = arg;
            ins = insINS(interpreter, ins, "push", regs, 2);
            n_p3++;
        }

    }
    /*
     * setup I regs
     */
    ins = set_I_const(interpreter, ins, 0, sub->pcc_sub->prototyped);
    for (i = 0; i < 4; i++)
        ins = set_I_const(interpreter, ins, i + 1, next[i] - 5);

    /*
     * we have a pcc_begin_yield
     */
    if (arg_count == 0) {
        /*
         * preserve registers over coroutine invoke
         *
         * TODO optimize this later
         */
        ins = insINS(interpreter, ins, "savetop", regs, 0);
    }
    /*
     * insert return invoke
     */
    reg = mk_pasm_reg(str_dup("P1"));
    regs[0] = reg;
    ins = insINS(interpreter, ins, "invoke", regs, arg_count);
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
        ins = insINS(interpreter, ins, "restoretop", regs, 0);
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
check_tail_call(Parrot_Interp interpreter, Instruction *ins)
{
    Instruction *tmp, *ret_ins;
    int call_found, ret_found;
    int i, j, matching;
    struct pcc_sub_t *call, *ret;
    /*
     * currently only with -Oc
     */
    UNUSED(interpreter);
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
insert_tail_call(Parrot_Interp interpreter, Instruction *ins, SymReg *sub)
{
    SymReg *iaddr = mk_temp_reg('I');
    SymReg *regs[IMCC_MAX_REGS];

    regs[0] = iaddr;
    regs[1] = sub->pcc_sub->sub;
    ins = insINS(interpreter, ins, "set", regs, 2);
    ins = insINS(interpreter, ins, "jump", regs, 1);
}

static Instruction *
pcc_emit_flatten(Parrot_Interp interpreter, Instruction *ins,
        SymReg *arg, int i, int *flatten)
{

    SymReg *regs[IMCC_MAX_REGS];
    SymReg *i0, *i1, *i2, *py, *p3, *ic16;
    SymReg *loop, *next, *over, *over1;
    Instruction *tmp;
    int lin;
    char buf[128];
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

    i0 = mk_symreg(str_dup("#i0"), 'I');        /* TODO cache syms */
    i1 = mk_symreg(str_dup("#i1"), 'I');
    i2 = mk_pasm_reg(str_dup("I2"));
    py = mk_symreg(str_dup("#py"), 'P');
    p3 = mk_pasm_reg(str_dup("P3"));
    /* first time */
    if (!(*flatten)++) {
        regs[0] = i2;
        sprintf(buf, "%d", i+5);
        regs[1] = mk_const(str_dup(buf), 'I');
        ins = insINS(interpreter, ins, "set", regs, 2);
    }
    lin = ins->line;
    sprintf(buf, "#arg_loop_%d_%d", lin, i);
    loop = mk_address(str_dup(buf), U_add_uniq_label);
    sprintf(buf, "#next_arg_%d_%d", lin, i);
    next = mk_address(str_dup(buf), U_add_uniq_label);
    sprintf(buf, "#over_flow_%d_1_%d", lin, i);
    over1 = mk_address(str_dup(buf), U_add_uniq_label);
    sprintf(buf, "#over_flow_%d_%d", lin, i);
    over = mk_address(str_dup(buf), U_add_uniq_label);

    if (arg->type & VT_FLATTEN) {
        regs[0] = i0;
        ins = insINS(interpreter, ins, "null", regs, 1);
        regs[0] = i1;
        regs[1] = arg;
        ins = insINS(interpreter, ins, "set", regs, 2);
        tmp = INS_LABEL(loop, 0);
        insert_ins(ins, tmp);
        ins = tmp;
        regs[0] = i0;
        regs[1] = i1;
        regs[2] = next;
        ins = insINS(interpreter, ins, "ge", regs, 3);
        regs[0] = py;
        regs[1] = arg;
        regs[2] = i0;
        tmp = INS(interpreter, "set", NULL, regs, 3, KEY_BIT(2), 0);
        insert_ins(ins, tmp);
        ins = tmp;
        regs[0] = i0;
        ins = insINS(interpreter, ins, "inc", regs, 1);
    }
    else
        py = arg;
    regs[0] = i2;
    regs[1] = ic16 = mk_const(str_dup("16"), 'I');
    regs[2] = over1;
    ins = insINS(interpreter, ins, "eq", regs, 3);
    regs[0] = i2;
    regs[1] = ic16;
    regs[2] = over;
    ins = insINS(interpreter, ins, "gt", regs, 3);
    regs[0] = i2;
    regs[1] = py;
    ins = insINS(interpreter, ins, "setp_ind", regs, 2);
    regs[0] = i2;
    ins = insINS(interpreter, ins, "inc", regs, 1);

    regs[0] = (arg->type & VT_FLATTEN) ? loop : next;
    ins = insINS(interpreter, ins, "branch", regs, 1);
    tmp = INS_LABEL(over1, 0);
    insert_ins(ins, tmp);
    ins = tmp;
    p3 = mk_pasm_reg(str_dup("P3"));
    tmp = iNEW(interpreter, p3, str_dup("PerlArray"), NULL, 0);
    insert_ins(ins, tmp);
    ins = tmp;
    tmp = INS_LABEL(over, 0);
    insert_ins(ins, tmp);
    ins = tmp;
    regs[0] = p3;
    regs[1] = py;
    ins = insINS(interpreter, ins, "push", regs, 2);
    regs[0] = i2;
    ins = insINS(interpreter, ins, "inc", regs, 1);
    regs[0] = (arg->type & VT_FLATTEN) ? loop : next;
    ins = insINS(interpreter, ins, "branch", regs, 1);
    tmp = INS_LABEL(next, 0);
    insert_ins(ins, tmp);
    ins = tmp;
    return ins;
}

void
expand_pcc_sub_call(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *arg_reg, *regs[IMCC_MAX_REGS];
    int next[4], i, j, n;
    char types[] = "ISPN";
    Instruction *tmp, *call_ins;
    int need_cc;
    char buf[128];
    SymReg *p3;
    int n_p3;
    int tail_call;
    int flatten;

    tail_call = check_tail_call(interpreter, ins);
    if (tail_call)
        debug(interpreter, DEBUG_OPT1, "found tail call %I \n", ins);
    for (i = 0; i < 4; i++)
        next[i] = 5;
    call_ins = ins;
    sub = ins->r[0];
    p3 = NULL;
    n_p3 = 0;
    flatten = 0;
    /*
     * insert arguments
     */
    n = sub->pcc_sub->nargs;
    for (i = 0; i < n; i++) {
        /*
         * if prototyped, first 11 I,S,N go into regs
         */
        arg = sub->pcc_sub->args[i];
        arg_reg = arg->reg;
        if (sub->pcc_sub->prototyped ||
                (arg->set == 'P' && next[2] < 16)) {
            switch (arg->type) {
                /* if arg is constant, set register */
                case VT_CONSTP:
                case VTCONST:
lazy:
                    for (j = 0; j < 4; j++) {
                        if (arg_reg->set == types[j]) {
                            if (arg_reg->color == next[j]) {
                                next[j]++;
                                break;
                            }
                            if (next[j] == 16)
                                goto overflow;
                            sprintf(buf, "%c%d", arg_reg->set, next[j]++);
                            reg = mk_pasm_reg(str_dup(buf));
                            regs[0] = reg;
                            regs[1] = arg_reg;
                            ins = insINS(interpreter, ins, "set", regs, 2);
                            /* remember reg for life analysis */
                            sub->pcc_sub->args[i]->used = reg;

                            break;
                        }
                    }
                    break;
                default:
                    if (arg->type & VTREGISTER) {
                        /* TODO for now just emit a register move */
                        for (j = 0; j < 4; j++)
                            if (arg->set == types[j]) {
                                if (j == 2 &&
                                        (flatten ||
                                         (arg_reg->type & VT_FLATTEN)))
                                    goto flatten;
                                arg_reg->want_regno = next[j];
                                sub->pcc_sub->args[i]->used = arg_reg;
                                break;
                            }
                        goto lazy;
                    }
            }
        }
        else {
            /* non prototyped or overflow */
overflow:
            if (!p3) {
                p3 = mk_pasm_reg(str_dup("P3"));
                tmp = iNEW(interpreter, p3, str_dup("SArray"), NULL, 0);
                insert_ins(ins, tmp);
                ins = tmp;
                sprintf(buf, "%d", n);
                regs[0] = p3;
                regs[1] = mk_const(str_dup(buf), 'I');
                ins = insINS(interpreter, ins, "set", regs, 2);
            }
            if (flatten || (arg_reg->type & VT_FLATTEN))
                goto flatten;
            regs[0] = p3;
            regs[1] = arg;
            ins = insINS(interpreter, ins, "push", regs, 2);
            n_p3++;
        }
        continue;
flatten:
        /* if we had a flattening arg, we must continue emitting
         * code to do all at runtime
         */
        ins = pcc_emit_flatten(interpreter, ins, arg_reg, i, &flatten);
    } /* for i */

    /*
     * if we have a tail call then
     * insert a jump
     */
    if (tail_call) {
        insert_tail_call(interpreter, ins, sub);
        return;
    }

    /*
     * setup P0, P1
     */
    arg = sub->pcc_sub->sub;
    if (arg->reg->type & VTPASM) {
move_sub:
        if (arg->reg->color != 0) {
            reg = mk_pasm_reg(str_dup("P0"));
            regs[0] = reg;
            regs[1] = arg;
            arg->reg->want_regno = 0;
            ins = insINS(interpreter, ins, "set", regs, 2);
        }
    }
    else {
        /* TODO no move if possible */
        goto move_sub;
    }

    arg = sub->pcc_sub->cc;
    need_cc = 0;
    if (arg) {
        if (arg->reg->type & VTPASM) {
move_cc:
            if (arg->reg->color != 1) {
                reg = mk_pasm_reg(str_dup("P1"));
                regs[0] = reg;
                regs[1] = arg;
                arg->reg->want_regno = 1;
                ins = insINS(interpreter, ins, "set", regs, 2);
            }
        }
        else {
            /* TODO no move */
            goto move_cc;
        }
    }
    else if (!sub->pcc_sub->nci)
        need_cc = 1;
    /* set prototyped: I0 */
    ins = set_I_const(interpreter, ins, 0, sub->pcc_sub->prototyped);
    /* set items in P3: I1 */
    ins = set_I_const(interpreter, ins, 1, n_p3);
    /* set items in PRegs: I2 */
    if (flatten) {
        regs[0] = mk_pasm_reg(str_dup("I2"));;
        regs[1] = mk_const(str_dup("5"), 'I');
        ins = insINS(interpreter, ins, "sub", regs, 2);
    }
    else
        ins = set_I_const(interpreter, ins, 2, next[2] - 5);
    /* return type 0=void, or -n-1: I3 */
    ins = set_I_const(interpreter, ins, 3,
            sub->pcc_sub->nret ? -1 - sub->pcc_sub->nret : 0);
#if 0
    /* TODO method calls */
    /* meth hash value: I4 */
    ins = set_I_const(interpreter, ins, 4, 0);
    /* meth name: S0 */
    /* object: P2 */
#endif
    /*
     * if we reuse the continuation, update it
     */
    if (!sub->pcc_sub->nci)
        if (!need_cc)
            ins = insINS(interpreter, ins, "updatecc", regs, 0);
    /*
     * emit a savetop for now
     */
    ins = insINS(interpreter, ins, "savetop", regs, 0);
    ins = insINS(interpreter, ins, need_cc ? "invokecc" : "invoke", regs, 0);
    ins->type |= ITPCCSUB;
    /*
     * move the pcc_sub structure to the invoke
     */
    ins->r[0] = mk_pasm_reg(str_dup("P0"));
    ins->r[0]->pcc_sub = sub->pcc_sub;
    sub->pcc_sub = NULL;
    sub = ins->r[0];
    /*
     * locate return label,
     * we must have one or the parser would have failed
     */
    if (ins->next->type == ITLABEL)
        ins = ins->next;
    ins = insINS(interpreter, ins, "restoretop", regs, 0);
    /*
     * handle return results
     * TODO: overflow
     */
    for (i = 0; i < 4; i++)
        next[i] = 5;
    n = sub->pcc_sub->nret;
    for (i = 0; i < n; i++) {
        arg = sub->pcc_sub->ret[i];
        if (sub->pcc_sub->prototyped == 1 ||
                (arg->set == 'P' && next[2] < 16)) {
            for (j = 0; j < 4; j++) {
                if (arg->set == types[j]) {
                    if (arg->reg->color == next[j]) {
                        next[j]++;
                        break;
                    }
                    arg->reg->want_regno = next[j];
                    sprintf(buf, "%c%d", arg->set, next[j]++);
                    reg = mk_pasm_reg(str_dup(buf));
                    regs[0] = arg;
                    regs[1] = reg;
                    ins = insINS(interpreter, ins, "set", regs, 2);
                    sub->pcc_sub->ret[i]->used = reg;
                    break;
                }
            }
        }
        else {
            if (!p3)
                p3 = mk_pasm_reg(str_dup("P3"));
            regs[0] = arg;
            regs[1] = p3;
            ins = insINS(interpreter, ins, "shift", regs, 2);
        }
    }
}

/*
 * optimize register save op (savetop/restoretop)
 * for PCC
 * TODO saveall
 */
static void
optc_savetop(Parrot_Interp interpreter, Instruction *ins)
{
    char types[] = "ISPN";
    Instruction *tmp;
    SymReg * regs[IMCC_MAX_REGS], *r;
    SymReg** reglist = IMCC_INFO(interpreter)->reglist;
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
    for (i = 0; i < IMCC_INFO(interpreter)->n_symbols; i++) {
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
            ins = delete_ins(ins, 1);
            debug(interpreter, DEBUG_OPT1, "deleted\n");
            ostat.deleted_ins++;
            for (; ins ; ins = ins->next)
                if (!strcmp(ins->op, "restoretop"))
                    break;
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            ins = delete_ins(ins, 1);
            debug(interpreter, DEBUG_OPT1, "deleted\n");
            ostat.deleted_ins++;
            break;
        case 1:
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            for (i = 0; i < 4; i++)
                if (needs_save[i])
                    break;
            tmp = INS(interpreter, new_save[i], NULL, regs, 0, 0, 0);
            subst_ins(ins, tmp, 1);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            for (ins = tmp; ins ; ins = ins->next)
                if (!strcmp(ins->op, "restoretop"))
                    break;
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            tmp = INS(interpreter, new_restore[i], NULL, regs, 0, 0, 0);
            subst_ins(ins, tmp, 1);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            break;
    }
}
/*
 * special peephole optimizer for code generated mainly by
 * above functions
 */
void
pcc_optimize(Parrot_Interp interpreter)
{
    Instruction *ins, *tmp;
    info(interpreter, 2, "\tpcc_optimize\n");
    for (ins = instructions; ins; ins = ins->next) {
        if (ins->opsize == 3 &&
                ins->r[1]->type == VTCONST &&
                (ins->r[0]->set == 'I' || ins->r[0]->set == 'N') &&
                atof(ins->r[1]->name) == 0.0 &&
                !strcmp(ins->op, "set")) {
            debug(interpreter, DEBUG_OPT1, "opt1 %I => ", ins);
            tmp = INS(interpreter, "null", NULL, ins->r, 1, 0, 0);
            debug(interpreter, DEBUG_OPT1, "%I\n", tmp);
            subst_ins(ins, tmp, 1);
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
                ins = delete_ins(ins, 1);
                ins = ins->prev ? ins->prev : instructions;
                debug(interpreter, DEBUG_OPT1, "deleted\n");
                ostat.deleted_ins++;
            }
        }
        else if (ins->type & ITPCCSUB) {
            tmp = ins;
            tmp = tmp->prev;
            if (!strcmp(tmp->op, "savetop"))
                optc_savetop(interpreter, tmp);
            else {
                tmp = tmp->prev;
                if (!strcmp(tmp->op, "savetop"))
                    optc_savetop(interpreter, tmp);
            }
        }
    }
}

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

int
pcc_sub_writes(Instruction* ins, SymReg* r)
{
    if (ins->type & ITPCCRET)
        return 0;
    return pcc_ret(ins, r) || pcc_args(ins, r);
}

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
