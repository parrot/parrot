/*
 * datatypes.h
 *  Copyright (C) 2002-2015, Parrot Foundation.
 *  License:  Artistic 2.0, see README.pod and LICENSE for details
 *  Overview:
 *     Parrot and native data types enums and type names.
 *
 *  Caveat:
 *     Changing types here might break some tests.
 *     Though appending a type and a name should be safe.
 */

#ifndef PARROT_DATATYPES_H_GUARD
#define PARROT_DATATYPES_H_GUARD

#include "parrot/has_header.h"

/* &gen_from_enum(datatypes.pasm) subst(s/enum_type_(\w+)/uc("DATATYPE_$1")/e) */
typedef enum {
    enum_type_undef = 0,        /* illegal */
    enum_first_type = 1,

    enum_type_INTVAL = 1,       /* parrot types */
    enum_type_FLOATVAL,
    enum_type_STRING,
    enum_type_PMC,

    enum_type_char,             /* native integer types */
    enum_type_short,
    enum_type_int,
    enum_type_long,
    enum_type_longlong,

    enum_type_uchar,            /* native unsigned types */
    enum_type_ushort,
    enum_type_uint,
    enum_type_ulong,
    enum_type_ulonglong,

    enum_type_float,            /* native float types */
    enum_type_double,
    enum_type_longdouble,
    enum_type_float128,

    enum_type_int8,             /* fixed size types */
    enum_type_int16,
    enum_type_int32,
    enum_type_int64,

    enum_type_bit,
    enum_type_uint1 = enum_type_bit,
    enum_type_uint4,
    enum_type_uint8,            /* unsigned variants */
    enum_type_uint16,
    enum_type_uint32,
    enum_type_uint64,

    enum_type_void,

    enum_type_ptr,              /* native pointer */
    enum_type_cstr,             /* 't' c string */
    enum_type_struct_ptr,       /* pointer to another struct */
    enum_type_struct,           /* a struct */
    enum_type_union,            /* a union */
    enum_type_func_ptr,         /* a function pointer */
    enum_type_pshort,           /* '2' Integer PMC -> short */
    enum_type_pint,             /* '3' Integer PMC -> int */
    enum_type_plong,            /* '4' Integer PMC -> long */

    enum_type_sized,

    enum_last_type,             /* + one */

    enum_type_ref_flag = 0x40   /* call-by-reference */
} PARROT_DATA_TYPE;

/* &end_gen */
struct _data_types {
    PARROT_OBSERVER const char *name;
    size_t size;
    size_t align;
};

#ifdef PARROT_HAS_COMPILER_OFFSETOF_ALIGNOF
#  define ALIGNOF(name, x) offsetof(struct {char c; x d;}, d)
#  define ALIGNOF1(x)      offsetof(struct {char c; x d;}, d)
#else
#  define ALIGNOF(name, x) PARROT_ALIGNOF_##name
#  define ALIGNOF1(name)   PARROT_ALIGNOF_##name
#endif

