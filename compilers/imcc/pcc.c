/*
 * Copyright (C) 2003-2010, Parrot Foundation.
 * $Id$
 */

/*

=head1 NAME

compilers/imcc/pcc.c

=head1 DESCRIPTION

Parrot calling convention implementation.

see: docs/pdds/pdd03_calling_conventions.pod

PCC Implementation by Leopold Toetsch

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "parser.h"

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void insert_tail_call(PARROT_INTERP,
    ARGIN(IMC_Unit *unit),
    ARGMOD(Instruction *ins),
    ARGMOD(SymReg *sub),
    ARGIN_NULLOK(SymReg *meth))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*ins)
        FUNC_MODIFIES(*sub);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction * insINS(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(Instruction *ins),
    ARGIN(const char *name),
    ARGIN(SymReg **regs),
    int n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Instruction * move_regs(PARROT_INTERP,
    ARGIN(IMC_Unit *unit),
    ARGIN(Instruction *ins),
    size_t n,
    ARGIN(SymReg **dest),
    ARGIN(SymReg **src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction* pcc_get_args(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(Instruction *ins),
    ARGIN(const char *op_name),
    int n,
    ARGIN_NULLOK(SymReg * const *args),
    ARGIN_NULLOK(const int *arg_flags))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit);

static int pcc_reg_mov(PARROT_INTERP,
    unsigned char d,
    unsigned char s,
    ARGMOD(void *vinfo))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*vinfo);

static int recursive_tail_call(PARROT_INTERP,
    ARGIN(IMC_Unit *unit),
    ARGIN(Instruction *ins),
    ARGIN(SymReg *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void unshift_self(PARROT_INTERP,
    ARGIN(SymReg *sub),
    ARGIN(SymReg *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_insert_tail_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_insINS __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(regs))
#define ASSERT_ARGS_move_regs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_pcc_get_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(op_name))
#define ASSERT_ARGS_pcc_reg_mov __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(vinfo))
#define ASSERT_ARGS_recursive_tail_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_unshift_self __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub) \
    , PARROT_ASSERT_ARG(obj))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static Instruction * insINS(PARROT_INTERP, IMC_Unit *unit, Instruction
*ins, const char *name, SymReg **regs, int n)>

Utility instruction routine. Creates and inserts an instruction
into the current block in one call.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction *
insINS(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(Instruction *ins),
        ARGIN(const char *name), ARGIN(SymReg **regs), int n)
{
    ASSERT_ARGS(insINS)
    /* INS can return NULL, but insert_ins() cannot take one */
    Instruction * const tmp = INS(interp, unit, name, NULL, regs, n, 0, 0);
    if (tmp)
        insert_ins(unit, ins, tmp);
    return tmp;
}

