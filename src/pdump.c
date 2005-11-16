/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

pdump - Dump or convert Parrot bytecode (PBC) files

=head1 SYNOPSIS

 pdump [-tdh] [--terse|--disassemble|--header-only] file.pbc

 pdump -o converted.pbc file.pbc

=head1 DESCRIPTION

A program to dump pack files to human readable form.

=head2 Command-Line Options

=over 4

=item C<-d>

Disassemble bytecode segments.

=item C<-h>

Dump the bytecode header only.

=item C<-t>

Terse output.

=item C<-o converted.pbc>

Repacks a PBC file into platforms native binary format for better
efficiency on reading non native PBCs.

=back

=head1 SEE ALSO

F<src/packdump.c>.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"

/*

static void
const_dump(Interp *interpreter, struct PackFile_Segment *segp)

Dump the constant table.

*/

static void
const_dump (Interp *interpreter, struct PackFile_Segment *segp)
{
    PIO_printf(interpreter, "%s => [\n", segp->name);
    PackFile_ConstTable_dump(interpreter,
            (struct PackFile_ConstTable *)segp);
    PIO_printf(interpreter, "],\n");
}

/*

static void
fixup_dump(Interp *interpreter, struct PackFile_Segment *segp)

Dump the fix-up table.

*/

static void
fixup_dump (Interp *interpreter, struct PackFile_Segment *segp)
{
    PIO_printf(interpreter, "%s => [\n", segp->name);
    PackFile_Fixup_dump(interpreter,
            (struct PackFile_FixupTable *)segp);
    PIO_printf(interpreter, "],\n");
}

/*

static void
disas_dump(Interp *interpreter, struct PackFile_Segment *self)

Disassemble and dump.

*/

static void
disas_dump (Interp *interpreter, struct PackFile_Segment *self)
{
    opcode_t *pc;
    size_t i;
    PIO_printf(interpreter, "%s => [ # %d ops at offs 0x%x\n",
            self->name, (int)self->size, (int)self->file_offset + 4);
    pc = self->data;
    while (pc < self->data + self->size) {
        /* trace_op_dump(interpreter, self->pf->src, pc); */
        PIO_printf(interpreter, " %04x:  ", (int) (pc - self->data));
        for (i = 0; i < 6; i++)
            if (i < (size_t)interpreter->op_info_table[*pc].arg_count)
                PIO_printf(interpreter, "%08lx ", (unsigned long) pc[i]);
            else
                PIO_printf(interpreter, "         ");
        PIO_printf(interpreter, "%s\n",
                interpreter->op_info_table[*pc].full_name);
        pc += interpreter->op_info_table[*pc].arg_count;
    }
    PIO_printf(interpreter, "]\n");
}

/*

static void
PackFile_header_dump(Interp *interpreter, struct PackFile *pf)

Dump the header.

*/

static void
PackFile_header_dump(Interp *interpreter, struct PackFile *pf)
{
    PIO_printf(interpreter, "HEADER => [\n");
    PIO_printf(interpreter, "\twordsize  = %d", pf->header->wordsize);
    PIO_printf(interpreter, "\t(interpreter's wordsize    = %d)\n",
            sizeof(opcode_t));
    PIO_printf(interpreter, "\tint_size  = %d", pf->header->intvalsize);
    PIO_printf(interpreter, "\t(interpreter's INTVAL size = %d)\n",
            sizeof(INTVAL));
    PIO_printf(interpreter, "\tbyteorder = %d", pf->header->byteorder);
    PIO_printf(interpreter, "\t(interpreter's byteorder   = %d)\n",
            PARROT_BIGENDIAN);
    PIO_printf(interpreter, "\tfloattype = %d", pf->header->floattype);
    PIO_printf(interpreter, "\t(interpreter's NUMVAL_SIZE = %d)\n",NUMVAL_SIZE);
    PIO_printf(interpreter, "\t%s endianize, %s opcode, %s numval transform\n",
            pf->need_endianize ? "**need**" : "no",
            pf->need_wordsize ? "**need**" : "no",
            pf->fetch_nv ? "**need**" : "no");
    PIO_printf(interpreter, "\tdirformat = %d\n", pf->header->dir_format);
    PIO_printf(interpreter, "]\n");
}

