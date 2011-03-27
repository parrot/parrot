/*
Copyright (C) 2010, Parrot Foundation.

=head1 NAME

src/embed/strings.c - The Parrot String embedding interface

=head1 DESCRIPTION

This file implements string functions of the Parrot embedding interface.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "embed_private.h"
#include "parrot/api.h"

/* HEADERIZER HFILE: include/parrot/api.h */

/*

=item C<Parrot_Int Parrot_api_string_export_ascii(Parrot_PMC interp_pmc,
Parrot_String string, char ** strout)>

Exports the ascii Parrot_String C<string> into a C string and stores it in
C<strout>. This function returns a true value if this call is successful and
false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_export_ascii(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_String string),
        ARGOUT(char ** strout))
{
    ASSERT_ARGS(Parrot_api_string_export_ascii)
    EMBED_API_CALLIN(interp_pmc, interp);
    if (!STRING_IS_NULL(string))
        *strout = Parrot_str_to_cstring(interp, string);
    else
        *strout = NULL;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_free_exported_ascii(Parrot_PMC interp_pmc,
char * const str)>

Releases the allocated memory for C<str>. This function returns a true value if
this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_free_exported_ascii(ARGIN(Parrot_PMC interp_pmc), ARGIN(char * const str))
{
    ASSERT_ARGS(Parrot_api_string_free_exported_ascii)
    EMBED_API_CALLIN(interp_pmc, interp);
    if (str != NULL)
        Parrot_str_free_cstring(str);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_export_wchar(Parrot_PMC interp_pmc,
Parrot_String string, wchar_t ** strout)>

Exports the wchar Parrot_String C<string> into a C string and stores it in
C<strout>. This function returns a true value if this call is successful and
false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_export_wchar(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_String string),
        ARGOUT(wchar_t ** strout))
{
    ASSERT_ARGS(Parrot_api_string_export_wchar)
    EMBED_API_CALLIN(interp_pmc, interp)

    char *cstr;
    size_t len;
    wchar_t *wstrout;

    if (!STRING_IS_NULL(string)) {
        cstr = Parrot_str_to_cstring(interp, string);
        len = strlen(cstr);

        wstrout = (wchar_t *) malloc(sizeof (wchar_t) * len + 1);
        mbstowcs(wstrout, cstr, len);
        wstrout[len] = L'\0';

        *strout = wstrout;
    }
    else
        *strout = NULL;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_free_exported_wchar(Parrot_PMC interp_pmc,
wchar_t * const str)>

Releases the allocated memory for C<str>. This function returns a true value if
this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_free_exported_wchar(ARGIN(Parrot_PMC interp_pmc), ARGIN(wchar_t * const str))
{
    ASSERT_ARGS(Parrot_api_string_free_exported_wchar)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (str != NULL)
        free(str);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_import(Parrot_PMC interp_pmc, const char *
str, Parrot_String * out)>

Transforms string C<str> into a Parrot_String and stores the result in C<out>
using the platform encoding. This function returns a true value if this call
is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_import(ARGIN(Parrot_PMC interp_pmc), ARGIN(const char * str),
        ARGOUT(Parrot_String * out))
{
    ASSERT_ARGS(Parrot_api_string_import)
    EMBED_API_CALLIN(interp_pmc, interp)
    *out = Parrot_str_from_platform_cstring(interp, str);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_import_ascii(Parrot_PMC interp_pmc, const
char * str, Parrot_String * out)>

Transforms ascii string C<str> into a Parrot_String and stores the result in
C<out>. This function returns a true value if this call is successful and false
value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_import_ascii(ARGIN(Parrot_PMC interp_pmc), ARGIN(const char * str),
        ARGOUT(Parrot_String * out))
{
    ASSERT_ARGS(Parrot_api_string_import_ascii)
    EMBED_API_CALLIN(interp_pmc, interp)
    *out = Parrot_str_new(interp, str, 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_import_wchar(Parrot_PMC interp_pmc, wchar_t
* str, Parrot_String * out)>

Transforms wchar string C<str> into a Parrot_String and stores the result in
C<out>. This function returns a true value if this call is successful and false
value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_import_wchar(ARGIN(Parrot_PMC interp_pmc), ARGIN(wchar_t * str),
        ARGOUT(Parrot_String * out))
{
    ASSERT_ARGS(Parrot_api_string_import_wchar)
    EMBED_API_CALLIN(interp_pmc, interp)

    char *cstr;
    size_t len;

    len = wcslen(str);

    cstr = (char *) malloc(sizeof (char) * len + 1);
    wcstombs(cstr, str, len);
    cstr[len] = '\0';

    *out = Parrot_str_new(interp, cstr, 0);
    free(cstr);

    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_import_binary(Parrot_PMC interp_pmc, const
unsigned char *bytes, Parrot_Int length, const char *encoding_name,
Parrot_String *out)>

Transforms the buffer C<bytes> of size C<length> with the encoding
C<encoding_name> into a Parrot_String and stores the result in C<out>. This
function returns a true value if this call is successful and false value
otherwise.

Supported encodings are: "ascii", "iso-8859-1", "binary", "utf8", "utf16",
"ucs2", and "ucs4".

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_import_binary(ARGIN(Parrot_PMC interp_pmc), ARGIN(const unsigned char *bytes),
        Parrot_Int length, ARGIN(const char *encoding_name),
        ARGOUT(Parrot_String *out))
{
    ASSERT_ARGS(Parrot_api_string_import_binary)
    EMBED_API_CALLIN(interp_pmc, interp)
    const STR_VTABLE * const encoding = Parrot_find_encoding(interp, encoding_name);
    *out = Parrot_str_new_init(interp, (const char *)bytes, length,
                encoding, 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_string_byte_length(Parrot_PMC interp_pmc,
Parrot_String str, Parrot_Int * len)>

Returns the byte length of a string.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_string_byte_length(Parrot_PMC interp_pmc, Parrot_String str,
        ARGOUT(Parrot_Int * len))
{
    ASSERT_ARGS(Parrot_api_string_byte_length)

    EMBED_API_CALLIN(interp_pmc, interp)
    *len = Parrot_str_byte_length(interp, str);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
