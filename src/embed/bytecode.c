/*
Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

src/embed/bytecode.c - Interface routines for working with Bytecode

=head1 DESCRIPTION

This file implements functions of the Parrot embedding interface dealing
with Parrot bytecode.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

/*

=item C<Parrot_Int Parrot_api_load_bytecode_file(Parrot_PMC interp_pmc,
Parrot_String filename, Parrot_PMC * pbc)>

Load a bytecode file and stores the resulting bytecode in C<pbc>. This function
returns a true value if this call is successful and false value otherwise.

=cut

*/

/* TODO: This only works with the inital bytecode. After this we should use
         Parrot_append_bytecode or something similar */

PARROT_API
Parrot_Int
Parrot_api_load_bytecode_file(Parrot_PMC interp_pmc,
        ARGIN(Parrot_String filename), ARGOUT(Parrot_PMC * pbc))
{
    ASSERT_ARGS(Parrot_api_load_bytecode_file)
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = Parrot_pf_read_pbc_file(interp, filename);
    *pbc = Parrot_pf_get_packfile_pmc(interp, pf);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_load_bytecode_bytes(Parrot_PMC interp_pmc, const
unsigned char * const pbc, Parrot_Int bytecode_size, Parrot_PMC * pbcpmc)>

Unpacks a bytecode from a buffer C<pbc> of a C<bytecode_size> size, and stores
the resulting bytecode in C<pbcpmc>. This function returns a true value if this
call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_load_bytecode_bytes(Parrot_PMC interp_pmc,
        ARGIN(const unsigned char * const pbc), Parrot_Int bytecode_size,
        ARGOUT(Parrot_PMC * pbcpmc))
{
    ASSERT_ARGS(Parrot_api_load_bytecode_bytes)
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = PackFile_new(interp, 0);
    PARROT_ASSERT(pf);

    Parrot_block_GC_mark(interp);
    if (!PackFile_unpack(interp, pf, (const opcode_t *)pbc, bytecode_size)) {
        Parrot_unblock_GC_mark(interp);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "Could not unpack packfile");
    }
    *pbcpmc = Parrot_pf_get_packfile_pmc(interp, pf);
    Parrot_unblock_GC_mark(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/* Load the bytecode into the interpreter, but don't execute it */
/* TODO: This only works with the inital bytecode. After this we should use
       Parrot_append_bytecode or something similar */

/*

=item C<Parrot_Int Parrot_api_ready_bytecode(Parrot_PMC interp_pmc, Parrot_PMC
pbc, Parrot_PMC *main_sub)>

Prepares the bytecode C<pbc> to be run and stores the entry point subroutine in
C<main_sub>. This function returns a true value if this call is successful and
false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_ready_bytecode(Parrot_PMC interp_pmc, Parrot_PMC pbc,
        ARGOUT(Parrot_PMC *main_sub))
{
    ASSERT_ARGS(Parrot_api_ready_bytecode)
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);

    /* Debugging mode nonsense. */
    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
         Parrot_io_eprintf(interp, "*** Parrot VM: %Ss core ***\n",
                 interp->run_core->name);
    }

    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not get packfile.");
    if (pf->cur_cs)
        Parrot_pf_set_current_packfile(interp, pbc);

    PackFile_fixup_subs(interp, PBC_MAIN, NULL);
    *main_sub = Parrot_pf_get_packfile_main_sub(interp, pbc);
    Parrot_pcc_set_constants(interp, interp->ctx, interp->code->const_table);
    EMBED_API_CALLOUT(interp_pmc, interp)
}


/*

=item C<Parrot_Int Parrot_api_run_bytecode(Parrot_PMC interp_pmc, Parrot_PMC
pbc, Parrot_PMC mainargs)>

Runs the bytecode C<pbc> passing optional C<mainargs> parameters. This function
returns a true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_run_bytecode(Parrot_PMC interp_pmc, Parrot_PMC pbc,
    Parrot_PMC mainargs)
{
    ASSERT_ARGS(Parrot_api_run_bytecode)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_PMC args = mainargs ? mainargs : PMCNULL;

    /* Print out information if we are debugging */
    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
         Parrot_io_eprintf(interp, "*** Parrot VM: %Ss core ***\n",
                 interp->run_core->name);
    }

    Parrot_pf_execute_bytecode_program(interp, pbc, args);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_disassemble_bytecode(Parrot_PMC interp_pmc,
Parrot_PMC pbc, const char * const outfile, Parrot_Int opts)>

Disassembles and prints out the C<pbc> bytecode. This function returns a true
value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_disassemble_bytecode(Parrot_PMC interp_pmc, Parrot_PMC pbc,
        ARGIN_NULLOK(const char * const outfile), Parrot_Int opts)
{
    ASSERT_ARGS(Parrot_api_disassemble_bytecode)
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);
    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not get packfile.");
    if (pf->cur_cs)
        Parrot_pf_set_current_packfile(interp, pbc);
    /* TODO: Break up the dependency with embed.c */
    Parrot_disassemble(interp, outfile, (Parrot_disassemble_options)opts);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_serialize_bytecode_pmc(Parrot_PMC interp_pmc,
Parrot_PMC pbc, Parrot_String * bc)>

Serialize a packfile PMC into a sequence of bytes suitable for writing out
to a .pbc file

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_serialize_bytecode_pmc(Parrot_PMC interp_pmc, Parrot_PMC pbc,
        ARGOUT(Parrot_String * bc))
{
    ASSERT_ARGS(Parrot_api_serialize_bytecode_pmc)
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);
    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not get packfile.");
    *bc = Parrot_pf_serialize(interp, pf);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_write_bytecode_to_file(Parrot_PMC interp_pmc,
Parrot_PMC pbc, Parrot_String filename)>

Write out a PackFile PMC to a .pbc file

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_write_bytecode_to_file(Parrot_PMC interp_pmc, Parrot_PMC pbc,
        Parrot_String filename)
{
    ASSERT_ARGS(Parrot_api_write_bytecode_to_file)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_pf_write_pbc_file(interp, pbc, filename);
    EMBED_API_CALLOUT(interp_pmc, interp)
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
