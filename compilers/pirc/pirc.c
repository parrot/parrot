/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

/*

=head1 NAME

compilers/pirc/pirc.c

=head1 DESCRIPTION

This program is the PIR compiler driver. It invokes the three PIR compilation
phases, consisting of the heredoc preprocessor, the macro processor and
the pure PIR compiler. Invocation is done using calls to C<system()>.


=head2 Functions

=over 4

=cut

*/

typedef enum arg_flags {
    FLAG_PREPROCESS = 0x01,
    FLAG_ONLY_HEREDOC = 0x02,

} arg_flag;

#define SET_FLAG(obj, flag)  (obj) |= (flag)
#define TEST_FLAG(obj, flag) (obj) & (flag)

/*

=item C<static void
print_help(void)>

Prints help message and usage information

=cut

*/

static void
print_help(void) {
    fprintf(stderr,
        "usage: pirc [options] <file>\n"
        "options:\n"
        "  -h        print this help message\n"
        "  -E        pre-process only, do not parse\n"
        "  -H        only heredoc processing\n"
      /*"  -o <file> write output to the specified file\n" */
        "");
}

/*

=item C<int
main(int argc, char *argv[])>

Depending on the program arguments, invoke the PIR compiler phases.
There are three options: run only the heredoc preprocessor, do only
pre-processing (heredoc + macro processing), or invoke all three
compilation phases.

=cut

*/
int
main(int argc, char *argv[]) {
    char * command;
    /* make slash portable, and executable names too */
    char const * const format0 = "heredoc\\hdocprep %s | macro\\macroparser | new\\main";
    char const * const format1 = "heredoc\\hdocprep %s";
    char const * const format2 = "heredoc\\hdocprep %s | macro\\macroparser";
    /* char *outfile = NULL; */

    arg_flag flags = 0;

    /* skip program name */
    argc--;
    argv++;

    /* handle options */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            case 'h':
                print_help();
                break;
            case 'E':
                SET_FLAG(flags, FLAG_PREPROCESS);
                break;
            case 'H':
                SET_FLAG(flags, FLAG_ONLY_HEREDOC);
                break;
            /* handle output. add redirection of output to the formatx strings.
            case 'o':
                 if (argc > 1) {
                    argc--;
                    argv++;
                    outfile = argv[0];
                }
                else {
                    fprintf(stderr, "missing argument for option '-o'\n");
                    exit(EXIT_FAILURE);
                }
                break;
                */
            default:
                printf("unknown option: %c\n", argv[0][1]);
                printf("use option -h for help\n");
                exit(EXIT_FAILURE);
        }
        argc--;
        argv++;
    }


    if (argc < 1) {
        fprintf(stderr, "No input file specified\n");
        print_help();
        exit(EXIT_FAILURE);
    }

    /* based on the program arguments, invoke the selected compilation phases. */
    switch (flags) {
        case FLAG_PREPROCESS:
            command = (char *)calloc(strlen(argv[0]) + strlen(format2) + 1, sizeof (char));
            assert(command);
            sprintf(command, format2, argv[0]);
            break;
        case FLAG_ONLY_HEREDOC:
            command = (char *)calloc(strlen(argv[0]) + strlen(format1) + 1, sizeof (char));
            assert(command);
            sprintf(command, format1, argv[0]);
            break;
        default:
            command = (char *)calloc(strlen(argv[0]) + strlen(format0) + 1, sizeof (char));
            assert(command);
            sprintf(command, format0, argv[0]);
            break;
    }

    /* execute the command*/
    system(command);

    /* clean up and exit */
    free(command);
    return 0;
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

