/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/string_primitives.c - String Primitives

=head1 DESCRIPTION

This file collects together all the functions that call into the ICU
API.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <unicode/ucnv.h>
#include <unicode/utypes.h>
#include <unicode/uchar.h>
#include <unicode/ustring.h>
#include <assert.h>

/*

=item C<void
string_set_data_directory(const char *dir)>

Set the directory where ICU finds its data files (encodings, locales,
etc.).

=cut

*/

void
string_set_data_directory(const char *dir)
{
    u_setDataDirectory(dir);

    /* Since u_setDataDirectory doesn't have a result code, we'll spot
       check that everything is okay by making sure that '9' had decimal
       value 9. Using 57 rather than '9' so that the encoding of this
       source code file isn't an issue.... (Don't want to get bitten by
       EBCDIC.) */

    if (!u_isdigit(57) || (u_charDigitValue(57) != 9)) {
            internal_exception(ICU_ERROR,
                "string_set_data_directory: ICU data files not found"
                "(apparently) for directory [%s]", dir);
    }
}

/*

=item C<void
string_fill_from_buffer(Interp *interpreter, const void *buffer,
            UINTVAL len, const char *encoding_name, STRING *s)>

Creates a Parrot string from an "external" buffer, converting from any
supported encoding into Parrot string's internal format.

=cut

*/

void
string_fill_from_buffer(Interp *interpreter, const void *buffer,
            UINTVAL len, const char *encoding_name, STRING *s)
{
    UErrorCode icuError = U_ZERO_ERROR;
    UConverter *conv = NULL;
    UChar *target = NULL;
    UChar *target_limit = NULL;
    const char *source = NULL;
    const char *source_limit = NULL;

    assert(buffer); assert(encoding_name);

    if (s && !len) {
        /* XXX: I _guess_ this is always an empty string--is that right? */
        s->bufused = 0;
        s->strlen = 0;
        return;
    }

    /* big guess--allocate same space for string as buffer needed.
       may be able to make a more educated guess based on the encoding. */
    Parrot_allocate_string(interpreter, s, len);

    conv = ucnv_open(encoding_name, &icuError);

    if (!conv || icuError != U_ZERO_ERROR) {
        /* unknown encoding??? */
        internal_exception(ICU_ERROR,
                "string_fill_from_buffer: ICU error from ucnv_open()");

    }

    target = s->strstart;
    /* buflen may be larger than what we asked for,
     * so take advantage of the space
     */
    target_limit = (UChar *)((char *)PObj_bufstart(s) + PObj_buflen(s) - 1);
    source = buffer;
    source_limit = source + len;

    ucnv_toUnicode(conv, &target, target_limit, &source,
            source_limit, NULL, TRUE, &icuError);

    while (icuError == U_BUFFER_OVERFLOW_ERROR) {
        size_t consumed_length = (char *)target - (char *)(s->strstart);

        /* double size, at least */
        Parrot_reallocate_string(interpreter, s, 2 * PObj_buflen(s));

        target = (UChar *)((char *)s->strstart + consumed_length);
        target_limit = (UChar *)((char *)PObj_bufstart(s) + PObj_buflen(s) - 1);

        icuError = U_ZERO_ERROR;
        ucnv_toUnicode(conv, &target, target_limit, &source,
                source_limit, NULL, TRUE, &icuError);
    }

    ucnv_close(conv);

    if (icuError != U_ZERO_ERROR) {
        /* handle error */
        internal_exception(ICU_ERROR,
                "string_fill_from_buffer: ICU error from ucnv_toUnicode()");
    }

    internal_exception(UNIMPLEMENTED, "Can't do unicode yet");

    /* temporary; need to promote to rep 4 if has non-BMP characters*/
    s->bufused = (char *)target - (char *)s->strstart;
    string_compute_strlen(interpreter, s);
}


/* Unescape a single character. We assume that we're at the start of a
   sequence, right after the \ */
