/*
 * datatypes.c
 *  Copyright: (c) 2002 Leopold Toetsch <lt@toetsch.at>
 *  License:  Artistic/GPL, see README and LICENSES for details
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot and native data types functions.
 */

#include "parrot/parrot.h"

/*=for api Parrot_get_datatype_enum
 * return datatype enum for STRING* typename
 */
INTVAL
Parrot_get_datatype_enum(Interp *interpreter, STRING *typename)
{
    char *type = string_to_cstring(interpreter, typename);
    int i;

    for (i = enum_first_type; i < enum_last_type; i++) {
        if (!strcmp(data_types[i - enum_first_type].name, type))
            return i;
    }

    string_cstring_free(type);

    return enum_type_undef;
}

/*=for api Parrot_get_datatype_name
 * return datatype name for type
 */
STRING *
Parrot_get_datatype_name(Interp *interpreter, INTVAL type)
{
    const char *s;
    if (type < enum_first_type || type >= enum_last_type)
        s = "illegal";
    else
        s = data_types[type - enum_first_type].name;
    return string_make(interpreter, s, strlen(s), 0, PObj_external_FLAG, 0);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
