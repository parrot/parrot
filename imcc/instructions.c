
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


static int e_file_open(Interp *, void *);
static int e_file_close(Interp *, void *);
static int e_file_emit(Interp *, void *param, IMC_Unit *, Instruction *);

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

Instruction *
_mk_instruction(const char *op, const char * fmt,
	SymReg ** r, int flags)
{
    int i;
    Instruction * ins = calloc(1, sizeof(Instruction));
    if (ins == NULL) {
        fprintf(stderr, "Memory error at mk_instruction\n");
	abort();
    }

    ins->op = str_dup(op);
    ins->fmt = str_dup(fmt);
    for (i = 0; i < IMCC_MAX_REGS; i++)
        if (r)
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
imcc_init_tables(Interp * interpreter)
{
    size_t i;
    const char *reads[] = {
        "saveall",
        "pushi", "pushn", "pushp", "pushs"
    };
    const char *writes[] = {
        "restoreall",
        "popi", "popn", "popp", "pops",
        "cleari", "clearn", "clearp", "clears",
    };
    /* init opnums */
    if (!r_special[0]) {
        for (i = 0; i < sizeof(reads)/sizeof(reads[0]); i++) {
            int n = interpreter->op_lib->op_code(reads[i], 1);
            assert(n);
            r_special[i] = n;
        }
        for (i = 0; i < sizeof(writes)/sizeof(writes[0]); i++) {
            int n = interpreter->op_lib->op_code(writes[i], 1);
            assert(n);
            w_special[i] = n;
        }
    }
}

/* 
 * Returns TRUE if instruction ins reads from a register of type t 
 */
int
ins_reads2(Instruction *ins, int t)
{
    size_t i, idx;
    const char types[] = "INPS";
    char *p;

    if (ins->opnum == r_special[0])
        return 1;
    p = strchr(types, t);
    if (!p)
        return 0;
    idx = p - types;
    for (i = 1; i < sizeof(r_special)/sizeof(int); i += 4) {
        if (ins->opnum == r_special[i + idx])
            return 1;
    }
    return 0;
}

/* 
 * Returns TRUE if instruction ins writes to a register of type t 
 */
int
ins_writes2(Instruction *ins, int t)
{
    size_t i, idx;
    const char types[] = "INPS";
    char *p;

    if (ins->opnum == w_special[0])
        return 1;
    p = strchr(types, t);
    if (!p)
        return 0;
    idx = p - types;
    for (i = 1; i < sizeof(w_special)/sizeof(int); i += 4) {
        if (ins->opnum == w_special[i + idx])
            return 1;
    }
    return 0;
}


/* next 2 functions are called very often, says gprof
 * they should be fast
 */
#ifdef HAS_INLINE
inline
#endif
int
instruction_reads(Instruction* ins, SymReg* r) {
    int f, i;
    SymReg *key;
    SymReg *ri;

    f = ins->flags;
    for (i = 0; (ri = ins->r[i]) && i < IMCC_MAX_REGS; i++) {
	if (f & (1<<i)) {
            if (ri == r)
                return 1;
            /* this additional test for _kc ops seems to slow
             * down instruction_reads by a huge amount compared to the
             * _writes below
             */
            if (ri->set == 'K') {
                for (key = ri->nextkey; key; key = key->nextkey)
                    if (key->reg && key->reg == r)
                        return 1;
            }
        }
    }
    if (ins->type & ITPCCSUB)
        return pcc_sub_reads(ins, r);

    return 0;
}

#ifdef HAS_INLINE
inline
#endif
int
instruction_writes(Instruction* ins, SymReg* r) {
    int f, i;

    f = ins->flags;

    for (i = 0; ins->r[i] && i < IMCC_MAX_REGS; i++)
	if (f & (1<<(16+i))) {
            if (ins->r[i] == r)
                return 1;
        }

    if (ins->type & ITPCCSUB)
        return pcc_sub_writes(ins, r);
    return 0;
}

/* 
 * Get the register number of an address which is a branch target
 */
int
get_branch_regno(Instruction * ins)
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
get_branch_reg(Instruction * ins)
{
    int r = get_branch_regno(ins);
    if (r >= 0)
        return ins->r[r];
    return 0;
}

/* some useful instruction routines */

/*
 * Delete instruction ins. Also free it if needs_freeing is true.
 * The instruction following ins is returned.
 */
Instruction *
delete_ins(IMC_Unit *unit, Instruction *ins, int needs_freeing)
{
    Instruction *next, *prev;

    next = ins->next;
    prev = ins->prev;
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
insert_ins(IMC_Unit *unit, Instruction *ins, Instruction * tmp)
{
    Instruction *next;
    if (!ins) {
        next = unit->instructions;
        unit->instructions = tmp;
        tmp->next = next;
        next->prev = tmp;
        tmp->line = next->line;
        if (!next)
            unit->last_ins = tmp;
    }
    else {
        next = ins->next;
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
prepend_ins(IMC_Unit *unit, Instruction *ins, Instruction * tmp)
{
    Instruction *next, *prev;
    if (!ins) {
        next = unit->instructions;
        unit->instructions = tmp;
        tmp->next = next;
        next->prev = tmp;
        tmp->line = next->line;
    }
    else {
        prev = ins->prev;
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
subst_ins(IMC_Unit *unit, Instruction *ins, Instruction * tmp, int needs_freeing)
{
    Instruction *prev = ins->prev;
    if (prev)
        prev->next = tmp;
    else
        unit->instructions = tmp;
    tmp->prev = prev;
    tmp->next = ins->next;
    if (ins->next)
        ins->next->prev = tmp;
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
move_ins(IMC_Unit * unit, Instruction *ins, Instruction *to)
{
    Instruction *next = delete_ins(unit, ins, 0);
    insert_ins(unit, to, ins);
    return next;
}


/* Emit a single instruction into the current unit buffer. */
Instruction *
emitb(IMC_Unit * unit, Instruction * i)
{

    if (!unit || !i)
	return 0;
    if(!unit->instructions)
        unit->last_ins = unit->instructions = i;
    else {
	unit->last_ins->next = i;
        i->prev = unit->last_ins;
	unit->last_ins = i;
    }
    i->line = line - 1;         /* lexer is in next line already */
    return i;
}

/*
 * Free the Instruction structure ins.
 */
void
free_ins(Instruction *ins)
{
    free(ins->fmt);
    free(ins->op);
    free(ins);
}

/* 
 * Print details of instruction ins in file fd.
 */
int
ins_print(Interp *interp, FILE *fd, Instruction * ins)
{
    char regb[IMCC_MAX_REGS][256];      /* XXX */
    /* only long key constants can overflow */
    char *regstr[IMCC_MAX_REGS];
    SymReg *p;
    int i;
    int len;

#if IMC_TRACE
    PIO_eprintf(NULL, "ins_print\n");
#endif

    if (!ins->r[0] || !strchr(ins->fmt, '%')) {	/* comments, labels and such */
	return fprintf(fd, "%s", ins->fmt);
    }
    for (i = 0; i < IMCC_MAX_REGS ; i++) {
	if (!ins->r[i]) {
	    regstr[i] = 0;
            continue;
        }
        p = ins->r[i];
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
	    sprintf(regb[i], "r%c%d", tolower(p->set), -1 - (int)p->color);
	    regstr[i] = regb[i];
	}
        else if (p->type & VTREGKEY) {
            SymReg * k = p->nextkey;
            for (*regb[i] = '\0'; k; k = k->nextkey) {
                if (k->reg && k->reg->color >= 0)
                    sprintf(regb[i]+strlen(regb[i]), "%c%d",
                            k->reg->set, (int)k->reg->color);    /* XXX */
                else if (IMCC_INFO(interp)->allocated &&
                        (IMCC_INFO(interp)->optimizer_level & OPT_J) &&
                        k->reg &&
                        k->reg->color < 0)
                    sprintf(regb[i]+strlen(regb[i]), "r%c%d",
                            tolower(k->reg->set), -1 - (int)k->reg->color);
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
            exit(1);
            break;
    }
    return len;
}

/* for debug */
static char *output;
static int
e_file_open(Interp *interp, void *param)
{
    char *file = (char *) param;

    UNUSED(interp);
    if (strcmp(file, "-"))
        freopen(file, "w", stdout);
    output = file;
    return 1;
}

static int
e_file_close(Interp *interpreter, void *param)
{
    UNUSED(param);
    printf("\n\n");
    fclose(stdout);
    IMCC_info(interpreter, 1, "assembly module %s written.\n", output);
    return 0;
}

static int
e_file_emit(Interp *interp, void *param, IMC_Unit * unit, Instruction * ins)
{
    UNUSED(param);
    UNUSED(unit);
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

int
emit_open(Interp *interp, int type, void *param)
{
    emitter = type;
    IMCC_INFO(interp)->has_compile = 0;
    IMCC_INFO(interp)->dont_optimize = 0;
    return (emitters[emitter]).open(interp, param);
}

int
emit_flush(Interp *interp, void *param, IMC_Unit * unit)
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

int
emit_close(Interp *interp, void *param)
{
    return (emitters[emitter]).close(interp, param);
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

