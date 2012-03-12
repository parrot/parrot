/*
Copyright (C) 2001-2012, Parrot Foundation.

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

=item C<-o converted.pbc>

Repacks a PBC file into the platform's native binary format for better
efficiency on reading non-native PBCs.

=back

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/longopt.h"
#include "parrot/oplib/ops.h"
#include "parrot/oplib/core_ops.h"

/* HEADERIZER HFILE: none */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void const_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *segp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void disas_dump(PARROT_INTERP, const PackFile_Segment *self)
        __attribute__nonnull__(1);

static void help(void);
static void null_dir_dump(PARROT_INTERP, const PackFile_Segment *self)
        __attribute__nonnull__(1);

static void null_dump(PARROT_INTERP, const PackFile_Segment *self);
static void nums_dump(PARROT_INTERP, const PackFile_Segment *self)
        __attribute__nonnull__(1);

static void PackFile_header_dump(PARROT_INTERP, PackFile *pf)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_const_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(segp))
#define ASSERT_ARGS_disas_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_null_dir_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_null_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_nums_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_header_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static void const_dump(PARROT_INTERP, const PackFile_Segment *segp)>

Dump the constant table.

=cut

*/

static void
const_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *segp))
{
    Parrot_io_printf(interp, "%Ss => [\n", segp->name);
    PackFile_ConstTable_dump(interp, (const PackFile_ConstTable *)segp);
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
    const opcode_t *pc = self->data;
    const PackFile_ByteCode_OpMapping *map = &((const PackFile_ByteCode *)self)->op_mapping;
    INTVAL i;

    Parrot_io_printf(interp, "%Ss => [ # %d ops at offs 0x%x\n",
            self->name, (int)self->size, (int)self->file_offset + 4);

    for (i = 0; i < map->n_libs; i++) {

        INTVAL j;
        PackFile_ByteCode_OpMappingEntry *entry = &map->libs[i];
        Parrot_io_printf(interp, "  map #%d => [\n", i);
        Parrot_io_printf(interp, "    oplib: \"%s\" version %d.%d.%d (%d ops)\n",
                entry->lib->name,
                entry->lib->major_version,
                entry->lib->minor_version,
                entry->lib->patch_version,
                entry->n_ops);

        for (j = 0; j < map->libs[i].n_ops; j++) {
            const INTVAL lib_num   = entry->lib_ops[j];
            const INTVAL table_num = entry->table_ops[j];
            Parrot_io_printf(interp, "    %08lx => %08lx (%s)\n", table_num, lib_num,
                    entry->lib->op_info_table[lib_num].full_name);
        }
        Parrot_io_printf(interp, "  ]\n");
    }

    while (pc < self->data + self->size) {
        /* n can't be const; the ADD_OP_VAR_PART macro increments it */
        size_t n = (size_t)interp->code->op_info_table[*pc]->op_count;
        size_t j;

        /* trace_op_dump(interp, self->pf->src, pc); */
        Parrot_io_printf(interp, " %04x:  ", (int)(pc - self->data));

        for (j = 0; j < 6; ++j) {
            if (j < n)
                Parrot_io_printf(interp, "%08lx ", (unsigned long)pc[j]);
            else
                Parrot_io_printf(interp, "         ");
        }

        Parrot_io_printf(interp, "%s\n",
                interp->code->op_info_table[*pc]->full_name);

        ADD_OP_VAR_PART(interp, interp->code, pc, n);
        pc += n;
    }

    Parrot_io_printf(interp, "]\n");
}


/*

=item C<static void nums_dump(PARROT_INTERP, const PackFile_Segment *self)>

Disassembles and dumps op names and line numbers only.

=cut

*/

static void
nums_dump(PARROT_INTERP, const PackFile_Segment *self)
{
    const STRING           *debug_name = Parrot_str_concat(interp, self->name,
            Parrot_str_new_constant(interp, "_DB"));
    const PackFile_Segment *debug      = PackFile_find_segment(interp,
                                            self->dir, debug_name, 1);

    opcode_t   * pc            = self->data;
    opcode_t   * debug_ops     = debug->data;
    op_info_t ** const op_info = interp->code->op_info_table;

    while (pc < self->data + self->size) {
        /* n can't be const; the ADD_OP_VAR_PART macro increments it */
        size_t n = (size_t)op_info[*pc]->op_count;

        Parrot_io_printf(interp, " %04x:  %s\n",
            *(debug_ops++), op_info[*pc]->full_name);

        ADD_OP_VAR_PART(interp, interp->code, pc, n);
        pc += n;
    }
}


