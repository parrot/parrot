/*
 * Copyright (C) 2011, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/encoding.c

=head1 DESCRIPTION

Platform C string encoding management

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_init_platform_encoding(PARROT_INTERP)>

Set the platform encoding pointer, used for encoding/decoding strings passed to
the OS, to an appropriate value.

=cut

*/

void
Parrot_init_platform_encoding(PARROT_INTERP)
{
    Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
}


/*

=item C<size_t Parrot_str_platform_strlen(PARROT_INTERP, const char *s)>

Get the length of a platform-encoded C string.

=cut

*/

size_t
Parrot_str_platform_strlen(PARROT_INTERP, const char *s)
{
    return strlen(s);
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
