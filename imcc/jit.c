/* imcc JIT optimizer
 *
 * This is a totally experimental hack to demonstrate, that we can
 * ran faster then -O3 compiled C (primes.pasm).
 * But it's incomplete and buggy - albeit it runs all parrot tests.
 *
 * The main problem is the incomplete CFG, mainly WRT subroutines
 * and the effects of saveall/restorall and such.
 * Further too many registers are saved/restored: rebuilding the
 * bb_list is done to get bb->start/end for jit_info, but then
 * life_info maybe out of sync and so all mapped get saved.
 *
 * NOTE: -Oj should always be used with branch/label optimization
 *           as -O1j. It needs a correct CFG, without nul blocks:
 *           e.g. t/op/basic_13.pasm
 *
 */
#include <string.h>
#include <assert.h>
#include "parrot/parrot.h"
#if EXEC_CAPABLE
#  include "parrot/exec.h"
#endif /* EXEC_CAPABLE */
#include "imc.h"
#include "pbc.h"

#ifdef HAS_JIT

#define JIT_IMCC
#include "parrot/jit.h"
#include "parrot/jit_emit.h"

/* PASM registers are already in most used order, so now:
 * - consider the top N registers as processor registers
 * - look at the instruction stream and insert register load/store ins
 *   for e.g. calling out to unJITted functions
 *   This is of course processor dependend
 *
 * NOTE: rx_ ops may have a inout INT parameter for position/mark.
 *       Actually, the either branch or update the inout parameter
 *       so they are save.
 */

#ifndef EXTCALL
#  define EXTCALL(op) op_jit[*(op)].extcall
#endif

#ifndef INT_REGISTERS_TO_MAP
#  define INT_REGISTERS_TO_MAP 0
#endif

#ifndef FLOAT_REGISTERS_TO_MAP
#  define FLOAT_REGISTERS_TO_MAP 0
#endif

#ifndef PRESERVED_INT_REGS
#  define PRESERVED_INT_REGS MAX_MAPPED
#endif

#ifndef PRESERVED_FLOAT_REGS
#  define PRESERVED_FLOAT_REGS MAX_MAPPED
#endif

/*
 * check life range of all symbols, find the max used mapped
 */
static int
max_used(IMC_Unit * unit, int bbi, char t, int typ, int mapped[])
{
    int max, j, c;
    SymReg** reglist = unit->reglist;

    for (j = 0, max = 0; j < unit->n_symbols; j++) {
        SymReg * r = reglist[j];
        if (r->set != t)
            continue;
        c = -1 - r->color;
        if (c < mapped[typ]) {
            Life_range *l = r->life_info[bbi];
            if (l->first_ins && c >= max)
                max = c + 1;
        }
    }
    return max;
}

/* check life range of all symbols, which have
 * colors >= preserved and are mapped
 * if none found, don't emit load/store for preserved regs
 */
static int
min_used(IMC_Unit * unit, int bbi, char t, int typ,
        int preserved[], int mapped[])
{
    int max, j, c;
    SymReg** reglist = unit->reglist;

    for (j = 0, max = mapped[typ]; j < unit->n_symbols; j++) {
        SymReg * r = reglist[j];
        if (r->set != t)
            continue;
        c = -1 - r->color;
        if (c >= preserved[typ] && c < mapped[typ]) {
            Life_range *l = r->life_info[bbi];
            if (l->first_ins && c < max)
                max = c;
        }
    }
    return max;
}

