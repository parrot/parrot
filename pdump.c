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

int
main(int argc, char **argv)
{
    struct stat file_stat;
    int fd;
    opcode_t *packed;
    off_t packed_size;
    struct PackFile *pf;
    struct Parrot_Interp *interpreter;

    if (argc != 2) {
        fprintf(stderr, "pdump: usage: pdump FILE\n");
        return 1;
    }

    if (stat(argv[1], &file_stat)) {
        printf("can't stat %s, code %i\n", argv[1], errno);
        return 1;
    }
    fd = open(argv[1], O_RDONLY | O_BINARY);
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

    if (!packed) {
        printf("Can't mmap, code %i\n", errno);
        return 1;
    }
#endif

    pf = PackFile_new();

    if (!PackFile_unpack(interpreter, pf, (opcode_t *)packed, packed_size)) {
        printf("Can't unpack.\n");
        return 1;
    }
    PackFile_dump(interpreter, pf);
    Parrot_destroy(interpreter);

    pf = NULL;

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
