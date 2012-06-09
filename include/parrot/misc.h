/* misc.h
 *  Copyright (C) 2001-2011, Parrot Foundation.
 *  Overview:
 *     Miscellaneous functions, mainly the Parrot_sprintf family
 *  Data Structure and Algorithms:
 *     Uses a generalized formatting algorithm (spf_render.c) with
 *     a specialized vtable (spf_vtable.c) to handle argument extraction.
 *  History:
 *     This file used to be a simple one, with just a few function prototypes
 *     in it.  When misc.c was split in three, this file took on the job of
 *     being the internal header as well.
 *     To expose the guts of Parrot_sprintf, define IN_SPF_SYSTEM before
 *     including this file.
 *  Notes:
 *  References: misc.c, spf_vtable.c, spf_render.c
 */

#ifndef PARROT_MISC_H_GUARD
#define PARROT_MISC_H_GUARD

#include "parrot/parrot.h"

#define FLOAT_IS_ZERO(f) ((f) == 0.0)

/*
 * "System snprintf" can be not good enough. For example mingw-wrapped VS
 * _snprintf. Undef "snprintf" before possible shadowing of system one.
 */
#ifndef PARROT_HAS_C99_SNPRINTF
#  undef snprintf
#  define snprintf Parrot_secret_snprintf
#endif

typedef int (*reg_move_func)(PARROT_INTERP, unsigned char d, unsigned char s, void *);

/* HEADERIZER BEGIN: src/utils.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL Parrot_util_byte_index(PARROT_INTERP,
    ARGIN(const STRING *base),
    ARGIN(const STRING *search),
    UINTVAL start_offset)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL Parrot_util_byte_rindex(PARROT_INTERP,
    ARGIN(const STRING *base),
    ARGIN(const STRING *search),
    UINTVAL start_offset)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
FLOATVAL Parrot_util_float_rand(INTVAL how_random);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_util_int_rand(INTVAL how_random);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_util_range_rand(INTVAL from, INTVAL to, INTVAL how_random);

PARROT_EXPORT
void Parrot_util_srand(INTVAL seed);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_util_tm_to_array(PARROT_INTERP, ARGIN(const struct tm *tm))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_util_uint_rand(INTVAL how_random);

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
FLOATVAL Parrot_util_floatval_mod(FLOATVAL n2, FLOATVAL n3);

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_util_intval_mod(INTVAL i2, INTVAL i3);

void Parrot_util_quicksort(PARROT_INTERP,
    ARGMOD(void **data),
    UINTVAL n,
    ARGIN(PMC *cmp),
    ARGIN(const char * cmp_signature))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*data);

#define ASSERT_ARGS_Parrot_util_byte_index __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(base) \
    , PARROT_ASSERT_ARG(search))
#define ASSERT_ARGS_Parrot_util_byte_rindex __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(base) \
    , PARROT_ASSERT_ARG(search))
#define ASSERT_ARGS_Parrot_util_float_rand __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_int_rand __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_range_rand __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_srand __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_tm_to_array __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tm))
#define ASSERT_ARGS_Parrot_util_uint_rand __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_floatval_mod __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_intval_mod __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_util_quicksort __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data) \
    , PARROT_ASSERT_ARG(cmp) \
    , PARROT_ASSERT_ARG(cmp_signature))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/utils.c */

#endif /* PARROT_MISC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
