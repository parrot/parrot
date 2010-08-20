/* $Id: $
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/pid.c

=head1 DESCRIPTION

Parrot process id functions.

=head2 Functions

=over 4

=cut

*/

#include <sys/types.h>
#include <unistd.h>

/*

=item C<INTVAL Parrot_getpid(void)>

Parrot wrapper around standard library C<getpid()> function, returning an UINTVAL.

=cut

*/

UINTVAL
Parrot_getpid(void)
{
    return getpid();
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
