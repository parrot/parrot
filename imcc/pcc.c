#include <stdlib.h>
#include <string.h>
#include "imc.h"

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

void
expand_pcc_sub(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub;
    int next[4], i, j, n;
    char types[] = "ISPN";
    int proto, ps, pe;
    Instruction *tmp;
    SymReg *p3, *i0, *regs[IMCC_MAX_REGS], *label1;
    char buf[128];

    sub = ins->r[1];
    p3 = NULL;
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
		    (arg->set == 'P' && next[2] < 15)) {
		for (j = 0; j < 4; j++) {
		    if (arg->set == types[j]) {
			if (next[j] == 15)
			    goto overflow;
			if (arg->color == next[j]) {
			    next[j]++;
			    break;
			}
			/* assign register to that param */
			arg->reg->color = next[j]++;
			break;
		    }
		}
	    }
	    else {
                /*
                 * TODO handle overflow
                 */
overflow:
		if (!p3)
		    p3 = mk_pasm_reg(str_dup("P3"));
		regs[0] = sub->pcc_sub->args[i];
		regs[1] = p3;
		ins = insINS(interpreter, ins, "shift", regs, 2);
	    }
	} /* n params */
        /*
         * TODO branch to end
         */
        if (ps != pe && !proto) {
            tmp = INS_LABEL(label1, 0);
            insert_ins(ins, tmp);
            ins = tmp;
        }
    } /* proto */
}

void
expand_pcc_sub_ret(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS], *p3;
    int next[4], i, j, n;
    char types[] = "ISPN";
    Instruction *tmp;
    char buf[128];
    int n_p3;

    for (i = 0; i < 4; i++)
        next[i] = 5;
    p3 = NULL;
    n_p3 = 0;
    /* the first ins holds the sub SymReg */
    sub = instructions->r[1];
    n = sub->pcc_sub->nret;
    for (i = 0; i < n; i++) {
        arg = sub->pcc_sub->ret[i];
        if (sub->pcc_sub->prototyped ||
                (arg->set == 'P' && next[2] < 15)) {
            /*
             * unprototyped
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
                            if (next[j] == 15)
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
                            break;
                        }
                    }
                    break;
                default:
                    if (arg->type & VTREGISTER) {
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
     * insert return invoke
     */
    reg = mk_pasm_reg(str_dup("P1"));
    regs[0] = reg;
    ins = insINS(interpreter, ins, "invoke", regs, 1);
}

void
expand_pcc_sub_call(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS];
    int next[4], i, j, n;
    char types[] = "ISPN";
    Instruction *tmp;
    int need_cc;
    char buf[128];
    SymReg *p3;
    int n_p3;

    for (i = 0; i < 4; i++)
        next[i] = 5;
    sub = ins->r[0];
    p3 = NULL;
    n_p3 = 0;
    /*
     * insert arguments
     */
    n = sub->pcc_sub->nargs;
    for (i = 0; i < n; i++) {
        /*
         * if prototyped, first 11 I,S,N go into regs
         */
        arg = sub->pcc_sub->args[i];
        if (sub->pcc_sub->prototyped ||
                (arg->set == 'P' && next[2] < 15)) {
            switch (arg->type) {
                /* if arg is constant, set register */
                case VT_CONSTP:
                case VTCONST:
lazy:
                    arg = arg->reg;
                    for (j = 0; j < 4; j++) {
                        if (arg->set == types[j]) {
                            if (arg->color == next[j]) {
                                next[j]++;
                                break;
                            }
                            if (next[j] == 15)
                                goto overflow;
                            sprintf(buf, "%c%d", arg->set, next[j]++);
                            reg = mk_pasm_reg(str_dup(buf));
                            regs[0] = reg;
                            regs[1] = arg;
                            ins = insINS(interpreter, ins, "set", regs, 2);
                            break;
                        }
                    }
                    break;
                default:
                    if (arg->type & VTREGISTER) {
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
     * setup P0, P1
     */
    arg = sub->pcc_sub->sub;
    if (arg->reg->type & VTPASM) {
move_sub:
        if (arg->reg->color != 0) {
            reg = mk_pasm_reg(str_dup("P0"));
            regs[0] = reg;
            regs[1] = arg;
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
                ins = insINS(interpreter, ins, "set", regs, 2);
            }
        }
        else {
            /* TODO no move */
            goto move_cc;
        }
    }
    else
        need_cc = 1;
    /* set prototyped: I0 */
    ins = set_I_const(interpreter, ins, 0, sub->pcc_sub->prototyped);
    /* set items in P3: I1 */
    ins = set_I_const(interpreter, ins, 1, n_p3);
    /* set items in PRegs: I2 */
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
    if (!need_cc)
        ins = insINS(interpreter, ins, "updatecc", regs, 0);
    /*
     * emit a savetop for now
     */
    ins = insINS(interpreter, ins, "savetop", regs, 0);
    ins = insINS(interpreter, ins, need_cc ? "invokecc" : "invoke", regs, 0);
    /*
     * locate return label,
     * we must have one or the parser would have failed
     */
    while (ins->type != ITLABEL)
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
                (arg->set == 'P' && next[2] < 15)) {
            for (j = 0; j < 4; j++) {
                if (arg->set == types[j]) {
                    if (arg->reg->color == next[j]) {
                        next[j]++;
                        break;
                    }
                    sprintf(buf, "%c%d", arg->set, next[j]++);
                    reg = mk_pasm_reg(str_dup(buf));
                    regs[0] = arg;
                    regs[1] = reg;
                    ins = insINS(interpreter, ins, "set", regs, 2);
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
