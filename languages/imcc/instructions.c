
#include <stdlib.h>
#include <string.h>
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
 * This functions operate over this array and its contents.
 */


/* Global variables , forward def */

/* all code is collected in compilation units, which may be:
 * - .sub/.end
 * - .emit/.eom
 * - stuff outside of these
 */

static Instruction * last_ins;

typedef struct comp_unit_t {
    Instruction * instructions;
    Instruction * last_ins;
    SymReg ** hash[HASH_SIZE];
} comp_unit_t;

static comp_unit_t *comp_unit;
int n_comp_units;

void
open_comp_unit(void)
{
    if (!n_comp_units)
        comp_unit = mem_sys_allocate(sizeof(n_comp_units+1) *
            sizeof(comp_unit_t));
    else
        comp_unit = realloc(comp_unit, sizeof(n_comp_units+1) *
            sizeof(comp_unit_t));
    comp_unit[n_comp_units].last_ins = last_ins;
    comp_unit[n_comp_units].instructions = instructions;
    last_ins = instructions = NULL;
    comp_unit[n_comp_units].hash[0] = calloc(HASH_SIZE, sizeof(SymReg*));
    hash = comp_unit[n_comp_units].hash[0];
    if (!n_comp_units)
        ghash = hash;
    n_comp_units++;
}


void
close_comp_unit(void)
{
    if (!n_comp_units)
        fatal(1, "close_comp_unit", "non existent comp_unit\n");
    n_comp_units--;
    instructions = comp_unit[n_comp_units].instructions;
    last_ins = comp_unit[n_comp_units].last_ins;
    clear_tables();
    free(comp_unit[n_comp_units].hash[0]);
    if (n_comp_units) {
        hash = comp_unit[n_comp_units-1].hash[0];
    }
    else {
        free(comp_unit);
        comp_unit = NULL;
    }
}

/* find a symbol on all hashes */
SymReg *
_find_sym(Namespace * nspace, SymReg * hsh[], const char * name) {
    Namespace * ns;
    int n;
    SymReg *p;

    for (n = n_comp_units - 1; n >= 0; n--) {
        for (ns = nspace; ns; ns = ns->parent) {
            char * fullname = _mk_fullname(ns, name);
            p = _get_sym(comp_unit[n].hash[0], fullname);
            free(fullname);
            if (p) {
        ret_p:
                /* outer scope symbol */
                if (hsh != comp_unit[n].hash[0] && (p->type & VTIDENTIFIER)) {
                    SymReg *new = mk_ident(str_dup(p->name), p->set);
                    new->type |= VT_REGP;
                    new->reg = p;
                    /* link in both dirs, so that usage can be determined */
                    p->reg = new;
                    debug(DEBUG_LEXER, "found outer scope sym '%s'\n",
                            p->name);
                    return new;
                }
                return p;
            }
        }
        p = _get_sym(comp_unit[n].hash[0], name);
        if (p)
            goto ret_p;
    }
    return 0;
}


/* Creates a new instruction */

