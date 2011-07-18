/*
 * Copyright (C) 2002-2010, Parrot Foundation.
 */

/*

=head1 NAME

compilers/imcc/debug.c

=head1 DESCRIPTION

print debug info of various structures

handle info/error/warning messages from imcc

=head2 Functions

=over 4

=cut

*/

#include "imc.h"
#include "parrot/io.h"

/* HEADERIZER HFILE: compilers/imcc/debug.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static STRING * IMCC_get_err_location(ARGMOD(imc_info_t *imcc))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*imcc);

#define ASSERT_ARGS_IMCC_get_err_location __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void IMCC_fatal(imc_info_t * imcc, int code, const char *fmt, ...)>

Prints out a fatal error message from IMCC and throws an
IMCC_FATAL_EXCEPTION.

=cut

*/

PARROT_DOES_NOT_RETURN
void
IMCC_fatal(ARGMOD(imc_info_t * imcc), SHIM(int code), ARGIN(const char *fmt), ...)
{
    ASSERT_ARGS(IMCC_fatal)
    STRING * location = STRINGNULL;
    va_list ap;

    va_start(ap, fmt);
    imcc->error_message = Parrot_vsprintf_c(imcc->interp, fmt, ap);
    va_end(ap);
    location = IMCC_get_err_location(imcc);
    Parrot_ex_throw_from_c_args(imcc->interp, NULL, IMCC_FATAL_EXCEPTION,
        "error:imcc:%Ss\n\t%Ss", imcc->error_message, location);
}

/*

=item C<void IMCC_fataly(imc_info_t * imcc, int code, const char *fmt, ...)>

Throws an IMCC_FATALY_EXCEPTION.

=cut

*/

PARROT_DOES_NOT_RETURN
void
IMCC_fataly(ARGMOD(imc_info_t * imcc), SHIM(int code), ARGIN(const char *fmt), ...)
{
    ASSERT_ARGS(IMCC_fataly)
    STRING * location;
    va_list ap;

    va_start(ap, fmt);
    location = IMCC_get_err_location(imcc);
    imcc->error_message = Parrot_str_concat(imcc->interp,
        imcc->error_message,
        Parrot_sprintf_c(imcc->interp, "error:imcc:%Ss\n\t%Ss",
        Parrot_vsprintf_c(imcc->interp, fmt, ap),
        location));
    va_end(ap);
    Parrot_ex_throw_from_c_args(imcc->interp, NULL, IMCC_FATALY_EXCEPTION,
        "%Ss", imcc->error_message);
}

/*

=item C<static STRING * IMCC_get_err_location(imc_info_t *imcc)>

Return a string containing the location of an error, with file name and
line number.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
IMCC_get_err_location(ARGMOD(imc_info_t *imcc))
{
    ASSERT_ARGS(IMCC_get_err_location)
    macro_frame_t *f;
    STRING        *old = imcc->frames->s.file;
    STRING * msg = STRINGNULL;

    if (imcc->frames && imcc->frames->is_macro)
        msg = Parrot_sprintf_c(imcc->interp, "in macro '.%Ss' line %d",
                imcc->frames->s.file, imcc->line);
    else
        msg = Parrot_sprintf_c(imcc->interp, "in file '%Ss' line %d",
                imcc->frames->s.file, imcc->line);


    for (f = imcc->frames; f; f = (macro_frame_t *)f->s.next) {
        if (!STRING_equal(imcc->interp, f->s.file, old)) {
            msg = Parrot_sprintf_c(imcc->interp,
                "%Ss\n\tincluded from '%Ss' line %d", msg, f->s.file, f->s.line);
        }

        old = f->s.file;
    }
    return msg;
}

/*

=item C<void IMCC_fatal_standalone(imc_info_t * imcc, int code, const char *fmt,
...)>

Prints an error message from IMCC and exits Parrot. This is not a
recoverable exception but a forced exit.

=cut

*/

