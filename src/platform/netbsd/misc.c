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

#ifdef PARROT_HAS_HEADER_SYSUTSNAME
#  include <sys/utsname.h>
#endif

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

=item C<STRING *Parrot_get_cpu_type(Parrot_Interp)>

Fetch CPU type.

=cut

*/

STRING *
Parrot_get_cpu_type(Parrot_Interp interp) {
    struct utsname uname_info;
    char  *proc_arch = "";

#ifdef PARROT_HAS_HEADER_SYSUTSNAME
    uname(&uname_info);
    proc_arch = uname_info.machine;
#endif
    return Parrot_str_new_init(interp, proc_arch, strlen(proc_arch),
            Parrot_ascii_encoding_ptr, 0);

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
