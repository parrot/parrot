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

#include "parrot/packfile.h"
#include "parrot/interpreter.h"

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
    PIO_printf(interpreter, "\tdirformat = %d\n", pf->header->dir_format);
    PIO_printf(interpreter, "]\n");
}

int
main(int argc, char **argv)
{
    struct stat file_stat;
    int fd;
    opcode_t *packed;
    off_t packed_size;
    struct PackFile *pf;
    struct Parrot_Interp *interpreter;
    int terse = 0;
    int disas = 0;
    INTVAL is_mapped = 0;

    if (argc < 2) {
        fprintf(stderr, "pdump: usage: pdump [-t] [-d] FILE\n");
        return 1;
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
        else if (**argv == '-') {
            printf("Unknown option '%s' ignored\n", *argv);
            argc--;
            argv++;
        }
        else
            break;
    }

    if (stat(*argv, &file_stat)) {
        printf("can't stat %s, code %i\n", *argv, errno);
        return 1;
    }
    fd = open(*argv, O_RDONLY | O_BINARY);
    if (!fd) {
        printf("Can't open, error %i\n", errno);
        return 1;
    }

    interpreter = make_interpreter(NO_FLAGS);
    Parrot_init(interpreter, (void *)&file_stat);

    packed_size = file_stat.st_size;

#ifndef HAS_HEADER_SYSMMAN
    packed = (opcode_t *)mem_sys_allocate(packed_size);

    if (!packed) {
        printf("Can't allocate, code %i\n", errno);
        return 1;
    }

    read(fd, (void *)packed, packed_size);
#else
    packed =
        (opcode_t *)mmap(0, packed_size, PROT_READ, MAP_SHARED, fd, (off_t)0);
    is_mapped = 1;

    if (!packed) {
        printf("Can't mmap, code %i\n", errno);
        return 1;
    }
    close(fd);
#endif

    pf = PackFile_new(is_mapped);

    if (!PackFile_unpack(interpreter, pf, (opcode_t *)packed, packed_size)) {
        printf("Can't unpack.\n");
        return 1;
    }
    interpreter->code = pf;

    PackFile_header_dump(interpreter, pf);
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
