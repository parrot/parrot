/* string_funcs.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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

#ifdef PARROT_IN_CORE

/* Declarations of accessors */

void Parrot_unmake_COW(Interp *, STRING *);
INTVAL string_compute_strlen(Interp *, STRING *);
INTVAL string_max_bytes(Interp *, STRING*, INTVAL);
STRING *string_concat(Interp *, STRING *, STRING *, UINTVAL);
STRING *string_append(Interp *, STRING *, STRING *, UINTVAL);
STRING *string_repeat(Interp *, const STRING *, UINTVAL,
                      STRING **);
STRING *string_chopn(Interp *, STRING *, INTVAL);
STRING *string_substr(Interp *, STRING *, INTVAL,
                      INTVAL, STRING **, int replace_dest);
STRING *string_replace(Interp *, STRING *, INTVAL, INTVAL,
                       STRING *, STRING **);
STRING *string_nprintf(Interp *,
                       STRING *, INTVAL, const char *, ...);
STRING *string_printf(Interp *interpreter,
					  const char *format, ...);
INTVAL string_compare(Interp *, STRING *, STRING *);
INTVAL string_equal(Interp *, STRING *, STRING *);
INTVAL string_bool(Interp *, const STRING *);
STRING *string_increment(Interp *, const STRING *);
const char *Parrot_string_cstring(const STRING *);

/* Declarations of other functions */
UINTVAL string_length(Interp *, const STRING *);
INTVAL string_ord(Interp *, const STRING *, INTVAL idx);
STRING *string_chr(Interp *, UINTVAL character);
FLOATVAL string_to_num(Interp *, const STRING *);
INTVAL string_to_int(Interp *, const STRING *);
STRING *string_from_int(Interp *, INTVAL i);
STRING *int_to_str(Interp *,
           char *tc, HUGEINTVAL num, char base);
STRING *string_from_num(Interp *, FLOATVAL f);
STRING *string_grow(Interp *, STRING *s, INTVAL addlen);
const char* string_primary_encoding_for_representation(Interp *,
					parrot_string_representation_t representation);
STRING *string_make(Interp *interpreter, const void *buffer,
            UINTVAL len, const char *encoding_name, UINTVAL flags);
STRING * string_make_empty(Interp *interpreter,
					parrot_string_representation_t representation,
					UINTVAL capacity);
STRING *string_copy(Interp *, STRING *);
STRING *string_set(Interp *, STRING *d, STRING *s);
/* STRING *string_transcode(Interp *, STRING *src,
                         const ENCODING *, const CHARTYPE *,
                         STRING **dest_ptr); */
void string_init(Parrot_Interp);
void string_deinit(Parrot_Interp);
UINTVAL string_capacity(Interp *interpreter, STRING *s);
void *string_pointer_to_index(Interp *,
								const STRING *s, UINTVAL idx);
INTVAL string_index(Interp *, const STRING *, UINTVAL idx);
INTVAL string_str_index(Interp *interpreter, const STRING *s,
        const STRING *s2, UINTVAL start);
STRING *string_from_cstring(Interp *, const void *, UINTVAL);
STRING *string_from_const_cstring(Interp *, const void *, UINTVAL);
STRING *const_string(Interp *, const char *);
char *string_to_cstring(Interp *, STRING *);
void string_cstring_free(void *);
void string_pin(Interp *, STRING *);
void string_unpin(Interp *, STRING *);
STRING *string_bitwise_and(Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
STRING *string_bitwise_or(Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
STRING *string_bitwise_xor(Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
STRING *string_bitwise_not(Interp *interpreter, STRING *s,
               STRING **dest);
/*void string_iterator_init(struct string_iterator_t *i, const STRING *s);*/
UINTVAL string_decode_and_advance(struct string_iterator_t *i);

size_t string_hash(Interp *interpreter, STRING *s);
STRING * string_unescape_cstring(Interp *,
        const char *cstring, char delimiter, const char *enc_or_charset);

STRING *string_upcase(Interp *, const STRING *);
STRING *string_downcase(Interp *, const STRING *);
STRING *string_titlecase(Interp *, const STRING *);
void string_upcase_inplace(Interp *, STRING *);
void string_downcase_inplace(Interp *, STRING *);
void string_titlecase_inplace(Interp *, STRING *);

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
