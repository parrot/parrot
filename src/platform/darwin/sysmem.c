/*
 * Copyright (C) 2010-2014, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/darwin/sysmem.c

=head1 DESCRIPTION

Get system memory information.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <sys/sysctl.h>
#include <stdio.h>

/* HEADERIZER HFILE: none */

/*

=item C<size_t Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physical memory.

=cut

*/

size_t
Parrot_sysmem_amount(PARROT_INTERP)
{
    int           err = 0 ;
    size_t        memsize = 0 ;
    char         *err_msg;
    unsigned long length = sizeof (memsize) ;

#if defined(HW_MEMSIZE)
    int memchk = HW_MEMSIZE; /* uint64_t: >2G RAM */
#elif defined(HW_PHYSMEM)
    int memchk = HW_PHYSMEM; /* sint32_t: max 2G RAM only */
#endif

    int selection[2] = { CTL_HW, memchk };

    err = sysctl(selection, 2, &memsize, &length, NULL, 0) ;

    if (err) {
        err_msg = strerror(err);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_EXTERNAL_ERROR,
                "sysctl failed: %s", err_msg);
    }

    return memsize;
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
