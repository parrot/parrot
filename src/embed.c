/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/embed.c - The Parrot embedding interface

=head1 DESCRIPTION

This file implements the Parrot embedding interface.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/oplib/ops.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"
#include "parrot/runcore_api.h"

#include "../compilers/imcc/imc.h"

#include "embed.str"

/* HEADERIZER HFILE: include/parrot/embed.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void print_constant_table(PARROT_INTERP, ARGIN(PMC *output))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void print_debug(PARROT_INTERP, SHIM(int status), SHIM(void *p))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static PMC* set_current_sub(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static PMC* setup_argv(PARROT_INTERP, int argc, ARGIN(const char **argv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_print_constant_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output))
#define ASSERT_ARGS_print_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_set_current_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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
    init_world_once(interp);
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
    PackFile *pf;
    char     *program_code;
    FILE     *io        = NULL;
    INTVAL    is_mapped = 0;
    INTVAL    program_size;

#ifdef PARROT_HAS_HEADER_SYSMMAN
    int       fd        = -1;
#endif

    if (!fullname || STREQ(fullname, "-")) {
        /* read from STDIN */
        io = stdin;

        /* read 1k at a time */
        program_size = 0;
    }
    else {
        STRING * const fs = string_make(interp, fullname, strlen(fullname),
            NULL, 0);

        /* can't read a file that doesn't exist */
        if (!Parrot_stat_info_intval(interp, fs, STAT_EXISTS)) {
            Parrot_io_eprintf(interp, "Parrot VM: Can't stat %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }

        /* we may need to relax this if we want to read bytecode from pipes */
        if (!Parrot_stat_info_intval(interp, fs, STAT_ISREG)) {
            Parrot_io_eprintf(interp,
                "Parrot VM: '%s', is not a regular file %i.\n",
                fullname, errno);
            return NULL;
        }

        program_size = Parrot_stat_info_intval(interp, fs, STAT_FILESIZE);

#ifndef PARROT_HAS_HEADER_SYSMMAN
        io = fopen(fullname, "rb");

        if (!io) {
            Parrot_io_eprintf(interp, "Parrot VM: Can't open %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }
#endif  /* PARROT_HAS_HEADER_SYSMMAN */

    }
#ifdef PARROT_HAS_HEADER_SYSMMAN
again:
#endif
    /* if we've opened a file (or stdin) with PIO, read it in */
    if (io) {
        char  *cursor;
        size_t chunk_size = program_size > 0 ? program_size : 1024;
        INTVAL wanted     = program_size;
        size_t read_result;

        program_code = mem_gc_allocate_n_typed(interp, chunk_size, char);
        cursor       = program_code;
        program_size = 0;

        while ((read_result = fread(cursor, 1, chunk_size, io)) > 0) {
            program_size += read_result;

            if (program_size == wanted)
                break;

            chunk_size   = 1024;
            program_code = mem_gc_realloc_n_typed(interp, program_code,
                    program_size + chunk_size, char);

            if (!program_code) {
                Parrot_io_eprintf(interp,
                            "Parrot VM: Could not reallocate buffer "
                            "while reading packfile from PIO.\n");
                fclose(io);
                return NULL;
            }

            cursor = (char *)(program_code + program_size);
        }

        if (ferror(io)) {
            Parrot_io_eprintf(interp,
             "Parrot VM: Problem reading packfile from PIO:  code %d.\n",
                        ferror(io));
            fclose(io);
            mem_gc_free(interp, program_code);
            return NULL;
        }

        fclose(io);
    }
    else {
        /* if we've gotten here, we opted not to use PIO to read the file.
         * use mmap */

#ifdef PARROT_HAS_HEADER_SYSMMAN

        /* check that fullname isn't NULL, just in case */
        if (!fullname)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "Trying to open a NULL filename");

        fd = open(fullname, O_RDONLY | O_BINARY);

        if (!fd) {
            Parrot_io_eprintf(interp, "Parrot VM: Can't open %s, code %i.\n",
                    fullname, errno);
            return NULL;
        }

        program_code = (char *)mmap(0, (size_t)program_size,
                        PROT_READ, MAP_SHARED, fd, (off_t)0);

        if (program_code == (void *)MAP_FAILED) {
            Parrot_warn(interp, PARROT_WARNINGS_IO_FLAG,
                    "Parrot VM: Can't mmap file %s, code %i.\n",
                    fullname, errno);

            /* try again, now with IO reading the file */
            io = fopen(fullname, "rb");
            if (!io) {
                Parrot_io_eprintf(interp,
                    "Parrot VM: Can't open %s, code %i.\n", fullname, errno);
                return NULL;
            }
            goto again;
        }

        is_mapped = 1;

#else   /* PARROT_HAS_HEADER_SYSMMAN */

        Parrot_io_eprintf(interp, "Parrot VM: uncaught error occurred reading "
                    "file or mmap not available.\n");
        return NULL;

#endif  /* PARROT_HAS_HEADER_SYSMMAN */

    }

    /* Now that we have the bytecode, let's unpack it. */

    pf = PackFile_new(interp, is_mapped);

    /* Make the cmdline option available to the unpackers */
    pf->options = debug;

    if (!PackFile_unpack(interp, pf, (opcode_t *)program_code,
            (size_t)program_size)) {
        Parrot_io_eprintf(interp, "Parrot VM: Can't unpack packfile %s.\n",
                fullname);
        return NULL;
    }

    /* Set :main routine */
    if (!(pf->options & PFOPT_HEADERONLY))
        do_sub_pragmas(interp, pf->cur_cs, PBC_PBC, NULL);

    /* Prederefing the sub/the bytecode is done in switch_to_cs before
     * actual usage of the segment */

#ifdef PARROT_HAS_HEADER_SYSMMAN
    /* the man page states that it's ok to close a mmaped file */
    if (fd >= 0)
        close(fd);
#endif

    return pf;
}


/*

=item C<void Parrot_pbc_load(PARROT_INTERP, Parrot_PackFile pf)>

Loads the C<PackFile> returned by C<Parrot_pbc_read()>.

=cut

*/

PARROT_EXPORT
void
Parrot_pbc_load(PARROT_INTERP, ARGIN(Parrot_PackFile pf))
{
    ASSERT_ARGS(Parrot_pbc_load)
    if (!pf) {
        Parrot_io_eprintf(interp, "Invalid packfile\n");
        return;
    }

    interp->initial_pf = pf;
    interp->code       = pf->cur_cs;
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
        STRING * const arg =
            string_make(interp, argv[i], strlen(argv[i]), "unicode",
                PObj_external_FLAG);

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
print_debug(PARROT_INTERP, SHIM(int status), SHIM(void *p))
{
    ASSERT_ARGS(print_debug)
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        /* Give souls brave enough to activate debugging an earful about GC. */

        Parrot_io_eprintf(interp, "*** Parrot VM: Dumping GC info ***\n");
        PDB_info(interp);
    }
}


/*

=item C<static PMC* set_current_sub(PARROT_INTERP)>

Search the fixup table for a PMC matching the argument.  On a match,
set up the appropriate context.

If no match, set up a dummy PMC entry.  In either case, return a
pointer to the PMC.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC*
set_current_sub(PARROT_INTERP)
{
    ASSERT_ARGS(set_current_sub)
    PMC *new_sub_pmc;

    PackFile_ByteCode   * const cur_cs = interp->code;
    PackFile_FixupTable * const ft     = cur_cs->fixups;
    PackFile_ConstTable * const ct     = cur_cs->const_table;

    opcode_t    i;

    /*
     * Walk the fixup table.  The first Sub-like entry should be our
     * entry point with the address at our resume_offset.
     */

    for (i = 0; i < ft->fixup_count; ++i) {
        if (ft->fixups[i].type == enum_fixup_sub) {
            const opcode_t ci      = ft->fixups[i].offset;
            PMC    * const sub_pmc = ct->constants[ci]->u.key;
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
       The default values set by SUb.init are appropiate for the
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
    Parrot_on_exit(interp, print_debug,   NULL);

    /* Let's kick the tires and light the fires--call interpreter.c:runops. */
    main_sub = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));

    /* if no sub was marked being :main, we create a dummy sub with offset 0 */

    if (!main_sub)
        main_sub = set_current_sub(interp);

    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), NULL);
    Parrot_pcc_set_constants(interp, interp->ctx, interp->code->const_table->constants);

    Parrot_pcc_invoke_sub_from_c_args(interp, main_sub, "P->", userargv);
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
    const INTVAL numconstants = interp->code->const_table->const_count;
    INTVAL i;

    /* TODO: would be nice to print the name of the file as well */
    Parrot_io_fprintf(interp, output, "=head1 Constant-table\n\n");

    for (i = 0; i < numconstants; ++i) {
        const PackFile_Constant * const c = interp->code->const_table->constants[i];

        switch (c->type) {
          case PFC_NUMBER:
            Parrot_io_fprintf(interp, output, "PMC_CONST(%d): %f\n", i, c->u.number);
            break;
          case PFC_STRING:
            Parrot_io_fprintf(interp, output, "PMC_CONST(%d): %S\n", i, c->u.string);
            break;
          case PFC_KEY:
            Parrot_io_fprintf(interp, output, "PMC_CONST(%d): ", i);
            /* XXX */
            /* Parrot_print_p(interp, c->u.key); */
            Parrot_io_fprintf(interp, output, "(PMC constant)");
            Parrot_io_fprintf(interp, output, "\n");
            break;
          case PFC_PMC:
            {
                Parrot_io_fprintf(interp, output, "PMC_CONST(%d): ", i);

                switch (c->u.key->vtable->base_type) {
                    /* each PBC file has a ParrotInterpreter, but it can't
                     * stringify by itself */
                  case enum_class_ParrotInterpreter:
                    Parrot_io_fprintf(interp, output, "'ParrotInterpreter'");
                    break;

                    /* FixedIntegerArrays used for signatures, handy to print */
                  case enum_class_FixedIntegerArray:
                    {
                        const INTVAL n = VTABLE_elements(interp, c->u.key);
                        INTVAL j;
                        Parrot_io_fprintf(interp, output, "[");

                        for (j = 0; j < n; ++j) {
                            const INTVAL val = VTABLE_get_integer_keyed_int(interp, c->u.key, j);
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
                        /*Parrot_print_p(interp, c->u.key);*/
                        STRING * const s = VTABLE_get_string(interp, c->u.key);
                        if (s)
                            Parrot_io_fprintf(interp, output, "%Ss", s);
                        break;
                    }
                  case enum_class_Sub:
                    Parrot_io_fprintf(interp, output, "%S", VTABLE_get_string(interp, c->u.key));
                    break;
                  default:
                    Parrot_io_fprintf(interp, output, "(PMC constant)");
                    break;
                }

                Parrot_io_fprintf(interp, output, "\n");
                break;
            }
          default:
            Parrot_io_fprintf(interp, output,  "wrong constant type in constant table!\n");
            /* XXX throw an exception? Is it worth the trouble? */
            break;
        }
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
        output = Parrot_io_open(interp, PMCNULL,
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
                        interp->code->const_table->constants[filename_const_offset]->u.string);
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
        Parrot_io_close(interp, output);

    return;
}


/*

=item C<void Parrot_run_native(PARROT_INTERP, native_func_t func)>

Runs the C function C<func> through the program C<[enternative, end]>.  This
ensures that the function runs with the same setup as in other run loops.

This function is used in some of the source tests in F<t/src> which use
the interpreter outside a runloop.

=cut

*/

PARROT_EXPORT
void
Parrot_run_native(PARROT_INTERP, native_func_t func)
{
    ASSERT_ARGS(Parrot_run_native)
    PackFile * const pf = PackFile_new(interp, 0);
    static opcode_t program_code[2];

    program_code[0] = interp->op_lib->op_code(interp, "enternative", 0);
    program_code[1] = 0; /* end */

    pf->cur_cs = (PackFile_ByteCode *)
        (pf->PackFuncs[PF_BYTEC_SEG].new_seg)(interp, pf,
                Parrot_str_new_constant(interp, "code"), 1);
    pf->cur_cs->base.data = program_code;
    pf->cur_cs->base.size = 2;

    Parrot_pbc_load(interp, pf);

    run_native = func;

    if (interp->code && interp->code->const_table)
        Parrot_pcc_set_constants(interp, interp->ctx, interp->code->const_table->constants);

    runops(interp, interp->resume_offset);
}


/*

=item C<Parrot_PMC Parrot_compile_string(PARROT_INTERP, Parrot_String type,
const char *code, Parrot_String *error)>

Compiles a code string.

=cut

*/

PARROT_EXPORT
Parrot_PMC
Parrot_compile_string(PARROT_INTERP, Parrot_String type, ARGIN(const char *code),
        ARGOUT(Parrot_String *error))
{
    ASSERT_ARGS(Parrot_compile_string)
    /* For the benefit of embedders that do not load any pbc
     * before compiling a string */

    if (!interp->initial_pf) {
        /* SIDE EFFECT: PackFile_new_dummy sets interp->initial_pf */
        interp->initial_pf = PackFile_new_dummy(interp, CONST_STRING(interp, "compile_string"));
        /* Assumption: there is no valid reason to fail to create it.
         * If the assumption changes, replace the assertion with a
         * runtime check */
        PARROT_ASSERT(interp->initial_pf);
    }

    if (Parrot_str_compare(interp, CONST_STRING(interp, "PIR"), type) == 0)
        return IMCC_compile_pir_s(interp, code, error);

    if (Parrot_str_compare(interp, CONST_STRING(interp, "PASM"), type) == 0)
        return IMCC_compile_pasm_s(interp, code, error);

    *error = Parrot_str_new(interp, "Invalid interpreter type", 0);
    return NULL;
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
 * vim: expandtab shiftwidth=4:
 */
