/*
 * Copyright (C) 2010, Parrot Foundation.
 */

#include <unistd.h>
#include "parrot/parrot.h"

/*

=head1 NAME

config/gen/platform/generic/uid.c

=head1 DESCRIPTION

Get information about the current user

=head2 Functions

=over 4

=cut

*/

UINTVAL
Parrot_get_user_id()
{
    // Win32 doesn't have a notion of current user name
    return (UINTVAL)0;
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
