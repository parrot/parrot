#include "parrot/parrot.h"
#include "embed_private.h"
#include "parrot/api.h"

/* HEADERIZER HFILE: include/parrot/api.h */

PARROT_API
Parrot_Int
Parrot_api_string_export_ascii(Parrot_PMC interp_pmc, ARGIN(Parrot_String string), ARGOUT(char ** strout))
{
    //ASSERT_ARGS(Parrot_api_string_export)
    EMBED_API_CALLIN(interp_pmc, interp);
    if(!STRING_IS_NULL(string))
        *strout = Parrot_str_to_cstring(interp, string);
    else
        *strout = NULL;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_string_free_exported_ascii(Parrot_PMC interp_pmc, ARGIN(char * const str))
{
    EMBED_API_CALLIN(interp_pmc, interp);
    if(str != NULL)
        Parrot_str_free_cstring(str);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_string_export_wchar(Parrot_PMC interp_pmc, ARGIN(Parrot_String string), ARGOUT(wchar_t ** strout))
{
    char *cstr;
	size_t len;
    wchar_t *wstrout;

    EMBED_API_CALLIN(interp_pmc, interp);
    if(!STRING_IS_NULL(string)) {
        cstr = Parrot_str_to_cstring(interp, string);
		len = strlen(cstr);

        wstrout = (wchar_t *) malloc (sizeof(wchar_t) * len + 1);
        mbstowcs(wstrout, cstr, len);
        wstrout[len] = L'\0';

        *strout = wstrout;
    }
    else
        *strout = NULL;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_string_free_exported_wchar(Parrot_PMC interp_pmc, ARGIN(wchar_t * const str))
{
    EMBED_API_CALLIN(interp_pmc, interp);
    if(str != NULL)
        free(str);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_string_import_ascii(Parrot_PMC interp_pmc, ARGIN(const char * str), ARGOUT(Parrot_String * out))
{
    //ASSERT_ARGS(Parrot_api_string_import)
    EMBED_API_CALLIN(interp_pmc, interp);
    *out = Parrot_str_new(interp, str, 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_string_import_wchar(Parrot_PMC interp_pmc, ARGIN(wchar_t * str), ARGOUT(Parrot_String * out))
{
    char *cstr;
	size_t len;

    EMBED_API_CALLIN(interp_pmc, interp);

	len = wcslen(str);

    cstr = (char *) malloc (sizeof(char) * len + 1);
    wcstombs(cstr, str, len);
    cstr[len] = '\0';

    *out = Parrot_str_new(interp, cstr, 0);
    free(cstr);

    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_string_import_binary(Parrot_PMC interp_pmc, ARGIN(const unsigned char *bytes), Parrot_Int length, ARGOUT(Parrot_String *out))
{
    EMBED_API_CALLIN(interp_pmc, interp);
    *out = Parrot_str_new(interp, (const char *)bytes, length);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

