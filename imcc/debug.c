/*
 * print debug info of various structures
 *
 * handle info/error/warnins of imcc
 */


#include "imc.h"

void
fatal(int code, const char *func, const char *fmt, ...)
{
    va_list ap;

    va_start(ap, fmt);
    fprintf(stderr, "error:imcc:%s: ", func);
    imcc_vfprintf(stderr, fmt, ap);
    va_end(ap);
    Parrot_exit(code);
}


void
fataly(int code, const char *file, int lin, const char *fmt, ...)
{
    va_list ap;

    va_start(ap, fmt);
    fprintf(stderr, "error:imcc:");
    imcc_vfprintf(stderr, fmt, ap);
    va_end(ap);
    print_inc(file, lin);
    /* TODO through compiler exception */
    Parrot_exit(code);
}


void
warning(Parrot_Interp interpreter, const char *func, const char *fmt, ...)
{
    va_list ap;
    if (IMCC_INFO(interpreter)->imcc_warn)
        return;

    va_start(ap, fmt);
    fprintf(stderr, "warning:imcc:%s: ", func);
    imcc_vfprintf(stderr, fmt, ap);
    va_end(ap);
}

void
info(Parrot_Interp interpreter, int level, const char *fmt, ...)
{
    va_list ap;

    if(level > IMCC_INFO(interpreter)->verbose)
	return;

    va_start(ap, fmt);
    imcc_vfprintf(stderr, fmt, ap);
    va_end(ap);
}

void
debug(Parrot_Interp interpreter, int level, const char *fmt, ...)
{
    va_list ap;

    if ( !(level & IMCC_INFO(interpreter)->debug))
	return;
    va_start(ap, fmt);
    imcc_vfprintf(stderr, fmt, ap);
    va_end(ap);
}

void
dump_instructions(IMC_Unit * unit)
{
    Instruction *ins;
    Basic_block *bb;
    int pc;

    fprintf(stderr, "\nDumping the instructions status:\n-------------------------------\n");
    fprintf(stderr,
            "nins line blck deep flags\t    type opnr size   pc  X ins\n");
    for (pc = 0, ins = unit->instructions; ins; ins = ins->next) {
	bb = unit->bb_list[ins->bbindex];

	if (bb) {
	     fprintf(stderr, "%4i %4d %4d %4d\t%x\t%8x %4d %4d %4d  %c ",
		     ins->index, ins->line, bb->index, bb->loop_depth,
                     ins->flags, (ins->type & ~ITEXT), ins->opnum,
                     ins->opsize, pc, ins->type & ITEXT ? 'X' : ' ');
	}
	else {
	     fprintf(stderr, "\t");
	}

	imcc_fprintf(stderr, "%I\n", ins);
        pc += ins->opsize;
    }
    fprintf(stderr, "\n");
}

