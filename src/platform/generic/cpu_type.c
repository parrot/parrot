/*
 * Copyright (C) 2011-2012, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/cpu_type.c

=head1 DESCRIPTION

Fetch CPU type for non-win32 systems
For win32, look in platform/win32/cpu_type.c

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

=item C<STRING * Parrot_get_cpu_type(Parrot_Interp interp)>

Fetch CPU type for non-win32 systems.
For win32, look in platform/win32/cpu_type.c

=back

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_get_cpu_type(Parrot_Interp interp) {
    struct utsname uname_info;
    char  *proc_arch;

#ifdef PARROT_HAS_HEADER_SYSUTSNAME
    uname(&uname_info);
    proc_arch = uname_info.machine;
#else
    proc_arch ="unknown";
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

