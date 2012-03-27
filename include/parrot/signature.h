/* signature.h
 *  Copyright (C) 2012, Parrot Foundation.
 *  Overview:
 *     This is the api header for the PCC Signatures
 *  Data Structure and Algorithms:
 *     PCC Signature incapsulate parameters passing in PCC.
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_SIGNATURE_H_GUARD
#define PARROT_SIGNATURE_H_GUARD

/* Forward declaration of Signature */
typedef struct Parrot_Signature Parrot_Signature;

/* HEADERIZER BEGIN: src/call/signature.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_pcc_signature_free(PARROT_INTERP,
    ARGFREE(Parrot_Signature *self))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Signature* Parrot_pcc_signature_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_pcc_signature_reset(PARROT_INTERP,
    ARGIN(Parrot_Signature *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_pcc_signature_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pcc_signature_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pcc_signature_reset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/signature.c */

#endif