/*

=item C<SymReg* get_pasm_reg(PARROT_INTERP, const char *name)>

get or create the SymReg

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg*
get_pasm_reg(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(get_pasm_reg)
    SymReg * const r = _get_sym(&IMCC_INFO(interp)->cur_unit->hash, name);

    if (r)
        return r;

    return mk_pasm_reg(interp, name);
}

/*

=item C<SymReg* get_const(PARROT_INTERP, const char *name, int type)>

get or create a constant

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg*
get_const(PARROT_INTERP, ARGIN(const char *name), int type)
{
    ASSERT_ARGS(get_const)
    SymReg * const r = _get_sym(&IMCC_INFO(interp)->ghash, name);

    if (r && r->set == type)
        return r;

    return mk_const(interp, name, type);
}

/*

=item C<static Instruction* pcc_get_args(PARROT_INTERP, IMC_Unit *unit,
Instruction *ins, const char *op_name, int n, SymReg * const *args, const int
*arg_flags)>

set arguments or return values
get params or results
used by expand_pcc_sub_call and expand_pcc_sub

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction*
pcc_get_args(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(Instruction *ins),
        ARGIN(const char *op_name), int n,
        ARGIN_NULLOK(SymReg * const *args), ARGIN_NULLOK(const int *arg_flags))
{
    ASSERT_ARGS(pcc_get_args)
    /* Notes:
     * The created string is in the format "\"(0x0010,0x0220,0x0010)\"".
     * flags always has exactly 4 hex digits.
     * The hex number at the end of the list has no "," but we can safely
     * ignore this.
     */
    static const char pref[] = {'"', '('};
    static const char item[] = {'0', 'x', 'f', 'f', 'f', 'f', ','};
    /* The list suffix includes the '\0' terminator */
    static const char subf[] = {')', '"', '\0'};
    static const unsigned int lenpref = sizeof pref;
    static const unsigned int lenitem = sizeof item;
    static const unsigned int lensubf = sizeof subf;
    int i, flags;
    char s[16];

    /* Avoid allocations on frequent number of params.
     * Arbitrary value, some fine tuning may be good.
     */
    #define PCC_GET_ARGS_LIMIT 15
    SymReg *regcache[PCC_GET_ARGS_LIMIT + 1];
    char bufcache[sizeof (pref) + sizeof (item) * PCC_GET_ARGS_LIMIT + sizeof (subf)];

    SymReg ** const regs  = n < PCC_GET_ARGS_LIMIT
                                ? regcache
                                : mem_gc_allocate_n_zeroed_typed(interp, n + 1, SymReg *);

    unsigned int  bufpos  = 0;
    unsigned int  bufsize = lenpref + lenitem * n + lensubf;
    char         *buf     = n < PCC_GET_ARGS_LIMIT
                                ? bufcache
                                : mem_gc_allocate_n_typed(interp, bufsize, char);

    memcpy(buf, pref, lenpref);
    bufpos += lenpref;
    for (i = 0; i < n; i++) {
        SymReg *arg = args[i];

        if (arg->type & VT_CONSTP)
            arg = arg->reg;

        regs[i + 1] = arg;
        flags       = 0;

        if (arg_flags[i] & VT_CALL_SIG) {
            if ((n > 1 || i != 0) && !(n == 2 && strcmp(args[0]->name, "self") == 0))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERNAL_PANIC,
                    ":call_sig must be the first and only parameter besides self");
            if (arg_flags[i] & (VT_FLAT | VT_OPTIONAL | VT_OPT_FLAG | VT_NAMED))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERNAL_PANIC,
                    ":call_sig cannot be combined with any other flags");
            if (arg->set != 'P')
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERNAL_PANIC,
                    ":call_sig must be a PMC");
            flags |= PARROT_ARG_CALL_SIG;
            flags |= PARROT_ARG_PMC;
        }
        else {
            if (arg_flags[i] & VT_FLAT)
                flags |= PARROT_ARG_FLATTEN;

            if (arg_flags[i] & VT_OPTIONAL)
                flags |= PARROT_ARG_OPTIONAL;
            else if (arg_flags[i] & VT_OPT_FLAG)
                flags |= PARROT_ARG_OPT_FLAG;

            if (arg_flags[i] & VT_NAMED)
                flags |= PARROT_ARG_NAME;

            /* add argument type bits */
            if (arg->type & VTCONST)
                flags |= PARROT_ARG_CONSTANT;

            /* TODO verify if const is allowed */
            switch (arg->set) {
              case 'I':
                break;
              case 'S':
                flags |= PARROT_ARG_STRING;
                break;
              case 'N':
                flags |= PARROT_ARG_FLOATVAL;
                break;
              case 'K':
              case 'P':
                flags |= PARROT_ARG_PMC;
                break;
              default :
                break;
            }
        }

        snprintf(s, sizeof (s), "0x%.4x,", flags);
        if (bufpos+lenitem >= bufsize)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERNAL_PANIC,
                    "arg string is longer than allocated buffer");
        memcpy(buf+bufpos, s, lenitem);
        bufpos += lenitem;
    }

    /* Backtrack over the ending comma if this is a non-empty list. */
    if (bufpos != lenpref)
        bufpos--;
    memcpy(buf+bufpos, subf, lensubf);

    regs[0] = mk_const(interp, buf, 'S');
    ins     = insINS(interp, unit, ins, op_name, regs, n + 1);

    if (n >= PCC_GET_ARGS_LIMIT) {
        mem_sys_free(regs);
        mem_sys_free(buf);
    }
    return ins;
    #undef PCC_GET_ARGS_LIMIT
}

