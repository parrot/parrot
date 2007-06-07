/*
Copyright (C) 2002-2007, The Perl Foundation.
License:  Artistic/GPL, see README and LICENSES for details
$Id$

=head1 NAME

src/datatypes.c - Parrot and native data types functions

=head1 DESCRIPTION

The functions in this file are used in .ops files to access the C<enum>
and C string constants for Parrot and native data types defined in
F<include/parrot/datatypes.h>.

=head2 Functions

*/

#include "parrot/parrot.h"

/* HEADER: include/parrot/datatypes.h */

/*

FUNCDOC: Parrot_get_datatype_enum
Return datatype C<enum> for C<STRING*> typename.

*/

PARROT_API
INTVAL
Parrot_get_datatype_enum(Interp *interp, const STRING * const typename /*NN*/)
/* PURE, WARN_UNUSED */
{
    char * const type = string_to_cstring(interp, typename);
    int i;

    for (i = enum_first_type; i < enum_last_type; i++) {
        if (strcmp(data_types[i - enum_first_type].name, type) == 0) {
            string_cstring_free(type);
            return i;
        }
    }

    string_cstring_free(type);

    return enum_type_undef;
}

/*

FUNCDOC:
Return datatype name for C<type>.

*/

PARROT_API
STRING *
Parrot_get_datatype_name(Interp *interp, INTVAL type)
/* WARN_UNUSED */
{
    const char * const s =
        (type < enum_first_type || type >= enum_last_type)
            ? "illegal"
            : data_types[type - enum_first_type].name;

    return string_make(interp, s, strlen(s), NULL, PObj_external_FLAG);
}

/*

=head1 SEE ALSO

F<include/parrot/datatypes.h>.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
