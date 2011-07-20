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


/* HEADERIZER BEGIN: src/misc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_psprintf(PARROT_INTERP,
    ARGIN(STRING *pat),
    ARGOUT(PMC *ary))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*ary);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
int /*@alt void@*/
Parrot_secret_snprintf(
    ARGOUT(char *buffer),
    size_t len,
    ARGIN(const char *format),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*buffer);

PARROT_EXPORT
void Parrot_snprintf(PARROT_INTERP,
    ARGOUT(char *targ),
    size_t len,
    ARGIN(const char *pat),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*targ);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_sprintf_c(PARROT_INTERP, ARGIN(const char *pat), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_sprintf_s(PARROT_INTERP, ARGIN(STRING *pat), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_vsnprintf(PARROT_INTERP,
    ARGMOD(char *targ),
    size_t len,
    ARGIN(const char *pat),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*targ);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_vsprintf_c(PARROT_INTERP,
    ARGIN(const char *pat),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_vsprintf_s(PARROT_INTERP, ARGIN(STRING *pat), va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_psprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat) \
    , PARROT_ASSERT_ARG(ary))
#define ASSERT_ARGS_Parrot_secret_snprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_Parrot_snprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(targ) \
    , PARROT_ASSERT_ARG(pat))
#define ASSERT_ARGS_Parrot_sprintf_c __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat))
#define ASSERT_ARGS_Parrot_sprintf_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat))
#define ASSERT_ARGS_Parrot_vsnprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(targ) \
    , PARROT_ASSERT_ARG(pat))
#define ASSERT_ARGS_Parrot_vsprintf_c __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat))
#define ASSERT_ARGS_Parrot_vsprintf_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/misc.c */


#ifdef IN_SPF_SYSTEM

    /* The size of all our buffers (and the maximum width of a float
     * field).
     */
#  define PARROT_SPRINTF_BUFFER_SIZE 4096

    /* The maximum floating-point precision--hopefully this and the
     * width cap will help head off buffer overruns.
     */
#  define PARROT_SPRINTF_MAX_PREC 3 * PARROT_SPRINTF_BUFFER_SIZE / 4

    /* Floats formatted in exponent notation should have this number
     * of exponent digits unless they need more.
     */
#  define PARROT_SPRINTF_EXP_DIGITS 2

#  define cstr2pstr(cstr) Parrot_str_new_init(interp, (cstr), strlen(cstr), \
        Parrot_ascii_encoding_ptr, 0)
#  define char2pstr(ch)   Parrot_str_new_init(interp, &(ch), 1, \
        Parrot_ascii_encoding_ptr, 0)

    /* SPRINTF DATA STRUCTURE AND FLAGS */

    typedef enum {
        SIZE_REG = 0,
        SIZE_SHORT,
        SIZE_LONG,
        SIZE_HUGE,
        SIZE_XVAL,
        SIZE_OPCODE,
        SIZE_PMC,
        SIZE_PSTR
    } spf_type_t;

    /* SPRINTF ARGUMENT OBJECT */

    typedef struct sprintf_obj SPRINTF_OBJ;

    typedef STRING *(*sprintf_getchar_t)       (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
    typedef HUGEINTVAL(*sprintf_getint_t)      (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
    typedef UHUGEINTVAL(*sprintf_getuint_t)    (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
    typedef HUGEFLOATVAL(*sprintf_getfloat_t)  (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
    typedef STRING *(*sprintf_getstring_t)     (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
    typedef void *(*sprintf_getptr_t)          (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));

    struct sprintf_obj {
        void *data;
        INTVAL index;

        sprintf_getchar_t getchr;
        sprintf_getint_t getint;
        sprintf_getuint_t getuint;
        sprintf_getfloat_t getfloat;
        sprintf_getstring_t getstring;
        sprintf_getptr_t getptr;
    };

    extern SPRINTF_OBJ pmc_core;
    extern const SPRINTF_OBJ va_core;

/* HEADERIZER BEGIN: src/spf_render.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_sprintf_format(PARROT_INTERP,
    ARGIN(const STRING *pat),
    ARGMOD(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*obj);

#define ASSERT_ARGS_Parrot_sprintf_format __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat) \
    , PARROT_ASSERT_ARG(obj))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/spf_render.c */

#endif /* IN_SPF_SYSTEM */

#endif /* PARROT_MISC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
