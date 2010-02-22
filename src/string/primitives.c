/*
Copyright (C) 2006-2009, Parrot Foundation.
$Id$

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

=item C<Parrot_UInt4 string_unescape_one(PARROT_INTERP, UINTVAL *offset, STRING
*string)>

Unescape a single character. We assume that we're at the start of a
sequence, right after the \.

=cut

*/

PARROT_EXPORT
Parrot_UInt4
string_unescape_one(PARROT_INTERP, ARGMOD(UINTVAL *offset),
        ARGMOD(STRING *string))
{
    ASSERT_ARGS(string_unescape_one)
    UINTVAL workchar  = 0;
    UINTVAL charcount = 0;
    const UINTVAL len = Parrot_str_byte_length(interp, string);

    /* Well, not right now */
    UINTVAL codepoint = CHARSET_GET_BYTE(interp, string, *offset);
    ++*offset;

    switch (codepoint) {
      case 'x':
        codepoint = CHARSET_GET_BYTE(interp, string, *offset);
        if (codepoint >= '0' && codepoint <= '9') {
            workchar = codepoint - '0';
        }
        else if (codepoint >= 'a' && codepoint <= 'f') {
            workchar = codepoint - 'a' + 10;
        }
        else if (codepoint >= 'A' && codepoint <= 'F') {
            workchar = codepoint - 'A' + 10;
        }
        else if (codepoint == '{') {
            int i;
            ++*offset;
            workchar = 0;
            for (i = 0; i < 8 && *offset < len; ++i, ++*offset) {
                codepoint = CHARSET_GET_BYTE(interp, string, *offset);
                if (codepoint == '}') {
                    ++*offset;
                    return workchar;
                }
                workchar *= 16;
                if (codepoint >= '0' && codepoint <= '9') {
                    workchar += codepoint - '0';
                }
                else if (codepoint >= 'a' && codepoint <= 'f') {
                    workchar += codepoint - 'a' + 10;
                }
                else if (codepoint >= 'A' && codepoint <= 'F') {
                    workchar += codepoint - 'A' + 10;
                }
                else {
                    Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_UNIMPLEMENTED,
                            "Illegal escape sequence inside {}");
                }
            }
            if (*offset == len)
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_UNIMPLEMENTED,
                        "Illegal escape sequence no '}'");
        }
        else {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Illegal escape sequence in");
        }

        ++*offset;
        if (*offset < len) {
            workchar *= 16;
            codepoint = CHARSET_GET_BYTE(interp, string, *offset);
            if (codepoint >= '0' && codepoint <= '9') {
                workchar += codepoint - '0';
            }
            else if (codepoint >= 'a' && codepoint <= 'f') {
                workchar += codepoint - 'a' + 10;
            }
            else if (codepoint >= 'A' && codepoint <= 'F') {
                workchar += codepoint - 'A' + 10;
            }
            else {
                return workchar;
            }
        }
        else {
            return workchar;
        }
        ++*offset;
        return workchar;
      case 'c':
        codepoint = CHARSET_GET_BYTE(interp, string, *offset);
        if (codepoint >= 'A' && codepoint <= 'Z') {
            workchar = codepoint - 'A' + 1;
        }
        else {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Illegal escape sequence");
        }

        ++*offset;
        return workchar;
      case 'u':
        workchar = 0;
        for (charcount = 0; charcount < 4; charcount++) {
            if (*offset < len) {
                workchar *= 16;
                codepoint = CHARSET_GET_BYTE(interp, string, *offset);
                if (codepoint >= '0' && codepoint <= '9') {
                    workchar += codepoint - '0';
                }
                else if (codepoint >= 'a' && codepoint <= 'f') {
                    workchar += codepoint - 'a' + 10;
                }
                else if (codepoint >= 'A' && codepoint <= 'F') {
                    workchar += codepoint - 'A' + 10;
                }
                else {
                    Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_UNIMPLEMENTED,
                            "Illegal escape sequence in uxxx escape");
                }
            }
            else {
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_UNIMPLEMENTED,
                        "Illegal escape sequence in uxxx escape - too short");
            }

            ++*offset;
        }
        return workchar;
      case 'U':
        workchar = 0;
        for (charcount = 0; charcount < 8; charcount++) {
            if (*offset < len) {
                workchar *= 16;
                codepoint = CHARSET_GET_BYTE(interp, string, *offset);
                if (codepoint >= '0' && codepoint <= '9') {
                    workchar += codepoint - '0';
                }
                else if (codepoint >= 'a' && codepoint <= 'f') {
                    workchar += codepoint - 'a' + 10;
                }
                else if (codepoint >= 'A' && codepoint <= 'F') {
                    workchar += codepoint - 'A' + 10;
                }
                else {
                    Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_UNIMPLEMENTED,
                            "Illegal escape sequence in Uxxx escape");
                }
            }
            else {
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_UNIMPLEMENTED,
                        "Illegal escape sequence in uxxx escape - too short");
            }

            ++*offset;
        }
        return workchar;
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
        workchar = codepoint - '0';
        if (*offset < len) {
            workchar *= 8;
            codepoint = CHARSET_GET_BYTE(interp, string, *offset);
            if (codepoint >= '0' && codepoint <= '7') {
                workchar += codepoint - '0';
            }
            else {
                return workchar;
            }
        }
        else {
            return workchar;
        }
        ++*offset;
        if (*offset < len) {
            workchar *= 8;
            codepoint = CHARSET_GET_BYTE(interp, string, *offset);
            if (codepoint >= '0' && codepoint <= '7') {
                workchar += codepoint - '0';
            }
            else {
                return workchar;
            }
        }
        else {
            return workchar;
        }
        ++*offset;
        return workchar;
      case 'a':
        return 7; /* bell */
      case 'b':
        return 8; /* bs */
      case 't':
        return 9;
      case 'n':
        return 10;
      case 'v':
        return 11;
      case 'f':
        return 12;
      case 'r':
        return 13;
      case 'e':
        return 27;
      case 92: /* \ */
        return 92;
      case '"':
        return '"';
      default:
        return codepoint;  /* any not special return the char */
    }
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
    if ((character >= 0x30) || (character <= 0x39))
        return character - 0x30;
    return -1;
#endif
}

/*

=item C<char * str_dup_remove_quotes(const char *old)>

Duplicates a C string (minus the wrapping quotes).  Similar to strdup(),
except it dies if it runs out of memory.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char *
str_dup_remove_quotes(ARGIN(const char *old))
{
    ASSERT_ARGS(str_dup_remove_quotes)
    const size_t oldlen = strlen(old) + 1;

    /* 2 for the beginning and ending quote chars */
    const size_t newlen = oldlen - 2;
    char * const copy   = (char *)mem_internal_allocate(newlen);

    memcpy(copy, old + 1, newlen);
    copy[newlen - 1] = 0;

    return copy;
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
 * vim: expandtab shiftwidth=4:
 */
