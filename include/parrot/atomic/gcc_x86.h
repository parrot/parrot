/* atomic/gcc_x86.h
 *  Copyright (C) 2006-2008, Parrot Foundation.
 *  Overview:
 *     This header provides an implementation of atomic
 *     operations on x86 platforms with GCC-style
 *     inline assembly suppport.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ATOMIC_GCC_X86_H_GUARD
#define PARROT_ATOMIC_GCC_X86_H_GUARD

/* HEADERIZER BEGIN: src/atomic/gcc_x86.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void * parrot_i386_cmpxchg(
    ARGMOD(void *volatile *ptr),
    ARGIN_NULLOK(void *expect),
    ARGIN_NULLOK(void *update))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*ptr);

PARROT_EXPORT
long parrot_i386_xadd(ARGIN(volatile long *l), long amount)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_parrot_i386_cmpxchg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(ptr)
#define ASSERT_ARGS_parrot_i386_xadd __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(l)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/atomic/gcc_x86.c */

typedef struct Parrot_atomic_pointer {
    void *volatile val;
} Parrot_atomic_pointer;

typedef struct Parrot_atomic_integer {
    volatile long val;
} Parrot_atomic_integer;

/*
 * if both I386 and X86_64 cmpxchg are defined, we are on x86_64 -
 * reuse existing code
 */
PARROT_INLINE
void *parrot_i386_cmpxchg(void *volatile *ptr, void *expect,
                                        void *update);

#define PARROT_ATOMIC_PTR_GET(result, a) ((result) = (a).val)

#define PARROT_ATOMIC_PTR_SET(a, b) ((a).val = (b))

#define PARROT_ATOMIC_PTR_CAS(result, a, expect, update) \
    do { \
        if ((expect) == parrot_i386_cmpxchg(&(a).val, (expect), (update))) { \
            (result) = 1; \
        } \
        else { \
            (result) = 0; \
        } \
    } while (0)

#define PARROT_ATOMIC_PTR_INIT(a)

#define PARROT_ATOMIC_PTR_DESTROY(a)

#define PARROT_ATOMIC_INT_INIT(a)

#define PARROT_ATOMIC_INT_DESTROY(a)

#define PARROT_ATOMIC_INT_GET(result, a) ((result) = (a).val)

#define PARROT_ATOMIC_INT_SET(a, b) ((a).val = (b))

#define PARROT_ATOMIC_INT_CAS(result, a, expect, update) \
    do { \
        void *res = parrot_i386_cmpxchg((void * volatile *) &(a).val, \
                (void *) (expect), (void *) (update)); \
        if ((expect) == (long)res) { \
            (result) = 1; \
        } \
        else { \
            (result) = 0; \
        } \
    } while (0)

PARROT_INLINE
long parrot_i386_xadd(volatile long *l, long amount);

#define PARROT_ATOMIC_INT_INC(result, a) \
    do { \
        (result) = parrot_i386_xadd(&(a).val, 1); \
    } while (0)

#define PARROT_ATOMIC_INT_DEC(result, a) \
    do { \
        (result) = parrot_i386_xadd(&(a).val, -1); \
    } while (0)

#endif /* PARROT_ATOMIC_GCC_X86_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
