#include <stdlib.h>
#include <string.h>
#include "imc.h"

/*
 * pcc.c - parrot calling conventions stuff
 *
 */

void
expand_pcc_sub(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub;
    int next[4], i, j, n;
    char types[] = "INSP";

    UNUSED(interpreter);
    for (i = 0; i < 4; i++)
        next[i] = 5;
    sub = ins->r[1];
    /* insert params */
    n = sub->pcc_sub->nargs;
    for (i = 0; i < n; i++) {
        arg = sub->pcc_sub->args[i];
        for (j = 0; j < 4; j++) {
            if (arg->set == types[j]) {
                if (arg->color == next[j]) {
                    next[j]++;
                    break;
                }
                arg->reg->color = next[j]++;
                break;
            }
        }
    }
}

static Instruction *
insINS(struct Parrot_Interp *interpreter, Instruction *ins,
        char *name, char *fmt, SymReg **regs, int n, int keys)
{
    Instruction *tmp = INS(interpreter, name, fmt, regs, n, keys, 0);
    insert_ins(ins, tmp);
    return tmp;
}

void
expand_pcc_sub_ret(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS];
    int next[4], i, j, n;
    char types[] = "INSP";

    for (i = 0; i < 4; i++)
        next[i] = 5;
    /* the first ins holds the sub SymReg */
    sub = instructions->r[1];
    n = sub->pcc_sub->nret;
    for (i = 0; i < n; i++) {
        arg = sub->pcc_sub->ret[i];
        /* if arg is constant, set register */
        switch (arg->type) {
            case VT_CONSTP:
                arg = arg->reg;
                /* goon */
            case VTCONST:
lazy:
                for (j = 0; j < 4; j++) {
                    if (arg->set == types[j]) {
                        char buf[128];
                        if (arg->color == next[j]) {
                            next[j]++;
                            break;
                        }
                        sprintf(buf, "%c%d", arg->set, next[j]++);
                        reg = mk_pasm_reg(str_dup(buf));
                        regs[0] = reg;
                        regs[1] = arg;
                        ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
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
    /*
     * insert return invoke
     */
    reg = mk_pasm_reg(str_dup("P1"));
    regs[0] = reg;
    ins = insINS(interpreter, ins, "invoke", NULL, regs, 1, 0);
}

void
expand_pcc_sub_call(Parrot_Interp interpreter, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[IMCC_MAX_REGS];
    int next[4], i, j, n;
    char types[] = "INSP";
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
                (arg->set == 'P' && next[3] < 15)) {
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
                            ins = insINS(interpreter, ins, "set", NULL,
                                    regs, 2, 0);
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
                ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
            }
            regs[0] = p3;
            regs[1] = sub->pcc_sub->args[i];
            ins = insINS(interpreter, ins, "push", NULL, regs, 2, 0);
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
            ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
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
                ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
            }
        }
        else {
            /* TODO no move */
            goto move_cc;
        }
    }
    else
        need_cc = 1;
    /* set prototyped, I0 */
    reg = mk_pasm_reg(str_dup("I0"));
    sprintf(buf, "%d", sub->pcc_sub->prototyped);
    arg = mk_const(str_dup(buf), 'I');
    regs[0] = reg;
    regs[1] = arg;
    ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
    /* set items in P3, I1 */
    reg = mk_pasm_reg(str_dup("I1"));
    sprintf(buf, "%d", n_p3);
    arg = mk_const(str_dup(buf), 'I');
    regs[0] = reg;
    regs[1] = arg;
    ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
    /* set items in PRegs, I2 */
    reg = mk_pasm_reg(str_dup("I2"));
    sprintf(buf, "%d", next[3] - 5);
    arg = mk_const(str_dup(buf), 'I');
    regs[0] = reg;
    regs[1] = arg;
    ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
    /*
     * emit a savetop for now
     */
    ins = insINS(interpreter, ins, "savetop", NULL, regs, 0, 0);
    /* TODO updatecc */
    ins = insINS(interpreter, ins, need_cc ? "invokecc" : "invoke",
            NULL, regs, 0, 0);
    /*
     * locate return label,
     * we must have one or the parser would have failed
     */
    while (ins->type != ITLABEL)
        ins = ins->next;
    ins = insINS(interpreter, ins, "restoretop", NULL, regs, 0, 0);
    /*
     * handle return results
     * TODO: overflow, non prototyped
     */
    for (i = 0; i < 4; i++)
        next[i] = 5;
    n = sub->pcc_sub->nret;
    for (i = 0; i < n; i++) {
        arg = sub->pcc_sub->ret[i];
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
                ins = insINS(interpreter, ins, "set", NULL, regs, 2, 0);
                break;
            }
        }
    }
}

