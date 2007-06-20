/*
 * print debug info of various structures
 *
 * handle info/error/warning messages from imcc
 *
 * $Id$
 *
 */


#include "imc.h"

/* HEADER: compilers/imcc/debug.h */

/* XXX Remove this */
extern int ig_test(int i, int j, int N, unsigned int* graph); /* reg_alloc.c */

PARROT_API
void
IMCC_fatal(Interp *interp /*NN*/, int code, const char *fmt /*NN*/, ...)
    /* NORETURN */
{
    va_list ap;
    UNUSED(code);

    va_start(ap, fmt);
    IMCC_INFO(interp)->error_message = Parrot_vsprintf_c(interp, fmt, ap);
    va_end(ap);
    IMCC_THROW(IMCC_INFO(interp)->jump_buf,IMCC_FATAL_EXCEPTION);
}

PARROT_API
void
IMCC_fataly(Interp *interp /*NN*/, int code, const char *fmt /*NN*/, ...)
    /* NORETURN */
{
    va_list ap;
    UNUSED(code);

    va_start(ap, fmt);
    IMCC_INFO(interp)->error_message = Parrot_vsprintf_c(interp, fmt, ap);
    va_end(ap);
    IMCC_THROW(IMCC_INFO(interp)->jump_buf,IMCC_FATALY_EXCEPTION);
}

PARROT_API
void
IMCC_fatal_standalone(Interp *interp /*NN*/, int code, const char *fmt /*NN*/, ...)
{
    va_list ap;

    va_start(ap, fmt);
    imcc_vfprintf(interp, stderr, fmt, ap);
    va_end(ap);
    Parrot_exit(interp, code);
}

PARROT_API
void
IMCC_fataly_standalone(Interp *interp /*NN*/, int code, const char *fmt /*NN*/, ...)
{

    va_list ap;

    va_start(ap, fmt);
    fprintf(stderr, "error:imcc:");
    imcc_vfprintf(interp, stderr, fmt, ap);
    va_end(ap);
    IMCC_print_inc(interp);
    Parrot_exit(interp, code);
}

PARROT_API
void
IMCC_warning(Interp *interp /*NN*/, const char *fmt /*NN*/, ...)
{
    va_list ap;
    if (IMCC_INFO(interp)->imcc_warn)
        return;

    va_start(ap, fmt);
    imcc_vfprintf(interp, stderr, fmt, ap);
    va_end(ap);
}

PARROT_API
void
IMCC_info(Interp *interp /*NN*/, int level, const char *fmt /*NN*/, ...)
{
    va_list ap;

    if (level > IMCC_INFO(interp)->verbose)
        return;

    va_start(ap, fmt);
    imcc_vfprintf(interp, stderr, fmt, ap);
    va_end(ap);
}

PARROT_API
void
IMCC_debug(Interp *interp /*NN*/, int level, const char *fmt /*NN*/, ...)
{
    va_list ap;

    if ( !(level & IMCC_INFO(interp)->debug))
        return;
    va_start(ap, fmt);
    imcc_vfprintf(interp, stderr, fmt, ap);
    va_end(ap);
}

void
dump_instructions(Interp *interp /*NN*/, const IMC_Unit *unit /*NN*/)
{
    const Instruction *ins;
    int pc;

    fprintf(stderr,
            "\nDumping the instructions status:"
            "\n-------------------------------\n");
    fprintf(stderr,
            "nins line blck deep flags\t    type opnr size   pc  X ins\n");
    for (pc = 0, ins = unit->instructions; ins; ins = ins->next) {
        const Basic_block * const bb = unit->bb_list[ins->bbindex];

        if (bb) {
             fprintf(stderr, "%4i %4d %4d %4d\t%x\t%8x %4d %4d %4d  %c ",
                     ins->index, ins->line, bb->index, bb->loop_depth,
                     ins->flags, (ins->type & ~ITEXT), ins->opnum,
                     ins->opsize, pc, ins->type & ITEXT ? 'X' : ' ');
        }
        else {
             fprintf(stderr, "\t");
        }

        imcc_fprintf(interp, stderr, "%I\n", ins);
        pc += ins->opsize;
    }
    fprintf(stderr, "\n");
}

