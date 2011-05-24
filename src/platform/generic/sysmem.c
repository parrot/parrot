/*
 * Copyright (C) 2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/sysmem.c

=head1 DESCRIPTION

Get system memory information.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <stdio.h>
#include <unistd.h>

#if defined(PARROT_HAS_HEADER_SYSPARAM)
#  include <sys/param.h>
#endif
#if defined(PARROT_HAS_HEADER_SYSSYSCTL)
#  include <sys/sysctl.h>
#endif

/* HEADERIZER HFILE: none */

/*

=item C<size_t Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physical memory.

=cut

*/

/*
 * The POSIX name is _SC_PAGESIZE, but apparently some systems
 * require _SC_PAGE_SIZE instead.   (Specific citations would
 * be useful.)
 */
#if !defined(_SC_PAGESIZE) && defined(_SC_PAGE_SIZE)
#  define  _SC_PAGESIZE _SC_PAGE_SIZE
#endif

size_t
Parrot_sysmem_amount(PARROT_INTERP)
{
    size_t        memsize = 0;

#if defined(_SC_PAGESIZE) && defined(_SC_AVPHYS_PAGES)
    /* Method 1:  sysconf().
     * Works on Linux and Solaris, and probably other SVR4-related systems.
     * This should really check for #ifdef HAS_SYSCONF, but Configure
     * doesn't probe for that yet.
     */
    memsize = sysconf(_SC_PHYS_PAGES) * sysconf(_SC_PAGESIZE);

#elif defined(PARROT_HAS_HEADER_SYSSYSCTL) && defined(CTL_HW) && defined(HW_PHYSMEM)

    /* Method 2:  sysctl().  Works on BSD-derived systems.  Darwin is
     * slightly different, and has its own implementation.
     * Configure really should test for HAS_SYSCTL, but, for now, test for
     * the header sys/sysctl.h and the appropriate constants.
     */

    int err;
    size_t length = sizeof (memsize);

    int selection[2] = { CTL_HW, HW_PHYSMEM };

    err = sysctl(selection, 2, &memsize, &length, NULL, 0);

    if (err) {
        const char * const err_msg = strerror(err);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_EXTERNAL_ERROR,
                "sysctl failed: %s", err_msg);
    }

#else
    /* Method 3:  Random guess.  Simply guess 512 MB.  This way, parrot
     * will at least build.  Arguably, one could also just put an error
     * here and instruct the user to fix it manually.
     */
    memsize = 512 * 1024 * 1024;
#endif

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
