/* Copyright (C) 2001-2011, Parrot Foundation. */

/*

=head1 NAME

src/embed/hbdb.c - The Honey Bee Debugger

=head1 DESCRIPTION

This file contains the embedding API wrapper functions and types used by the C<hbdb> debugger.

=head1 FUNCTIONS

=over 4

=cut

*/

/* TODO Perldoc section for types */

#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/embed.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

/*

=item C<Parrot_Int Parrot_api_hbdb_get_command(Parrot_PMC interp_pmc)>

Wrapper function for C<hbdb_get_command()>. Prompts the user to enter a command.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_hbdb_get_command(Parrot_PMC interp_pmc)
{
    ASSERT_ARGS(Parrot_api_hbdb_get_command)

    EMBED_API_CALLIN(interp_pmc, interp)

    hbdb_get_command(interp);

    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_hbdb_get_line_number(Parrot_PMC interp_pmc,
Parrot_PMC *context_pmc)>

Wrapper function for C<hbdb_get_line_number()>. Returns the line number for the current context.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_hbdb_get_line_number(Parrot_PMC interp_pmc, ARGIN(Parrot_PMC *context_pmc))
{
    ASSERT_ARGS(Parrot_api_hbdb_get_line_number)

    EMBED_API_CALLIN(interp_pmc, interp)

    hbdb_get_line_number(interp, context_pmc);

    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_hbdb_init(Parrot_PMC interp_pmc)>

Wrapper function for C<hbdb_init()>. Performs general initialization operations.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_hbdb_init(Parrot_PMC interp_pmc)
{
    ASSERT_ARGS(Parrot_api_hbdb_init)

    EMBED_API_CALLIN(interp_pmc, interp)

    hbdb_init(interp);

    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=back

=head1 SEE ALSO

F<frontend/hbdb/main.c>, F<src/hbdb.c>, F<include/parrot/hbdb.h>

=head1 HISTORY

The initial version of C<hbdb> was written by Kevin Polulak (soh_cah_toa) as
part of Google Summer of Code 2011.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

