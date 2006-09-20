/* atomic/gcc_x86.h
 *  Copyright (C) 2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This header provides an implementation of atomic
 *     operations on x86 platforms with GCC-style
 *     inline assembly suppport. 
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ATOMIC_GCC_X86_H_GAURD)
#define PARROT_ATOMIC_GCC_X86_H_GAURD

typedef struct {
    void *volatile val;
} Parrot_atomic_pointer;

typedef struct {
    volatile long val;
} Parrot_atomic_integer;

/*
 * if both I386 and X86_64 cmpxchg are defined, we are on x86_64 -
 * reuse existing code
 */
inline static void *parrot_i386_cmpxchg(void *volatile *ptr, void *expect,
                                        void *update)
{

#  if defined(PARROT_HAS_X86_64_GCC_CMPXCHG)
    __asm__ __volatile__("lock\n"
                         "cmpxchgq %1,%2":"=a"(expect):"q"(update), "m"(*ptr),
                         "0"(expect)
                         :"memory");
#  else
    __asm__ __volatile__("lock\n"
                         "cmpxchgl %1,%2":"=a"(expect):"q"(update), "m"(*ptr),
                         "0"(expect)
                         :"memory");
#  endif
    return expect;
}

#define PARROT_ATOMIC_PTR_GET(result, a) (result = (a).val)

#define PARROT_ATOMIC_PTR_SET(a, b) ((a).val = b)

#define PARROT_ATOMIC_PTR_CAS(result, a, expect, update)  \
    do { \
        if (expect == parrot_i386_cmpxchg(&(a).val, expect, update)) { \
            result = 1; \
        } else { \
            result = 0; \
        } \
    } while (0)

#define PARROT_ATOMIC_PTR_INIT(a)

#define PARROT_ATOMIC_PTR_DESTROY(a)

#define PARROT_ATOMIC_INT_INIT(a)

#define PARROT_ATOMIC_INT_DESTROY(a)

#define PARROT_ATOMIC_INT_GET(result, a) (result = (a).val)

#define PARROT_ATOMIC_INT_SET(a, b) ((a).val = b)

#define PARROT_ATOMIC_INT_CAS(result, a, expect, update) \
    do { \
        if (expect == (long) parrot_i386_cmpxchg( \
                (void * volatile *) &(a).val, \
                (void *) expect, (void *) update)) { \
            result = 1; \
        } else { \
            result = 0; \
        } \
    } while (0)

inline static long parrot_i386_xadd(volatile long *l, long amount)
{
    long result = amount;
#  if defined(PARROT_HAS_X86_64_GCC_CMPXCHG)
    __asm__ __volatile__("lock\n" "xaddq %0, %1" : "=r"(result), "=m"(*l) : 
            "0"(result), "m"(*l)
        );
#  else    
    __asm__ __volatile__("lock\n" "xaddl %0, %1" : "=r"(result), "=m"(*l) : 
            "0"(result), "m"(*l)
        );
#  endif
    return result + amount;
}

#define PARROT_ATOMIC_INT_INC(result, a) \
    do { \
        result = parrot_i386_xadd(&(a).val, 1); \
    } while (0)

#define PARROT_ATOMIC_INT_DEC(result, a) \
    do { \
        result = parrot_i386_xadd(&(a).val, -1); \
    } while (0)

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
