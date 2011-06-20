/* Copyright (C) 2001-2009, Parrot Foundation. */

/*

=head1 NAME

pbc_disassemble - parrot bytecode disassembler

=head1 SYNOPSIS

pbc_disassemble [-bh?] [--bare|--header-only] [-o outfile] [file.pbc]

=head1 DESCRIPTION

C<pbc_disassemble> translates Parrot bytecode (C<PBC>) into Parrot assembly
language (C<PASM>).

C<file.pbc> is the bytecode file to disassemble. If a file is not specified, the
bytecode will be read from C<stdin>. Additionally, if the C<-o> switch is not
given, the output is displayed to C<stdout>.

=head1 OPTIONS

=over 4

=item B<-?>, B<--help>

Displays usage and help information.

=item B<-b>, B<--bare>

Displays bare PASM without the header and left column.

=item B<-h>, B<--header-only>

Displays only the constants table header.

=item B<-o> filename, B<--output> filename

Writes output to C<filename>.

=back

=head1 STATIC FUNCTIONS

=over 4

=cut

*/

#include <stdio.h>
#include <stdlib.h>

#include "parrot/parrot.h"
#include "parrot/api.h"
#include "parrot/longopt.h"

#define PFOPT_UTILS 1

/* NOTE:
 * C<pbc_disassemble> uses the C<Parrot_disassemble()> function from F<src/embed.c>,
 * which in turn uses the C<PDB_disassemble()> function from F<src/debug.c>.
 */

/* Flags indicating the presence of the -b and -h command-line switches */
typedef enum {
    enum_DIS_BARE      = 1,    /* -b switch */
    enum_DIS_HEADER    = 2     /* -h switch */
} Parrot_disassemble_options;

/* Longopts option table */
static struct longopt_opt_decl options[] = {
    { '?', '?', OPTION_optional_FLAG, { "--help"        } },
    { 'b', 'b', OPTION_optional_FLAG, { "--bare"        } },
    { 'h', 'h', OPTION_optional_FLAG, { "--header-only" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output"      } },
    {  0 ,  0,  OPTION_optional_FLAG, { NULL            } }
};

static void help(void);
static void show_last_error_and_exit(Parrot_PMC interp);

/*

=item C<int main(int argc, const char *argv[])>

Execution entry point. Starts up an interpreter, loads the bytecode from the
command-line, and disassembles it.

=cut

*/

int
main(int argc, const char *argv[])
{
    const char             *outfile  = NULL;
    int                     option   = 0,
                            status   = 0,
                            debug    = PFOPT_UTILS;
    struct longopt_opt_info opt      = LONGOPT_OPT_INFO_INIT;

    Parrot_PMC              interp   = NULL,
                            pbc      = NULL;
    Parrot_String           filename = NULL;
    Parrot_Init_Args       *initargs = NULL;

    /* Parse command-line arguments */
    while ((status = longopt_get(argc, argv, options, &opt)) > 0) {
        switch (opt.opt_id) {
          case 'h':
            option += enum_DIS_HEADER;
            break;
          case 'b':
            option += enum_DIS_BARE;
            break;
          case 'o':
            outfile = opt.opt_arg;
            break;
          case '?':
            /* Fall through */
          default:
            help();
            break;
        }
    }

    /* Check for parse errors */
    if (status == -1) {
        help();
    }

    /* Set initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter and set executable name */
    if (!(Parrot_api_make_interpreter(NULL, 0, initargs, &interp)
        && Parrot_api_set_executable_name(interp, argv[0]))) {

        fprintf(stderr, "PARROT VM: Could not initialize new interpreter\n");
        show_last_error_and_exit(interp);
    }

    argc -= opt.opt_index;
    argv += opt.opt_index;

    /* What to do about this debug flag? */
    /* pf = Parrot_pbc_read(interp, argc ? *argv : "-", debug); */

    /* Convert native char * to Parrot_String */
    if (!Parrot_api_string_import(interp, argc ? *argv : "-", &filename)) {
        fprintf(stderr, "String transformation failed\n");
        show_last_error_and_exit(interp);
    }

    /* Disassemble bytecode and destroy interpreter */
    if (!(Parrot_api_load_bytecode_file(interp, filename, &pbc)
        && Parrot_api_disassemble_bytecode(interp, pbc, outfile, option)
        && Parrot_api_destroy_interpreter(interp))) {

        fprintf(stderr, "Error during disassembly\n");
        show_last_error_and_exit(interp);
    }

    return 0;
}

/*

=item C<static void help(void)>

Prints out the user help information and exits.

=cut

*/

static void
help(void)
{
    puts("pbc_disassemble - parrot bytecode disassembler\n");

    puts("Usage:");
    puts("pbc_disassemble [-bh] [file.pbc]");
    puts("pbc_disassemble -o file.pasm file.pbc\n");

    puts("    -?, --help                   Displays help information");
    puts("    -b, --bare                   Displays bare PASM without header and left column");
    puts("    -h, --header-only            Dumps only the constants table header");
    puts("    -o, --output \"filename\"    Writes output to \"filename\"");

    exit(EXIT_SUCCESS);
}

/*

=item C<static void show_last_error_and_exit(Parrot_PMC interp)>

Prints out the C<interp>'s last error and exits.

=cut

*/

static void
show_last_error_and_exit(Parrot_PMC interp)
{
    Parrot_Int    is_error,
                  exit_code;
    Parrot_String errmsg,
                  backtrace;
    Parrot_PMC    exception;

    /* Get result of last API function call and exception backtrace */
    if (!(Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg)
        && Parrot_api_get_exception_backtrace(interp, exception, &backtrace))) {

        fprintf(stderr, "PARROT VM: Cannot recover\n");
        exit(EXIT_FAILURE);
    }

    /* Check for unhandled exceptions */
    if (is_error) {
        char *msg;

        /* Display error message */
        Parrot_api_string_export_ascii(interp, errmsg, &msg);
        fprintf(stderr, "%s\n", msg);
        Parrot_api_string_free_exported_ascii(interp, msg);

        /* Display exception backtrace */
        Parrot_api_string_export_ascii(interp, backtrace, &msg);
        fprintf(stderr, "%s\n", msg);
        Parrot_api_string_free_exported_ascii(interp, msg);
    }

    exit(exit_code);
}

/*

=back

=head1 SEE ALSO

F<src/embed.c> and F<src/debug.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.26.

Florian Ragwitz: Moved POD documentation that's not necessary to know how to
actually run the disassembler to normal C comments (Wed, 16 Nov 2005).

Reini Urban: Renamed from disassemble to pbc_disassemble (2008-07-03).
             Add options: help, -h, -o, --debug, --bare (2009-01-29)
             Force option 1 for passing version check (2009-03-07)

Kevin Polulak (soh_cah_toa): Updated to use embedding API, moved source file
                             to frontend/pbc_disassemble, and cleaned up
                             source code and perldoc. (2011-06-19)

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

