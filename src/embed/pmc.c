#include "parrot/parrot.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

PARROT_API
Parrot_Int
Parrot_api_pmc_new_from_class(Parrot_PMC interp_pmc, Parrot_PMC p_class, Parrot_PMC init, ARGOUT(Parrot_PMC * pmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    if (init == NULL)
        init = PMCNULL;
    *pmc = VTABLE_instantiate(interp, p_class, init);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_deserialize(Parrot_PMC interp_pmc, Parrot_String fpmc,
        ARGOUT(Parrot_PMC * pmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *pmc = Parrot_thaw(interp, fpmc);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_pmc_deserialize_bytes(Parrot_PMC interp_pmc,
        ARGIN(const unsigned char * const fpmc), Parrot_Int length,
        ARGOUT(Parrot_PMC * pmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const fpmc_str = Parrot_str_new_init(interp, (const char *)fpmc,
        length, Parrot_binary_encoding_ptr, PObj_external_FLAG);
    *pmc = Parrot_thaw(interp, fpmc_str);
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

PARROT_API
Parrot_Int
Parrot_api_pmc_get_string(Parrot_PMC interp_pmc, Parrot_PMC pmc,
        ARGOUT(Parrot_String * str))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *str = VTABLE_get_string(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_get_integer(Parrot_PMC interp_pmc, Parrot_PMC pmc,
        ARGOUT(Parrot_Int * value))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_integer(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_get_float(Parrot_PMC interp_pmc, Parrot_PMC pmc,
        ARGOUT(Parrot_Float * value))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_number(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_get_keyed(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_PMC key, ARGOUT(Parrot_PMC * value))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_pmc_keyed(interp, pmc, key);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_get_keyed_int(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_Int key, ARGOUT(Parrot_PMC * value))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_pmc_keyed_int(interp, pmc, key);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_get_keyed_string(Parrot_PMC interp_pmc, Parrot_PMC pmc,
        Parrot_String key, ARGOUT(Parrot_PMC * value))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_pmc_keyed_str(interp, pmc, key);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_set_string(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_String value)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_string_native(interp, pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_set_integer(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_Int value)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_integer_native(interp, pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_set_float(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_Float value)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_number_native(interp, pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_set_keyed(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_PMC key, Parrot_PMC value)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_pmc_keyed(interp, pmc, key, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_set_keyed_int(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_Int key, Parrot_PMC value)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_pmc_keyed_int(interp, pmc, key, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_set_keyed_string(Parrot_PMC interp_pmc, Parrot_PMC pmc,
        Parrot_String key, Parrot_PMC value)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_pmc_keyed_str(interp, pmc, key, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_box_string(Parrot_PMC interp_pmc, Parrot_String str,
        ARGOUT(Parrot_PMC * str_pmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *str_pmc = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, *str_pmc, str);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/* TODO: Box int and Box float */

PARROT_API
Parrot_Int
Parrot_api_add_exception_handler(Parrot_PMC interp_pmc, Parrot_PMC handler)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_cx_add_handler(interp, handler);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_invoke(Parrot_PMC interp_pmc, Parrot_PMC sub, Parrot_PMC signature)
{
    EMBED_API_CALLIN(interp_pmc, interp);
    PMC  * const old_call_obj = Parrot_pcc_get_signature(interp,
        CURRENT_CONTEXT(interp));
    Parrot_pcc_invoke_from_sig_object(interp, sub, signature);
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_call_obj);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_pmc_wrap_string_array(Parrot_PMC interp_pmc, Parrot_Int argc,
        ARGIN(const char ** argv), ARGOUT(Parrot_PMC * args))
{
    //ASSERT_ARGS(Parrot_api_build_argv_array)
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC * const userargv = Parrot_pmc_new(interp, enum_class_ResizableStringArray);

    if (argv != NULL && argc > 0) {
        Parrot_Int i = 0;
        for (; i < argc; ++i) {
            /* Run through argv, adding everything to the array */
            STRING * const arg = Parrot_str_new_init(interp, argv[i], strlen(argv[i]),
                    Parrot_utf8_encoding_ptr, PObj_external_FLAG);
            VTABLE_push_string(interp, userargv, arg);
        }
    }
    *args = userargv;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_pmc_get_class(Parrot_PMC interp_pmc, Parrot_PMC key,
        ARGOUT(Parrot_PMC *class))
{
    EMBED_API_CALLIN(interp_pmc, interp);
    *class = Parrot_oo_get_class(interp, key);
    EMBED_API_CALLOUT(interp_pmc, interp);
}
