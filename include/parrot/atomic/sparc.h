/* atomic/sparc.h
 *  Copyright (C) 2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This header provides an implementation of atomic
 *     operations on Sparc V8plus and better platforms.
 *     It relies on an assembler file.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(ATOMIC_SPARC_H_GAURD)
#define ATOMIC_SPARC_H_GAURD

extern int parrot_sparc_cas32(Parrot_UInt4 *value, Parrot_UInt4 old, Parrot_UInt4 new);
/* NB cas64 _will_ be broken when PTR_SIZE == 4 */
#if PTR_SIZE == 8
#  if INTVAL_SIZE != 8
#    error Expected 8-byte wide INTVAL.
#  endif
extern int parrot_sparc_cas64(INTVAL *value, INTVAL old, INTVAL new);
#endif

typedef struct {
    void * volatile val;
} Parrot_atomic_pointer;

#define PARROT_ATOMIC_PTR_GET(result, a) (result = (a).val)

#define PARROT_ATOMIC_PTR_SET(a, b) ((a).val = b)

#if PTR_SIZE == 8
#  define PARROT_ATOMIC_PTR_CAS(result, a, expect, update) \
    do { \
        result = parrot_sparc_cas64((INTVAL *) &(a).val, \
            (INTVAL) expect, (INTVAL) update); \
    } while (0)
#else
#  define PARROT_ATOMIC_PTR_CAS(result, a, expect, update) \
    do { \
        result = parrot_sparc_cas32((Parrot_UInt4 *) &(a).val, \
            (Parrot_UInt4) expect, (Parrot_UInt4) update); \
    } while (0)
#endif

#define PARROT_ATOMIC_PTR_INIT(a)

#define PARROT_ATOMIC_PTR_DESTROY(a)

typedef struct {
    volatile Parrot_Int4 val;
} Parrot_atomic_integer;

#define PARROT_ATOMIC_INT_INIT(a)

#define PARROT_ATOMIC_INT_DESTROY(a)

#define PARROT_ATOMIC_INT_GET(result, a) (result = (a).val)

#define PARROT_ATOMIC_INT_SET(a, b) ((a).val = b)

#define PARROT_ATOMIC_INT_CAS(result, a, expect, update) \
    do { \
        result = parrot_sparc_cas32((Parrot_UInt4*) &(a).val, \
            (Parrot_UInt4) (expect), (Parrot_UInt4) (update)); \
    } while (0)

#define parrot_sparc_atomic_int_add(result, a, what) \
    do { \
        int successp; \
        Parrot_Int4 old; \
        do { \
            old = (a).val; \
            PARROT_ATOMIC_INT_CAS(successp, a, old, old + what); \
        } while (!successp); \
        result = old + what; \
    } while (0)


#define PARROT_ATOMIC_INT_DEC(result, a) parrot_sparc_atomic_int_add(result, a, -1)
#define PARROT_ATOMIC_INT_INC(result, a) parrot_sparc_atomic_int_add(result, a,  1)

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
