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

typedef void (*encoding_to_encoding_t)(Interp* interpreter, STRING *string);
typedef STRING *(*encoding_copy_to_encoding_t)(Interp* interpreter, STRING *string);
typedef UINTVAL (*encoding_get_codepoint_t)(Interp* interpreter, STRING *source_string, UINTVAL offset);
typedef void (*encoding_set_codepoint_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL codepoint);
typedef UINTVAL (*encoding_get_byte_t)(Interp* interpreter, STRING *source_string, UINTVAL offset);
typedef void (*encoding_set_byte_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*encoding_get_codepoints_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef STRING *(*encoding_get_bytes_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
typedef void (*encoding_set_codepoints_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes);
typedef void (*encoding_set_bytes_t)(Interp* interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes);
typedef void (*encoding_become_encoding_t)(Interp* interpreter, STRING *source_string);
typedef UINTVAL (*encoding_codepoints_t)(Interp* interpreter, STRING *source_string);
typedef UINTVAL (*encoding_bytes_t)(Interp* interpreter, STRING *source_string);

struct _encoding {
    encoding_bytes_t encoding_bytes;
};

typedef struct _encoding ENCODING;

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
