/*
 * datatypes.h
 *  Copyright (C) 2002-2008, The Perl Foundation.
 *  License:  Artistic 2.0, see README and LICENSE for details
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Parrot and native data types enums and type names.
 *
 *  Caveat:
 *     Changing types here might break some tests.
 *     Though appending a type and a name should be safe.
 */

#ifndef PARROT_DATATYPES_H_GUARD
#define PARROT_DATATYPES_H_GUARD

/* &gen_from_enum(datatypes.pasm) subst(s/enum_type_(\w+)/uc("DATATYPE_$1")/e) */
typedef enum {
    enum_type_undef,            /* illegal */
    enum_first_type = -100,

    enum_type_INTVAL = -100,    /* parrot types */
    enum_type_FLOATVAL,
    enum_type_STRING,
    enum_type_PMC,              /* actual PMCs have positive class numbers */
    enum_type_BIGINT,
    enum_type_BIGNUM,           /* might be different */
    enum_type_DPOINTER,

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

    enum_type_bit,              /* fixed size types */
    enum_type_int1 = enum_type_bit,
    enum_type_int4,
    enum_type_int8,
    enum_type_int16,
    enum_type_int32,
    enum_type_int64,

    enum_type_uint8,            /* unsigned variants */
    enum_type_uint16,
    enum_type_uint32,
    enum_type_uint64,

    enum_type_ptr,              /* native pointer */
    enum_type_cstr,             /* c string */
    enum_type_struct_ptr,       /* pointer to another struct */
    enum_type_struct,           /* a nested struct */
    enum_type_func_ptr,         /* a function pointer */

    enum_type_sized,            /* arbitrary size type for list_new */
    enum_last_type              /* + one */

} PARROT_DATA_TYPE;

/* &end_gen */
struct _data_types {
    const char *name;
    int size;
};

extern const struct _data_types data_types[];
#if defined(INSIDE_GLOBAL_SETUP)
const struct _data_types data_types[] = {
    { "INTVAL",   INTVAL_SIZE },          /* parrot types */
    { "FLOATVAL", NUMVAL_SIZE },
    { "STRING", sizeof (void *) },
    { "PMC",    sizeof (void *) },           /* actual PMCs have positive class numbers */
    { "BIGINT", sizeof (void *) },
    { "BIGNUM", sizeof (void *) },          /* might be different */
    { "DPOINTER", sizeof (void *) },

    { "char",   sizeof (char) },          /* native integer types */
    { "short",  sizeof (short) },
    { "int",    sizeof (int)   },
    { "long",   sizeof (long)  },
    { "longlong", 0 },          /* TODO */

    { "uchar",  sizeof (char) },            /* native unsigned types */
    { "ushort", sizeof (short)},
    { "uint",   sizeof (int)  },
    { "ulong",  sizeof (long) },
    { "ulonglong", 0 },         /* TODO */

    { "float",  sizeof (float) },          /* native float types */
    { "double", sizeof (double) },
    { "longdouble", 0 },        /* TODO */

    { "int1",   0 },            /*  = bit */
    { "int4",   0 },
    { "int8",   1 },
    { "int16",  2 },
    { "int32",  4 },
    { "int64",  8 },

    { "uint8",  1 },          /* unsigned variants */
    { "uint16", 2 },
    { "uint32", 4 },
    { "uint64", 8 },

    { "ptr", sizeof (void*) },
    { "cstr", sizeof (char *) },
    { "struct_ptr", sizeof (void*) },
    { "struct", 0 },
    { "func_ptr", sizeof (void (*)(void)) },

    { "sized", 0 },

    { "illegal", 0 }
};
#endif /* INSIDE_GLOBAL_SETUP */

#define PARROT_FLOATVAL_INF_POSITIVE  floatval_divide_by_zero(interp, 1.0)
#define PARROT_FLOATVAL_INF_NEGATIVE  floatval_divide_by_zero(interp, -1.0)
#define PARROT_FLOATVAL_NAN_QUIET     floatval_divide_by_zero(interp, 0.0)

#define PARROT_CSTRING_INF_POSITIVE    "Inf"
#define PARROT_CSTRING_INF_NEGATIVE    "-Inf"
#define PARROT_CSTRING_NAN_QUIET       "NaN"


/* HEADERIZER BEGIN: src/datatypes.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_get_datatype_enum(PARROT_INTERP,
    ARGIN(const STRING *type_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_get_datatype_name(PARROT_INTERP, INTVAL type)
        __attribute__nonnull__(1);

PARROT_EXPORT
FLOATVAL
floatval_divide_by_zero(PARROT_INTERP, FLOATVAL num);

#define ASSERT_ARGS_Parrot_get_datatype_enum __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(type_name)
#define ASSERT_ARGS_Parrot_get_datatype_name __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/datatypes.c */

#endif /* PARROT_DATATYPES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
