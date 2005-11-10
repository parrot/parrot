/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/utf16.c - UTF-16 encoding

=head1 DESCRIPTION

UTF-16 encoding with the help of the ICU library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/unicode.h"

#include "utf16.h"

#if PARROT_HAS_ICU
#include <unicode/utf16.h>
#include <unicode/ustring.h>
#endif

#define UNIMPL internal_exception(UNIMPLEMENTED, "unimpl utf16")


static void iter_init(Interp *, String *src, String_iter *iter);
/* This function needs to go through and get all the code points one
   by one and turn them into a utf16 sequence */
static void
to_encoding(Interp *interpreter, STRING *src)
{
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len;
    UChar *p;
#endif
    int src_len;

    if (src->encoding == Parrot_utf16_encoding_ptr)
        return;
    /*
     * TODO adapt string creation functions
     */
    src->charset  = Parrot_unicode_charset_ptr;
    src->encoding = Parrot_utf16_encoding_ptr;
    src_len = src->strlen;
    if (!src_len)
        return;
    /*
       u_strFromUTF8(UChar *dest,
       int32_t destCapacity,
       int32_t *pDestLength,
       const char *src,
       int32_t srcLength,
       UErrorCode *pErrorCode);
     */
#if PARROT_HAS_ICU
    err = U_ZERO_ERROR;
    /* XXX these inplace operations are all shit (sorry) */
    p = mem_sys_allocate(src_len * sizeof(UChar));
    u_strFromUTF8(p, src_len,
            &dest_len, src->strstart, src->bufused, &err);
    if (!U_SUCCESS(err)) {
        /*
         * have to resize - required len in UChars is in dest_len
         */
        p = mem_sys_realloc(p, dest_len * sizeof(UChar));
        u_strFromUTF8(p, dest_len,
                &dest_len, src->strstart, src->bufused, &err);
        assert(U_SUCCESS(err));
    }
    src->bufused = dest_len * sizeof(UChar);
    Parrot_reallocate_string(interpreter, src, src->bufused);
    memcpy(src->strstart, p, src->bufused);
    mem_sys_free(p);
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

static STRING *
copy_to_encoding(Interp *interpreter, STRING *src)
{
    STRING *dest;
#if PARROT_HAS_ICU
    UErrorCode err;
    int dest_len;
#endif
    int src_len;

    if (src->encoding == Parrot_utf16_encoding_ptr)
        return string_copy(interpreter, src);

    /*
     * TODO adapt string creation functions
     */
    dest = new_string_header(interpreter, 0);
    src_len = src->strlen;
    dest->strlen   = src_len;
    dest->charset  = Parrot_unicode_charset_ptr;
    dest->encoding = Parrot_utf16_encoding_ptr;
    if (!src_len) {
        Parrot_allocate_string(interpreter, dest, 0);
        return dest;
    }
#if PARROT_HAS_ICU
    Parrot_allocate_string(interpreter, dest, sizeof(UChar) * src_len);
    err = U_ZERO_ERROR;
    u_strFromUTF8(dest->strstart, src_len,
            &dest_len, src->strstart, src->bufused, &err);
    if (!U_SUCCESS(err)) {
        Parrot_allocate_string(interpreter, dest, sizeof(UChar) * dest_len);
        u_strFromUTF8(dest->strstart, dest_len,
                &dest_len, src->strstart, src->bufused, &err);
        assert(U_SUCCESS(err));
    }
    dest->bufused = dest_len * sizeof(UChar);
    
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif

    return dest;
}

static UINTVAL
get_codepoint(Interp *interpreter, const STRING *src, UINTVAL offset)
{
    UChar *s = (UChar*) src->strstart;
    UINTVAL c, pos;

    pos = 0;
    U16_FWD_N_UNSAFE(s, pos, offset);
    U16_GET_UNSAFE(s, pos, c);
    return c;
}

static void
set_codepoint(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL codepoint)
{
    const void *start;
    void *p;
    UNIMPL;
}

static UINTVAL
get_byte(Interp *interpreter, const STRING *src, UINTVAL offset)
{
    unsigned char *contents = src->strstart;
    if (offset >= src->bufused) {
/*	internal_exception(0,
		"get_byte past the end of the buffer (%i of %i)",
		offset, src->bufused);*/
	return 0;
    }
    return contents[offset];
}

static void
set_byte(Interp *interpreter, const STRING *src,
	UINTVAL offset, UINTVAL byte)
{
    unsigned char *contents;
    if (offset >= src->bufused) {
	internal_exception(0, "set_byte past the end of the buffer");
    }
    contents = src->strstart;
    contents[offset] = byte;
}

static STRING *
get_codepoints(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count)
{
    String_iter iter;
    UINTVAL start;
    STRING *return_string = Parrot_make_COW_reference(interpreter,
	    src);
    return_string->encoding = src->encoding;
    return_string->charset = src->charset;
    iter_init(interpreter, src, &iter);
    iter.set_position(interpreter, &iter, offset);
    start = iter.bytepos;
    return_string->strstart = (char *)return_string->strstart + start ;
    iter.set_position(interpreter, &iter, offset + count);
    return_string->bufused = iter.bytepos - start;
    return_string->strlen = count;
    return_string->hashval = 0;
    return return_string;
}

static STRING *
get_bytes(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count)
{
    STRING *return_string = Parrot_make_COW_reference(interpreter,
	    src);
    return_string->encoding = src->encoding;    /* XXX */
    return_string->charset = src->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}


static STRING *
get_codepoints_inplace(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *dest_string)
{

    UNIMPL;
    return NULL;
}

static STRING *
get_bytes_inplace(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *return_string)
{
    UNIMPL;
    return NULL;
}

static void
set_codepoints(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *new_codepoints)
{
    UNIMPL;
}

static void
set_bytes(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count, STRING *new_bytes)
{
    UNIMPL;
}

/* Unconditionally makes the string be in this encoding, if that's
   valid */
static void
become_encoding(Interp *interpreter, STRING *src)
{
    UNIMPL;
}


static UINTVAL
codepoints(Interp *interpreter, STRING *src)
{
    String_iter iter;
    /*
     * this is used to initially calculate src->strlen,
     * therefore we must scan the whole string
     */
    iter_init(interpreter, src, &iter);
    while (iter.bytepos < src->bufused)
        iter.get_and_advance(interpreter, &iter);
    return iter.charpos;
}

static UINTVAL
bytes(Interp *interpreter, STRING *src)
{
    return src->bufused;
}

#if PARROT_HAS_ICU
static UINTVAL
utf16_decode_and_advance(Interp *interpreter, String_iter *i)
{
    UChar *s = (UChar*) i->str->strstart;
    UINTVAL c, pos;
    pos = i->bytepos / sizeof(UChar);
    /* TODO either make sure that we don't go past end or use SAFE
     *      iter versions
     */
    U16_NEXT_UNSAFE(s, pos, c);
    i->charpos++;
    i->bytepos = pos * sizeof(UChar);
    return c;
}

static void
utf16_encode_and_advance(Interp *interpreter, String_iter *i, UINTVAL c)
{
    UChar *s = (UChar*) i->str->strstart;
    UINTVAL pos;
    pos = i->bytepos / sizeof(UChar);
    U16_APPEND_UNSAFE(s, pos, c);
    i->charpos++;
    i->bytepos = pos * sizeof(UChar);
}

static void
utf16_set_position(Interp *interpreter, String_iter *i, UINTVAL n)
{
    UChar *s = (UChar*) i->str->strstart;
    UINTVAL pos;
    pos = 0;
    U16_FWD_N_UNSAFE(s, pos, n);
    i->charpos = n;
    i->bytepos = pos * sizeof(UChar);
}

#endif
static void
iter_init(Interp *interpreter, String *src, String_iter *iter)
{
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
#if PARROT_HAS_ICU
    iter->get_and_advance = utf16_decode_and_advance;
    iter->set_and_advance = utf16_encode_and_advance;
    iter->set_position =    utf16_set_position;
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

ENCODING *
Parrot_encoding_utf16_init(Interp *interpreter)
{
    ENCODING *return_encoding = Parrot_new_encoding(interpreter);

    static const ENCODING base_encoding = {
	"utf16",
	2, /* Max bytes per codepoint 0 .. 0x10ffff */
	to_encoding,
	copy_to_encoding,
	get_codepoint,
	set_codepoint,
	get_byte,
	set_byte,
	get_codepoints,
	get_codepoints_inplace,
	get_bytes,
	get_bytes_inplace,
	set_codepoints,
	set_bytes,
	become_encoding,
	codepoints,
	bytes,
        iter_init
    };
    memcpy(return_encoding, &base_encoding, sizeof(ENCODING));
    Parrot_register_encoding(interpreter, "utf16", return_encoding);
    return return_encoding;
}

/*

=back

=head1 SEE ALSO

F<encodings/fixed_8.c>,
F<encodings/utf8.c>,
F<src/string.c>,
F<include/parrot/string.h>,
F<docs/string.pod>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
