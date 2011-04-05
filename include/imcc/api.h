/*
 * Copyright (C) 2011, Parrot Foundation.
 */

#ifndef PARROT_IMCC_API_H_GUARD
#define PARROT_IMCC_API_H_GUARD

#include "parrot/api.h"

/* HEADERIZER BEGIN: compilers/imcc/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
Parrot_Int imcc_compile_file_api(
    Parrot_PMC interp_pmc,
    Parrot_PMC compiler,
    Parrot_String file,
    ARGOUT(Parrot_PMC *pbc))
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pbc);

PARROT_EXPORT
Parrot_Int imcc_get_pasm_compreg_api(
    Parrot_PMC interp_pmc,
    int add_compreg,
    ARGOUT(Parrot_PMC *compiler))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*compiler);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Int imcc_get_pir_compreg_api(
    Parrot_PMC interp_pmc,
    int add_compreg,
    ARGOUT(Parrot_PMC *compiler))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*compiler);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
Parrot_Int imcc_preprocess_file_api(
    Parrot_PMC interp_pmc,
    Parrot_PMC compiler,
    Parrot_String file);

#define ASSERT_ARGS_imcc_compile_file_api __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pbc))
#define ASSERT_ARGS_imcc_get_pasm_compreg_api __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(compiler))
#define ASSERT_ARGS_imcc_get_pir_compreg_api __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(compiler))
#define ASSERT_ARGS_imcc_preprocess_file_api __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/api.c */

#endif /* PARROT_IMCC_API_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