void
dump_cfg(IMC_Unit * unit)
{
    int i;
    Basic_block *bb;
    Edge *e;

    fprintf(stderr, "\nDumping the CFG:\n-------------------------------\n");
    for (i=0; i < unit->n_basic_blocks; i++) {
	bb = unit->bb_list[i];
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
dump_loops(IMC_Unit * unit)
{
    int i, j;
    Set *loop;
    Loop_info ** loop_info = unit->loop_info;

    fprintf(stderr, "Loop info\n---------\n");
    for (i = 0; i < unit->n_loops; i++) {
        loop = loop_info[i]->loop;
        fprintf(stderr,
                "loop %d,  depth %d, size %d, entry %d, contains blocks:\n",
                i, loop_info[i]->depth,
                loop_info[i]->size, loop_info[i]->entry);
        for (j = 0; j < unit->n_basic_blocks; j++)
            if (set_contains(loop, j))
                fprintf(stderr, "%d ", j);
        fprintf(stderr, "\n");
    }
    fprintf(stderr, "\n");
}

void
dump_labels(IMC_Unit * unit)
{
    int i;

    fprintf(stderr, "Labels\n");
    fprintf(stderr, "name\tpos\tlast ref\n"
            "-----------------------\n");
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = unit->hash[i];
        if (r && (r->type & VTADDRESS))
            fprintf(stderr, "%s\t%d\t%d\n",
                    r->name,
                    r->first_ins ? r->first_ins->index : -1,
                    r->last_ins ? r->last_ins->index : -1);
    }
    fprintf(stderr, "\n");
}

void
dump_symreg(IMC_Unit * unit)
{
    int i;
    SymReg** reglist = unit->reglist;

    if (!reglist)
        return;
    fprintf(stderr,
            "\nSymbols:"
            "\n----------------------------------------------\n");
    fprintf(stderr, "name\tfirst\tlast\t1.blk\t-blk\tset col     \tscore\t"
            "used\tlhs_use\tregp\tus flgs\n"
            "----------------------------------------------\n");
    for(i = 0; i < unit->n_symbols; i++) {
        SymReg * r = reglist[i];
        if(!(r->type & VTREGISTER))
            continue;
        if(!r->first_ins)
            continue;
        fprintf(stderr, "%s\t%d\t%d\t%d\t%d\t%c   %2d %2d\t%d\t%d\t%d\t%s\t%x\n",
                r->name,
		    r->first_ins->index, r->last_ins->index,
		    r->first_ins->bbindex, r->last_ins->bbindex,
		    r->set,
                (int)r->color, r->want_regno, r->score,
                r->use_count, r->lhs_use_count,
                r->reg ? r->reg->name : "",
                r->usage
               );
    }
    fprintf(stderr, "\n");
    dump_liveness_status(unit);
}

void
dump_liveness_status(IMC_Unit * unit)
{
    int i;
    SymReg** reglist = unit->reglist;

    fprintf(stderr, "\nSymbols:\n--------------------------------------\n");
    for(i = 0; i < unit->n_symbols; i++) {
        SymReg * r = reglist[i];
        if (r->type & VTREGISTER )
            dump_liveness_status_var(unit, r);
    }
    fprintf(stderr, "\n");

}


void
dump_liveness_status_var(IMC_Unit * unit, SymReg* r)
{
    int i;
    Life_range *l;

    fprintf(stderr, "\nSymbol %s:", r->name);
    if (r->life_info==NULL) return;
    for (i=0; i<unit->n_basic_blocks; i++) {
        l = r->life_info[i];

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

	if(l->first_ins) {
            fprintf(stderr, "[%d,%d]\t", l->first_ins->index,
                    l->last_ins->index);
	}
    }
    fprintf(stderr, "\n");
}

void
dump_interference_graph(IMC_Unit * unit)
{
    int x, y, cnt;
    SymReg *r;
    SymReg** reglist = unit->reglist;
    SymReg** interference_graph = unit->interference_graph;
    int n_symbols = unit->n_symbols;

    fprintf(stderr, "\nDumping the Interf. graph:"
            "\n-------------------------------\n");
    for (x = 0; x < n_symbols; x++) {

	if (!reglist[x]->first_ins) continue;

	fprintf(stderr, "%s\t -> ", reglist[x]->name);
	cnt = 0;

        for (y = 0; y < n_symbols; y++) {

	     r = interference_graph[x*n_symbols + y];
	     if ( r && !r->simplified) {
	        fprintf(stderr, "%s ", r->name);
		cnt++;
	     }
        }
        fprintf(stderr, "(%d)\n", cnt);
    }
    fprintf(stderr, "\n");
}

void
dump_dominators(IMC_Unit * unit)
{
    int i, j;

    fprintf(stderr, "\nDumping the Dominators Tree:"
            "\n-------------------------------\n");
    for (i=0; i < unit->n_basic_blocks; i++) {
	fprintf (stderr, "%d <- ", i);

	for(j=0; j < unit->n_basic_blocks; j++) {
            if (set_contains(unit->dominators[i], j)) {
		fprintf(stderr, " %d", j);
	    }
	}

	fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");
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
