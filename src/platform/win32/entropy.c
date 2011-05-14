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
#include <Wincrypt.h>

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_platform_init_code(void)>

Get one INTVAL worth of entropy from the system.

=cut

*/

INTVAL
Parrot_get_entropy(PARROT_INTERP) {
    HCRYPTPROV hCryptProv;
    INTVAL     entropy;
    if (!CryptAcquireContext(&hCryptProv, NULL, NULL, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)){
        const char *msg = "Couldn't crypt context.";
        /* This function is called during interp init, so use the GC registry
         * as a way to figure out interp's initialziedness.
         */
        if (interp->gc_registry)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, msg);
        else
            PANIC(interp, msg);
    }
    if (!CryptGenRandom(hCryptProv, sizeof (INTVAL), &entropy)) {
        const char *msg = "Couldn't get entropy from crypt context.";
        if (interp->gc_registry)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, msg);
        else
            PANIC(interp, msg);
    }
    CryptReleaseContext(hCryptProv, 0);
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