PARROT_DOES_NOT_RETURN
void
IMCC_fatal_standalone(ARGMOD(imc_info_t * imcc), int code, ARGIN(const char *fmt), ...)
{
    ASSERT_ARGS(IMCC_fatal_standalone)
    va_list ap;
    STRING * s = STRINGNULL;

    va_start(ap, fmt);
    s = Parrot_vsprintf_c(imcc->interp, fmt, ap);
    va_end(ap);
    Parrot_ex_throw_from_c_args(imcc->interp, NULL, code, "%Ss", s);
}

/*

=item C<void IMCC_warning(imc_info_t * imcc, const char *fmt, ...)>

Prints a warning message, but does not throw an exception and does not
cause Parrot to exit.

=cut

*/

void
IMCC_warning(ARGMOD(imc_info_t * imcc), ARGIN(const char *fmt), ...)
{
    ASSERT_ARGS(IMCC_warning)
    va_list ap;
    va_start(ap, fmt);
    imcc->error_message = Parrot_str_concat(imcc->interp, imcc->error_message, Parrot_vsprintf_c(imcc->interp, fmt, ap));
    va_end(ap);
}

/*

=item C<void IMCC_info(imc_info_t * imcc, int level, const char *fmt, ...)>

Prints some information, if the level of the information is higher
then IMCC's verbose mode.

=cut

*/

void
IMCC_info(ARGMOD(imc_info_t * imcc), int level, ARGIN(const char *fmt), ...)
{
    ASSERT_ARGS(IMCC_info)
    va_list ap;

    if (level > imcc->verbose)
        return;

    va_start(ap, fmt);
    imcc_vfprintf(imcc, Parrot_io_STDERR(imcc->interp), fmt, ap);
    va_end(ap);
}

/*

=item C<void IMCC_debug(imc_info_t * imcc, int level, const char *fmt, ...)>

Prints a debug message, if IMCC's debug mode is turned on.

=cut

*/

void
IMCC_debug(ARGMOD(imc_info_t * imcc), int level, ARGIN(const char *fmt), ...)
{
    ASSERT_ARGS(IMCC_debug)
    va_list ap;

    if (!(level & imcc->debug))
        return;
    va_start(ap, fmt);
    imcc_vfprintf(imcc, Parrot_io_STDERR(imcc->interp), fmt, ap);
    va_end(ap);
}

/*

=item C<void dump_instructions(imc_info_t * imcc, const IMC_Unit *unit)>

Dumps the current instruction status of IMCC

=cut

*/

void
dump_instructions(ARGMOD(imc_info_t * imcc), ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_instructions)
    const Instruction *ins;
    int                pc;

    Parrot_io_eprintf(imcc->interp,
            "\nDumping the instructions status:"
            "\n-------------------------------\n");
    Parrot_io_eprintf(imcc->interp,
            "nins line blck deep flags\t    type opnr size   pc  X ins\n");

    for (pc = 0, ins = unit->instructions; ins; ins = ins->next) {
        const Basic_block * const bb = unit->bb_list[ins->bbindex];

        if (bb) {
            Parrot_io_eprintf(imcc->interp,
                    "%4i %4d %4d %4d\t%x\t%8x %4d %4d %4d  ",
                     ins->index, ins->line, bb->index, bb->loop_depth,
                     ins->flags, ins->type, OP_INFO_OPNUM(ins->op),
                     ins->opsize, pc);
        }
        else {
            Parrot_io_eprintf(imcc->interp, "\t");
        }

        Parrot_io_eprintf(imcc->interp, "%s\n", ins->opname);
        ins_print(imcc, PIO_STDHANDLE(imcc->interp, PIO_STDERR_FILENO), ins);
        pc += ins->opsize;
    }

    Parrot_io_eprintf(imcc->interp, "\n");
}

/*

=item C<void dump_cfg(const IMC_Unit *unit)>

Dumps the current IMCC config data.

=cut

*/

void
dump_cfg(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_cfg)
    unsigned int i;
    Edge *e;

    fprintf(stderr, "\nDumping the CFG:\n-------------------------------\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        const Basic_block * const bb = unit->bb_list[i];

        fprintf(stderr, "%d (%d)\t -> ", bb->index, bb->loop_depth);

        for (e = bb->succ_list; e; e = e->succ_next) {
            fprintf(stderr, "%d ", e->to->index);
        }

        fprintf(stderr, "\t\t <- ");

        for (e = bb->pred_list; e; e = e->pred_next) {
            fprintf(stderr, "%d ", e->from->index);
        }

        fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");

}

