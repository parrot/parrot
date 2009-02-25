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
    Parrot_Run_core_t runcore = PARROT_FAST_CORE;

    i = 1;

options:
    if (i >= argc)
        fail("No file to load");

    if (strcmp(argv[i], "--start") == 0) {
        ++i;
        if (i >= argc)
            fail("Option needs argument");
        stname = argv[i];
        ++i;
        goto options;
    }
    if (strcmp(argv[i], "--runcore") == 0) {
        ++i;
        if (i >= argc)
                fail("Option needs argument");
        if (strcmp(argv[i], "slow") == 0)
            runcore = PARROT_SLOW_CORE;
        else if (strcmp(argv[i], "fast") == 0)
            runcore = PARROT_FAST_CORE;
        else if (strcmp(argv[i], "cgoto") == 0)
            runcore = PARROT_CGOTO_CORE;
        else if (strcmp(argv[i], "jit") == 0)
            runcore = PARROT_JIT_CORE;
        else if (strcmp(argv[i], "gcdebug") == 0)
            runcore = PARROT_GC_DEBUG_CORE;
        else
            fail("Invalid runcore");
    
        ++i;
        goto options;
    }

    Parrot_set_run_core(interp, runcore);

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
        discard = Parrot_call_sub(interp, start, "v");
    }
    else {
        Parrot_runcode(interp, argc - i, argv + i);
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
