/*
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/uid.c

=head1 DESCRIPTION

Get information about the current user

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <unistd.h>

/* HEADERIZER HFILE: none */

/*

=item C<UINTVAL Parrot_get_user_id(void)>

Get user id

=cut

*/

UINTVAL
Parrot_get_user_id(void)
{
    return (UINTVAL)getuid();
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
