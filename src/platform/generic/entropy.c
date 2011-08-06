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

=item C<void Parrot_get_entropy(PARROT_INTERP)>

Get one INTVAL worth of entropy from the system.

=cut

*/

INTVAL
Parrot_get_entropy(PARROT_INTERP) {
    INTVAL  entropy;
    size_t  count;
    FILE   *urand_fh = fopen("/dev/urandom", "r");

    if (!urand_fh) {
        const char *msg = "Couldn't open /dev/urandom for reading.";
        /* This function is called during interp init, so use the GC registry
         * as a way to figure out interp's initialziedness.
         */
        if (interp->gc_registry)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, msg);
        else
            PANIC(interp, msg);
    }
    count = fread(&entropy, sizeof (INTVAL), 1, urand_fh);
    if (count != 1) {
        const char* msg = "Couldn't read from /dev/urandom.";
        fclose(urand_fh);
        if (interp->gc_registry)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, msg);
        else
            PANIC(interp, msg);
    }
    fclose(urand_fh);
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
