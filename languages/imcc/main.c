/*
 * main.c
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * main program
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "imc.h"
#include "parrot/embed.h"
#include "pbc.h"
#include "parser.h"


static int pbc, write_pbc;
FILE *yyin;

static void usage(FILE *fp)
{
    fprintf(fp, "imcc\t[-h|--help] [-V|--version] [-v|--verbose] "
	    "[-<parrot-switch>] \n"
	    "\t[-d|--debug] [-y|--yydebug] [-a|--pasm]\n"
	    "\t[-c|--create-pbc] [-r|--run-pbc] [-O[012]]\n"
	    "\t[-o outfile] infile [arguments ...]\n");
}


static void help(void)
{
    usage(stdout);
    fprintf(stdout, "\n\tlong options N/Y\n");
    exit(0);
}

static void imcc_version(void)
{
    printf("imcc version " IMCC_VERSION "\n");
    exit(0);
}

#define setopt(flag) Parrot_setflag(interpreter, flag, (*argv)[0]+2)
#define unsetopt(flag) Parrot_setflag(interpreter, flag, 0)

/* most stolen from test_main.c */
static char *
parseflags(Parrot_Interp interpreter, int *argc, char **argv[])
{
    if (*argc == 1) {
	usage(stderr);
	exit(1);
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
                if (!Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG))
                    setopt(PARROT_DEBUG_FLAG);
                else
                    IMCC_DEBUG++;
                break;
            case 'w':
                Parrot_setwarnings(interpreter, PARROT_WARNINGS_ALL_FLAG);
                break;
            case 'G':
                gc_off = 1;
                break;
            case '.':  /* Give Windows Parrot hackers an opportunity to
                        * attach a debuggger. */
                fgetc(stdin);
                break;
            case 'a':
                pasm_file = 1;
                break;
            case 'h':
                help();
                break;
            case 'V':
                imcc_version();
                break;
            case 'r':
                pbc = 1;
                break;
            case 'c':
                write_pbc = 1;
                break;
            case 'v':
                IMCC_VERBOSE++;
                break;
            case 'y':
                yydebug = 1;
                break;
            case 'o':
                if ((*argv)[0][2])
                    output = str_dup((*argv)[0]+2);
                else {
                    (*argc)--;
                    output = str_dup((++(*argv))[0]);
                }
                break;

            case 'O':
                strncpy(optimizer_opt, (*argv)[0]+2,sizeof(optimizer_opt));
                optimizer_opt[sizeof(optimizer_opt)-1] = '\0';
                break;
            case '-':
                if ((*argv)[0][2] == '\0') {
                    (*argc)--;
                    (*argv)++;
                    goto DONE;
                } else if (strncmp((*argv)[0], "--gc-debug", 10) == 0) {
#if DISABLE_GC_DEBUG
                    Parrot_warn(interpreter, PARROT_WARNINGS_ALL_FLAG,
                            "PARROT_GC_DEBUG is set but the binary was "
                            "compiled with DISABLE_GC_DEBUG.");
#endif
                    setopt(PARROT_GC_DEBUG_FLAG);
                    break;
                }

                /* XXX long options */
            case '\0':             /* bare '-' means read from stdin */
                goto DONE;
            default:
                fatal(1, "main", "Invalid flag '%s' used."
                        "\n\ns. imcc -h\n", (*argv)[0]);
	}

	(*argc)--;
	(*argv)++;
    }

DONE:

    return (*argv)[0];
}


int main(int argc, char * argv[])
{
    int stacktop;
    struct PackFile *pf;

    interpreter = Parrot_new();
    Parrot_init(interpreter, (void*)&stacktop);
    pf = PackFile_new();
    interpreter->code = pf;
    interpreter->DOD_block_level++;

    sourcefile = parseflags(interpreter, &argc, &argv);
    /* register compilers to parrot core */
    register_compilers(interpreter);

    /* default optimizations, s. optimizer.c */
    if (!*optimizer_opt)
        strcpy(optimizer_opt, "0");

    if (!sourcefile || !*sourcefile) {
        fatal(EX_NOINPUT, "main", "No source file specified.\n" );
    }
    else if (!strcmp(sourcefile, "-"))
        yyin = stdin;
    else {
        char *ext;
        if(!(yyin = fopen(sourcefile, "r")))    {
            fatal(EX_IOERR, "main", "Error reading source file %s.\n",
                    sourcefile);
        }
        ext = strrchr(sourcefile, '.');
        if (ext && strcmp (ext, ".pasm") == 0) {
            pasm_file = 1;
            if (output)
                write_pbc = 1;
        }
        else if (ext && strcmp (ext, ".pbc") == 0) {
            pbc = 2;
            write_pbc = 0;
        }
    }

    if (!output)
        output = str_dup(write_pbc | pbc ? "a.pbc" : "a.pasm");

    if (IMCC_VERBOSE) {
        info(1,"Reading %s", yyin == stdin ? "stdin":sourcefile);
        if (pbc)
            info(1, ", executing");
        if (write_pbc)
            info(1, " and writing %s\n", output);
        else
            info(1,"\n");
    }
    if (pbc == 2) {
        pf = Parrot_readbc(interpreter, sourcefile);
        if (!pf)
            fatal(1, "main", "Packfile loading failed\n");
        Parrot_loadbc(interpreter, pf);
    }
    else {
        info(1, "using optimization '%s'\n", optimizer_opt);

        line = 1;
        emit_open(write_pbc | pbc, output);

        debug(1, "Starting parse...\n");

        yyparse();
        emit_close();
        fclose(yyin);

        info(1, "%ld lines compiled.\n", line);
    }
    if (write_pbc) {
        size_t size;
        opcode_t *packed;
        FILE *fp;

        size = PackFile_pack_size(interpreter->code);
        info(1, "packed code %d bytes\n", size);
        packed = (opcode_t*) mem_sys_allocate(size);
        if (!packed)
            fatal(1, "main", "Out of mem\n");
        PackFile_pack(interpreter->code, packed);
        if (strcmp (output, "-") == 0)
            fp = stdout;
        else if ((fp = fopen(output, "wb")) == 0)
            fatal(1, "main", "Couldn't open %s\n", output);

        if ((1 != fwrite(packed, size, 1, fp)) )
            fatal(1, "main", "Couldn't write %s\n", output);
        fclose(fp);
        info(1, "%s written.\n", output);
        free(packed);
    }
    if (pbc) {
        if (!gc_off)
            interpreter->DOD_block_level--;
        info(1, "Running...\n");
        Parrot_runcode(interpreter, argc, argv);
        /* XXX no return value :-( */
    }
    Parrot_destroy(interpreter);
    free(output);

    return 0;
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
