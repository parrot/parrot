/*
 * datatypes.h
 *  Copyright: (c) 2002 Leopold Toetsch <lt@toetsch.at>
 *  License:  Artistic/GPL, see README and LICENSES for details
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot and native data types enums and type names.
 *
 *  Caveat:
 *     Changing types here might break some tests.
 *     Though appending a type and a name should be safe.
 */

#if !defined(PARROT_DATATYPES_H_GUARD)
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

} PARROT_DATA_TYPES;

/* &end_gen */
struct _data_types {
    const char *name;
    int size;
};

#if defined(INSIDE_GLOBAL_SETUP)
const struct _data_types data_types[] = {
    { "INTVAL",   INTVAL_SIZE },          /* parrot types */
    { "FLOATVAL", NUMVAL_SIZE },
    { "STRING", sizeof(void *) },
    { "PMC",    sizeof(void *) },           /* actual PMCs have positive class numbers */
    { "BIGINT", sizeof(void *) },
    { "BIGNUM", sizeof(void *) },          /* might be different */
    { "DPOINTER",sizeof(void *) },

    { "char",   sizeof(char) },          /* native integer types */
    { "short",  sizeof(short) },
    { "int",    sizeof(int)   },
    { "long",   sizeof(long)  },
    { "longlong", 0 },          /* TODO */

    { "uchar",  sizeof(char) },            /* native unsigned types */
    { "ushort", sizeof(short)},
    { "uint",   sizeof(int)  },
    { "ulong",  sizeof(long) },
    { "ulonglong", 0 },         /* TODO */

    { "float",  sizeof(float) },          /* native float types */
    { "double", sizeof(double) },
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

    { "ptr", sizeof(void*) },
    { "cstr", sizeof(char *) },
    { "struct_ptr", sizeof(void*) },
    { "struct", 0 },
    { "func_ptr", sizeof(void (*)(void)) },

    { "sized", 0 },

    { "illegal", 0 }
};
#else
extern const struct _data_types data_types[];
#endif


INTVAL Parrot_get_datatype_enum(Parrot_Interp, STRING *);
STRING * Parrot_get_datatype_name(Parrot_Interp, INTVAL );

#endif /* PARROT_DATATYPES_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
