/* encoding.h
 *  Copyright (C) 2004-2007, Parrot Foundation.
 *  Overview:
 *     This is the header for the generic encoding functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ENCODING_H_GUARD
#define PARROT_ENCODING_H_GUARD

#include "parrot/parrot.h"

PARROT_DATA STR_VTABLE *Parrot_ascii_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_latin1_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_binary_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_utf8_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_utf16_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_ucs2_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_ucs4_encoding_ptr;

PARROT_DATA STR_VTABLE *Parrot_default_encoding_ptr;
PARROT_DATA STR_VTABLE *Parrot_platform_encoding_ptr;

#ifdef PARROT_IN_CORE
PARROT_DATA STR_VTABLE *Parrot_null_encoding_ptr;
#endif

/* HEADERIZER BEGIN: src/string/encoding.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const STR_VTABLE * Parrot_default_encoding(PARROT_INTERP);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char * Parrot_encoding_c_name(PARROT_INTERP,
    INTVAL number_of_encoding);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_encoding_name(PARROT_INTERP, INTVAL number_of_encoding);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_encoding_number(PARROT_INTERP,
    ARGIN(const STRING *encodingname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_encoding_number_of_str(PARROT_INTERP,
    ARGIN(const STRING *src))
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_encodings_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const STR_VTABLE * Parrot_find_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const STR_VTABLE * Parrot_find_encoding_by_string(PARROT_INTERP,
    ARGIN(STRING *encodingname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const STR_VTABLE* Parrot_get_encoding(PARROT_INTERP,
    INTVAL number_of_encoding);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
const STR_VTABLE * Parrot_load_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_make_default_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname),
    ARGIN(STR_VTABLE *encoding))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STR_VTABLE * Parrot_new_encoding(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_register_encoding(PARROT_INTERP, ARGIN(STR_VTABLE *encoding))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_deinit_encodings(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_str_internal_register_encoding_names(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_default_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_encoding_c_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_encoding_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_encoding_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encodingname))
#define ASSERT_ARGS_Parrot_encoding_number_of_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_Parrot_encodings_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_find_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(encodingname))
#define ASSERT_ARGS_Parrot_find_encoding_by_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encodingname))
#define ASSERT_ARGS_Parrot_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_load_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encodingname))
#define ASSERT_ARGS_Parrot_make_default_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(encodingname_unused) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_new_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_register_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_deinit_encodings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_internal_register_encoding_names \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/encoding.c */

#endif /* PARROT_ENCODING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
