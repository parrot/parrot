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
Parrot_String create_string(Parrot_Interp interp, const char *name);
int lorito_main(Parrot_Interp interp, int argc, char **argv);

/**********************************************************************/

/* Auxiliary functions */

void fail(const char *msg)
{
    fprintf(stderr, "lorito failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

Parrot_String create_string(Parrot_Interp interp, const char *name)
{
    return Parrot_new_string(interp, name, strlen(name), (const char *) NULL, 0);
}

/**********************************************************************/

int lorito_main(Parrot_Interp interp, int argc, char **argv)
{
    char *source;
    Parrot_PackFile pf;
    const char * stname = NULL;
    int i;

    if (argc < 2)
        fail("no args");
    i = 1;
    if (strcmp(argv[i], "--start") == 0) {
        ++i;
	if (i >= argc)
            fail("Option needs argument");
	stname = argv[i];
	++i;
    }
    source = argv[i];

    pf = Parrot_pbc_read(interp, source, 0);
    if (! pf)
        fail("Cannot load file");
    Parrot_pbc_load(interp, pf);

    if (stname) {
        Parrot_PMC rootns = Parrot_get_root_namespace(interp);
	Parrot_String parrotname = create_string(interp, "parrot");
        Parrot_PMC parrotns = Parrot_PMC_get_pmc_strkey(interp, rootns, parrotname);
        Parrot_String name = create_string(interp, stname);
        Parrot_PMC start = Parrot_PMC_get_pmc_strkey(interp, parrotns, name);
        void *discard;
        discard = Parrot_call_sub(interp, start, "");
    }
    else {
        Parrot_runcode(interp, argc - 1, argv + 1);
    }

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
