/* string_funcs.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STRING_FUNCS_H_GUARD
#define PARROT_STRING_FUNCS_H_GUARD

#include "parrot/compiler.h"

#ifdef PARROT_IN_CORE

/* Declarations of accessors */

#define string_from_literal(i, s) Parrot_str_new((i), (s), (sizeof (s)-1))
#define Parrot_unCOW_string(i, s) PObj_COW_TEST((s)) ? \
    Parrot_str_write_COW((i), (s)), (s) : (s)

/* HEADERIZER BEGIN: src/string/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_bitwise_and(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_bitwise_not(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_bitwise_or(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_bitwise_xor(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_boolean(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL Parrot_str_byte_length(PARROT_INTERP, ARGIN_NULLOK(const STRING *s));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_str_change_encoding(PARROT_INTERP,
    ARGMOD_NULLOK(STRING *src),
    INTVAL encoding_nr)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*src);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_chopn(PARROT_INTERP, ARGIN(const STRING *s), INTVAL n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_str_chr(PARROT_INTERP, UINTVAL character)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_compare(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_compose(PARROT_INTERP, ARGIN_NULLOK(const STRING *src))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_concat(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *a),
    ARGIN_NULLOK(const STRING *b))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_str_copy(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
const char * Parrot_str_cstring(PARROT_INTERP, ARGIN(const STRING *str))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING * Parrot_str_downcase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_equal(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_escape(PARROT_INTERP, ARGIN_NULLOK(const STRING *src))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_escape_truncate(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *src),
    UINTVAL limit)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN_NULLOK(const STRING *s),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_find_index(PARROT_INTERP,
    ARGIN(const STRING *src),
    ARGIN(const STRING *search),
    INTVAL start)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN_NULLOK(const STRING *s),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_str_finish(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_format_data(PARROT_INTERP,
    ARGIN(const char *format),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_str_free_cstring(ARGFREE(char *p));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_from_int(PARROT_INTERP, INTVAL i)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_from_num(PARROT_INTERP, FLOATVAL f)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_from_platform_cstring(PARROT_INTERP,
    ARGIN_NULLOK(const char *c))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_str_gc_register(PARROT_INTERP, ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_str_gc_unregister(PARROT_INTERP, ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_indexed(PARROT_INTERP, ARGIN(const STRING *s), INTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_str_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *s),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_HOT
PARROT_PURE_FUNCTION
INTVAL Parrot_str_is_null(PARROT_INTERP, ARGIN_NULLOK(const STRING *s));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING* Parrot_str_join(PARROT_INTERP,
    ARGIN_NULLOK(STRING *j),
    ARGIN(PMC *ar))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_length(PARROT_INTERP, ARGIN_NULLOK(const STRING *s));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_new(PARROT_INTERP,
    ARGIN_NULLOK(const char *buffer),
    const UINTVAL len)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_new_constant(PARROT_INTERP, ARGIN(const char *buffer))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_new_from_buffer(PARROT_INTERP,
    ARGMOD(Buffer *buffer),
    const UINTVAL len)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_new_init(PARROT_INTERP,
    ARGIN_NULLOK(const char *buffer),
    UINTVAL len,
    ARGIN(const STR_VTABLE *encoding),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_new_noinit(PARROT_INTERP, UINTVAL capacity)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_not_equal(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_str_pin(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PARROT_PURE_FUNCTION
const STR_VTABLE * Parrot_str_rep_compatible(PARROT_INTERP,
    ARGIN(const STRING *a),
    ARGIN(const STRING *b))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_repeat(PARROT_INTERP,
    ARGIN(const STRING *s),
    UINTVAL num)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_str_replace(PARROT_INTERP,
    ARGIN(const STRING *src),
    INTVAL offset,
    INTVAL length,
    ARGIN(const STRING *rep))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_reverse(PARROT_INTERP, ARGIN(const STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_str_split(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *delim),
    ARGIN_NULLOK(const STRING *str))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_str_substr(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *src),
    INTVAL offset,
    INTVAL length)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING * Parrot_str_titlecase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
char * Parrot_str_to_cstring(PARROT_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
char * Parrot_str_to_encoded_cstring(PARROT_INTERP,
    ARGIN(const STRING *s),
    ARGIN(const STR_VTABLE *enc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t Parrot_str_to_hashval(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_str_to_int(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
FLOATVAL Parrot_str_to_num(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
char * Parrot_str_to_platform_cstring(PARROT_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_unescape(PARROT_INTERP,
    ARGIN(const char *cstring),
    char delimiter,
    ARGIN_NULLOK(const char *enc_char))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_unescape_string(PARROT_INTERP,
    ARGIN(const STRING *src),
    ARGIN(const STR_VTABLE *encoding),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_str_unpin(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING * Parrot_str_upcase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_clone(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_extract_chars(PARROT_INTERP,
    ARGIN(const char *buffer),
    UINTVAL len,
    INTVAL chars,
    ARGIN(const STR_VTABLE *encoding))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_str_from_int_base(PARROT_INTERP,
    ARGOUT(char *tc),
    HUGEINTVAL num,
    unsigned int base)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING* Parrot_str_from_uint(PARROT_INTERP,
    ARGOUT(char *tc),
    UHUGEINTVAL num,
    unsigned int base,
    int minus)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tc);

INTVAL Parrot_str_iter_index(PARROT_INTERP,
    ARGIN(const STRING *src),
    ARGMOD(String_iter *start),
    ARGOUT(String_iter *end),
    ARGIN(const STRING *search))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*start)
        FUNC_MODIFIES(*end);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_str_iter_substr(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGIN(const String_iter *l),
    ARGIN_NULLOK(const String_iter *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_str_bitwise_and __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_bitwise_not __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_bitwise_or __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_bitwise_xor __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_boolean __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_byte_length __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_str_change_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_chopn __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_chr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_compare __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_compose __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_concat __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_Parrot_str_downcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_equal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_escape __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_escape_truncate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_find_index __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(search))
#define ASSERT_ARGS_Parrot_str_find_not_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_finish __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_format_data __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_Parrot_str_free_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_str_from_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_from_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_from_platform_cstring \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_gc_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_gc_unregister __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_indexed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_is_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_is_null __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_str_join __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ar))
#define ASSERT_ARGS_Parrot_str_length __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_str_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_new_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_str_new_from_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_Parrot_str_new_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_str_new_noinit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_not_equal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_pin __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_rep_compatible __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_Parrot_str_repeat __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_replace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(rep))
#define ASSERT_ARGS_Parrot_str_reverse __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_Parrot_str_split __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_substr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_titlecase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_to_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_to_encoded_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(enc))
#define ASSERT_ARGS_Parrot_str_to_hashval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_to_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_to_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_to_platform_cstring \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_unescape __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cstring))
#define ASSERT_ARGS_Parrot_str_unescape_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_str_unpin __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_str_upcase __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_str_extract_chars __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(buffer) \
    , PARROT_ASSERT_ARG(encoding))
#define ASSERT_ARGS_Parrot_str_from_int_base __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tc))
#define ASSERT_ARGS_Parrot_str_from_uint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(tc))
#define ASSERT_ARGS_Parrot_str_iter_index __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(start) \
    , PARROT_ASSERT_ARG(end) \
    , PARROT_ASSERT_ARG(search))
#define ASSERT_ARGS_Parrot_str_iter_substr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(l))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/api.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_FUNCS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
