/*
 * $Id$
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/win32/sysmem.c

=head1 DESCRIPTION

Get system memory information.

=head2 Functions

=over 4

=cut

*/

#define _WIN32_WINNT 0x0500

#include <windows.h>
#include <stdio.h>

/*

=item C<PMC * Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physycal memory.

=cut

*/

size_t
Parrot_sysmem_amount(PARROT_INTERP)
{
    /* Copy-pasted from example at */
    /* http://msdn.microsoft.com/en-us/library/aa366589(v=VS.85).aspx */
    MEMORYSTATUSEX statex;
    bool status;

    statex.dwLength = sizeof(MEMORYSTATUSEX);
    status = GlobalMemoryStatusEx(&statex);
    /* TODO Check status and bail out */
    return statex.ullAvailPhys;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
