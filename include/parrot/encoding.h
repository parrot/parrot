/* encoding.h
 *  Copyright (C) 2004-2007, Parrot Foundation.
 *  SVN Info
 *     $Id$
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

typedef STRING * (*encoding_to_encoding_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef UINTVAL  (*encoding_get_codepoint_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef UINTVAL  (*encoding_get_byte_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset);
typedef void     (*encoding_set_byte_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef STRING * (*encoding_get_codepoints_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef STRING * (*encoding_get_bytes_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef UINTVAL  (*encoding_codepoints_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef UINTVAL  (*encoding_bytes_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef UINTVAL  (*encoding_find_cclass_t)(PARROT_INTERP, ARGIN(const STRING *s), ARGIN(const INTVAL *typetable), INTVAL flags, UINTVAL offset, UINTVAL count);
typedef size_t   (*encoding_hash_t)(PARROT_INTERP, ARGIN(const STRING *s), size_t hashval);

/* iterator support */

struct string_iterator_t;       /* s. parrot/string.h */

typedef void (*encoding_iter_init_t)(PARROT_INTERP, const STRING *src,
        struct string_iterator_t *);

struct _encoding {
    ARGIN(const char *name);
    UINTVAL max_bytes_per_codepoint;
    encoding_to_encoding_t              to_encoding;
    encoding_get_codepoint_t            get_codepoint;
    encoding_get_byte_t                 get_byte;
    encoding_set_byte_t                 set_byte;
    encoding_get_codepoints_t           get_codepoints;
    encoding_get_bytes_t                get_bytes;
    encoding_codepoints_t               codepoints;
    encoding_bytes_t                    bytes;
    encoding_iter_init_t                iter_init;
    encoding_find_cclass_t              find_cclass;
    encoding_hash_t                     hash;
};

typedef struct _encoding ENCODING;

#if !defined PARROT_NO_EXTERN_ENCODING_PTRS
PARROT_DATA ENCODING *Parrot_fixed_8_encoding_ptr;
PARROT_DATA ENCODING *Parrot_utf8_encoding_ptr;
PARROT_DATA ENCODING *Parrot_utf16_encoding_ptr;
PARROT_DATA ENCODING *Parrot_ucs2_encoding_ptr;
PARROT_DATA ENCODING *Parrot_ucs4_encoding_ptr;
PARROT_DATA ENCODING *Parrot_default_encoding_ptr;
#endif

#define PARROT_DEFAULT_ENCODING Parrot_fixed_8_encoding_ptr
#define PARROT_FIXED_8_ENCODING Parrot_fixed_8_encoding_ptr
#define PARROT_DEFAULT_FOR_UNICODE_ENCODING NULL

typedef INTVAL (*encoding_converter_t)(PARROT_INTERP, ENCODING *lhs, ENCODING *rhs);

/* HEADERIZER BEGIN: src/string/encoding.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const ENCODING * Parrot_default_encoding(SHIM_INTERP);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char * Parrot_encoding_c_name(SHIM_INTERP, INTVAL number_of_encoding);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_encoding_name(SHIM_INTERP, INTVAL number_of_encoding);

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
INTVAL Parrot_encoding_number_of_str(SHIM_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const ENCODING * Parrot_find_encoding(SHIM_INTERP,
    ARGIN(const char *encodingname))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
encoding_converter_t Parrot_find_encoding_converter(PARROT_INTERP,
    ARGIN(ENCODING *lhs),
    ARGIN(ENCODING *rhs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const ENCODING* Parrot_get_encoding(SHIM_INTERP, INTVAL number_of_encoding);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
const ENCODING * Parrot_load_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_make_default_encoding(SHIM_INTERP,
    SHIM(const char *encodingname),
    ARGIN(ENCODING *encoding))
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
ENCODING * Parrot_new_encoding(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_register_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname),
    ARGIN(ENCODING *encoding))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void parrot_deinit_encodings(PARROT_INTERP)
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
#define ASSERT_ARGS_Parrot_find_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(encodingname))
#define ASSERT_ARGS_Parrot_find_encoding_converter \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lhs) \
    , PARROT_ASSERT_ARG(rhs))
#define ASSERT_ARGS_Parrot_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_load_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encodingname))
#define ASSERT_ARGS_Parrot_make_default_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_new_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_register_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encodingname) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_parrot_deinit_encodings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_internal_register_encoding_names \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/encoding.c */

#define ENCODING_MAX_BYTES_PER_CODEPOINT(i, src) \
    ((src)->encoding)->max_bytes_per_codepoint
#define ENCODING_GET_CODEPOINT(i, src, offset) \
    ((src)->encoding)->get_codepoint((i), (src), (offset))
#define ENCODING_GET_BYTE(i, src, offset) \
    ((src)->encoding)->get_byte((i), (src), (offset))
#define ENCODING_SET_BYTE(i, src, offset, value) \
    ((src)->encoding)->set_byte((i), (src), (offset), (value))
#define ENCODING_GET_CODEPOINTS(i, src, offset, count) \
    ((src)->encoding)->get_codepoints((i), (src), (offset), (count))
#define ENCODING_GET_BYTES(i, src, offset, count) \
    ((src)->encoding)->get_bytes((i), (src), (offset), (count))
#define ENCODING_CODEPOINTS(i, src) \
    ((src)->encoding)->codepoints((i), (src))
#define ENCODING_BYTES(i, src) \
    ((src)->encoding)->bytes((i), (src))
#define ENCODING_ITER_INIT(i, src, iter) \
    ((src)->encoding)->iter_init((i), (src), (iter))
#define ENCODING_FIND_CCLASS(i, src, typetable, flags, pos, end) \
    ((src)->encoding)->find_cclass((i), (src), (typetable), (flags), (pos), (end))
#define ENCODING_HASH(i, src, seed) \
    ((src)->encoding)->hash((i), (src), (seed))

#endif /* PARROT_ENCODING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
