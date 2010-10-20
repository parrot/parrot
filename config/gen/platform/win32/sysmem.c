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

=item C<PMC * Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physycal memory.

=cut

*/

size_t
Parrot_sysmem_amount(PARROT_INTERP)
{
    /* FIXME: Stub only. Returns 1 GB */
    return 1 * 1024 * 1024;
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
