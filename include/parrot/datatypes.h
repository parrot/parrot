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

    enum_type_sized,            /* arbitrary size type for list_new */
    enum_last_type              /* + one */

} PARROT_DATA_TYPES;

#if defined(INSIDE_GLOBAL_SETUP)
const char *datatype_names[] = {
    "INTVAL",           /* parrot types */
    "FLOATVAL",
    "STRING",
    "PMC",              /* actual PMCs have positive class numbers */
    "BIGINT",
    "BIGNUM",           /* might be different */
    "DPOINTER",

    "char",             /* native integer types */
    "short",
    "int",
    "long",
    "longlong",

    "uchar",            /* native unsigned types */
    "ushort",
    "uint",
    "ulong",
    "ulonglong",

    "float",            /* native float types */
    "double",
    "longdouble",

    "int1",             /*  = bit */
    "int4",
    "int8",
    "int16",
    "int32",
    "int64",

    "uint8",            /* unsigned variants */
    "uint16",
    "uint32",
    "uint64",

    "ptr",
    "cstr",

    "sized",

    "illegal"
};
#else
extern const char *datatype_names[];
#endif


INTVAL Parrot_get_datatype_enum(Interp * interpreter, STRING *typename);
STRING * Parrot_get_datatype_name(Interp * interpreter, INTVAL type);

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
