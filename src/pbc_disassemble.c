/*
Copyright (C) 2001-2003, Parrot Foundation.
$Id$

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

#include <parrot/parrot.h>
#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

static void do_dis(Parrot_Interp, const char *, int);

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
    printf("  -d\t\t ... debug\n");
#endif
    printf("  -o filename\t ... output to filename\n");
    exit(EXIT_SUCCESS);
}

static struct longopt_opt_decl options[] = {
    { 'h', 'h', OPTION_optional_FLAG, { "--header-only" } },
    { '?', '?', OPTION_optional_FLAG, { "--help" } },
    { 'b', 'b', OPTION_optional_FLAG, { "--bare" } },
    { 'd', 'd', OPTION_optional_FLAG, { "--debug" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output" } }
};

/*

=item C<int main(int argc, char *argv[])>

The run-loop. Starts up an interpreter, loads the bytecode from the
command-line and disassembles it.

=cut

*/

int
main(int argc, const char *argv[])
{
    Parrot_PackFile pf;
    Parrot_Interp interp;
    const char *outfile = NULL;
    int option = 0;
    int debug = 0;
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;

    interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }
    /* init and set top of stack */
    Parrot_init_stacktop(interp, &status);
    while ((status = longopt_get(interp,
                    argc, argv, options, &opt)) > 0) {
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
            case 'd':
                debug = 1;
                break;
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

    pf = Parrot_pbc_read(interp, argc ? *argv : "-", debug);

    if (!pf) {
        printf("Can't read PBC\n");
        return 1;
    }

    Parrot_pbc_load(interp, pf);

    do_dis(interp, outfile, option);

    Parrot_exit(interp, 0);
}

/*

=item C<static void do_dis(PARROT_INTERP, outfile, int)>

Do the disassembling.

=cut

*/

static void
do_dis(PARROT_INTERP, const char *outfile, int options)
{
    Parrot_disassemble(interp, outfile, (Parrot_disassemble_options) options);
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

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