extern const struct _data_types data_types[];
#if defined(INSIDE_GLOBAL_SETUP)
const struct _data_types data_types[] = {
    /* parrot types */
    { "INTVAL",     sizeof (INTVAL),             ALIGNOF(intval, INTVAL) },
    { "FLOATVAL",   sizeof (FLOATVAL),           ALIGNOF(floatval, FLOATVAL) },
    { "STRING",     sizeof (STRING *),           ALIGNOF(stringptr, STRING *) },
    { "PMC",        sizeof (PMC *),              ALIGNOF(pmcptr, PMC *) },

    /* native integer types */
    { "char",       sizeof (char),               ALIGNOF1(char) },
    { "short",      sizeof (short),              ALIGNOF1(short) },
    { "int",        sizeof (int),                ALIGNOF1(int) },
    { "long",       sizeof (long),               ALIGNOF1(long) },
#  if PARROT_HAS_LONGLONG
    { "longlong",   sizeof (long long),          ALIGNOF(longlong, long long) },
#  else
    { "longlong",   0,                           0 },
#  endif

    /* native unsigned types */
    { "uchar",      sizeof (unsigned char),      ALIGNOF(uchar, unsigned char) },
    { "ushort",     sizeof (unsigned short),     ALIGNOF(ushort, unsigned short) },
    { "uint",       sizeof (unsigned int),       ALIGNOF(uint, unsigned int) },
    { "ulong",      sizeof (unsigned long),      ALIGNOF(ulong, unsigned long) },
#  if PARROT_HAS_LONGLONG
    { "ulonglong",  sizeof (unsigned long long), ALIGNOF(ulonglong, unsigned long long) },
#  else
    { "ulonglong",  0,                           0 },
#  endif

    /* native float types */
    { "float",      sizeof (float),              ALIGNOF1(float) },
    { "double",     sizeof (double),             ALIGNOF1(double) },
    { "longdouble", sizeof (long double),        ALIGNOF(longdouble, long double)},
#  ifdef PARROT_HAS_FLOAT128
    { "__float128", sizeof (__float128),         ALIGNOF1(__float128)},
#  else
    { "__float128", 0,         			0 },
#  endif

    /* explicitly sized integer types */
    { "int8",       1,                           ALIGNOF1(Parrot_Int1) },
    { "int16",      2,                           ALIGNOF1(Parrot_Int2) },
    { "int32",      4,                           ALIGNOF1(Parrot_Int4) },
#  if PARROT_HAS_INT64
    { "int64",      8,                           ALIGNOF1(Parrot_Int8) },
#  else
    { "int64",      0,                           0 },
#  endif

    /* unsigned variants */
    { "uint1",      0,                           0 }, /* = bit */
    { "uint4",      0,                           0 },
    { "uint8",      1,                           ALIGNOF1(Parrot_Int1) },
    { "uint16",     2,                           ALIGNOF1(Parrot_Int2) },
    { "uint32",     4,                           ALIGNOF1(Parrot_Int4) },
#  if PARROT_HAS_INT64
    { "uint64",     8,                           ALIGNOF1(Parrot_Int8) },
#  else
    { "uint64",     0,                           0 },
#  endif

    { "void",       0,                           0 },

    { "ptr",        sizeof (void *),             ALIGNOF(voidptr, void *) },
    { "cstr",       sizeof (char *),             ALIGNOF(charptr, char *) },
    { "struct_ptr", sizeof (void *),             ALIGNOF(voidptr, void *) },
    { "struct",     0,                           0 },
    { "union",      0,                           0 },
    { "func_ptr",   sizeof (funcptr_t),          ALIGNOF1(funcptr_t) },
    { "pshort",     sizeof (short),              ALIGNOF1(short) },
    { "pint",       sizeof (int),                ALIGNOF1(int) },
    { "plong",      sizeof (long),               ALIGNOF1(long) },

    { "sized",      0,                           0 },

    { "illegal",    0,                           0 }
};
#endif /* INSIDE_GLOBAL_SETUP */

#ifdef PARROT_HAS_INF_NAN
#  include <math.h>
#  define PARROT_FLOATVAL_INF_POSITIVE	INFINITY
#  define PARROT_FLOATVAL_INF_NEGATIVE	-INFINITY
#  define PARROT_FLOATVAL_NAN_QUIET	NAN
#  define PARROT_FLOATVAL_IS_POSINF(x)  (isinf(x) && (x) > 0)
#  define PARROT_FLOATVAL_IS_NEGINF(x)  (isinf(x) && (x) < 0)
#  define PARROT_FLOATVAL_IS_NAN(x)     isnan(x)
#  define PARROT_FLOATVAL_IS_INF_OR_NAN(x) (isnan(x) || isinf(x))
#else
#  define PARROT_FLOATVAL_INF_POSITIVE  Parrot_dt_divide_floatval_by_zero(interp, 1.0)
#  define PARROT_FLOATVAL_INF_NEGATIVE  Parrot_dt_divide_floatval_by_zero(interp, -1.0)
#  define PARROT_FLOATVAL_NAN_QUIET     Parrot_dt_divide_floatval_by_zero(interp, 0.0)
#  define PARROT_FLOATVAL_IS_POSINF(x)  ((x) == PARROT_FLOATVAL_INF_POSITIVE)
#  define PARROT_FLOATVAL_IS_NEGINF(x)  ((x) == PARROT_FLOATVAL_INF_NEGATIVE)
#  define PARROT_FLOATVAL_IS_NAN(x)     ((x) != (x))
#  define PARROT_FLOATVAL_IS_INF_OR_NAN(x) (PARROT_FLOATVAL_IS_POSINF(x) \
          || PARROT_FLOATVAL_IS_NEGINF(x) || PARROT_FLOATVAL_IS_NAN(x))
#endif

#define PARROT_CSTRING_INF_POSITIVE    "Inf"
#define PARROT_CSTRING_INF_NEGATIVE    "-Inf"
#define PARROT_CSTRING_NAN_QUIET       "NaN"


/* HEADERIZER BEGIN: src/datatypes.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
FLOATVAL Parrot_dt_divide_floatval_by_zero(PARROT_INTERP, FLOATVAL num);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_dt_get_datatype_enum(PARROT_INTERP, ARGIN(STRING *type_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_dt_get_datatype_name(PARROT_INTERP, INTVAL type)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_dt_divide_floatval_by_zero \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_dt_get_datatype_enum __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(type_name))
#define ASSERT_ARGS_Parrot_dt_get_datatype_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/datatypes.c */

#endif /* PARROT_DATATYPES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
