/*
Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/exec_start.c - Call compiled code

=head1 SYNOPSIS

I<What goes here?>

=head1 DESCRIPTION

Exec is a tool for using the JIT at compile time to generate native
executables.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/string.h"
#include "parrot/exec.h"
#include "parrot/jit.h"
#define JIT_EMIT 1
#include "parrot/jit_emit.h"
#include "parrot/embed.h"

opcode_t* run_compiled(Interp *interpreter,
    opcode_t *cur_opcode, opcode_t *code_start);

/*

=item C<static void
setup_argv(Interp *interpreter, int argc, char ** argv)>

Stolen from F<embed.c>.

=cut

*/

static void
setup_argv(Interp *interpreter, int argc, char ** argv)
{
    INTVAL i;
    PMC *userargv;

    if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
        PIO_eprintf(interpreter,
        "*** Parrot VM: Setting up ARGV array in P5.  Current argc: %d ***\n",
                argc);
    }

    userargv = pmc_new_noinit(interpreter, enum_class_SArray);
    /* immediately anchor pmc to root set */
    REG_PMC(5) = userargv;
    VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL)IGLOBALS_ARGV_LIST, userargv);
    VTABLE_init(interpreter, userargv);
    VTABLE_set_integer_native(interpreter, userargv, argc);

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  "iso-8859-1", PObj_external_FLAG);

        if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
            PIO_eprintf(interpreter, "\t%vd: %s\n", i, argv[i]);
        }

        VTABLE_push_string(interpreter, userargv, arg);
    }
}

/*

=item C<int main(int argc, char **argv)>

The run-loop.

=cut

*/

int
main(int argc, char **argv) {
    long *opp;
    int dummy_var;
    Interp *     interpreter;
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
    extern Interp interpre;

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

=back

=head1 SEE ALSO

F<include/parrot/exec.h>, F<include/parrot/exec_save.h>, F<src/exec.c>
and F<src/exec_start.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2003.6.9

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
