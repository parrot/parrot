/* nci.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
 *  Overview:
 *     The nci API handles building native call frames
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_NCI_H_GUARD
#define PARROT_NCI_H_GUARD

#include "parrot/parrot.h"

typedef PMC *(*nci_fb_func_t)(PARROT_INTERP, PMC *user_data, PMC *signature);
typedef void (*nci_thunk_t)(PARROT_INTERP, PMC *, PMC *);
typedef void (*native_pcc_method_t)(PARROT_INTERP);

void Parrot_nci_load_core_thunks(PARROT_INTERP);
void Parrot_nci_load_extra_thunks(PARROT_INTERP);

/* HEADERIZER BEGIN: src/nci/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PMC * build_call_func(PARROT_INTERP, ARGIN(PMC *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_build_call_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/nci/api.c */

/* HEADERIZER BEGIN: src/nci/libffi.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_nci_libffi_register(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_nci_libffi_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/nci/libffi.c */

/* HEADERIZER BEGIN: src/nci/signatures.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_EXPORT
PMC * Parrot_nci_parse_signature(PARROT_INTERP, ARGIN(STRING *sig_str))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_nci_describe_sig(PARROT_INTERP, ARGIN(PMC *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_nci_sig_to_pcc(PARROT_INTERP,
    ARGIN(PMC *sig_pmc),
    ARGOUT(STRING **params_sig),
    ARGOUT(STRING **ret_sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*params_sig)
        FUNC_MODIFIES(*ret_sig);

#define ASSERT_ARGS_Parrot_nci_parse_signature __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig_str))
#define ASSERT_ARGS_Parrot_nci_describe_sig __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig))
#define ASSERT_ARGS_Parrot_nci_sig_to_pcc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig_pmc) \
    , PARROT_ASSERT_ARG(params_sig) \
    , PARROT_ASSERT_ARG(ret_sig))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/nci/signatures.c */

#endif /* PARROT_NCI_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
