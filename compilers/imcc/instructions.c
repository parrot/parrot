/* $Id$ */

#include <stdlib.h>
#include <string.h>
#include <assert.h>
#define _PARSER
#include "imc.h"
#include "pbc.h"
#include "optimizer.h"

/*
 * instructions.c
 *
 * When generating the code, the instructions of the program
 * are stored in an array.
 *
 * After the register allocation is resolved, the instructions
 * array is flushed.
 *
 * These functions operate over this array and its contents.
 */


/* Global variables , forward def */

#if 0
static Instruction * last_ins;

int n_comp_units;
#endif

/* HEADERIZER HFILE: compilers/imcc/instructions.h */

/* HEADERIZER BEGIN: static */

static int e_file_close( PARROT_INTERP, void *param )
        __attribute__nonnull__(1);

static int e_file_emit( PARROT_INTERP,
    void *param,
    IMC_Unit *unit,
    NOTNULL(const Instruction *ins) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

static int e_file_open( SHIM_INTERP, NOTNULL(void *param) )
        __attribute__nonnull__(2);

/* HEADERIZER END: static */

const char types[] = "INPS";

Emitter emitters[2] = {
    {e_file_open,
     e_file_emit,
     (int (*)(Interp *, void *, IMC_Unit *))NULLfunc,
     (int (*)(Interp *, void *, IMC_Unit *))NULLfunc,
     e_file_close},

    {e_pbc_open,
     e_pbc_emit,
     e_pbc_new_sub,
     e_pbc_end_sub,
     e_pbc_close},
};

static int emitter;     /* XXX */


/* Creates a new instruction */

PARROT_MALLOC
Instruction *
_mk_instruction(NOTNULL(const char *op), NOTNULL(const char *fmt), int n,
        SymReg ** r, int flags)
{
    int i, reg_space;
    Instruction * ins;

    reg_space = 0;
    if (n > 1)
        reg_space = sizeof (SymReg *) * (n - 1);
    ins = (Instruction*)calloc(sizeof (Instruction) + reg_space, 1);
    if (ins == NULL) {
        fprintf(stderr, "Memory error at mk_instruction\n");
        abort();
    }

    ins->op = str_dup(op);
    ins->fmt = str_dup(fmt);
    ins->n_r = n;
    for (i = 0; i < n; i++)
        ins->r[i] = r[i];
    ins->flags = flags;
    ins->opnum = -1;

    return ins;
}


/*
 * Some instructions don't have a hint in op_info that they work
 * on all registers (e.g. saveall, restoreall) or on all registers
 * of a given type  (e.g. pushi, popi, cleari). These instructions
 * need special handling at various points in the code.
 */

static int r_special[5];
static int w_special[1+4*3];

void
imcc_init_tables(PARROT_INTERP)
{
    const char *reads[] = {
        "saveall"
    };
    const char *writes[] = {
        "restoreall",
        "cleari", "clearn", "clearp", "clears",
    };
    /* init opnums */
    if (!r_special[0]) {
        size_t i;
        for (i = 0; i < N_ELEMENTS(reads); i++) {
            const int n = interp->op_lib->op_code(reads[i], 1);
            assert(n);
            r_special[i] = n;
        }
        for (i = 0; i < N_ELEMENTS(writes); i++) {
            const int n = interp->op_lib->op_code(writes[i], 1);
            assert(n);
            w_special[i] = n;
        }
    }
}

/*
 * Returns TRUE if instruction ins reads from a register of type t
 */
int
ins_reads2(NOTNULL(const Instruction *ins), int t)
{
    const char *p;

    if (ins->opnum == r_special[0])
        return 1;
    p = strchr(types, t);
    if (p) {
        const size_t idx = p - types;
        size_t i;

        for (i = 1; i < N_ELEMENTS(r_special); i += 4)
            if (ins->opnum == r_special[i + idx])
                return 1;
    }
    return 0;
}

/*
 * Returns TRUE if instruction ins writes to a register of type t
 */
int
ins_writes2(NOTNULL(const Instruction *ins), int t)
{
    const char *p;

    if (ins->opnum == w_special[0])
        return 1;
    p = strchr(types, t);
    if (p) {
        const size_t idx = p - types;
        size_t i;

        for (i = 1; i < N_ELEMENTS(w_special); i += 4)
            if (ins->opnum == w_special[i + idx])
                return 1;
    }
    return 0;
}


/* next 2 functions are called very often, says gprof
 * they should be fast
 */
int
instruction_reads(NOTNULL(const Instruction *ins), NOTNULL(const SymReg *r))
{
    int f, i;

    if (ins->opnum == PARROT_OP_set_args_pc ||
            ins->opnum == PARROT_OP_set_returns_pc) {
        int i;
        for (i = 0; i < ins->n_r; i++)
            if (r ==ins->r[i] )
                return 1;
        return 0;
    }
    else if (ins->opnum == PARROT_OP_get_params_pc ||
            ins->opnum == PARROT_OP_get_results_pc) {
        return 0;
    }
    f = ins->flags;
    for (i = 0; i < ins->n_r; i++) {
        if (f & (1<<i)) {
            const SymReg * const ri = ins->r[i];
            if (ri == r)
                return 1;
            /* this additional test for _kc ops seems to slow
             * down instruction_reads by a huge amount compared to the
             * _writes below
             */
            if (ri->set == 'K') {
                const SymReg *key;
                for (key = ri->nextkey; key; key = key->nextkey)
                    if (key->reg && key->reg == r)
                        return 1;
            }
        }
    }
    /* a sub call reads the previous args */
    if (ins->type & ITPCCSUB) {
        int i;
        while (ins && ins->opnum != PARROT_OP_set_args_pc)
            ins = ins->prev;
        if (!ins)
            return 0;
        for (i = 0; i < ins->n_r; i++) {
            if (ins->r[i] == r)
                return 1;
        }
    }
    return 0;
}

int
instruction_writes(NOTNULL(const Instruction *ins), NOTNULL(const SymReg *r))
{
    const int f = ins->flags;
    int i;

    /*
     * a get_results opcode is before the actual sub call
     * but for the register allocator, the effect matters, thus
     * postpone the effect after the invoke
     */
    if (ins->opnum == PARROT_OP_get_results_pc) {
        int i;
        /* but only, if it isn't the get_results opcode of
         * an exception_handler, which doesn't have
         * a call next
         */
        if (ins->next && (ins->next->type & ITPCCSUB))
            return 0;
        for (i = 0; i < ins->n_r; i++) {
            if (ins->r[i] == r)
                return 1;
        }
        return 0;
    }
    else if (ins->type & ITPCCSUB) {
        int i;
        ins = ins->prev;
        /* can't used pcc_sub->ret due to bug #38406
         * it seems that all sub SymRegs are shared
         * and point to the most recemt pcc_sub
         * structure
         */
        while (ins && ins->opnum != PARROT_OP_get_results_pc)
            ins = ins->prev;
        if (!ins)
            return 0;
        for (i = 0; i < ins->n_r; i++) {
            if (ins->r[i] == r)
                return 1;
        }
        return 0;
    }

    if (ins->opnum == PARROT_OP_get_params_pc) {
        int i;
        for (i = 0; i < ins->n_r; i++) {
            if (ins->r[i] == r)
                return 1;
        }
        return 0;
    }
    else if (ins->opnum == PARROT_OP_set_args_pc ||
            ins->opnum == PARROT_OP_set_returns_pc) {
        return 0;
    }
    for (i = 0; i < ins->n_r; i++)
        if (f & (1<<(16+i)))
            if (ins->r[i] == r)
                return 1;

    return 0;
}

/*
 * Get the register number of an address which is a branch target
 */
int
get_branch_regno(NOTNULL(const Instruction *ins))
{
    int j;
    for (j = ins->opsize - 2;  j >= 0 && ins->r[j] ; --j)
        if (ins->type & (1<<j))
            return j;
    return -1;
}

/*
 * Get the register corresponding to an address which is a branch target
 */
SymReg *
get_branch_reg(NOTNULL(const Instruction *ins))
{
    const int r = get_branch_regno(ins);
    if (r >= 0)
        return ins->r[r];
    return NULL;
}

/* some useful instruction routines */

/*
 * Delete instruction ins. Also free it if needs_freeing is true.
 * The instruction following ins is returned.
 */
Instruction *
delete_ins(NOTNULL(struct _IMC_Unit *unit), NOTNULL(Instruction *ins), int needs_freeing)
{
    Instruction * const next = ins->next;
    Instruction * const prev = ins->prev;

    if (prev)
        prev->next = next;
    else
        unit->instructions = next;
    if (next)
        next->prev = prev;
    else
        unit->last_ins = prev;
    if (needs_freeing)
        free_ins(ins);
    return next;
}

/*
 * insert tmp after ins
 */

void
insert_ins(NOTNULL(struct _IMC_Unit *unit), NULLOK(Instruction *ins), NOTNULL(Instruction *tmp))
{
    if (!ins) {
        Instruction * const next = unit->instructions;

        unit->instructions = tmp;
        tmp->next = next;
        next->prev = tmp;
        tmp->line = next->line;
        if (!next)
            unit->last_ins = tmp;
    }
    else {
        Instruction * const next = ins->next;

        ins->next = tmp;
        tmp->prev = ins;
        tmp->next = next;
        if (next)
            next->prev = tmp;
        else
            unit->last_ins = tmp;
        if (!tmp->line)
            tmp->line = ins->line;
    }
}

/*
 * insert tmp before ins
 */
void
prepend_ins(NOTNULL(struct _IMC_Unit *unit), NULLOK(Instruction *ins), NOTNULL(Instruction *tmp))
{
    if (!ins) {
        Instruction * const next = unit->instructions;

        unit->instructions = tmp;
        tmp->next = next;
        next->prev = tmp;
        tmp->line = next->line;
    }
    else {
        Instruction * const prev = ins->prev;

        ins->prev = tmp;
        tmp->next = ins;
        tmp->prev = prev;
        if (prev)
            prev->next = tmp;
        if (!tmp->line)
            tmp->line = ins->line;
    }
}

/*
 * Substitute tmp for ins. Free ins if needs_freeing is true.
 */

void
subst_ins(NOTNULL(struct _IMC_Unit *unit), NOTNULL(Instruction *ins),
          NOTNULL(Instruction *tmp), int needs_freeing)
{
    Instruction * const prev = ins->prev;

    if (prev)
        prev->next = tmp;
    else
        unit->instructions = tmp;
    tmp->prev = prev;
    tmp->next = ins->next;
    if (ins->next)
        ins->next->prev = tmp;
    else
        unit->last_ins = tmp;
    if (!tmp->line)
        tmp->line = ins->line;
    if (needs_freeing)
        free_ins(ins);
}

/*
 * Move instruction ins from its current position to the position
 * following instruction to. Returns the instruction following the
 * initial position of ins.
 */
Instruction *
move_ins(NOTNULL(struct _IMC_Unit *unit), NOTNULL(Instruction *ins), NOTNULL(Instruction *to))
{
    Instruction * const next = delete_ins(unit, ins, 0);
    insert_ins(unit, to, ins);
    return next;
}


/* Emit a single instruction into the current unit buffer. */
Instruction *
emitb(PARROT_INTERP, NULLOK(struct _IMC_Unit *unit), NULLOK(Instruction *i))
{

    if (!unit || !i)
        return NULL;
    if (!unit->instructions)
        unit->last_ins = unit->instructions = i;
    else {
        unit->last_ins->next = i;
        i->prev = unit->last_ins;
        unit->last_ins = i;
    }
    i->line = IMCC_INFO(interp)->line - 1;         /* lexer is in next line already */
    return i;
}

/*
 * Free the Instruction structure ins.
 */
void
free_ins(NOTNULL(Instruction *ins))
{
    free(ins->fmt);
    free(ins->op);
    free(ins);
}

/*
 * Print details of instruction ins in file fd.
 */
int
ins_print(PARROT_INTERP, NOTNULL(FILE *fd), NOTNULL(const Instruction *ins))
{
    char regb[IMCC_MAX_FIX_REGS][256];      /* XXX */
    /* only long key constants can overflow */
    char *regstr[IMCC_MAX_FIX_REGS];
    int i;
    int len;

#if IMC_TRACE
    PIO_eprintf(NULL, "ins_print\n");
#endif

    if (!ins->r[0] || !strchr(ins->fmt, '%')) { /* comments, labels and such */
        return fprintf(fd, "%s", ins->fmt);
    }
    for (i = 0; i < ins->n_r; i++) {
        const SymReg *p = ins->r[i];
        if (!p)
            continue;
        if (p->type & VT_CONSTP)
            p = p->reg;
        if (p->color >= 0 && (p->type & VTREGISTER)) {
            sprintf(regb[i], "%c%d", p->set, (int)p->color);
            regstr[i] = regb[i];
        }
        else if (IMCC_INFO(interp)->allocated &&
                (IMCC_INFO(interp)->optimizer_level & OPT_J) &&
                p->set != 'K' &&
                p->color < 0 && (p->type & VTREGISTER)) {
                    sprintf(regb[i], "r%c%d", tolower((unsigned char)p->set), -1 - (int)p->color);
                    regstr[i] = regb[i];
        }
        else if (p->type & VTREGKEY) {
            const SymReg *k = p->nextkey;

            for (*regb[i] = '\0'; k; k = k->nextkey) {
                if (k->reg && k->reg->color >= 0)
                    sprintf(regb[i]+strlen(regb[i]), "%c%d",
                            k->reg->set, (int)k->reg->color);    /* XXX */
                else if (IMCC_INFO(interp)->allocated &&
                        (IMCC_INFO(interp)->optimizer_level & OPT_J) &&
                        k->reg &&
                        k->reg->color < 0)
                    sprintf(regb[i]+strlen(regb[i]), "r%c%d",
                            tolower((unsigned char)k->reg->set), -1 - (int)k->reg->color);
                else
                    strcat(regb[i], k->name);   /* XXX */
                if (k->nextkey)
                    strcat(regb[i], ";");
            }
            regstr[i] = regb[i];
        }
        else if (p->type == VTCONST && p->set == 'S' &&
                *p->name != '"' && *p->name != '\'' ) {
            /* unquoted string const */
            sprintf(regb[i], "\"%s\"", p->name);      /* XXX */
            regstr[i] = regb[i];
        }
        else
            regstr[i] = p->name;
    }

    switch (ins->opsize-1) {
        case -1:        /* labels */
        case 1:
            len = fprintf(fd, ins->fmt, regstr[0]);
            break;
        case 2:
            len = fprintf(fd, ins->fmt, regstr[0], regstr[1]);
            break;
        case 3:
            len = fprintf(fd, ins->fmt, regstr[0], regstr[1], regstr[2]);
            break;
        case 4:
            len = fprintf(fd, ins->fmt, regstr[0], regstr[1], regstr[2],
                    regstr[3]);
            break;
        case 5:
            len = fprintf(fd, ins->fmt, regstr[0], regstr[1], regstr[2],
                    regstr[3], regstr[4]);
            break;
        case 6:
            len = fprintf(fd, ins->fmt, regstr[0], regstr[1], regstr[2],
                    regstr[3], regstr[4], regstr[5]);
            break;
        default:
            fprintf(stderr, "unhandled: opsize (%d), op %s, fmt %s\n",
                    ins->opsize, ins->op, ins->fmt);
            exit(EXIT_FAILURE);
            break;
    }
    return len;
}

/* for debug */
static char *output;

static int
e_file_open(SHIM_INTERP, NOTNULL(void *param))
{
    char * const file = (char *) param;

    if (strcmp(file, "-"))
        freopen(file, "w", stdout);
    output = file;
    printf("# IMCC does produce b0rken PASM files\n");
    printf("# see http://guest@rt.perl.org/rt3/Ticket/Display.html?id=32392\n");
    return 1;
}

static int
e_file_close(PARROT_INTERP, SHIM(void *param))
{
    printf("\n\n");
    fclose(stdout);
    IMCC_info(interp, 1, "assembly module %s written.\n", output);
    return 0;
}

static int
e_file_emit(PARROT_INTERP, SHIM(void *param), SHIM(IMC_Unit *unit), NOTNULL(const Instruction *ins))
{
#if IMC_TRACE
    PIO_eprintf(NULL, "e_file_emit\n");
#endif
    if ((ins->type & ITLABEL) || ! *ins->op)
        ins_print(interp, stdout, ins);
    else {
        imcc_fprintf(interp, stdout, "\t%I ",ins);
    }
    printf("\n");
    return 0;
}

PARROT_API
int
emit_open(PARROT_INTERP, int type, NULLOK(void *param))
{
    emitter = type;
    IMCC_INFO(interp)->has_compile = 0;
    IMCC_INFO(interp)->dont_optimize = 0;
    return (emitters[emitter]).open(interp, param);
}

PARROT_API
int
emit_flush(PARROT_INTERP, NULLOK(void *param), NOTNULL(struct _IMC_Unit *unit))
{
    Instruction * ins;

    if (emitters[emitter].new_sub)
        (emitters[emitter]).new_sub(interp, param, unit);
    for (ins = unit->instructions; ins; ins = ins->next) {
        IMCC_debug(interp, DEBUG_IMC, "emit %I\n", ins);
        (emitters[emitter]).emit(interp, param, unit, ins);
    }
    if (emitters[emitter].end_sub)
        (emitters[emitter]).end_sub(interp, param, unit);
    return 0;
}

PARROT_API
int
emit_close(PARROT_INTERP, NULLOK(void *param))
{
    return (emitters[emitter]).close(interp, param);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


