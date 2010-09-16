/*
Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

src/string/string_primitives.c - String Primitives

=head1 DESCRIPTION

This file collects together all the functions that call into the ICU
API.

=head2 Functions

=over 4

=cut

*/

/* HEADERIZER HFILE: include/parrot/string_primitives.h */

#include "parrot/parrot.h"
#if PARROT_HAS_ICU
#  include <unicode/ucnv.h>
#  include <unicode/utypes.h>
#  include <unicode/uchar.h>
#  include <unicode/ustring.h>
#else
#  include <ctype.h>
#endif

/*

=item C<void string_set_data_directory(PARROT_INTERP, const char *dir)>

Set the directory where ICU finds its data files (encodings, locales,
etc.).

=cut

*/

PARROT_EXPORT
void
string_set_data_directory(PARROT_INTERP, ARGIN(const char *dir))
{
    ASSERT_ARGS(string_set_data_directory)
#if PARROT_HAS_ICU
    u_setDataDirectory(dir);

    /* Since u_setDataDirectory doesn't have a result code, we'll spot
       check that everything is okay by making sure that '9' had decimal
       value 9. Using 57 rather than '9' so that the encoding of this
       source code file isn't an issue.... (Don't want to get bitten by
       EBCDIC.) */

    if (!u_isdigit(57) || (u_charDigitValue(57) != 9))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ICU_ERROR,
            "string_set_data_directory: ICU data files not found"
            "(apparently) for directory [%s]", dir);
#else
    UNUSED(dir);

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ICU_ERROR,
        "string_set_data_directory: parrot compiled without ICU support");
#endif
}

/*

=back

=head2 Character Property Functions

=over 4

=item C<INTVAL Parrot_char_digit_value(PARROT_INTERP, UINTVAL character)>

Returns the decimal digit value of the specified character if it is a decimal
digit character. If not, then -1 is returned.

Note that as currently written, C<Parrot_char_digit_value()> can
correctly return the decimal digit value of characters for which
C<Parrot_char_is_digit()> returns false.

=cut

*/

PARROT_EXPORT
PARROT_CONST_FUNCTION
INTVAL
Parrot_char_digit_value(SHIM_INTERP, UINTVAL character)
{
    ASSERT_ARGS(Parrot_char_digit_value)
#if PARROT_HAS_ICU
    return u_charDigitValue(character);
#else
    if ((character >= 0x30) && (character <= 0x39))
        return character - 0x30;
    return -1;
#endif
}

/*

=back

=head1 SEE ALSO

=over 4

=item F<include/parrot/string_primitives.h>

=item F<include/parrot/string.h>

=item F<src/string.c>

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
