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

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void license(void);
static void load_bytecode(
    Parrot_PMC interp,
    ARGIN(const char * const file),
    ARGOUT(Parrot_PMC *pbc))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pbc);

static void show_last_error_and_exit(Parrot_PMC interp);
static void usage(void);
static void welcome(void);
#define ASSERT_ARGS_license __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_load_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(file) \
    , PARROT_ASSERT_ARG(pbc))
#define ASSERT_ARGS_show_last_error_and_exit __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_usage __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_welcome __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

static struct longopt_opt_decl options[] = {
    { 'h', 'h', OPTION_optional_FLAG, { "--help"    } },
    { 'l', 'l', OPTION_optional_FLAG, { "--license" } },
    {   0,   0, OPTION_optional_FLAG, { NULL        } }
};

/*

=item C<int main(int argc, const char *argv[])>

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

    /* Check for unrecognized options */
    if (status == -1)
        usage();

    /* Setup default initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter */
    if (!(Parrot_api_make_interpreter(NULL, 0, initargs, &interp)
        && Parrot_api_set_executable_name(interp, argv[0]))) {

        show_last_error_and_exit(NULL);
    }

    /* Register hbdb runcore */
    if (!Parrot_api_set_runcore(interp, "hbdb", 0)) {
        Parrot_api_destroy_interpreter(interp);
        show_last_error_and_exit(interp);
    }

    /* Initialize debugger */
    if (!Parrot_api_hbdb_init(interp)) {
        Parrot_api_destroy_interpreter(interp);
        show_last_error_and_exit(interp);
    }

    /* TODO Do I need this? */
    /* Get global debugger structure */
    hbdb = INTERP_ATTR(interp)->hbdb;

    /* Get filename */
    file = argv[argc - 1];

    /* TODO Move call somewhere else to just before entering main runloop */
    /* Display welcome message */
    welcome();

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
        show_last_error_and_exit(interp);
    }

    /* Run bytecode */
    if (!Parrot_api_hbdb_runloop(interp, argc, argv)) {
        Parrot_api_destroy_interpreter(interp);
        show_last_error_and_exit(interp);
    }

    /*
    if (!Parrot_api_run_bytecode(interp, pbc, NULL)) {
        Parrot_api_destroy_interpreter(interp);
        show_last_error_and_exit(interp);
    }
    */

    Parrot_api_destroy_interpreter(interp);
    return (0);
}

/*

=item C<static void show_last_error_and_exit(Parrot_PMC interp)>

Called when an API function fails. Displays a warning about the interpreter's
last error and exits with a non-zero exit code.

=cut

*/

static void
show_last_error_and_exit(Parrot_PMC interp)
{
    ASSERT_ARGS(show_last_error_and_exit)

    char          *msg;

    Parrot_Int    is_error,
                  exit_code;
    Parrot_String errmsg;
    Parrot_PMC    exception;

    /* Get result of last API function call */
    if (!Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg))
        exit(EXIT_FAILURE);

    /* Check if an unhandled exception was thrown */
    if (is_error) {
        Parrot_api_string_export_ascii(interp, errmsg, &msg);

        /* Exit quietly with status of 0 if the error was EOF-related */
        if (strcmp(msg, "Null PMC access in get_string()") == 0) {
            printf("quit\n");
            exit(0);
        }

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
    const char *info = "Copyright (C) 2001-2011, Parrot Foundation.\n"
                       "This program is distributed under the terms of the "
                       "Artistic License 2.0\n\n"
                       "For further information, please see LICENSE or visit "
                       "http://www.perlfoundation.org/attachment/legal/artistic-2_0.txt";

    puts(info);
}

/*

=item C<static void load_bytecode(Parrot_PMC interp, const char * const file,
Parrot_PMC *pbc)>

If C<file> is a C<.pbc> file, the bytecode is loaded and stored in C<pbc>. Otherwise, it must
be compiled first and then loaded into C<pbc>.

=cut

*/

static void
load_bytecode(Parrot_PMC interp, ARGIN(const char * const file), ARGOUT(Parrot_PMC *pbc))
{
    ASSERT_ARGS(load_bytecode)

    Parrot_String ps_file;

    /* Convert file's type to Parrot_String */
    if (!Parrot_api_string_import_ascii(interp, file, &ps_file)) {
        show_last_error_and_exit(interp);
    }

    /* Compile file if it's not already bytecode */
    if (strcmp(strrchr(file, '.'), ".pbc") != 0) {
        Parrot_PMC pir_compreg = NULL;

        /* Create and register a PIR IMCCompiler PMC */
        if (!imcc_get_pir_compreg_api(interp, 1, &pir_compreg))
            show_last_error_and_exit(interp);

        /* Compile file */
        if (!imcc_compile_file_api(interp, pir_compreg, ps_file, pbc))
            show_last_error_and_exit(interp);

        /* Load source code */
        Parrot_api_hbdb_load_source(interp, file);
    }
    else {
        /* Load bytecode */
        if (!Parrot_api_load_bytecode_file(interp, ps_file, pbc)) {
            Parrot_api_destroy_interpreter(interp);
            show_last_error_and_exit(interp);
        }
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
    puts("    May be either a bytecode file (.pbc) or PIR file (.pir)");

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

F<src/hbdb.c>, F<src/embed/hbdb.c>, F<include/parrot/hbdb.h>

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

