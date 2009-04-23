/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/netbsd/misc.c

=head1 DESCRIPTION

Miscellaneous helper functions that are specific to NetBSD.

=head2 Functions

=over 4

=cut

*/

/*

=item C<void Parrot_platform_init_code(void)>

Initialize Parrot for the NetBSD platform.
So far only turns off SIGFPE for Alpha.

=cut

*/

#include <signal.h>

void
Parrot_platform_init_code(void)
{
#if defined(__alpha__)
    signal(SIGFPE, SIG_IGN);
#endif
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