/*

=item C<static void unshift_self(PARROT_INTERP, SymReg *sub, SymReg *obj)>

prepend the object to args or self to params

=cut

*/

static void
unshift_self(PARROT_INTERP, ARGIN(SymReg *sub), ARGIN(SymReg *obj))
{
    ASSERT_ARGS(unshift_self)
    struct pcc_sub_t * const pcc_sub = sub->pcc_sub;
    const int                n       = pcc_sub->nargs;
    int                      i;

    pcc_sub->args       = mem_gc_realloc_n_typed(interp, pcc_sub->args,      n + 1, SymReg *);
    pcc_sub->arg_flags  = mem_gc_realloc_n_typed(interp, pcc_sub->arg_flags, n + 1, int);

    for (i = n; i; --i) {
        pcc_sub->args[i]      = pcc_sub->args[i - 1];
        pcc_sub->arg_flags[i] = pcc_sub->arg_flags[i - 1];
    }

    pcc_sub->args[0]      = obj;
    pcc_sub->arg_flags[0] = 0;
    pcc_sub->nargs++;
}

/*

=item C<void expand_pcc_sub(PARROT_INTERP, IMC_Unit *unit, Instruction *ins)>

Expand a PCC (Parrot Calling Convention) subroutine
by generating the appropriate prologue and epilogue
for parameter passing/returning.

=cut

*/

void
expand_pcc_sub(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(Instruction *ins))
{
    ASSERT_ARGS(expand_pcc_sub)
    int          nargs;
    SymReg      *sub = ins->symregs[0];
    SymReg      *regs[2];

    /* if this sub is a method, unshift 'self' as first param */
    if ((unit->type & IMC_HAS_SELF)
    ||  (sub->pcc_sub->pragma & (P_METHOD | P_VTABLE))) {
        SymReg *self = get_sym(interp, "self");
        if (!self) {
            self       = mk_symreg(interp, "self", 'P');
            self->type = VTIDENTIFIER;
        }

        unshift_self(interp, sub, self);
    }

    /* Don't generate any parameter checking code if there
     * are no named arguments.  */
    nargs = sub->pcc_sub->nargs;

    if (nargs)
        ins = pcc_get_args(interp, unit, ins, "get_params", nargs,
                sub->pcc_sub->args, sub->pcc_sub->arg_flags);

    /* check if there is a return */
    if (unit->last_ins->type          & (ITPCCSUB)
    &&  unit->last_ins->symreg_count == 1
    && (sub = unit->last_ins->symregs[0])
    &&  sub->pcc_sub
    && !sub->pcc_sub->object
       /* s. src/inter_call.c:119 */
    && sub->pcc_sub->tailcall)
        return;

    if (unit->last_ins->type != (ITPCCSUB|ITLABEL)
    && STRNEQ(unit->last_ins->opname, "ret")
    && STRNEQ(unit->last_ins->opname, "exit")
    && STRNEQ(unit->last_ins->opname, "end")
    && STRNEQ(unit->last_ins->opname, "branch")
       /* was adding rets multiple times... */
    && STRNEQ(unit->last_ins->opname, "returncc")) {
        Instruction *tmp;

        /* check to make sure the sub is ok before we try to use it */
        if (!sub)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "NULL sub detected");

        if (!sub->pcc_sub)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "NULL sub->pcc_sub detected");

        if (sub->pcc_sub->pragma & P_MAIN)
            tmp = INS(interp, unit, "end", NULL, regs, 0, 0, 0);
        else {
            Instruction *unused_ins = pcc_get_args(interp, unit, unit->last_ins,
                    "set_returns", 0, NULL, NULL);
            UNUSED(unused_ins);
            tmp = INS(interp, unit, "returncc", NULL, regs, 0, 0, 0);
        }

        IMCC_debug(interp, DEBUG_IMC, "add sub ret - %d\n", tmp);
        insert_ins(unit, unit->last_ins, tmp);
    }
}

