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

#include "parrot/sysmem.h"

/* Solution copied from http://www.perlmonks.org/?node_id=749964 */
#if defined __MINGW32__ && __GNUC__ < 4
typedef struct _MEMORYSTATUSEX {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    DWORDLONG ullTotalPhys;
    DWORDLONG ullAvailPhys;
    DWORDLONG ullTotalPageFile;
    DWORDLONG ullAvailPageFile;
    DWORDLONG ullTotalVirtual;
    DWORDLONG ullAvailVirtual;
    DWORDLONG ullAvailExtendedVirtual;
} MEMORYSTATUSEX, *LPMEMORYSTATUSEX;

WINBASEAPI BOOL WINAPI GlobalMemoryStatusEx(LPMEMORYSTATUSEX);
#endif

/*

=item C<size_t Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physycal memory.

=cut

*/

size_t
Parrot_sysmem_amount(PARROT_INTERP)
{
    /* Copy-pasted from example at */
    /* http://msdn.microsoft.com/en-us/library/aa366589(v=VS.85).aspx */
    MEMORYSTATUSEX statex;

    statex.dwLength = sizeof (MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&statex);
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
