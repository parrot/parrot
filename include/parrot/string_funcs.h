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

INTVAL string_compute_strlen(struct Parrot_Interp *, STRING *);
INTVAL string_max_bytes(struct Parrot_Interp *, STRING*, INTVAL);
STRING *string_concat(struct Parrot_Interp *, STRING *, STRING *, UINTVAL);
STRING *string_append(struct Parrot_Interp *, STRING *, STRING *, UINTVAL);
STRING *string_repeat(struct Parrot_Interp *, const STRING *, UINTVAL,
                      STRING **);
STRING *string_chopn(struct Parrot_Interp *, STRING *, INTVAL);
STRING *string_substr(struct Parrot_Interp *, STRING *, INTVAL,
                      INTVAL, STRING **, int replace_dest);
STRING *string_replace(struct Parrot_Interp *, STRING *, INTVAL, INTVAL,
                       STRING *, STRING **);
STRING *string_nprintf(struct Parrot_Interp *,
                       STRING *, INTVAL, const char *, ...);
STRING *string_printf(struct Parrot_Interp *interpreter,
					  const char *format, ...);
INTVAL string_compare(struct Parrot_Interp *, STRING *, STRING *);
INTVAL string_equal(struct Parrot_Interp *, STRING *, STRING *);
INTVAL string_bool(struct Parrot_Interp *, const STRING *);
STRING *string_increment(struct Parrot_Interp *, const STRING *);
const char *Parrot_string_cstring(const STRING *);

/* Declarations of other functions */
UINTVAL string_length(struct Parrot_Interp *, const STRING *);
INTVAL string_ord(struct Parrot_Interp *, const STRING *, INTVAL idx);
STRING *string_chr(struct Parrot_Interp *, UINTVAL character);
FLOATVAL string_to_num(struct Parrot_Interp *, const STRING *);
INTVAL string_to_int(struct Parrot_Interp *, const STRING *);
STRING *string_from_int(struct Parrot_Interp *, INTVAL i);
STRING *int_to_str(struct Parrot_Interp *,
           char *tc, HUGEINTVAL num, char base);
STRING *string_from_num(struct Parrot_Interp *, FLOATVAL f);
STRING *string_grow(struct Parrot_Interp *, STRING *s, INTVAL addlen);
const char* string_primary_encoding_for_representation(struct Parrot_Interp *,
					parrot_string_representation_t representation);
STRING *string_make(struct Parrot_Interp *interpreter, const void *buffer,
            UINTVAL len, const char *encoding_name, UINTVAL flags);
STRING * string_make_empty(struct Parrot_Interp *interpreter,
					parrot_string_representation_t representation,
					UINTVAL capacity);
STRING *string_copy(struct Parrot_Interp *, STRING *);
STRING *string_set(struct Parrot_Interp *, STRING *d, STRING *s);
/* STRING *string_transcode(struct Parrot_Interp *, STRING *src,
                         const ENCODING *, const CHARTYPE *,
                         STRING **dest_ptr); */
void string_init(Parrot_Interp);
UINTVAL string_capacity(struct Parrot_Interp *interpreter, STRING *s);
void *string_pointer_to_index(struct Parrot_Interp *,
								const STRING *s, UINTVAL idx);
INTVAL string_index(struct Parrot_Interp *, const STRING *, UINTVAL idx);
INTVAL string_str_index(struct Parrot_Interp *interpreter, const STRING *s,
        const STRING *s2, UINTVAL start);
STRING *string_from_cstring(struct Parrot_Interp *, const void *, UINTVAL);
STRING *const_string(struct Parrot_Interp *, const char *);
char *string_to_cstring(struct Parrot_Interp *, STRING *);
void string_cstring_free(void *);
void string_pin(struct Parrot_Interp *, STRING *);
void string_unpin(struct Parrot_Interp *, STRING *);
STRING *string_bitwise_and(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
STRING *string_bitwise_or(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
STRING *string_bitwise_xor(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest);
STRING *string_bitwise_not(struct Parrot_Interp *interpreter, STRING *s,
               STRING **dest);
/*void string_iterator_init(struct string_iterator_t *i, const STRING *s);*/
UINTVAL string_decode_and_advance(struct string_iterator_t *i);

size_t string_hash(Interp *interpreter, STRING *s);
STRING * string_unescape_cstring(struct Parrot_Interp *,
        const char *cstring, char delimiter, const char *enc_or_charset);

STRING *string_upcase(struct Parrot_Interp *, const STRING *);
STRING *string_downcase(struct Parrot_Interp *, const STRING *);
STRING *string_titlecase(struct Parrot_Interp *, const STRING *);
void string_upcase_inplace(struct Parrot_Interp *, STRING *);
void string_downcase_inplace(struct Parrot_Interp *, STRING *);
void string_titlecase_inplace(struct Parrot_Interp *, STRING *);

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
