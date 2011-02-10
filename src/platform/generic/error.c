/*
 * Copyright (C) 2011, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/error.c

=head1 DESCRIPTION

Functions for handling system errors.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<STRING * Parrot_platform_strerror(PARROT_INTERP, INTVAL error)>

Returns a error message for a system error code.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_platform_strerror(PARROT_INTERP, INTVAL error)
{
    const char *msg = strerror(error);

    return Parrot_str_new(interp, msg, 0);
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

