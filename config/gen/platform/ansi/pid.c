/* $Id: $
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/ansi/pid.c

=head1 DESCRIPTION

Parrot process id functions.

=head2 Functions

=over 4

=cut

=item C<INTVAL Parrot_getpid(void)>

Parrot wrapper around standard library C<getpid()> function, returning an UINTVAL.

=cut

*/

UINTVAL
Parrot_getpid(void)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_getpid unuseful in this platform");
    return 0;
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
