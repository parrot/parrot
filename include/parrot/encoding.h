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
    const char *name;
    encoding_to_encoding_t to_encoding;
    encoding_copy_to_encoding_t copy_to_encoding;
    encoding_get_codepoint_t get_codepoint;
    encoding_set_codepoint_t  set_codepoint;
    encoding_get_byte_t  get_byte;
    encoding_set_byte_t  set_byte;
    encoding_get_codepoints_t  get_codepoints;
    encoding_get_bytes_t  get_bytes;
    encoding_set_codepoints_t  set_codepoints;
    encoding_set_bytes_t  set_bytes;
    encoding_become_encoding_t  become_encoding;
    encoding_codepoints_t  codepoints;
    encoding_bytes_t  bytes;
};

typedef struct _encoding ENCODING;

ENCODING *Parrot_new_encoding(Interp* interpreter);
ENCODING *Parrot_load_encoding(Interp* interpreter, const char *encoding_name);


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
