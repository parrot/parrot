/* utf8.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the header for the utf8 variable-width encoding.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ENCODING_UTF8_H_GUARD)
#define PARROT_ENCODING_UTF8_H_GUARD

static void to_encoding(Interp *interpreter, STRING *source_string);
static STRING *copy_to_encoding(Interp *interpreter, STRING *source_string);
static UINTVAL get_codepoint(Interp *interpreter, STRING *source_string, UINTVAL offset);
static void set_codepoint(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL codepoint);
static UINTVAL get_byte(Interp *interpreter, STRING *source_string, UINTVAL offset);
static void set_byte(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL byte);
static STRING *get_codepoints(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
static STRING *get_bytes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count);
static void set_codepoints(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_codepoints);
static void set_bytes(Interp *interpreter, STRING *source_string, UINTVAL offset, UINTVAL count, STRING *new_bytes);
static void become_encoding(Interp *interpreter, STRING *source_string);
static UINTVAL codepoints(Interp *interpreter, STRING *source_string);
static UINTVAL bytes(Interp *interpreter, STRING *source_string);
ENCODING *Parrot_encoding_utf8_init(Interp *interpreter);


#endif /* PARROT_ENCODING_UTF8_H_GUARD */
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
