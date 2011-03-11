/*
Copyright (C) 2002-2009, Parrot Foundation.
License:  Artistic 2.0, see README and LICENSE for details

=head1 NAME

src/datatypes.c - Parrot and native data types functions

=head1 DESCRIPTION

The functions in this file are used in .ops files to access the C<enum>
and C string constants for Parrot and native data types defined in
F<include/parrot/datatypes.h>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/datatypes.h */

/*

=item C<INTVAL Parrot_dt_get_datatype_enum(PARROT_INTERP, const STRING
*type_name)>

Return datatype C<enum> for C<STRING*> type_name.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_dt_get_datatype_enum(PARROT_INTERP, ARGIN(const STRING *type_name))
{
    ASSERT_ARGS(Parrot_dt_get_datatype_enum)
    char * const type = Parrot_str_to_cstring(interp, type_name);
    int i;

    for (i = enum_first_type; i < enum_last_type; ++i) {
        if (STREQ(data_types[i - enum_first_type].name, type)) {
            Parrot_str_free_cstring(type);
            return i;
        }
    }

    Parrot_str_free_cstring(type);

    return enum_type_undef;
}

/*

=item C<STRING * Parrot_dt_get_datatype_name(PARROT_INTERP, INTVAL type)>

Return datatype name for C<type>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_dt_get_datatype_name(PARROT_INTERP, INTVAL type)
{
    ASSERT_ARGS(Parrot_dt_get_datatype_name)
    const char * const s =
        (type < enum_first_type || type >= enum_last_type)
            ? "illegal"
            : data_types[type - enum_first_type].name;

    return Parrot_str_new_init(interp, s, strlen(s),
            Parrot_default_encoding_ptr, PObj_external_FLAG);
}

/*

=item C<FLOATVAL Parrot_dt_divide_floatval_by_zero(PARROT_INTERP, FLOATVAL num)>

Only used to generate Infinity and NaN constants in our corresponding
header file.

=cut

*/

#ifndef PARROT_HAS_INF_NAN

PARROT_EXPORT
FLOATVAL
Parrot_dt_divide_floatval_by_zero(SHIM_INTERP, FLOATVAL num)
{
    ASSERT_ARGS(Parrot_dt_divide_floatval_by_zero)
    const FLOATVAL zero = 0.0;
    return num / zero;
}

#endif


/*

=back

=head1 SEE ALSO

F<include/parrot/datatypes.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