/*

=item C<void expand_pcc_sub_ret(PARROT_INTERP, IMC_Unit *unit, Instruction
*ins)>

Expand a PCC sub return directive into its PASM instructions

=cut

*/

void
expand_pcc_sub_ret(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(Instruction *ins))
{
    ASSERT_ARGS(expand_pcc_sub_ret)
    const int is_yield = ins->type & ITPCCYIELD;
    SymReg * const sub = ins->symregs[0];
    const int n        = sub->pcc_sub->nret;

    /* TODO implement return conventions */
    ins = pcc_get_args(interp, unit, ins, "set_returns", n,
                       sub->pcc_sub->ret, sub->pcc_sub->ret_flags);

    /* we have a pcc_begin_yield */
    if (is_yield) {
        SymReg *regs[2];
        ins        = insINS(interp, unit, ins, "yield", regs, 0);
        ins->type |= ITPCCYIELD;
    }
    else {
        SymReg *regs[2];
        /* insert return invoke */
        ins        = insINS(interp, unit, ins, "returncc", regs, 0);
        ins->type |= ITPCCRET;
    }
}

typedef struct move_info_t {
    IMC_Unit    *unit;
    NOTNULL(Instruction *ins);
    int          n;
    SymReg      **dest;
    SymReg      **src;
} move_info_t;

/*

=item C<static int pcc_reg_mov(PARROT_INTERP, unsigned char d, unsigned char s,
void *vinfo)>

Callback for C<Parrot_register_move>. Inserts move instructions in stead of
actually moving the registers.

=cut

*/

static int
pcc_reg_mov(PARROT_INTERP, unsigned char d, unsigned char s, ARGMOD(void *vinfo))
{
    ASSERT_ARGS(pcc_reg_mov)
    static const char types[] = "INSP";
    /* XXX non-reentrant */
    static SymReg    *temps[4];
    move_info_t      *info    = (move_info_t *)vinfo;
    SymReg           *src     = NULL;
    SymReg           *dest    = NULL;
    SymReg           *regs[3];

    if (d == 255) {
        int t;

        /* handle temp use/create temp of src type */
        PARROT_ASSERT(s != 255);
        PARROT_ASSERT(s < 2 * info->n);

        src = s < info->n ? info->dest[(int)s] : info->src[(int)s - info->n];

        for (t = 0; t < 4; ++t) {
            if (types[t] == src->set) {
                if (temps[t])
                    dest = temps[t];
                else {
                    dest = temps[t] = mk_temp_reg(interp, src->set);
                }
                break;
            }

        }
    }
    else if (s == 255) {
        int t;
        /* handle temp use/create temp of dest type */
        PARROT_ASSERT(d < 2 * info->n);

        dest = d < info->n ? info->dest[(int)d] : info->src[(int)d - info->n];

        for (t = 0; t < 4; ++t) {
            if (types[t] == dest->set) {
                if (!temps[t])
                    temps[t] = mk_temp_reg(interp, dest->set);
                src = temps[t];
                break;
            }
        }
    }

    if (!dest)
        dest = d < info->n ? info->dest[(int)d] : info->src[(int)d - info->n];

    if (!src)
        src = s < info->n ? info->dest[(int)s] : info->src[(int)s - info->n];

    regs[0]   = dest;
    regs[1]   = src;
    info->ins = insINS(interp, info->unit, info->ins, "set", regs, 2);

    return 1;
}

