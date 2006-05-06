/* string_funcs.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_STRING_FUNCS_H_GUARD)
#define PARROT_STRING_FUNCS_H_GUARD

#include "parrot/compiler.h"

#ifdef PARROT_IN_CORE

/* Declarations of accessors */

PARROT_API STRING *Parrot_reuse_COW_reference(Interp *, STRING *, STRING *);
PARROT_API STRING *Parrot_make_COW_reference(Interp *, STRING *);
PARROT_API void Parrot_unmake_COW(Interp *, STRING *);
PARROT_API INTVAL string_compute_strlen(Interp *, STRING *);
PARROT_API INTVAL string_max_bytes(Interp *, STRING*, INTVAL);
PARROT_API STRING *string_concat(Interp *, STRING *, STRING *, UINTVAL);
PARROT_API STRING *string_append(Interp *, STRING *, STRING *, UINTVAL);
PARROT_API STRING *string_repeat(Interp *, const STRING *, UINTVAL,
                      STRING **);
PARROT_API STRING *string_chopn(Interp *, STRING *, INTVAL, int in_place);
PARROT_API STRING *string_substr(Interp *, STRING *, INTVAL,
                      INTVAL, STRING **, int replace_dest);
PARROT_API STRING *string_replace(Interp *, STRING *, INTVAL, INTVAL,
                       STRING *, STRING **);
PARROT_API STRING *string_nprintf(Interp *,
                       STRING *, INTVAL, const char *, ...);
PARROT_API STRING *string_printf(Interp *interpreter,
					  const char *format, ...);
PARROT_API INTVAL string_compare(Interp *, STRING *, STRING *);
PARROT_API INTVAL string_equal(Interp *, STRING *, STRING *);
PARROT_API INTVAL string_bool(Interp *, const STRING *);
PARROT_API STRING *string_increment(Interp *, const STRING *);
PARROT_API const char *Parrot_string_cstring(Interp *, const STRING *);

/* Declarations of other functions */
PARROT_API UINTVAL string_length(Interp *, const STRING *);
PARROT_API INTVAL string_ord(Interp *, const STRING *, INTVAL idx);
PARROT_API STRING *string_chr(Interp *, UINTVAL character);
PARROT_API FLOATVAL string_to_num(Interp *, const STRING *);
PARROT_API INTVAL string_to_int(Interp *, const STRING *);
PARROT_API STRING *string_from_int(Interp *, INTVAL i);
PARROT_API STRING *int_to_str(Interp *,
           char *tc, HUGEINTVAL num, char base);
PARROT_API STRING *string_from_num(Interp *, FLOATVAL f);
PARROT_API STRING *string_grow(Interp *, STRING *s, INTVAL addlen);
PARROT_API const char* string_primary_encoding_for_representation(Interp *,
					parrot_string_representation_t representation);
PARROT_API STRING *string_make(Interp *interpreter, const void *buffer,
            UINTVAL len, const char *charset_name, UINTVAL flags);
PARROT_API STRING *string_make_direct(Interp *interpreter, const void *buffer, UINTVAL len, ENCODING *encoding, CHARSET *charset, UINTVAL flags);
PARROT_API STRING * string_make_empty(Interp *interpreter,
					parrot_string_representation_t representation,
					UINTVAL capacity);
PARROT_API STRING *string_copy(Interp *, STRING *);
PARROT_API STRING *string_set(Interp *, STRING *d, STRING *s);
/* STRING *string_transcode(Interp *, STRING *src,
                         const ENCODING *, const CHARTYPE *,
                         STRING **dest_ptr); */
PARROT_API void string_init(Parrot_Interp);
PARROT_API void string_deinit(Parrot_Interp);
PARROT_API UINTVAL string_capacity(Interp *interpreter, const STRING *s)
            __attribute__nonnull__(2);
PARROT_API void *string_pointer_to_index(Interp *, const STRING *s, UINTVAL idx);
PARROT_API INTVAL string_index(Interp *, const STRING *, UINTVAL idx);
PARROT_API INTVAL string_str_index(Interp *interpreter, const STRING *s,
        const STRING *s2, INTVAL start);
PARROT_API STRING *string_from_cstring(Interp *, const void *, UINTVAL);
PARROT_API STRING *string_from_const_cstring(Interp *, const void *, UINTVAL);
PARROT_API STRING *const_string(Interp *, const char *buffer)
    __attribute__nonnull__(2);
PARROT_API char *string_to_cstring(Interp *, STRING *);
PARROT_API void string_cstring_free(void *);
PARROT_API void string_pin(Interp *, STRING *);
PARROT_API void string_unpin(Interp *, STRING *);
PARROT_API STRING *string_bitwise_and(Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
PARROT_API STRING *string_bitwise_or(Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
PARROT_API STRING *string_bitwise_xor(Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
PARROT_API STRING *string_bitwise_not(Interp *interpreter, STRING *s,
               STRING **dest);
/*void string_iterator_init(struct string_iterator_t *i, const STRING *s);*/
PARROT_API UINTVAL string_decode_and_advance(struct string_iterator_t *i);

PARROT_API size_t string_hash(Interp *interpreter, STRING *s, size_t seed);
PARROT_API STRING * string_unescape_cstring(Interp *,
        const char *cstring, char delimiter, const char *enc_or_charset);
PARROT_API STRING * string_escape_string(Interp *, STRING *);
PARROT_API STRING * string_escape_string_delimited(Interp *, STRING *, UINTVAL len);
PARROT_API STRING * string_compose(Interp *, STRING *);

PARROT_API STRING *string_upcase(Interp *, const STRING *);
PARROT_API STRING *string_downcase(Interp *, const STRING *);
PARROT_API STRING *string_titlecase(Interp *, const STRING *);
PARROT_API void string_upcase_inplace(Interp *, STRING *);
PARROT_API void string_downcase_inplace(Interp *, STRING *);
PARROT_API void string_titlecase_inplace(Interp *, STRING *);

PARROT_API INTVAL Parrot_string_is_cclass(Interp *, PARROT_CCLASS_FLAGS, STRING *, UINTVAL offset);
PARROT_API INTVAL Parrot_string_find_cclass(Interp *, PARROT_CCLASS_FLAGS, STRING *, UINTVAL offset, UINTVAL count);
PARROT_API INTVAL Parrot_string_find_not_cclass(Interp *, PARROT_CCLASS_FLAGS, STRING *, UINTVAL offset, UINTVAL count);
PARROT_API INTVAL Parrot_string_is_whitespace(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_is_digit(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_is_wordchar(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_is_punctuation(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_is_newline(Interp *, STRING *, INTVAL offset);

PARROT_API INTVAL Parrot_string_find_whitespace(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_find_digit(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_find_wordchar(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_find_punctuation(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_find_newline(Interp *, STRING *, INTVAL offset);
PARROT_API INTVAL Parrot_string_find_word_boundary(Interp *, STRING *, INTVAL offset);

PARROT_API STRING* Parrot_string_trans_charset(Interp *, STRING *src,
        INTVAL charset_nr, STRING *dest);
PARROT_API STRING* Parrot_string_trans_encoding(Interp *, STRING *src,
        INTVAL encoding_nr, STRING *dest);

PARROT_API CHARSET* string_rep_compatible (Interp *, STRING *a, const STRING *b,
        ENCODING**);
PARROT_API STRING* string_join(Interp *, STRING *j, PMC *ar);
PARROT_API PMC* string_split(Interp *, STRING *del, STRING *s);

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_FUNCS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
