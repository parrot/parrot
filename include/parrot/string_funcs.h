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

Parrot_Int
Parrot_string_compute_strlen(STRING*);
Parrot_String
Parrot_string_concat(Parrot, const Parrot_String, const Parrot_String,
              Parrot_UInt);
Parrot_String
Parrot_string_repeat(Parrot, const Parrot_String, Parrot_UInt,
              Parrot_String *);
Parrot_String
Parrot_string_chopn(Parrot_String, Parrot_Int);
Parrot_String
Parrot_string_substr(Parrot, const Parrot_String, Parrot_Int,
              Parrot_Int, Parrot_String *);
Parrot_Int
Parrot_string_compare(Parrot, const Parrot_String, const Parrot_String);
Parrot_Bool
Parrot_string_bool(const Parrot_String);

/* Declarations of other functions */
Parrot_UInt
Parrot_string_length(const Parrot_String);
Parrot_Int
Parrot_string_ord(const Parrot_String, Parrot_Int idx);
Parrot_Float
Parrot_string_to_num (const Parrot_String);
Parrot_Int
Parrot_string_to_int (const Parrot_String);
void
Parrot_string_destroy(Parrot_String);
Parrot_String
Parrot_string_make(Parrot, const void *buffer, Parrot_UInt buflen, 
                   const Parrot_Encoding, Parrot_UInt flags,
                   const Parrot_CharType);
Parrot_String
Parrot_string_copy(Parrot, const Parrot_String);
Parrot_String
Parrot_string_transcode(Parrot, const Parrot_String src,
                 const Parrot_Encoding, const Parrot_CharType, Parrot_String *dest_ptr);
void
Parrot_string_init(void);
Parrot_Int
Parrot_string_index(const Parrot_String, Parrot_UInt idx);

#ifdef PARROT_IN_CORE

#define string_compute_strlen   Parrot_string_compute_strlen
#define string_concat           Parrot_string_concat
#define string_repeat           Parrot_string_repeat
#define string_chopn            Parrot_string_chopn
#define string_substr           Parrot_string_substr
#define string_compare          Parrot_string_compare
#define string_bool             Parrot_string_bool

#define string_length           Parrot_string_length
#define string_ord              Parrot_string_ord
#define string_to_num           Parrot_string_to_num
#define string_to_int           Parrot_string_to_int
#define string_destroy          Parrot_string_destroy
#define string_make             Parrot_string_make
#define string_copy             Parrot_string_copy
#define string_transcode        Parrot_string_transcode
#define string_init             Parrot_string_init
#define string_index            Parrot_string_index

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
