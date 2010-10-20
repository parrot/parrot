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
