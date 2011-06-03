/*
 * Copyright (C) 2011, Parrot Foundation.
 */

#ifndef PARROT_IMCC_EMBED_H_GUARD
#define PARROT_IMCC_EMBED_H_GUARD

/* Forward Declarations. IMCC will define these things internally.
   libparrot and other embedders and extenders should treat these
   as being opaque */
#ifndef IMCC_IMC_H_HAVE_TYPEDEFS
typedef struct IMC_Unit IMC_Unit;
struct _imc_info_t;
typedef struct _imc_info_t imc_info_t;
#endif

#include "imcc/yyscanner.h"

/* HEADERIZER BEGIN: compilers/imcc/main.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile_file(
    ARGMOD(imc_info_t *imcc),
    ARGIN(STRING *fullname),
    int is_pasm)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

PARROT_EXPORT
INTVAL imcc_last_error_code(ARGIN(imc_info_t *imcc))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING* imcc_last_error_message(ARGIN(imc_info_t *imcc))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
imc_info_t * imcc_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void imcc_preprocess(
    ARGMOD(imc_info_t *imcc),
    ARGIN(STRING * const sourcefile))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

PARROT_EXPORT
void imcc_reset(ARGMOD(imc_info_t *imcc))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*imcc);

PARROT_EXPORT
void imcc_set_debug_mode(
    ARGMOD(imc_info_t *imcc),
    INTVAL dflags,
    INTVAL yflags)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*imcc);

PARROT_EXPORT
void imcc_set_optimization_level(
    ARGMOD(imc_info_t *imcc),
    ARGIN(const char *opts))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

PARROT_EXPORT
void imcc_set_verbosity(ARGMOD(imc_info_t *imcc), INTVAL verbose)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*imcc);

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
imc_info_t * exit_reentrant_compile(
    ARGIN(imc_info_t *imcc),
    ARGMOD_NULLOK(struct _imc_info_t *new_info))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*new_info);

PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile_string(
    ARGMOD(imc_info_t *imcc),
    ARGIN(STRING *source),
    int is_pasm)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc);

void imcc_destroy(ARGFREE(imc_info_t * imcc));
#define ASSERT_ARGS_imcc_compile_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(fullname))
#define ASSERT_ARGS_imcc_last_error_code __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_imcc_last_error_message __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_imcc_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imcc_preprocess __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(sourcefile))
#define ASSERT_ARGS_imcc_reset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_imcc_set_debug_mode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_imcc_set_optimization_level __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(opts))
#define ASSERT_ARGS_imcc_set_verbosity __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_exit_reentrant_compile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_imcc_compile_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_imcc_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/main.c */

#endif /* PARROT_IMCC_EMBED_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
