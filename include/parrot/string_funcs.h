/* string_funcs.h
 *  Copyright: (When this is determined...it will go here)
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

/* This part is the external interface.*/

/* Declarations of accessors */

INTVAL Parrot_string_compute_strlen(STRING *);
STRING *Parrot_string_concat(Parrot, const STRING *, const STRING *, UINTVAL);
STRING *Parrot_string_repeat(Parrot, const STRING *, UINTVAL, STRING **);
STRING *Parrot_string_chopn(STRING *, INTVAL);
STRING *Parrot_string_substr(Parrot, const STRING *, INTVAL,
                             INTVAL, STRING **);
STRING *Parrot_string_replace(Parrot, STRING *, INTVAL, INTVAL,
                             const STRING *, STRING **);
INTVAL Parrot_string_compare(Parrot, const STRING *, const STRING *);
Parrot_Bool Parrot_string_bool(const STRING *);
const char *Parrot_string_cstring(const STRING *);

/* Declarations of other functions */
UINTVAL Parrot_string_length(const STRING *);
INTVAL Parrot_string_ord(const STRING *, INTVAL idx);
FLOATVAL Parrot_string_to_num(const STRING *);
INTVAL Parrot_string_to_int(const STRING *);
STRING * Parrot_string_from_int(struct Parrot_Interp *, INTVAL i);
STRING * Parrot_string_grow(struct Parrot_Interp *, STRING * s, INTVAL addlen);
void Parrot_string_destroy(STRING *);
STRING *Parrot_string_make(struct Parrot_Interp *, const void *buffer,
                           UINTVAL buflen, const ENCODING *, UINTVAL flags,
                           const CHARTYPE *);
STRING *Parrot_string_copy(struct Parrot_Interp *, const STRING *);
STRING *Parrot_string_transcode(struct Parrot_Interp *, const STRING *src,
                                const ENCODING *, const CHARTYPE *,
                                STRING **dest_ptr);
void Parrot_string_init(void);
INTVAL Parrot_string_index(const STRING *, UINTVAL idx);
const char *Parrot_string_to_cstring(struct Parrot_Interp *, STRING *);

#ifdef PARROT_IN_CORE

#define string_compute_strlen   Parrot_string_compute_strlen
#define string_concat           Parrot_string_concat
#define string_repeat           Parrot_string_repeat
#define string_chopn            Parrot_string_chopn
#define string_substr           Parrot_string_substr
#define string_replace          Parrot_string_replace
#define string_compare          Parrot_string_compare
#define string_bool             Parrot_string_bool
#define string_cstring          Parrot_string_cstring

#define string_length           Parrot_string_length
#define string_ord              Parrot_string_ord
#define string_to_num           Parrot_string_to_num
#define string_to_int           Parrot_string_to_int
#define string_from_int         Parrot_string_from_int
#define string_grow             Parrot_string_grow
#define string_destroy          Parrot_string_destroy
#define string_make             Parrot_string_make
#define string_copy             Parrot_string_copy
#define string_transcode        Parrot_string_transcode
#define string_init             Parrot_string_init
#define string_index            Parrot_string_index
#define string_to_cstring       Parrot_string_to_cstring

#endif

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