/*

=item C<static Instruction * move_regs(PARROT_INTERP, IMC_Unit *unit,
Instruction *ins, size_t n, SymReg **dest, SymReg **src)>

Insert instructions for moving C<n> registers from C<src> to C<dest>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static Instruction *
move_regs(PARROT_INTERP, ARGIN(IMC_Unit *unit), ARGIN(Instruction *ins),
        size_t n, ARGIN(SymReg **dest), ARGIN(SymReg **src))
{
    ASSERT_ARGS(move_regs)
    unsigned char *move_list;
    move_info_t    move_info;
    unsigned int   i;

    if (!n)
        return ins;

    move_list      = (unsigned char *)mem_sys_allocate(2 * n);
    move_info.unit = unit;
    move_info.ins  = ins;
    move_info.n    = n;
    move_info.dest = dest;
    move_info.src  = src;

    memset(move_list, -1, 2 * n);

    for (i = 0; i < 2 * n; ++i) {
        const SymReg * const ri = i < n ? dest[i] : src[i - n];
        unsigned int         j;

        for (j = 0; j < i; ++j) {
            const SymReg * const rj = j < n ? dest[j] : src[j - n];
            if (ri == rj) {
                PARROT_ASSERT(j < 255);
                move_list[i] = (unsigned char)j;
                goto done;
            }
        }
        PARROT_ASSERT(i < 255);
        move_list[i] = (unsigned char)i;
done:
        ;
    }

    Parrot_register_move(interp, n, move_list, move_list + n, 255,
        pcc_reg_mov, NULL, &move_info);

    mem_sys_free(move_list);
    return move_info.ins;
}

/*

=item C<static int recursive_tail_call(PARROT_INTERP, IMC_Unit *unit,
Instruction *ins, SymReg *sub)>

convert a recursive tailcall into a loop

=cut

*/

static int
recursive_tail_call(PARROT_INTERP, ARGIN(IMC_Unit *unit),
        ARGIN(Instruction *ins), ARGIN(SymReg *sub))
{
    ASSERT_ARGS(recursive_tail_call)
    SymReg *called_sub, *this_sub, *label;
    SymReg *regs[2];
    Instruction *get_params, *tmp_ins, *unused_ins;
    char *buf;

    if (!(unit->instructions->type & ITLABEL))
        return 0;

    this_sub = unit->instructions->symregs[0];

    if (!this_sub)
        return 0;

    called_sub = sub->pcc_sub->sub;

    if (STRNEQ(this_sub->name, called_sub->name))
        return 0;

    if (sub->pcc_sub->nargs != this_sub->pcc_sub->nargs)
        return 0;

    /* TODO check if we have only positional args */

    get_params = unit->instructions->next;

    if (get_params->opnum != PARROT_OP_get_params_pc)
        return 0;

    buf = (char *)malloc(strlen(this_sub->name) + 3);
    sprintf(buf, "%s@0", this_sub->name);

    if (!(label = find_sym(interp, buf))) {
        label   = mk_local_label(interp, buf);
        tmp_ins = INS_LABEL(interp, unit, label, 0);
        insert_ins(unit, get_params, tmp_ins);
    }

    free(buf);

    ins = move_regs(interp, unit, ins, sub->pcc_sub->nargs,
            this_sub->pcc_sub->args, sub->pcc_sub->args);

    regs[0]    = label;
    unused_ins = insINS(interp, unit, ins, "branch", regs, 1);
    UNUSED(unused_ins);

    return 1;
}

/*

=item C<static void insert_tail_call(PARROT_INTERP, IMC_Unit *unit, Instruction
*ins, SymReg *sub, SymReg *meth)>

Creates and inserts an appropriate tailcall instruction for either a sub call
or a method call.

=cut

*/

static void
insert_tail_call(PARROT_INTERP, ARGIN(IMC_Unit *unit), ARGMOD(Instruction *ins),
        ARGMOD(SymReg *sub), ARGIN_NULLOK(SymReg *meth))
{
    ASSERT_ARGS(insert_tail_call)
    SymReg *regs[3];

    if (meth) {
        regs[0] = sub->pcc_sub->object;
        regs[1] = meth;
        ins     = insINS(interp, unit, ins, "tailcallmethod", regs, 2);
    }
    else {
        regs[0] = sub->pcc_sub->sub;
        ins     = insINS(interp, unit, ins, "tailcall", regs, 1);
    }

    regs[0]->pcc_sub  = sub->pcc_sub;
    sub->pcc_sub      = NULL;
    ins->type        |= ITPCCSUB;
}

/*

=item C<void expand_pcc_sub_call(PARROT_INTERP, IMC_Unit *unit, Instruction
*ins)>

Expand a PCC subroutine call (IMC) into its PASM instructions
This is the nuts and bolts of pdd03 routine call style

=cut

*/

