#include "parrot/parrot.h"
#include "embed_private.h"
#include "parrot/api.h"

/* HEADERIZER HFILE: include/parrot/api.h */

PARROT_API
INTVAL
Parrot_api_string_export(ARGMOD(PMC *interp_pmc), ARGIN(Parrot_String *string), ARGOUT(char ** strout))
{
    //ASSERT_ARGS(Parrot_api_string_export)
    EMBED_API_CALLIN(interp_pmc, interp);
    /* TODO */
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
INTVAL
Parrot_api_string_import(ARGMOD(PMC *interp_pmc), ARGIN(const char * str), ARGOUT(Parrot_String ** out))
{
    //ASSERT_ARGS(Parrot_api_string_import)
    EMBED_API_CALLIN(interp_pmc, interp);
    *out = Parrot_str_new(interp, str, 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}
