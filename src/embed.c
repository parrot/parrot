/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/embed.c - The Parrot embedding interface

=head1 DESCRIPTION

This file implements the old Parrot embedding interface.  Its days are
numbered.  You probably want src/embed/api.c

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"
#include "parrot/oplib/ops.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"
#include "parrot/runcore_api.h"
#include "parrot/oplib/core_ops.h"
#include "imcc/embed.h"

#include "embed.str"

/* HEADERIZER HFILE: include/parrot/embed.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void print_constant_table(PARROT_INTERP, ARGIN(PMC *output))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void print_debug(PARROT_INTERP, int status, ARGIN(void *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static PMC* setup_argv(PARROT_INTERP, int argc, ARGIN(const char **argv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_print_constant_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output))
#define ASSERT_ARGS_print_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(p_unused))
#define ASSERT_ARGS_setup_argv __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

extern int Parrot_exec_run;

/*

=item C<Parrot_Interp Parrot_new(Parrot_Interp parent)>

Returns a new Parrot interpreter.

The first created interpreter (C<parent> is C<NULL>) is the last one
to get destroyed.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp
Parrot_new(ARGIN_NULLOK(Parrot_Interp parent))
{
    ASSERT_ARGS(Parrot_new)
    /* inter_create.c:make_interpreter builds a new Parrot_Interp. */
    return make_interpreter(parent, PARROT_NO_FLAGS);
}


/*

=item C<void Parrot_init_stacktop(PARROT_INTERP, void *stack_top)>

Initializes the new interpreter when it hasn't been initialized before.

Additionally sets the stack top, so that Parrot objects created
in inner stack frames will be visible during GC stack walking code.
B<stack_top> should be the address of an automatic variable in the caller's
stack frame. All unanchored Parrot objects (PMCs) must live in inner stack
frames so that they are not destroyed during GC runs.

Use this function when you call into Parrot before entering a run loop.

=cut

*/

PARROT_EXPORT
void
Parrot_init_stacktop(PARROT_INTERP, ARGIN(void *stack_top))
{
    ASSERT_ARGS(Parrot_init_stacktop)
    interp->lo_var_ptr = stack_top;
    Parrot_gbl_init_world_once(interp);
}


/*

=item C<void Parrot_set_flag(PARROT_INTERP, Parrot_Int flag)>

Sets on any of the following flags, specified by C<flag>, in the interpreter:

Flag                    Effect
C<PARROT_BOUNDS_FLAG>   enable bounds checking
C<PARROT_PROFILE_FLAG>  enable profiling,

=cut

*/

PARROT_EXPORT
void
Parrot_set_flag(PARROT_INTERP, Parrot_Int flag)
{
    ASSERT_ARGS(Parrot_set_flag)
    /* These two macros (from interpreter.h) do exactly what they look like. */

    Interp_flags_SET(interp, flag);
    switch (flag) {
      case PARROT_BOUNDS_FLAG:
      case PARROT_PROFILE_FLAG:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        break;
      default:
        break;
    }
}


/*

=item C<void Parrot_set_debug(PARROT_INTERP, Parrot_UInt flag)>

Set a debug flag: C<PARROT_DEBUG_FLAG>.

=cut

*/

PARROT_EXPORT
void
Parrot_set_debug(PARROT_INTERP, Parrot_UInt flag)
{
    ASSERT_ARGS(Parrot_set_debug)
    interp->debug_flags |= flag;
}


/*

=item C<void Parrot_set_executable_name(PARROT_INTERP, Parrot_String name)>

Sets the name of the executable launching Parrot (see C<pbc_to_exe> and the
C<parrot> binary).

=cut

*/

PARROT_EXPORT
void
Parrot_set_executable_name(PARROT_INTERP, Parrot_String name)
{
    ASSERT_ARGS(Parrot_set_executable_name)
    PMC * const name_pmc = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, name_pmc, name);
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE,
        name_pmc);
}


/*

=item C<void Parrot_set_trace(PARROT_INTERP, Parrot_UInt flag)>

Set a trace flag: C<PARROT_TRACE_FLAG>

=cut

*/

