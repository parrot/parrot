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

#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/embed.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

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

=item C<Parrot_Int Parrot_api_hbdb_load_source(Parrot_PMC interp_pmc, const char
*file)>

Wrapper function for C<hbdb_load_source()>. Loads source file into memory.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_hbdb_load_source(Parrot_PMC interp_pmc, ARGIN(const char *file))
{
    ASSERT_ARGS(Parrot_api_hbdb_load_source)

    EMBED_API_CALLIN(interp_pmc, interp)

    hbdb_load_source(interp, file);

    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_hbdb_runloop(Parrot_PMC interp_pmc, int argc,
const char *argv[])>

Wrapper function for C<hbdb_runloop()>. Begins the main runloop by executing
the debugee's source code.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_hbdb_runloop(Parrot_PMC interp_pmc, int argc, ARGIN(const char *argv[]))
{
    EMBED_API_CALLIN(interp_pmc, interp)

    hbdb_runloop(interp, argc, argv);

    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_hbdb_destroy(Parrot_PMC interp_pmc)>

Wrapper function for C<hbdb_destroy()>. Destroys the current instance of the
debugger by freeing the memory allocated for it's interpreter.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_hbdb_destroy(Parrot_PMC interp_pmc)
{
    ASSERT_ARGS(Parrot_api_hbdb_destroy)

    EMBED_API_CALLIN(interp_pmc, interp)

    hbdb_destroy(interp);

    EMBED_API_CALLOUT(interp_pmc, interp)

    Parrot_api_destroy_interpreter(interp_pmc);
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

