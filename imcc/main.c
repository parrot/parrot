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
#include "parrot/longopt.h"
#include "pbc.h"
#include "parser.h"

#define IMCC_VERSION "0.0.9.15"

static int run_pbc, write_pbc;
static char optimizer_opt[20];
extern FILE *yyin;

static void usage(FILE* fp)
{
    fprintf(fp,
    "imcc -[abcgGhjpPrStvVwy.] [-d FLAGS] [-o FILE] [-O level] <file>\n");
}

static void help(void)
{
    printf(
    "imcc [Options] <file>\n"
    "  Options:\n"
    "    -h --help\n"
    "    -V --version\n"
    "   <VM options>\n"
    "    -b --bounds\n"
    "    -j --jit\n"
    "    -p --profile\n"
    "    -P --prederefrenced-core\n"
    "    -S --switched-core\n"
    "    -g --no-computed-goto\n"
    "    -t --tracing\n"
    "    -d --debug=HEXFLAGS\n"
    "    -w --warnings\n"
    "    -G --no-gc\n"
    "       --gc-debug\n"
    "    -.           Read a keystroke before starting\n"
    "   <Compiler options>\n"
    "    -v --verbose\n"
    "    -o --output=FILE\n"
    "    -O --optimize=LEVEL\n"
    "    -a --pasm\n"
    "    -c --pbc\n"
    "    -r --run-pbc\n"
    "    -y --yydebug\n"
    "see docs/running.pod for more\n");
}


static void imcc_version(void)
{
    printf("imcc version " IMCC_VERSION "\n");
    exit(0);
}

#define setopt(flag) Parrot_setflag(interp, flag, (*argv)[0]+2)
#define unsetopt(flag) Parrot_setflag(interp, flag, 0)

#define OPT_GC_DEBUG 128
static struct longopt_opt_decl options[] = {
    { 'b', 'b', 0, { "--bounds" } },
    { 'j', 'j', 0, { "--jit" } },
    { 'p', 'p', 0, { "--profile" } },
    { 'P', 'P', 0, { "--prederefrenced-core" } },
    { 'S', 'S', 0, { "--switched-core" } },
    { 'g', 'g', 0, { "--no-computed-goto" } },
    { 't', 't', 0, { "--tracing" } },
    { 'd', 'd', OPTION_required_FLAG, { "--debug" } },
    { 'w', 'w', 0, { "--warnings" } },
    { 'G', 'G', 0, { "--no-gc" } },
    { '.', '.', 0, { } },
    { 'a', 'a', 0, { "--pasm" } },
    { 'h', 'h', 0, { "--help" } },
    { 'V', 'V', 0, { "--version" } },
    { 'r', 'r', 0, { "--run-pbc" } },
    { 'c', 'c', 0, { "--pbc" } },
    { 'v', 'v', 0, { "--verbose" } },
    { 'y', 'y', 0, { "--yydebug" } },
    { 'o', 'o', OPTION_required_FLAG, { "--output" } },
    { 'O', 'O', OPTION_required_FLAG, { "--optimize" } },
    { OPT_GC_DEBUG, '\0', 0, { "--gc-debug" } },
    { 0, 0, 0, { } }
};

/* most stolen from test_main.c */
static char *
parseflags(Parrot_Interp interp, int *argc, char **argv[])
{
    struct longopt_opt_info opt = LONGOPT_OPT_INFO_INIT;
    int status;
    if (*argc == 1) {
	usage(stderr);
	exit(1);
    }
    run_pbc = 1;

#ifdef HAVE_COMPUTED_GOTO
    setopt(PARROT_CGOTO_FLAG);
#endif

    while ((status = longopt_get(interp, *argc, *argv, options, &opt)) > 0) {
	switch (opt.opt_id) {
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
                IMCC_DEBUG++;
                IMCC_DEBUG = strtoul(opt.opt_arg, 0, 16);
                if (IMCC_DEBUG & 1)
                    setopt(PARROT_DEBUG_FLAG);
                break;
            case 'w':
                Parrot_setwarnings(interp, PARROT_WARNINGS_ALL_FLAG);
                IMCC_WARN = 1;
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
                exit(EX_USAGE);
                break;
            case 'V':
                imcc_version();
                break;
            case 'r':
                run_pbc = 1;
                break;
            case 'c':
                run_pbc = 2;
                break;
            case 'v':
                IMCC_VERBOSE++;
                break;
            case 'y':
                yydebug = 1;
                break;
            case 'o':
                run_pbc = 0;
                output = str_dup(opt.opt_arg);
                break;

            case 'O':
                strncpy(optimizer_opt, opt.opt_arg, sizeof(optimizer_opt));
                optimizer_opt[sizeof(optimizer_opt)-1] = '\0';
                if (strchr(optimizer_opt, '1'))
                    optimizer_level |= OPT_PRE;
                if (strchr(optimizer_opt, '2'))
                    optimizer_level |= (OPT_CFG | OPT_PRE);
                if (strchr(optimizer_opt, 'j')) {
                    int one = 1;
                    optimizer_level |= (OPT_J | OPT_PASM);
                    Parrot_setflag(interp, PARROT_JIT_FLAG, &one);
                }
                if (strchr(optimizer_opt, 'p'))
                    optimizer_level |= OPT_PASM;

                break;

            case OPT_GC_DEBUG:
#if DISABLE_GC_DEBUG
                    Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                            "PARROT_GC_DEBUG is set but the binary was "
                            "compiled with DISABLE_GC_DEBUG.");
#endif
                    setopt(PARROT_GC_DEBUG_FLAG);
                    break;

            default:
                fatal(1, "main", "Invalid flag '%s' used."
                        "\n\nhelp: imcc -h\n", (*argv)[0]);
	}
    }
    if (status == -1) {
        usage(stderr);
        exit(EX_USAGE);
    }
    *argc -= opt.opt_index;
    *argv += opt.opt_index;

    return (*argv)[0];
}