Parrot_UInt4
string_unescape_one(Interp *interpreter, UINTVAL *offset,
        STRING *string)
{
    UINTVAL codepoint;
    UINTVAL workchar = 0;
    UINTVAL charcount = 0;
    UINTVAL len = string_length(interpreter, string);
    /* Well, not right now */
    codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
    switch (codepoint) {
    case 'x':
        ++*offset;
        codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
        if (codepoint >= '0' && codepoint <= '9') {
            workchar = codepoint - '0';
        } else if (codepoint >= 'a' && codepoint <= 'f') {
            workchar = codepoint - 'a' + 10;
        } else if (codepoint >= 'A' && codepoint <= 'F') {
            workchar = codepoint - 'A' + 10;
        } else {
            internal_exception(UNIMPLEMENTED, "Illegal escape sequence in");
        }
        ++*offset;
        if (*offset < len) {
            workchar *= 16;
            codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
            if (codepoint >= '0' && codepoint <= '9') {
                workchar += codepoint - '0';
            } else if (codepoint >= 'a' && codepoint <= 'f') {
                workchar += codepoint - 'a' + 10;
            } else if (codepoint >= 'A' && codepoint <= 'F') {
                workchar += codepoint - 'A' + 10;
            } else {
                return workchar;
            }
        } else {
            return workchar;
        }
        ++*offset;
        return workchar;
    case 'c':
        ++*offset;
        codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
        if (codepoint >= 'A' && codepoint <= 'Z') {
            workchar = codepoint - 'A' + 1;
        } else {
            internal_exception(UNIMPLEMENTED, "Illegal escape sequence");
        }
        ++*offset;
        return workchar;
    case 'u':
        ++*offset;
        codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
        if (codepoint >= '0' && codepoint <= '9') {
            workchar = codepoint - '0';
        } else if (codepoint >= 'a' && codepoint <= 'f') {
            workchar = codepoint - 'a' + 10;
        } else if (codepoint >= 'A' && codepoint <= 'F') {
            workchar = codepoint - 'A' + 10;
        } else {
            internal_exception(UNIMPLEMENTED, "Illegal escape sequence in");
        }
        ++*offset;
        for (charcount = 1; charcount < 4; charcount++) {
            if (*offset < len) {
                workchar *= 16;
                codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
                if (codepoint >= '0' && codepoint <= '9') {
                    workchar += codepoint - '0';
                } else if (codepoint >= 'a' && codepoint <= 'f') {
                    workchar += codepoint - 'a' + 10;
                } else if (codepoint >= 'A' && codepoint <= 'F') {
                    workchar += codepoint - 'A' + 10;
                } else {
                    return workchar;
                }
            } else {
                return workchar;
            }
            ++*offset;
        }
        return workchar;
    case 'U':
        ++*offset;
        codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
        if (codepoint >= '0' && codepoint <= '9') {
            workchar = codepoint - '0';
        } else if (codepoint >= 'a' && codepoint <= 'f') {
            workchar = codepoint - 'a' + 10;
        } else if (codepoint >= 'A' && codepoint <= 'F') {
            workchar = codepoint - 'A' + 10;
        } else {
            internal_exception(UNIMPLEMENTED, "Illegal escape sequence in");
        }
        ++*offset;
        for (charcount = 1; charcount < 8; charcount++) {
            if (*offset < len) {
                workchar *= 16;
                codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
                if (codepoint >= '0' && codepoint <= '9') {
                    workchar += codepoint - '0';
                } else if (codepoint >= 'a' && codepoint <= 'f') {
                    workchar += codepoint - 'a' + 10;
                } else if (codepoint >= 'A' && codepoint <= 'F') {
                    workchar += codepoint - 'A' + 10;
                } else {
                    return workchar;
                }
            } else {
                return workchar;
            }
            ++*offset;
        }
        return workchar;
    case 'b':
        internal_exception(UNIMPLEMENTED, "Illegal escape sequence in ");
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
        workchar = codepoint - '0';
        ++*offset;
        if (*offset < len) {
            workchar *= 8;
            codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
            if (codepoint >= '0' && codepoint <= '7') {
                workchar += codepoint - '0';
            } else {
                return workchar;
            }
        } else {
            return workchar;
        }
        ++*offset;
        if (*offset < len) {
            workchar *= 8;
            codepoint = CHARSET_GET_CODEPOINT(interpreter, string, *offset);
            if (codepoint >= '0' && codepoint <= '7') {
                workchar += codepoint - '0';
            } else {
                return workchar;
            }
        } else {
            return workchar;
        }
        ++*offset;
        return workchar;
    case 'a':
        ++*offset;
        return 7; /* bell */
    case 't':
        ++*offset;
        return 9;
    case 'n':
        ++*offset;
        return 10;
    case 'f':
        ++*offset;
        return 12;
    case 'r':
        ++*offset;
        return 13;
    case 'e':
        ++*offset;
        return 27;
    case 92:
        ++*offset;
        return 92;
    case '"':
        ++*offset;
        return '"';
    }

    return 0;
}

