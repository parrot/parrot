/*
 * pdb.c
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    The Parrot debugger
 * History:
 *      Initial version by Daniel Grunblatt on 2002.5.19
 * Notes:
 * References:
 */

#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void PDB_printwelcome(void);

#define na(c) { \
    while(*c && !isspace(*c)) \
        c++; }

int
main(int argc, char *argv[])
{
    Parrot_Interp interpreter;
    char *filename;
    Parrot_PackFile pf;

    interpreter = Parrot_new(NULL);

    if (!interpreter) {
        return 1;
    }

    Parrot_init(interpreter);

    if (argc < 2) {
        fprintf(stderr, "Usage: pdb programfile [program-options]\n");
        Parrot_exit(1);
    }

    na(argv[0]);

    filename = &(*argv)[1];

    pf = Parrot_readbc(interpreter, filename);

    if (!pf) {
        return 1;
    }

    Parrot_loadbc(interpreter, pf);
    PDB_printwelcome();
    Parrot_debug(interpreter, argc - 1, argv + 1);
    Parrot_destroy(interpreter);

    return 0;
}

void
PDB_printwelcome()
{
    fprintf(stderr, "Parrot Debugger 0.0.2\n");
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
