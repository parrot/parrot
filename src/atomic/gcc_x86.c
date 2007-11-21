/* atomic/gcc_x86.c
 *  Copyright (C) 2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     An implementation of atomic
 *     operations on x86 platforms with GCC-style
 *     inline assembly suppport.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/atomic/gcc_x86.h"

/*
 * if both I386 and X86_64 cmpxchg are defined, we are on x86_64 -
 * reuse existing code
 */
PARROT_INLINE
void *parrot_i386_cmpxchg(void *volatile *ptr, void *expect,
                                        void *update)
{
#if defined(PARROT_HAS_X86_64_GCC_CMPXCHG)
    __asm__ __volatile__("lock\n"
                         "cmpxchgq %1,%2":"=a"(expect):"q"(update), "m"(*ptr),
                         "0"(expect)
                         :"memory");
#else
    __asm__ __volatile__("lock\n"
                         "cmpxchgl %1,%2":"=a"(expect):"q"(update), "m"(*ptr),
                         "0"(expect)
                         :"memory");
#endif
    return expect;
}

PARROT_INLINE
long parrot_i386_xadd(volatile long *l, long amount)
{
    long result = amount;
#if defined(PARROT_HAS_X86_64_GCC_CMPXCHG)
    __asm__ __volatile__("lock\n" "xaddq %0, %1" : "=r"(result), "=m"(*l) :
            "0"(result), "m"(*l));
#else
    __asm__ __volatile__("lock\n" "xaddl %0, %1" : "=r"(result), "=m"(*l) :
            "0"(result), "m"(*l));
#endif
    return result + amount;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
