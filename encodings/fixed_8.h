/* fixed_8.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the 8-bit fixed-width encoding
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ENCODING_FIXED_8_H_GUARD)
#define PARROT_ENCODING_FIXED_8_H_GUARD

static UINTVAL get_codepoint(Interp *interpreter, const STRING *source_string, UINTVAL offset);
static void set_codepoint(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL codepoint);
static UINTVAL get_byte(Interp *interpreter, const STRING *source_string, UINTVAL offset);
static void set_byte(Interp *interpreter, const STRING *source_string, UINTVAL offset, UINTVAL byte);
static STRING *get_codepoints(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
static STRING *get_bytes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
static STRING *get_bytes_inplace(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *dest_string);
static void set_codepoints(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_codepoints);
static void set_bytes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes);
static void become_encoding(Interp *interpreter, STRING *source_string);
static UINTVAL codepoints(Interp *interpreter, STRING *source_string);
static UINTVAL bytes(Interp *interpreter, STRING *source_string);
ENCODING *Parrot_encoding_fixed_8_init(Interp *interpreter);

#endif /* PARROT_ENCODING_FIXED_8_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