PARROT_EXPORT
void
Parrot_set_trace(PARROT_INTERP, Parrot_UInt flag)
{
    ASSERT_ARGS(Parrot_set_trace)
    Parrot_pcc_trace_flags_on(interp, interp->ctx, flag);
    Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
}


/*

=item C<void Parrot_clear_flag(PARROT_INTERP, Parrot_Int flag)>

Clears a flag in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_flag(PARROT_INTERP, Parrot_Int flag)
{
    ASSERT_ARGS(Parrot_clear_flag)
    Interp_flags_CLEAR(interp, flag);
}


/*

=item C<void Parrot_clear_debug(PARROT_INTERP, Parrot_UInt flag)>

Clears a flag in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_debug(PARROT_INTERP, Parrot_UInt flag)
{
    ASSERT_ARGS(Parrot_clear_debug)
    interp->debug_flags &= ~flag;
}


/*

=item C<void Parrot_clear_trace(PARROT_INTERP, Parrot_UInt flag)>

Clears a flag in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_clear_trace(PARROT_INTERP, Parrot_UInt flag)
{
    ASSERT_ARGS(Parrot_clear_trace)
    Parrot_pcc_trace_flags_off(interp, interp->ctx, flag);
}


/*

=item C<Parrot_Int Parrot_test_flag(PARROT_INTERP, Parrot_Int flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Int
Parrot_test_flag(PARROT_INTERP, Parrot_Int flag)
{
    ASSERT_ARGS(Parrot_test_flag)
    return Interp_flags_TEST(interp, flag);
}


/*

=item C<Parrot_UInt Parrot_test_debug(PARROT_INTERP, Parrot_UInt flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_UInt
Parrot_test_debug(PARROT_INTERP, Parrot_UInt flag)
{
    ASSERT_ARGS(Parrot_test_debug)
    return interp->debug_flags & flag;
}


/*

=item C<Parrot_UInt Parrot_test_trace(PARROT_INTERP, Parrot_UInt flag)>

Test the interpreter flags specified in C<flag>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_UInt
Parrot_test_trace(PARROT_INTERP, Parrot_UInt flag)
{
    ASSERT_ARGS(Parrot_test_trace)
    return Parrot_pcc_trace_flags_test(interp, interp->ctx, flag);
}


/*

=item C<void Parrot_set_run_core(PARROT_INTERP, Parrot_Run_core_t core)>

Sets the specified run core.

=cut

*/

PARROT_EXPORT
void
Parrot_set_run_core(PARROT_INTERP, Parrot_Run_core_t core)
{
    ASSERT_ARGS(Parrot_set_run_core)
    switch (core) {
      case PARROT_SLOW_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        break;
      case PARROT_FAST_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "fast"));
        break;
      case PARROT_EXEC_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "exec"));
        break;
      case PARROT_GC_DEBUG_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "gc_debug"));
        break;
      case PARROT_DEBUGGER_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "debugger"));
        break;
      case PARROT_PROFILING_CORE:
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "profiling"));
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Invalid runcore requested\n");
    }
}


/*

=item C<void Parrot_setwarnings(PARROT_INTERP, Parrot_warnclass wc)>

Activates the given warnings.

=cut

*/

PARROT_EXPORT
void
Parrot_setwarnings(PARROT_INTERP, Parrot_warnclass wc)
{
    ASSERT_ARGS(Parrot_setwarnings)
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interp, wc);
}


/*

=item C<Parrot_PackFile Parrot_pbc_read(PARROT_INTERP, const char *fullname,
const int debug)>

Read in a bytecode, unpack it into a C<PackFile> structure, and do fixups.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_PackFile
Parrot_pbc_read(PARROT_INTERP, ARGIN_NULLOK(const char *fullname), const int debug)
{
    ASSERT_ARGS(Parrot_pbc_read)
    STRING *str = Parrot_str_new(interp, fullname, 0);

    return PackFile_read_pbc(interp, str, debug);
}

/*

=item C<void Parrot_pbc_load(PARROT_INTERP, Parrot_PackFile pf)>

Loads the C<PackFile> returned by C<Parrot_pbc_read()>.

TODO: We don't do any error or sanity checking here. The packfile pointer
should be a valid packfile, not simply a non-null pointer

=cut

*/

