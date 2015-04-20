/*
 * Copyright (C) 2010-2014, Parrot Foundation.
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
#if defined(PARROT_HAS_HEADER_SYSRESOURCE)
#  include <sys/resource.h>
#endif

/* HEADERIZER HFILE: none */

/*

=item C<size_t Parrot_sysmem_amount(PARROT_INTERP)>

Get information about available physical memory.

Returns available physical memory in bytes, with respect to resource limits.

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
#ifndef NDEBUG
    size_t        ori_memsize = 0;
#endif
#if defined(PARROT_HAS_HEADER_SYSRESOURCE)
    struct rlimit rlim;
#endif

#if defined(_SC_PAGESIZE) && defined(_SC_AVPHYS_PAGES)
    UNUSED(interp);
    /* Method 1:  sysconf().
     * Works on Linux and Solaris, and probably other SVR4-related systems.
     * This should really check for #ifdef HAS_SYSCONF, but Configure
     * doesn't probe for that yet.
     */
    memsize = sysconf(_SC_PHYS_PAGES) * sysconf(_SC_PAGESIZE);
#  ifndef NDEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        ori_memsize = memsize;
        fprintf(stderr, "Free Memory: "SIZE_FMT"\n", memsize);
    }
#  endif

#elif defined(PARROT_HAS_HEADER_SYSSYSCTL) && defined(CTL_HW) && \
    (defined(HW_MEMSIZE) || defined(HW_PHYSMEM))

    /* Method 2:  sysctl().  Works on BSD-derived systems.  Darwin is
     * slightly different, and has its own implementation.
     * Configure really should test for HAS_SYSCTL, but, for now, test for
     * the header sys/sysctl.h and the appropriate constants.
     */

#  if defined(HW_MEMSIZE) && (PTR_SIZE > 4)
    int memchk = HW_MEMSIZE; /* uint64_t: >2G RAM */
#  elif defined(HW_PHYSMEM)
    int memchk = HW_PHYSMEM; /* sint32_t: max 2G RAM only */
#  endif

    int err;
    size_t length = sizeof (memsize);

    int selection[2] = { CTL_HW, memchk };

    err = sysctl(selection, 2, &memsize, &length, NULL, 0);

    if (err) {
        const char * const err_msg = strerror(err);
        /* sysmem_amount() is usually called too early, exceptions cannot be called yet */
        if (!Parrot_default_encoding_ptr) {
            fprintf(stderr, "sysctl failed: %s\n", err_msg);
            fprintf(stderr, "C file %s, line %u\n", __FILE__, __LINE__);
            exit(err);
        }
        else
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_EXTERNAL_ERROR,
                "sysctl failed: %s", err_msg);
    }
#  ifndef NDEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        ori_memsize = memsize;
        fprintf(stderr, "Free Memory: "SIZE_FMT"\n", memsize);
    }
#  endif
#else
    UNUSED(interp);
    /* Method 3:  Faith.  Simply guess 512 MB.  This way, parrot
     * will at least build.  Arguably, one could also just put an error
     * here and instruct the user to fix it manually.
     */
    memsize = 512 * 1024 * 1024;
#  ifndef NDEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        ori_memsize = memsize;
        fprintf(stderr, "Default Memory: "SIZE_FMT"\n", memsize);
    }
#  endif
#endif

#if defined(PARROT_HAS_HEADER_SYSRESOURCE)
    if (getrlimit(RLIMIT_DATA, &rlim) == 0) {
        if ((rlim.rlim_max != RLIM_INFINITY) && (rlim.rlim_max < memsize))
            memsize = rlim.rlim_max;
        else if ((rlim.rlim_cur != RLIM_INFINITY) && (rlim.rlim_cur < memsize))
            memsize = rlim.rlim_cur;
    }
#  ifndef __OpenBSD__
    if (getrlimit(RLIMIT_AS, &rlim) == 0) {
        if ((rlim.rlim_max != RLIM_INFINITY) && (rlim.rlim_max < memsize))
            memsize = rlim.rlim_max;
        else if ((rlim.rlim_cur != RLIM_INFINITY) && (rlim.rlim_cur < memsize))
            memsize = rlim.rlim_cur;
    }
#  endif
#  ifndef NDEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)
        && ori_memsize != memsize)
        fprintf(stderr, "Memory via rlimit restricted to: "SIZE_FMT"\n", memsize);
#  endif
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
