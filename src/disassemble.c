/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/disassemble.c - The Parrot Disassembler

=head1 DESCRIPTION

This file implements some logic for the parrot disassembler, and related
routines.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/disassemble.h"
#include "parrot/oplib/ops.h"
#include "pmc/pmc_sub.h"
#include "parrot/oplib/core_ops.h"

/* HEADERIZER HFILE: include/parrot/disassemble.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void print_constant_table(PARROT_INTERP, ARGIN(PMC *output))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_print_constant_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(output))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


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

=back


=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
