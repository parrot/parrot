/*
Copyright (C) 2009, Parrot Foundation.
$Id$

A parrot embedding test
'lorito' is 'little parrot' in spanish
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parrot/embed.h"
#include "parrot/extend.h"

/**********************************************************************/

void fail(const char *msg);
int lorito_main(Parrot_Interp interp, int argc, char **argv);

/**********************************************************************/

void fail(const char *msg)
{
    fprintf(stderr, "lorito failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

/**********************************************************************/

int lorito_main(Parrot_Interp interp, int argc, char **argv)
{
    char *source;
    Parrot_PackFile pf;
    if (argc < 2)
        fail("no args");
    source = argv[1];

    pf = Parrot_pbc_read(interp, source, 0);
    if (! pf)
        fail("Cannot load file");
    Parrot_pbc_load(interp, pf);

    Parrot_runcode(interp, argc - 1, argv + 1);

    return 0;
}

int main(int argc, char **argv)
{
    Parrot_Interp interp;
    int r;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    Parrot_set_executable_name(interp, Parrot_new_string(interp,
            argv[0], strlen(argv[0]), (const char *) NULL, 0));
    Parrot_setwarnings(interp, PARROT_WARNINGS_ALL_FLAG);

    r = lorito_main(interp, argc, argv);

    Parrot_destroy(interp);
    return r;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
