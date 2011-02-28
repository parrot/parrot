/*
 * datatypes.h
 *  Copyright (C) 2002-2008, Parrot Foundation.
 *  License:  Artistic 2.0, see README and LICENSE for details
 *  Overview:
 *     Parrot and native data types enums and type names.
 *
 *  Caveat:
 *     Changing types here might break some tests.
 *     Though appending a type and a name should be safe.
 */

#ifndef PARROT_DATATYPES_H_GUARD
#define PARROT_DATATYPES_H_GUARD

/* TODO: detect these with configure */
#define HAS_LONGLONG   0
#define HAS_LONGDOUBLE 0

/* &gen_from_enum(datatypes.pasm) subst(s/enum_type_(\w+)/uc("DATATYPE_$1")/e) */
typedef enum {
    enum_type_undef,            /* illegal */
    enum_first_type = -100,

    enum_type_INTVAL = -100,    /* parrot types */
    enum_type_FLOATVAL,
    enum_type_STRING,
    enum_type_PMC,              /* actual PMCs have positive class numbers */

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

    enum_type_ptr,              /* native pointer */
    enum_type_cstr,             /* c string */
    enum_type_struct_ptr,       /* pointer to another struct */
    enum_type_struct,           /* a struct */
    enum_type_union,            /* a union */
    enum_type_func_ptr,         /* a function pointer */

    enum_type_sized,
    enum_last_type              /* + one */

} PARROT_DATA_TYPE;

/* &end_gen */
struct _data_types {
    PARROT_OBSERVER const char *name;
    size_t size;
    size_t align;
};

#define ALIGNOF(x) offsetof(struct { char c; x d; }, d)

extern const struct _data_types data_types[];
#if defined(INSIDE_GLOBAL_SETUP)
const struct _data_types data_types[] = {
    /* parrot types */
    { "INTVAL",     sizeof (INTVAL),             ALIGNOF(INTVAL) },
    { "FLOATVAL",   sizeof (FLOATVAL),           ALIGNOF(FLOATVAL) },
    { "STRING",     sizeof (STRING *),           ALIGNOF(STRING *) },
    { "PMC",        sizeof (PMC *),              ALIGNOF(PMC *) },

    /* native integer types */
    { "char",       sizeof (char),               ALIGNOF(char) },
    { "short",      sizeof (short),              ALIGNOF(short) },
    { "int",        sizeof (int),                ALIGNOF(int) },
    { "long",       sizeof (long),               ALIGNOF(long)  },
#  if HAS_LONGLONG
    { "longlong",   sizeof (long long),          ALIGNOF(long long) },
#  else
    { "longlong",   0,                           0 },
#  endif

    /* native unsigned types */
    { "uchar",      sizeof (unsigned char),      ALIGNOF(unsigned char) },
    { "ushort",     sizeof (unsigned short),     ALIGNOF(unsigned short) },
    { "uint",       sizeof (unsigned int),       ALIGNOF(unsigned int) },
    { "ulong",      sizeof (unsigned long),      ALIGNOF(unsigned long) },
#  if HAS_LONGLONG
    { "ulonglong",  sizeof (unsigned long long), ALIGNOF(unsigned long long) },
#  else
    { "ulonglong",  0,                           0 },
#  endif

    /* native float types */
    { "float",      sizeof (float),              ALIGNOF(float) },
    { "double",     sizeof (double),             ALIGNOF(double) },
#  if HAS_LONGDOUBLE
    { "longdouble", sizeof (long double),        ALIGNOF(long double)},
#  else
    { "longdouble", 0,                           0 },
#  endif

    /* explicitly sized integer types */
    { "int8",       1,                           ALIGNOF(int /* TODO */) },
    { "int16",      2,                           ALIGNOF(int /* TODO */) },
    { "int32",      4,                           ALIGNOF(int /* TODO */) },
    { "int64",      8,                           ALIGNOF(int /* TODO */) },

    /* unsigned variants */
    { "uint1",      0,                           0 }, /* = bit */
    { "uint4",      0,                           0 },
    { "uint8",      1,                           ALIGNOF(int /* TODO */) },
    { "uint16",     2,                           ALIGNOF(int /* TODO */) },
    { "uint32",     4,                           ALIGNOF(int /* TODO */) },
    { "uint64",     8,                           ALIGNOF(int /* TODO */) },

    { "ptr",        sizeof (void *),             ALIGNOF(void *) },
    { "cstr",       sizeof (char *),             ALIGNOF(char *) },
    { "struct_ptr", sizeof (void *),             ALIGNOF(void *) },
    { "struct",     0,                           0 },
    { "union",      0,                           0 },
    { "func_ptr",   sizeof (funcptr_t),          ALIGNOF(funcptr_t) },

    { "sized",      0,                           0 },

    { "illegal",    0,                           0 }
};
#endif /* INSIDE_GLOBAL_SETUP */

#if defined(__NetBSD__) && defined(__alpha__)
#  include <math.h>
#  define PARROT_FLOATVAL_INF_POSITIVE	INFINITY
#  define PARROT_FLOATVAL_INF_NEGATIVE	-INFINITY
#  define PARROT_FLOATVAL_NAN_QUIET	NAN
#else
#  define PARROT_FLOATVAL_INF_POSITIVE  Parrot_dt_divide_floatval_by_zero(interp, 1.0)
#  define PARROT_FLOATVAL_INF_NEGATIVE  Parrot_dt_divide_floatval_by_zero(interp, -1.0)
#  define PARROT_FLOATVAL_NAN_QUIET     Parrot_dt_divide_floatval_by_zero(interp, 0.0)
#endif

#define PARROT_CSTRING_INF_POSITIVE    "Inf"
#define PARROT_CSTRING_INF_NEGATIVE    "-Inf"
#define PARROT_CSTRING_NAN_QUIET       "NaN"


/* HEADERIZER BEGIN: src/datatypes.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
FLOATVAL Parrot_dt_divide_floatval_by_zero(SHIM_INTERP, FLOATVAL num);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_dt_get_datatype_enum(PARROT_INTERP,
    ARGIN(const STRING *type_name))
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
