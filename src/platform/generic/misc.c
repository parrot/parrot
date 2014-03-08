/*
 * Copyright (C) 2011-2014, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/misc.c

=head1 DESCRIPTION

Miscellaneous helper functions.

Please avoid adding to this file.  Individual families of functions
should normally go in individual files.  Platform-specific overrides
then go in the platform-specific directories.

=head2 Functions

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=over 4

=item C<void Parrot_platform_init_code(void)>

Generic version is a no-op.

=back

=cut

*/

void
Parrot_platform_init_code(void)
{
}

/*
 *
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

