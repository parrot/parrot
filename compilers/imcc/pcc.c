/*
 * pcc.c
 *
 * Parrot calling convention implementation.
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

    if ((r = _get_sym(&IMCC_INFO(interp)->cur_unit->hash, name)))
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

    if ((r = _get_sym(&IMCC_INFO(interp)->ghash, name)) && r->set == type)
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
        else if (arg_flags[i] & VT_MAYBE_FLAT) {
            flags |= PARROT_ARG_MAYBE_FLATTEN;
        }
        if (arg_flags[i] & VT_OPTIONAL) {
            flags |= PARROT_ARG_OPTIONAL;
        }
        else if (arg_flags[i] & VT_OPT_FLAG) {
            flags |= PARROT_ARG_OPT_FLAG;
        }
        if (arg_flags[i] & VT_NAMED) {
            flags |= PARROT_ARG_NAME;
        }
        /* add argument type bits */
        if (arg->type & VTCONST)
            flags |= PARROT_ARG_CONSTANT;
        /* TODO verify if const is allowed */
        switch (arg->set) {
            case 'I': break;
            case 'S': flags |= PARROT_ARG_STRING;   break;
            case 'N': flags |= PARROT_ARG_FLOATVAL; break;
            case 'K':
            case 'P': flags |= PARROT_ARG_PMC;      break;
        }
        sprintf(s, "0x%x", flags);
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
        SymReg *self = get_sym(interp, "self");
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
    if (unit->last_ins->type & (ITPCCSUB) &&
            unit->last_ins->n_r == 1 &&
            ( sub = unit->last_ins->r[0] ) &&
            sub->pcc_sub &&
            !sub->pcc_sub->object && /* s. src/inter_call.c:119 */
            (sub->pcc_sub->flags & isTAIL_CALL))
        return;
    if (unit->last_ins->type != (ITPCCSUB|ITLABEL) &&
            strcmp(unit->last_ins->op, "ret") &&
            strcmp(unit->last_ins->op, "exit") &&
            strcmp(unit->last_ins->op, "end") &&
            strcmp(unit->last_ins->op, "branch") &&
            /* was adding rets multiple times... */
            strcmp(unit->last_ins->op, "returncc")
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

struct move_info_t {
    IMC_Unit *unit;
    Instruction *ins;
    int n;
    SymReg **dest;
    SymReg **src;
};

static int
pcc_reg_mov(Interp *interpreter, unsigned char d, unsigned char s,
        void *vinfo)
{
    struct move_info_t *info = vinfo;
    SymReg *regs[2], *src, *dest;
    static SymReg *temps[4];
    char types[] = "INSP";
    int t;

    src = dest = NULL;
    if (d == 255) {
        /* handle temp use/create temp of src type */
        assert(s != 255);
        assert(s < 2 * info->n);
        src = s < info->n ? info->dest[(int)s] : info->src[(int)s - info->n];
        for (t = 0; t < 4; ++t) {
            if (types[t] == src->set) {
                if (temps[t])
                    dest = temps[t];
                else {
                    dest = temps[t] = mk_temp_reg(interpreter, src->set);
                }
                break;
            }

        }
    }
    else if (s == 255) {
        /* handle temp use/create temp of dest type */
        assert(d < 2 * info->n);
        dest = d < info->n ? info->dest[(int)d] : info->src[(int)d - info->n];
        for (t = 0; t < 4; ++t) {
            if (types[t] == dest->set) {
                if (temps[t])
                    src = temps[t];
                else {
                    src = temps[t] = mk_temp_reg(interpreter, dest->set);
                }
                break;
            }

        }
    }
    if (!dest)
        dest = d < info->n ? info->dest[(int)d] : info->src[(int)d - info->n];
    if (!src)
        src = s < info->n ? info->dest[(int)s] : info->src[(int)s - info->n];
    regs[0] = dest;
    regs[1] = src;
    info->ins = insINS(interpreter, info->unit, info->ins, "set", regs, 2);
    return 1;
}

static Instruction *
move_regs(Parrot_Interp interp, IMC_Unit * unit,
        Instruction *ins, int n, SymReg **dest, SymReg **src)
{
    unsigned char *move_list;
    int i, j;
    SymReg *ri, *rj;
    struct move_info_t move_info;

    if (!n)
        return ins;


    move_list = mem_sys_allocate(2 * n);
    move_info.unit = unit;
    move_info.ins  = ins;
    move_info.n    = n;
    move_info.dest = dest;
    move_info.src  = src;

    memset(move_list, -1, 2 * n);
    for (i = 0; i < 2 * n; ++i) {
        ri = i < n ? dest[i] : src[i - n];
        for (j = 0; j < i; ++j) {
            rj = j < n ? dest[j] : src[j - n];
            if (ri == rj) {
                assert(j < 255);
                move_list[i] = j;
                goto done;
            }
        }
        assert(i < 255);
        move_list[i] = i;
done:
        ;
    }
    Parrot_register_move(interp, n, move_list, move_list + n, 255,
        pcc_reg_mov, NULL, &move_info);

    mem_sys_free(move_list);
    return move_info.ins;
}

/*
 * convert a recursive tailcall into a loop
 */

static int
recursive_tail_call(Parrot_Interp interp, IMC_Unit * unit,
        Instruction *ins, SymReg *sub)
{
    SymReg *called_sub, *this_sub, *label;
    SymReg *regs[2];
    Instruction *get_params, *tmp_ins;
    char *buf;

    if (!(unit->instructions->type & ITLABEL))
        return 0;
    this_sub = unit->instructions->r[0];
    if (!this_sub)
        return 0;
    called_sub = sub->pcc_sub->sub;
    if (strcmp(this_sub->name, called_sub->name))
        return 0;
    if (sub->pcc_sub->nargs != this_sub->pcc_sub->nargs)
        return 0;
    /* TODO check if we have only positional args
    */

    get_params = unit->instructions->next;
    if (get_params->opnum != PARROT_OP_get_params_pc)
        return 0;
    buf = malloc(strlen(this_sub->name) + 3);
    sprintf(buf, "%s@0", this_sub->name);
    if ( (label = find_sym(interp, buf)) == NULL) {
        label = mk_local_label(interp, str_dup(buf));
        tmp_ins = INS_LABEL(interp, unit, label, 0);
        insert_ins(unit, get_params, tmp_ins);
    }
    free(buf);

    ins = move_regs(interp, unit, ins, sub->pcc_sub->nargs,
            this_sub->pcc_sub->args, sub->pcc_sub->args);

    regs[0] = label;
    insINS(interp, unit, ins, "branch", regs, 1);
    return 1;
}

static void
insert_tail_call(Parrot_Interp interp, IMC_Unit * unit,
        Instruction *ins, SymReg *sub, SymReg *meth)
{
    SymReg *regs[2];


    if (meth) {
        regs[0] = sub->pcc_sub->object;
        regs[1] = meth;
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
    SymReg *meth = NULL;
    Instruction *get_name;

    sub = ins->r[0];

    if (ins->type & ITRESULT) {
        n = sub->pcc_sub->nret;
        ins = pcc_get_args(interp, unit, ins, "get_results", n,
                sub->pcc_sub->ret, sub->pcc_sub->ret_flags);
        return;
    }
    tail_call = (sub->pcc_sub->flags & isTAIL_CALL);
    if (tail_call && IMCC_INFO(interp)->optimizer_level & OPT_SUB) {
        if (recursive_tail_call(interp, unit, ins, sub))
            return;
    }

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
        if (!meth_call && (the_sub->type & VTADDRESS)) {
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
            the_sub->type &= ~VTADDRESS;
            the_sub->type |= VTCONST;   /* preserve VT_ENCODED */
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

    arg = sub->pcc_sub->sub;
    if (meth_call) {
        meth = arg;
        if (arg->set != 'P') {
            if ( !(arg->type == VTIDENTIFIER ||
                        arg->type == VTPASM ||
                        arg->type == VTREG))
                meth = mk_const(interp, str_dup(arg->name), 'S');
        }

    }

    /*
     * if we have a tail call then
     * insert a tailcall opcode
     */
    if (tail_call) {
        insert_tail_call(interp, unit, ins, sub, meth);
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
        regs[1] = meth;
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
    ins->type |= ITPCCSUB;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
