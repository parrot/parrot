/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/ucs2.c - UCS-2 encoding

=head1 DESCRIPTION

UCS-2 encoding with the help of the ICU library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/unicode.h"

#include "ucs2.h"

#if PARROT_HAS_ICU
#include <unicode/ustring.h>
#endif

#define UNIMPL internal_exception(UNIMPLEMENTED, "unimpl ucs2")


static void iter_init(Interp *, String *src, String_iter *iter);


static STRING *
to_encoding(Interp *interpreter, STRING *src, STRING *dest)
{
    STRING *result = Parrot_utf16_encoding_ptr->to_encoding(interpreter, src, dest);
    /*
     * conversion to utf16 downgrads to ucs-2 if possible - check result
     */
    if (result->encoding == Parrot_utf16_encoding_ptr) {
        real_exception(interpreter, NULL, E_UnicodeError,
            "can't convert string with surrogates to ucs2");
    }
    return result;
}

static UINTVAL
get_codepoint(Interp *interpreter, const STRING *src, UINTVAL offset)
{
#if PARROT_HAS_ICU
    UChar *s = (UChar*) src->strstart;
    return s[offset];
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
    return 0;
#endif
}

static void
set_codepoint(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL codepoint)
{
#if PARROT_HAS_ICU
    UChar *s = (UChar*) src->strstart;
    s[offset] = codepoint;
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

static UINTVAL
get_byte(Interp *interpreter, const STRING *src, UINTVAL offset)
{
    UNIMPL;
    return 0;
}

static void
set_byte(Interp *interpreter, const STRING *src,
	UINTVAL offset, UINTVAL byte)
{
    UNIMPL;
}

static STRING *
get_codepoints(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count)
{
    STRING *return_string = Parrot_make_COW_reference(interpreter, src);
#if PARROT_HAS_ICU
    return_string->strstart = (char*)src->strstart + offset * sizeof(UChar);
    return_string->bufused = count * sizeof(UChar);
#else
    {
        String_iter iter;
        UINTVAL start;

        iter_init(interpreter, src, &iter);
        iter.set_position(interpreter, &iter, offset);
        start = iter.bytepos;
        return_string->strstart = (char *)return_string->strstart + start;
        iter.set_position(interpreter, &iter, offset + count);
        return_string->bufused = iter.bytepos - start;
    }
#endif
    return_string->strlen = count;
    return_string->hashval = 0;
    return return_string;
}

static STRING *
get_bytes(Interp *interpreter, STRING *src,
	UINTVAL offset, UINTVAL count)
{
    UNIMPL;
    return NULL;
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
#if PARROT_HAS_ICU
    return src->bufused / sizeof(UChar);
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
    return 0;
#endif
}

static UINTVAL
bytes(Interp *interpreter, STRING *src)
{
    return src->bufused;
}

#if PARROT_HAS_ICU
static UINTVAL
ucs2_decode_and_advance(Interp *interpreter, String_iter *i)
{
    UChar *s = (UChar*) i->str->strstart, c;
    size_t pos;
    pos = i->bytepos / sizeof(UChar);
    /* TODO either make sure that we don't go past end or use SAFE
     *      iter versions
     */
    c = s[pos++];
    i->charpos++;
    i->bytepos = pos * sizeof(UChar);
    return c;
}

static void
ucs2_encode_and_advance(Interp *interpreter, String_iter *i, UINTVAL c)
{
    UChar *s = (UChar*) i->str->strstart;
    UINTVAL pos;
    pos = i->bytepos / sizeof(UChar);
    s[pos++] = (UChar)c;
    i->charpos++;
    i->bytepos = pos * sizeof(UChar);
}

static void
ucs2_set_position(Interp *interpreter, String_iter *i, UINTVAL n)
{
    i->charpos = n;
    i->bytepos = n * sizeof(UChar);
}

#endif
static void
iter_init(Interp *interpreter, String *src, String_iter *iter)
{
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
#if PARROT_HAS_ICU
    iter->get_and_advance = ucs2_decode_and_advance;
    iter->set_and_advance = ucs2_encode_and_advance;
    iter->set_position =    ucs2_set_position;
#else
    real_exception(interpreter, NULL, E_LibraryNotLoadedError,
            "no ICU lib loaded");
#endif
}

ENCODING *
Parrot_encoding_ucs2_init(Interp *interpreter)
{
    ENCODING *return_encoding = Parrot_new_encoding(interpreter);

    static const ENCODING base_encoding = {
	"ucs2",
	2, /* Max bytes per codepoint 0 .. 0x10ffff */
	to_encoding,
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
    Parrot_register_encoding(interpreter, "ucs2", return_encoding);
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