int main(int argc, char * argv[])
{
    int stacktop;
    struct PackFile *pf;

    struct Parrot_Interp *interpreter = Parrot_new();

    Parrot_init(interpreter, (void*)&stacktop);
    interpreter->DOD_block_level++;

    sourcefile = parseflags(interpreter, &argc, &argv);
    /* register PASM and PIR compilers to parrot core */
    register_compilers(interpreter);

    /* default optimizations, s. optimizer.c, imc.h */
    if (!*optimizer_opt) {
        strcpy(optimizer_opt, "0");
        optimizer_level = 0;
    }

    if (!sourcefile || !*sourcefile) {
        fatal(EX_NOINPUT, "main", "No source file specified.\n" );
    }
    else if (!strcmp(sourcefile, "-")) {
        yyin = stdin;
    }
    else {
        char *ext;
        if(!(yyin = fopen(sourcefile, "r")))    {
            fatal(EX_IOERR, "main", "Error reading source file %s.\n",
                    sourcefile);
        }
        ext = strrchr(sourcefile, '.');
        if (ext && strcmp (ext, ".pasm") == 0) {
            pasm_file = 1;
        }
        else if (ext && strcmp (ext, ".pbc") == 0) {
            run_pbc = 2;
            write_pbc = 0;
        }
    }

    if (output) {
        char *ext;
        ext = strrchr(output, '.');
        if (ext && strcmp (ext, ".pbc") == 0) {
            write_pbc = 1;
        }
        if (!strcmp(sourcefile, output))
            fatal(1, "main", "outputfile is sourcefile\n");
    }

    if (IMCC_VERBOSE) {
        info(1,"debug = 0x%x\n", IMCC_DEBUG);
        info(1,"Reading %s", yyin == stdin ? "stdin":sourcefile);
        if (run_pbc)
            info(1, ", executing");
        if (write_pbc)
            info(1, " and writing %s\n", output);
        else
            info(1,"\n");
    }
    if (run_pbc == 2) {
        pf = Parrot_readbc(interpreter, sourcefile);
        if (!pf)
            fatal(1, "main", "Packfile loading failed\n");
        Parrot_loadbc(interpreter, pf);
        fclose(yyin);
    }
    else {
        int per_pbc = write_pbc | run_pbc;
        info(1, "using optimization '%s' (%x) \n", optimizer_opt,
                optimizer_level);
        pf = PackFile_new(0);
        Parrot_loadbc(interpreter, pf);

        line = 1;
        emit_open(per_pbc, per_pbc ? (void*)interpreter : (void*)output);

        info(1, "Starting parse...\n");

        yyparse((void *) interpreter);
        emit_close(interpreter);
        fclose(yyin);

        info(1, "%ld lines compiled.\n", line);
    }
    if (write_pbc) {
        size_t size;
        opcode_t *packed;
        FILE *fp;

        size = PackFile_pack_size(interpreter->code) * sizeof(opcode_t);
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
    if (run_pbc) {
        if (!gc_off)
            interpreter->DOD_block_level--;
        info(1, "Running...\n");
        Parrot_runcode(interpreter, argc, argv);
        /* XXX no return value :-( */
    }
    Parrot_destroy(interpreter);
    if (output)
        free(output);
    Parrot_exit(0);

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