PARROT_EXPORT
void
Parrot_pbc_load(PARROT_INTERP, ARGIN(Parrot_PackFile pf))
{
    ASSERT_ARGS(Parrot_pbc_load)
    Parrot_pf_set_current_packfile(interp, pf);
}

/*

=item C<int Parrot_load_bytecode_file(PARROT_INTERP, const char *filename)>

Load a bytecode file into the interpreter by name. Returns C<0> on failure,
Success otherwise. Writes error information to the interpreter's error file
stream.

=cut

*/

PARROT_EXPORT
int
Parrot_load_bytecode_file(PARROT_INTERP, ARGIN(const char *filename))
{
    ASSERT_ARGS(Parrot_load_bytecode_file)
#if 0
    PackFile * const pf = Parrot_pbc_read(interp, filename, 0);

    Parrot_warn_experimental(interp, "Parrot_load_bytecode_file is experimental");
    if (!pf)
        return 0;
    Parrot_pf_set_current_packfile(interp, pf);
    return 1;
#else
    UNUSED(interp);
    UNUSED(filename);
#endif
    return 0;
}

/*

=item C<void Parrot_pbc_fixup_loaded(PARROT_INTERP)>

Fixups after pbc loading

=cut

*/

PARROT_EXPORT
void
Parrot_pbc_fixup_loaded(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_pbc_fixup_loaded)
    PackFile_fixup_subs(interp, PBC_LOADED, NULL);
}


/*

=item C<static PMC* setup_argv(PARROT_INTERP, int argc, const char **argv)>

Creates and returns C<ARGS> array PMC.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC*
setup_argv(PARROT_INTERP, int argc, ARGIN(const char **argv))
{
    ASSERT_ARGS(setup_argv)
    PMC   * const userargv = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    INTVAL i;

    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
        Parrot_io_eprintf(interp,
            "*** Parrot VM: Setting up ARGV array.  Current argc: %d ***\n",
            argc);
    }

    /* immediately anchor pmc to root set */
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals,
            (INTVAL)IGLOBALS_ARGV_LIST, userargv);

    for (i = 0; i < argc; ++i) {
        /* Run through argv, adding everything to @ARGS. */
        STRING * const arg = Parrot_str_new_init(interp, argv[i], strlen(argv[i]),
                Parrot_utf8_encoding_ptr, PObj_external_FLAG);

        if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG))
            Parrot_io_eprintf(interp, "\t%vd: %s\n", i, argv[i]);

        VTABLE_push_string(interp, userargv, arg);
    }

    return userargv;
}


/*

=item C<static void print_debug(PARROT_INTERP, int status, void *p)>

Prints GC info.

=cut

*/

static void
print_debug(PARROT_INTERP, SHIM(int status), ARGIN(SHIM(void *p)))
{
    ASSERT_ARGS(print_debug)
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        /* Give souls brave enough to activate debugging an earful about GC. */

        Parrot_io_eprintf(interp, "*** Parrot VM: Dumping GC info ***\n");
        PDB_info(interp);
    }
}


