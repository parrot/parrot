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

size_t
Parrot_sysmem_amount(PARROT_INTERP)
{
    int           err = 0;
    size_t        memsize = 0;
    unsigned long length = sizeof (memsize);
#ifndef NDEBUG
    size_t        ori_memsize = 0;
#endif
#if defined(PARROT_HAS_HEADER_SYSRESOURCE)
    struct rlimit rlim;
#endif

#if defined(HW_MEMSIZE) && (PTR_SIZE > 4)
    int memchk = HW_MEMSIZE; /* uint64_t: >2G RAM */
#elif defined(HW_PHYSMEM)
    int memchk = HW_PHYSMEM; /* sint32_t: max 2G RAM only */
#endif
    int selection[2] = { CTL_HW, memchk };

    err = sysctl(selection, 2, &memsize, &length, NULL, 0) ;
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
#ifndef NDEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)) {
        ori_memsize = memsize;
        fprintf(stderr, "Free Memory: "UINTVAL_FMT"\n", memsize);
    }
#endif

#if defined(PARROT_HAS_HEADER_SYSRESOURCE)
    if (getrlimit(RLIMIT_DATA, &rlim) == 0) {
        if ((rlim.rlim_max != RLIM_INFINITY) && (rlim.rlim_max < memsize))
            memsize = rlim.rlim_max;
        else if ((rlim.rlim_cur != RLIM_INFINITY) && (rlim.rlim_cur < memsize))
            memsize = rlim.rlim_cur;
    }
    if (getrlimit(RLIMIT_RSS, &rlim) == 0) {
        if ((rlim.rlim_max != RLIM_INFINITY) && (rlim.rlim_max < memsize))
            memsize = rlim.rlim_max;
        else if ((rlim.rlim_cur != RLIM_INFINITY) && (rlim.rlim_cur < memsize))
            memsize = rlim.rlim_cur;
    }
#  ifndef NDEBUG
    if (Interp_debug_TEST(interp, PARROT_MEM_STAT_DEBUG_FLAG)
        && ori_memsize != memsize)
        fprintf(stderr, "Memory via rlimit restricted to: "UINTVAL_FMT"\n", memsize);
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