void
allocate_jit(Interp *interpreter, IMC_Unit * unit)
{
    int c, i, j, k, typ;
    int to_map[4] = {0,0,0,0};
#define MAX_MAPPED 32
    int preserved[] =
    {PRESERVED_INT_REGS, MAX_MAPPED, MAX_MAPPED, PRESERVED_FLOAT_REGS};
    const char *types = "IPSN";
    Instruction * ins, *tmp, *prev, *last;
    SymReg * r;
    SymReg * regs[IMCC_MAX_REGS];
    static SymReg  *cpu[4][MAX_MAPPED];
    static SymReg  *par[4][MAX_MAPPED];
    int reads[4][MAX_MAPPED], writes[4][MAX_MAPPED], nr, nw;
    int maxc[4] = {0,0,0,0};
    Basic_block *bb;
    opcode_t pc;
    static int nsubs;
    opcode_t * jit_info_ptr;
    SymReg** reglist = unit->reglist;

    assert(INT_REGISTERS_TO_MAP < MAX_MAPPED);
    assert(FLOAT_REGISTERS_TO_MAP < MAX_MAPPED);

    to_map[0] = INT_REGISTERS_TO_MAP;
    to_map[3] = FLOAT_REGISTERS_TO_MAP;
    /* make a list of mapped cpu regs */
    if (cpu[0][0] == NULL) {
        for (typ = 0; typ < 4; typ++)
            for (k = 0; k < to_map[typ]; k++) {
                char name[16];
                sprintf(name, "%c%d#c", types[typ], k);
                cpu[typ][k] = mk_pasm_reg(interpreter, str_dup(name));
                cpu[typ][k]->color = -1 - k;
                sprintf(name, "%c%d#p", types[typ], k);
                par[typ][k] = mk_pasm_reg(interpreter, str_dup(name));
            }
    }
    prev = last = NULL;
    nr = nw = 0;
    /* change all mappable registers to mapped ones
     * do nothing, if a compile was encountered
     * TODO not the compile is the problem, but the invoke of
     * compiled code - so track PMCs and invokes too
     */
    if (!IMCC_INFO(interpreter)->has_compile &&
            !IMCC_INFO(interpreter)->dont_optimize) {
        for (j = 0; j < unit->n_symbols; j++) {
            r = reglist[j];
            if (r->set == 'K')
                continue;
            typ = strchr(types, r->set) - types;
            if (r->color < to_map[typ]) {
                if (r->color >= maxc[typ])
                    maxc[typ] = r->color + 1;
                r->color = -1 - r->color;
            }

        }
    }
    else {
        maxc[0] = maxc[3] = 0;
    }
    to_map[0] = maxc[0];
    to_map[3] = maxc[3];
    if (!nsubs++) {
        /* clear all used regs at beginning */
        last = unit->instructions->type & ITLABEL ? unit->instructions : NULL;
        for (typ = 0; typ < 4; typ++)
            for (j = 0; j < to_map[typ]; j++) {
                regs[0] = cpu[typ][j];
                regs[1] = par[typ][j];
                tmp = INS(interpreter, unit, "set", "%s, %s\t# init",
                        regs, 2, 0, 0);
                insert_ins(unit, last, tmp);
            }
    }
    /* now run through basic blocks
     * and insert register save/load instructions where needed
     */
    for (i=0; i < unit->n_basic_blocks; i++) {
        bb = unit->bb_list[i];
        /* TODO: set minimum register usage for this block */

        for (ins = bb->start; ins; ins = ins->next) {
            /* clear preserved regs, set rw of non preserved regs */
            for (typ = 0; ins != unit->instructions && typ < 4; typ++)
                for (k = 0; k < to_map[typ]; k++) {
                    reads[typ][k] = writes[typ][k] =
                        k >= min_used(unit, i, types[typ], typ,
                                preserved, to_map);
                }
            /* if extern, go through regs and check the usage */
            if (ins->opnum >= 0 && EXTCALL(&ins->opnum)) {
                nr = nw = 1;
                /* go through block if extern code, but stop at
                 * basic block boundary
                 */
                for (last = ins, prev = ins->prev;
                        ins && ins->opnum >= 0 && EXTCALL(&ins->opnum);
                        last = ins, ins = ins->next) {
                    ins->type |= ITEXT;
                    /* check register usage of all instructions
                     * if extern ins reads a reg, we save it to parrot's
                     * if a reg was writen, we reload it after the
                     * extern code block
                     */
                    for (j = 0; j < unit->n_symbols; j++) {
                        r = reglist[j];
                        if (r->set == 'K')
                            continue;
                        if (r->color >= 0)
                            continue;
                        typ = strchr(types, r->set) - types;
                        c = -1 - r->color;
                        if (0 && !strcmp(ins->op, "bsr") &&
                                (ins->type & ITSAVES)) {
                            int bb_sub =
                                find_sym(interpreter,
                                        ins->r[0]->name)->first_ins->bbindex;
                            if (max_used(unit, bb_sub, types[typ],
                                        typ, to_map))
                                reads[typ][c] = writes[typ][c] = nr = nw = 1;
                        }
                        if (instruction_reads(ins, r) ||
                                (/* !(ins->type & ITSAVES) && */
                                 ins_reads2(ins, r->set))) {
                            reads[typ][c] = 1;
                            nr = 1;
                        }
                        if (instruction_writes(ins, r) ||
                                (/* !(ins->type & ITSAVES) && */
                                 ins_writes2(ins, r->set))) {
                            writes[typ][c] = 1;
                            nw = 1;
                        }
                    }
                    /* changed mapped regs to parrot regs */
                    for (j = 0; (r = ins->r[j]) && j < IMCC_MAX_REGS; j++) {
                        typ = strchr(types, r->set) - types;
                        if ((r->type & VTREGISTER) && r->color < 0)
                            ins->r[j] = par[typ][-1 - r->color];
                    }
                    if (ins == bb->end) {
                        last = ins;
                        if (!strcmp(ins->op, "ret"))
                            last = ins->prev;
                        break;
                    }
                }
            }
            /* a JITed end opcode, save registers to parrot's */
            else if (!ins->opnum) {
                for (typ = 0; typ < 4; typ++)
                    for (j = 0; j < to_map[typ]; j++) {
                        reads[typ][j] = 1;
                        nr = 1;
                    }
            }
            /* insert load ins after non JIT block */
            if (nw) {
                for (typ = 0; typ < 4; typ++)
                    for (j = 0; j < to_map[typ]; j++) {
                        if (!writes[typ][j])
                            continue;
                        regs[0] = cpu[typ][j];
                        regs[1] = par[typ][j];
                        tmp = INS(interpreter, unit,"set", "%s, %s\t# load",
                                regs, 2, 0, 0);
                        insert_ins(unit, last, tmp);
                    }
                nw = 0;
            }
            /* insert save ins before extern op */
            if (nr) {
                for (typ = 0; typ < 4; typ++)
                    for (j = 0; j < to_map[typ]; j++) {
                        if (!reads[typ][j])
                            continue;
                        regs[0] = par[typ][j];
                        regs[1] = cpu[typ][j];
                        tmp = INS(interpreter, unit, "set", "%s, %s\t# save",
                                regs, 2, 0, 0);
                        insert_ins(unit, prev, tmp);
                    }
                nr = 0;
            }
            if (ins == bb->end)
                break;
        }
    }

    find_basic_blocks(interpreter, unit, 0);
    /* allocate a jit_info packfile segment holding
     * some CFG and register usage info
     */
    jit_info_ptr = make_jit_info(interpreter, unit);
    /* write out minimal CFG and register_usage */
    for (i = 0, pc = 0; i < unit->n_basic_blocks; i++) {
        int branch_target = 0;
        bb = unit->bb_list[i];
        ins = bb->start;
        /* mark branch targets with hight bit set */
        if (ins->type & ITLABEL)
            branch_target = 0x80000000;
        *jit_info_ptr++ = (pc | branch_target);
        for ( ; ins; ins = ins->next) {
            pc += ins->opsize;
            if (ins == bb->end)
                break;
        }
        *jit_info_ptr++ = pc - ins->opsize;
        /* TODO: dont't write block->end
         * put register usage in one op
         */
        for (typ = 0; typ < 4; typ++)
            *jit_info_ptr++ = to_map[typ];
        /*  = max_used(unit, types[typ], typ, to_map); */
    }
}

#else

#endif
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
