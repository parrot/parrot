/* encoding.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the generic encoding functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ENCODING_H_GUARD)
#define PARROT_ENCODING_H_GUARD

#include "parrot/parrot.h"

typedef void (*encoding_to_encoding_t)(Interp* interpreter, STRING *string);
typedef STRING *(*encoding_copy_to_encoding_t)(Interp* interpreter, STRING *string);
typedef UINTVAL (*encoding_get_codepoint_t)(Interp* interpreter, const STRING *source_string, UINTVAL offset);
typedef void (*encoding_set_codepoint_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL codepoint);
typedef UINTVAL (*encoding_get_byte_t)(Interp* interpreter, const STRING *source_string, UINTVAL offset);
typedef void (*encoding_set_byte_t)(Interp* interpreter, const STRING *source_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*encoding_get_codepoints_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*encoding_get_bytes_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*encoding_get_codepoints_inplace_t)(Interp* interpreter, STRING *source_string, STRING *dest_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*encoding_get_bytes_inplace_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *dest_string);
typedef void (*encoding_set_codepoints_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes);
typedef void (*encoding_set_bytes_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes);
typedef void (*encoding_become_encoding_t)(Interp* interpreter, STRING *source_string);
typedef UINTVAL (*encoding_codepoints_t)(Interp* interpreter, STRING *source_string);
typedef UINTVAL (*encoding_bytes_t)(Interp* interpreter, STRING *source_string);

struct _encoding {
    const char *name;
    UINTVAL max_bytes_per_codepoint;
    encoding_to_encoding_t to_encoding;
    encoding_copy_to_encoding_t copy_to_encoding;
    encoding_get_codepoint_t get_codepoint;
    encoding_set_codepoint_t  set_codepoint;
    encoding_get_byte_t  get_byte;
    encoding_set_byte_t  set_byte;
    encoding_get_codepoints_t  get_codepoints;
    encoding_get_codepoints_inplace_t  get_codepoints_inplace;
    encoding_get_bytes_t  get_bytes;
    encoding_get_bytes_inplace_t  get_bytes_inplace;
    encoding_set_codepoints_t  set_codepoints;
    encoding_set_bytes_t  set_bytes;
    encoding_become_encoding_t  become_encoding;
    encoding_codepoints_t  codepoints;
    encoding_bytes_t  bytes;
};

typedef struct _encoding ENCODING;

#if !defined PARROT_NO_EXTERN_ENCODING_PTRS
extern ENCODING *Parrot_fixed_8_encoding_ptr;
#endif

#define PARROT_DEFAULT_ENCODING Parrot_fixed_8_encoding_ptr
#define PARROT_FIXED_8_ENCODING Parrot_fixed_8_encoding_ptr
#define PARROT_DEFAULT_FOR_UNICODE_ENCODING NULL

ENCODING *Parrot_new_encoding(Interp* interpreter);
ENCODING *Parrot_load_encoding(Interp* interpreter, const char *encoding_name);
ENCODING *Parrot_find_encoding(Interp *interpreter, const char *encodingname);
INTVAL Parrot_register_encoding(Interp *interpreter, const char *encodingname, ENCODING *encoding);
INTVAL Parrot_make_default_encoding(Interp *interpreter, const char *encodingname, ENCODING *encoding);
ENCODING *Parrot_default_encoding(Interp *interpreter);
typedef INTVAL (*encoding_converter_t)(Interp *interpreter, ENCODING *lhs, ENCODING *rhs);
encoding_converter_t Parrot_find_encoding_converter(Interp *interpreter, ENCODING *lhs, ENCODING *rhs);


#define ENCODING_MAX_BYTES_PER_CODEPOINT(interp, source) ((ENCODING *)source->encoding)->max_bytes_per_codepoint
#define ENCODING_TO_ENCODING(interp, source, offset, count) ((ENCODING *)source->encoding)->to_encoding(interp, source, offset, count)
#define ENCODING_COPY_TO_ENCODING(interp, source) ((ENCODING *)source->encoding)->copy_to_encoding(interp, source)
#define ENCODING_GET_CODEPOINT(interp, source, offset) ((ENCODING *)source->encoding)->get_codepoint(interp, source, offset)
#define ENCODING_SET_CODEPOINT(interp, source, offset, codepoint) ((ENCODING *)source->encoding)->set_codepoint(interp, source, offset, codepoint)
#define ENCODING_GET_BYTE(interp, source, offset) ((ENCODING *)source->encoding)->get_byte(interp, source, offset)
#define ENCODING_SET_BYTE(interp, source, offset, value) ((ENCODING *)source->encoding)->set_byte(interp, source, offset, value)
#define ENCODING_GET_CODEPOINTS(interp, source, offset, count) ((ENCODING *)source->encoding)->get_codepoints(interp, source, offset, count)
#define ENCODING_GET_CODEPOINTS_INPLACE(interp, source, dest, offset, count) ((ENCODING *)source->encoding)->get_codepoints_inplace(interp, source, dest, offset, count)
#define ENCODING_GET_BYTES(interp, source, offset, count) ((ENCODING *)source->encoding)->get_bytes(interp, source, offset, count)
#define ENCODING_GET_BYTES_INPLACE(interp, source, offset, count, dest) ((ENCODING *)source->encoding)->get_bytes_inplace(interp, source, offset, count, dest)
#define ENCODING_SET_CODEPOINTS(interp, source, offset, count, newdata) ((ENCODING *)source->encoding)->set_codepoints(interp, source, offset, count, newdata)
#define ENCODING_SET_BYTES(interp, source, offset, count, newdata) ((ENCODING *)source->encoding)->set_bytes(interp, source, offset, count, newdata)
#define ENCODING_BECOME_ENCODING(interp, source) ((ENCODING *)source->encoding)->become_encoding(interp, source)
#define ENCODING_CODEPOINTS(interp, source) ((ENCODING *)source->encoding)->codepoints(interp, source)
#define ENCODING_BYTES(interp, source) ((ENCODING *)source->encoding)->bytes(interp, source)

#endif /* PARROT_ENCODING_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
