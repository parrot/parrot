/*
 * exec_start.c
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    Call compiled code.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#include "parrot/parrot.h"
#include "parrot/string.h"
#include "parrot/exec.h"
#include "parrot/jit.h"
#define JIT_EMIT 1
#include "parrot/jit_emit.h"
#include "parrot/embed.h"

opcode_t* run_compiled(struct Parrot_Interp *interpreter, opcode_t *cur_opcode);

int
main(int argc, char **argv) {
    long *opp;
    int dummy_var;
    struct Parrot_Interp *     interpreter;
    struct PackFile *          pf;
    opcode_t *code_start;
    INTVAL i;
    PMC *userargv;
    extern char *program_code;
    extern long opcode_map;
    extern int bytecode_offset;
#if I386 && defined(JIT_CGP)
    extern void * exec_prederef_code;
#endif
    extern int Parrot_exec_run;
    extern struct PackFile_Constant *exec_const_table;
    extern struct PackFile_Constant const_table;
    extern struct Parrot_Interp interpre;

    Parrot_exec_run = 1;
    exec_const_table = &const_table;
    interpreter = Parrot_new();
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter, (void*) &dummy_var);

    //run_native = run_compiled;
    /* TODO make also a shared variant of PackFile_new */
    pf          = PackFile_new(0);

    if( !PackFile_unpack(interpreter, pf, (opcode_t *)(&program_code),
			    sizeof(&program_code)) ) {
	printf( "Can't unpack.\n" );
	return 1;
    }
    Parrot_loadbc(interpreter, pf);

    /* setup P0, stolen from embed.c */
    userargv = pmc_new(interpreter, enum_class_PerlArray);
    /* immediately anchor pmc to root set */
    interpreter->pmc_reg.registers[0] = userargv;

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  0, PObj_external_FLAG, 0);

        if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
            fprintf(stderr, "\t" INTVAL_FMT ": %s\n", i, argv[i]);
        }

        userargv->vtable->push_string(interpreter, userargv, arg);
    }

    opp = &opcode_map;
    for (i = 0; i < (int)interpre.code->cur_cs->base.size; i++) {
        opp[i] += (long)run_compiled;
    }
    Parrot_exec_run = 0;

#if I386 && defined(JIT_CGP)
    exec_init_prederef(interpreter, &exec_prederef_code);
#endif
    run_compiled(interpreter, (opcode_t *)&((&program_code)[bytecode_offset]));
    exit(0);
}