/*

=item C<void dump_loops(const IMC_Unit *unit)>

Dumps the current loops in the IMC_Unit C<unit>.

=cut

*/

void
dump_loops(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_loops)
    int i;
    Loop_info ** loop_info = unit->loop_info;

    fprintf(stderr, "Loop info\n---------\n");
    for (i = 0; i < unit->n_loops; i++) {
        const Set * const loop = loop_info[i]->loop;
        const Set * const exits = loop_info[i]->exits;
        unsigned int j;

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

/*

=item C<void dump_labels(const IMC_Unit *unit)>

Dumps the list of labels in IMC_Unit C<unit>.

=cut

*/

void
dump_labels(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_labels)
    const SymHash * const hsh = &unit->hash;
    unsigned int          i;

    fprintf(stderr, "Labels\n");
    fprintf(stderr, "name\tpos\tlast ref\n"
            "-----------------------\n");
    for (i = 0; i < hsh->size; i++) {
        const SymReg *r;

        for (r = hsh->data[i]; r; r = r->next) {
            if (r && (r->type & VTADDRESS))
                fprintf(stderr, "%s\t%d\t%d\n",
                        r->name,
                        r->first_ins ? (int)r->first_ins->index : -1,
                        r->last_ins  ? (int)r->last_ins->index  : -1);
        }
    }
    fprintf(stderr, "\n");
}

/*

=item C<void dump_symreg(const IMC_Unit *unit)>

Dumps a list of the symbolic registers in IMC_Unit C<unit>

=cut

*/

void
dump_symreg(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_symreg)
    unsigned int i;
    SymReg ** const reglist = unit->reglist;

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
        if (!REG_NEEDS_ALLOC(r))
            continue;
        if (!r->first_ins)
            continue;
        fprintf(stderr, "%s \t%d\t%d\t%d\t%d\t%c   %2d %2d\t%d\t%d\t%s\t%lx\n",
                r->name,
                r->first_ins->index, r->last_ins->index,
                r->first_ins->bbindex, r->last_ins->bbindex,
                r->set,
                (int)r->color, r->want_regno,
                r->use_count, r->lhs_use_count,
                r->reg ? r->reg->name : "",
                (UINTVAL)r->usage);
    }
    fprintf(stderr, "\n");
}

/*

=item C<void dump_dominators(const IMC_Unit *unit)>

Dumps the current list of dominators for the current IMC_Unit C<unit>.

=cut

*/

void
dump_dominators(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_dominators)
    unsigned int i;

    fprintf(stderr, "\nDumping the Dominators Tree:"
            "\n-------------------------------\n");

    for (i = 0; i < unit->n_basic_blocks; i++) {
        unsigned int j;
        fprintf(stderr, "%2d <- (%2d)", i, unit->idoms[i]);

        for (j = 0; j < unit->n_basic_blocks; j++) {
            if (set_contains(unit->dominators[i], j))
                fprintf(stderr, " %2d", j);
        }

        fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");
}

/*

=item C<void dump_dominance_frontiers(const IMC_Unit *unit)>

Dumps the list of dominance frontiers for the current IMC_Unit C<unit>.

=cut

*/

void
dump_dominance_frontiers(ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(dump_dominance_frontiers)
    unsigned int i;

    fprintf(stderr, "\nDumping the Dominance Frontiers:"
            "\n-------------------------------\n");
    for (i = 0; i < unit->n_basic_blocks; i++) {
        unsigned int j;

        fprintf(stderr, "%2d <-", i);
        for (j = 0; j < unit->n_basic_blocks; j++) {
            if (set_contains(unit->dominance_frontiers[i], j))
                fprintf(stderr, " %2d", j);
        }

        fprintf(stderr, "\n");
    }

    fprintf(stderr, "\n");
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
