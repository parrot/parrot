/*
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/win32/uid.c

=head1 DESCRIPTION

Get information about the current user

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <windows.h>

/* HEADERIZER HFILE: none */

/*

=item C<UINTVAL Parrot_get_user_id(void)>

Get user id - returns 0 for Win32

=cut

*/

UINTVAL
Parrot_get_user_id(void)
{
    /* TODO */
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
