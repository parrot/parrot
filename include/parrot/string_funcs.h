/* string_funcs.h
 *  Copyright (C) 2001-2008, The Perl Foundation.
 *  SVN Info
 *     $Id$
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

#define string_from_literal(i, s) string_from_cstring((i), (s), (sizeof (s)-1))
#define Parrot_unCOW_string(i, s) PObj_COW_TEST((s)) ? \
    Parrot_unmake_COW((i), (s)), (s) : (s)

/* HEADERIZER BEGIN: src/string.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * const_string(PARROT_INTERP, ARGIN(const char *buffer))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_make_COW_reference(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_reuse_COW_reference(SHIM_INTERP,
    ARGMOD(STRING *s),
    ARGOUT(STRING *d))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*s)
        FUNC_MODIFIES(*d);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
const char * Parrot_string_cstring(SHIM_INTERP, ARGIN(const STRING *str))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_string_find_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN_NULLOK(STRING *s),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_string_find_not_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN_NULLOK(STRING *s),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL Parrot_string_is_cclass(PARROT_INTERP,
    INTVAL flags,
    ARGIN(const STRING *s),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_string_split(PARROT_INTERP,
    ARGIN_NULLOK(STRING *delim),
    ARGIN_NULLOK(STRING *str))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_string_trans_charset(PARROT_INTERP,
    ARGMOD_NULLOK(STRING *src),
    INTVAL charset_nr,
    ARGOUT_NULLOK(STRING *dest))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*src)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_string_trans_encoding(PARROT_INTERP,
    ARGIN_NULLOK(STRING *src),
    INTVAL encoding_nr,
    ARGOUT_NULLOK(STRING *dest))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
void Parrot_unmake_COW(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING * string_append(PARROT_INTERP,
    ARGMOD_NULLOK(STRING *a),
    ARGIN_NULLOK(STRING *b))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*a);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_bitwise_and(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2),
    ARGOUT_NULLOK(STRING **dest))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_bitwise_not(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s),
    ARGOUT_NULLOK(STRING **dest))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_bitwise_or(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2),
    ARGOUT_NULLOK(STRING **dest))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_bitwise_xor(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2),
    ARGOUT_NULLOK(STRING **dest))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dest);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_bool(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
UINTVAL string_capacity(SHIM_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_chopn(PARROT_INTERP, ARGMOD(STRING *s), INTVAL n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
void string_chopn_inplace(PARROT_INTERP, ARGMOD(STRING *s), INTVAL n)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * string_chr(PARROT_INTERP, UINTVAL character)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_compare(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING * string_compose(PARROT_INTERP, ARGIN_NULLOK(STRING *src))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL string_compute_strlen(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_concat(PARROT_INTERP,
    ARGIN_NULLOK(STRING *a),
    ARGIN_NULLOK(STRING *b),
    UINTVAL Uflags)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * string_copy(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
void string_cstring_free(ARGIN_NULLOK(char *p));

PARROT_EXPORT
void string_deinit(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING * string_downcase(PARROT_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void string_downcase_inplace(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_equal(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *s1),
    ARGIN_NULLOK(const STRING *s2))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING * string_escape_string(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *src))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING * string_escape_string_delimited(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *src),
    UINTVAL limit)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STRING * string_from_cstring(PARROT_INTERP,
    ARGIN_NULLOK(const char * const buffer),
    const UINTVAL len)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * string_from_int(PARROT_INTERP, INTVAL i)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * string_from_num(PARROT_INTERP, FLOATVAL f)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_grow(PARROT_INTERP, ARGMOD(STRING *s), UINTVAL addlen)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t string_hash(PARROT_INTERP, ARGMOD_NULLOK(STRING *s))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * string_increment(PARROT_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_index(PARROT_INTERP, ARGIN(const STRING *s), UINTVAL idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void string_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING* string_join(PARROT_INTERP, ARGIN_NULLOK(STRING *j), ARGIN(PMC *ar))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL string_length(SHIM_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * string_make(PARROT_INTERP,
    ARGIN_NULLOK(const char *buffer),
    UINTVAL len,
    ARGIN_NULLOK(const char *charset_name),
    UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * string_make_direct(PARROT_INTERP,
    ARGIN_NULLOK(const char *buffer),
    UINTVAL len,
    ARGIN(const ENCODING *encoding),
    ARGIN_NULLOK(const CHARSET *charset),
    UINTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_make_empty(PARROT_INTERP,
    parrot_string_representation_t representation,
    UINTVAL capacity)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_max_bytes(SHIM_INTERP, ARGIN(const STRING *s), UINTVAL nchars)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_ord(PARROT_INTERP, ARGIN_NULLOK(const STRING *s), INTVAL idx)
        __attribute__nonnull__(1);

PARROT_EXPORT
void string_pin(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
const char* string_primary_encoding_for_representation(PARROT_INTERP,
    parrot_string_representation_t representation)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_printf(PARROT_INTERP, ARGIN(const char *format), ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const CHARSET * string_rep_compatible(SHIM_INTERP,
    ARGIN(const STRING *a),
    ARGIN(const STRING *b),
    ARGOUT(const ENCODING **e))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*e);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_repeat(PARROT_INTERP,
    ARGIN(const STRING *s),
    UINTVAL num,
    ARGOUT_NULLOK(STRING **d))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*d);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING * string_replace(PARROT_INTERP,
    ARGIN(STRING *src),
    INTVAL offset,
    INTVAL length,
    ARGIN(STRING *rep),
    ARGOUT_NULLOK(STRING **d))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*d);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_set(PARROT_INTERP,
    ARGIN_NULLOK(STRING *dest),
    ARGMOD(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*src);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* string_split(PARROT_INTERP, ARGIN(STRING *delim), ARGIN(STRING *str))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_str_index(PARROT_INTERP,
    ARGIN(const STRING *s),
    ARGIN(const STRING *s2),
    INTVAL start)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * string_substr(PARROT_INTERP,
    ARGIN_NULLOK(STRING *src),
    INTVAL offset,
    INTVAL length,
    ARGOUT_NULLOK(STRING **d),
    int replace_dest)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*d);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING * string_titlecase(PARROT_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void string_titlecase_inplace(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * string_to_cstring(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CAN_RETURN_NULL
char * string_to_cstring_nullable(SHIM_INTERP,
    ARGIN_NULLOK(const STRING *s));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL string_to_int(SHIM_INTERP, ARGIN_NULLOK(const STRING *s));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
FLOATVAL string_to_num(PARROT_INTERP, ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * string_unescape_cstring(PARROT_INTERP,
    ARGIN(const char *cstring),
    char delimiter,
    ARGIN_NULLOK(const char *enc_char))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void string_unpin(PARROT_INTERP, ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING * string_upcase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_EXPORT
void string_upcase_inplace(PARROT_INTERP, ARGMOD_NULLOK(STRING *s))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*s);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * int_to_str(PARROT_INTERP,
    ARGOUT(char *tc),
    HUGEINTVAL num,
    unsigned int base)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tc);

void string_free(PARROT_INTERP, ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING* uint_to_str(PARROT_INTERP,
    ARGOUT(char *tc),
    UHUGEINTVAL num,
    unsigned int base,
    int minus)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*tc);

#define ASSERT_ARGS_const_string assert(interp); \
                                 assert(buffer);
#define ASSERT_ARGS_Parrot_make_COW_reference assert(interp); \
                                              assert(s);
#define ASSERT_ARGS_Parrot_reuse_COW_reference assert(s); \
                                               assert(d);
#define ASSERT_ARGS_Parrot_string_cstring assert(str);
#define ASSERT_ARGS_Parrot_string_find_cclass assert(interp);
#define ASSERT_ARGS_Parrot_string_find_not_cclass assert(interp);
#define ASSERT_ARGS_Parrot_string_is_cclass assert(interp); \
                                            assert(s);
#define ASSERT_ARGS_Parrot_string_split assert(interp);
#define ASSERT_ARGS_Parrot_string_trans_charset assert(interp);
#define ASSERT_ARGS_Parrot_string_trans_encoding assert(interp);
#define ASSERT_ARGS_Parrot_unmake_COW assert(interp); \
                                      assert(s);
#define ASSERT_ARGS_string_append assert(interp);
#define ASSERT_ARGS_string_bitwise_and assert(interp);
#define ASSERT_ARGS_string_bitwise_not assert(interp);
#define ASSERT_ARGS_string_bitwise_or assert(interp);
#define ASSERT_ARGS_string_bitwise_xor assert(interp);
#define ASSERT_ARGS_string_bool assert(interp);
#define ASSERT_ARGS_string_capacity assert(s);
#define ASSERT_ARGS_string_chopn assert(interp); \
                                 assert(s);
#define ASSERT_ARGS_string_chopn_inplace assert(interp); \
                                         assert(s);
#define ASSERT_ARGS_string_chr assert(interp);
#define ASSERT_ARGS_string_compare assert(interp);
#define ASSERT_ARGS_string_compose assert(interp);
#define ASSERT_ARGS_string_compute_strlen assert(interp); \
                                          assert(s);
#define ASSERT_ARGS_string_concat assert(interp);
#define ASSERT_ARGS_string_copy assert(interp); \
                                assert(s);
#define ASSERT_ARGS_string_cstring_free
#define ASSERT_ARGS_string_deinit assert(interp);
#define ASSERT_ARGS_string_downcase assert(interp); \
                                    assert(s);
#define ASSERT_ARGS_string_downcase_inplace assert(interp); \
                                            assert(s);
#define ASSERT_ARGS_string_equal assert(interp);
#define ASSERT_ARGS_string_escape_string assert(interp);
#define ASSERT_ARGS_string_escape_string_delimited assert(interp);
#define ASSERT_ARGS_string_from_cstring assert(interp);
#define ASSERT_ARGS_string_from_int assert(interp);
#define ASSERT_ARGS_string_from_num assert(interp);
#define ASSERT_ARGS_string_grow assert(interp); \
                                assert(s);
#define ASSERT_ARGS_string_hash assert(interp);
#define ASSERT_ARGS_string_increment assert(interp); \
                                     assert(s);
#define ASSERT_ARGS_string_index assert(interp); \
                                 assert(s);
#define ASSERT_ARGS_string_init assert(interp);
#define ASSERT_ARGS_string_join assert(interp); \
                                assert(ar);
#define ASSERT_ARGS_string_length assert(s);
#define ASSERT_ARGS_string_make assert(interp);
#define ASSERT_ARGS_string_make_direct assert(interp); \
                                       assert(encoding);
#define ASSERT_ARGS_string_make_empty assert(interp);
#define ASSERT_ARGS_string_max_bytes assert(s);
#define ASSERT_ARGS_string_ord assert(interp);
#define ASSERT_ARGS_string_pin assert(interp); \
                               assert(s);
#define ASSERT_ARGS_string_primary_encoding_for_representation assert(interp);
#define ASSERT_ARGS_string_printf assert(interp); \
                                  assert(format);
#define ASSERT_ARGS_string_rep_compatible assert(a); \
                                          assert(b); \
                                          assert(e);
#define ASSERT_ARGS_string_repeat assert(interp); \
                                  assert(s);
#define ASSERT_ARGS_string_replace assert(interp); \
                                   assert(src); \
                                   assert(rep);
#define ASSERT_ARGS_string_set assert(interp); \
                               assert(src);
#define ASSERT_ARGS_string_split assert(interp); \
                                 assert(delim); \
                                 assert(str);
#define ASSERT_ARGS_string_str_index assert(interp); \
                                     assert(s); \
                                     assert(s2);
#define ASSERT_ARGS_string_substr assert(interp);
#define ASSERT_ARGS_string_titlecase assert(interp); \
                                     assert(s);
#define ASSERT_ARGS_string_titlecase_inplace assert(interp); \
                                             assert(s);
#define ASSERT_ARGS_string_to_cstring assert(interp);
#define ASSERT_ARGS_string_to_cstring_nullable
#define ASSERT_ARGS_string_to_int
#define ASSERT_ARGS_string_to_num assert(interp); \
                                  assert(s);
#define ASSERT_ARGS_string_unescape_cstring assert(interp); \
                                            assert(cstring);
#define ASSERT_ARGS_string_unpin assert(interp); \
                                 assert(s);
#define ASSERT_ARGS_string_upcase assert(interp);
#define ASSERT_ARGS_string_upcase_inplace assert(interp);
#define ASSERT_ARGS_int_to_str assert(interp); \
                               assert(tc);
#define ASSERT_ARGS_string_free assert(interp); \
                                assert(s);
#define ASSERT_ARGS_uint_to_str assert(interp); \
                                assert(tc);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_FUNCS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
