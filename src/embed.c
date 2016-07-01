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

static void print_debug(PARROT_INTERP, int status, ARGIN_NULLOK(void *p))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_print_constant_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output))
#define ASSERT_ARGS_print_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<Parrot_PackFile Parrot_pbc_read(PARROT_INTERP, const char *fullname,
const int debug)>

Read in a bytecode, unpack it into a C<PackFile> structure, and do fixups.

DEPRECATED: Use Parrot_pf_read_pbc_file instead.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_PackFile
Parrot_pbc_read(PARROT_INTERP, ARGIN_NULLOK(const char *fullname), const int debug)
{
    ASSERT_ARGS(Parrot_pbc_read)
    STRING * const str = Parrot_str_new(interp, fullname, 0);
    PackFile * const pf = Parrot_pf_read_pbc_file(interp, str);
    PMC * const pfpmc = Parrot_pf_get_packfile_pmc(interp, pf);
    UNUSED(debug);
    return (Parrot_PackFile)pfpmc;
}

/*

=item C<void Parrot_pbc_load(PARROT_INTERP, Parrot_PackFile pf)>

Loads the C<PackFile> returned by C<Parrot_pbc_read()>.

DEPRECATED: Use Parrot_pf_set_current_packfile instead.

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

=item C<void Parrot_pbc_fixup_loaded(PARROT_INTERP)>

Fixups after pbc loading

DEPRECATED: Don't use this. Use Parrot_pf_prepare_packfile_load instead.

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

=item C<static void print_debug(PARROT_INTERP, int status, void *p)>

Prints GC info.

=cut

*/

static void
print_debug(PARROT_INTERP, SHIM(int status), ARGIN_NULLOK(SHIM(void *p)))
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

DEPRECATED: use Parrot_pf_get_packfile_main_sub instead

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

DEPRECATED: Use Parrot_pf_execute_bytecode_program instead

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
    userargv = Parrot_pmc_box_c_string_array(interp, argc, argv);

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

DEPRECATED: Do not use.

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

TODO: Move this to a dedicated file, or some place more related to disassembly.

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

=item C<void Parrot_set_configuration_hash_legacy(PARROT_INTERP, const int
length, const unsigned char *bytes)>

Legacy function for setting the configuration hash as an array of bytes for
the old API. New programs should not use this. They should use the new API and
C<Parrot_api_set_configuration_hash>

DEPRECATED: Use Parrot_set_config_hash_pmc instead.

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
