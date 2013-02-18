/* atomic/fallback.h
 *  Copyright (C) 2006, Parrot Foundation.
 *  Overview:
 *     This header provides an implementation of atomic
 *     operations in terms of threading primitives.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ATOMIC_FALLBACK_H_GUARD
#define PARROT_ATOMIC_FALLBACK_H_GUARD

typedef struct Parrot_atomic_pointer {
    void *val;
    Parrot_mutex lock;
} Parrot_atomic_pointer;

typedef struct Parrot_atomic_integer {
    INTVAL val;
    Parrot_mutex lock;
} Parrot_atomic_integer;


#  define PARROT_ATOMIC_PTR_GET(result, a) \
    do { \
        LOCK((a).lock); \
        (result) = (a).val; \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_GET(result, a) \
    do { \
        LOCK((a).lock); \
        (result) = (a).val; \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_PTR_SET(a, b) \
    do { \
        LOCK((a).lock); \
        (a).val = (b); \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_SET(a, b) \
    do { \
        LOCK((a).lock); \
        (a).val = (b); \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_INC(result, a) \
    do { \
        LOCK((a).lock); \
        (result) = ++(a).val; \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_DEC(result, a) \
    do { \
        LOCK((a).lock); \
        (result) = --(a).val; \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_PTR_CAS(result, a, expect, update) \
    do { \
        LOCK((a).lock); \
        if ((a).val == (expect)) { \
            (a).val = (update); \
            (result) = 1; \
        } \
        else { \
            (result) = 0; \
        } \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_CAS(result, a, expect, update) \
    do { \
        LOCK((a).lock); \
        if ((a).val == (expect)) { \
            (a).val = (update); \
            (result) = 1; \
        } \
        else { \
            (result) = 0; \
        } \
        UNLOCK((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_PTR_INIT(a) \
    do { \
        MUTEX_INIT((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_PTR_DESTROY(a) \
    do { \
        MUTEX_DESTROY((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_INIT(a) \
    do { \
        MUTEX_INIT((a).lock); \
    } while (0)

#  define PARROT_ATOMIC_INT_DESTROY(a) \
    do { \
        MUTEX_DESTROY((a).lock); \
    } while (0)

#endif /* PARROT_ATOMIC_FALLBACK_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