/*

=item C<PMC* set_current_sub(PARROT_INTERP)>

Search the fixup table for a PMC matching the argument.  On a match,
set up the appropriate context.

If no match, set up a dummy PMC entry.  In either case, return a
pointer to the PMC.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC*
set_current_sub(PARROT_INTERP)
{
    ASSERT_ARGS(set_current_sub)
    PMC *new_sub_pmc;

    PackFile_ByteCode   * const cur_cs = interp->code;
    PackFile_ConstTable * const ct     = cur_cs->const_table;
    STRING * const SUB = CONST_STRING(interp, "Sub");

    opcode_t    i;

    /*
     * Walk the fixup table.  The first Sub-like entry should be our
     * entry point with the address at our resume_offset.
     */

    for (i = 0; i < ct->pmc.const_count; i++) {
        PMC * const sub_pmc = ct->pmc.constants[i];
        if (VTABLE_isa(interp, sub_pmc, SUB)) {
            Parrot_Sub_attributes *sub;

            PMC_get_sub(interp, sub_pmc, sub);
            if (sub->seg == cur_cs) {
                const size_t offs = sub->start_offs;

                if (offs == interp->resume_offset) {
                    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), sub_pmc);
                    Parrot_pcc_set_HLL(interp, CURRENT_CONTEXT(interp), sub->HLL_id);
                    return sub_pmc;
                }

                break;
            }
        }
    }

    /* If we didn't find anything, put a dummy PMC into current_sub.
       The default values set by SUb.init are appropriate for the
       dummy, don't need additional settings. */
    new_sub_pmc = Parrot_pmc_new(interp, enum_class_Sub);
    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), new_sub_pmc);

    return new_sub_pmc;
}


/*

=item C<void Parrot_runcode(PARROT_INTERP, int argc, const char **argv)>

Sets up C<ARGV> and runs the ops.

=cut

*/

PARROT_EXPORT
void
Parrot_runcode(PARROT_INTERP, int argc, ARGIN(const char **argv))
{
    ASSERT_ARGS(Parrot_runcode)
    PMC *userargv, *main_sub;

    /* Debugging mode nonsense. */
    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
        if (Interp_flags_TEST(interp, PARROT_BOUNDS_FLAG)) {
            Parrot_io_eprintf(interp,
                    "*** Parrot VM: Bounds checking enabled. ***\n");
        }

        if (Interp_trace_TEST(interp, PARROT_TRACE_OPS_FLAG))
            Parrot_io_eprintf(interp, "*** Parrot VM: Tracing enabled. ***\n");

        Parrot_io_eprintf(interp, "*** Parrot VM: %Ss core ***\n",
                interp->run_core->name);
    }

    /* Set up @ARGS (or whatever this language calls it) in userargv. */
    userargv = setup_argv(interp, argc, argv);

    /*
     * If any profile information was gathered, print it out
     * before exiting, then print debug infos if turned on.
     */
    Parrot_x_on_exit(interp, print_debug,   NULL);

    /* Let's kick the tires and light the fires--call interpreter.c:runops. */
    main_sub = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));

    /* if no sub was marked being :main, we create a dummy sub with offset 0 */

    if (!main_sub)
        main_sub = set_current_sub(interp);

    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), NULL);
    Parrot_pcc_set_constants(interp, interp->ctx, interp->code->const_table);

    Parrot_ext_call(interp, main_sub, "P->", userargv);
}


/*

=item C<Parrot_Opcode * Parrot_debug(PARROT_INTERP, Parrot_Interp debugger,
Parrot_Opcode *pc)>

Runs the interpreter's bytecode in debugging mode.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_Opcode *
Parrot_debug(PARROT_INTERP, ARGIN(Parrot_Interp debugger), ARGIN(Parrot_Opcode *pc))
{
    ASSERT_ARGS(Parrot_debug)
    PDB_t      * const pdb = debugger->pdb;

    pdb->cur_opcode        = pc;

    PDB_init(debugger, NULL);

    /* disassemble needs this for now */
    /*
    interp               = pdb->debugee;
    interp->pdb          = pdb;
    */
    debugger->lo_var_ptr = interp->lo_var_ptr;

    PDB_disassemble(interp, NULL);

    while (!(pdb->state & PDB_EXIT)) {
        const char *command;

        PDB_get_command(debugger);
        command = pdb->cur_command;
        PDB_run_command(debugger, command);
    }

    return NULL;
}


