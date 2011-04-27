/* hll.h
 *  Copyright (C) 2005-2011, Parrot Foundation.
 *  Overview:
 *     This is the API header for the HLL subsystem
 */

#ifndef PARROT_HLL_H_GUARD
#define PARROT_HLL_H_GUARD

/* this invalid HLL type means "no HLL" when passed to the below functions */
#define PARROT_HLL_NONE -1

/* this is guaranteed always to be the internal "parrot" pseudo-HLL */
#define PARROT_HLL_PARROT 0

/* HEADERIZER BEGIN: src/hll.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_hll_get_ctx_HLL_namespace(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_hll_get_ctx_HLL_type(PARROT_INTERP, INTVAL core_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_hll_get_HLL_id(PARROT_INTERP, ARGIN(STRING *hll_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_hll_get_HLL_name(PARROT_INTERP, INTVAL id)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_hll_get_HLL_namespace(PARROT_INTERP, int hll_id)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_hll_get_HLL_type(PARROT_INTERP,
    INTVAL hll_id,
    INTVAL core_type)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_hll_regenerate_HLL_namespaces(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL /*@alt void@*/
Parrot_hll_register_HLL(PARROT_INTERP,
    ARGIN(STRING *hll_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_hll_register_HLL_type(PARROT_INTERP,
    INTVAL hll_id,
    INTVAL core_type,
    INTVAL hll_type)
        __attribute__nonnull__(1);

void Parrot_hll_init_HLL(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_hll_get_ctx_HLL_namespace \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_get_ctx_HLL_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_get_HLL_id __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hll_name))
#define ASSERT_ARGS_Parrot_hll_get_HLL_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_get_HLL_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_get_HLL_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_regenerate_HLL_namespaces \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_register_HLL __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hll_name))
#define ASSERT_ARGS_Parrot_hll_register_HLL_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_hll_init_HLL __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/hll.c */

typedef enum HLL_enum_t {
    e_HLL_name,
    e_HLL_typemap,
    e_HLL_id,
    e_HLL_MAX
} HLL_enum_t;

#endif /* PARROT_HLL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
