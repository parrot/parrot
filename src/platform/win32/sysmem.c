/*
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/win32/sysmem.c

=head1 DESCRIPTION

Get system memory information.

=head2 Functions

=over 4

=cut

*/

#ifdef __MINGW32__
#  include <w32api.h>
#  if WINVER < Windows2000
#    error Minimum requirement for Parrot on Windows is Windows 2000 - might want to check windef.h
#  endif
#endif

#include "parrot/parrot.h"
#include <windows.h>

/* HEADERIZER HFILE: none */

/*

=item C<size_t Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physical memory.

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
    return statex.ullTotalPhys;
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