/*

static void help(void)

Print out the user help info.

*/

static void help(void)
{
    printf("pdump - dump or convert parrot bytecode (PBC) files\n");
    printf("usage:\n");
    printf("pdump [-tdh] [--terse|--disassemble|--header-only] file.pbc\n");
    printf("pdump -o converted.pbc file.pbc\n\n");
    printf("\t-d ... disassemble bytecode segments\n");
    printf("\t-h ... dump header only\n");
    printf("\t-t ... terse output\n");
    printf("\n\t-o converted.pbc repacks a PBC file into platforms native\n");
    printf("\t   binary format for better efficiency on reading "
           "non native PBCs\n");
    exit(0);
}

static struct longopt_opt_decl options[] = {
    { 'h', 'h', 0,       { "--header-only" } },
    { '?', '?', 0, { "--help" } },
    { 't', 't', 0, { "--terse" } },
    { 'd', 'd', 0, { "--disassemble" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output" } }
};

/*

int
main(int argc, char **argv)

The run loop. Process the command-line arguments and dumps accordingly.

*/

int
main(int argc, char **argv)
{
    struct PackFile *pf;
    Interp *interpreter;
    int terse = 0;
    int disas = 0;
    int convert = 0;
    int header = 0;
    const char *file;
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;

    if (argc < 2) {
        help();
    }
    interpreter = make_interpreter(NULL, PARROT_NO_FLAGS);
    Parrot_init(interpreter);
    while ((status = longopt_get(interpreter,
                    argc, argv, options, &opt)) > 0) {
        switch (opt.opt_id) {
            case 'h':
                header = 1;
                break;
            case 't':
                terse = 1;
                break;
            case 'd':
                disas = 1;
                break;
            case 'o':
                file = opt.opt_arg;
                convert = 1;
                break;
            case '?':
                help();
                break;
        }
    }
    if (status == -1) {
        help();
    }
    argc -= opt.opt_index;
    argv += opt.opt_index;


    pf = Parrot_readbc(interpreter, *argv);

    if (!pf) {
        printf("Can't read PBC\n");
        return 1;
    }
    Parrot_loadbc(interpreter, pf);
    if (convert) {
        size_t size;
        opcode_t *pack;
        FILE *fp;

        size = PackFile_pack_size(interpreter,
                interpreter->code->base.pf) * sizeof(opcode_t);
        pack = (opcode_t*) mem_sys_allocate(size);
        if (!pack) {
            printf("out of mem\n");
            exit(1);
        }
        PackFile_pack(interpreter, interpreter->code->base.pf, pack);
        if (strcmp (file, "-") == 0)
            fp = stdout;
        else if ((fp = fopen(file, "wb")) == 0) {
            printf("Couldn't open %s\n", file);
            exit(1);
        }

        if ((1 != fwrite(pack, size, 1, fp)) ) {
            printf("Couldn't write %s\n", file);
            exit(1);
        }
        fclose(fp);
        mem_sys_free(pack);
        Parrot_exit(0);
    }

    PackFile_header_dump(interpreter, pf);
    if (header) {
        Parrot_exit(0);
    }
    /* install a dumper function */
    if (!terse) {
        pf->PackFuncs[PF_CONST_SEG].dump = const_dump;
        pf->PackFuncs[PF_FIXUP_SEG].dump = fixup_dump;
    }
    if (disas)
        pf->PackFuncs[PF_BYTEC_SEG].dump = disas_dump;
    /* do a directory dump, which dumps segs then */
    PackFile_Segment_dump(interpreter, &pf->directory.base);

    Parrot_exit(0);
    return 0;
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
