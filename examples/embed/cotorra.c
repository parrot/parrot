/*
Copyright (C) 2009-2010, Parrot Foundation.
$Id$

=head1 NAME

cotorra - A parrot embedding test

=head1 SYNOPSIS

cotorra file.pbc

=head1 DESCRIPTION

A test of parrot embedding in a C program.

Is a simplified form of the parrot main executable, with just a few
options and able to run only pbc files.

=cut

*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parrot/embed.h"
#include "parrot/extend.h"

/**********************************************************************/

void fail(const char *msg);
unsigned int getuintval(const char *s);
Parrot_Run_core_t getruncore(const char *name);

Parrot_String create_string(Parrot_Interp interp, const char *name);
int cotorra_main(Parrot_Interp interp, int argc, const char **argv);

/**********************************************************************/

/*

=head2 Functions

=over 4

=cut

*/

/* Auxiliary generic functions */

/*

=item C<void fail(const char *msg)>

Fatal error, print the msg to stderr and exit.

=cut

*/

void fail(const char *msg)
{
    fprintf(stderr, "cotorra failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

/*

=item C<unsigned int getuintval(const char *s)>

Get an unsigned int value from a C string.
Fails on invalid argument.

=cut

*/

unsigned int getuintval(const char *s)
{
    char *aux;
    unsigned long int n = strtoul(s, &aux, 0);
    if (*aux != '\0')
        fail("Invalid number");
    return n;
}

struct runcoreinfo {
    Parrot_Run_core_t id;
    const char *name;
};

/*

=item C<Parrot_Run_core_t getruncore(const char *name)>

Get a runcore id from his name.
Fails on invalid argument.

=cut

*/

Parrot_Run_core_t getruncore(const char *name)
{
    static const struct runcoreinfo cores [] = {
        { PARROT_SLOW_CORE,     "slow" },
        { PARROT_GC_DEBUG_CORE, "gcdebug" },
    };
    static const unsigned int n = sizeof (cores)/sizeof (struct runcoreinfo);
    unsigned int i;
    for (i= 0; i < n; ++i) {
        if (strcmp(name, cores[i].name) == 0)
            break;
    }
    if (i >= n)
        fail("Invalid runcore");
    return cores[i].id;
}

/**********************************************************************/

/* Auxiliary parrot functions */

/*

=item C<Parrot_String create_string(Parrot_Interp interp, const char *name)>

Auxiliary function to shorten Parrot String creation,

=cut

*/

Parrot_String create_string(Parrot_Interp interp, const char *name)
{
    return Parrot_new_string(interp, name, strlen(name), (const char *) NULL, 0);
}

/**********************************************************************/

/*

=item C<int cotorra_main(Parrot_Interp interp, int argc, const char **argv)>

Auxiliary function to minimize the size of main.

=cut

*/

int cotorra_main(Parrot_Interp interp, int argc, const char **argv)
{
    const char *source;
    Parrot_PackFile pf;
    const char *stname = NULL;
    const char *exec = NULL;
    const char *module = NULL;
    int i;

    /* Incompatible options are not checked yet */
    for (i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "--trace") == 0) {
            ++i;
            if (i >= argc)
                fail("Option needs argument");
            Parrot_set_trace(interp, getuintval(argv[i]));
        }
        else if (strcmp(argv[i], "--warnings") == 0) {
            ++i;
            if (i >= argc)
                fail("Option needs argument");
            Parrot_setwarnings(interp, getuintval(argv[i]));
        }
        else if (strcmp(argv[i], "-e") == 0) {
            ++i;
            if (i >= argc)
                fail("Option needs argument");
            exec = argv[i];
        }
        else if (strcmp(argv[i], "--start") == 0) {
            ++i;
            if (i >= argc)
                fail("Option needs argument");
            stname = argv[i];
        }
        else if (strcmp(argv[i], "--load") == 0) {
            ++i;
            if (i >= argc)
                fail("Option needs argument");
            module = argv[i];
        }
        else if (strcmp(argv[i], "--runcore") == 0) {
            ++i;
            if (i >= argc)
                fail("Option needs argument");
            Parrot_set_run_core(interp, getruncore(argv[i]));
        }
        else
            break;
    }
    if (module)
        Parrot_load_bytecode(interp, create_string(interp, module));

    if (exec) {
        Parrot_String compiler = create_string(interp, "PIR");
        Parrot_String errstr;
        Parrot_PMC code = Parrot_compile_string(interp, compiler, exec, &errstr);
        Parrot_ext_call(interp, code, "->");
        return 0;
    }

    if (i >= argc && ! (module && stname))
        fail("No file to load");
    source = argv[i];
    if (source && ! stname) {
        pf = Parrot_pbc_read(interp, source, 0);
        if (! pf)
            fail("Cannot load file");
        Parrot_pbc_load(interp, pf);
        Parrot_pbc_fixup_loaded(interp);
    }

    if (stname) {
        Parrot_PMC rootns = Parrot_get_root_namespace(interp);
        Parrot_String parrotname = create_string(interp, "parrot");
        Parrot_PMC parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns, parrotname);
        Parrot_String name = create_string(interp, stname);
        Parrot_PMC start = Parrot_PMC_get_pmc_keyed_str(interp, parrotns, name);
        if (Parrot_pmc_is_null(interp, start))
            fail("start sub not found");
        if (i < argc) {
            int pos;
            Parrot_PMC arg = Parrot_PMC_new(interp,
                    Parrot_PMC_typenum(interp, "FixedStringArray"));
            Parrot_PMC_set_integer_native(interp, arg, argc - i);
            for (pos = 0; i < argc; ++i, ++pos) {
                Parrot_PMC_set_string_keyed_int(interp, arg, pos, create_string(interp, argv[i]));
            }
            Parrot_ext_call(interp, start, "P->", arg);
        }
        else
            Parrot_ext_call(interp, start, "->");
    }
    else {
        Parrot_runcode(interp, argc - i, argv + i);
    }

    return 0;
}

/*

=item C<int main(int argc, const char **argv)>

Main function. Create the parrot interpreter and call cotorra_main.

=cut

*/

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    int r;

    Parrot_set_config_hash();
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    Parrot_set_executable_name(interp, create_string(interp, argv[0]));

    r = cotorra_main(interp, argc, argv);

    Parrot_destroy(interp);
    return r;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
