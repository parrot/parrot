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

/*
 * get or create a constant
 */
SymReg*
get_const(Interp *interp, const char *name, int type)
{
    SymReg *r;

    if ((r = _get_sym(IMCC_INFO(interp)->ghash, name)) && r->set == type)
        return r;
    return mk_const(interp, str_dup(name), type);
}

/*
 * set arguments or return values
 * get params or results
 * used by expand_pcc_sub_call and expand_pcc_sub
 */
static Instruction*
pcc_get_args(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins,
        char *op_name, int n, SymReg **args, int *arg_flags)
{
    int i, l, flags;
    char buf[1024], s[16];
    SymReg **regs, *arg;

    regs = mem_sys_allocate((n + 1) * sizeof(SymReg *));
    strcpy(buf, "\"(");
    for (i = 0; i < n; i++) {
        arg = args[i];
        if (arg->type & VT_CONSTP)
            arg = arg->reg;
        regs[i + 1] = arg;
        flags = 0;
        if (arg_flags[i] & VT_FLAT) {
            flags |= PARROT_ARG_FLATTEN;
        }
        if (arg_flags[i] & VT_OPTIONAL) {
            flags |= PARROT_ARG_OPTIONAL;
        }
        else if (arg_flags[i] & VT_OPT_FLAG) {
            flags |= PARROT_ARG_OPT_FLAG;
        }
        sprintf(s, "%d", flags);
        if (i < n - 1)
            strcat(s, ",");
        l = strlen(s);
        strcat(buf, s);         /* XXX check avail len */
    } /* n params */
    strcat(buf, ")\"");
    regs[0] = mk_const(interp, str_dup(buf), 'S');
    ins = insINS(interp, unit, ins, op_name, regs, n + 1);
    mem_sys_free(regs);
    return ins;
}

/*
 * prepend the object to args or self to params
 */
static void
unshift_self(Interp *interp, SymReg *sub, SymReg *obj)
{
    int i, n = sub->pcc_sub->nargs;

    UNUSED(interp);
    sub->pcc_sub->args = realloc(sub->pcc_sub->args,
            (n + 1) * sizeof(SymReg *));
    sub->pcc_sub->arg_flags = realloc(sub->pcc_sub->arg_flags,
            (n + 1) * sizeof(int));
    for (i = n; i; --i) {
        sub->pcc_sub->args[i] = sub->pcc_sub->args[i - 1];
        sub->pcc_sub->arg_flags[i] = sub->pcc_sub->arg_flags[i - 1];
    }
    sub->pcc_sub->args[0] = obj;
    sub->pcc_sub->arg_flags[0] = 0;
    sub->pcc_sub->nargs++;
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
    Instruction *tmp;
    SymReg *regs[2];

    sub = ins->r[0];

    /*
     * if this sub isa method, unshift 'self' as first param
     */
    if (sub->pcc_sub->pragma & P_METHOD) {
        SymReg *self = get_sym("self");
        if (!self) {
            self = mk_symreg(interp, str_dup("self"), 'P');
            self->type = VTIDENTIFIER;
        }
        unshift_self(interp, sub, self);
    }

    /* Don't generate any parameter checking code if there
     * are no named arguments.
     */
    nargs = sub->pcc_sub->nargs;
    if (nargs) {
        ins = pcc_get_args(interp, unit, ins, "get_params", nargs,
                           sub->pcc_sub->args, sub->pcc_sub->arg_flags);
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
            pcc_get_args(interp, unit, unit->last_ins, "set_returns",
                    0, NULL, NULL);
            tmp = INS(interp, unit, "returncc", NULL, regs, 0, 0, 0);
        }
        IMCC_debug(interp, DEBUG_IMC, "add sub ret - %I\n", tmp);
        insert_ins(unit, unit->last_ins, tmp);
    }

#if 0
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
#endif
}


/*
 * Expand a PCC sub return directive into its PASM instructions
 */
void
expand_pcc_sub_ret(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub, *regs[2];
    int  n, is_yield;

    is_yield = ins->type & ITPCCYIELD;

    /* TODO implement return conventions */
    sub = ins->r[0];
    n = sub->pcc_sub->nret;
    ins = pcc_get_args(interp, unit, ins, "set_returns", n,
                       sub->pcc_sub->ret, sub->pcc_sub->ret_flags);

    /*
     * we have a pcc_begin_yield
     */
    if (is_yield) {
        ins = insINS(interp, unit, ins, "yield", regs, 0);
        ins->type |= ITPCCYIELD;
    }
    else {
        /*
         * insert return invoke
         */
        ins = insINS(interp, unit, ins, "returncc", regs, 0);
        ins->type |= ITPCCRET;
    }
}

