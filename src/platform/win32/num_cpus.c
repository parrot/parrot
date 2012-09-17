/*
 * Copyright (C) 2012, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/win32/num_cpus.c

=head1 DESCRIPTION

Returns the number of CPUs for win32 systems

=head2 Functions

=cut

*/

#include "parrot/parrot.h"

#ifdef _WIN32
#  define WIN32_LEAN_AND_MEAN
#  include <windows.h>
#endif

/* HEADERIZER HFILE: none */

/*

=over 4

=item C<INTVAL Parrot_get_num_cpus(Parrot_Interp)>

Returns the number of CPUs

=back

=cut

*/

INTVAL
Parrot_get_num_cpus(Parrot_Interp interp)
{
    INTVAL nprocs = -1;
    SYSTEM_INFO info;

    GetSystemInfo(&info);
    nprocs = (INTVAL)info.dwNumberOfProcessors;
    return nprocs;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

