/* atomic/gcc_pcc.h
 *  Copyright (C) 2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This header provides an implementation of atomic
 *     operations on PowerPC platforms with GCC-style
 *     inline assembly suppport.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(ATOMIC_GCC_PCC_H_GAURD)
#define ATOMIC_GCC_PCC_H_GAURD

typedef struct {
    void * volatile val;
} Parrot_atomic_pointer;

#define PARROT_ATOMIC_PTR_GET(result, a) result = (void *) (a).val

#define PARROT_ATOMIC_PTR_SET(a, b) (a).val = (void *) (b)

inline static void *parrot_ppc_cmpset(void * volatile *ptr,
                                      void *expect, void *update)
{
    void *tmp;
    /* see http://www-128.ibm.com/developerworks/linux/library/pa-atom/ */
    __asm__ __volatile__(       /*%0 = tmp, %1 = ptr, %2 = old, %3 = new */
                            "1:  lwarx %0, 0, %1\n"     /* tmp = *ptr, with reservation */
                            "    cmpw %2, %0\n" /* tmp == old ? */
                            "    bne 2f\n"      /* no, goto flush reservation, end */
                            /* "    sync\n" -- XXX needed on PPC 405, see 
                             * http://www.kegel.com/xgcc3/ppc405erratum77.html */
                            "    stwcx. %3, 0, %1\n"    /* store new using reservation */
                            "    bne- 1b\n"     /* spin on failure of reservation; - is branch prediction hint */
                            "    b 3f\n" "2:  stwcx. %0, 0, %1\n"       /* flush reserveration */
                            "3:  \n"    /* end label */
                            :   /* output */
                            "=&r"(tmp)
                            :   /* input */
                            "r"(ptr), "r"(expect), "r"(update)
                            :   /* clobber */
                            "memory");
    return tmp;
}

inline static long parrot_ppc_add(volatile long *val, long what)
{
    long tmp;
    __asm__ __volatile__(       /*%0 = tmp, %1 = val, %2 = what */
                            "1:  lwarx %0, 0, %1\n"     /* tmp = *val, with reservation */
                            "    add %0, %0, %2\n"      /* tmp += what */
                            /* "    sync\n" -- XXX needed on PPC 405, see
                             * http://www.kegel.com/xgcc3/ppc405erratum77.html */
                            "    stwcx. %0, 0, %1\n"    /* *val <- tmp using reservation */
                            "    bne- 1b\n"     /* spin on failure of reservation; - is branch prediction hint */
                            "2:  \n"    /* end label */
                            :   /* output */
                            "=&r"(tmp)
                            :   /* input */
                            "r"(val), "r"(what)
                            :   /* clobber */
                            "memory");
    return tmp;
}

#define PARROT_ATOMIC_PTR_CAS(result, a, expect, update) \
    do { \
        if (parrot_ppc_cmpset(&(a).val, expect, update) == expect) { \
            result = 1; \
        } else { \
            result = 0; \
        } \
    } while (0)

#define PARROT_ATOMIC_PTR_INIT(a)

#define PARROT_ATOMIC_PTR_DESTROY(a)

typedef struct {
    volatile long val;
} Parrot_atomic_integer;

#define PARROT_ATOMIC_INT_INIT(a)

#define PARROT_ATOMIC_INT_DESTROY(a)

#define PARROT_ATOMIC_INT_GET(result, a) (result = (a).val)

#define PARROT_ATOMIC_INT_SET(a, b) ((a).val = b)

#define PARROT_ATOMIC_INT_CAS(result, a, expect, update) \
    do { \
        if (parrot_ppc_cmpset( \
                (void * volatile *) &(a).val, (void *) expect, \
                (void *) update) == (void *) expect) { \
            result = 1; \
        } else { \
            result = 0; \
        } \
    } while (0)

#define PARROT_ATOMIC_INT_INC(result, a) \
    do { \
        result = parrot_ppc_add(&(a).val, 1); \
    } while (0)

#define PARROT_ATOMIC_INT_DEC(result, a) \
    do { \
        result = parrot_ppc_add(&(a).val, -1); \
    } while (0)

#endif
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