/*

=item C<static void print_constant_table(PARROT_INTERP, PMC *output)>

Prints the contents of the constants table.

=cut

*/
static void
print_constant_table(PARROT_INTERP, ARGIN(PMC *output))
{
    ASSERT_ARGS(print_constant_table)
    const PackFile_ConstTable *ct = interp->code->const_table;
    INTVAL i;

    /* TODO: would be nice to print the name of the file as well */
    Parrot_io_fprintf(interp, output, "=head1 Constant-table\n\n");

    for (i = 0; i < ct->num.const_count; i++)
        Parrot_io_fprintf(interp, output, "NUM_CONST(%d): %f\n", i, ct->num.constants[i]);

    for (i = 0; i < ct->str.const_count; i++)
        Parrot_io_fprintf(interp, output, "STR_CONST(%d): %S\n", i, ct->str.constants[i]);

    for (i = 0; i < ct->pmc.const_count; i++) {
        PMC * const c = ct->pmc.constants[i];
        Parrot_io_fprintf(interp, output, "PMC_CONST(%d): ", i);

        switch (c->vtable->base_type) {
            /* each PBC file has a ParrotInterpreter, but it can't
             * stringify by itself */
            case enum_class_ParrotInterpreter:
                Parrot_io_fprintf(interp, output, "'ParrotInterpreter'");
                break;

            /* FixedIntegerArrays used for signatures, handy to print */
            case enum_class_FixedIntegerArray:
                {
                    const INTVAL n = VTABLE_elements(interp, c);
                    INTVAL j;
                    Parrot_io_fprintf(interp, output, "[");

                    for (j = 0; j < n; ++j) {
                        const INTVAL val = VTABLE_get_integer_keyed_int(interp, c, j);
                        Parrot_io_fprintf(interp, output, "%d", val);
                        if (j < n - 1)
                            Parrot_io_fprintf(interp, output, ",");
                    }
                    Parrot_io_fprintf(interp, output, "]");
                    break;
                }
            case enum_class_NameSpace:
            case enum_class_String:
            case enum_class_Key:
            case enum_class_ResizableStringArray:
                {
                    STRING * const s = VTABLE_get_string(interp, c);
                    if (s)
                        Parrot_io_fprintf(interp, output, "%Ss", s);
                    break;
                }
            case enum_class_Sub:
                Parrot_io_fprintf(interp, output, "%S", VTABLE_get_string(interp, c));
                break;
            default:
                Parrot_io_fprintf(interp, output, "(PMC constant)");
                break;
        }

        Parrot_io_fprintf(interp, output, "\n");
    }

    Parrot_io_fprintf(interp, output, "\n=cut\n\n");
}


/*

=item C<void Parrot_disassemble(PARROT_INTERP, const char *outfile,
Parrot_disassemble_options options)>

Disassembles and prints out the interpreter's bytecode.

This is used by the Parrot disassembler.

=cut

*/

