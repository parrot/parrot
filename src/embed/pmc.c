#include "parrot/parrot.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

PARROT_API
Parrot_Int
Parrot_api_pmc_deserialize(Parrot_PMC interp_pmc, Parrot_String fpmc, ARGOUT(Parrot_PMC * pmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC * const config = Parrot_thaw(interp, fpmc);
    Parrot_set_config_hash_pmc(interp, config);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_pmc_deserialize_bytes(Parrot_PMC interp_pmc, ARGIN(const unsigned char * const fpmc), Parrot_Int length, ARGOUT(Parrot_PMC * pmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const fpmc_str = Parrot_str_new_init(interp, fpmc, length, Parrot_binary_encoding_ptr, PObj_external_FLAG);
    PMC * const config = Parrot_thaw(interp, fpmc_str);
    Parrot_set_config_hash_pmc(interp, config);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_pmc_null(Parrot_PMC interp_pmc, ARGMOD(Parrot_PMC *pmctonull))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *pmctonull = PMCNULL;
    EMBED_API_CALLOUT(interp_pmc, interp);
}
