/* atomic/fallback.h
 *  Copyright (C) 2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This header provides an implementation of atomic
 *     operations in terms of threading primitives.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ATOMIC_FALLBACK_H_GAURD)
#define PARROT_ATOMIC_FALLBACK_H_GAURD

typedef struct {
    void *val;
    Parrot_mutex lock;
} Parrot_atomic_pointer;

typedef struct {
    INTVAL val;
    Parrot_mutex lock;
} Parrot_atomic_integer;


#define PARROT_ATOMIC_PTR_GET(result, a) \
    do { \
        LOCK((a).lock); \
        result = (a).val; \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_GET(result, a) \
    do { \
        LOCK((a).lock); \
        result = (a).val; \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_PTR_SET(a,b) \
    do { \
        LOCK((a).lock); \
        (a).val = b; \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_SET(a,b) \
    do { \
        LOCK((a).lock); \
        (a).val = b; \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_INC(result, a) \
    do { \
        LOCK((a).lock); \
        result = ++(a).val; \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_DEC(result, a) \
    do { \
        LOCK((a).lock); \
        result = --(a).val; \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_PTR_CAS(result, a, expect, update) \
    do { \
        LOCK((a).lock); \
        if ((a).val == expect) { \
            void * orig = (a).val; \
            (a).val = update; \
            result = 1; \
        } else { \
            result = 0; \
        } \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_CAS(result, a, expect, update) \
    do { \
        LOCK((a).lock); \
        if ((a).val == expect) { \
            INTVAL orig = (a).val; \
            (a).val = update; \
            result = 1; \
        } else { \
            result = 0; \
        } \
        UNLOCK((a).lock); \
    } while (0)

#define PARROT_ATOMIC_PTR_INIT(a) \
    do { \
        MUTEX_INIT((a).lock); \
    } while (0)

#define PARROT_ATOMIC_PTR_DESTROY(a) \
    do { \
        MUTEX_DESTROY((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_INIT(a) \
    do { \
        MUTEX_INIT((a).lock); \
    } while (0)

#define PARROT_ATOMIC_INT_DESTROY(a) \
    do { \
        MUTEX_DESTROY((a).lock); \
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