void
dump_cfg(const IMC_Unit *unit /*NN*/)
{
    int i;
    Edge *e;

    fprintf(stderr, "\nDumping the CFG:\n-------------------------------\n");
    for (i=0; i < unit->n_basic_blocks; i++) {
        const Basic_block * const bb = unit->bb_list[i];

        fprintf(stderr, "%d (%d)\t -> ", bb->index, bb->loop_depth);
        for (e=bb->succ_list; e != NULL; e=e->succ_next) {
            fprintf(stderr, "%d ", e->to->index);
        }
        fprintf(stderr, "\t\t <- ");
        for (e=bb->pred_list; e != NULL; e=e->pred_next) {
            fprintf(stderr, "%d ", e->from->index);
        }
        fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");

}

void
dump_loops(const IMC_Unit *unit /*NN*/)
{
    int i;
    Loop_info ** loop_info = unit->loop_info;

    fprintf(stderr, "Loop info\n---------\n");
    for (i = 0; i < unit->n_loops; i++) {
        const Set * const loop = loop_info[i]->loop;
        const Set * const exits = loop_info[i]->exits;
        int j;

        fprintf(stderr,
                "Loop %d, depth %d, size %d, header %d, preheader %d\n",
                i, loop_info[i]->depth,
                loop_info[i]->size, loop_info[i]->header,
                loop_info[i]->preheader);
        fprintf(stderr, "  Contains blocks: ");
        for (j = 0; j < unit->n_basic_blocks; j++)
            if (set_contains(loop, j))
                fprintf(stderr, "%d ", j);
        fprintf(stderr, "\n  Exit blocks: ");
        for (j = 0; j < unit->n_basic_blocks; j++)
            if (set_contains(exits, j))
                fprintf(stderr, "%d ", j);
        fprintf(stderr, "\n");
    }
    fprintf(stderr, "\n");
}

void
dump_labels(const IMC_Unit *unit /*NN*/)
{
    int i;
    const SymHash * const hsh = &unit->hash;

    fprintf(stderr, "Labels\n");
    fprintf(stderr, "name\tpos\tlast ref\n"
            "-----------------------\n");
    for (i = 0; i < hsh->size; i++) {
        const SymReg *r;

        for (r = hsh->data[i]; r; r = r->next) {
            if (r && (r->type & VTADDRESS))
                fprintf(stderr, "%s\t%d\t%d\n",
                        r->name,
                        r->first_ins ? r->first_ins->index : -1,
                        r->last_ins ? r->last_ins->index : -1);
        }
    }
    fprintf(stderr, "\n");
}

void
dump_symreg(const IMC_Unit *unit /*NN*/)
{
    int i;
    SymReg** const reglist = unit->reglist;

    if (!reglist)
        return;
    fprintf(stderr,
            "\nSymbols:"
            "\n----------------------------------------------\n");
    fprintf(stderr, "name\tfirst\tlast\t1.blk\t-blk\tset col     \t"
            "used\tlhs_use\tregp\tus flgs\n"
            "----------------------------------------------\n");
    for (i = 0; i < unit->n_symbols; i++) {
        const SymReg * const r = reglist[i];
        if (!(r->type & VTREGISTER))
            continue;
        if (!r->first_ins)
            continue;
        fprintf(stderr, "%s %c\t%d\t%d\t%d\t%d\t%c   %2d %2d\t%d\t%d\t%s\t%lx\n",
                r->name,
                r->usage & U_NON_VOLATILE ? 'P' : ' ',
                r->first_ins->index, r->last_ins->index,
                r->first_ins->bbindex, r->last_ins->bbindex,
                r->set,
                (int)r->color, r->want_regno,
                r->use_count, r->lhs_use_count,
                r->reg ? r->reg->name : "",
                (UINTVAL)r->usage
               );
    }
    fprintf(stderr, "\n");
    dump_liveness_status(unit);
}

void
dump_liveness_status(const IMC_Unit *unit /*NN*/)
{
    int i;
    SymReg** const reglist = unit->reglist;

    fprintf(stderr, "\nSymbols:\n--------------------------------------\n");
    for (i = 0; i < unit->n_symbols; i++) {
        const SymReg * const r = reglist[i];
        if (r->type & VTREGISTER )
            dump_liveness_status_var(unit, r);
    }
    fprintf(stderr, "\n");

}


void
dump_liveness_status_var(const IMC_Unit *unit /*NN*/, const SymReg* r /*NN*/)
{
    fprintf(stderr, "\nSymbol %s:", r->name);
    if (r->life_info) {
        int i;

        for (i=0; i<unit->n_basic_blocks; i++) {
            const Life_range * const l = r->life_info[i];

            if (l->flags & LF_lv_all) {
                fprintf(stderr, "\n\t%i:ALL\t", i);
            }
            else if (l->flags & LF_lv_inside) {
                fprintf(stderr, "\n\t%i:INSIDE", i);
            }

            if (l->flags & LF_lv_in)
                fprintf(stderr, "\n\t%i: IN\t", i);
            else if (l->flags & LF_lv_out)
                fprintf(stderr, "\n\t%i: OUT\t", i);
            else if (l->first_ins)
                fprintf(stderr, "\n\t%i: INS\t", i);
            if (l->flags & LF_use)
                fprintf(stderr, "u ");
            else if (l->flags & LF_def)
                fprintf(stderr, "d ");
            else
                fprintf(stderr, "  ");

            if (l->first_ins) {
                fprintf(stderr, "[%d,%d]\t", l->first_ins->index,
                        l->last_ins->index);
            }
        }
    }
    fprintf(stderr, "\n");
}

void
dump_interference_graph(const IMC_Unit *unit /*NN*/)
{
    int x;
    SymReg** const reglist = unit->reglist;
    const int n_symbols = unit->n_symbols;

    fprintf(stderr, "\nDumping the Interf. graph:"
            "\n-------------------------------\n");
    for (x = 0; x < n_symbols; x++) {
        if (reglist[x]->first_ins) {
            int cnt = 0;
            int y;

            fprintf(stderr, "%s\t -> ", reglist[x]->name);
            for (y = 0; y < n_symbols; y++) {
                if (ig_test(x, y, n_symbols, unit->interference_graph)) {
                    const SymReg * const r = unit->reglist[y];

                    fprintf(stderr, "%s ", r->name);
                    cnt++;
                }
            }
            fprintf(stderr, "(%d)\n", cnt);
        }
    }
    fprintf(stderr, "\n");
}

void
dump_dominators(const IMC_Unit *unit /*NN*/)
{
    int i;

    fprintf(stderr, "\nDumping the Dominators Tree:"
            "\n-------------------------------\n");
    for (i=0; i < unit->n_basic_blocks; i++) {
        int j;
        fprintf(stderr, "%2d <- (%2d)", i, unit->idoms[i]);

        for (j=0; j < unit->n_basic_blocks; j++) {
            if (set_contains(unit->dominators[i], j)) {
                fprintf(stderr, " %2d", j);
            }
        }

        fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");
}

void
dump_dominance_frontiers(const IMC_Unit *unit /*NN*/)
{
    int i;

    fprintf(stderr, "\nDumping the Dominance Frontiers:"
            "\n-------------------------------\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        int j;

        fprintf(stderr, "%2d <-", i);
        for (j = 0; j < unit->n_basic_blocks; j++) {
            if (set_contains(unit->dominance_frontiers[i], j)) {
                fprintf(stderr, " %2d", j);
            }
        }

        fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
