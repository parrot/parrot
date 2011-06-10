/* Copyright (C) 2001-2011, Parrot Foundation. */

/*

=head1 NAME

hbdb - The Honey Bee Debugger

=head1 SYNOPSIS

hbdb [options] [file]

=head1 DESCRIPTION

The Honey Bee Debugger (hbdb) is the standard debugger for the Parrot virtual
machine.

=head1 OPTIONS

=over 4

=item B<-h>, B<--help>

Displays help information.

=item B<-l>, B<--license>

Displays license information.

=back

=head1 STATIC FUNCTIONS

=over 4

=cut

*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "parrot/parrot.h"
#include "parrot/api.h"
#include "parrot/longopt.h"
#include "imcc/api.h"

static void fail         (Parrot_PMC interp);
static void license      (void);
static void load_bytecode(Parrot_PMC interp, const char * const file, Parrot_PMC *pbc);
static void usage        (void);
static void welcome      (void);

static struct longopt_opt_decl options[] = {
    { 'h', 'h', OPTION_optional_FLAG, { "--help"    } },
    { 'l', 'l', OPTION_optional_FLAG, { "--license" } },
    {   0,   0, OPTION_optional_FLAG, { NULL        } }
};

/*

=item C<int main(int argc, char *argv[])>

Entry point of C<hbdb>.

=cut

*/

int
main(int argc, const char *argv[])
{
    const char             *file;
    int                     status;
    struct longopt_opt_info opt      = LONGOPT_OPT_INFO_INIT;

    hbdb_t                 *hbdb;

    Parrot_PMC              interp   = NULL,
                            pbc      = NULL,
                            main_sub = NULL;
    Parrot_Init_Args       *initargs = NULL;

    /* Parse command-line arguments */
    while ((status = longopt_get(argc, argv, options, &opt)) > 0) {
        switch(opt.opt_id) {
            case 'l':
                license();
                exit(EXIT_SUCCESS);
                break;
            case 'h':
                /* Fall through is intentional */
            default:
                usage();
                break;
        }
    }

    /* Setup default initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter */
    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fail(NULL);
    }

    /* Register hbdb runcore */
    if (!Parrot_api_set_runcore(interp, "hbdb", 0)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Set executable name to "hbdb" */
    if (!Parrot_api_set_executable_name(interp, argv[0])) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Initialize debugger */
    if (!Parrot_api_hbdb_init(interp)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Get global debugger structure */
    hbdb = interp->hbdb;

    /* Get filename */
    file = argv[argc - 1];

    /* Display welcome message */
    welcome();

    if (!Parrot_api_hbdb_get_command(interp)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Load bytecode */
    if (file) {
        load_bytecode(interp, file, &pbc);
    }
    else { /* No file specified */
        /* TODO Use parrot_debugger's technique for faking bytecode */
    }

    /* Ready bytecode */
    if (!Parrot_api_ready_bytecode(interp, pbc, &main_sub)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Run bytecode */
    if (!Parrot_api_run_bytecode(interp, pbc, NULL)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    Parrot_api_destroy_interpreter(interp);
    return (0);
}

/*

=item C<static void fail(Parrot_PMC interp)>

Called when an API function fails. Prints an error message and exits with
the status code C<EXIT_FAILURE>.

=cut

*/

static void
fail(Parrot_PMC interp)
{
    char          *msg;

    Parrot_Int    is_error,
                  exit_code;
    Parrot_String errmsg;
    Parrot_PMC    exception;

    if (!Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg))
        exit(EXIT_FAILURE);

    if (is_error) {
        Parrot_api_string_export_ascii(interp, errmsg, &msg);
        fprintf(stderr, "ERROR: %s\n", msg);
        Parrot_api_string_free_exported_ascii(interp, msg);
    }

    exit(exit_code);
}

/*

=item C<static void license(void)>

Displays a message about licensing information and resources.

=cut

*/

static void
license(void)
{
    const char *info = "Copyright (C) 2001-2010, Parrot Foundation.\n"
                       "This program is distributed under the terms of the "
                       "Artistic License 2.0\n\n"
                       "For further information, please see LICENSE or visit "
                       "http://www.perlfoundation.org/attachment/legal/artistic-2_0.txt";

    puts(info);
}

/*

=item C<static void load_bytecode(Parrot_PMC interp, const char * const file, Parrot_PMC *pbc)>

If C<file> is a C<.pbc> file, the bytecode is loaded and stored in C<pbc>. Otherwise, it must
be compiled first and then loaded into C<pbc>.

=cut

*/

static void
load_bytecode(Parrot_PMC interp, const char * const file, Parrot_PMC *pbc)
{
    Parrot_String ps_file;

    /* Convert file's type to Parrot_String */
    if (!Parrot_api_string_import_ascii(interp, file, &ps_file)) {
        fail(interp);
    }

    /* Compile file if it's not already bytecode */
    if (!strcmp(strrchr(file, '.'), "pbc")) {
        Parrot_PMC pir_compreg = NULL;

        /* Create and register a PIR IMCCompiler PMC */
        if (!imcc_get_pir_compreg_api(interp, 1, &pir_compreg))
            fail(interp);

        /* Compile file */
        if (!imcc_compile_file_api(interp, pir_compreg, ps_file, pbc))
            fail(interp);
    }

    /* Load bytecode */
    if (!Parrot_api_load_bytecode_file(interp, ps_file, pbc)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }
}

/*

=item C<static void usage(void)>

Displays a helpful message about standard usage and an explanation of all
the command-line arguments and switches.

=cut

*/

static void
usage(void)
{
    puts("Usage: hbdb [options] [file]\n");
    puts("Options:");
    puts("    -h, --help      Displays help information");
    puts("    -l, --license   Displays license information\n");
    puts("File:");
    puts("    Must be either a bytecode file (.pbc) or PIR file (.pir)");

    exit(EXIT_SUCCESS);
}

/*

=item C<static void welcome(void)>

Displays welcome message.

=cut

*/

static void
welcome(void)
{
    puts("HBDB: The Honey Bee Debugger");
    puts("Copyright (C) 2001-2011, Parrot Foundation.\n");
    puts("Enter \"h\" or \"help\" for help or see docs/hbdb.pod for further information.\n");
}

/*

=back

=head1 SEE ALSO

F<src/hbdb.c>, F<include/parrot/hbdb.h>

=head1 HISTORY

The initial version of C<hbdb> was written by Kevin Polulak (soh_cah_toa) as
part of Google Summer of Code 2011.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