void
expand_pcc_sub_call(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGMOD(Instruction *ins))
{
    ASSERT_ARGS(expand_pcc_sub_call)
    SymReg *arg, *reg, *regs[3];
    int          n;
    int          tail_call;
    int          meth_call = 0;
    SymReg      *meth      = NULL;
    Instruction *get_name;

    SymReg * const sub = ins->symregs[0];

    PARROT_ASSERT(sub);
    PARROT_ASSERT(sub->pcc_sub);

    if (ins->type & ITRESULT) {
        const int n = sub->pcc_sub->nret;
        ins         = pcc_get_args(interp, unit, ins, "get_results", n,
                        sub->pcc_sub->ret, sub->pcc_sub->ret_flags);
        return;
    }

    tail_call = sub->pcc_sub->tailcall;

    if (tail_call && IMCC_INFO(interp)->optimizer_level & OPT_SUB)
        if (recursive_tail_call(interp, unit, ins, sub))
            return;

    if (sub->pcc_sub->object)
        meth_call = 1;

    /*
     * See if we need to create a temporary sub object for the short
     * function call syntax _f()
     */
    get_name = NULL;

    if (ins->type & ITCALL) {
        SymReg * const the_sub = sub->pcc_sub->sub;
        /* If this condition is true the generator must haven't be called,
         * but check it as a last resort.
         * See also TT #737 */
        if (the_sub == NULL)
            IMCC_fatal(interp, 1, "expand_pcc_sub_call: no such sub");

        if (!meth_call && (the_sub->type & VTADDRESS)) {
            /* sub->pcc_sub->sub is an actual subroutine name, not a variable */
            reg = mk_temp_reg(interp, 'P');
            add_pcc_sub(sub, reg);

            /* insert set_p_pc with the sub as constant */
            the_sub->set    = 'p';
            the_sub->usage |= U_FIXUP;
            the_sub->type  &= ~VTADDRESS;
            the_sub->type  |= VTCONST;   /* preserve VT_ENCODED */
            regs[0]         = reg;
            regs[1]         = the_sub;

            /*
             * set_p_pc gets replaced in imcc/pbc.c, if the
             * function can't located in the current namespace
             */
            get_name   = INS(interp, unit, "set_p_pc", "", regs, 2, 0, 0);
            ins->type &= ~ITCALL;
        }
    }

    if (sub->pcc_sub->object)
        unshift_self(interp, sub, sub->pcc_sub->object);

    /* insert arguments */
    n   = sub->pcc_sub->nargs;
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
            if (!(arg->type == VTIDENTIFIER
            ||    arg->type == VTPASM
            ||    arg->type == VTREG)) {
                if (arg->type & VT_ENCODED) {
                    meth = mk_const(interp, arg->name, 'U');
                }
                else {
                    meth = mk_const(interp, arg->name, 'S');
                }
            }
        }
    }

    /* if we have a tail call then insert a tailcall opcode */
    if (tail_call) {
        insert_tail_call(interp, unit, ins, sub, meth);
        return;
    }

    /* insert the call */
    if (meth_call) {
        regs[0] = sub->pcc_sub->object;
        regs[1] = meth;
        arg     = sub->pcc_sub->cc;

        if (arg) {
            regs[2] = arg;
            ins     = insINS(interp, unit, ins, "callmethod" , regs, 3);
        }
        else {
            ins = insINS(interp, unit, ins, "callmethodcc" , regs, 2);
        }
    }
    else {
        regs[0] = sub->pcc_sub->sub;
        arg     = sub->pcc_sub->cc;

        if (arg) {
            regs[1] = arg;
            ins     = insINS(interp, unit, ins, "invoke" , regs, 2);
        }
        else {
            ins = insINS(interp, unit, ins, "invokecc" , regs, 1);
        }
    }

    ins->type |= ITPCCSUB;

    /* handle return results */
    n   = sub->pcc_sub->nret;
    ins = pcc_get_args(interp, unit, ins, "get_results", n,
            sub->pcc_sub->ret, sub->pcc_sub->ret_flags);
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
