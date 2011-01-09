/* Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/ansi/pid.c

=head1 DESCRIPTION

Parrot process id functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<UINTVAL Parrot_getpid(void)>

Parrot wrapper around standard library C<getpid()> function.

Return 0 in platforms unsupported or without a pid concept.

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
