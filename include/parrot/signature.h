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
INTVAL Parrot_pcc_signature_num_positionals(PARROT_INTERP,
    ARGIN(Parrot_Signature *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pcc_signature_reset(PARROT_INTERP,
    ARGIN(Parrot_Signature *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL Parrot_pcc_signature_exists_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

INTVAL Parrot_pcc_signature_get_integer(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL Parrot_pcc_signature_get_integer_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

FLOATVAL Parrot_pcc_signature_get_number(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

FLOATVAL Parrot_pcc_signature_get_number_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PMC* Parrot_pcc_signature_get_pmc(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PMC * Parrot_pcc_signature_get_pmc_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
STRING* Parrot_pcc_signature_get_string(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
STRING * Parrot_pcc_signature_get_string_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_pcc_signature_push_float(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    FLOATVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_pcc_signature_push_integer(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    INTVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_pcc_signature_push_integer_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key),
    INTVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_pcc_signature_push_number_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key),
    FLOATVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_pcc_signature_push_pmc(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN_NULLOK(PMC *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_pcc_signature_push_pmc_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key),
    ARGIN_NULLOK(PMC *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_pcc_signature_push_string(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN_NULLOK(STRING *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_pcc_signature_push_string_named(PARROT_INTERP,
    ARGIN(Parrot_Signature *self),
    ARGIN(STRING *key),
    ARGIN_NULLOK(STRING *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_pcc_signature_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pcc_signature_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pcc_signature_num_positionals \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_reset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_exists_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_get_integer \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_get_integer_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_get_number \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_get_number_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_get_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_get_pmc_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_get_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_get_string_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_push_float \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_push_integer \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_push_integer_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_push_number_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_push_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_push_pmc_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_Parrot_pcc_signature_push_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pcc_signature_push_string_named \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(key))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/call/signature.c */

#endif
