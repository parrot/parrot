/*
 * disassemble.c
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    Parrot disassembler
 * History:
 *      Initial version by Daniel Grunblatt on 2002.5.26
 * Notes:
 * References:
 */

#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define na(c) { \
    while(*c && !isspace(*c)) \
        c++; }

int
main(int argc, char *argv[])
{
    Parrot_Interp interpreter;
    char *filename, *disassemble;
    Parrot_PackFile pf;

    interpreter = Parrot_new();

    if (!interpreter) {
        return 1;
    }

    Parrot_init(interpreter, (void *)&interpreter);

    if (argc != 2) {
        fprintf(stderr, "Usage: disassemble programfile \n");
        exit(1);
    }

    na(argv[0]);
    filename = &(*argv)[1];

    pf = Parrot_readbc(interpreter, filename);

    if (!pf) {
        return 1;
    }

    Parrot_loadbc(interpreter, pf);

    Parrot_disassemble(interpreter);

    Parrot_destroy(interpreter);

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