Instruction * _mk_instruction(const char *op, const char * fmt,
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


/* next 2 functions are called very often, says gprof
 * theys should be fast
 */
#ifdef HAS_INLINE
inline
#endif
int instruction_reads(Instruction* ins, SymReg* r) {
    int f, i;
    SymReg *key;

    f = ins->flags;
    for (i = 0; ins->r[i] && i < IMCC_MAX_REGS; i++)
	if (f & (1<<i)) {
            if (ins->r[i] == r)
                return 1;
            if ((ins->r[i]->type & VT_REGP) && ins->r[i]->reg == r)
                return 1;
            for (key = ins->r[i]->nextkey; key; key = key->nextkey)
                if (key->reg && key->reg == r)
                    return 1;
    }

    return 0;
}

#ifdef HAS_INLINE
inline
#endif
int instruction_writes(Instruction* ins, SymReg* r) {
    int f, i;

    f = ins->flags;

    for (i = 0; ins->r[i] && i < IMCC_MAX_REGS; i++)
	if (f & (1<<(16+i))) {
            if (ins->r[i] == r)
                return 1;
            if ((ins->r[i]->type & VT_REGP) && ins->r[i]->reg == r)
                return 1;
    }

    return 0;
}

/* get the reg no of address, where a branch targets to */
int get_branch_regno(Instruction * ins)
{
    int j;
    for (j = 0; ins->r[j] && j < IMCC_MAX_REGS-1; j++)
        if (ins->type & (1<<j))
            return j;
    return -1;
}

/* get the reg no of address, where a branch targets to */
SymReg *get_branch_reg(Instruction * ins)
{
    int r = get_branch_regno(ins);
    if (r >= 0)
        return ins->r[r];
    return 0;
}

/* some usefule instruction routines */

/*
 * delete and free *ins
 * actual new ins is returned
 */
Instruction * delete_ins(Instruction *ins, int needs_freeing)
{
    Instruction *next, *prev;

    next = ins->next;
    prev = ins->prev;
    if (prev)
        prev->next = next;
    else
        instructions = next;
    if (next)
        next->prev = prev;
    if (needs_freeing)
        free_ins(ins);
    return next;
}

/*
 * insert tmp after ins
 */

void insert_ins(Instruction *ins, Instruction * tmp)
{
    Instruction *next = ins->next;
    ins->next = tmp;
    tmp->prev = ins;
    tmp->next = next;
    next->prev = tmp;
    if (!tmp->line)
        tmp->line = ins->line;
}

/*
 * subst tmp for ins
 */

void subst_ins(Instruction *ins, Instruction * tmp, int needs_freeing)
{
    Instruction *prev = ins->prev;
    if (prev)
        prev->next = tmp;
    else
        instructions = tmp;
    tmp->prev = prev;
    tmp->next = ins->next;
    if (ins->next)
        ins->next->prev = tmp;
    if (!tmp->line)
        tmp->line = ins->line;
    if (needs_freeing)
        free_ins(ins);
}
/* move instruction ins to to */
Instruction *move_ins(Instruction *ins, Instruction *to)
{
    Instruction *next = delete_ins(ins, 0);
    insert_ins(to, ins);
    return next;
}


/* Emits the instructions buffered in 'instructions' */
Instruction * emitb(Instruction * i) {

    Instruction *prev;

    if (!i)
	return 0;
    if(!instructions)
        last_ins = instructions = i;
    else {
        if ((last_ins->type & IF_goto) && !(i->type & ITLABEL)) {
            debug(DEBUG_CFG, "unreachable ins dropped line %d op %s\n",
                    line - 1, i->op);
            return i;
        }
        if ((last_ins->type & IF_goto) && (i->type & ITLABEL) &&
                !strcmp(last_ins->op, "branch") &&
                !strcmp(last_ins->r[0]->name, i->r[0]->name)) {
            debug(DEBUG_CFG, "dead branch dropped line %d op %s\n",
                    line - 1, i->op);
            prev = last_ins->prev;
            if (!prev)
                instructions = i;
            else
                prev->next = i;
            i->prev = prev;
            free_ins(last_ins);
            last_ins = i;
            i->line = line - 1;
            return i;
        }
	last_ins->next = i;
        i->prev = last_ins;
	last_ins = i;
    }
    i->line = line - 1;         /* lexer is in next line already */
    return i;
}

void free_ins(Instruction *ins)
{
    free(ins->fmt);
    free(ins->op);
    free(ins);
}


static char * ins_fmt(Instruction * ins) {

    static char s[512]; /* XXX */
    char regb[IMCC_MAX_REGS][256];      /* XXX */
    char *regstr[IMCC_MAX_REGS];
    SymReg *p;
    int i;
    *s = 0;
    if (!ins->r[0] || !strchr(ins->fmt, '%')) {	/* comments, labels and such */
	return ins->fmt;
    }
    for (i = 0; i < IMCC_MAX_REGS ; i++) {
	if (!ins->r[i]) {
	    regstr[i] = 0;
            continue;
        }
        p = ins->r[i];
        if (!p)
            continue;
        if (p->type & (VT_REGP | VT_CONSTP))
            p = p->reg;
	if (p->color >= 0 && (p->type & VTREGISTER)) {
	    sprintf(regb[i], "%c%d", p->set, p->color);
	    regstr[i] = regb[i];
	}
        else if (p->type & VTREGKEY) {
            SymReg * k = p->nextkey;
            for (*regb[i] = '\0'; k; k = k->nextkey) {
                if (k->reg && k->reg->color >= 0)
                    sprintf(regb[i]+strlen(regb[i]), "%c%d",
                            k->reg->set, k->reg->color);        /* XXX */
                else
                    strcat(regb[i], k->name);   /* XXX */
                if (k->nextkey)
                    strcat(regb[i], ";");
            }
            regstr[i] = regb[i];
        }
	else
	    regstr[i] = p->name;
    }

    switch (ins->opsize-1) {
        case -1:        /* labels */
        case 1:
            sprintf(s, ins->fmt, regstr[0]);
            break;
        case 2:
            sprintf(s, ins->fmt, regstr[0], regstr[1]);
            break;
        case 3:
            sprintf(s, ins->fmt, regstr[0], regstr[1], regstr[2]);
            break;
        case 4:
            sprintf(s, ins->fmt, regstr[0], regstr[1], regstr[2], regstr[3]);
            break;
        case 5:
            sprintf(s, ins->fmt, regstr[0], regstr[1], regstr[2], regstr[3],
                    regstr[4]);
            break;
        case 6:
            sprintf(s, ins->fmt, regstr[0], regstr[1], regstr[2], regstr[3],
                    regstr[4], regstr[5]);
            break;
        default:
            fatal(1, "ins_fmt", "unhandled: opsize (%d), op %s, fmt %s\n",
                    ins->opsize, ins->op, ins->fmt);
            break;
    }
    return s;
}

/* for debug */
char * ins_string(Instruction * ins) {
    static char s[512];
    sprintf(s, "%s %s", ins->op, ins_fmt(ins));
    return s;
}

static char *output;
static int e_file_open(void *param)
{
    char *file = (char *) param;

    if (strcmp(file, "-"))
        freopen(file, "w", stdout);
    output = file;
    return 1;
}

static int e_file_close(void *param) {
    UNUSED(param);
    printf("\n\n");
    fclose(stdout);
    info(1, "assembly module %s written.\n", output);
    return 0;

}

static int e_file_emit(void *param, Instruction * ins) {
    UNUSED(param);
    if ((ins->type & ITLABEL) || ! *ins->op)
	printf(ins_fmt(ins));
    else
	printf("\t%s %s",ins->op, ins_fmt(ins));
    printf("\n");
    return 0;
}

Emitter emitters[2] = {
    {e_file_open, e_file_emit, e_file_close},
    {e_pbc_open, e_pbc_emit, e_pbc_close},
};

static int emitter;

int emit_open(int type, void *param)
{
    emitter = type;
    return (emitters[emitter]).open(param);
    return 0;
}

int emit_flush(void *param) {

    Instruction * ins, *next;
    struct Parrot_Interp *interpreter = (struct Parrot_Interp *)param;
    /* first instruction should be ".sub" -- make sure we allocate P31
     * _after_ subroutine entry.  And after the "saveall", or any
     * other assortment of pushes. */

    if (n_spilled > 0 && instructions) {
        SymReg *p31;
        Instruction *spill_ins;
        p31 = mk_pasm_reg(str_dup("P31"));
        ins = instructions;
        while (ins
                && (strncmp(ins->fmt, "push", 4) == 0
                    || strcmp(ins->fmt, "saveall") == 0)) {
            ins = ins->next;
        }
        spill_ins = iNEW(interpreter, p31, str_dup("PerlArray"), 0);
        insert_ins(ins, spill_ins);
    }
    for (ins = instructions; ins; ins = ins->next) {
        (emitters[emitter]).emit(param, ins);
    }
    for (ins = instructions; ins; ) {
        next = ins->next;
        free_ins(ins);
        ins = next;
    }
    close_comp_unit();
    return 0;
}
int emit_close(void *param)
{
    return (emitters[emitter]).close(param);
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

