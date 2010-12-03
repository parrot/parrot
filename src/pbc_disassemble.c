/*
Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

pbc_disassemble - Parrot disassembler

=head1 SYNOPSIS

    pbc_disassemble [-bdh?] [-o outfile] [file.pbc]

=head1 DESCRIPTION

This uses the C<Parrot_disassemble()> function from F<src/embed.c>,
which in turn uses the C<PDB_disassemble()> function from
F<src/debug.c>.

Without non-option arguments it reads the pbc from STDIN.

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "parrot/api.h"
#include "parrot/longopt.h"

#define PFOPT_UTILS 1

typedef enum {
    enum_DIS_BARE      = 1,
    enum_DIS_HEADER    = 2
} Parrot_disassemble_options;

static void show_last_error_and_exit(Parrot_PMC interp);

/*

=item C<static void help(void)>

Print out the user help info.

=cut

*/

static void help(void)
{
    printf("pbc_disassemble - dump or convert parrot bytecode (PBC) files\n");
    printf("usage:\n");
    printf("pbc_disassemble [-bh] [--bare|--header-only] [file.pbc]\n");
    printf("pbc_disassemble -o converted.pasm file.pbc\n\n");
    printf("  -b\t\t ... bare .pasm without header and left column\n");
    printf("  -h\t\t ... dump Constant-table header only\n");
#if TRACE_PACKFILE
    printf("\t-D<1-7> --debug debug output\n");
    printf("\t   1 general info\n");
    printf("\t   2 alignment\n");
    printf("\t   4 values\n");
#endif
    printf("  -o filename\t ... output to filename\n");
    exit(EXIT_SUCCESS);
}

static struct longopt_opt_decl options[] = {
    { 'h', 'h', OPTION_optional_FLAG, { "--header-only" } },
    { '?', '?', OPTION_optional_FLAG, { "--help" } },
    { 'b', 'b', OPTION_optional_FLAG, { "--bare" } },
#if TRACE_PACKFILE
    { 'D', 'D', OPTION_required_FLAG, { "--debug" } },
#endif
    { 'o', 'o', OPTION_required_FLAG, { "--output" } }
};

/*

=item C<int main(int argc, const char *argv[])>

The run-loop. Starts up an interpreter, loads the bytecode from the
command-line and disassembles it.

=cut

*/

int
main(int argc, const char *argv[])
{
    Parrot_PMC interp;
    Parrot_PMC pbc;
    const char *outfile = NULL;
    int option = 0;
    int debug = PFOPT_UTILS;
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;
    Parrot_Init_Args *initargs;
    GET_INIT_STRUCT(initargs);

    if (!(Parrot_api_make_interpreter(NULL, 0, initargs, &interp) &&
          Parrot_api_set_executable_name(interp, argv[0]))) {
        fprintf(stderr, "PARROT VM: Could not initialize new interpreter");
        show_last_error_and_exit(interp);
    }

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
#if TRACE_PACKFILE
          case 'D':
            debug += atoi(opt.opt_arg) << 2;
            break;
#endif
          case '?':
          default:
            help();
            break;
        }
    }
    if (status == -1) {
        help();
    }
    argc -= opt.opt_index;
    argv += opt.opt_index;

    // What to do about this debug flag?
    //pf = Parrot_pbc_read(interp, argc ? *argv : "-", debug);

    if (!(Parrot_api_load_bytecode_file(interp, argc ? *argv : "-", &pbc) &&
          Parrot_api_disassemble_bytecode(interp, pbc, outfile, option) &&
          Parrot_api_destroy_interpreter(interp))) {
        fprintf(stderr, "Error during disassembly\n");
        show_last_error_and_exit(interp);
    }
    exit(EXIT_SUCCESS);
}

static void
show_last_error_and_exit(Parrot_PMC interp)
{
    Parrot_String errmsg, backtrace;
    Parrot_Int exit_code, is_error;
    Parrot_PMC exception;

    if (!(Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg) &&
          Parrot_api_get_exception_backtrace(interp, exception, &backtrace))) {
        fprintf(stderr, "PARROT VM: Cannot recover\n");
        exit(EXIT_FAILURE);
    }

    if (errmsg) {
        char * errmsg_raw;
        Parrot_api_string_export_ascii(interp, errmsg, &errmsg_raw);
        fprintf(stderr, "%s\n", errmsg_raw);
        Parrot_api_string_free_exported_ascii(interp, errmsg_raw);

        Parrot_api_string_export_ascii(interp, backtrace, &errmsg_raw);
        fprintf(stderr, "%s\n", errmsg_raw);
        Parrot_api_string_free_exported_ascii(interp, errmsg_raw);
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

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
