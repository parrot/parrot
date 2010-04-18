/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

pbc_dump - Dump or convert Parrot bytecode (PBC) files

=head1 SYNOPSIS

 pbc_dump [-tdh] [--terse|--disassemble|--header-only] file.pbc

 pbc_dump -o converted.pbc file.pbc

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

=item C<-D> C--debug> 1-7

Display detailed packfile reader debugging information if
F<include/parrot/packfile.h> enables TRACE_PACKFILE.

  1  print general debug info
  2  print alignment info
  4  print values

=item C<-o converted.pbc>

Repacks a PBC file into the platform's native binary format for better
efficiency on reading non-native PBCs.

=back

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/oplib/ops.h"

/*

=item C<static void const_dump(PARROT_INTERP, const PackFile_Segment *segp)>

Dump the constant table.

=cut

*/

static void
const_dump(PARROT_INTERP, const PackFile_Segment *segp)
{
    Parrot_io_printf(interp, "%Ss => [\n", segp->name);
    PackFile_ConstTable_dump(interp, (const PackFile_ConstTable *)segp);
    Parrot_io_printf(interp, "],\n");
}


/*

=item C<static void fixup_dump(PARROT_INTERP, const PackFile_Segment *segp)>

Dump the fixup table.

=cut

*/

static void
fixup_dump(PARROT_INTERP, const PackFile_Segment *segp)
{
    Parrot_io_printf(interp, "%Ss => [\n", segp->name);
    PackFile_Fixup_dump(interp, (const PackFile_FixupTable *)segp);
    Parrot_io_printf(interp, "],\n");
}


/*

=item C<static void disas_dump(PARROT_INTERP, const PackFile_Segment *self)>

Disassemble and dump.

=cut

*/

static void
disas_dump(PARROT_INTERP, const PackFile_Segment *self)
{
    opcode_t *pc = self->data;

    Parrot_io_printf(interp, "%Ss => [ # %d ops at offs 0x%x\n",
            self->name, (int)self->size, (int)self->file_offset + 4);

    while (pc < self->data + self->size) {
        /* n can't be const; the ADD_OP_VAR_PART macro increments it */
        size_t n = (size_t)interp->op_info_table[*pc].op_count;
        size_t i;

        /* trace_op_dump(interp, self->pf->src, pc); */
        Parrot_io_printf(interp, " %04x:  ", (int)(pc - self->data));

        for (i = 0; i < 6; i++)
            if (i < n)
                Parrot_io_printf(interp, "%08lx ", (unsigned long)pc[i]);
            else
                Parrot_io_printf(interp, "         ");

        Parrot_io_printf(interp, "%s\n",
                interp->op_info_table[*pc].full_name);

        ADD_OP_VAR_PART(interp, interp->code, pc, n);
        pc += n;
    }

    Parrot_io_printf(interp, "]\n");
}


/*

=item C<static void PackFile_header_dump(PARROT_INTERP, PackFile *pf)>

Dump the header.

=cut

*/

static void
PackFile_header_dump(PARROT_INTERP, PackFile *pf)
{
    Parrot_io_printf(interp, "HEADER => [\n");
    Parrot_io_printf(interp, "\twordsize  = %d", pf->header->wordsize);
    Parrot_io_printf(interp, "\t(interpreter's wordsize/INTVAL = %d/%d)\n",
                     sizeof (opcode_t), sizeof (INTVAL));
    Parrot_io_printf(interp, "\tbyteorder = %d", pf->header->byteorder);
    Parrot_io_printf(interp, "\t(interpreter's byteorder       = %d)\n",
            PARROT_BIGENDIAN);
    Parrot_io_printf(interp, "\tfloattype = %d", pf->header->floattype);
    Parrot_io_printf(interp, "\t(interpreter's NUMVAL_SIZE     = %d)\n",
            NUMVAL_SIZE);
    Parrot_io_printf(interp, "\tparrot-version %d.%d.%d, "
            "bytecode-version %d.%d\n",
            pf->header->major, pf->header->minor, pf->header->patch,
            pf->header->bc_major, pf->header->bc_minor);
    Parrot_io_printf(interp, "\tUUID: type = %d, size = %d",
            pf->header->uuid_type, pf->header->uuid_size);

    if (pf->header->uuid_size)
        Parrot_io_printf(interp, ", '%s'\n", pf->header->uuid_data);
    else
        Parrot_io_printf(interp, "\n");

    Parrot_io_printf(interp, "\t%s endianize, %s opcode, %s numval transform\n",
            pf->need_endianize ? "**need**" : "no",
            pf->need_wordsize  ? "**need**" : "no",
            pf->fetch_nv       ? "**need**" : "no");

    Parrot_io_printf(interp, "\tdirformat = %d\n", pf->header->dir_format);
    Parrot_io_printf(interp, "]\n");
}


