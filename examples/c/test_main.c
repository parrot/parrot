/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/test_main.c - A sample test program

=head1 DESCRIPTION

C<examples/c/test_main.c> is being retained as an example of a non-trivial, but
still clean, Parrot embedding. 

=head2 Functions

=over 4

=cut

*/

#include "parrot/embed.h"
#include "parrot/longopt.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define setopt(flag) Parrot_setflag(interpreter, flag, (*argv)[0]+2);
#define unsetopt(flag) Parrot_setflag(interpreter, flag, 0)

char *parseflags(Parrot_Interp interpreter, int *argc, char **argv[]);

#define OPT_GC_DEBUG     128
#define OPT_DESTROY_FLAG 129

static struct longopt_opt_decl options[] = {
    { 'b', 'b', 0,       { "--bounds-checks" } },
    { 'd', 'd', 0,       { "--debug" } },
    { 'h', 'h', 0,       { "--help" } },
    { 'j', 'j', 0,       { "--jit" } },
    { 'o', 'o', 0,       { "--output-file" } },
    { 'p', 'p', 0,       { "--profile" } },
    { 'P', 'P', 0, { "--prederefrenced-core" } },
    { 'S', 'S', 0,       { "--switched-core" } },
    { 'g', 'g', 0,       { "--no-computed-goto" } },
    { 't', 't', 0,       { "--trace" } },
    { 'v', 'v', 0,       { "--version" } },
    { '.', '.', 0,       { "--wait" } },
    {'\0', OPT_GC_DEBUG, 0,       { "--gc-debug" } },
    {'\0', OPT_DESTROY_FLAG, 0,   { "--leak-test", "--destroy-at-end" } },
    {'\0',   0, 0,       { NULL } }
};

static void usage(void);

static void version(void);

/*

=item C<int
main(int argc, char *argv[])>

Loads the file and runs the code.

=cut

*/

int
main(int argc, char *argv[])
{
    Parrot_Interp interpreter;
    char *filename;
    Parrot_PackFile pf;

    interpreter = Parrot_new(NULL);

    if (!interpreter) {
        return 1;
    }

    Parrot_init(interpreter);

    filename = parseflags(interpreter, &argc, &argv);

    pf = Parrot_readbc(interpreter, filename);

    if (!pf) {
        return 1;
    }

    Parrot_loadbc(interpreter, pf);
    Parrot_runcode(interpreter, argc, argv);
    Parrot_destroy(interpreter);

    Parrot_exit(0);
    return 0;
}

/*

=item C<char *
parseflags(Parrot_Interp interpreter, int *argc, char **argv[])>

Parses the command-line.

=cut

*/

char *
parseflags(Parrot_Interp interpreter, int *argc, char **argv[])
{
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;

    if (*argc == 1) {
        usage();
    }

    ++*argv;
    --*argc;
    opt.opt_index = 0;


#ifdef HAVE_COMPUTED_GOTO
    setopt(PARROT_CGOTO_FLAG);
#endif

    while (longopt_get(interpreter, *argc, *argv, options, &opt)) {
        if (opt.opt_id == -1) {
            fprintf(stderr, "parrot: %s\n", opt.opt_error);
            Parrot_exit(1);
        }

        switch (opt.opt_id) {
        case 'b':
            setopt(PARROT_BOUNDS_FLAG);
            break;
        case 'j':
            setopt(PARROT_JIT_FLAG);
            break;
        case 'o':
            setopt(PARROT_EXEC_FLAG);
            break;
        case 'p':
            setopt(PARROT_PROFILE_FLAG);
            break;
        case 'P':
            setopt(PARROT_PREDEREF_FLAG);
            break;
        case 'S':
            setopt(PARROT_SWITCH_FLAG);
            break;
        case 'g':
            unsetopt(PARROT_CGOTO_FLAG);
            break;
        case 't':
            setopt(PARROT_TRACE_FLAG);
            break;
        case 'd':
            setopt(PARROT_DEBUG_FLAG);
            break;
        case 'h':
            usage();
            break;
        case 'v':
            version();
            break;
        case 'w':
            Parrot_setwarnings(interpreter, PARROT_WARNINGS_ALL_FLAG);
            break;

        case '.':  /* Give Windows Parrot hackers an opportunity to
                    * attach a debuggger. */
            fgetc(stdin);
            break;
        case OPT_GC_DEBUG:
#if DISABLE_GC_DEBUG
            Parrot_warn(interpreter, PARROT_WARNINGS_ALL_FLAG,
                        "PARROT_GC_DEBUG is set but the binary was "
                        "compiled with DISABLE_GC_DEBUG.");
#endif
            setopt(PARROT_GC_DEBUG_FLAG);
            break;
        case OPT_DESTROY_FLAG:
            setopt(PARROT_DESTROY_FLAG);
            break;
        }
    }
    *argv += opt.opt_index;
    *argc -= opt.opt_index;

    if ((*argv)[0])
        return (*argv)[0];
    else {
        usage();
        return 0;   /* This won't happen */
    }
}

/*

=item C<static void
usage(void)>

Returns the user help.

=cut

*/

static void
usage(void)
{
#ifdef HAVE_COMPUTED_GOTO
    const char* cgoto_info = "Deactivate computed goto";
#else
    const char* cgoto_info = "Deactivate computed goto (not available on this platform)";
#endif

    fprintf(stderr,
"Usage: parrot [switches] [--] programfile [arguments]\n\
  -b  --bounds-checks           Activate bounds checks\n\
  -d  --debug                   Activate debugging\n\
  -h  --help                    Display this message\n\
  -j  --jit                     Activate Just-In-Time compiler\n\
  -p  --profile                 Activate profiling\n\
  -P  --predereferenced_core    Activate predereferencing\n\
  -S  --switched_core           Activate switched core\n\
  -g  --no-computed-goto        %s\n\
  -t  --trace                   Activate tracing\n\
  -v  --version                 Display version information\n\
  -.  --wait                    Wait for a keypress (gives Windows users\n\
                                    time to attach a debugger)\n\
      --gc-debug\n\
        Enable garbage collection debugging mode. This may also be enabled\n\
        by setting the environment variable $PARROT_GC_DEBUG to 1.\n\
\n",
            cgoto_info
    );

    Parrot_exit(0);
}

/*

=item C<static void
version(void)>

Returns the version information.

=cut

*/

static void
version(void)
{
    fprintf(stderr,
            "This is parrot version " PARROT_VERSION " built for "
            PARROT_ARCHNAME "\n\
Copyright (C) 2001-2003 The Perl Foundation.  All Rights Reserved.\n\
\n\
Parrot may be copied only under the terms of either the Artistic License or the\n\
GNU General Public License, which may be found in the Parrot source kit.\n\
\n\
This program is distributed in the hope that it will be useful,\n\
but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either\n\
the GNU General Public License or the Artistic License for more details.\n\n");

    Parrot_exit(0);
}

/*

=back

=head1 SEE ALSO

F<imcc/main.c>.

=head1 HISTORY

This file used to be the C<parrot> executable, but F<imcc/main.c>
performs that role.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