/*

=back

=head2 Character Property Functions

=over

=item C<UINTVAL
Parrot_char_digit_value(Interp *interpreter, UINTVAL character)>

Returns the decimal digit value of the specified character if it is a decimal
digit character. If not, then -1 is returned.

Note that as currently written, C<Parrot_char_digit_value()> can
correctly return the decimal digit value of characters for which
C<Parrot_char_is_digit()> returns false.

=cut

*/

UINTVAL
Parrot_char_digit_value(Interp *interpreter, UINTVAL character)
{
    return u_charDigitValue(character);
}

/*

=item C<INTVAL
Parrot_char_is_alnum(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is an alphanumeric character.

=cut

*/

INTVAL
Parrot_char_is_alnum(Interp *interpreter, UINTVAL character)
{
    return u_isalnum(character);
}

/*

=item C<INTVAL
Parrot_char_is_alpha(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is an letter character.

=cut

*/

INTVAL
Parrot_char_is_alpha(Interp *interpreter, UINTVAL character)
{
    return u_isalpha(character);
}

/*

=item C<INTVAL
Parrot_char_is_ascii(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is an ASCII character.

=cut

*/

INTVAL
Parrot_char_is_ascii(Interp *interpreter, UINTVAL character)
{
    return character < 128;
}

/*

=item C<INTVAL
Parrot_char_is_blank(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a "blank" or "horizontal
space", a character that visibly separates words on a line.

=cut

*/

INTVAL
Parrot_char_is_blank(Interp *interpreter, UINTVAL character)
{
    return u_isblank(character);
}

/*

=item C<INTVAL
Parrot_char_is_cntrl(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a control character.

=cut

*/

INTVAL
Parrot_char_is_cntrl(Interp *interpreter, UINTVAL character)
{
    return u_iscntrl(character);
}

/*

=item C<INTVAL
Parrot_char_is_digit(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a digit character.

=cut

*/

INTVAL
Parrot_char_is_digit(Interp *interpreter, UINTVAL character)
{
    return u_isdigit(character);
}

/*

=item C<INTVAL
Parrot_char_is_graph(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a a "graphic" character
(printable, excluding spaces).

=cut

*/

INTVAL
Parrot_char_is_graph(Interp *interpreter, UINTVAL character)
{
	return u_isgraph(character);
}

/*

=item C<INTVAL
Parrot_char_is_lower(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a lowercase letter.

=cut

*/

INTVAL
Parrot_char_is_lower(Interp *interpreter, UINTVAL character)
{
    return u_islower(character);
}

/*

=item C<INTVAL
Parrot_char_is_print(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a printable character.

=cut

*/

INTVAL
Parrot_char_is_print(Interp *interpreter, UINTVAL character)
{
	return u_isprint(character);
}

/*

=item C<INTVAL
Parrot_char_is_punct(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a punctuation character.

=cut

*/

INTVAL
Parrot_char_is_punct(Interp *interpreter, UINTVAL character)
{
    return u_ispunct(character);
}

/*

=item C<INTVAL
Parrot_char_is_space(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a space character.

=cut

*/

INTVAL
Parrot_char_is_space(Interp *interpreter, UINTVAL character)
{
    return u_isspace(character);
}

/*

=item C<INTVAL
Parrot_char_is_upper(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is an uppercase character.

=cut

*/

INTVAL
Parrot_char_is_upper(Interp *interpreter, UINTVAL character)
{
    return u_isupper(character);
}

/*

=item C<INTVAL
Parrot_char_is_xdigit(Interp *interpreter, UINTVAL character)>

Returns whether the specified character is a hexadecimal digit character.

=cut

*/

INTVAL
Parrot_char_is_xdigit(Interp *interpreter, UINTVAL character)
{
    return u_isxdigit(character);
}

/*

=back

=head1 SEE ALSO

=over

=item F<include/parrot/string_primitives.h>

=item F<include/parrot/string.h>

=item F<src/string.c>

=back

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
