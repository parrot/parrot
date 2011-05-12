/*
 * Copyright (C) 2011, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/entropy.c

=head1 DESCRIPTION

Get some entropy from the system.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_platform_init_code(void)>

Get one INTVAL worth of entropy from the system.

=cut

*/

INTVAL
Parrot_platform_get_entropy(void) {
    INTVAL entropy;
    FILE *fh = fopen("/dev/urandom", "r");
    size_t sz = fread(&entropy, sizeof(INTVAL), 1, fh);
    if (sz != sizeof(INTVAL)) {
        /* ... */
    }
    return entropy;
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