/*

=item C<static void help(void)>

Print out the user help info.

=cut

*/

static void help(void)
{
    printf("pbc_dump - dump or convert parrot bytecode (PBC) files\n");
    printf("usage:\n");
    printf("pbc_dump [-tdh] [--terse|--disassemble|--header-only] file.pbc\n");
    printf("pbc_dump -o converted.pbc file.pbc\n\n");
    printf("\t-d ... disassemble bytecode segments\n");
    printf("\t-h ... dump header only\n");
    printf("\t-t ... terse output\n");

#if TRACE_PACKFILE
    printf("\t-D<1-7> --debug debug output\n");
    printf("\t   1 general info\n");
    printf("\t   2 alignment\n");
    printf("\t   4 values\n");
#endif

    printf("\t-o converted.pbc ... repacks a PBC file into "
           "the platform's native\n");
    printf("\t   binary format for better efficiency on reading "
           "non native PBCs\n");
    exit(EXIT_SUCCESS);
}

static struct longopt_opt_decl opt_options[] = {
    { 'h', 'h', OPTION_optional_FLAG, { "--header-only" } },
    { '?', '?', OPTION_optional_FLAG, { "--help"        } },
    { 't', 't', OPTION_optional_FLAG, { "--terse"       } },
    { 'd', 'd', OPTION_optional_FLAG, { "--disassemble" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output"      } }

#if TRACE_PACKFILE
    { 'D', 'D', OPTION_required_FLAG, { "--debug"       } },
#endif
};


/*

=item C<int main(int argc, const char **argv)>

The run loop. Process the command-line arguments and dump accordingly.

=cut

*/

int
main(int argc, const char **argv)
{
    PackFile   *pf;
    Interp     *interp;

    const char *file            = NULL;
    int         terse           = 0;
    int         disas           = 0;
    int         convert         = 0;
    int         options         = PFOPT_UTILS;

    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;

    int         status;

    if (argc < 2)
        help();

    interp = Parrot_new(NULL);

    /* init and set top of stack */
    Parrot_init_stacktop(interp, &status);

    while ((status = longopt_get(interp, argc, argv, opt_options, &opt)) > 0) {
        switch (opt.opt_id) {
#if TRACE_PACKFILE
          case 'D':
            options += atoi(opt.opt_arg) << 2;
            break;
#endif
          case 'h':
            options += PFOPT_HEADERONLY;
            break;
          case 't':
            terse = 1;
            break;
          case 'd':
            disas = 1;
            break;
          case 'o':
            file    = opt.opt_arg;
            convert = 1;
            break;
          case '?':
          default:
            help();
            break;
        }
    }

    if (status == -1)
        help();

    argc -= opt.opt_index;
    argv += opt.opt_index;

    pf = Parrot_pbc_read(interp, *argv, options);

    if (!pf) {
        printf("Can't read PBC\n");
        return 1;
    }

    Parrot_pbc_load(interp, pf);

    if (convert) {
        size_t   size  = PackFile_pack_size(interp,
                            interp->code->base.pf) * sizeof (opcode_t);
        opcode_t *pack = (opcode_t *)Parrot_gc_allocate_memory_chunk(interp,
                                        size);
        FILE *fp;

        if (!pack) {
            printf("out of mem\n");
            exit(EXIT_FAILURE);
        }

        PackFile_pack(interp, interp->code->base.pf, pack);

        if (STREQ(file, "-"))
            fp = stdout;
        else if ((fp = fopen(file, "wb")) == 0) {
            printf("Couldn't open %s\n", file);
            exit(EXIT_FAILURE);
        }

        if ((1 != fwrite(pack, size, 1, fp))) {
            printf("Couldn't write %s\n", file);
            exit(EXIT_FAILURE);
        }

        fclose(fp);
        Parrot_gc_free_memory_chunk(interp, pack);
        Parrot_exit(interp, 0);
    }

    PackFile_header_dump(interp, pf);

    if (options & PFOPT_HEADERONLY)
        Parrot_exit(interp, 0);

    /* install a dumper function */
    if (!terse) {
        pf->PackFuncs[PF_CONST_SEG].dump = const_dump;
        pf->PackFuncs[PF_FIXUP_SEG].dump = fixup_dump;
    }

    if (disas)
        pf->PackFuncs[PF_BYTEC_SEG].dump = disas_dump;

    /* do a directory dump, which dumps segs then */
    PackFile_Segment_dump(interp, &pf->directory.base);

    Parrot_exit(interp, 0);
}


/*

=back

=head1 SEE ALSO

F<src/packdump.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