PARROT_EXPORT
void
Parrot_disassemble(PARROT_INTERP,
                   ARGIN_NULLOK(const char *outfile), Parrot_disassemble_options options)
{
    ASSERT_ARGS(Parrot_disassemble)
    PDB_line_t *line;
    PDB_t * const pdb   = mem_gc_allocate_zeroed_typed(interp, PDB_t);
    int num_mappings    = 0;
    int curr_mapping    = 0;
    int op_code_seq_num = 0;
    int debugs;
    PMC *output;

    if (outfile != NULL) {
        output = Parrot_io_open_handle(interp, PMCNULL,
                Parrot_str_new(interp, outfile, 0),
                Parrot_str_new_constant(interp, "tw"));
    }
    else
        output = Parrot_io_stdhandle(interp, PIO_STDOUT_FILENO, PMCNULL);

    interp->pdb     = pdb;
    pdb->cur_opcode = interp->code->base.data;

    PDB_disassemble(interp, NULL);

    line   = pdb->file->line;
    debugs = (interp->code->debugs != NULL);

    print_constant_table(interp, output);
    if (options & enum_DIS_HEADER)
        return;

    if (!(options & enum_DIS_BARE))
        Parrot_io_fprintf(interp, output, "# %12s-%12s", "Seq_Op_Num", "Relative-PC");

    if (debugs) {
        if (!(options & enum_DIS_BARE))
            Parrot_io_fprintf(interp, output, " %6s:\n", "SrcLn#");
        num_mappings = interp->code->debugs->num_mappings;
    }
    else {
        Parrot_io_fprintf(interp, output, "\n");
    }

    while (line->next) {
        const char *c;

        /* Parrot_io_fprintf(interp, output, "%i < %i %i == %i \n", curr_mapping,
         * num_mappings, op_code_seq_num,
         * interp->code->debugs->mappings[curr_mapping].offset); */

        if (debugs && curr_mapping < num_mappings) {
            if (op_code_seq_num == interp->code->debugs->mappings[curr_mapping].offset) {
                const int filename_const_offset =
                    interp->code->debugs->mappings[curr_mapping].filename;
                Parrot_io_fprintf(interp, output, "# Current Source Filename '%Ss'\n",
                        interp->code->const_table->str.constants[filename_const_offset]);
                ++curr_mapping;
            }
        }

        if (!(options & enum_DIS_BARE))
            Parrot_io_fprintf(interp, output, "%012i-%012i",
                             op_code_seq_num, line->opcode - interp->code->base.data);

        if (debugs && !(options & enum_DIS_BARE))
            Parrot_io_fprintf(interp, output, " %06i: ",
                    interp->code->debugs->base.data[op_code_seq_num]);

        /* If it has a label print it */
        if (line->label)
            Parrot_io_fprintf(interp, output, "L%li:\t", line->label->number);
        else
            Parrot_io_fprintf(interp, output, "\t");

        c = pdb->file->source + line->source_offset;

        while (c && *c != '\n')
            Parrot_io_fprintf(interp, output, "%c", *(c++));

        Parrot_io_fprintf(interp, output, "\n");
        line = line->next;
        ++op_code_seq_num;
    }
    if (outfile != NULL)
        Parrot_io_close_handle(interp, output);

    return;
}


/*

=item C<Parrot_PMC Parrot_compile_string(PARROT_INTERP, Parrot_String type,
const char *code, Parrot_String *error)>

Compiles a code string.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
Parrot_PMC
Parrot_compile_string(PARROT_INTERP, Parrot_String type, ARGIN(const char *code),
        ARGOUT(Parrot_String *error))
{
    ASSERT_ARGS(Parrot_compile_string)
    PMC * const compiler = Parrot_get_compiler(interp, type);

    /* XXX error is not being set */
    if (PMC_IS_NULL(compiler)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not find compiler %Ss", type);
    }
    else {
        PMC *result;
        STRING * const code_s = Parrot_str_new(interp, code, 0);
        imc_info_t * imcc     = (imc_info_t*) VTABLE_get_pointer(interp, compiler);
        const INTVAL is_pasm  = VTABLE_get_integer(interp, compiler);

        Parrot_block_GC_mark(interp);
        result = imcc_compile_string(imcc, code_s, is_pasm);
        if (PMC_IS_NULL(result)) {
            STRING * const msg = imcc_last_error_message(imcc);
            const INTVAL code  = imcc_last_error_code(imcc);

            Parrot_unblock_GC_mark(interp);
            Parrot_ex_throw_from_c_args(interp, NULL, code, "%Ss", msg);
        }
        Parrot_unblock_GC_mark(interp);
        return result;
    }
}

/*

=item C<void Parrot_set_configuration_hash_legacy(PARROT_INTERP, const int
length, const unsigned char *bytes)>

Legacy function for setting the configuration hash as an array of bytes for
the old API. New programs should not use this. They should use the new API and
C<Parrot_api_set_configuration_hash>

=cut

*/

PARROT_EXPORT
void
Parrot_set_configuration_hash_legacy(PARROT_INTERP, const int length,
        ARGIN(const unsigned char *bytes))
{
    ASSERT_ARGS(Parrot_set_configuration_hash_legacy)
    STRING * const fpmc_str = Parrot_str_new_init(interp, (const char *)bytes,
        length, Parrot_binary_encoding_ptr, PObj_external_FLAG);
    PMC * const pmc = Parrot_thaw(interp, fpmc_str);
    Parrot_set_config_hash_pmc(interp, pmc);
    Parrot_lib_update_paths_from_config_hash(interp);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/embed.h> and F<docs/embed.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