static void
insert_tail_call(Parrot_Interp interp, IMC_Unit * unit,
        Instruction *ins, SymReg *sub, int meth_call, SymReg *s0)
{
    SymReg *regs[2];

    if (meth_call) {
        s0 = s0 ? s0 : get_pasm_reg(interp, "S0");
        regs[0] = sub->pcc_sub->object;
        regs[1] = s0;
        ins = insINS(interp, unit, ins, "tailcallmethod", regs, 2);
    }
    else {
        regs[0] = sub->pcc_sub->sub;
        ins = insINS(interp, unit, ins, "tailcall", regs, 1);
    }
    regs[0]->pcc_sub = sub->pcc_sub;
    sub->pcc_sub = NULL;
    ins->type |= ITPCCSUB;
}

/*
 * Expand a PCC subroutine call (IMC) into its PASM instructions
 * This is the nuts and bolts of pdd03 routine call style
 *
 */
void
expand_pcc_sub_call(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *arg, *sub, *reg, *regs[3];
    int  n;
    int tail_call;
    int meth_call = 0;
    SymReg *s0 = NULL;
    Instruction *get_name;

    sub = ins->r[0];
    tail_call = (sub->pcc_sub->flags & isTAIL_CALL);

    if (sub->pcc_sub->object) {
        meth_call = 1;
        if (sub->pcc_sub->object->set == 'S') {
            regs[0] = mk_temp_reg(interp, 'P');
            regs[1] = sub->pcc_sub->object;
            ins = insINS(interp, unit, ins, "getclass", regs, 2);
            sub->pcc_sub->object = regs[0];
        }
    }

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
            reg = mk_temp_reg(interp, 'P');
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
    }

    if (sub->pcc_sub->object) {
        unshift_self(interp, sub, sub->pcc_sub->object);
    }
    /*
     * insert arguments
     */
    n = sub->pcc_sub->nargs;
    ins = pcc_get_args(interp, unit, ins, "set_args", n,
            sub->pcc_sub->args, sub->pcc_sub->arg_flags);

    /*
     * insert get_name after args have been setup, so that
     * a possible MMD call can inspect the passed arguments
     */
    if (get_name) {
        insert_ins(unit, ins, get_name);
        ins = get_name;
    }

    s0 = arg = sub->pcc_sub->sub;
    if (meth_call) {
        if (arg->set != 'P') {
            if ( !(arg->type == VTIDENTIFIER ||
                        arg->type == VTPASM ||
                        arg->type == VTREG))
                s0 = mk_const(interp, str_dup(arg->name), 'S');
        }

    }

    /*
     * if we have a tail call then
     * insert a tailcall opcode
     */
    if (tail_call) {
        insert_tail_call(interp, unit, ins, sub, meth_call, s0);
        return;
    }

    /*
     * handle return results
     */
    n = sub->pcc_sub->nret;
    ins = pcc_get_args(interp, unit, ins, "get_results", n,
            sub->pcc_sub->ret, sub->pcc_sub->ret_flags);
    /* insert the call */
    if (meth_call) {
        regs[0] = sub->pcc_sub->object;
        regs[1] = s0;
        arg = sub->pcc_sub->cc;
        if (arg) {
            regs[2] = arg;
            ins = insINS(interp, unit, ins, "callmethod" , regs, 3);
        }
        else {
            ins = insINS(interp, unit, ins, "callmethodcc" , regs, 2);
        }
    }
    else {
        regs[0] = sub->pcc_sub->sub;
        arg = sub->pcc_sub->cc;
        if (arg) {
            regs[1] = arg;
            ins = insINS(interp, unit, ins, "invoke" ,regs, 2);
        }
        else {
            ins = insINS(interp, unit, ins, "invokecc" ,regs, 1);
        }
    }
    /*
     * move the pcc_sub structure from the dummy call label to the
     * invoke statement
     */
    regs[0]->pcc_sub = sub->pcc_sub;
    sub->pcc_sub = NULL;
    ins->type |= ITPCCSUB;
    /*
     * locate return label, if there is one skip it
     */
    if (regs[0]->pcc_sub->label && ins->next->type == ITLABEL) {
        ins = ins->next;
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
