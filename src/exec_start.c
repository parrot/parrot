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

opcode_t* run_compiled(struct Parrot_Interp *interpreter,
    opcode_t *cur_opcode, opcode_t *code_start);

/* Stolen from embed.c */
static void
setup_argv(struct Parrot_Interp *interpreter, int argc, char ** argv)
{
    INTVAL i;
    PMC *userargv;

    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        PIO_eprintf(interpreter,
        "*** Parrot VM: Setting up ARGV array in P0.  Current argc: %d ***\n",
                argc);
    }

    userargv = pmc_new_noinit(interpreter, enum_class_SArray);
    /* immediately anchor pmc to root set */
    interpreter->pmc_reg.registers[0] = userargv;
    VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL)IGLOBALS_ARGV_LIST, userargv);
    VTABLE_init(interpreter, userargv);
    VTABLE_set_integer_native(interpreter, userargv, argc);

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  0, PObj_external_FLAG, 0);

        if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
            PIO_eprintf(interpreter, "\t%vd: %s\n", i, argv[i]);
        }

        VTABLE_push_string(interpreter, userargv, arg);
    }
}


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
#if defined(JIT_CGP)
    extern void * exec_prederef_code;
#endif
    extern int Parrot_exec_run;
    extern struct PackFile_Constant *exec_const_table;
    extern struct PackFile_Constant const_table;
    extern struct Parrot_Interp interpre;

    /* s. exec.c */
    Parrot_exec_run = 1;
    /* s. packfile.c (PackFile_ConstTable_unpack()) */
    exec_const_table = &const_table;
    interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    run_native = run_compiled;
    /* TODO make also a shared variant of PackFile_new */
    pf = PackFile_new(0);

    if (!PackFile_unpack(interpreter, pf, (opcode_t *)(&program_code),
        sizeof(&program_code)))
    {
        printf( "Can't unpack.\n" );
        return 1;
    }
    Parrot_loadbc(interpreter, pf);
    setup_argv(interpreter, argc, argv);

    /* opcode_map has the offset of each opcode in the compiled code
     * this modifies it to be address of the opcode.
     */
    opp = &opcode_map;
    for (i = 0; i < (int)interpre.code->cur_cs->base.size; i++) {
        opp[i] += (long)run_compiled;
    }

#if defined(JIT_CGP)
    exec_init_prederef(interpreter, &exec_prederef_code);
#endif
    Parrot_set_run_core(interpreter, PARROT_EXEC_CORE);
    interpreter->code->byte_code =
        (opcode_t *)&((&program_code)[bytecode_offset]);
    Parrot_exec_run = 0;
    runops(interpreter, 0);
    /*
        run_compiled(interpreter,
            (opcode_t *)&((&program_code)[bytecode_offset]));
     */
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
