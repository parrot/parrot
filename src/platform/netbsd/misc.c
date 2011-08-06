/*
 * Copyright (C) 2009, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/netbsd/misc.c

=head1 DESCRIPTION

Miscellaneous helper functions that are specific to NetBSD.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_platform_init_code(void)>

Initialize Parrot for the NetBSD platform.
So far turns off SIGFPE for Alpha, and
ensures IEEE floating-point semantics from
the math library.

=cut

*/

#include <signal.h>
#include <math.h>

void
Parrot_platform_init_code(void)
{

    _LIB_VERSION = _IEEE_;	/* force IEEE math semantics and behaviour */

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
