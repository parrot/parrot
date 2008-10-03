/*
 * $Id$
 * Copyright (C) 2004-2006, The Perl Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\misc.c

=head1 DESCRIPTION

Miscellaneous helper functions that are specific to Win32.

=head2 Functions

=over 4

=cut

*/

/*

=item C<void Parrot_platform_init_code(void)>

Initialize Parrot for the Win32 platform. Turns off ugly crash dialog
boxes on Win32.

=cut

*/

void
Parrot_platform_init_code(void)
{
    SetErrorMode(SEM_NOGPFAULTERRORBOX);
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

