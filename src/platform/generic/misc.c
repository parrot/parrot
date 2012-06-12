/*
 * Copyright (C) 2011, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/misc.c

=head1 DESCRIPTION

Miscellaneous helper functions.

=head2 Functions

=cut

*/

#include "parrot/parrot.h"

#ifdef PARROT_HAS_HEADER_SYSUTSNAME
#  include <sys/utsname.h>
#endif

/* HEADERIZER HFILE: none */

/*

=over 4

=item C<void Parrot_platform_init_code(void)>

Generic version is a no-op.

=cut

*/

void
Parrot_platform_init_code(void)
{
}

/*

=item C<STRING *Parrot_get_cpu_type(Parrot_Interp)>

Fetch CPU type for non-win32 systems
For win32, look in platform/win32/misc.c

=back

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
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