/*

=item C<static void null_dump(PARROT_INTERP, const PackFile_Segment *self)>

Produces no output for the given segment type.

=cut

*/

static void
null_dump(SHIM_INTERP, const PackFile_Segment *self)
{
    UNUSED(self);
}


/*

=item C<static void null_dir_dump(PARROT_INTERP, const PackFile_Segment *self)>

Dumps all of the segments of the given PackFile_Directory, but produces no
output for the directory itself.

=cut

*/

static void
null_dir_dump(PARROT_INTERP, const PackFile_Segment *self)
{
    const PackFile_Directory * const dir = (const PackFile_Directory *)self;
    size_t i;

    for (i = 0; i < dir->num_segments; ++i)
        self->pf->PackFuncs[dir->segments[i]->type].dump(interp, dir->segments[i]);
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

static void
help(void)
{
    printf("pbc_dump - dump or convert parrot bytecode (PBC) files\n");
    printf("usage:\n");
    printf("pbc_dump [-tdh] [--terse|--disassemble|--header-only|--line-nums]"
           " file.pbc\n");
    printf("pbc_dump -o converted.pbc file.pbc\n\n");
    printf("\t-d ... disassemble bytecode segments\n");
    printf("\t-h ... dump header only\n");
    printf("\t-t ... terse output\n");
    printf("\t-n ... show ops and line numbers only\n");

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
    { 'n', 'n', OPTION_optional_FLAG, { "--line-nums"   } },
    { 'd', 'd', OPTION_optional_FLAG, { "--disassemble" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output"      } },
    { 0,    0,  OPTION_optional_FLAG, { NULL            } }
};


/*

=item C<int main(int argc, const char **argv)>

The run loop. Process the command-line arguments and dump accordingly.

=cut

*/

int
main(int argc, const char **argv)
{
    Parrot_PackFile  pfpmc;
    PackFile        *pf;
    Interp          *interp;
    Parrot_String   infilename;

    const char *file            = NULL;
    int         terse           = 0;
    int         disas           = 0;
    int         convert         = 0;
    int         nums_only       = 0;
    int         options         = PFOPT_UTILS;

    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;

    int         status;

    if (argc < 2)
        help();

    interp = Parrot_interp_new(NULL);

    /* init and set top of stack */
    Parrot_interp_init_stacktop(interp, &status);

    while ((status = longopt_get(argc, argv, opt_options, &opt)) > 0) {
        switch (opt.opt_id) {
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
          case 'n':
            nums_only = 1;
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

    infilename = Parrot_str_new(interp, *argv, 0);
    pf = Parrot_pf_read_pbc_file(interp, infilename);

    if (pf == NULL) {
        printf("Can't read PBC\n");
        return 1;
    }

    pfpmc = Parrot_pf_get_packfile_pmc(interp, pf, infilename);
    Parrot_pf_set_current_packfile(interp, pfpmc);

    if (convert) {
        const size_t size = PackFile_pack_size(interp,
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
        Parrot_x_exit(interp, 0);
    }

    if (!nums_only)
        PackFile_header_dump(interp, pf);

    if (options & PFOPT_HEADERONLY)
        Parrot_x_exit(interp, 0);

    /* install a dumper function */
    if (!terse) {
        pf->PackFuncs[PF_CONST_SEG].dump = const_dump;
    }

    if (disas)
        pf->PackFuncs[PF_BYTEC_SEG].dump = disas_dump;

    if (nums_only) {
        int i;

        for (i = PF_DIR_SEG + 1; i < PF_MAX_SEG; ++i)
            pf->PackFuncs[i].dump = null_dump;

        pf->PackFuncs[PF_DIR_SEG].dump   = null_dir_dump;
        pf->PackFuncs[PF_BYTEC_SEG].dump = nums_dump;
    }

    /* do a directory dump, which dumps segs then */
    PackFile_Segment_dump(interp, &pf->directory.base);

    Parrot_x_exit(interp, 0);
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
