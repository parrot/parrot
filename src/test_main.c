/* test_main.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     A sample test program
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */
#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>

#define setopt(flag) Parrot_setflag(interpreter, flag, (*argv)[0]+2);
#define unsetopt(flag) Parrot_setflag(interpreter, flag, 0)

char *parseflags(Parrot_Interp interpreter, int *argc, char **argv[]);

static void usage(void);

static void version(void);

int
main(int argc, char *argv[])
{
    Parrot_Interp interpreter;
    char *filename;
    Parrot_PackFile pf;

    interpreter = Parrot_new();

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

    return 0;
}

char *
parseflags(Parrot_Interp interpreter, int *argc, char **argv[])
{
    if (*argc == 1) {
        usage();
    }

    /* skip the program name arg */
    (*argc)--;
    (*argv)++;

#ifdef HAVE_COMPUTED_GOTO
    setopt(PARROT_CGOTO_FLAG);
#endif

    while ((*argc) && (*argv)[0][0] == '-') {
        switch ((*argv)[0][1]) {
        case 'b':
            setopt(PARROT_BOUNDS_FLAG);
            break;
        case 'j':
            setopt(PARROT_JIT_FLAG);
            break;
        case 'p':
            setopt(PARROT_PROFILE_FLAG);
            break;
        case 'P':
            setopt(PARROT_PREDEREF_FLAG);
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
        case '-':
            (*argc)--;
            (*argv)++;
            goto OUT;
        case '\0':             /* bare '-' means read from stdin */
            goto OUT;
        default:
            fprintf(stderr, "parrot: Invalid flag %c used",
                    (*argv)[0][1]);
            exit(1);
        }

        (*argc)--;
        (*argv)++;
    }

  OUT:

    return (*argv)[0];
}

static void
usage(void)
{
#ifdef HAVE_COMPUTED_GOTO
    const char* cgoto_info = "Deactivate computed goto";
#else
    const char* cgoto_info = "(already disabled) Deactivate computed goto";
#endif

    fprintf(stderr,
"Usage: parrot [switches] [--] programfile [arguments]\n\
  -b    Activate bounds checks\n\
  -d    Activate debugging\n\
  -h    Display this message\n\
  -j    Activate Just-In-Time compiler\n\
  -p    Activate profiling\n\
  -P    Activate predereferencing\n\
  -g    %s\n\
  -t    Activate tracing\n\
  -v    Display version information\n\
  -.    Wait for a keypress (gives Windows users time to attach a debugger)\n\n",
            cgoto_info
    );

    exit(0);
}

static void
version(void)
{
    fprintf(stderr,
            "This is parrot version " PARROT_VERSION " built for "
            PARROT_ARCHNAME "\n\
Copyright (C) 2001-2002 Yet Another Society.  All Rights Reserved.\n\
\n\
Parrot may be copied only under the terms of either the Artistic License or the\n\
GNU General Public License, which may be found in the Parrot source kit.\n\
\n\
This program is distributed in the hope that it will be useful,\n\
but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either\n\
the GNU General Public License or the Artistic License for more details.\n\n");

    exit(0);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
