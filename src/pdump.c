/* pdump.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     A program to dump pack files to human readable form.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/embed.h"

void PackFile_dump(struct Parrot_Interp *interpreter, struct PackFile *pf);
void PackFile_ConstTable_dump(struct Parrot_Interp *,
                                     struct PackFile_ConstTable *);
static void
const_dump (struct Parrot_Interp *interpreter, struct PackFile_Segment *segp)
{
    PIO_printf(interpreter, "CONST => [\n");
    PackFile_ConstTable_dump(interpreter,
            (struct PackFile_ConstTable *)segp);
    PIO_printf(interpreter, "],\n");
}

static void
disas_dump (struct Parrot_Interp *interpreter, struct PackFile_Segment *self)
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

static void
PackFile_header_dump(struct Parrot_Interp *interpreter, struct PackFile *pf)
{
    PIO_printf(interpreter, "HEADER => [\n");
    PIO_printf(interpreter, "\twordsize  = %d", pf->header->wordsize);
    PIO_printf(interpreter, "\t(interpreter's wordsize    = %d)\n",
            sizeof(opcode_t));
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

static void help(void)
{
    printf("pdump - dump or convert parrot bytecode (PBC) files\n");
    printf("usage:\n");
    printf("pdump [-t] [-d] [-h] file.pbc\n");
    printf("pdump -o converted.pbc file.pbc\n\n");
    printf("\t-d ... disassemble bytecode segments\n");
    printf("\t-h ... dump header only\n");
    printf("\t-t ... terse output\n");
    printf("\n\t-o converted.pbc repacks a PBC file into platforms native\n");
    printf("\t   binary format for better efficiency on reading "
           "non native PBCs\n");
    exit(0);
}

int
main(int argc, char **argv)
{
    struct PackFile *pf;
    struct Parrot_Interp *interpreter;
    int terse = 0;
    int disas = 0;
    int convert = 0;
    int header = 0;
    char *file;

    if (argc < 2) {
        help();
    }
    argc--;
    argv++;
    while (argc > 1) {
        if (strcmp(*argv, "-t") == 0) {
            argc--;
            argv++;
            terse = 1;
        }
        else if (strcmp(*argv, "-d") == 0) {
            argc--;
            argv++;
            disas = 1;
        }
        else if (memcmp(*argv, "-o", 2) == 0) {
            if ((*argv)[2])
                file = *argv+2;
            else {
                argc--;
                argv++;
                if (argc > 1)
                    file = *argv;
                else {
                    fprintf(stderr, "Missing file param\n");
                    exit(1);
                }
            }
            argc--;
            argv++;
            convert = 1;
        }
        else if (strcmp(*argv, "-h") == 0) {
            argc--;
            argv++;
            header = 1;
        }
        else if (strcmp(*argv, "-?") == 0) {
            help();
        }
        else if (**argv == '-') {
            printf("Unknown option '%s' ignored\n", *argv);
            argc--;
            argv++;
        }
        else
            break;
    }

    interpreter = make_interpreter(NO_FLAGS);
    Parrot_init(interpreter, (void *)&terse);

    pf = Parrot_readbc(interpreter, *argv);

    if (!pf) {
        printf("Can't read PBC\n");
        return 1;
    }
    interpreter->code = pf;
    if (convert) {
        size_t size;
        opcode_t *pack;
        FILE *fp;

        size = PackFile_pack_size(interpreter->code) * sizeof(opcode_t);
        pack = (opcode_t*) mem_sys_allocate(size);
        if (!pack) {
            printf("out of mem\n");
            exit(1);
        }
        PackFile_pack(interpreter->code, pack);
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
        free(pack);
        Parrot_exit(0);
    }

    PackFile_header_dump(interpreter, pf);
    if (header) {
        Parrot_exit(0);
    }
    if (pf->header->dir_format == 0)
        PackFile_dump(interpreter, pf);
    else {
        /* install a dumper function */
        if (!terse)
            pf->PackFuncs[PF_CONST_SEG].dump = const_dump;
        if (disas)
            pf->PackFuncs[PF_BYTEC_SEG].dump = disas_dump;
        /* do a directory dump, which dumps segs then */
        PackFile_Segment_dump(interpreter,
                (struct PackFile_Segment *)pf->directory);
    }

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
