/* Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/win32/pid.c

=head1 DESCRIPTION

Parrot process id functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <windows.h>

/*

=item C<UINTVAL Parrot_getpid(void)>

Get current process system-wide unique ID, returning an UINTVAL.

=cut

*/

UINTVAL
Parrot_getpid(void)
{
    DWORD pid = GetCurrentProcessId();
    return (UINTVAL)pid;
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
