/*
Copyright: (c) 2002 Leopold Toetsch <lt@toetsch.at>
License:  Artistic/GPL, see README and LICENSES for details
$Id$

=head1 NAME

src/datatypes.c - Parrot and native data types functions

=head1 DESCRIPTION

The functions in this file are used in .ops files to access the C<enum>
and C string constants for Parrot and native data types defined iin
F<include/parrot/datatypes.h>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<INTVAL
Parrot_get_datatype_enum(Interp *interpreter, STRING *typename)>

Return datatype C<enum> for C<STRING*> typename.

=cut

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

/*

=item C<STRING *
Parrot_get_datatype_name(Interp *interpreter, INTVAL type)>

Return datatype name for C<type>.

=cut

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

=back

=head1 SEE ALSO

F<include/parrot/datatypes.h>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
